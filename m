Return-Path: <linux-arm-msm+bounces-22547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0521E906526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 09:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FF02858FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 07:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3221913BC13;
	Thu, 13 Jun 2024 07:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZDamMbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2637C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263959; cv=none; b=Y8BQo7cFNXXfw+QBHpzLMYXj8Wugb9wWwAcNZQlmdQoou6gsrUPDvKHiYzeAZnL4aN7EoSGQwIay1D1PqOuc/uNfsvKOW11R7EL0ge73DoXf/LN1wkKoeZKKASqEJZZwmgy6BbMyf+iEgmv5ZiVkYHL37CdQ3xU2nli1sjySSzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263959; c=relaxed/simple;
	bh=u8dFHsOb+n5tt3CZFYcAB/jVglAgN731zurewAVdx0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh2nYxtl2ii35FOJ1uwezf2/J67vBl5CY3eob5P4Xq8G29iwgn1KjSdnXfs2HVYcc17T3x6m/I1KF7K+JESrn/TJ7UAzSwyPBNn+IOkauxFBroaEehjJMfuzg9qgfJq3QAR+/CLFHehBN0k4zVmfaJy9eRSJyVdegn7dXj/N69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZDamMbx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so884955e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718263955; x=1718868755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9lYXzPXZMaAW7Pzfh7pF2iRlL0MchImodSzO6gxB6g=;
        b=TZDamMbxIjFXKLcjEdKha0ZrboAhVh36R4jn1R/qW3GB8ZbzpG972/jzi8waT95CK3
         UKQAfpG+pxZrKMtbdKadgzYyAf/RDkeEfDn+JNhZUr20am2YRokToY83usgy3VLIGJCG
         q6+mNU14TalgVm1FBhNF5DDgGnntoRQfiFeXw0B3kMFXex28LpKCfvb5sOSLEdwSHpMm
         hmpFT1FI5RAhPTWPJketRcZS0RD4eVPThCYnjGIJfjcMuKJ9gorOK6HsEMDBeiF+ZOqC
         K21F/5GGlVUSndWIaW+Y94J+vXZylb+LWnKWzQn1lXxJG3SsVp9c8qm5J6DMizvfA+X5
         ifkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263955; x=1718868755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9lYXzPXZMaAW7Pzfh7pF2iRlL0MchImodSzO6gxB6g=;
        b=eORlJxihXICD1qcbRF3fkIvNZ4K+S3Mhfqzc/xQrsxhFMMrZmWwU3LVf23JSz5EWmf
         UK+BUQgKjGEbDorWRXql0mtGoMK1t0zIftIPYEMOvYAofHCUD4ZT+Llx+5hSMBDEYhlN
         AB+QwLOhNtqzhhvqbBdQtzHG8csf/a5F5Tjr1UIO8E9u/B5WnM8NlEe2wKaOvKrW8IPj
         hMt6XBXfDMGpX6CtjlGakWLsTkhouwdCmgVl9Nl0Xcy7rcJxn1c5j6fr+pJ+Rgpv++qF
         w8VVL78VfbWInXkeDZOnQO8sXViUHlGsQdVyOXYjhqy9Ug2x2Nu9WmGhcV6V/tqw/Tm+
         zDIA==
X-Gm-Message-State: AOJu0YwDRx24C70PFGq2Hu+TOCJGGtYFACOyHoucZndgyiMiUVfqjDLo
	e9Jec6TWkvso8JKPMiCEOuP9k+lbCCUBrI3gp3CqyjXjGUx0eJp7kYtYKCHdN04=
X-Google-Smtp-Source: AGHT+IHFKgHKnJZHv1pARs3XIGRKYF142lQVvfMXrHkeRbdBvkvw16ECYK5x8Pv7YBBp4PaLU0bCEw==
X-Received: by 2002:a05:6512:485b:b0:52b:81de:1127 with SMTP id 2adb3069b0e04-52c9a400d40mr2092266e87.50.1718263955555;
        Thu, 13 Jun 2024 00:32:35 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:c71b:4253:8a9f:c478? ([2a00:f41:900a:a4b1:c71b:4253:8a9f:c478])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282567bsm114153e87.54.2024.06.13.00.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 00:32:35 -0700 (PDT)
Message-ID: <1a533ec4-46bb-4e52-b552-69eaad0a2ac1@linaro.org>
Date: Thu, 13 Jun 2024 09:32:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qdu1000: Add secure qfprom node
To: Komal Bajaj <quic_kbajaj@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 inux-kernel@vger.kernel.org
References: <20240612063424.2494-1-quic_kbajaj@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612063424.2494-1-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 08:34, Komal Bajaj wrote:
> Add secure qfprom node and also add properties for multi channel
> DDR. This is required for LLCC driver to pick the correct LLCC
> configuration.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
> Changes in v2:
> * Minor correction in commit message
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
> ---
> 
>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 7a77f7a55498..d8df1bab63d5 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
>   			reg-names = "llcc0_base",
>   				    "llcc_broadcast_base";
>   			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			nvmem-cell-names = "multi-chan-ddr";
> +			nvmem-cells = <&multi_chan_ddr>;

property
property-names

Konrad

