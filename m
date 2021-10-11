Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27A84295A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 19:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhJKReC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 13:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhJKReC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 13:34:02 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48CAC061570
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:32:01 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id j12so11362788qvk.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k3jF8V+6+8C8o6OjJMiPBIzA7aLqP1KpqHxkTYn+8VE=;
        b=BiVzpbHdOLf08YE1YClnZmLy0ruQHvw7Y1tn3rRaaxJE1PECPVEnKbrpvtlKirvu4j
         yEJdbhLKsFa9VHQLdU8zk5ek/fXZaWoRA0DJ8vn+yFD7sACxnjyTc3kMXMHa9FQK4kA/
         9x8wW1HNzjteVQ0wUwz79W4eae8+kvu+iR14Gum/zlil4PZSeQBqnC1b2dX78aKU2iWe
         Z7ZKNgESTk74OpiH82kbZDzpmZVeYOvWJ/winABuUUvLpnzJG1dRMTIUnetweTce0ksB
         favAnpN/DRCYCwDv1NveuSBBjKpoWCybPk7hXNoZGEJDQqDC7x+/qGYZgJaxUWk36Gbg
         7DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k3jF8V+6+8C8o6OjJMiPBIzA7aLqP1KpqHxkTYn+8VE=;
        b=WBYg46H0Ql5GGOK74G8nWQuzs944If6VWrBVFo1oeeg10DKZI9rB4dmgKXaxAXrYDY
         C1K5SRL98XxrSwHs+g8Zp43C4so95Zyfwq1Yl0fZoreOgz5s2n7scbeX01LBmSFIeL4D
         r3put/2BmrlHKXaT6hV0vuWCmno8Ad6bb3UuefdH87z6hxeKhxFTpL4SjU7qfeXENaLk
         W6ESItlpG8sP2YRSNDgdahcT4vFCSrzizowScVFfUdqCm23/ovHssR6J7ClJRBgIzY37
         65/TUbjp8n2AyvpBKKfi3n0Adqc97tfIiONI0I2eMJcYsdlNNwJsshz038ghqN6RHteX
         m35A==
X-Gm-Message-State: AOAM530dFPOf8E5phnHdnha29Ob5cOVCkOZl9GyF6lIpF4zTFPsXobn0
        XMvjmTOaV5MD8Gs38DlHvrIOeA==
X-Google-Smtp-Source: ABdhPJw6+VH+PzW3P2iTwmrzr4y7d19NK/k1ihNB7lMfB8yLm1jucpTj7H33M0KHD0HF4CgCXQcIjA==
X-Received: by 2002:a05:6214:a0d:: with SMTP id dw13mr16326199qvb.51.1633973520852;
        Mon, 11 Oct 2021 10:32:00 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id c16sm4456606qkk.113.2021.10.11.10.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 10:32:00 -0700 (PDT)
Subject: Re: [PATCH] dts: qcom: msm8996: Add device tree entries to support
 crypto engine
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211011094822.1580122-1-vladimir.zapolskiy@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5ee9bb9a-ec62-bbab-4fd5-374abb5551ed@linaro.org>
Date:   Mon, 11 Oct 2021 13:31:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211011094822.1580122-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/21 5:48 AM, Vladimir Zapolskiy wrote:
> The change adds description of Qualcomm crypto engine controller and
> BAM associated with it. The change is inspired by commit 3e482859f1ef
> ("dts: qcom: sdm845: Add dt entries to support crypto engine.")
> 
> While performance of cryptographic algorithms executed on QCE is lower
> than e.g. ones tinkered for ARM NEON, the offloaded execution would
> make sense:
> 
>      # cryptsetup benchmark | grep aes
>      aes-cbc        128b        71.0 MiB/s        71.9 MiB/s
>      aes-cbc        256b        62.4 MiB/s        62.4 MiB/s
>      aes-xts        256b        70.7 MiB/s        70.8 MiB/s
>      aes-xts        512b        62.0 MiB/s        63.3 MiB/s
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 52df22ab3f6a..a03cbeb58246 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -705,6 +705,28 @@ tsens1: thermal-sensor@4ad000 {
>   			#thermal-sensor-cells = <1>;
>   		};
>   
> +		cryptobam: dma@644000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x00644000 0x24000>;
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_CE1_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely = <1>;
> +		};
> +
> +		crypto: crypto@67a000 {
> +			compatible = "qcom,crypto-v5.4";
> +			reg = <0x0067a000 0x6000>;
> +			clocks = <&gcc GCC_CE1_AHB_CLK>,
> +				 <&gcc GCC_CE1_AXI_CLK>,
> +				 <&gcc GCC_CE1_CLK>;
> +			clock-names = "iface", "bus", "core";
> +			dmas = <&cryptobam 6>, <&cryptobam 7>;
> +			dma-names = "rx", "tx";
> +		};
> +

Hi Vlad,

Hi Vladimir,

I am surprised that you don't need to specify iommu to get this working.
Everything else looks okay to me, though I don't have the h/w to test.
So,

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>


>   		tcsr_mutex_regs: syscon@740000 {
>   			compatible = "syscon";
>   			reg = <0x00740000 0x40000>;
> 

-- 
Warm Regards
Thara (She/Her/Hers)
