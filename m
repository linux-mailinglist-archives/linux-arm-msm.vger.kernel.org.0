Return-Path: <linux-arm-msm+bounces-21873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D97B78FE39F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ABB3284601
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD0717F4F0;
	Thu,  6 Jun 2024 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAY09Tb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C117F4E6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667797; cv=none; b=r0b0Rqe6xjzHrZVAjntmI6sGWqrTe5Dbw1pV4K6ZgKLDf/K/qzDyljwn965Lh/5OqkQV46xXPGQKfJt/mOKzvLIqNDPL5YjLAFFdDWzbYgPwIjGT3CXAOd9cMd/oB7MuNotHnBN4FWKAvWveSnWY5SqJXL+LQ74TGA4852yA48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667797; c=relaxed/simple;
	bh=sj8vzD7NOhy+claRmdekzWZavh/1G4/bMZrzTLq/nRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHR3hXrCwzkIHv08uEV7vaL9tRLHx4zyRkxjnqRQXu667hIEDyeR5MyLlqnDKrip78Kd68vT6Bo8Zo+yFGiJMHJpm6Ec9Uvebua9XDjqem3mlxIrltp2/+ZGPDZZwCCZypkLeSYRNWb4TDkBrqpzX983jPDuRlkCziO3r0gXh9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bAY09Tb4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a68b54577aaso83094266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717667793; x=1718272593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q6FdkmT4DFdyuA/nJhZdLMgbso+NmWKDxfZ7lWlQYA8=;
        b=bAY09Tb4NFhuSK+deRQVRqsm+e7trcE8jiD/ev5apDlyTFm/2LgLA6AXh6zMxktp17
         wv5St14QakA9NfYAa8Ei6oxeT8hcTCIl2QmdsWYGE3t9fvaRWUEyOPOio4AKei5RAVoB
         N+RD9/134kmgz8drJvNTYQ1YDknZSdUfCaV6kxO7lFNyAb3CwIifPUTG0+c4fR50clfN
         spPHFHCDJrp5iURQwdyzmWWo7pylNfIEsZR4/9rW9KSaQvNguunOhKtV6qXG+taCLsTC
         7FnMX+5KMsaKu5SnG67YhQKud4y9tqKvcXGeBd+t/WpbHFIMCkhLxyoaZIEQi96k2Pj9
         9d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667793; x=1718272593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6FdkmT4DFdyuA/nJhZdLMgbso+NmWKDxfZ7lWlQYA8=;
        b=RGKZni+k7NufTRtNrguuPZKQBk6wI7lICXpL/YTTn6zccFRlYV6IoqyMDpxRiokRLW
         8II2rQP91ESSlv5p7nHu6jSVPuJC9tZr5nHG1mX4aS45AgdNWZReNQEbmEcX6ZIbcjkk
         u5grs8wziZqiQlWZrWHSrgd6G/xn+Tzo00OtQTiISfaP2PYS/S8u55xyG87f08HPCx7e
         Gn3DaxTnnjiV/YNr8O99tpZ3g1Wytz6qlsLKb2LCymCZAR1Jyyc3S/2Wlw9wQZpzMP+D
         acNmPiBiGJifMUdiZHRLRVnXUD8b5YzhbfTzmUX+aFs21/3gpxJj5zPMCIAXIEB/zua+
         gc8A==
X-Forwarded-Encrypted: i=1; AJvYcCUrBXlNarBOR8ZIP3RjP4MXnFrKNN/fd3xPgfEjr0bcYF2YQo7jhn8Up6u8hybKvctlDXwd6VenNJZUA5D0CxJe4cFrUV45bBuZKe4eYQ==
X-Gm-Message-State: AOJu0Yyw5YiASGpoLSTgXA4iX42xA0ahQZ7d8drwndn+nhfd9ufu/j0x
	WNSVUEdyBVZtC1jyukV/fQE7g5tXPeQNz2Exu/f+9cPrKypDi+3cs7G7U2oMmmw=
X-Google-Smtp-Source: AGHT+IGifyVW7fe6ghb2pMUwo5R9wL/uHIVW6JK55HBCyclDKc2AMGF5C+7U7bfEkgY+1FECAlE05A==
X-Received: by 2002:a17:906:2a4e:b0:a68:a52b:7554 with SMTP id a640c23a62f3a-a699fdfef46mr274087166b.66.1717667792592;
        Thu, 06 Jun 2024 02:56:32 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e39bsm72204166b.162.2024.06.06.02.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 02:56:32 -0700 (PDT)
Message-ID: <4ef1d9a9-6a0e-4324-b6d5-2ae225855b03@linaro.org>
Date: Thu, 6 Jun 2024 11:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: x1e80100: Add BWMONs
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 djakov@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 srinivas.kandagatla@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org, abel.vesa@linaro.org
References: <20240604011157.2358019-1-quic_sibis@quicinc.com>
 <20240604011157.2358019-4-quic_sibis@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240604011157.2358019-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.06.2024 3:11 AM, Sibi Sankar wrote:
> Add the CPU and LLCC BWMONs on X1E80100 SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 169 +++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 1929c34ae70a..d86c4d3be126 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5329,6 +5329,175 @@ cpu_scp_lpri1: scp-sram-section@200 {
>  			};
>  		};
>  
> +		pmu@24091000 {
> +			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
> +			reg = <0 0x24091000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&mc_virt MASTER_LLCC 3 &mc_virt SLAVE_EBI1 3>;

QCOM_ICC_TAG_ACTIVE_ONLY

[...]

> +
> +			cpu0_bwmon_opp_table: opp-table {
> +				compatible = "operating-points-v2";

I *think* if you add opp-shared here, you can reference the same OPP table
from all 3 BWMONs without anything exploding.

Konrad

