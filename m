Return-Path: <linux-arm-msm+bounces-39446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 681C29DB876
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28F6F282292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E151A9B29;
	Thu, 28 Nov 2024 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zyvz5NeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE8C1A3BC0
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800157; cv=none; b=CJd5LNKRj6kXtwcJWh/wQ9ZYdNgLw2357hKkrGkjQkBaT8tMiUqq21Pgbq4S13gH5X0OQ+mtEiIdewoIPL3JQqIVYpoO36w0mKLW/oaiQ9hDFL2f2NErB6hjo5sR0qq0VLeZw1bojy6yojLbi51QHVx5JMWHAztKKqSnwxBWWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800157; c=relaxed/simple;
	bh=Wrj6BNOJyB1/SD7ZTt8SzVwfNMLVUbl/Hb4ZD2t2L5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u68UG2QGcFzNFQjozCx2HBqz0mdb3poUJlEk5E9dL1d/xr3WFbcRsFudv54r/tb6id/p886ydNXXf0xpIYmMk2IoxA7SEpJ8IwUZrqCxiD4PIa8KwoiRA1fSotyEvZddAYTvObi6G4nY1ts9AX8Ar7bTC42RYZ+IpWxo/Cb/ufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zyvz5NeP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so8838611fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800153; x=1733404953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=34gZUZi5tu048lw280ahbLQ/y69l+6hlbhcpQA4G+Uk=;
        b=Zyvz5NePljV5VJm3r8CgjUnqs0j9OUKtyt1Sf815hgdfIaPakxbhawX+6T4zHdnpfo
         MQ9J0lBE57hTmql1sokUa/DeXW6biN/sEBV2O48EJDKcbhqouNzwDsorTl09X3py0Q9w
         r/lO2XWlBxZd2sF6UYJUpNFq/dO5gX58XTjiBQdO8YgQyWcaPiybA1pdkQApflJSCwuI
         /Q+fInJLDDtV9sLQrsTPlKyx7vP55F0U7ofRxb+tb8tWDcCp7fQ6LqNEGUPbFWF87ewS
         /i8s42/jyTGrnfAxstI/pzX0LdKaOHg5D+jsSXKF9J6u4PoQMkqQtWNZsQIMUl/DLXOn
         L8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800153; x=1733404953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34gZUZi5tu048lw280ahbLQ/y69l+6hlbhcpQA4G+Uk=;
        b=CVkseFLEgSpctPjKgukRktDElQYAwpBM1vRYZrblF3aGBcmPN7sNMZUfN6Szr7m0NC
         EkE0Og+RR7AwAtrIxjTxk47iEyH3xAP+wSWO1Lby5ntVNpM1xQFfngvaT4ieiwbXOncE
         5ykYOmA7zpBH+7L2YCV75pmx9lBG9Qrfo3DFxl5LCkA/VjwoVQ9PMn7V+a4X/MZUidgb
         QT1oWtzB3Az9+LE462e8VnxeFe+f4KgSSHQaWhZsOcp/fQc5gnTVDFRglps7ENszHSYh
         n+JFAI77Vo0krZ2XRoMEnl0Eb0DwFMA+Wl3mQ4ZUlMmbAkuKRMuDjYfRkchCWGXZSdF7
         zL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjDdFTdZALmuM4gQkCHnG2MHeZiu05sAATZbsxPERGrKRhmlfF3WCJvIckcKHiMTIRsLmwbFGthSgvbbk6@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzDvf2AD1KbRZlGoqYV/6GT1WYKntCKg/u9JsYZybBsdPtA8u
	T85I+eZkN4Q/xnIF0h2/tfeV90CW3Qfrd+1UjFxs7ND31Y4n/nYYA5U0Erznb4o=
X-Gm-Gg: ASbGncuA9MIvGijJsQlG1zz76uttxG0oLfDTOzKVB9hGSSZ+7Mncp7dk5JDIFmWj0BC
	6GYScQwbQoOSzsD1MysOWplltodBQ5RoxQbJ73LqGO2iy5TGfP6Dt+OXWkBqN7yWTne+VJTbS+8
	ignBeJojmHh5769jBj6EWIqtXuyhSYraoMaYuRJdgTPldWRjdmEry0/XObEJazL9VUmOgJ0tSLT
	4s1WtDgfz5kMUFo8BUtoLAv3DKKO0G85u0UONfpKFqfJnOPGXREXcK2zQU5QiIVF+QDgFpZ03Ed
	7/sp71kv95o67uyGmSvh5jsaDirB3A==
X-Google-Smtp-Source: AGHT+IGvVPSZJFn7GQ36svvA57XZmhphOcMaYWe+5MpoDcJNDcG1XTTXDgvR+lt04+d/kuWcwV5Plw==
X-Received: by 2002:a2e:bc22:0:b0:2fb:5035:7e4 with SMTP id 38308e7fff4ca-2ffd5fc81e9mr42772491fa.5.1732800152993;
        Thu, 28 Nov 2024 05:22:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbe5373sm1925311fa.26.2024.11.28.05.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:22:32 -0800 (PST)
Date: Thu, 28 Nov 2024 15:22:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_tsoni@quicinc.com, 
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: qcs8300: enable pcie0 for
 qcs8300 platform
Message-ID: <v4s6vj25vzsywiptfy76urngwvfjxymzgrlocu3ewdzgbp5f5v@djn4f6ous7y7>
References: <20241128081056.1361739-1-quic_ziyuzhan@quicinc.com>
 <20241128081056.1361739-6-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128081056.1361739-6-quic_ziyuzhan@quicinc.com>

On Thu, Nov 28, 2024 at 04:10:53PM +0800, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, board related gpios,
> PMIC regulators, etc.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 44 ++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c3..7f97f771c44a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -213,7 +213,7 @@ vreg_l9c: ldo9 {
>  &gcc {
>  	clocks = <&rpmhcc RPMH_CXO_CLK>,
>  		 <&sleep_clk>,
> -		 <0>,
> +		 <&pcie0_phy>,

Review comment was ignored, NAK.

>  		 <0>,
>  		 <0>,
>  		 <0>,
> @@ -223,6 +223,23 @@ &gcc {
>  		 <0>;
>  };
>  
> +&pcie0 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l6a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -247,6 +264,31 @@ &rpmhcc {
>  	clock-names = "xo";
>  };
>  
> +&tlmm {
> +	pcie0_default_state: pcie0-default-state {
> +		clkreq-pins {
> +			pins = "gpio1";
> +			function = "pcie0_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio0";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
>  &uart7 {
>  	status = "okay";
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

