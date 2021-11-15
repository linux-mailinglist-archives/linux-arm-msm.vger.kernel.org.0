Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC7C45035D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 12:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhKOL0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 06:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhKOL02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 06:26:28 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1020DC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 03:23:32 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id z200so13597113wmc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f4u4+jt8ypE5xH9p7rgAcXb4lPM3Z6q0r6PSS8fTKHI=;
        b=jP1n/U+yzHcokMi3lhdqzC3if7O6KZkCqx54OxRpYSGay0te96CO0CKrwB0URvPjOR
         2F6t0UufliWZemKMURzFE4OJKr11+QmpYUn2dL8+sVM92o9JUs0vwdUNggg22vOZUNfm
         32JfoJLb+kPKfvsh7QVa8RHqdsiFtUG/23lbjAVe1YRDVQI3JZr/lXePgZyxoDTB15YO
         9tx3yE6/8LpVOZ4Ph+dfvm7gIS0uFXHjNKXJ5pf7RH5g6PgVUugoWIz76W3ot9aKDi/R
         4RRVUg39s4VFCBkYUtN47Zup0KL1sgfMCVZZigFi6JOKlxp5cPPVHF67zzDS5tePZrRq
         wEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f4u4+jt8ypE5xH9p7rgAcXb4lPM3Z6q0r6PSS8fTKHI=;
        b=4yfbqpE312KSjlEHs8lPTE6TK+TehzElUJFDdL5cmJO2V43erTnp3eJ1VLeHnHLbet
         hLVHc1cN1eJGUfsHuLS9qNmUF3M2vHKqVyvsZSFFP+JtMgnWdficWJLZVWBpfIlYLq6U
         D6n8xzcZf6iIiQ82tEYOh+lfywh5+MQscLbfxSwGzMeUFKRKCRt3epuT5pulX6k50Dw/
         JRDPvBJnN3iUVpKpMq/ks9ncarooDNJ3/TKu53gsIdIn9YSKzTxJTRqD51isBkLiXYg0
         NsNhVzwdq0yxoM1op1rC/CXCw4I370p+t8ITcEjT3p4nNZ4DzLdkjgQQk/ybtrG/oT9C
         TDLQ==
X-Gm-Message-State: AOAM532PsWIXlsORSPPmgpU+9J0o1AFYv6umAOVoTkV0uj2A9gTp2/qP
        bWGGNqakJf4CROqxEXn/+MOYJQ==
X-Google-Smtp-Source: ABdhPJydAY2sk1/zCzZMibQHqVqEhwBELyjB7z2vGpTbcl9BNIGws50Duzyyhd3exyGjYR2A6vmRxw==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr7957382wmb.33.1636975410470;
        Mon, 15 Nov 2021 03:23:30 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id h7sm13665207wrt.64.2021.11.15.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 03:23:29 -0800 (PST)
Date:   Mon, 15 Nov 2021 11:23:27 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Courtney Cavin <courtney.cavin@sonymobile.com>
Subject: Re: [RESEND PATCH v2 04/13] backlight: qcom-wled: Fix off-by-one
 maximum with default num_strings
Message-ID: <20211115112327.tklic3fggrv5mzjt@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-5-marijn.suijten@somainline.org>
 <20211112120839.i6g747vewg6bkyk7@maple.lan>
 <20211112123501.pz5e6g7gavlinung@SoMainline.org>
 <20211112214337.r5xrpeyjgdygzc3n@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112214337.r5xrpeyjgdygzc3n@SoMainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 10:43:37PM +0100, Marijn Suijten wrote:
> On 2021-11-12 13:35:03, Marijn Suijten wrote:
> > On 2021-11-12 12:08:39, Daniel Thompson wrote:
> > > On Fri, Nov 12, 2021 at 01:26:57AM +0100, Marijn Suijten wrote:
> > > > When not specifying num-strings in the DT the default is used, but +1 is
> > > > added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> > > > of 3 and 4 respectively, causing out-of-bounds reads and register
> > > > read/writes.  This +1 exists for a deficiency in the DT parsing code,
> > > > and is simply omitted entirely - solving this oob issue - by parsing the
> > > > property separately much like qcom,enabled-strings.
> > > > 
> > > > This also allows more stringent checks on the maximum value when
> > > > qcom,enabled-strings is provided in the DT.  Note that num-strings is
> > > > parsed after enabled-strings to give it final sign-off over the length,
> > > > which DT currently utilizes to get around an incorrect fixed read of
> > > > four elements from that array (has been addressed in a prior patch).
> > > > 
> > > > Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > > ---
> > > >  drivers/video/backlight/qcom-wled.c | 51 +++++++++++------------------
> > > >  1 file changed, 19 insertions(+), 32 deletions(-)
> > > > 
> > > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > > index 977cd75827d7..c5232478a343 100644
> > > > --- a/drivers/video/backlight/qcom-wled.c
> > > > +++ b/drivers/video/backlight/qcom-wled.c
> > > > @@ -1552,6 +1520,25 @@ static int wled_configure(struct wled *wled)
> > > >  		}
> > > >  	}
> > > > 
> > > > +	rc = of_property_read_u32(dev->of_node, "qcom,num-strings", &val);
> > > > +	if (!rc) {
> > > > +		if (val < 1 || val > wled->max_string_count) {
> > > > +			dev_err(dev, "qcom,num-strings must be between 1 and %d\n",
> > > > +				wled->max_string_count);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		if (string_len > 0) {
> > > > +			dev_warn(dev, "qcom,num-strings and qcom,enabled-strings are ambiguous\n");
> > > 
> > > The warning should also be below the error message on the next if statement.
> > 
> > Agreed.
> 
> Thinking about this again while reworking the patches, I initially put
> this above the error to make DT writers aware.  There's no point telling
> them that their values are out of sync (num-strings >
> len(enabled-strings)), when they "shouldn't even" (don't need to) set
> both in the first place.  They might needlessly fix the discrepancy, see
> the driver finally probe (working backlight) and carry on without
> noticing this warning that now appears.
> 
> Sorry for bringing this back up, but I'm curious about your opinion.

With a more helpful warning about how to fix then I think it is OK to
have both the warning and the error.


Daniel.
