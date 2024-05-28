Return-Path: <linux-arm-msm+bounces-20714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A548D18E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DD72860D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 10:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B30F16C458;
	Tue, 28 May 2024 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="BQYtiEk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183916B753
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716893400; cv=none; b=t5jvChlDwu542ky8GJu8c0LVpFKqSEKbKmo97aRNeaPK0PI/BdZVURAdhdcsgs7s/3schkSu23DiFIuqDAf9VjSmM3uV+AJxDRI+6TORGSouUNt/L8tTDdMu+mMhwMifsS7sCbCpNmFxwx1wM7CRuFAHBOiOf7xn4YUVXK1s0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716893400; c=relaxed/simple;
	bh=xkwtv/ar7L7z1hGbFo/aekoVFoud4lD93MVDzRtiDUo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b9YklOQTDYMcIuW3H4XJ8NTIu/vFx+4FfJ5O7/mlkYobXqkOdOtiN29O6OK3KhoR2kCkCpUqhSWIE9IWFYzj0eAM9mv1zyNPpSF0ydMJFKFMCULNf2K1egXI3/GGVzJa5fJpCFIub9u+QRpGnqVrzvjVNTEO6jCBUDdwKEIgr34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=BQYtiEk1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42108822e3cso22070145e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716893396; x=1717498196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SoaTaKESqCNq2RRTZbp/puYp7dOBR/SpLMVVBMPUbKE=;
        b=BQYtiEk1dUXiYPFN7gSahgzdU28uSoCjrRiU4OUqdoBtDUEtwLxU9bmyMvBR5hu+OM
         prtRdM9hgVNwm8p7CRybS20YxLqL0abaUqWpNo7qhlFJTSQz7rv8r1uArH/cBngiev8w
         YOlJBdKsrDs2WmGwQh/u2VM6J6az11oluqyl9Sj/vr1O0H2n0+9XlBprtFswcEo2J4V8
         3NOx2G/vPnOj34MD3+iMVYPzSb8x7bC2VbrqZ2vVn5t7KWRXuXEAKcEjmpXijWN1wzpL
         NGuVf9IPBg7UlvZz8KOXB2KtwPjJtzM64RaT/Tga2XPef7AFgXv4Bao3AnXibBxkVf0/
         EE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716893396; x=1717498196;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoaTaKESqCNq2RRTZbp/puYp7dOBR/SpLMVVBMPUbKE=;
        b=wu7SSS7pgv8l2NCxM8vhVgOzfDUvcHQDiQVYFKHnfS2INKO/1JxWx5cTuyF/O3Istg
         xwA39R/t+J05a/Wq3LGKVWHDrluyBd592r/OICjaI4VPI3cELJjUshCSXufn+vGUCTkX
         ktTU88/I4TRkmrJ/A49+fLr/JUIWdeRqDGW70nqu5SwgqS99y1ico5T9D0YhWhURl35x
         +7CTw4/yMqqkYQx/vhWIp9QYy15R5Zq6gNdZAucK1/r+a7ID0k38RCooxv51PPbjqXvl
         QUakvta3jsMsJwgPwmBxZdCBG9CCctrrKG43RZYznV5XfqWcjEwnRUxaBli3qYIjp/jl
         DfYg==
X-Gm-Message-State: AOJu0YxdYBOgKHDh5i34NNwhrXvS9gNYyYokm8Y/2V/l/7m7C/d2CI82
	Fl0TeG7ungZ+DYslp8SOj0/uGlTHe0djVDxk5SW98dEziWVqiWAd7gvExBhyNHc=
X-Google-Smtp-Source: AGHT+IGewrMUbSSURVDW5W/6sj6A3tBXyhPbUTHqmyvZmpelqP045wp02w6f3gR0CZiMG43AH7dtNQ==
X-Received: by 2002:a05:6000:1753:b0:354:fce5:4cc3 with SMTP id ffacd0b85a97d-354fce54d2dmr10916648f8f.19.1716893395715;
        Tue, 28 May 2024 03:49:55 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0902fcsm11321509f8f.53.2024.05.28.03.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 03:49:55 -0700 (PDT)
Message-ID: <b4a71be9-b888-4396-9eef-28c4a4f2b149@freebox.fr>
Date: Tue, 28 May 2024 12:49:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: msm8998: add venus node
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
 <c2fca6c7-2421-42b4-a43d-68b251daf9b4@freebox.fr>
 <e187c5ab-0241-4a45-8d74-a33ec12deec6@freebox.fr>
Content-Language: en-US
In-Reply-To: <e187c5ab-0241-4a45-8d74-a33ec12deec6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2024 10:51, Marc Gonzalez wrote:

> On 07/05/2024 11:29, Marc Gonzalez wrote:
> 
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Now that the venus clocks are fixed, we can add the DT node.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 5f5b90a6e2bf1..3d3b1f61c0690 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3010,6 +3010,54 @@ mdss_dsi1_phy: phy@c996400 {
>>  			};
>>  		};
>>  
>> +		venus: video-codec@cc00000 {
>> +			compatible = "qcom,msm8998-venus";
>> +			reg = <0x0cc00000 0xff000>;
>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>> +				 <&mmcc VIDEO_AHB_CLK>,
>> +				 <&mmcc VIDEO_AXI_CLK>,
>> +				 <&mmcc VIDEO_MAXI_CLK>;
>> +			clock-names = "core", "iface", "bus", "mbus";
>> +			iommus = <&mmss_smmu 0x400>,
>> +				 <&mmss_smmu 0x401>,
>> +				 <&mmss_smmu 0x40a>,
>> +				 <&mmss_smmu 0x407>,
>> +				 <&mmss_smmu 0x40e>,
>> +				 <&mmss_smmu 0x40f>,
>> +				 <&mmss_smmu 0x408>,
>> +				 <&mmss_smmu 0x409>,
>> +				 <&mmss_smmu 0x40b>,
>> +				 <&mmss_smmu 0x40c>,
>> +				 <&mmss_smmu 0x40d>,
>> +				 <&mmss_smmu 0x410>,
>> +				 <&mmss_smmu 0x421>,
>> +				 <&mmss_smmu 0x428>,
>> +				 <&mmss_smmu 0x429>,
>> +				 <&mmss_smmu 0x42b>,
>> +				 <&mmss_smmu 0x42c>,
>> +				 <&mmss_smmu 0x42d>,
>> +				 <&mmss_smmu 0x411>,
>> +				 <&mmss_smmu 0x431>;
>> +			memory-region = <&venus_mem>;
>> +			status = "disabled";
>> +
>> +			video-decoder {
>> +				compatible = "venus-decoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>> +			};
>> +
>> +			video-encoder {
>> +				compatible = "venus-encoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>> +			};
>> +		};
>> +
>>  		mmss_smmu: iommu@cd00000 {
>>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>  			reg = <0x0cd00000 0x40000>;
> 
> Hello Bjorn,
> 
> This patch is supposed to be merged through one of your trees, right?

Bjorn, would you take patches 1 and 2 in your tree?

Who would take patch 3?

Regards


