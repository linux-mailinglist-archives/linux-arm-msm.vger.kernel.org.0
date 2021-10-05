Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E22422307
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 12:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhJEKFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 06:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbhJEKFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 06:05:47 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB45C061745;
        Tue,  5 Oct 2021 03:03:56 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 02B013F585;
        Tue,  5 Oct 2021 12:03:51 +0200 (CEST)
Date:   Tue, 5 Oct 2021 12:03:50 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] backlight: qcom-wled: Validate enabled string
 indices in DT
Message-ID: <20211005100350.p56xuq74qsc7vhyp@SoMainline.org>
Mail-Followup-To: Daniel Thompson <daniel.thompson@linaro.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-5-marijn.suijten@somainline.org>
 <20211005091452.4ecqhlhrdxdgvs3c@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005091452.4ecqhlhrdxdgvs3c@maple.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-05 10:14:52, Daniel Thompson wrote:
> On Mon, Oct 04, 2021 at 09:27:35PM +0200, Marijn Suijten wrote:
> > The strings passed in DT may possibly cause out-of-bounds register
> > accesses and should be validated before use.
> > 
> > Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> 
> The first half of this patch actually fixes patch 1 from this patch set.
> It would be better to move that code there.

It only helps guarding against a maximum of 3 leds for WLED3, while
using string_len instead of an unintentional sizeof(u32) (resulting in
a fixed size of 4) is a different issue requiring a separate patch to
fix.

Would it help to reorder this patch before 1/10, and mention in patch
1/10 (then 2/10) that, besides properly using string_len instead of
hardcoded 4 (which causes wrong reads from DT on top of this), it relies
on the previous patch to prevent against an array longer than 3 for
WLED3?

- Marijn

> Daniel.
> 
> 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > ---
> >  drivers/video/backlight/qcom-wled.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index 29910e603c42..27e8949c7922 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -1526,6 +1526,12 @@ static int wled_configure(struct wled *wled)
> >  						     "qcom,enabled-strings",
> >  						     sizeof(u32));
> >  	if (string_len > 0) {
> > +		if (string_len > wled->max_string_count) {
> > +			dev_err(dev, "Cannot have more than %d strings\n",
> > +				wled->max_string_count);
> > +			return -EINVAL;
> > +		}
> > +
> >  		rc = of_property_read_u32_array(dev->of_node,
> >  						"qcom,enabled-strings",
> >  						wled->cfg.enabled_strings,
> > @@ -1537,6 +1543,14 @@ static int wled_configure(struct wled *wled)
> >  			return -EINVAL;
> >  		}
> >  
> > +		for (i = 0; i < string_len; ++i) {
> > +			if (wled->cfg.enabled_strings[i] >= wled->max_string_count) {
> > +				dev_err(dev, "qcom,enabled-strings index %d at %d is out of bounds\n",
> > +					wled->cfg.enabled_strings[i], i);
> > +				return -EINVAL;
> > +			}
> > +		}
> > +
> >  		cfg->num_strings = string_len;
> >  	}
> >  
> > -- 
> > 2.33.0
> > 
