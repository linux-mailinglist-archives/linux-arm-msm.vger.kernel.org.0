Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6BA45B283
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 04:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238116AbhKXDTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 22:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237505AbhKXDTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 22:19:24 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56F6C061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 19:16:15 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso2030670ota.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 19:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/4CZMcKRdnsZKE9DDAd3orcOGMvFe+sUxaU3u6ZAsoA=;
        b=dkVW+lWko+uzc9PWiVTCDTBv1MV44aohMbxW9CkOFpa5D8BZNWYehRy/ijzHfSz0jk
         8/MDKqPIr/mPAA1z3TT1r8SGtjfyd+UuwhfE46bXyzPN6xKWqH96cRab8yzdPN8nOh6t
         9EclSjlmDGX9TMSwROPjPGGGoR2HdzB0lfAyzRIWPNY15eP/QAxVASrMTh65TJNtWj7c
         LSC25jUP7WLcuOV4aSektZ5aFzf+9CSAdNcWw6N9v08Vk6ejmolTAZd8+thpWVvDybHV
         7I9WBf7fBRkjStjnrzr0fUtMqUZCGHiLq0zd/UlXRUJ94K0BP1I+tptywrhV5din/SZj
         +r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/4CZMcKRdnsZKE9DDAd3orcOGMvFe+sUxaU3u6ZAsoA=;
        b=kJt5ItdMTkf/WSK0QVWXoMMww/JyQQe0k4hg3b5V81wiEytXJc6OiWY30FduN1kke9
         z87QSW5clkJh7Bm1owMOlzj+J3eE8tU119CyKJmFkLNFG94xkkQUo7eP7PNJKuw/2Mol
         OlPYsfqT+zY8f0pAiHdckNdP6sQwmvcePIMwsx+jJmPoJkWXaD4BCWHG+8gpy0UKojTk
         wEQd4fVzPsvvIIV9EZYTw98rLgefzI+6yZEWna51GzLIuOPDnNvant/FcBtXlnplUBNw
         HclbwJOZgJHAS56jRCeXPHZvMJhj9Z82aZtAXTC6Nj+K2chZdMWqwyE0qw+wP8zsur5h
         rqTg==
X-Gm-Message-State: AOAM533v+sPM5ZcMd4j1MOz0pv6DBhKGRNmbL5PbewmDVHafi0/nkdUU
        RKJ+EmnHCPIRCjlwmsuGe3QwKA==
X-Google-Smtp-Source: ABdhPJwkt0YXn3M+6/frHVA/lPBLfgtItikxEzJr9dnN7yIcXRPVmuhtTqigjNkIKhyai4imABkc8Q==
X-Received: by 2002:a05:6830:1447:: with SMTP id w7mr9433054otp.199.1637723775115;
        Tue, 23 Nov 2021 19:16:15 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q22sm2579319ots.62.2021.11.23.19.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 19:16:14 -0800 (PST)
Date:   Tue, 23 Nov 2021 19:17:58 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH 4/4] regulator: qcom_spmi: Add pm8226 regulators
Message-ID: <YZ2u5hHmiNOyuGtr@ripper>
References: <20211123174127.2261-1-dominikkobinski314@gmail.com>
 <20211123181119.2897-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123181119.2897-1-dominikkobinski314@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Nov 10:11 PST 2021, Dominik Kobinski wrote:

> The PM8226 PMIC is very often seen on
> MSM8x26 boards.

The appropriate width of a commit message is 72 chars, so there's no
need to break this line.

> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 39 +++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 41424a3366d0..02bfce981150 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -1895,6 +1895,44 @@ static const struct spmi_regulator_data pm8941_regulators[] = {
>  	{ }
>  };
>  
> +static const struct spmi_regulator_data pm8226_regulators[] = {
> +	{ "s1", 0x1400, "vdd_s1", },
> +	{ "s2", 0x1700, "vdd_s2", },
> +	{ "s3", 0x1a00, "vdd_s3", },
> +	{ "s4", 0x1d00, "vdd_s4", },
> +	{ "s5", 0x2000, "vdd_s5", },
> +	{ "l1", 0x4000, "vdd_l1_l2_l4_l5", },
> +	{ "l2", 0x4100, "vdd_l1_l2_l4_l5", },
> +	{ "l3", 0x4200, "vdd_l3_l24_l26", },
> +	{ "l4", 0x4300, "vdd_l1_l2_l4_l5", },
> +	{ "l5", 0x4400, "vdd_l1_l2_l4_l5", },
> +	{ "l6", 0x4500, "vdd_l6_l7_l8_l9_l27", },
> +	{ "l7", 0x4600, "vdd_l6_l7_l8_l9_l27", },
> +	{ "l8", 0x4700, "vdd_l6_l7_l8_l9_l27", },
> +	{ "l9", 0x4800, "vdd_l6_l7_l8_l9_l27", },
> +	{ "l10", 0x4900, "vdd_l10_l11_l13", },
> +	{ "l11", 0x4a00, "vdd_l10_l11_l13", },
> +	{ "l12", 0x4b00, "vdd_l12_l14", },
> +	{ "l13", 0x4c00, "vdd_l10_l11_l13", },
> +	{ "l14", 0x4d00, "vdd_l12_l14", },
> +	{ "l15", 0x4e00, "vdd_l15_l16_l17_l18", },
> +	{ "l16", 0x4f00, "vdd_l15_l16_l17_l18", },
> +	{ "l17", 0x5000, "vdd_l15_l16_l17_l18", },
> +	{ "l18", 0x5100, "vdd_l15_l16_l17_l18", },
> +	{ "l19", 0x5200, "vdd_l19_l20_l21_l22_l23_l28", },
> +	{ "l20", 0x5300, "vdd_l19_l20_l21_l22_l23_l28", },
> +	{ "l21", 0x5400, "vdd_l19_l20_l21_l22_l23_l28", },
> +	{ "l22", 0x5500, "vdd_l19_l20_l21_l22_l23_l28", },
> +	{ "l23", 0x5600, "vdd_l19_l20_l21_l22_l23_l28", },
> +	{ "l24", 0x5700, "vdd_l3_l24_l26", },
> +	{ "l25", 0x5800, "vdd_l25", },
> +	{ "l26", 0x5900, "vdd_l3_l24_l26", },
> +	{ "l27", 0x5a00, "vdd_l6_l7_l8_l9_l27", },
> +	{ "l28", 0x5b00, "vdd_l19_l20_l21_l22_l23_l28", },
> +	{ "lvs1", 0x8000, "vdd_lvs1", },
> +	{ }
> +};
> +
>  static const struct spmi_regulator_data pm8841_regulators[] = {
>  	{ "s1", 0x1400, "vdd_s1", },
>  	{ "s2", 0x1700, "vdd_s2", NULL, 0x1c08 },
> @@ -2095,6 +2133,7 @@ static const struct spmi_regulator_data pms405_regulators[] = {
>  static const struct of_device_id qcom_spmi_regulator_match[] = {
>  	{ .compatible = "qcom,pm8004-regulators", .data = &pm8004_regulators },
>  	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
> +	{ .compatible = "qcom,pm8226-regulators", .data = &pm8226_regulators },
>  	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
>  	{ .compatible = "qcom,pm8916-regulators", .data = &pm8916_regulators },
>  	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
> -- 
> 2.34.0
> 
