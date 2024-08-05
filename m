Return-Path: <linux-arm-msm+bounces-27925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0C947C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 16:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B275A1C21441
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 14:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA4317C64;
	Mon,  5 Aug 2024 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXtBpllX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA555894
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722866774; cv=none; b=AHYjjiOU2RtH+brhBq6qm3iQflZnCLrCD4FEHtHa0+a9x3HAATydVQHiD9VwrB4Z6Bo+q9yNl/bSpkoBer6T5ZyVVyA0hfnXyCk9IkNZTWq1coBGuezn7JZcCjH9hHqBIEjdr9A5pbt64sBGuesqWmSbop6Tj6gEVxPvLGwhzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722866774; c=relaxed/simple;
	bh=JWDfxzOem0n56FYU4VXUkQDVwF2TRREiOqQdjMyAfQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh9kSi1edlNRP4JHuJN6Ji6fZ/ijeT8HX7UHJjoV2TWPmfGNjteKtSyv8siKSPSSfIM0D7iL+WP1uZdh/fxCXh8rJ30QHL0LGOmB3ZKcT9GoCF/BQLyx/dcy4zLYMec6ntNG7RXg9ts/G+bwUyVBSYijLAmhNK9a9mNroXq/Mv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXtBpllX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ff67158052so16071625ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722866772; x=1723471572; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iEO2QRyVzS+ljtvv48YQ3sj1vOh86hPpXEvZGsjptjc=;
        b=FXtBpllX2ZnKMqTFVbq7uqGEuWzs/LXxT9jYy6XjsGDdOK6pV5uJrrZoaYtlVBOqHh
         e0ElDMcrGcUY1JGd0Rwm42tUaHVArq8T8MWCf+Lehm8g9CGibZZ+yJo5cy0HfQ1tGbeO
         XZkoXhtR6VWd/EV+ZXeDfYiypV66Ogu1AS7bsXDCTCeJntV9sp6oqPYnjCeRuRcVOvy/
         BnKJaZTFYXRtF7uLX1vHkEPfWhWDfesHaUL/Kn9Tq61SvlCKbISR8Wy4vRs4BRzvYp3F
         WI22jXa6IjMKYfwm0WKQPXeQygzYNE5hOXzH9Er9CPBwyok4EKcRfZAy/QxUNl7atind
         +l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722866772; x=1723471572;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEO2QRyVzS+ljtvv48YQ3sj1vOh86hPpXEvZGsjptjc=;
        b=A0w422wk0VicrboriY/wWF5l1+XGg0fEn/vRtJM88QJ5YtuRhBR61KQu+/W6j8Jrvh
         Bl84KEXqsPHl6F7/mQiwYxGUfipPYEHPWK6eoPBJueGJrgbSMdJpdxA4KQ34hGmB64XH
         iJwoWz7oxAgLQHYm1e2LjLNP2364pB/e9chko65vxRI3pM05/yxRHgLeo0V9nahVjEht
         X9yWtGeYK8xJqRKutjHiOctxacfYv3TQ4oCRCtxDWZ+Kbit7DD24Ilol6PsCsEVrBADQ
         AmnGPc+62zlB+kMWtEYatN2aiAWV10dQ081tYioAvDvgOxZIC9Zx+rYejBCRCZ4icGtp
         5fOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLuulK+9MTTrJJUVc+5RkKXpNI11iM0/kFURgYIbc4Bpm4ChjmKZkF3iGizXYWGtBFqwLyYxwV/88XQHdL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/26Tb++tBhnctTBUIunmOgINPC/UNePVGzLd5RigP/UeHPZ4m
	JXcZr8doz09YOVpiHDlygntANgExulKXZ3DflrlfkbtPnaoPzYFbcNr3hVQ2rw==
X-Google-Smtp-Source: AGHT+IEKSuX/zNrpwe96/y4uF+vgoKvY4MbzudYEdZ4IGeItnJCx2w2+Z3nvue/86TsoXCJF4krHHA==
X-Received: by 2002:a17:903:41d1:b0:1fb:3d7:1d01 with SMTP id d9443c01a7336-1ff574bc2d8mr92821085ad.59.1722866771816;
        Mon, 05 Aug 2024 07:06:11 -0700 (PDT)
Received: from thinkpad ([120.56.197.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19bd5sm68269575ad.50.2024.08.05.07.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 07:06:11 -0700 (PDT)
Date: Mon, 5 Aug 2024 19:36:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3] phy: qcom: qmp: Add debug prints for register writes
Message-ID: <20240805140606.GD7274@thinkpad>
References: <20240731152548.102987-1-manivannan.sadhasivam@linaro.org>
 <172249532035.256913.2685367794999812971.b4-ty@kernel.org>
 <20240801070026.GB3705@thinkpad>
 <Zq-ura3oYbhb8C9a@matsya>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zq-ura3oYbhb8C9a@matsya>

On Sun, Aug 04, 2024 at 10:09:09PM +0530, Vinod Koul wrote:
> On 01-08-24, 12:30, Manivannan Sadhasivam wrote:
> > On Thu, Aug 01, 2024 at 12:25:20PM +0530, Vinod Koul wrote:
> > > 
> > > On Wed, 31 Jul 2024 20:55:48 +0530, Manivannan Sadhasivam wrote:
> > > > These register prints are useful to validate the init sequence against the
> > > > Qcom internal documentation and also to share with the Qcom hw engineers to
> > > > debug issues related to PHY.
> > > > 
> > > > Sample debug prints:
> > > > 
> > > > qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
> > > > qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > > 
> > > [1/1] phy: qcom: qmp: Add debug prints for register writes
> > >       commit: 4e92d504475ea5841716ad775f412342520a3d26
> > > 
> > 
> > Thanks! Bjorn spotted that it is worth making 'char *name' a const. Can you
> > please ammend the commit?
> 
> Send a patch please, I dont like to rebase
> 

Ok, will do.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

