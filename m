Return-Path: <linux-arm-msm+bounces-32596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F09875D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67EF81F20FEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2921E43AB9;
	Thu, 26 Sep 2024 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jab64f9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5826C13632B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361679; cv=none; b=TvbYS4IhXZG8B+w3necRZuHV8ZzyzOQxmQzKaYADDl1D9u/cijRfrouFqKuagjDU1zMccByD47GN5/zlX5eOKilBuCGSw+nlxLv4JbOFjqvmCmF3BPerETJ+yDJgeY50B27c1eq0ok5aq4K0hBDk9f8x1yZLGmV8n3FprdewBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361679; c=relaxed/simple;
	bh=3hBqlkDd2CboCZnt+32bHlBfwoKCR4w7ctHLvnCcMtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfyhOrnWdvihqskywhOJG1TOnp50YLL8Bn07d10vY7hDWZ6rDzK/vz04L6nZv7OHf8c6Wkd+K4cSxDuGLFvcG/xV5d9qoiuqnywpcN4mR63dylhsI+j0VX2vmUl8OksipzTmxtXy6gkhvDxCw4Duh34yX5q3wV8KfAIN/dlx63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jab64f9b; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5365392cfafso1159938e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727361675; x=1727966475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wWrufhI1OaXX1M/49KinirIqQ3+0LvTc6ruUtQgTS6c=;
        b=Jab64f9bEcMHSIysshyFpGLfGl8RledltP2beM1pIO96Yb6KalEFXQhTrCj01U8M7o
         cS4WSPIzAJFskwArqs8EXxLT79rxE2Czve2n4CtKE8QwmASdis9jGqhcIpjNYNR8n8YI
         /KlCFxRd4+KCiSNBovh9S4OW0HJJOpYkcZaE6XVfxDSsj4u/eQ+KGv6fHdW8gcik2qSO
         +R7h2mp1g59Ch9By/1Fye3SDr5g5mcQtGq3dL9QMuDJOXS3aZ/Add5TT6t0oXEJkof7Q
         ZhNSzpsrM7lHnEqI8sU7UHqui+ksChF+zc8ezqDQDwEt2ehrj9Hb8Qfu0gDX/hEx3L0K
         v1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727361675; x=1727966475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWrufhI1OaXX1M/49KinirIqQ3+0LvTc6ruUtQgTS6c=;
        b=PN0KJDFii8TU2jNSXuaSzzaMfZj1gxVlalwX/I+QJVARXDOnu1+O1oPMwVeWf90VbN
         4DwzKzYNmRLGgGuyU/uJNpPviH0eHJF5LkNaAfM6Orz4MZ6nREewiFxBzALSu4VVZwoT
         QzKthv46ALRLSlhaeedG5C+KBzaMUNIb53eyBJNacIwotZEHEOMzED95NgrE774TJ/fj
         5nnDmClYmkCc68q5XO0LXlUMCpQhyPiBM8aRCbLXMsDHBzGtAX35ttIJGLbWq2mgc0gd
         r22NDPRtDvbOSKEb28ZWQ6u0Nz0zuRnjSVRRhUj4TGxC+hcEVWYThez/D+mM9DlEJg5L
         SJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+YLQh3et8g0bKZhS+7hDs5JvNUekNMWdARxG+pm7Z5WnseJWu6W5tAk+i0rnw3J99AlQlBntwik/NPh7N@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7V8TznTmHK9BtuSSNyq3TpLsr2VTln51bNhHCxS5fIm0bLll8
	bjlYoJkVNQPYt7nBdJnZJTAjsEM4tYj3OmMbZWlZMp7c7MWj6NKoA6F5Wrq/UBo=
X-Google-Smtp-Source: AGHT+IER6Za9qimt3NND6y2jN86DblVumX6oOnvT4M0Kys3dZuu5LlRfdb8WGqjYa4bEbRiVS/s1UQ==
X-Received: by 2002:a05:6512:110e:b0:52c:e3ad:3fbf with SMTP id 2adb3069b0e04-5387755cb9cmr4503700e87.42.1727361675445;
        Thu, 26 Sep 2024 07:41:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8648bfcsm826890e87.210.2024.09.26.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:41:14 -0700 (PDT)
Date: Thu, 26 Sep 2024 17:41:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/12] arm64: dts: qcom: starqltechn: remove wifi
Message-ID: <zxa3q4gjo3afwcne3bqmc27ijctl2zwuf6frsb6j4ybzoihyjm@jky5375spaot>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
 <20240926-starqltechn_integration_upstream-v5-2-d2084672ff2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-2-d2084672ff2f@gmail.com>

On Thu, Sep 26, 2024 at 05:22:02PM GMT, Dzmitry Sankouski wrote:
> Starqltechn has broadcom chip for wifi, so sdm845 wifi part
> can be disabled.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 

No empty lines between Fixes and other tags, please.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index d37a433130b9..6fc30fd1262b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -418,14 +418,6 @@ &usb_1_qmpphy {
>  	status = "okay";
>  };
>  
> -&wifi {
> -	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> -	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> -	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> -	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> -	status = "okay";
> -};
> -
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
>  
> 
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry

