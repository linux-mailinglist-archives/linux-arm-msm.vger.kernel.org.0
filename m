Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30AE3D2DB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhGVTu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhGVTu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:50:56 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41651C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:31:31 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id h9so7980965oih.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Yy3HeS+seOW9oF85ZZ+kBEvNj9s3myL0jaHoXkTBtK4=;
        b=oXWv4ESd66hQUCh9IS64f1fvR6P7ao8qNtJy0VM408nNfaH6tQIpF57tLjAdEjdU6l
         L6fqgHh5RDvyRgEWAOhgK2q8feKD3t4TICkd70HZSUQxRKmOklm2raPOp9pMtF8sEJeK
         u77p+Q3ypT9M2D8mPcPXeMCI4ABhabknEtI04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Yy3HeS+seOW9oF85ZZ+kBEvNj9s3myL0jaHoXkTBtK4=;
        b=qw/xYPA1IHnNc1C9KIDU3CljFwCTH7YUwP1HXIH7VqM18cAxdpAVg66CXmyESrWvp5
         OT4TESt5QUPV9+MWDXIUVIYBuiKDJw/ufZ+LxyzzJLsgvfgL32sLH3F7Pd7m11pSayHO
         odQZHqagnfbUsVPgCRw37BdVrOofW3d+APfTuvstmTjM+bCoB24LDx72hOzxo/+2njVJ
         1GvPiG4huB3/VQd3zu9w68BW0oc+zcb/oLsQnPDMIfAcBWV2a7hSnt8buSA48Y0D0Xwj
         lsuUnBklywbXDrpIzbD8QQjwhnvp9mbKPCJNA4jezCn3GeWpISZaVwlHxHore1v1BNpP
         EDVw==
X-Gm-Message-State: AOAM532elaLAmSxnVvvgFoH495eP1hAp5FNUrK3WwpgJPy9TwHrIO6PY
        Wmif+EQprj743bDdHokXFqj1zPHwHSOV1axzc5Rjig==
X-Google-Smtp-Source: ABdhPJwcHGD5E6pEZE6mSmgFnlXzVe4NS6hzeuQV4yPBN+FApumnKFVvNOOGt+K04hQm4EFeDeud++PB3DdUAAt6jFY=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr7139284oib.166.1626985890302;
 Thu, 22 Jul 2021 13:31:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:31:29 +0000
MIME-Version: 1.0
In-Reply-To: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
References: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:31:29 +0000
Message-ID: <CAE-0n50zCC9m9Wr6WUvM=mfaQ7GXVEjHNC_T2RfN1=9Y1U_qsg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: add logs across DP driver for ease of debugging
To:     dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting maitreye (2021-07-21 16:19:40)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v4:
>  - Changed goto statement and used if else-if

I think drm likes to see all the changelog here to see patch evolution.

>
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..8c98ab7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1036,43 +1036,28 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -               return ret;
>         }
> -
> -       ret = dp_link_process_ds_port_status_change(link);
> -       if (!ret) {
> +       else if (!(ret = dp_link_process_ds_port_status_change(link))) {
>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> -               return ret;
>         }
> -
> -       ret = dp_link_process_link_training_request(link);
> -       if (!ret) {
> +       else if (!(ret = dp_link_process_link_training_request(link))) {
>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> -               return ret;
>         }
> -
> -       ret = dp_link_process_phy_test_pattern_request(link);
> -       if (!ret) {
> +       else if (!(ret = dp_link_process_phy_test_pattern_request(link))) {
>                 dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> -               return ret;
> -       }
> -
> -       ret = dp_link_process_link_status_update(link);
> -       if (!ret) {
> +       }
> +       else if (!(ret = dp_link_process_link_status_update(link))) {

The kernel coding style is to leave the brackets on the same line

	if (condition) {

	} else if (conditon) {

	}

See Documentation/process/coding-style.rst

Also, the if (!(ret = dp_link_...)) style is really hard to read. Maybe
apply this patch before?

----8<----
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1195044a7a3b..408cddd90f0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1027,41 +1027,22 @@ int dp_link_process_request(struct dp_link *dp_link)

 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-		return ret;
-	}
-
-	ret = dp_link_process_ds_port_status_change(link);
-	if (!ret) {
+	} else if (!dp_link_process_ds_port_status_change(link)) {
 		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-		return ret;
-	}
-
-	ret = dp_link_process_link_training_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_link_training_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-		return ret;
-	}
-
-	ret = dp_link_process_phy_test_pattern_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_phy_test_pattern_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-		return ret;
-	}
-
-	ret = dp_link_process_link_status_update(link);
-	if (!ret) {
+	} else if (!dp_link_process_link_status_update(link)) {
 		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
-		return ret;
-	}
-
-	if (dp_link_is_video_pattern_requested(link)) {
-		ret = 0;
-		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
-	}
+	} else {
+		if (dp_link_is_video_pattern_requested(link))
+			dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;

-	if (dp_link_is_audio_pattern_requested(link)) {
-		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
-		return -EINVAL;
+		if (dp_link_is_audio_pattern_requested(link)) {
+			dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
+			ret = -EINVAL;
+		}
 	}

 	return ret;
