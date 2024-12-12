Return-Path: <linux-arm-msm+bounces-41863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A09F004C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCA051883296
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7421DED4C;
	Thu, 12 Dec 2024 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="jN5nq/1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2241DED52
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734046878; cv=none; b=MCoL1Ojb86o2DgT9Bbqu4OC8fItsDu6n9BWuSrU9Nid0M7Viao3BPIA8OE5qLL94BAHkj43UmSMV9eiUbemH5mRbIxr7hIeSZH0+wSS4jItonLmfqcpmoN+M/G3qgUY4gYpws73dVAe5EFnJ9O01b0LgZhzbzzsVRjOU9qXplXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734046878; c=relaxed/simple;
	bh=uo69gfTytQ6yIr9T72Tc6iDBIQ20HuW9Y/3W8/4tbP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrVeR7TI7Org+4vuCE/uinVcmDLywQYw7KtpAMwyFDli9XxPiuVnpwNkj0PQ1UxPYujMwTlnzwi4f5fm1YAWsROBo6+YktXmYCOLiX48dMIYVGRG7UIgAwXtAW7mGhSh4liG9cdODgUl6ff8q5ySI55yx3fgc3/0IBPilGoCFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=jN5nq/1K; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so1415244a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1734046874; x=1734651674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQsjfPrdG6gSl8+g1IXqtV4/ePn8YOONjGA/mW2bvj4=;
        b=jN5nq/1Kf/pVDwwhXVLGrKzhJY7+e+mqEVS8bAaz+XNoO35pFbv+yWsWyK47+XXFvy
         QgYWnEjD9IKVmkxgL1uu/zsoMDCMMkXUf7H6c5O3QhNE+q2f7Gy6gAt6d5JucYjcdHtx
         is/QKeLE4f010uUfMb+10cZr/MSYqW7FA17YkJlTreDdP4PwwOxftdNBKTBBsUoC3MZT
         b1yB/LfUrKC1ly2Lt17ftvfVuNkwzR76esfGZrl5u+ttd8TKBpOqextN2Pfshw52Qh4C
         nuDO7zsdSVFSCW7zYU+dPGaTBAxeYik0KJeM7dOppE4LGVU0o6XfnTHqh/KiqyJEAsKM
         Blww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734046874; x=1734651674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQsjfPrdG6gSl8+g1IXqtV4/ePn8YOONjGA/mW2bvj4=;
        b=Tf90X4QNNhjFAyhDPIkgqswFcMYgATaC2p9hjR1ehDsh8yfLIWlzARvgfGRb03G/VN
         v7qIpbTvCVfPIHGBuVByA95H/cxsNHCp34tdVUjGj2w/JFmvY/D9tAvNsrTWj4FqMfA9
         uHTmKggjWhwuRU85DT0GnTaSUug+qceFnxqkdRiRELZapbrIWsz+hKANl2kKGBDXJ4/G
         mnoGcGKyVFLVr+zeRwl2HK5Hnbv08G8wfE2/sSdNoVH1Cbh76rbtDgmu6WdyfEC+rxVM
         W5B/rfZVeEpQfmlk0rAU5AimBLx+LPkpZTVTdw4Ye23/pI3hIO8+tLCVOwziLMr+Qjex
         F5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfp5E5ZSuXP+Cp5B2jmZS9Hi8xm6pYrlotpl6kw5FpRq7KLzRXJThLCGzVdZGtYQLqbMEXMcWjtdjmGW81@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKvyO+dGSQ5O6AlmITe7ci0yv9Z+9C50kvIj6Y5uwePtlZJv+
	Cg92OyKeSWzfTs/4GZGLbA21BNZdob//7VC2GRaSh52wbjSY/zzpVTE02ygHSjA=
X-Gm-Gg: ASbGnctSPK95moD1RZEgf1fUpOTtmeo5uAH2EHXQvywfcQDzseInTLbT6vXXKgQl94f
	K1sOUg2gTJoIO7skwZIZAtABC4R0oYnK0A+Uhmy1vGSNCl1Rhn613GpHksWNYPziMIXODUW6jGr
	IYnvp6Ea24iWNoeq1l28tq9jyrsuZS2pMLjLGHSYHL3vGmVoFR1yE1lj0go68jf+fEBiiigGbQP
	kxOqbCUR6lbTKRWzzTyFxo3FGyt8XiRkZexDdu+3jVk3glKu8q0hfi6l13ihWyOy4L2d8h2
X-Google-Smtp-Source: AGHT+IG8jiuHMisDvvkyy3UgwKCCnkfWoSmnksn7Ht0vzvdz1jlagwGbDGs3xQpUujDNZUE23UYBMQ==
X-Received: by 2002:a05:6402:4499:b0:5d4:55e:f99e with SMTP id 4fb4d7f45d1cf-5d63c3405bfmr827334a12.18.1734046874368;
        Thu, 12 Dec 2024 15:41:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6964b7c64sm551544066b.95.2024.12.12.15.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 15:41:12 -0800 (PST)
Message-ID: <80df2adf-fc32-4f9d-b3e4-5cff16a179f7@nexus-software.ie>
Date: Thu, 12 Dec 2024 23:41:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix up remoteproc register
 space sizes
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241212-topic-8280_rproc_reg-v1-1-bd1c696e91b0@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241212-topic-8280_rproc_reg-v1-1-bd1c696e91b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 22:19, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make sure the remoteproc reg ranges reflect the entire register space
> they refer to.
> 
> Since they're unused by the driver, there's no functional change.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index ef06d1ac084d3205a149feff880f457822dca2b4..c97d1eeaf890f7ac2814297bff299c0bdd0ddd04 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2743,7 +2743,7 @@ usb_2_qmpphy1: phy@88f1000 {
>   
>   		remoteproc_adsp: remoteproc@3000000 {
>   			compatible = "qcom,sc8280xp-adsp-pas";
> -			reg = <0 0x03000000 0 0x100>;
> +			reg = <0 0x03000000 0 0x10000>;
>   
>   			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
>   					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> @@ -5254,7 +5254,7 @@ cpufreq_hw: cpufreq@18591000 {
>   
>   		remoteproc_nsp0: remoteproc@1b300000 {
>   			compatible = "qcom,sc8280xp-nsp0-pas";
> -			reg = <0 0x1b300000 0 0x100>;
> +			reg = <0 0x1b300000 0 0x10000>;
>   
>   			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
>   					      <&smp2p_nsp0_in 0 IRQ_TYPE_EDGE_RISING>,
> @@ -5385,7 +5385,7 @@ compute-cb@14 {
>   
>   		remoteproc_nsp1: remoteproc@21300000 {
>   			compatible = "qcom,sc8280xp-nsp1-pas";
> -			reg = <0 0x21300000 0 0x100>;
> +			reg = <0 0x21300000 0 0x10000>;
>   
>   			interrupts-extended = <&intc GIC_SPI 887 IRQ_TYPE_EDGE_RISING>,
>   					      <&smp2p_nsp1_in 0 IRQ_TYPE_EDGE_RISING>,
> 
> ---
> base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
> change-id: 20241212-topic-8280_rproc_reg-15c636427963
> 
> Best regards,

These ranges check out.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

