Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3F5426B03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 14:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241727AbhJHMk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 08:40:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:6120 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230253AbhJHMkX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 08:40:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226785209"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="diff'?scan'208";a="226785209"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 05:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="diff'?scan'208";a="624724638"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 08 Oct 2021 05:38:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Oct 2021 15:38:21 +0300
Date:   Fri, 8 Oct 2021 15:38:21 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Vara Reddy <varar@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
Message-ID: <YWA7vXp+4QbKWU1S@kuha.fi.intel.com>
References: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com>
 <YV8dEKMhNKKl20j6@ripper>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d5CDzt0vLc4LIaGn"
Content-Disposition: inline
In-Reply-To: <YV8dEKMhNKKl20j6@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--d5CDzt0vLc4LIaGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Oct 07, 2021 at 09:15:12AM -0700, Bjorn Andersson wrote:
> The one thing that I still don't understand though is, if the typec_mux
> is used by the typec controller to inform _the_ mux about the function
> to be used, what's up with the complexity in typec_mux_match()? This is
> what lead me to believe that typec_mux was enabling/disabling individual
> altmodes, rather just flipping the physical switch at the bottom.

Ah, typec_mux_match() is a mess. I'm sorry about that. I think most of
the code in that function is not used by anybody. If I remember
correctly, all that complexity is attempting to solve some
hypothetical corner case(s). Probable a case where we have multiple
muxes per port to deal with.

I think it would probable be best to clean the function to the bare
minimum by keeping only the parts that are actually used today
(attached).

thanks,

-- 
heikki

--d5CDzt0vLc4LIaGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mux.diff"

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index c8340de0ed495..44f168c9bd9bf 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -193,56 +193,15 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
 static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
 			     void *data)
 {
-	const struct typec_altmode_desc *desc = data;
 	struct device *dev;
-	bool match;
-	int nval;
-	u16 *val;
-	int ret;
-	int i;
 
 	/*
-	 * Check has the identifier already been "consumed". If it
-	 * has, no need to do any extra connection identification.
+	 * The connection identifier will be needed with device graph (OF graph).
+	 * Device graph is not supported by this code yet, so bailing out.
 	 */
-	match = !id;
-	if (match)
-		goto find_mux;
-
-	/* Accessory Mode muxes */
-	if (!desc) {
-		match = fwnode_property_present(fwnode, "accessory");
-		if (match)
-			goto find_mux;
-		return NULL;
-	}
-
-	/* Alternate Mode muxes */
-	nval = fwnode_property_count_u16(fwnode, "svid");
-	if (nval <= 0)
-		return NULL;
-
-	val = kcalloc(nval, sizeof(*val), GFP_KERNEL);
-	if (!val)
-		return ERR_PTR(-ENOMEM);
-
-	ret = fwnode_property_read_u16_array(fwnode, "svid", val, nval);
-	if (ret < 0) {
-		kfree(val);
-		return ERR_PTR(ret);
-	}
-
-	for (i = 0; i < nval; i++) {
-		match = val[i] == desc->svid;
-		if (match) {
-			kfree(val);
-			goto find_mux;
-		}
-	}
-	kfree(val);
-	return NULL;
+	if (id)
+		return ERR_PTR(-ENOTSUPP);
 
-find_mux:
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				mux_fwnode_match);
 

--d5CDzt0vLc4LIaGn--
