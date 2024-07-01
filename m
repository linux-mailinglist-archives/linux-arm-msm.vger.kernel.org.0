Return-Path: <linux-arm-msm+bounces-24813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F249A91E551
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C81284598
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 16:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2496016D9CA;
	Mon,  1 Jul 2024 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXgmAbXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6915A87F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851247; cv=none; b=qVUHuGAEJMuT1Wd3gGs+EliEinVlu4sNbcHVGTusPDEvJ34P5kWgtW6ApSiOop2qEE3qIQh25S+64vK6nT0MQU95QbWz18Znnl+jtXJZuxNCJ4JfihTd1OTVIWf8bSoZ4DEtdRmlU9DDa3P2boMeokLhVWQiIFR7tZZ5x2ZHDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851247; c=relaxed/simple;
	bh=F/0fyD3tuLE75kbEOFk9w0FuDMPGWs+Q66+UszKetXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzMKmbY6UnUigATuW5LLBSQd6ooQmlP/w7MDef56y5SSQmnLX0WStc60uK1NYCOSv5Req7etjIWCx01CNlueQdEfJ6taQc3eIJyrnK13dgYcS6B4/5795lkOgmxR0mfYBgVVFdN7CKW+8NI18ciwvLfx7sddz1IQkwftSwHnWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXgmAbXK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fa2ea1c443so24483345ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719851244; x=1720456044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7UBY+UV1dqUs886cQefaoyGAbVXuttEZvsE7IUx80NA=;
        b=QXgmAbXKDcriOnt0SWZQTWoQO8yFZ7p28URMAr7VB0GLz3pnAtUspOsQzEfHkIeY3l
         1M8WNUxz/Bb7W5m6SVrl+Jkn5Q7Zevjayk3zWEn95ddB5WuDb900I5f8rkW6nMfXdOw6
         mUWacWMjwopEXl7SY7u+DvEULF1bBwvtlfYF7YrBfUjA5CYsv+PMmzIaAUm6uLOLeypm
         Ao8qJuvI4moX90t20kx9Frw9iOinegs5zvTc/uBxrIPy+8mhvZgj6KtI1QDQ2vuXr6aB
         iDom2ueesjvgoUQ51AmXii7i5IVYeyPpRtsXTtPqtrhUCIO1yjX/zIsCSu+SKasrQNQJ
         iehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719851244; x=1720456044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UBY+UV1dqUs886cQefaoyGAbVXuttEZvsE7IUx80NA=;
        b=UOlLWA3KnB2i/NUuTE0EDn2UjvkxR/jTAeO/iFDCFAj1UqWdHly+1QEvsVzPQmTdlk
         hyhIQhRt5KtjTAg+Xn0uMuKuh+nry1CH4R3knIrroS7g6hRnlMzsrT58uX4JiAadRjb/
         /+p8IiUL7K8wTtaTlMjcr4jNL1wHjI8Bs2/epzeFwPNu2OSy9pJkyS7LK7P50TqAUGlT
         HIlHi9Mw7EYAaLbG7+52+IjFwHvGdY6lMm6LdfrcIC+hXTbJ7R8zBBA7JFsP/kgX07yP
         l31Yt+6LFUIVEbmO63sOp9+TKsdiezkDIGVOHwLcCMtRhc4lVEHGazyClqJyskfl1zq8
         aJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCX0kUQNGPhpRQQA2Q1sdbQBvzDfjbnDgyghLyBcYKV7RX9KsG7JAnYnmOc/One3WftLRzchQdwaaf6EHbbym5NBZH8W6etjVvTpqBZ6YQ==
X-Gm-Message-State: AOJu0YxYK4luwWC9Lvze0xHrJtMUJRJ2LMyNq8Y7kvvxo8uRTCjGVbDf
	0EBmMTcJsIf1sv7wsS5Tu8tPFdpMzJbWRrhp7TFJmgBrCJGpVlnJioOz5bKXYw==
X-Google-Smtp-Source: AGHT+IFQozfWAuNmYJp3g/hIlVwVj9JRmtZA00eZM1uMI3eaJG4lXuB+faND7zWMLiQpbH3R8hTCUg==
X-Received: by 2002:a17:902:eb83:b0:1f8:46c9:c96f with SMTP id d9443c01a7336-1fadbd02087mr46513535ad.61.1719851242883;
        Mon, 01 Jul 2024 09:27:22 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c6c57sm66855885ad.53.2024.07.01.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:27:21 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:57:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Slark Xiao <slark_xiao@163.com>, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] bus: mhi: host: Add name for mhi_controller
Message-ID: <20240701162715.GD133366@thinkpad>
References: <20240701021216.17734-1-slark_xiao@163.com>
 <20240701021216.17734-2-slark_xiao@163.com>
 <36b8cdab-28d5-451f-8ca3-7c9c8b02b5b2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36b8cdab-28d5-451f-8ca3-7c9c8b02b5b2@quicinc.com>

On Mon, Jul 01, 2024 at 09:13:50AM -0600, Jeffrey Hugo wrote:
> On 6/30/2024 8:12 PM, Slark Xiao wrote:
> > For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> > This would lead to device can't ping outside successfully.
> > Also MBIM side would report "bad packet session (112)".In order to
> > fix this issue, we decide to use the device name of MHI controller
> > to do a match in client driver side. Then client driver could set
> > a corresponding mux_id value for this MHI product.
> > 
> > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > +++ b/include/linux/mhi.h
> > @@ -289,6 +289,7 @@ struct mhi_controller_config {
> >   };
> >   /**
> > + * @name: device name of the MHI controller
> 
> This needs to be below the next line
> 

If this is the only comment of the whole series, I will fix it up while
applying. Otherwise, fix it while sending next revision.

With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> >    * struct mhi_controller - Master MHI controller structure
> >    * @cntrl_dev: Pointer to the struct device of physical bus acting as the MHI
> >    *            controller (required)
> > @@ -367,6 +368,7 @@ struct mhi_controller_config {
> >    * they can be populated depending on the usecase.
> >    */
> >   struct mhi_controller {
> > +	const char *name;
> >   	struct device *cntrl_dev;
> >   	struct mhi_device *mhi_dev;
> >   	struct dentry *debugfs_dentry;
> 

-- 
மணிவண்ணன் சதாசிவம்

