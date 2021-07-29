Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CB83DA189
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 12:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbhG2Ku7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 06:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbhG2Ku6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 06:50:58 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C61AC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 03:50:54 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id p38so3125262qvp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7LDSqJbg5uCatZHHPu87WA9Bh6dYYJKdoQ4UcOW9Nqk=;
        b=R+6Utq/mypO/2BTESax//iPcjehFNB85vYbB++C51eQcimGRAY1islhP1BkqB4EO6f
         eD1GDVj7bSuVkbDfpXdRLtnvnyjaqxTal+EM+ROj+JJzMV531IrZCIrWLXWK7q52Va8S
         QMxIeu+c01guO+Dyygq2Obc4YFHokMC7XAarXF/dc5BJ1rhFbX4nTD2wpekkOWp6HaTy
         r+gCjeMzIf3XVBnbWPcCBpibBJmKHUUumHJ+eIN0A5JttMhW6SS2z2Ipo0dWJd8+2ilc
         hQtG8NaIMqL2frteNVLJEavYWuB6N3t3/R0k55rZKTXK+NM0vysud8OMLaa8GlnOuidt
         sZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7LDSqJbg5uCatZHHPu87WA9Bh6dYYJKdoQ4UcOW9Nqk=;
        b=IQGswdFip43afSec8JZxtw9Wcp59dQodfiiu1uOh1VjGiWvU9dITM9qAo8nDXVXAU7
         pW4VXGMdXFFcjnuqH7MrYRUCsoY2C8rqaMiVEe21v1dENfrZqNoIhwX5yngrnFzMDtIr
         yZHAAGLMfRjuG8s1TCYGJyW4obmWXyM1gRp04UYLINlECtulGJeqfea+Q21OOzYLTTe9
         31D+E+ZOvU/eL6thwQW0j1MFi37o32MZx/Qr3DQTgBfpx+plibBWXvBkXhgCpIwanzPO
         qzbu/REWtOjAjZO7RS+KEXjx25FyNUUQvJ6s6rC6kg8M/OHFqIfZqyfjbIs3fd1KLhXb
         53UA==
X-Gm-Message-State: AOAM533fq8iBsa7uj45hhAoLmM29nlHv1FnnAJYPbYsjoErvm/T8IkN2
        1qcVd4pSh3lBauxykrO4sYY/vw==
X-Google-Smtp-Source: ABdhPJymclFCGkiQXunpw1ReNKgxD5q725uzyeVyljJl8XX1w+h0z08VUI397n+uEQLXPhkGIF4G1w==
X-Received: by 2002:a0c:e087:: with SMTP id l7mr4591930qvk.23.1627555853690;
        Thu, 29 Jul 2021 03:50:53 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id 188sm1515483qkj.48.2021.07.29.03.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 03:50:52 -0700 (PDT)
Subject: Re: [PATCH 14/39] arm64: dts: qcom: sdm630: Add TSENS node
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
 <20210728222542.54269-15-konrad.dybcio@somainline.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <860f1120-c5a4-f531-3ea9-aa90c6b063dc@linaro.org>
Date:   Thu, 29 Jul 2021 06:50:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728222542.54269-15-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,

On 7/28/21 6:25 PM, Konrad Dybcio wrote:
> This will enable temperature reporting for various SoC
> components.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   .../devicetree/bindings/thermal/qcom-tsens.yaml       |  1 +
>   arch/arm64/boot/dts/qcom/sdm630.dtsi                  | 11 +++++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 4a2eaf28e3fd..d3b9e9b600a2 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -48,6 +48,7 @@ properties:
>                 - qcom,sc7180-tsens
>                 - qcom,sc7280-tsens
>                 - qcom,sc8180x-tsens
> +              - qcom,sdm630-tsens
>                 - qcom,sdm845-tsens
>                 - qcom,sm8150-tsens
>                 - qcom,sm8250-tsens
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 1e54828817d5..7e9c80e35fba 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -627,6 +627,17 @@ mnoc: interconnect@1745000 {
>   				 <&mmcc AHB_CLK_SRC>;
>   		};
>   
> +		tsens: thermal-sensor@10ae000 {
> +			compatible = "qcom,sdm630-tsens", "qcom,tsens-v2";
> +			reg = <0x010ae000 0x1000>, /* TM */
> +				  <0x010ad000 0x1000>; /* SROT */
> +			#qcom,sensors = <12>;

Are all 12 sensors used ? I see that in a later patch "arm64: dts: qcom: 
sdm630: Add thermal-zones configuration" only 9 are used.

> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> +					 <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>   		tcsr_mutex_regs: syscon@1f40000 {
>   			compatible = "syscon";
>   			reg = <0x01f40000 0x20000>;
> 

-- 
Warm Regards
Thara (She/Her/Hers)
