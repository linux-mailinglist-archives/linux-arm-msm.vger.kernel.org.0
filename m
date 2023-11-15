Return-Path: <linux-arm-msm+bounces-688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB47EC14C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 12:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD7E31F26CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 11:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAAC168A3;
	Wed, 15 Nov 2023 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tn6ClLaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5372168A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 11:33:00 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64B411C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 03:32:58 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso92838131fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 03:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700047977; x=1700652777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hiBw5jMG8U1ulMqGVWIaLS7ahy5r63yHp8YN9d29sao=;
        b=Tn6ClLaWdtI9Zoq4FUEJFNvp0PoIwuo46k5KCl+BFHeV/E0eC+RlLJSBAseuYx1RFk
         YmH3BFT+j70Q9z65Gb+rO48AU5sZ/nmyYMtptbru3FnuHUrjfE8/51W3TObq1wcoaosr
         3Bw23I2IXgq7j4vvOOGKwH2QMfdw70g17AVLw7LVecepS41iBAnQn+oVWJv87HbdYuoP
         6yW8ML7/Yh6sjljLegvTymZrP4ytnj+Btk36zdktq84dbh0yfWVR+KSqxS1X8SLBFl5r
         mVdSw3d4xuekIarZadbSlURgvySXeLVCRQubiU/p7WF7ozaV7GMd87kJ+aLZNdiYxsS5
         oL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700047977; x=1700652777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiBw5jMG8U1ulMqGVWIaLS7ahy5r63yHp8YN9d29sao=;
        b=nTsLoen1pFR1sEqfHnqQP4u074cUo0lbaLEsphlXm2gYySQimmPml3hw9wpHVzA+Lv
         ZQ7FaU2gXYaXM0jpaQUdTCNXF9293Z3wCeShsVcwcA1Z/ODTQVCtDRkzSmHDl+wpUIzn
         M6fiVbgYLsq27Q7stgnUU+dcL2JTJKbw6SA2Ar0S8nLwY+lxgp7NVcTwQJUZYEZO0xRv
         RQzw9gDc/L23+voYdb+Rq5f2zlXEAPx2N8crFCabAPgzS4UoP/yM60noSXxKbO7InzME
         0iET2zTwBwNQ9gmbHXHrkMjlId31Z/N114jJlQ0tkJ2aXLupp+m3OqlpB25MUwEOC02l
         TJHA==
X-Gm-Message-State: AOJu0YzApGWyHKpC9bmXmbFCOY+2+dZsoZTdd3EDFSsh8JqsVBIiKP6b
	tt2/RkIM95T4xnJ9k17MdV3aLRW+pQQV8t+4V8fXSIBlPew=
X-Google-Smtp-Source: AGHT+IE0T3C1HyGXfX4+RejyzsU3q7ZVO8/zOHxu8BPFG40RyApPXuNL0DTaN2SAH+B1aLohPZycNA==
X-Received: by 2002:a05:651c:b2c:b0:2c6:ee73:a20e with SMTP id b44-20020a05651c0b2c00b002c6ee73a20emr4759513ljr.33.1700047976849;
        Wed, 15 Nov 2023 03:32:56 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id w3-20020a5d4b43000000b0032cc35c2ef7sm10311329wrs.29.2023.11.15.03.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 03:32:56 -0800 (PST)
Message-ID: <a3e35d3b-906a-4540-924c-0103cf32efa4@linaro.org>
Date: Wed, 15 Nov 2023 11:32:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: add QUP5 I2C node
To: Legale Legale <legale.legale@gmail.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2023 09:55, Legale Legale wrote:
> Add node to support this bus inside of IPQ6018.
> For example, this bus is used to work with the
> voltage regulator (mp5496) on the Yuncore AX840 wireless AP.
> 
> Signed-off-by: Isaev Ruslan <legale.legale@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index e59b9df96c7e..745bfc6e2907 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -507,6 +507,21 @@ blsp1_i2c3: i2c@78b7000 {
>                          status = "disabled";
>                  };
> 
> +               blsp1_i2c6: i2c@78ba000 {
> +                       compatible = "qcom,i2c-qup-v2.2.1";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x078ba000 0x600>;

reg = <0x0 0x078ba000 0x0 0x600>;
like the other regs here

> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
> +                                <&gcc GCC_BLSP1_AHB_CLK>;
> +                       clock-names = "core", "iface";
> +                       clock-frequency = <100000>;

Why not <400000>; as with other nodes ?

> +                       dmas = <&blsp_dma 22>, <&blsp_dma 23>;
> +                       dma-names = "tx", "rx";
> +                       status = "disabled";
> +               };
> +
>                  qpic_bam: dma-controller@7984000 {
>                          compatible = "qcom,bam-v1.7.0";
>                          reg = <0x0 0x07984000 0x0 0x1a000>;
> --
> 2.42.0
> 

What tree does this apply to ?

git checkout -b linux-next-6.7-rc1 v6.7-rc1
Switched to a new branch 'linux-next-6.7-rc1'

deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ b4 shazam 
CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com

Grabbing thread from 
lore.kernel.org/all/CACDmYyf4hxbuw%2BcpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH] arm64: dts: qcom: ipq6018: add QUP5 I2C node
   ---
   NOTE: install dkimpy for DKIM signature verification
---
Total patches: 1
---
Applying: arm64: dts: qcom: ipq6018: add QUP5 I2C node
Patch failed at 0001 arm64: dts: qcom: ipq6018: add QUP5 I2C node
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: git diff header lacks filename information when removing 1 
leading pathname component (line 6)
hint: Use 'git am --show-current-patch=diff' to see the failed patch

---
bod

