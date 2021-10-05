Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9AB4223BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 12:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233989AbhJEKoO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 06:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbhJEKoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 06:44:12 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6E9C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 03:42:20 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s24so15957779wmh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pVmRMn4rUtOm+1OEO0FywEMDowWiLVKHkRDbrijKrwg=;
        b=ZS4YWF0OVkd9jDh40UlLY2uWt9d78SYkfjqGVKzM8G7JktwnA3ZteL30wEy+4PTRQ4
         XemlL5BOCByzoBuNx8gMHUkinaI3VAsxs3agCljtjM2BJ4R7QMgIr2glQ/g0PXhB2nCR
         tsfYgj9lJY3iPWBf/OmK4QTrupPJGVj1MdGUb2lHG5tt3aYvEPIFvmZPqkNkvOHH2EqN
         juUBaWFSztsy/ioPPpV+e4Vr+Iv7Ce5UflDsH3oMJUoTR8y9CjLz6P/xHautUGrUdYNm
         8nDQjmCoHgV7KEXm3LLN3JPxmk+wXRxcZ1j7ig9qgk6ZPKxaQxptiOnOorsFd6RyEciP
         AKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pVmRMn4rUtOm+1OEO0FywEMDowWiLVKHkRDbrijKrwg=;
        b=mpm9dW6PeCLwEf/Dm2GxbcIvHmyZGWbh8SrZOOw11z1g+aJI8s0DCHBS+hVglrB+3S
         Ic/jnKIegHOMVp8OvG4OLfm/FRujxaIRZKExCsD+GeM1RjYPIqp3tMNipKo0Nspg2wab
         kzZ9HRwWKOrcbNC4ST6bbBGw9rCNE4kVwRkqKuuu/YZYggiH+H1kEvitUdpLscIV3+k1
         4OYXSAGoH9K8vfWErIgvGidzSdN7852AfQS4HgAWQzcK/suHr40OptqVzRxEvE1S8kIV
         31Kb7fhbgyPjuvjiu2uYDvEt/PZM0mq6N/PpNv3S2IDowcF12FjBbuZzCjV5K8H5bmDn
         urQQ==
X-Gm-Message-State: AOAM531XOYhSY5tmvNY8XRpS94WPe73+CkMOqBeOmTttTvFlvU24py+p
        aAasstpQX3xvHD71kQdhPre6gQ==
X-Google-Smtp-Source: ABdhPJzk4476G45fhoT/tD2ExwshD2DdotRERLbyFyzc5wY17wFdvvLODEf4w4SPO9mjXk77xKdD6w==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr2588809wmb.140.1633430539291;
        Tue, 05 Oct 2021 03:42:19 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id k18sm699320wrn.81.2021.10.05.03.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 03:42:18 -0700 (PDT)
Date:   Tue, 5 Oct 2021 11:42:16 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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
Message-ID: <20211005104216.7hqqdyqcqekqhg56@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-5-marijn.suijten@somainline.org>
 <20211005091452.4ecqhlhrdxdgvs3c@maple.lan>
 <20211005100350.p56xuq74qsc7vhyp@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005100350.p56xuq74qsc7vhyp@SoMainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 05, 2021 at 12:03:50PM +0200, Marijn Suijten wrote:
> On 2021-10-05 10:14:52, Daniel Thompson wrote:
> > On Mon, Oct 04, 2021 at 09:27:35PM +0200, Marijn Suijten wrote:
> > > The strings passed in DT may possibly cause out-of-bounds register
> > > accesses and should be validated before use.
> > > 
> > > Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> > 
> > The first half of this patch actually fixes patch 1 from this patch set.
> > It would be better to move that code there.
> 
> It only helps guarding against a maximum of 3 leds for WLED3, while
> using string_len instead of an unintentional sizeof(u32) (resulting in
> a fixed size of 4) is a different issue requiring a separate patch to
> fix.
> 
> Would it help to reorder this patch before 1/10, and mention in patch
> 1/10 (then 2/10) that, besides properly using string_len instead of
> hardcoded 4 (which causes wrong reads from DT on top of this), it relies
> on the previous patch to prevent against an array longer than 3 for
> WLED3?

Reordering is OK for me.


Daniel.


> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > ---
> > >  drivers/video/backlight/qcom-wled.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > index 29910e603c42..27e8949c7922 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -1526,6 +1526,12 @@ static int wled_configure(struct wled *wled)
> > >  						     "qcom,enabled-strings",
> > >  						     sizeof(u32));
> > >  	if (string_len > 0) {
> > > +		if (string_len > wled->max_string_count) {
> > > +			dev_err(dev, "Cannot have more than %d strings\n",
> > > +				wled->max_string_count);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > >  		rc = of_property_read_u32_array(dev->of_node,
> > >  						"qcom,enabled-strings",
> > >  						wled->cfg.enabled_strings,
> > > @@ -1537,6 +1543,14 @@ static int wled_configure(struct wled *wled)
> > >  			return -EINVAL;
> > >  		}
> > >  
> > > +		for (i = 0; i < string_len; ++i) {
> > > +			if (wled->cfg.enabled_strings[i] >= wled->max_string_count) {
> > > +				dev_err(dev, "qcom,enabled-strings index %d at %d is out of bounds\n",
> > > +					wled->cfg.enabled_strings[i], i);
> > > +				return -EINVAL;
> > > +			}
> > > +		}
> > > +
> > >  		cfg->num_strings = string_len;
> > >  	}
> > >  
> > > -- 
> > > 2.33.0
> > > 
