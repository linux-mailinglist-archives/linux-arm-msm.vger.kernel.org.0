Return-Path: <linux-arm-msm+bounces-24552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59C91B5BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 06:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7447AB21EBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 04:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE61224CC;
	Fri, 28 Jun 2024 04:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SimwJTW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40E22619;
	Fri, 28 Jun 2024 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719549555; cv=none; b=qhEJnh6m2yHNw2jUg0oc0xJ+4xdDZxYjJzXa7v0mvhUywhSsSQOn4DQa+dYlchRNbrZKgEXWNWQFhllzsjLMv5vqaVbU1QZ6Ss049pRc5Hyy+s9hMSQLL4pkmpIJF5nDAKFoQbPldeNpp4prDFonj5tEJjeFaHwDPZeUTEooCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719549555; c=relaxed/simple;
	bh=co/vR/XWIMc1kuuqUdZlcYOIyhugYjuq1IRBG21/9V4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/u/rznrHoHoyOJCpTnnho/M3TNa4N2d6wrTHgHfWj2PKGfmVR2nObBvfX0RXdIwpe16OPfs6DoKZXAOXrgaWGGFJ/PGESGZ+V5YoqG4RNIGMl5m6m1mno6L9tJseow/Ey4YvPX+rJnC6yJFLMvHeMeGBSosPlu3enS98bpWC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SimwJTW5; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f8ffe1b65dso103061a34.0;
        Thu, 27 Jun 2024 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719549553; x=1720154353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4A1myKhDtKpBD1HgzlCC9/RwlNtnnSCgm8rGrnmPwkg=;
        b=SimwJTW5oFTBAi3djUGa+EVGgqyhCTRHxiCEatGArWmTujtAmLIJf82mtW1+ij18+U
         DNg7Sp9QIljs4a1iB6Nrq2jR3TIV6GV0PYgxOA8mlGqQP9FsBd/VL2fnpftZADrCQole
         gtAEySrUCnBSEh8+acIyoImSYFcz8SzwC3qXI/lirk83/Ymcn+MEHNPxwMeHa/Kblm4l
         L9Hn8hbUXEUsE7i+9/jkIGnxvv+mjoE/5ASavhPZXEUv8nnxo0thNEVdR4do0yDyBx9u
         3aSby31X5bLuPL9QQ/05LbK3dgYG1rU3DjNbeNvCN4xQTG07s7obzpSKH+8XHxAzwbn7
         h1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719549553; x=1720154353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4A1myKhDtKpBD1HgzlCC9/RwlNtnnSCgm8rGrnmPwkg=;
        b=tYa5gYQQscTn8nOvYUaj24e7LipyQVr3RPsAUgYqpYFI2gK7i/r/E1ETsbe5S0ONtc
         aoE4/qhph12lhaGUNhEm6IAFOxuphzO6kwUZGpSlZOyGyFChUMg+Vt+UhgOvXWO2LKJR
         ZYdfo4ghZslrRSM2vsEmHOwgCrd2fg8itUh3WdzvfhMLAqjBrhFvHMOY3BDQCOZCWKwv
         aDHOxSQHB5utRHaPST47TRL72ePp23LMdTOVCR3Qp36AWAmtwrMICWGB0rcmRz1Br27g
         GssLVqcdmC8N1AAuNyvfVfm+Yx58V5vwhYXMzLtJ/9iBoX5AYXL/0eu+HDXDIrzzctb1
         +dFg==
X-Forwarded-Encrypted: i=1; AJvYcCX7uXaYwqC7saUzBAqxaVKIQJbRwiOafpMipMLHT5sNTLOLoAIsrJG0KnJ5D0nHvmpolRLoMiVggJKjQklu2gMDKOgW0axxkrXXMy9R3o9pBogteH5z0QGoKnmlkeVuUlFY4Fg7BA0q485ZLw4qvZuLGBDt4oRWuA6FeLsE5yenkux7CcsnkY4=
X-Gm-Message-State: AOJu0Yxo+Z0dvoplZdmGn/Z8r1ADjpmvgq67/UeiyEE5yc7lhT8X3rom
	pku791PgbXQ/TUzYU5OLvbIiaQCBWZONTOpXO0Ls1/08vvLkPTeYDPdgomcj
