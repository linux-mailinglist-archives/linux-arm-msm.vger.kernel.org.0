Return-Path: <linux-arm-msm+bounces-18850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A38B661B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 01:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E6BAB219BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 23:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FFA77F10;
	Mon, 29 Apr 2024 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJvxJY6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973291EA90
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714432610; cv=none; b=sM6TAMkKWELoLtEss3SdymYLIZ/MBrjmGeIj1mh1Mc89Oh/eBcGKHhm0SIutN0C/w5CMAsAgb/v4buVNlZhT83xenAD2kPrKhoXXaA5enIRBM6diLIa7cCL258aNeLgYryNvRFtzTGE4acQ7no+D144TBaYOIiYbSJtLaiUGSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714432610; c=relaxed/simple;
	bh=El9CxvK17lJ0yXh18eAG7X9aNa362SEAULLsd9cWa24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qg4wnqk1+7vv6fSZHcuIfVnx3Wb9DB503S1l60OeRf4EyaxfQYY/iP0wS5l0D41DGVPz3JQ1rWUNfwubFajRPUMo9ETP1Vh1ZlWKLRtf8mXJMoYxoGMzSYc000ruakenuje/44eqP/Md+rGB3d+REgbLbksMnJPj7p3zscSGQQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJvxJY6W; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41adf3580dbso29925435e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 16:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714432607; x=1715037407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAfUv7krEDpHWriJ3W9+nPFnIEeV6MBtg4cLqPbx8GM=;
        b=fJvxJY6WPYLf9gZL/Cs7DA/M8Xk1EX7qIduKl38EezK5d7U/fV/PmfecUXqF2PzU4W
         bwfA8Jh0BBaF7l8Wh6YflL7Zap8JQcMAuukAQAhIPopFmIMHmexlxfEw83E19tRCF+Yz
         51LX9UEcs+c3wywf/P4dAxdAJjS3pRDPqiZoQXKdVTTVln/5RuKY5ajcqiDSFLBYBaom
         yh/XLkcxDaoCze7ESMFLQBsCCeZcOKiz06k0H6IGT5KthrqEJXmgfUbCHryaiS10q0j6
         TOKarE3AxlNqB+NP0kGn2g2ZnLdeuVZW5pv1mz7ijkoIVRjyNIYXl8lBfuvcvZylOszn
         DDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714432607; x=1715037407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAfUv7krEDpHWriJ3W9+nPFnIEeV6MBtg4cLqPbx8GM=;
        b=qQorhQso3eZMqGK0SpbMd5dckNi8BTTz81+z4PgS16EuO4YRj9b+KqdIpCSsMX4IoX
         8Wtucug8AfZrUw7y9uPvkt7nI1FmDAe47icskSg79eI4PtBgLEQy34h4FiuGavYrRrRY
         ivN25PMKrZap43h13lUpbgbUIxV3roWVR8pdnmJ5QpjF9TMOmBXMH1K/EiKQaQILMChb
         dvJ1NeadGzD6pp3qI+R6vSX/6i7s/jQMH1BREKvIvfn+TXbr7TrkaUX/jAHC+I4/m9WS
         lg9MreeG50pWdh/l7NWauj8Pap450yhYqhPobLDF0VX9zJFnRwmM/aVn5EJ7hzPQpNSW
         hGPQ==
X-Gm-Message-State: AOJu0YzNR4Wq9wWDhrYxqaRmh5CenMRc7AOcNMKmvvPSO/AunstimPQU
	U9HUesjKrJXgTWrRX5oR93ntD9UwHScRdWt/Xh9VCpeimI9TseCLR0uauphx1Co=
X-Google-Smtp-Source: AGHT+IHdrP1g5HDu9nqdd34tb7Op68RcspZRXp0nwxly1lL0D60g1H1v4IiU/k274IlSpSSNj8g+Kw==
X-Received: by 2002:a05:600c:3583:b0:415:ff48:59fc with SMTP id p3-20020a05600c358300b00415ff4859fcmr992929wmq.8.1714432607051;
        Mon, 29 Apr 2024 16:16:47 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b0041ac4aafd3dsm24536212wmo.12.2024.04.29.16.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 16:16:46 -0700 (PDT)
Message-ID: <92e9fbee-dca4-4b8a-9856-ff420d8b9b23@linaro.org>
Date: Tue, 30 Apr 2024 00:16:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: msm8998: add venus node
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
 <61729cd3-0a93-4e8c-a7c8-6832d43c7a3a@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <61729cd3-0a93-4e8c-a7c8-6832d43c7a3a@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 17:17, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> Now that the venus clocks are fixed, we can add the DT node.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 5f5b90a6e2bf1..3d3b1f61c0690 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -3010,6 +3010,54 @@ mdss_dsi1_phy: phy@c996400 {
>   			};
>   		};
>   
> +		venus: video-codec@cc00000 {
> +			compatible = "qcom,msm8998-venus";
> +			reg = <0x0cc00000 0xff000>;
> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;

interconnects are not present on 8998 eek !

> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
> +			clocks = <&mmcc VIDEO_CORE_CLK>,
> +				 <&mmcc VIDEO_AHB_CLK>,
> +				 <&mmcc VIDEO_AXI_CLK>,
> +				 <&mmcc VIDEO_MAXI_CLK>;
> +			clock-names = "core", "iface", "bus", "mbus";
> +			iommus = <&mmss_smmu 0x400>,
> +				 <&mmss_smmu 0x401>,
> +				 <&mmss_smmu 0x40a>,
> +				 <&mmss_smmu 0x407>,
> +				 <&mmss_smmu 0x40e>,
> +				 <&mmss_smmu 0x40f>,
> +				 <&mmss_smmu 0x408>,
> +				 <&mmss_smmu 0x409>,
> +				 <&mmss_smmu 0x40b>,
> +				 <&mmss_smmu 0x40c>,
> +				 <&mmss_smmu 0x40d>,
> +				 <&mmss_smmu 0x410>,
> +				 <&mmss_smmu 0x421>,
> +				 <&mmss_smmu 0x428>,
> +				 <&mmss_smmu 0x429>,
> +				 <&mmss_smmu 0x42b>,
> +				 <&mmss_smmu 0x42c>,
> +				 <&mmss_smmu 0x42d>,
> +				 <&mmss_smmu 0x411>,
> +				 <&mmss_smmu 0x431>;
> +			memory-region = <&venus_mem>;
> +			status = "disabled";
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
> +				clock-names = "core";
> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
> +				clock-names = "core";
> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
> +			};
> +		};
> +

So without interconnects I guess the tip-of-tree kernel is not very 
usable for 8998 but, that's not specific to this patch.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

