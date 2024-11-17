Return-Path: <linux-arm-msm+bounces-38148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7199D0728
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 00:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D228DB21A81
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 23:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3E91DE2A6;
	Sun, 17 Nov 2024 23:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HbFsUahj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711101D9598
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731887844; cv=none; b=RUSNviayPyYIb3OfDTvffV3aBF62QTT8tQl1HdOHAg7ea4nWs6Y8Igxf63X/Det/dR5qu8+h55bm5mngkNlvjsf18dvhVYd9c92DYM3r85VNs21bWN5xNukSbCBWKhPvyb8DjPK93JGSWGJkvrlrSZOByybInbSYd1t1LPRSF1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731887844; c=relaxed/simple;
	bh=ifx8omh95I4mNMLOYiaJlO+B3oJuOX8AUyWnebXj53Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=conLM2hHyzRGMMMOnsnpoRWCgcZTF565uHqDym5Str8N0GB1WhO/aheaoRvtBaD78uWMgscewEVjaJaqsIc8AhE5PrdXl7BecuJz5LDKR7HxHPTNND7L8qmK7P7FTzD0VVEiVj7qdUeEZKGo6xvUvS3f2Um+F8CeVCDtDuPiBCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HbFsUahj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so1733921e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731887841; x=1732492641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwqxsYwUO43vdOaCtFFLKl7sa6jND5eVDewqFn0TLtU=;
        b=HbFsUahjjPCHV38M9mO7V5+0B1fqU1FhXAmiShQZp8efG6AytIhXUw9eWrruqyHqdv
         +KHtR55zyOVJOLvj88a80gNF5sz4z0HM3r04S+1ee4guAAYBlJxLwTro4t/VBeaCNKw9
         ybuOPHedGUJD2IuPMEX6kzuyOahvIhKvudUrx1yrK6PNG6fXKKYf5JBQjLS8Pwc7oCd6
         3txIra3i9+kI8dCft9Z/MDETmqpzuGxvSLnscEX51wGpfF09Laxa3GRglMJPc7rydQqr
         Or6QVhmkdhQ9bbK4POa8gTUdSlDXZwJGH/AY7XYNOBJw61OTKNrMuJShHXbV+vSd8UKw
         21sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731887841; x=1732492641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwqxsYwUO43vdOaCtFFLKl7sa6jND5eVDewqFn0TLtU=;
        b=YWpQp3iBdqdaUqZzEOtSxrk9qCuc4wc2/U7jsGbdWbtnbV6QkniZRWoc5NiI7mUEn3
         T2+3tYMpRDBfPKUHB64N6N4MilsaN5i4kqb3jdG2Yz68LmxirU/MVUUG79lMoyC1/D3k
         CUgbrtWtV+PIshcueocC1j81Tl3tm6thKaMqfBcrGPWlQR+Wvt5Tpg28teOjev6IStPW
         VOv86LlQNuXENhHcU1ZTfKSYazRnD9zTGjGo6KX9OxEAdRx/bWOdFamVaFn/lviPb/XG
         rRqi4kO6Xkkhe6G+U7jXRi7VutiaVbanUcSQssseLouAHSbO2yMPrDRB3pH+XpRB8Ott
         3lOw==
X-Forwarded-Encrypted: i=1; AJvYcCXCQAZqLqE1lCapD4O+OfN2Gv8/xsytBBldDQwWXjVS7YsdzOq8LIcrh9ekzCVh8xS34bGRYW4xoAAKAD/g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcdj+JUjZqwBlKw9blfLZkpSy/Y7gZQg1souV07owdhcm9N9+r
	h9fwBVJZ1E3mF3DVhiflgjF7xRy2wlJ/GOTUnK/bJbcFBTOP/BBRptQZ29B4/QE=
X-Google-Smtp-Source: AGHT+IFS7ogIxK01B+f9C7GEP3JYj6qh422gYguOCg+9snr6BIQRNXEcNKLdHNrYNPE4FaVnXmRyJQ==
X-Received: by 2002:a05:6512:31ca:b0:53d:a87e:f77d with SMTP id 2adb3069b0e04-53dab2a6845mr4748208e87.26.1731887840560;
        Sun, 17 Nov 2024 15:57:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da698c237sm1353809e87.129.2024.11.17.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 15:57:19 -0800 (PST)
Date: Mon, 18 Nov 2024 01:57:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, andersson@kernel.org, 
	quic_yabdulra@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] accel/qaic: Drop redundant vfree() null check in sahara
Message-ID: <njcfea7jb6kyixhh7mlmsyzdp3rm7r5c4jmra7uqzgjcpyp5if@jvgx7xyh2jab>
References: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117202629.1681358-1-quic_jhugo@quicinc.com>

On Sun, Nov 17, 2024 at 01:26:29PM -0700, Jeffrey Hugo wrote:
> The documentation for vfree() says that passing in NULL is ok. Therefore
> we can drop the null check as redundant.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/sahara.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

