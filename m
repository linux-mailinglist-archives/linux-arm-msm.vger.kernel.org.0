Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3833422A18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 16:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbhJEOIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 10:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236088AbhJEOIN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 10:08:13 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A99C08EC34
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 07:03:53 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t2so13997772wrb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UOP5lMM4CI08qP9awa2DkZ8S17LVd+LJIKmBh/A8w+Q=;
        b=AumBtP+VYn0dbKtbwXKw0iaSZEgRAE9kZQwJQ/YOZLPIBRC7P4Za0KB9XBEEOcw9XT
         CFrLV4q+pEFAYRPDNoot5viX6oCbr+AwsQNvuWlqYGTthOg39+5IL0aX436vMMCf4qKS
         0quMuq4Bcc0yIy3Wv1/aeMRkSSlnhd34iBRW2moqJj8pKGYLb/6MV3sZek9Fiv+JUOLO
         WLsfG2f6VAF5WN3SKsdEvddpRJAkVfkxvtQFErFFyOM66f7NyxCxNc84Htj8yVbwngdd
         3Jxi5qZF4idMSsI4fjI0ifB34YgX59XdaCt7ONo52wj0WhvDINnF1HAKd4Q+BxleqTQx
         8jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UOP5lMM4CI08qP9awa2DkZ8S17LVd+LJIKmBh/A8w+Q=;
        b=hMtzegqzr6D4emvEJMy/HZEUrzQwHK6O29kzjwt2iTLQeSd3NGkSkcieLa2FSC/RR5
         XNATFdxi6nEUUgnSKgwVr2+42QG+Is/zRYNz6XxcD+BsdDl8DXtvEfRbQq8mZaQGNQcS
         0euXsfD+2nLR+AQDbQ6Wi8KC4gtONDarGOKnkVm9BYqxp7csYOMaq4lfUuJu7I+UVHmE
         s8Wwr2lf6BS+6kgYGlg5mPRra+JDm0E7ua36lJgIQ3T7kMJuEbr+zOmRSxElOOaS0rN4
         2v5OWYO/9cV2nsjPVT8sbM/dZml+zeWTIH1dWq2U7VxghVZdjw+xGUHII3xYJKC2bhJ6
         s3zg==
X-Gm-Message-State: AOAM530Xvietp9xtrOtlCK9da3NvFDkTkwbM/0Cw00i/7qplMOQpIIVI
        FJSnLIY5B8t1OcZLurbqAq88Og==
X-Google-Smtp-Source: ABdhPJxSNuoi2/ILT5FfLSCFrAP0gNEnLVjb+ucoMeUutrRDVOxDXZdRnmzyWHw+AQXKkwO3VsEQcg==
X-Received: by 2002:a05:6000:1561:: with SMTP id 1mr21512974wrz.369.1633442631937;
        Tue, 05 Oct 2021 07:03:51 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id v23sm1980215wmj.4.2021.10.05.07.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:03:51 -0700 (PDT)
Date:   Tue, 5 Oct 2021 15:03:49 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211005140349.kefi26yev3gy3zhv@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-6-marijn.suijten@somainline.org>
 <20211005091947.7msztp5l554c7cy4@maple.lan>
 <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
 <20211005103843.heufyonycnudxnzd@maple.lan>
 <20211005105312.kqiyzoqtzzjxayhg@maple.lan>
 <20211005114435.phyq2jsbdyroa6kn@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005114435.phyq2jsbdyroa6kn@SoMainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 05, 2021 at 01:44:35PM +0200, Marijn Suijten wrote:
> On 2021-10-05 11:53:12, Daniel Thompson wrote:
> > On Tue, Oct 05, 2021 at 11:38:43AM +0100, Daniel Thompson wrote:
> > > On Tue, Oct 05, 2021 at 12:06:06PM +0200, Marijn Suijten wrote:
> > > > On 2021-10-05 10:19:47, Daniel Thompson wrote:
> > > > > On Mon, Oct 04, 2021 at 09:27:36PM +0200, Marijn Suijten wrote:
> > > > > > When not specifying num-strings in the DT the default is used, but +1 is
> > > > > > added to it which turns wled3 into 4 and wled4/5 into 5 strings instead
> > > > > > of 3 and 4 respectively, causing out of bounds reads and register
> > > > > > read/writes.  This +1 exists for a deficiency in the DT parsing code,
> > > > > > and is simply omitted entirely - solving this oob issue - by allowing
> > > > > > one extra iteration of the wled_var_cfg function parsing this particular
> > > > > > property.
> > > > > > 
> > > > > > Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> > > > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > > > > ---
> > > > > >  drivers/video/backlight/qcom-wled.c | 8 +++-----
> > > > > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > > > > index 27e8949c7922..66ce77ee3099 100644
> > > > > > --- a/drivers/video/backlight/qcom-wled.c
> > > > > > +++ b/drivers/video/backlight/qcom-wled.c
> > > > > > @@ -1255,17 +1255,17 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
> > > > > >  
> > > > > >  static u32 wled3_num_strings_values_fn(u32 idx)
> > > > > >  {
> > > > > > -	return idx + 1;
> > > > > > +	return idx;
> > > > > >  }
> > > > > >  
> > > > > >  static const struct wled_var_cfg wled3_num_strings_cfg = {
> > > > > >  	.fn = wled3_num_strings_values_fn,
> > > > > > -	.size = 3,
> > > > > > +	.size = 4, /* [0, 3] */
> > > > > 
> > > > > 0 is not a valid value for this property.
> > > > 
> > > > These comments represent the possible loop iterations the DT "cfg
> > > > parser" runs through, starting at j=0 and running up until and including
> > > > j=3.  Should I make that more clear or omit these comments entirely?
> > > 
> > > The role of wled3_num_strings_values_fn() is to enumerate the list of
> > > legal values for the property [ 1, 2, 3 ]. Your changes cause the
> > > enumeration to include a non-legal value so that you can have an
> > > identity mapping between the symbol and the enumerate value.
> > > 
> > > An alternative approach would be to leave the enumeration logic
> > > alone but set the num_string default to UINT_MAX in all cases:
> > > 
> > > -	cfg->num_strings = cfg->num_strings + 1;
> > > +	if (cfg->num_strings == UINT_MAX)
> > > +		cfg->num_strings = 
> > 
> > Oops... looks like I missed the cfg->max_string_count here.
> > 
> > 
> > > +	else
> > > +               /* Convert from enumerated to numeric form */
> > > +		cfg->num_strings = wled3_num_strings_values_fn(
> > > +						cfg->num_strings);
> > 
> > 
> > PS the alternative option is not to treat num-strings as an enumerated
> >    value at all and just read it directly without using wled_values()...
> 
> I much prefer doing that instead of trying to wrangle enumeration
> parsing around integer values that are supposed to be used as-is.  After
> all this variable is already named to set the `+ 1` override currently,
> and `qcom,enabled_strings` has "custom" handling as well.  I'll extend
> the validation to ensure num_strings>=1 too.

Great.


> In addition, and this needs some investigation on the dt-bindings side
> too, it might be beneficial to make both properties mutually exclusive.
> When specifying qcom,enabled_strings it makes little sense to also
> provide qcom,num_strings and we want the former to take precedence.

If we are designing a "fix" for that then my view is that if both are
passed then num-strings should take precedence because it is an
explicit statement about the number of strings where enabled_strings
is implicit. In other words, if num-strings <= len(enabled_strings) then
we should do what we are told, otherwise report error.


> At that point one might ask why qcom,num_strings remains at all when
> DT can use qcom,enabled_strings instead.  We will supposedly have to
> keep backwards compatibility with DTs in mind so none of this can be
> removed or made mutually exclusive from a driver standpoint, that all
> has to be done in dt-bindings yaml to be enforced on checked-in DTs.

So... perhaps I made a make offering a Reviewed-by: to a patch
that allows len(enabled-strings) to have precedence. If anything
currently uses enabled-strings then it *will* be 4 cells long and
is relying on num-strings to ensure the right things happens ;-) .

We'd like that case to keep working so we must allow num-strings to have
precedence. In other words, when you add the new code, please put it at
the end of the function!


Daniel.


> 
> - Marijn