X-Google-Smtp-Source: AGHT+IEFutYK8aZdJ//n/IRqE4LDzLKmmJScOAjOOPa5VPHcRKb2EwXZjmgF49v8sbNgmV/Jv+c0wA==
X-Received: by 2002:a9d:68c6:0:b0:6f9:d203:8d13 with SMTP id 46e09a7af769-701fa7c1f42mr252753a34.0.1719549552620;
        Thu, 27 Jun 2024 21:39:12 -0700 (PDT)
Received: from [192.168.7.110] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c4149c37c4sm153200eaf.42.2024.06.27.21.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 21:39:12 -0700 (PDT)
Message-ID: <79e57338-1671-4574-b1e2-3b3aa9045ec9@gmail.com>
Date: Thu, 27 Jun 2024 23:39:10 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: ipq9574: add PCIe2 and PCIe3
 nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240501040800.1542805-1-mr.nuke.me@gmail.com>
 <20240501040800.1542805-9-mr.nuke.me@gmail.com>
 <20240624041832.GD10250@thinkpad>
Content-Language: en-US
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <20240624041832.GD10250@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/23/24 23:18, Manivannan Sadhasivam wrote:
> On Tue, Apr 30, 2024 at 11:07:50PM -0500, Alexandru Gagniuc wrote:
>> On ipq9574, there are 4 PCIe controllers. Describe the pcie2 and pcie3
>> nodes, and their PHYs in devicetree.
>>
>> The pcie0 and pcie1 controllers use a gen3x1 PHY, which is not
>> currently supported. Hence, only pcie2 and pcie3 are described. Only
>> pcie2 was tested because my devboard only has conenctions to pcie2.
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 178 +++++++++++++++++++++++++-
>>   1 file changed, 176 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 7f2e5cbf3bbb..c391886cf9ab 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -300,8 +300,8 @@ gcc: clock-controller@1800000 {
>>   				 <0>,
>>   				 <0>,
>>   				 <0>,
>> -				 <0>,
>> -				 <0>,
>> +				 <&pcie2_phy>,
>> +				 <&pcie3_phy>,
>>   				 <0>;
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>> @@ -745,6 +745,180 @@ frame@b128000 {
>>   				status = "disabled";
>>   			};
>>   		};
>> +
>> +		pcie2_phy: phy@8c000 {
>> +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
>> +			reg = <0x0008c000 0x14f4>;
>> +
>> +			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
>> +				 <&gcc GCC_PCIE2_AHB_CLK>,
>> +				 <&gcc GCC_PCIE2_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg_ahb",
>> +				      "pipe";
>> +
>> +			clock-output-names = "pcie_phy2_pipe_clk";
>> +			#clock-cells = <0>;
>> +			#phy-cells = <0>;
>> +
>> +			resets = <&gcc GCC_PCIE2_PHY_BCR>,
>> +				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
>> +			reset-names = "phy",
>> +				      "common";
>> +			status = "disabled";
>> +		};
>> +
>> +		pcie3_phy: phy@f4000 {
>> +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
>> +			reg = <0x000f4000 0x14f4>;
>> +
>> +			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
>> +				 <&gcc GCC_PCIE3_AHB_CLK>,
>> +				 <&gcc GCC_PCIE3_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg_ahb",
>> +				      "pipe";
>> +
>> +			clock-output-names = "pcie_phy3_pipe_clk";
>> +			#clock-cells = <0>;
>> +			#phy-cells = <0>;
>> +
>> +			resets = <&gcc GCC_PCIE3_PHY_BCR>,
>> +				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
>> +			reset-names = "phy",
>> +				      "common";
>> +			status = "disabled";
>> +		};
>> +
>> +		/* TODO: Populate pcie0/pcie1 when gen3x1 phy support is added. */
>> +
>> +		pcie2: pcie@20000000 {
>> +			compatible = "qcom,pcie-ipq9574";
>> +			reg = <0x20000000 0xf1d>,
>> +			      <0x20000f20 0xa8>,
>> +			      <0x20001000 0x1000>,
>> +			      <0x00088000 0x4000>,
>> +			      <0x20100000 0x1000>;
>> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
>> +
>> +			ranges = <0x81000000 0x0 0x20200000 0x20200000 0x0 0x00100000>,
>> +				 <0x82000000 0x0 0x20300000 0x20300000 0x0 0x07d00000>;
> 
> Please cross check 'ranges' property with other platforms.
> 
<snip>
> 
> Cross check 'interrupt-map' as well.

I'm not seeing the smoking gun. What am I looking for?

Alex

