Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BF5405906
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 16:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244134AbhIIOaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 10:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344821AbhIIOaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 10:30:00 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4353FC00F61C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 06:19:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f18so3643688lfk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zjCm2kqLmEkD1fYMpLfynjls4LWjCF1R/HM+9Gqf848=;
        b=OE15DtuTMThkONQn2QaW9vAJKJ4c5pWnECM8dh6t2F5lxkzOQeepKE0K4HmtgqZgjV
         MRkwgGmGmxUriL00OMiESoz55OF7Kg50LWHvTG1px0UFyDmtKcbVmx4Uoah1/qoJWO2i
         5p3ySfY5SwOR9I8JDePdifMsBy7MlP3+CHy2wNlJBPmtx9ai9DWrRxh430t8NpR+qkbV
         yJOIbzETKc40EIGF15R4XdOy/OgEfFhXtuJ/0bmufBPBzcG62lorQlBtuzSLqOVhO/bC
         loAS8P5S/d02dnIN04YJ10gffnzt8rv9c7Ey+vvL5DYUHVSyEqPETkva74sSJ0Pjk1j1
         /7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zjCm2kqLmEkD1fYMpLfynjls4LWjCF1R/HM+9Gqf848=;
        b=0N+6t8anpzNASp4zf8870zE6yLRCiKeAkdrRTtqpo2AunF+KN52GHoWMBsC6ZRR7A0
         ZaZ3de1FaXyX7TiV0IPLtF8urL6iC5MTuw8T0qWw/Eebf1yluagmRORqLHwYPFWdAZ4c
         LBMdAKIXfk5E1dEG4McpxVGW3J2Cu7ffQYurvKKWAdSnho5H8JM8k253UNC+uzToX3D0
         AT7rI+vPlYH/kSRRHWPuHK7e3+thpo/KpasoFT5E+PIaDpCIlKPHEHIcFzYeXxMssBg5
         E1UAUnSNRMm4MVhEDYAOxNSQ/+JS1POrX0rdL/DWfKIMdmLZ4BBHUNYT+FlQip8GW4Mm
         UUiA==
X-Gm-Message-State: AOAM532NpUjdIuip3kQfdh2EFgxQLCAHBTIgFAe2vY/CPj8XvGecrNOA
        F84Px09xaX4yBbMGZi+fPVNwWMZ91FG3odYb
X-Google-Smtp-Source: ABdhPJw92+bv1tpDoZqXpouY2qicTHxeTcDi4tXjJ1yAhPRIT8shcSy3idYOKvLB9LMdigSvIPI8Hw==
X-Received: by 2002:a05:6512:b27:: with SMTP id w39mr2412730lfu.129.1631193549547;
        Thu, 09 Sep 2021 06:19:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d1sm200065lfl.5.2021.09.09.06.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 06:19:09 -0700 (PDT)
Subject: Re: [PATCH 3/7] arm64: dts: qcom: msm8998-xperia: Add support for
 wcn3990 Bluetooth
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-3-angelogioacchino.delregno@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7032cf3a-2469-3d66-bfde-9754dbac58b9@linaro.org>
Date:   Thu, 9 Sep 2021 16:19:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903180924.1006044-3-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/09/2021 21:09, AngeloGioacchino Del Regno wrote:
> This platform uses the WCN3990 Bluetooth chip, reachable on UART-3.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi   | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> index 2fe53e4675d5..66b009ba72fe 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> @@ -179,6 +179,23 @@ &blsp1_i2c5_sleep {
>   	bias-disable;
>   };
>   
> +&blsp1_uart3 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +
> +		clocks = <&rpmcc RPM_SMD_RF_CLK2_PIN>;
> +	};
> +};

There is an ongoing proposal to rework wcn3990 (bt and wifi) bindings, 
so we might want to delay this a bit. Not a strict requirement, since 
the changes would be backwards-compatible.


-- 
With best wishes
Dmitry
