Return-Path: <linux-arm-msm+bounces-20736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81FB8D1A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78FD01F2409F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3078116C863;
	Tue, 28 May 2024 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQFdbWeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6586C16ABE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897108; cv=none; b=tAUX1vH1rJW9jrdTylrikjPcLnf7z8ziOIcBKzKBkmcRzA4wskWblZRPrEnY1g56yXjHhOBHLLHCf04q+EPo7AbGfHrGIaNTo2MLax4TIqsqp4ZVwAl8/70WGP36UCN63NArPXZJcEIErajKpP4iJsqH6NHicJNJkL3VdywINEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897108; c=relaxed/simple;
	bh=36uSHoMgxGER9AyqV5VeBnVW6VIdtXGcTbVwtzyKn44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p10Oxz/wqA2Cm7gmKtvancSgQ6oRiozJdQ4cpJvsXkOZAc0nL+T9CVoHFK/V0pb87wBbkItUhEW6YRNz78lhp9Ni70Jt9OyvWTG2RxbxyhJ8urDdPPx/vjGcXzLVOxTuBI08Nseecp/pCmRtqTJ38tv8gElDYNbXiplzCxjmyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQFdbWeh; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5238b5c07efso865726e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716897104; x=1717501904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SR0swcG5+QwWCJaol74s1Py1ngSe4OivircoLN7dDJU=;
        b=dQFdbWehASHf/tLujjkM/47lteoefuZtqD5HGb60XiOhOQk+YBzrjbSqixd/SLTKQ1
         RL72TDdx7kDYyJLlmdY8HYfNRUK2QmX2TuqaTDvBiB/gHhu0nIXLqhKXXa+JU4lgyTwv
         uVvMzpuAAsbhJVxkZ4o1eubOW4vr/Orp7wSU5izS6Xqpf6rrEenleC4pIDKTP+fRMVkL
         nZewdk3MqlcfHd+ehT+LhP/UKPjkX8pdry9kofOM4YagsyjszdAka9JtqalmsPgeAKJp
         LPG/4+T7I2nkS+k6DOAZDILc0E/MSZQTcbh/yBrIQCT8+KV+iOdl8pD0Felfob8xRrTQ
         zl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897104; x=1717501904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0swcG5+QwWCJaol74s1Py1ngSe4OivircoLN7dDJU=;
        b=BuAmMyEPfGmNhqm17vOGwLqHgG8/xEBYF4IeuckKpnWnXgUM5TnCuzYv2AI/cEjwxy
         BBcnQnd7pVALnbv+tf+P3JLZVlz2+nw2CWbTsYMyhfuiO3UqwMrbsCFos8Q5CKrE1geD
         8A7e6mepX8oOVvF0Cr405KazD4tLTDTay44TDXgv1ToHYRxTHVOBwTMfoaNMDy+bW3wQ
         AY0R130dj2D1ebphTXJu6un3mfSlTPT3NRAxU70JYLwc4XuSkphVtM8G/jvU+UW1VGeh
         ttluHPMddMK7a8jyniJXuv3i6cdsFywLhHmb/Gj3M8TkOacOklQTIx2yK7TJSCecJ1e3
         ydEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqpuqc7WBI67Xer1avMItAxw1EKx3c945l3/w+eSq5cQiZEWLjyhaMB5LheE+22FH+0ENlBHe2Ad8Af2rDV3REREqTNH53mXW9RomyUw==
X-Gm-Message-State: AOJu0YwrO66Bdy//Hk3tApY8qLuqVi1TzMFvn/BTnIqyaNrGh8yQu0kE
	z8GJ8RkXvLKJIx0YoaT1NGfeq6hokLSIUYvwQom/XkkXHoMRFRj0Ybgz8OaxsbU=
X-Google-Smtp-Source: AGHT+IGtydr8Q+QTfb3HjbwnRs05//k8mxj1FHunYO466H8ygyz2l7N2XNJD5XCJREFfSTK3smXiaQ==
X-Received: by 2002:a05:6512:3448:b0:51f:4096:dbca with SMTP id 2adb3069b0e04-52966ca92d9mr6185096e87.62.1716897104488;
        Tue, 28 May 2024 04:51:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b68csm941610e87.132.2024.05.28.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:51:44 -0700 (PDT)
Date: Tue, 28 May 2024 14:51:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: msm8998: add venus node
Message-ID: <xlsho2uayeay2yzws77donp7xrhwxndv6t6ehobevaszah23l2@risstyo3vhhv>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
 <c2fca6c7-2421-42b4-a43d-68b251daf9b4@freebox.fr>
 <e187c5ab-0241-4a45-8d74-a33ec12deec6@freebox.fr>
 <b4a71be9-b888-4396-9eef-28c4a4f2b149@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a71be9-b888-4396-9eef-28c4a4f2b149@freebox.fr>

On Tue, May 28, 2024 at 12:49:54PM +0200, Marc Gonzalez wrote:
> On 13/05/2024 10:51, Marc Gonzalez wrote:
> 
> > On 07/05/2024 11:29, Marc Gonzalez wrote:
> > 
> > Hello Bjorn,
> > 
> > This patch is supposed to be merged through one of your trees, right?
> 
> Bjorn, would you take patches 1 and 2 in your tree?
> 
> Who would take patch 3?

Per MAINTAINERS:

Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:MEDIA INPUT INFRASTRUCTURE (V4L/DVB))
linux-media@vger.kernel.org (open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)


-- 
With best wishes
Dmitry

