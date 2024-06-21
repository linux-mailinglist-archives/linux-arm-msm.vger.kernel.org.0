Return-Path: <linux-arm-msm+bounces-23656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD07912F6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BDBF1C21EA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F10417C215;
	Fri, 21 Jun 2024 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTKP7OhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84283156F2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 21:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004956; cv=none; b=QWYWOEWDg1+NI/6ixnBM1u779LhuhpcXPczx8FdNJvVsB0VTw3G3kKkt+HiXrgepT10Xs1NqPVi/PBOLGbDUIJ/cX5jKZ10CRp1JngQineatTmRant0ElyXsYL7e1YqjauMZZg3i4nQYmrxZOqXFtyxirYP5vO1maFjgHl3+hvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004956; c=relaxed/simple;
	bh=ZBvcr7+Gwxbqe0da41kn+7SiVw4SO+t8RwQK3zGaPcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3NgKdn4IvpVUnK0qbam1rHAuuFpOXr7DL4UiGP0dUxaWW32lNMTfku7/sZVOtGQCM9JMah9V+0GYeT0+bkn70zRVX0VeYNUHqeWA4IuFPAhgM09lpbfBWjt6tOpc2xGIn17MQQt1LmkcCOfz1M45fngiz1Wtm4AI05kY5jXRkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTKP7OhZ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so26905001fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719004952; x=1719609752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xAdB563R8XYmyXoP8NFXvauaXnziMOv9/xConCBo8TA=;
        b=UTKP7OhZ8PVh0j5NyUAOxUTvkOBebR0aeeNN5WQu6sdT3xs9Sy8oQmXjnQdCAKwY77
         3PmVW8LXfsXdasGn7e9QM7y0FuOVyQa3siV38sT0ulfDflKZQ9cCQY1cOCFugnxq4Dei
         N9sVDlPztrc81ZzltlAQ9pAdNcGplzERXMVz4JoTtiX1Dc/JPjv+roKEpqftFIc0qZVj
         oJWqbMTzFt3yrO1JjSqATYNNqnmfjRgySZl3iKPcvqJxPVDZImo0pWdcU1oPSZd63lsZ
         nsSWYbdXAzmFfgUy42WRUi4wK3GtZ9P9mDHaPfsiaDQnM7dlDP1eQ/UVOzUM06N2AiLU
         S8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719004952; x=1719609752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAdB563R8XYmyXoP8NFXvauaXnziMOv9/xConCBo8TA=;
        b=oZgmj40vbhM9rQq6vtBSbJ7HUl3tov07khEq4E+qkUAKikmFYxs1MwlHzGAHUyKlfS
         IvjSF5nKt8gJkVBRIyU2RuvAXBeEQqWzoQ8GPuBVW03VIVSNhP9WSqQvmns4ZtL1gzCo
         kPsrEuqXs1w00HCFWVesYaGLLBptz8BvnYfX7Gv4ORgbEr+2PTXMxwssGUvy3i3SOAa9
         /0lZga5jaVelP5jdOlRkMjQELonYmMoZaGv1nA0JT6/MJjghUEIw3EDJFOrnpHO3JtOx
         dPRS4uV9bHY3fZuNIB/Y4ide1CW/buyvAL+vG3CJjZ83FNuXmtuTHT87i6rmWm8Ma1Yg
         H/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmbI8hoF5Kq1TSUDx1Ku6PkaN7R+SpoEEYZh0noKERBCEDJAV1+kxb2zmqzAvq2qTAh15CpAvgpm+h+qQIiHFdZ+yd3uAi81tUFiDxUQ==
X-Gm-Message-State: AOJu0YxURLIv+VVaPfzodQ+FzpJvNsCQZ2Me52usLym1/CEaHyHNUKJa
	g4ZYIcoqp27iUPmJV+hUJQOiLEj+F0uWEYqCCNqtyEcw+mBoNkUbR9t2RgO97NA=
X-Google-Smtp-Source: AGHT+IGfaOTGT+6o67ivDYPs7VfP98am4DOphN8WQafMAF7sGYpWN2LWS4wRAQkJx7QKaIe8VP/Jcw==
X-Received: by 2002:a2e:7d0b:0:b0:2ec:140c:8985 with SMTP id 38308e7fff4ca-2ec3cfe99dfmr68489491fa.36.1719004951726;
        Fri, 21 Jun 2024 14:22:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d6012d9sm2931571fa.10.2024.06.21.14.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:22:31 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:22:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 0/8] remoteproc: qcom: q6v5-wcss: Add support for
 secure pil
Message-ID: <75hecf5rsekiq6vlnzx4zn3out2emdiwevhclt55espyzcenxc@fs5dljukafdb>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>

On Fri, Jun 21, 2024 at 05:16:51PM GMT, Gokul Sriram Palanisamy wrote:
> IPQ8074 needs support for secure pil as well.

Could you please settle on 'pil' or 'PIL'. Just use one of them.
Explain, what is secure PIL.

> Also, currently only unified firmware is supported.

What is unified firmware? What is split firmware? Why do I have so many
questions after reading the cover letter for what claims to be v9?

> IPQ8074 supports split firmware for q6 and m3, so
> adding support for that.

Ok. After reading through the first few patches. Is WCSS support on
IPQ8074 broken?

> 
> changes since v8:
>  - Rebased on top of Linux 6.10-rc4

Previous changelog has wanished?

> 
> Gokul Sriram Palanisamy (8):
>   remoteproc: qcom: Add PRNG proxy clock
>   remoteproc: qcom: Add secure PIL support
>   remoteproc: qcom: Add support for split q6 + m3 wlan firmware
>   remoteproc: qcom: Add ssr subdevice identifier
>   remoteproc: qcom: Update regmap offsets for halt register
>   dt-bindings: clock: qcom: Add reset for WCSSAON
>   clk: qcom: Add WCSSAON reset
>   arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
> 
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi        |  80 +++++++++
>  drivers/clk/qcom/gcc-ipq8074.c               |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss.c          | 162 +++++++++++++++----
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h |   1 +
>  4 files changed, 212 insertions(+), 32 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

