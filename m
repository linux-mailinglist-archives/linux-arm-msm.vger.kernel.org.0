Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97DF69AE5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 15:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjBQOuk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 09:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjBQOuj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 09:50:39 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C826D79C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 06:50:38 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id y14so1283768ljq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfMrwTYv/UXoa7T4u9ssxGz4oHUgnUkMNtSANg8q2aA=;
        b=cgz14t7XoHnNwjs4GdXOH21yNb7lcn+UPq02doQu4fDIlBKV/U0ioGG9GbxWdCIx2v
         eYg5URXUxeFM3qYVPyv68dPjhhmPr14U2tFHY1hFj/ATiw3KQ2vk8SOpK/hGWaZjvaDC
         k0SHf3bMhxxxlCe9urmwPAPNQBkyhJUlLMA13hA4/RhmMDCu8o9hPQwkGtxXN277ACSO
         oHIYInVlX6INYNgQOH3zAgT7z8pQaWUD/aewj2rOyDiCqrIXH3Sa+1PpfjUIruAhvf88
         O6E34RtyDKx7+GzBaSk9TP0qVfvS8X3MCrv2IoyloETngSzSsNyu10E9xGGx2MrWScjm
         A0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfMrwTYv/UXoa7T4u9ssxGz4oHUgnUkMNtSANg8q2aA=;
        b=BkF7YxVvAr9kaSoBIZfd66d1k/5gcwA+hGH7bnIvFT/1Jx14//wYp3/CRvbjkjUGsW
         IVYv80fTaMIWXeC1B92tULT6va69UMyPWbbjXX7NMRl33fMU9iVv4RfRhTdbAspy9eB4
         cOBh0BEondd79mixq6OMUkonBcrjHTcT+pdMiLN0A5ZW/nYJlQ88pWzeiNGS9ONlOsaY
         dOK2l/u7dLHcqpMoM/V+C6Wt8Hs+YLNHo4Uyjpx/te/LRGBlgG8qnEqkD/59AZoB/j0j
         v2vSNII6WpnXRM9yM8YxmWD/G/n4OTur0Ckbj3c4Ppy6m4yzxiwF0u8nwokcMVNrpxGg
         vJow==
X-Gm-Message-State: AO0yUKUz87mf0/TGVT9wnqT692JaKLIBEigtuv1YnLEb0WcMZvZ1T4nU
        rblJ4l5t7OS0WP4KgWXGwrGQDw==
X-Google-Smtp-Source: AK7set/hfBuG6JsWKdDSQ3c2iSdoJBvniIXs0og+UFY+N5qNHXkbuBsaDap+aTDXp7RVbdyt8hSaNg==
X-Received: by 2002:a05:651c:513:b0:290:463:430 with SMTP id o19-20020a05651c051300b0029004630430mr1802192ljp.15.1676645436605;
        Fri, 17 Feb 2023 06:50:36 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id i62-20020a2e2241000000b002934d0ff439sm589070lji.104.2023.02.17.06.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 06:50:36 -0800 (PST)
Message-ID: <12d23d88-6f42-09ea-3f26-e1b7a0878767@linaro.org>
Date:   Fri, 17 Feb 2023 15:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH V2 5/6] arm64: dts: qcom: ipq9574: Add RPM related nodes
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_ipkumar@quicinc.com
References: <20230217142030.16012-1-quic_devipriy@quicinc.com>
 <20230217142030.16012-6-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230217142030.16012-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 15:20, Devi Priya wrote:
> Add RPM Glink, RPM message RAM and SMPA1 regulator
> nodes to support frequency scaling on IPQ9574
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V2:
> 	- Splitted the RPM and CPU Freq changes to individual patches
> 	- Moved the regulators node to Board DT
> 	- Dropped the regulator-always-on property
> 	- Updated the compatible in regulators node with the existing
> 	  mp5496 compatible
> 
>  arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi        | 17 +++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts b/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> index 21b53f34ce84..8a6caaeb0c4b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> @@ -57,6 +57,17 @@
>  	status = "okay";
>  };
>  
> +&rpm_requests {
> +	regulators {
> +		compatible = "qcom,rpm-mp5496-regulators";
> +
> +		ipq9574_s1: s1 {
> +			regulator-min-microvolt = <587500>;
> +			regulator-max-microvolt = <1075000>;
> +		};
> +	};
> +};
This belongs in a separate patch.

> +
>  &sdhc_1 {
>  	pinctrl-0 = <&sdc_default_state>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index d20f3c7383f5..2f300cbab93e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -133,6 +133,11 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		rpm_msg_ram: rpm@60000 {
Since this is a part of the MMIO region and not a part of DRAM,
we generally put this node under /soc with the compatible of
qcom,rpm-msg-ram and without no-map.

And the node name then should be sram@.

> +			reg = <0x0 0x00060000 0x0 0x6000>;
> +			no-map;
> +		};
> +
>  		tz_region: tz@4a600000 {
>  			reg = <0x0 0x4a600000 0x0 0x400000>;
>  			no-map;
> @@ -768,6 +773,18 @@
>  		};
>  	};
>  
> +	rpm-glink {
Alphabetically this should come before /soc.

Konrad
> +		compatible = "qcom,glink-rpm";
> +		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +		mboxes = <&apcs_glb 0>;
> +
> +		rpm_requests: glink-channel {
> +			compatible = "qcom,rpm-ipq9574";
> +			qcom,glink-channels = "rpm_requests";
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
