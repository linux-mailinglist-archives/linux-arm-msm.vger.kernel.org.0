Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5338C103195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 03:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfKTCb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 21:31:59 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43362 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfKTCb7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 21:31:59 -0500
Received: by mail-pj1-f68.google.com with SMTP id a10so3491099pju.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 18:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zQQ14kvSunH3qSKyw22D8nEYxTv+dx8y8WFEQ+ihPdg=;
        b=RiVZiAc8aD5Xr9TbDx+kUjWZpRMwP/JWqFpdvELJwVTQGhlDjUYxk1dDvhOEANTBJh
         r332TDbC+W8hBRuWmoqmlRLoxczReZzlD/d0LI3hqji6UegQlchBkwekp5U60vqohudB
         kzpj3tR8HTzB9JgjWLBIPXqS36ukdsI5e+6rCndr9sFp1OX6hzyBWEHfPruj+6qO2lp6
         1RIkuPR1cFBkSp98pQyUDniE4FtdZfwlKU1uy1yhvEnuMczTfIlYZdfhbZxj/HhMc16M
         pmH+5cVyNZ1+9uHIrMPxQBdoZqEA19zOaeSvQMlM+G2NODVpncOBaJPBFKvwa1YhXfAQ
         I6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zQQ14kvSunH3qSKyw22D8nEYxTv+dx8y8WFEQ+ihPdg=;
        b=Pt3uVaDmnCJgWGjsoWQSln3ZokXAML5jHyFwMHclIUVDNguXr1IP8CE6eP+tFYIEAn
         IwgCELKoBwGFeLWwc1+3nCA/pDs72sdMw4Nl7MA7NMK5YB+qQrAhyBgIv9xCNXqTEkJf
         iQiVIzfVMF9XGh6eKALliNUgEfT51pbr/vUvzHhbhKh8+Q8tu1WWMst92NyynELaGK3U
         /OPxRLn7LEzTJijeVdxKkTpFNddg6/qkXVgRg8dpKqHnoYbak0lyh8fzYX8zHKoBUB/e
         Rgs8qJ+0wO/LsxvtvTcwmoGTcqOWYyOfw4P/cJPdtt6VONTMWqW1vl0uPed8d6+TdyE4
         G4aQ==
X-Gm-Message-State: APjAAAWDVtJ7oqBISAcz7WTaJDtp6RffEUz3ovJIWnkcF0d0YIOpIcBY
        CvoGFju6cagLf3hRayoufvuRoQ==
X-Google-Smtp-Source: APXvYqyqU7IKNWZwMx/vtmP3W3w1KoQMHOCMpSVNlsHnz76K3zwK6DbOhT7AQ/Mt484GpUFb1VenVg==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr474689pla.8.1574217118372;
        Tue, 19 Nov 2019 18:31:58 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x190sm28654798pfc.89.2019.11.19.18.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:31:57 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:31:55 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 4/6] dt-bindings: power: Add rpmh power-domain bindings
 for sc7180
Message-ID: <20191120023155.GM18024@yoga>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99ca6c-a46ce88b-3c42-4222-8873-6cf0843b106f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f99ca6c-a46ce88b-3c42-4222-8873-6cf0843b106f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:

> Add RPMH power-domain bindings for the SC7180 family of SoCs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.txt |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> index f3bbaa4aef297..6346d00b1b400 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -9,6 +9,7 @@ Required Properties:
>  	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
>  	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
>  	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
> +	* qcom,sc7180-rpmhpd: RPMh Power domain for the sc7180 family of SoC
>  	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
>  	* qcom,sm8150-rpmhpd: RPMh Power domain for the sm8150 family of SoC
>   - #power-domain-cells: number of cells in Power domain specifier
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 7d43bafc0026b..3f74096d5a7ca 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -28,6 +28,16 @@
>  #define SM8150_MMCX	9
>  #define SM8150_MMCX_AO	10
>  
> +/* SC7180 Power Domain Indexes */
> +#define SC7180_CX	0
> +#define SC7180_CX_AO	1
> +#define SC7180_GFX	2
> +#define SC7180_MX	3
> +#define SC7180_MX_AO	4
> +#define SC7180_LMX	5
> +#define SC7180_LCX	6
> +#define SC7180_MSS	7
> +
>  /* SDM845 Power Domain performance levels */
>  #define RPMH_REGULATOR_LEVEL_RETENTION	16
>  #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
