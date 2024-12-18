Return-Path: <linux-arm-msm+bounces-42658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF139F6463
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E63B160647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9713B19D091;
	Wed, 18 Dec 2024 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBZF9b9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB917C219
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734520292; cv=none; b=Lfq6IBye0OPVoIZYdNKaZezOxRdCfWoRXvAPsie5Zl5DHwMkiWpWr/+2LjKPhXs0t4bBN30F1Q6UVVF46S3gcRmkfynpBcE0BL4kDktZbhn4XB/PRicDcDXrR+EDIE+gYy2Xogm/FsRn5F4Lf3xnsd84uHTB+mgO6PVnRGgrDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734520292; c=relaxed/simple;
	bh=E4eyQxSDFEqYz1navGDvOWptnaJ7+aM9eWeu4P9K/zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HamKPe0a/I1DcVYX2M3l2r0MDeEI9pj5y0QNMJ6ebn9AAGyIZoOXlvL0YvBY8b+KBw2s0hNxPB7LJdRiWQ+uF9mpvUjsXQtW0logedIuEIrXv1CTL3SA3TD0dSWqhuC2obVYkIfJVmzH7Tv+y9LQqrkKpnYA/v+dSZEc1G8QkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBZF9b9d; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so8758515e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520288; x=1735125088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1vBtYt51jNW1b+jxORD8K2hfreZX1fSorQB5nRIglI=;
        b=JBZF9b9dF6qcVuHdBHOzfFHm2RBmpZn+g4ldzEEn834HNJSkBY33AsUSCMPHF5zyY7
         kKMoVU9AlEpKlR3zPJg04rfGuvtx/Bga5VXgc5qPjTLHOPgCojWC3hd0e1vivI79WH0G
         SrxiFIuWZ799bXKmTldIzJbAhBrByFjRtpk4rme2JslzDzfH/wG3whfd42Za9qntB9Cr
         dzP4EV2xwnDMaubOlQaHdl1ZqK9lJ6DaUcsx+/8LxskTbVwyJZAIvS3znkib+xNi6wZa
         F/df01C/lRs4vlR62UNO0IVLAzXy3YVI4HkT6jL4LihxfTvMuSjvrh/3JCMemEG2ouU8
         +sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520288; x=1735125088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1vBtYt51jNW1b+jxORD8K2hfreZX1fSorQB5nRIglI=;
        b=sUDy7qcNIX92tOUYK9GZGLhYMhWjiFG7odIit3KUw9fC0Fkd+Excm2FrNPFt8Mt3eZ
         PXXMKiUtHhz622jGIqpsRPlZJX1fyaL4eO17/436hWDXXhR57PkGzjhg1Oa8HQS3JiIn
         BR3KE+zyEoK34SBwt1C3xAO4fHL+AFbOM5Rs7msnS1l4cDezC5XhfIxUOn6nocvVW7mE
         0qHscGBMbKc9b82dHmYhmhZXRppSWEMcNyjx2TMg02N4Z5XLxRWD5q13Su0NHhOKE8GA
         VQl6S1QmALUQBBnTfxVw2fAYgXbNbLi/yFWK96kQEBVXcXFrrA7APAQwqs2r5XSH/jdI
         Kf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFd0yd3MQJQ9DC9G/fcBi+kjbGoMTg7Phv/q/OzP7Mk+RUziBbC4QfnB4VlWvb6mTX5BVd7fAnrrtyGjf7@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuHctAd4kqr1Oa8s0+zCoVPvG884JB43RyRdPDhRR1xE1Dobp
	kYJMJwwvJ63tC2T8l7Tsq2gtZREz8g8YprcxBg0yJ3FLci3A2MduVFMqyoqGv3I=
X-Gm-Gg: ASbGncvmbawT0Kty1T5+4GXBbYeDmqTYCaQ00gFh0L9JhR/rHYhtLGac8pmEEopBIcP
	0CD5MJrqQx5hnQgm0p4zOsARi082Swp826WaoArC0GxMSag0Q48bNE7zlMO+dDIo4F929o4LSA9
	XkwT8Ib3Bsqc8lp+5ruI6zdrYhmy4lTWe+BxLUca+vxYGcuOOg7hX/Eoo0+JvwN27QQAL386mtm
	52XzW7SpgrAehE+DYaLZRykTTg19BDUF3uR9Re8yzMXyrPNzcgcdCe3qdCkVLBh/qXToFAuMzwg
	aNvbmF+0JzIfae5cGszz4o/1LAgvun1lXNnN
X-Google-Smtp-Source: AGHT+IFKDFwLbzNb+6y5h6AOCmoJ6d959430sCJ0CNhXDfR1u2zuzoAYdckeGZsJoSPcXNOEy0WBPg==
X-Received: by 2002:a05:6512:114a:b0:540:2fe6:6a3a with SMTP id 2adb3069b0e04-541ed913250mr979841e87.57.1734520288077;
        Wed, 18 Dec 2024 03:11:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13ecesm1382042e87.204.2024.12.18.03.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:11:26 -0800 (PST)
Date: Wed, 18 Dec 2024 13:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-ID: <pyq5je56m5cxu73zxcsrboxoy3nhdf4pgulqbl2j4qiifacvyz@frlsjlb3jgoz>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>

On Wed, Dec 18, 2024 at 03:54:27PM +0530, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver:
> - Page address for registered buffer(with fd) is not calculated
>   properly.
> - Page size calculation for non-registered buffer(copy buffer) is
>   incorrect.

Please describe something non-obvious here. You are basically repeating
the list of patches that comes in the next line.

> 
> Ekansh Gupta (2):
>   misc: fastrpc: Fix registered buffer page address
>   misc: fastrpc: Fix copy buffer page size
> 
>  drivers/misc/fastrpc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

