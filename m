Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173636CC0ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjC1Nbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbjC1Nbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:31:34 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27FBC170
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:30:58 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z42so12535564ljq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gg3lYt3KoE0McrcY8uu+tDhI/9yJmtbZP7QMSYflkEI=;
        b=neLigaJNs85v4HvccLAiYFw9i2EX7oanTtSYEnArUPiRtPWURytpUJEi/KgC0H/29s
         tIoxohaT5snQhHDmAD8EtUklkhTviBuCe0snughWBEZsdPchExAlvrK1StVKMdRu09tr
         weg0tMgGCSkqpoM0vose++I/9f21NiP+8VqeE0LmDfcO2gTC7+xlYJfp0J2U3XYwZSAU
         ZTcWY4+8dTpsr745bggmocREbA3MuGw1cgPVNEYRowkxbmv/whS4hHZEb2DrbZuUwOoL
         +j/w8YMVyTRRlbA0zajHsKA+HAn1S+1diuAWGT4MEoWVfsl97dY1E+tGp6rOySMlMMnj
         P/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gg3lYt3KoE0McrcY8uu+tDhI/9yJmtbZP7QMSYflkEI=;
        b=hl3PHTqa6b1ltvJAnjUn+k1ky/FjZB/90o/d8BbHbOTWDhuh+nrb2ehQ7zLH5/FoQD
         qxOOdfpavqOc/1IhW5rzq5+HaXn2YNPjjCO+c03W4DHEhliJkscGMnw6Gxv1Iqs0m2vd
         IhgQOyjA+G6sZgW5ScsxxKh2d9IzDstWSb5xIp5jtW97Rx9JLzcTHsBprwJ8Te704bFH
         B5QHhOzbSDpDvQXtRxBS5v0yJzLnEdijR5ewoDcXS+fizU9/DA2fUSgh0JOphYQzJWaG
         AdbdfF5NymJDqQY7DKVG5johaZd0cgK/QUrJk5R80f74b/kQICUgZh0xwKoUT7AFZdPH
         lILw==
X-Gm-Message-State: AAQBX9dZSnnvFUp9tzJWYPrr86EgTzYXf71WC/jI0l/D4Lw8EiCo+1V8
        RElS4w5tk9mBHkxqe77O3bY4gJHuZiSPgBVVlFM=
X-Google-Smtp-Source: AKy350bUJTEzd90IIRG/iiSwghCm704Zg/Yznz/Kyq7j/pOc02N3i7IEZ3Dd9uMd3shE/X2VacQCew==
X-Received: by 2002:a2e:9e83:0:b0:293:52f5:2957 with SMTP id f3-20020a2e9e83000000b0029352f52957mr5142979ljk.5.1680010252658;
        Tue, 28 Mar 2023 06:30:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id c1-20020a2e6801000000b002a421ac8629sm1678069lja.49.2023.03.28.06.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 06:30:52 -0700 (PDT)
Message-ID: <ddeb8021-2247-4ec0-4861-56a9f8d617f7@linaro.org>
Date:   Tue, 28 Mar 2023 15:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/5] ARM: dts: qcom: sdx65-mtp: Enable PCIe EP
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mani@kernel.org,
        lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <1679036039-27157-1-git-send-email-quic_rohiagar@quicinc.com>
 <1679036039-27157-6-git-send-email-quic_rohiagar@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1679036039-27157-6-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.03.2023 07:53, Rohit Agarwal wrote:
> Enable PCIe Endpoint controller on the SDX65 MTP board based
> on Qualcomm SDX65 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> index 70720e6..afe970a 100644
> --- a/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> @@ -245,6 +245,17 @@
>  	status = "okay";
>  };
>  
> +&pcie_ep {
> +	pinctrl-0 = <&pcie_ep_clkreq_default &pcie_ep_perst_default
> +			&pcie_ep_wake_default>;
This seems misaligned, the &s should be one below another

But other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	pinctrl-names = "default";
> +
> +	reset-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
>  &pcie_phy {
>  	vdda-phy-supply = <&vreg_l1b_1p2>;
>  	vdda-pll-supply = <&vreg_l4b_0p88>;
> @@ -277,6 +288,29 @@
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	pcie_ep_clkreq_default: pcie-ep-clkreq-default-state {
> +		pins = "gpio56";
> +		function = "pcie_clkreq";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	pcie_ep_perst_default: pcie-ep-perst-default-state {
> +		pins = "gpio57";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	pcie_ep_wake_default: pcie-ep-wake-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
>  &usb {
>  	status = "okay";
>  };
