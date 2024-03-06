Return-Path: <linux-arm-msm+bounces-13514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8259873BAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 17:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B66B28B05C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 16:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7B013792C;
	Wed,  6 Mar 2024 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZwh0PG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA431361D0
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709741100; cv=none; b=rmV+BwcFdj1rda2yRLO2gwIVoLqJgxSZTFTKqhbD/OxzSRPUayZedOp2582/M70JV/jjQE+SIctw3AH7SQFO7A+WO8iWc1/EeP6K00iHaMBYuPL9BGZL5VkMoapPDFaLhYSke+ZTyTe/iezudGcrpjz6r7AP4qFGV2YhiC6oHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709741100; c=relaxed/simple;
	bh=qJqn2t33ziNLqJaNqWLQR+RQUrZJ9Q1Wg9M0G2Wujow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3gIJPdEqmb2MxBxuYUGraZxstP/DbIcRPOJB1Ia9kHPwVZTyMJNWYkCBAiqEA9db8fbd7OthQHAdbVPXFeOirvoTHyvsIoOC7/hlv8hsJFXtKok9qKJ0/lBofoMtdRU+tUsd98Suk2HnVWNmfJwa6rNTmBgnodINNGsb+VZsCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZwh0PG2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513181719easo5148215e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 08:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709741097; x=1710345897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3Em7UItCjPwZRzaG7YmB02NOB/4tpF64hDrpjvvxgA=;
        b=sZwh0PG26VS7UKngJSw2Z1uLDNorlfJBfxPqWrHAW6mOVf9ckj5goLxNWU7pwiHdj2
         gdOdAKGtFwtSq2Z2bkHljARguo/6aO4dvHcuctdAVC4lPCMmqcBCm8thjURL63svTyEm
         wwd1RRJh3BBLLy9+lDuPk7BlrQQkB4zCPwjLo0yZ7nw7S3TtbTK4khUSDCjnnV1hvacT
         HKLLTaob2W++ioe7iqsDBswtW13M6u/EGYFkKInf+HADpmPf2oOwqsnes8ChBsceJJ9k
         U4Z9hnEyFUzPwU8oGGNlRpxhRyUPpRo9vHxw+Yu/0Lc040/h2ZBWiaw6yXYeRAac+cRN
         AuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709741097; x=1710345897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Em7UItCjPwZRzaG7YmB02NOB/4tpF64hDrpjvvxgA=;
        b=wnaw3lZJsaOCLy+AbP3nfX0Gb9SiMwmhOBI36ONu0829i0fyms6yYFs4Yjym8jyzcN
         rFhoiB8NP+4BqdqKTYS2TCP8VMhxGW0NCY6XKAWx8DcfN929WXmorCLlyU5ISmInllgF
         /WysQjhPxeVxy73eA04EtlBVJSKFRCYZJmci8c7NkyOpDUjqXxnHgRwSzh1hlr+FtHG/
         Bty9RdvVWu2HhqKWvab0Z6aTLDT5xVmPDB3n5E9aie6mhW44JjQf0g8iR0/hyYGczTOc
         O+LqjYjs3Td8YptAqIqY6Bcsp1zI31H8GOyYL/jQetLSP93A2qb2Bk2paBQ+siveE/1D
         GOeA==
X-Gm-Message-State: AOJu0Yyq3t+VIMZonadRfmEsTwRva3sO4kUwc47AIlUhbwPB7QNJ8E1i
	q5rcHbVO1SL6+RmuZoIFXecfW2jdGczWab0jzeOq9goPSmcPMRJNWfyGphHO9F4=
X-Google-Smtp-Source: AGHT+IHVjIGcEqPTmvvZBQtsS+b92ouhmaVQL/wERCVqJwHl9wVNWdOOixJygjxv2Ll+Vjjs6MLJ3Q==
X-Received: by 2002:a05:6512:4888:b0:513:6108:60a3 with SMTP id eq8-20020a056512488800b00513610860a3mr1264269lfb.45.1709741097177;
        Wed, 06 Mar 2024 08:04:57 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id cf10-20020a056512280a00b005133fa4bc1asm1756818lfb.211.2024.03.06.08.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:04:56 -0800 (PST)
Message-ID: <4bd2e661-8e1e-41ff-9b7f-917bb92a196d@linaro.org>
Date: Wed, 6 Mar 2024 17:04:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] arm64: dts: qcom: sm8450: Add interconnect path to
 PCIe node
Content-Language: en-US
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 vireshk@kernel.org, quic_vbadigan@quicinc.com, quic_skananth@quicinc.com,
 quic_nitegupt@quicinc.com, quic_parass@quicinc.com
References: <20240302-opp_support-v8-0-158285b86b10@quicinc.com>
 <20240302-opp_support-v8-2-158285b86b10@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240302-opp_support-v8-2-158285b86b10@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/2/24 04:59, Krishna chaitanya chundru wrote:
> Add pcie-mem & cpu-pcie interconnect path to the PCIe nodes.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 01e4dfc4babd..6b1d2e0d9d14 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1781,6 +1781,10 @@ pcie0: pcie@1c00000 {
>   					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
>   					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>   
> +			interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,

Please use QCOM_ICC_TAG_ALWAYS.

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;

And this path could presumably be demoted to QCOM_ICC_TAG_ACTIVE_ONLY?

Konrad

