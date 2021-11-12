Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62DC44E61B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 13:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234776AbhKLMLe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 07:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhKLMLe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 07:11:34 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52815C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 04:08:43 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id i5so15159674wrb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=otZ0McVJ5SiYRqP7yOEzIbw/1AxWwGOspMcAdakaeds=;
        b=LQvnnW/sBfmRpWNRpou+Po67N6Z73lHiWzAUWeL56rM8KZQ3wcMuaQRgL4/GQOgHAr
         NR1N8PTQ7wPb9IWjzJE/t1++yyiwBNJyVLj/9x1KLhsENhmeUAOwV23X9xgrxu9dlZlK
         seKCNreAhLBnz43Fg9g9UkKZpJNfC9Ft9GORMdYh4HJwBa0vHgHlHtAlp4EhcTk/OdNy
         wRWINay5dRtLg7UIlQbAA7oPswjbqMCoX1c9wJB1r0beZvHgeuw/9uWDWc9AgbQOUVuV
         ksKKfkkdm5ZXqiFm2hH26ZX6Uf503hnuuVwow3sJy2yfebYMkBaHDCTwrwEvvfjVLwkv
         qmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=otZ0McVJ5SiYRqP7yOEzIbw/1AxWwGOspMcAdakaeds=;
        b=IzNbReaB8O0xRKbLtod4kUxw+QC2J611uCPvrUqdznj4d5suVAYq8P6WNe9pZuRLyO
         GHyl0cKl/gVOIfGww0lolcpUET4LGzikEh+qtpr3OT11cGvBenAs6tiAb6QtyLcnUa8W
         00HfP4oRQyrugyQlULF77DFiarOqwZeef1wwAgWiJgy1Lof2qmRrsQiUheMv6Zfsjsv4
         kfbwE3fET3c7R5Jjg06kATlPRtp7aoKEYTrQAtD2WcCeIhJIZsdYbtR9oMAD4knbyg5n
         N9MgRj26F0iLgqg51PKsEIQMMQibhpoupvDuJTjFnKe9AKLxeArwstagnL3KwVXWwc44
         IOxg==
X-Gm-Message-State: AOAM531bAL3EO9HDNC6tcV2kqaAmaymlVEs+HWSLh/xo+j/8f3EdFG3O
        pUDt+efm3UXMCV8dLD4OSc5PQw==
X-Google-Smtp-Source: ABdhPJxBlMEeY7j5TABoz1gcsiHhfYOgh3JsBIzuuI4vMpGemDgBxW2s1QNyVKfFDMXNmN/UEcWvGA==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr17741380wrz.401.1636718921903;
        Fri, 12 Nov 2021 04:08:41 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id 126sm11086997wmz.28.2021.11.12.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:08:41 -0800 (PST)
Date:   Fri, 12 Nov 2021 12:08:39 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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
Message-ID: <20211112120839.i6g747vewg6bkyk7@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112002706.453289-5-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 12, 2021 at 01:26:57AM +0100, Marijn Suijten wrote:
> When not specifying num-strings in the DT the default is used, but +1 is
> added to it which turns WLED3 into 4 and WLED4/5 into 5 strings instead
> of 3 and 4 respectively, causing out-of-bounds reads and register
> read/writes.  This +1 exists for a deficiency in the DT parsing code,
> and is simply omitted entirely - solving this oob issue - by parsing the
> property separately much like qcom,enabled-strings.
> 
> This also allows more stringent checks on the maximum value when
> qcom,enabled-strings is provided in the DT.  Note that num-strings is
> parsed after enabled-strings to give it final sign-off over the length,
> which DT currently utilizes to get around an incorrect fixed read of
> four elements from that array (has been addressed in a prior patch).
> 
> Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 51 +++++++++++------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 977cd75827d7..c5232478a343 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1552,6 +1520,25 @@ static int wled_configure(struct wled *wled)
>  		}
>  	}
> 
> +	rc = of_property_read_u32(dev->of_node, "qcom,num-strings", &val);
> +	if (!rc) {
> +		if (val < 1 || val > wled->max_string_count) {
> +			dev_err(dev, "qcom,num-strings must be between 1 and %d\n",
> +				wled->max_string_count);
> +			return -EINVAL;
> +		}
> +
> +		if (string_len > 0) {
> +			dev_warn(dev, "qcom,num-strings and qcom,enabled-strings are ambiguous\n");

This warning occurs even when there is no ambiguity.

This could be:

	if (string_len > 0 && val != string_len)

The warning should also be below the error message on the next if statement.
Combined these changes allows us to give a much more helpful and assertive
warning message:

qcom,num-strings mis-matches and will partially override
qcom,enabled-strings (remove qcom,num-strings?)


> +			if (val > string_len) {
> +				dev_err(dev, "qcom,num-strings exceeds qcom,enabled-strings\n");
> +				return -EINVAL;
> +			}
> +		}


Daniel.
