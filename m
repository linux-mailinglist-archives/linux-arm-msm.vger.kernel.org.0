Return-Path: <linux-arm-msm+bounces-33264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6129920D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB0B1C20383
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F64189BBA;
	Sun,  6 Oct 2024 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XT+i9bx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EA154C08
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243766; cv=none; b=j9zE0Im6kQrca40sLN3haOIKMLQPozSSpsitRpdSi4Ec/Ju646MNg81LjqzevyBw8gPimGWCffQDgoQ/SB/U+xu1u8F+eR6c/cNZpIjWgvF08u6pu6tPE9+xU7VDiuuILCHNpvUW9BEQZibKXae7fD2eWlzyIDmTQ0jPCOYHRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243766; c=relaxed/simple;
	bh=Hcsq9u/Oy45NABldaJR8NLozYhmALr0ebJvg0CjHjrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7v458QFEqsi2gy1azsbNppUvvPY+glVZHDQyUvdBtDQVi2r/Mlpdp3Y0TiXbPmLg4J0zWepryUZZa8ux3Dvr7TgFmshvPbAkB6p58XtNHeevFHlDBjVE8lXBV1PHsTk2CTQI+5QHGEOBLCgu30gU/f57VeN/rQ4iRRGpVteXGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XT+i9bx5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso3910800e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728243763; x=1728848563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QHibNOQgWPeoVta/xHpsDiUFSZc/zSngWt4tp6ypuXs=;
        b=XT+i9bx5GTTxOKtD/72pebZfL/os2XFWqAgqpHWAgp+Q2BVJJdUdz4ILYpq9mTHsQ9
         JTpJNSXq5Iy06gOzlLnQaP2n3WoVYJvHuqPxjs77rh7FVni+GZx35AwD/7BfYXDKKULs
         K810HqUkI/xaO76MbCZ6thAHjXEWOLSvfSmwtIOVqVFB+GvjQqfRRrJSdCMmfGowqr8r
         YHaweWsrfIiPkGeGha8lJsbAYYmohFTxnE89H/4wzT4xVRXy+L4wihjlCWetbUZ7X8cN
         s6Uj3WQxQryMYjWmrlV0XDexkf17lVjo2NocJDzOQZdgBNIpP4/8s4uHEZunfeO4u/7o
         GmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243763; x=1728848563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHibNOQgWPeoVta/xHpsDiUFSZc/zSngWt4tp6ypuXs=;
        b=u667xf1LR4Gy/CLD0uPuKncJOiMmQ6EigPS4eXusqGIdApG6/ZPfR6MfAmzqPDI1p1
         6XtXsrMxjFXVdoifT+tNGZaeoaIMStiniC6yMnygApUsVFPZ2rpZoJA7Tq2VqAscoR0C
         g4NQuaC+uoccjjl7mfpHLuhoVetXAiL8HqzOxPAg1fh4Gys5l5uYTjU/oUICSsncoMgC
         QzXwaX1qvm8w2cBwXmQlgnzCOaPmipTE+dKNUVxmTLPe3GOxHzRnZo2LXn/wv26kzsju
         i2gCAfqzIBwYoq9vymX+QKfE6UVwowzi/VtHOZTZ81P4h2X9jFP2OZcc5+FLjhoPANRi
         xJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCV2yBLpkPcU9I3f/U7OEuZWjmOnOaTsRVwmu8LffbXyxFf27tfSzfRcd0cQVl3fcQIOCiQzSGZ1Mf5JonDM@vger.kernel.org
X-Gm-Message-State: AOJu0YywMElOCu55kyq4lgm+9KnNhxP/7Iy8ufykAklbbrdY2XV7WdtE
	j9B8JGoBgoNfjDOsyk4YFn/Memb0iHT1XhlvoOgWNx9EdGS0haGlHTZbk4udak4=
X-Google-Smtp-Source: AGHT+IEZlv8v7BJ84pPP1ztXJlcl0Se7cU3v7FcFIzLns/Dc88WWmH4V82OwZA86E4ml+OBGEToOcA==
X-Received: by 2002:a05:6512:10cf:b0:536:53c2:8179 with SMTP id 2adb3069b0e04-539ab9e1651mr3691623e87.37.1728243762717;
        Sun, 06 Oct 2024 12:42:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1264sm601094e87.21.2024.10.06.12.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:42:41 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:42:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add QCM6490 PD maps
Message-ID: <f5yvqcx4qh2ba44qxwezrtfnusnfo7juo52e27wnrp5toneq6y@3v5sy3yxbjyx>
References: <20241004-qcm6490-pd-mapper-v1-1-d6f4bc3bffa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-qcm6490-pd-mapper-v1-1-d6f4bc3bffa3@oss.qualcomm.com>

On Fri, Oct 04, 2024 at 08:47:29PM GMT, Bjorn Andersson wrote:
> The QCM6490 is a variant of SC7280, with the usual set of protection
> domains, and hence the need for a PD-mapper. In particular USB Type-C
> port management and battery management is pmic_glink based.
> 
> Add an entry to the kernel, to avoid the need for userspace to provide
> this service.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

