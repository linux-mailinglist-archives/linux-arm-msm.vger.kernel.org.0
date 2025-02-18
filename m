Return-Path: <linux-arm-msm+bounces-48416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C6A3A464
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744581889F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7D526FDBD;
	Tue, 18 Feb 2025 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPMWrvNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0A26F47D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899944; cv=none; b=nwkjoX/6Xk+cRF4gFiHTmaQ6jXilh4Ms3GSeqcZYIzrNM7C15RNSX7QGld6sgxlS9XIfl3vXwHUmK5/CO4TvWQS8bXZceRQf873+YBocxmH4o7kwvYn+jeVGmjyKxCrrM0RPc4L3xxfhhwcvGmZX3XHc1HF4xyfeuzXng6me36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899944; c=relaxed/simple;
	bh=4YRuBZLDQUyim+eVfx+z6hk8k3OtVqhP2mJd5G3ozRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKrrqB6UQDQLZc28JemEyBMcqQu3fcuocz8lyoMv3hzsefh8IGB1M+irMVLQRe8Vz/tn6lQApRTQCrK9t+YJZr//YubIcPic2eIb9sLOIT95CEXJJBLq/rIc58trlU7X3yPQO0RtWxoVNV+yjvh9RnuTg3v8qKdJMa0FRDNXNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPMWrvNO; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30795988ebeso60351521fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739899939; x=1740504739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXedXzQG5Wbyyq0jTams5IijNuTfQ87Imlxg0WuUfRo=;
        b=aPMWrvNOgawGj1rwMp9DbuVWIndn+4iq+Xy4tICsMrFuvo04wLh645I6ykv4iyKY1z
         fQjZLoW1AA8pJ+MAa6wWRwT4ktAIvQr73eP9lis9v5uK0gGnHNp90w8hDte3Prr0E8qI
         VMnxMpv6qA32cQlfUUqNbvouJDnAaJLpkyd0KwDZqkGjiuazKkmBiBQORtpU5cxkzvRH
         aSx1gk91emWeIp85jHV9LfyCtb9l+5AkIaAW8NnYno5Q4oF78rSY814CIu+rZrNm0bFQ
         z/xAKWuKNGL6CyaaY9Hjuw8gcJ0qmZFohvGTHVzKM6h8E8QDbLvaTJYgpFH4TbGMt4B5
         Agzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899939; x=1740504739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXedXzQG5Wbyyq0jTams5IijNuTfQ87Imlxg0WuUfRo=;
        b=sGKsbg3xJ/qA0hG3m/6G4sOejZ85QRxfOipsGDJ9hqEt/S/kpXTu6slE7bQ01tXxF2
         yCBLWfest7rDqg0Yds9j4mcgBQPrIrfna29V2UB+Un7S/HesS0713VPH4pEAM7KQ3/9R
         j0uxDvcky1VbirXrO3hShQTmrr5H9WLuVhaeUGI+3Cc7AtBwixB+PC3zQ7lt8v2fpzRm
         bcYdTI3DNjmIuYIYbHkKphpz9oUKySYANLGT+p6dR3AKr5j7+H45j7ttLXihjdAtebNg
         wQf1dFUa7BhaaiH8Vh9dILl12nJoZfDj4b6cg96P9ICtbqSMCvUikZjNFEFR4AfeQjgz
         obeg==
X-Forwarded-Encrypted: i=1; AJvYcCXdV3MWe5l9xLpMnbLGndx/K3E/mTcNfYbbE8t/SeMvRDyuuL9YGJdjNjYP+AmbVrEqC+FovjOKj4Kw3DPz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3XtlkQdi3jvB+/PtSeTp3QcFet3jsYUSciPFLDG+oOTR1HGK
	xFDyf3ynXE9szlFg8IVlMhBQS82PYXzoteRb6m6y/u/PnYeSL264nCylaZSenGkOeSamj4Juefv
	d
X-Gm-Gg: ASbGncsukNctuwyEAajdLLeiLQCakePEy+8YxVZP+MSjt3kD2pXrpTNkG3xRx72dfwi
	HwSsmzL6ORlKuJTvEA1hLG4LqeouZoojnovEuPt+Cg8rbR45zRsQALLJ3I7cg5RotpEl/SMYxrv
	UWjvX7gu9cr2+2kPelknn9KYenLaER7BpVRP8Nf+8u3da1uCWmX7DFi9rAMahhmHmPlfwWOAaPf
	SHtp1ZrZRrA/QbQEaycHIbb4vjeTvjHvSOso5fwowacPwWomxeBsgxY4yV8w9d1dqEnRVNq28DC
	d+8xJnAfzE2d6pfcesx9qQmxbG3SMX/UWH865dOCTvq30HBY4/XSN0mWn2M3zD1dVqbqVXg=
X-Google-Smtp-Source: AGHT+IEZQHb1Cbq6+Wc0+JU30WNtq8/8OAvVChOQXjRCoOixsaJ5QkA4bdoc/n8R7EUcEzdYXlMpRg==
X-Received: by 2002:a05:6512:b12:b0:545:6fa:bf60 with SMTP id 2adb3069b0e04-5452fe2eaebmr5379475e87.19.1739899939195;
        Tue, 18 Feb 2025 09:32:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461d4f2aa5sm960232e87.0.2025.02.18.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:32:17 -0800 (PST)
Date: Tue, 18 Feb 2025 19:32:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add MXC power domain to videocc
 nodes
Message-ID: <dprxueuq5avpv3mek4kc4sy2mddydsoskqgbizi4lpyapuhg4t@zcdgm2wcsaco>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>

On Tue, Feb 18, 2025 at 07:56:50PM +0530, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON
> to configure the video PLLs on SM8450, SM8550 and SM8650
> platforms. Hence add MXC power domain to videocc node on
> these platforms.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ++-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

Three separate patches, please. With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 9c809fc5fa45a98ff5441a0b6809931588897243..4f8dca8fc64212191780067c5d8815e3a2bb137f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3136,7 +3136,8 @@ videocc: clock-controller@aaf0000 {
>  			reg = <0 0x0aaf0000 0 0x10000>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>  			required-opps = <&rpmhpd_opp_low_svs>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index eac8de4005d82f246bc50f64f09515631d895c99..a039ae71e1b7bba8124128d19de5e00c65217770 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2889,7 +2889,8 @@ videocc: clock-controller@aaf0000 {
>  			reg = <0 0x0aaf0000 0 0x10000>;
>  			clocks = <&bi_tcxo_div2>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>  			required-opps = <&rpmhpd_opp_low_svs>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..32af2a0f7a0030f155b7d8c93faeffa384a42768 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3524,7 +3524,8 @@ videocc: clock-controller@aaf0000 {
>  			reg = <0 0x0aaf0000 0 0x10000>;
>  			clocks = <&bi_tcxo_div2>,
>  				 <&gcc GCC_VIDEO_AHB_CLK>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

