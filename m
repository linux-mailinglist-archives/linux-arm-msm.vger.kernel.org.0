Return-Path: <linux-arm-msm+bounces-21411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900608D75CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 15:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C306B21C59
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 13:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD9A3BBFB;
	Sun,  2 Jun 2024 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXR6BTbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606912746F
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 13:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717336183; cv=none; b=hMHITavPTrk75J+J7YP/HhuckopwJqRIKVns7UiHewnRXUZCvG+mO3JrqFn0oyYBq82LLdR0XTpL7lGQBWEeOyTYS4/1RnualTTE8Cb/+05DsaV9/xdgeHcZGtonQorSiiofGIbP0/jd1ZaLFnMnESScOrzVR3FAB8s7uskNYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717336183; c=relaxed/simple;
	bh=OFBLy/93aDcasO+7L2Af/xULO+GOP6Ah177EDibhun0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtvSeohpbFqWrgdTf6cKyLbP8BaMytj+RLepDV8vza1iI2ZsWEPw83WsR6t7AWTWF1/ioeJ3r0zB3ecRK/Tx8AbPKKGw27iMENI0ClmNtl7pjBA63HxJ+9IswVSdH8wWCR3qhGgvEdRXJnHglPJJF4WlR7HVIxc6rapIzCiKjq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXR6BTbH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b82d57963so3352484e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717336180; x=1717940980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RK+gSspnDvIjQ8g7XKh+hwU9n45tiCyCGsEgB2oOglo=;
        b=LXR6BTbHkE/GeQ+iE/7+lWWLaUBANMlELk2e8im2xKHxF/7032gWxpWpvWS1jAUaOs
         +LLADlmTl/n/uAKsAk5V6AfL9GGI0rEL2htjnDmoRac2pRxucAsx7rn2FITgu1qXLHkZ
         ydzR7dyMWCa5S95WE24E2Uijk4BsdONj1Axc4COCna3k1MFVwfMWF9bDzJWUUP+dRuPo
         oGcNHrLtL5EzvPiz6kWnvD4h7lMoXWTZLxlAwO9mQJtplnpTcbO1yFQ17VqCoAcKqk5V
         dZFDFchgbzL5iBR+d8dFq2UpDZ2a0zPsPt12ZP7/cWR5b4mzEFnm41CZhgY1n3CLMDro
         vGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717336180; x=1717940980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK+gSspnDvIjQ8g7XKh+hwU9n45tiCyCGsEgB2oOglo=;
        b=df2+RV9KDwt7pE86v01/b0QxEY7ZhGGuCJKCR3tI8wZoVUihRkScptLp3T13p/2R7Q
         e3ESkUDIGA1wkguybR0mcPYvk4SxDI8LZj1Wqx0GBbOZDw2f9IAnsJlk+K9xdZF32AHj
         GlBeohyAsTerAnYWAfZLdhZAMdlgpsDrgweE7SrY5lpVgpZGTqgGFxBqiAIvg0BfES0R
         1Mn0QHZ4DhcyK+I3Ft4i14Xf9oduqQ4XDIA6iuQaVcpy4+CaIeOg+i1Av98KnEjY0YXG
         6xZyOAKINVVlCzsNdtL49NTEACo1O1koZZebHwV/ayKut6TlN1b8ej5HYky8GHCmsrwT
         2ddA==
X-Forwarded-Encrypted: i=1; AJvYcCW1VIFjkxi1I/lHOend1cx683ZlPeQUejbK2Wyj893WQXJENV/ZV51nqdDWS49xO8IllXWjjBNBvmkX7I1YMlhpVrzgyB/ZR0e4u2yK4g==
X-Gm-Message-State: AOJu0Yw6jRq4qSJro68T85JAMEQovsX4zpVzczXhpAlkmzKg4Pg8QBQG
	RSYwRVTxSNjX1rK+vqvnKuLgR3BrsV/gb27q29XLPwJMou2Q7hc1BQG8MWTgu3A=
X-Google-Smtp-Source: AGHT+IFHtYW/9mmf4mBFaBwKb2/rlrKnB1nEhfK0SBxsg0mk+z6IYwfe5eM8PmYnq+8HBzEZeU9iBA==
X-Received: by 2002:ac2:4246:0:b0:521:6c38:6949 with SMTP id 2adb3069b0e04-52b896dab8cmr4494872e87.45.1717336180547;
        Sun, 02 Jun 2024 06:49:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d8e557sm956327e87.297.2024.06.02.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 06:49:39 -0700 (PDT)
Date: Sun, 2 Jun 2024 16:49:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Message-ID: <fxh3urdpdugkdgqureddxurgusqrexomi2v4h77enm5ncvoa52@nkh2p7e6dsto>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602114439.1611-9-quic_jkona@quicinc.com>

On Sun, Jun 02, 2024 at 05:14:39PM +0530, Jagadeesh Kona wrote:
> Add device nodes for video and camera clock controllers on Qualcomm
> SM8650 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

