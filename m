Return-Path: <linux-arm-msm+bounces-21151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9848D5076
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 19:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2FB2893BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB68E3FB88;
	Thu, 30 May 2024 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTWebbH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01345BE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088729; cv=none; b=T5hXk343va1M1OGRYaVmCmxeqm0tSGV9MXmFeV2jFLoFUrolDpa7hyEpTLeqWKn5P/4tAikISCENhJ4HY3RyxU85I8rKOo2kunhR/zWeDjAR/KwC4s7zQg1Dfykj1vdu9/r+5aNf3U1D93blFB/LS+G1fEZoxf3m7KGJBMqfWnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088729; c=relaxed/simple;
	bh=8HOW6GEFXN5JaVE9Dz+NHTsMgKt/6EQJMGeGB7Hdfv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm3ZjnJ3K1/qFiWlwvP5zsEhbNmfWAF9ppizPSGCnpTSoLZMpRmRvlrR7Fxjp8t35evjRqrkwQ5pb+X6QSFZ4ncj1bfWCrS5lCSi7eFD1Yqq+PlFRmSpEvNGIIGgt82Mef23Zc3pu9B+8sqnaOzQBZ0W6FghkMgzI6cL3alKgfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTWebbH5; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso14021231fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717088726; x=1717693526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6VGY34RF4O6pMILzq+WOgO73UQreTXk+gL6EU4uzeq0=;
        b=fTWebbH51keZckXkMXsurwVrSf00xwtciarnauSQNG17dY8jE4L06/t1L6UCYo2fd0
         fRAUwmRgkUMgmXw/0u8EWME/1kGy3RuhFsTjOpyhfVuSJQOLVJXB/G9j41DJTDxxQqkN
         dVJ7BOk8/bbtT/dmKVs5H5e7YI7gtzThZagbiE1n6YS2hWDsmY7uo7SvAcGqCR4Jtq/f
         mu5utYoBzCKNVlug3UpcPTs3HJn7yQj9/5JnV/OIsmjIVFlyciwoC8suNGPKNd5MwJ0M
         E6/XmAgq/KUtE2EoxvSbGL3zmcdou49IGQc2QKMI9iIUl2mhXd6WC5ss2LPbN1XiX3hD
         MATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088726; x=1717693526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VGY34RF4O6pMILzq+WOgO73UQreTXk+gL6EU4uzeq0=;
        b=HRsdqWCl8mZKzNRGeS9gQHDtfKj6bNwUpwvy2tI+5d7DR2NrsJdG1/rVUqpUk6huP/
         HI06T9x4RlzpI4h8MZGq+21l50tHG9DqHJ11Y/RZgRbih0Rob6vUEJ/mknCYXUI5GoNS
         lsnHnb2wri60zyLN5tPe/fp7AsUIBxRnixA1M/nJUGsVrYBZK1InoGfJWPqF+XgY3pyV
         b9Gmkd4YQZq/ytBmZqq3WbJo6QNQVjTVuSur6IiNow73goI+VNs4OxiHOC8lw4MIWNUr
         ZKROVo6sbNn2Blcpb7wheQWC9+6s5DrEEvcyIXOaWcZ+00ifXYhK64NbP+2qdKl3ixVZ
         qHhw==
X-Forwarded-Encrypted: i=1; AJvYcCXNFV+u85iMmcuoad49VQwQ5nlBCO9O7PPZC4RXaTWq2/SuMc3QVE6SQbHyuIlTCcYFhTCmSv0ZCIb4B/klSQTnvY6SOwedInITIXccaQ==
X-Gm-Message-State: AOJu0YyCVgcOe/jx/HoulB8NphMrmQ2d+jPPQIrhOoWgKTT6Imv8wzB7
	hnkhHza1uBdKCXDp/3151fRF6PDru/MLC4aVm+B3q/F35C+aEvc7PD2wkWNp/p8=
X-Google-Smtp-Source: AGHT+IFdCZbwsZD5EOzE5VWuAXheRKV6XgmzQffRyarcmaHOpjPCbh9gz0yocfEyBSB1R1/SZN19MQ==
X-Received: by 2002:a05:651c:336:b0:2e3:186d:45a7 with SMTP id 38308e7fff4ca-2ea847ee49bmr14379151fa.22.1717088726299;
        Thu, 30 May 2024 10:05:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91d1c998sm157191fa.130.2024.05.30.10.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:05:25 -0700 (PDT)
Date: Thu, 30 May 2024 20:05:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs
 regulators
Message-ID: <wp5yehw77bnniablt45utbonlivxxnsvrs6zxo5gzv76zrquej@plabphdqiqih>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
 <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-2-6eb72a546227@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-2-6eb72a546227@linaro.org>

On Thu, May 30, 2024 at 07:35:46PM +0300, Abel Vesa wrote:
> The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
> Also add the missing supplies to QMP PHYs.
> 
> Fixes: 22b82135c02d ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

