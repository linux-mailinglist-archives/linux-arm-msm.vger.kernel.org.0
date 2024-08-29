Return-Path: <linux-arm-msm+bounces-29891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463A963A25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 07:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08D8285CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 05:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E56E15575B;
	Thu, 29 Aug 2024 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbOeQWsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C58382D94
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911046; cv=none; b=TzVDD62vF1OC+FLelj120A0O+dusrJ2PWSuMzk6NuWX1lxBmhCmQy1M0NES2syVGubvLs41dF2Kr6DHwLwICVCpA9HxH3QN0yyBF4bERUFUKj+4JvNBR/ttIdj4Dcc/unTsox1m+QtP1wTEtDu0PbKSYCRXIOL6mdZkiNvTOc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911046; c=relaxed/simple;
	bh=dHjnz2UzSLfwh1FR8aDWFAa/de3ziMwtFVKc+1uy4S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FazYRrcLkkM81DnRl2sB7mfL106josEoIYXBJ/iQxXzh/HIq5xfhTAlWZQGVcX94b7kmrPjjzVyJc9R4MeOOp9B2OVNpwZVrN7j5dd6d/TZdeTDRnHjz2qdwOgca2NYNXV2LhLW6BBj2bLkJXfBJfQPvw5clEcvmfbSfzyz85tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbOeQWsP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334fdabefbso1222109e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 22:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724911043; x=1725515843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vASjKIj/XbShQ3oRAfqq4CjpUQYKAt498Y++gSmZqU=;
        b=WbOeQWsP7SyHsxiyacwFv06CQ4JNqQ0nkzbEM+jW1U7vaRLy5D783zGoU/8j4wmbCq
         gl04R532YijHMj/qLrgH40bTT9DFYEtFqlo0hiE+CgvWYk95S+d1Ag+fh71tXIZKCsGJ
         /ARer9G1pCvUCGjYAI9UatcTJfIWuw8JORQkksFN0ax3m6XakDC757RUmXe4anaIFJ5T
         /zjUqfYBZgcx93XuonOUVBIXI+gFAUpyqt9J6hwxfe3CwG2Co1M5IwHlPVap/Hi+38/O
         cAq2LPCb3er9N9pGOSeVSHmOWYunE/FyESEfr13x3c0+FibX9PWlSQVaE0/kvPmsOD/9
         B7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724911043; x=1725515843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vASjKIj/XbShQ3oRAfqq4CjpUQYKAt498Y++gSmZqU=;
        b=wUBXdCZPzqhm5Bv934xJuC+qWQ1dmhV5+xrBCaoxcfObqe64Otu5r/bT9YjG6LIHo3
         8hP05wH+xd27eAPNNmGFzkOobRlOraYPOPPl/OQ2tIUYHtfHpy4Ca/1ijXQQ/1AlELoE
         YwKHYmB0uJb9ZI9vOv4q5FZEfcsXJT04fnMto4DguU6GVOmxMqBknL9bMWCCFQqpmOK1
         QURHP54iYSdUMQFtY/Yi8R0EwuRUC3d0VU+CkfaSE6xssN/KzsBx6GMYrNXqBCKzhyrn
         Nh8CPpkPblHoIpvvZ04xD7zeuKd33j+/cjbtO28GYO/O8iQKAEn7mUP0Z5855Necxbji
         TwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOAIWxfm5kb5hwm52RuikFZWBPJTX3UH6U3w51T+Dlja8uAINdh1w9AOiJU16Rz621t/xFmbsGUdJnGH2p@vger.kernel.org
X-Gm-Message-State: AOJu0YwtqBBslvfmbTI1HOhggr8eIUq6rw+yOAmWoLCG9tVlFAzmuPxr
	g3XtjOu+RIzLWNVEQ09M81QFo+MKHEc4PnR1Et1gCwEHmddtPjtohdmZZNm/5do=
X-Google-Smtp-Source: AGHT+IGp6B4PARu5DefP0fh+oEmkjIvpMlcIls1wS868UOLPrl34GguF+KwFIE4+MKTA10hqteoEQA==
X-Received: by 2002:a05:6512:39d3:b0:52e:a737:2958 with SMTP id 2adb3069b0e04-5353ebf75b1mr338516e87.28.1724911042131;
        Wed, 28 Aug 2024 22:57:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540853739sm58251e87.289.2024.08.28.22.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 22:57:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 08:57:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: ipq6018: add 1.5GHz CPU
 Frequency
Message-ID: <xmqyp2rgd3nozuiqu44iwidjnnwsidls3mxaqhmy3sshd4nok5@n552fd5tkjoc>
References: <20240821101025.858961-1-amadeus@jmu.edu.cn>
 <20240821101025.858961-3-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821101025.858961-3-amadeus@jmu.edu.cn>

On Wed, Aug 21, 2024 at 06:10:23PM GMT, Chukun Pan wrote:
> The IPQ6005 SoCs and some IPQ6000 SoCs (with PMIC, no fused)[1] have
> CPU frequencies up to 1.5GHz, so add this frequency.
> 
> [1] Usually the SBL version is BOOT.XF.0.3-00077-IPQ60xxLZB-2
> The old version of IPQ6000 did not explicitly fused the SoC to
> be 'IPQ6000', and fused the CPU frequency to 1.5GHz.

Again, more data is necessary here. "some" doesn't look exact enough.

> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 1b584d9aadd1..33062417781a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -140,6 +140,13 @@ opp-1440000000 {
>  			clock-latency-ns = <200000>;
>  		};
>  
> +		opp-1512000000 {
> +			opp-hz = /bits/ 64 <1512000000>;
> +			opp-microvolt = <937500>;
> +			opp-supported-hw = <0x2>;
> +			clock-latency-ns = <200000>;
> +		};
> +
>  		opp-1608000000 {
>  			opp-hz = /bits/ 64 <1608000000>;
>  			opp-microvolt = <987500>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

