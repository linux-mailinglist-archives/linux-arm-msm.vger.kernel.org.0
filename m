Return-Path: <linux-arm-msm+bounces-7348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 870B282EE97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 13:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268541F23F80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247A71B955;
	Tue, 16 Jan 2024 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqWSY1hz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6891B944
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd04078ebeso99792211fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705406388; x=1706011188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drWSEzWzgvfy014y12sEQ8J9AAejreZknCJI7GLECrw=;
        b=ZqWSY1hz7YiqGCoHWcxdfpG7aXMzLi4G/uQr8fxT+EnZkjecA/ZmDT1olJbdudRd4j
         EG6lyBPUALaaBUEop+SaFXZIe4gM9T1GKuCzX+p78dT4srAeSJ635gCXDOUSh+9zX1qy
         MK6ViZaJnXGwEEvLBiiiwl2PpDdSvTCfYMRXbwlhXYj4mkwEdWNQ5x6vVu5+QPX+qoiV
         dvdbui8Rb6uakX9GdbI6W88JorQNTc9QS8R8DaLg9UqzftCaX3eWN1NZn1QCvc6PfMk8
         ILQPsaZ3Sh0SOeRbtCOfFdGOJcnvoGhiqf/MWB3oR/N3EQCA0fVf49uwewjtDwjXPbNa
         5CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705406388; x=1706011188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drWSEzWzgvfy014y12sEQ8J9AAejreZknCJI7GLECrw=;
        b=ITOBHRiaDZHyhC1KcNjJIqmJ+xaixL+uvajB/GsylxQwqPh2f0MnSknD1VFGFla2x6
         t+LnEoW0WilmzsnefpvRaK1tQwhr+KSXGPDliz+TGZ/FHC7+H+m+A8iPop5Z3v50Ytw2
         276xMn+SvJSe0HpJA7KtJWhD70Ltro8GTYtoeaYXF/tgz49nQSGKHhksizSwIjejk6jm
         Mt7BvwZfNgvcWmij39xjhXNBlU69dagAdMPkKSpM9bIF8AOfzec41XiLM3ttNr9rsPQA
         LEzgQnmBZTKlN0fkhsLgML1CW+edwIUXxIUbaOu0m0pcjlkHGuCHX3Jl120fqK2itxI9
         ab8w==
X-Gm-Message-State: AOJu0YydKaT9EeOIPyvJc67pJhtM+0Eqkpo8+MsM98UYQvOPbCoaP5GE
	YHa/GAzQcDpAHF3lC65btxYBsppYKEU3OQ==
X-Google-Smtp-Source: AGHT+IHohsDkjXFPezd3KG9iae0UvIRUUnet1VhGV7TAHVwqSnsmEWYpV617yZXjuElXsJv5MQV+XQ==
X-Received: by 2002:a19:654a:0:b0:50e:74e1:2e35 with SMTP id c10-20020a19654a000000b0050e74e12e35mr4888067lfj.5.1705406387610;
        Tue, 16 Jan 2024 03:59:47 -0800 (PST)
Received: from [172.30.204.234] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f3-20020a056512092300b0050e7a2be0f8sm1724362lft.191.2024.01.16.03.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 03:59:46 -0800 (PST)
Message-ID: <414ccee1-110c-4d24-ab5b-38e471dc50ef@linaro.org>
Date: Tue, 16 Jan 2024 12:59:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8998: declare VLS CLAMP register
 for USB3 PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
 <20240116-usbc-phy-vls-clamp-v1-4-73b2da7691c5@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-4-73b2da7691c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/24 02:08, Dmitry Baryshkov wrote:
> The USB3 PHY on the MSM8998 platform doesn't have built-in
> PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
> via the register in the TCSR space. Declare corresponding register.
> 
> Fixes: 026dad8f5873 ("arm64: dts: qcom: msm8998: Add USB-related nodes")
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 2793cc22d381..e21e5693ba1e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2174,6 +2174,8 @@ usb3phy: phy@c010000 {
>   			reset-names = "phy",
>   				      "phy_phy";
>   
> +			qcom,tcsr-reg = <&tcsr_regs_1 0x6b244>;

This leaks outside the syscon.

Konrad

