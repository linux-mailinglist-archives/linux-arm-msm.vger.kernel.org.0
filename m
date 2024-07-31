Return-Path: <linux-arm-msm+bounces-27541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335AD9430E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 653081C218E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760A21B14EE;
	Wed, 31 Jul 2024 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZEP2s1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BBA1B0113
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432716; cv=none; b=M+JPeIxWeTU26Kw7OHXBPvhM/si53olZ6fpKIxWRUCJ0AKBf+I42Csorajv+FqFeHjE8W/0BCY2OV4ksDjXNVa90QDPAJnvtJa0jKFKP1+ewaUtMX0qCVUKnzyZiZ6tnMvjNyDRvdKWc+4aGbp5Dw57v44mKa43bCBkU6ZY1gfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432716; c=relaxed/simple;
	bh=P2Zc2kRlUTzQWuiLdA1pFWHC6xvaH6zfnCz8JHSEIs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBYzhM4th9lq90soo8DQ+8ExXbvKUudFXzXAPqxI/QhR/ggTyaWlutbRCWuVUs+uOy5LDCPzBlaKh0SZJrlSTwPZS8uDpQP0ylle47N4x1FNkIDYoIBx/Vqc3ZhxQzbWLn5y/lruxkd6yrSVytYlY7FgN6/VVEla2nByDxdF7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZEP2s1J; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f024f468bso8532416e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722432713; x=1723037513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu/jrHV9aX6kTVP3aSVpeXFR1odPgGfcDv5EihSzkVY=;
        b=wZEP2s1JDOHjfRaoa3j1T/vvA/AMIAw9Byv8YAx8c9708Qk8BjIjIdnL+1nYleLwDo
         hXNGL4VoorUaCgD/5kQNDjf7S9GMUuvrPQMeQvI8USqBlmgR8y5ywkPmGfouP8tBOYRS
         T0T8o9yGlLP3YuFjWXDvpzYzETN6wOHBUO1F3Y1DU22JdVGNm7Uh070c0Ksa2Huhj9zA
         eXvALTbveik9vBeQPxJbXEtkHRWzlN/whkwGWp09rxRHLFVpx7f7F5Alou2+Gra2/r+A
         ihZZOgzffHWxXRboxaFcqPsp8Ajn2Pk+iClxkAV2V7hhfal5SoraVk+4gpXX4JlnkP+s
         D6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432713; x=1723037513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu/jrHV9aX6kTVP3aSVpeXFR1odPgGfcDv5EihSzkVY=;
        b=beTrvQC81KG0elbv1FPx52fGbt9Vq6UVV3vFl0ynqPq1JaHhO+NKz2Wi1b6xwV83dl
         NFpzYTSPRJiXD0afpNlIHI1pllj+YJemIVbP1YLayFXxVK74OCb6G6yPtl6+qhyF6OU2
         uJdZ3tvNjfoFumlDvyIJDp+tp8STlkLCY7zGJ16N9HQptr4BRybGuKNu+0x8WaXwBakk
         ioL6Df+ETziNWtlQD3B9UxBageM9mQaob0yEc4TF+ydPK86yPKqvHRGnI+3hYge1Ljxx
         hQmWtYwMakA3q47zzMzwo5MGQzCLsI1G4z/3HwrKZCeE0nAJsNIyqJVtsNJjGky9vw+A
         8/tA==
X-Forwarded-Encrypted: i=1; AJvYcCUXT2kyDhrf3YwZx4byl96/RDud6c8CMBA+50BkBWAh7gl+THUCk9rmTJCOZ/+oZIZh1ms4VSNZh+0CNB7pDUioCB/ljyE1w2SKX3PDgw==
X-Gm-Message-State: AOJu0Yz3H/HVwItcH9yOtuBgprGSszMiglkk69pzbhVo9IOYGS8f/y+x
	ohn79d/W6iw2dQyqSOJtPqJPLOUUU8nrvAB4hOpOJj4wjx+ZWaoNQY8IT4xwIs8=
X-Google-Smtp-Source: AGHT+IF9yysuesy1AWwQPiU83pnAbyqHjqnagriUsXCkmX5PJrirOfJMTi1oEuRwoiTJE5k2d+aUKA==
X-Received: by 2002:a19:5e16:0:b0:52e:7f6b:5786 with SMTP id 2adb3069b0e04-5309b2d9ee6mr7399994e87.61.1722432712551;
        Wed, 31 Jul 2024 06:31:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2ce6esm2242763e87.267.2024.07.31.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:31:52 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:31:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH V3 8/8] arm64: dts: qcom: Add camera clock controller for
 sm8150
Message-ID: <dlrkizo76pr57f5ijdxb65u3mz2arfs376cpalpv6j6aphmk24@4f6mrbxujyke>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
 <20240731062916.2680823-9-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731062916.2680823-9-quic_skakitap@quicinc.com>

On Wed, Jul 31, 2024 at 11:59:16AM GMT, Satya Priya Kakitapalli wrote:
> Add device node for camera clock controller on Qualcomm
> SM8150 platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi  | 13 +++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> @@ -3759,6 +3760,18 @@ camnoc_virt: interconnect@ac00000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sm8150-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>;
> +			power-domains = <&rpmhpd SM8150_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;

Is the required-opps necessary?

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,sm8150-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

