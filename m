Return-Path: <linux-arm-msm+bounces-33297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF93992182
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 23:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A81F1C209C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296FB18A6D9;
	Sun,  6 Oct 2024 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="um5kB20S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695715D5C1
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248562; cv=none; b=k+bc+cEIX8HxieyfoAxAOF1EePyW0bbprqy3mXBrHGbv+oj8O+iY/ZGAefE3/mLILgiuZ2ghIFm0H7lImhWuZpdhmy/zQlqTGRvIydY1pHkkOZIKDLdVY/eQiobThv+JUBgDUSqZwG2/QFUqGCZ4jte1ZzPdZnSYcJdNw5rOgiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248562; c=relaxed/simple;
	bh=dAbVOxdQqCm8mv/96yU0Na0EijMNJsf1dvg2uDZi2+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h16a/K5EUvDFLKFil0jjnGdn8/xWbkNNqKImztbLn8XLFwPwQv+YNNiJyVmd3qtJqI3JwA1Y4/Lj4d2BoHksadDBixvq5JfqShGBNZGibqkNbo+2LJsg7H3i0Zt+/I0JuJ0qexw2r0fRQ8s8PxIzaCdgI7CGUTLtZCTgtjnTY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=um5kB20S; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facf48157dso36703271fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248558; x=1728853358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lynLjUUVCJ8oEu4eKZtM5pzs4MW1eckvdHkHFx5u2VE=;
        b=um5kB20S06KPDT5TMesSF4AFBKc4iluG3p7i+qJUGfSL8QfTBEKrk8gpWdsg6z/Zoi
         uo0KPdLTaYP98SotDaJeHOT27XTLO5GNM+sG+vulOkVS15Y+7n4Ye8lIfmPru1bnJSHy
         mOo8768S9AOS6IDvXjWVD2hrshKdcOMevvelXTyGzcuPsbT6RvDr9uFQBNurD1Fx25wF
         MgCMFL9Ekml/Lq4nZSTI5QqgRFqj7KBs8uAe/mZz4dDMEq9adCmvpOKONiFLRht0ftzS
         XOrwgAbQOpE+FSJOYUS+IqHP7hnAhbc4MWUZKiq8tx2lx6Kqpze8qYICuy4UjMZRh3mC
         Bo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248558; x=1728853358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lynLjUUVCJ8oEu4eKZtM5pzs4MW1eckvdHkHFx5u2VE=;
        b=d54SrkSgmL7AM4L7yidpjwXJ5D6NoZIkT5G6z7T4B58t8/zpCdHtwCcLIk4q50G952
         vdiaJLi8Y7C4WHQ+Ik/P5sPWgvYiBfqwp1oez4I8x96TMBhnflYFAI2krQqtX/HWIDZe
         Eq4tCaUUjRq3mlL5bhm80d0Paz+gTMDtRPZD5S50mgvwEIo4/owIY+7XRQu7tDjx1Ls6
         NffKcNrG/8BIbPT7Zf/fv6vYWey5wVQMNYkWtowxuPxz+//xHbAxfTdH/qbmils1cJN0
         CET4QPlhfEDiy/n/ShotZNj0soE/3uxAbA0P87vV6BbUfEOZttwZ1Yo2tYt4t7YhoEAZ
         AqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg04MugtUYKdIL+CQcrxWAvKlIKUNtPhNLKgQ4nO4B6LtM+AtPOlQ5FPRG5rRnCUoe6qZ5B8ip/PwNy/zG@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFZKFZYAQ3OEefCNAw/JU57mVxzRY9C2HfiTuf9avaY+Bw39f
	mAmf7nHu98njLbjHBI8OTrpuZcs3YscGT0863DmjYFKgZE+c5U66YdbaQ6yqfY4=
X-Google-Smtp-Source: AGHT+IFFj00+q6BdFa9WcGxhnhgqWVN2SHPpKlZCg6I21mgHAY+UHM5dizBi1EWjcCuMRwvPPHmQgA==
X-Received: by 2002:a2e:a543:0:b0:2fa:bb5d:db67 with SMTP id 38308e7fff4ca-2faf3c64d0fmr42209631fa.32.1728248558469;
        Sun, 06 Oct 2024 14:02:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b339b0sm5928281fa.124.2024.10.06.14.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 14:02:37 -0700 (PDT)
Date: Mon, 7 Oct 2024 00:02:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3]  arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Message-ID: <p75ivby5ajlmnvebqkn3mq7t5xh6awewjwkwpa5rjiqv2ijijl@aqemqgxveu55>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
 <20240929112908.99612-2-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929112908.99612-2-lujianhua000@gmail.com>

On Sun, Sep 29, 2024 at 07:29:07PM GMT, Jianhua Lu wrote:
> Add wifi node and this wifi module is connected to pice port.

Could you please add ath11k probe messages to the log? We might need to
add an additional node with the calibration variant.

> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index ebea283f56ea..05a71462325c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -680,6 +680,23 @@ &pcie0_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
>  &pm8150_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio6";
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry

