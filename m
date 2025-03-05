Return-Path: <linux-arm-msm+bounces-50415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BBA50D8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 22:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8373D188D704
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 21:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923AF1FF608;
	Wed,  5 Mar 2025 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kea5k2fR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34612E336F;
	Wed,  5 Mar 2025 21:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210507; cv=none; b=RxZSe4DLl5PwcJp1omnYmV94ngEoQQgzOOih9koUEcQ8qpQR1NubTS1EQVH2CUCo+6W63v5SttQiHrsalorrplRL79mGWOBz9smK3iMSCwlb+YMGLq7In0CsMjbgXMxoSjQmBNupwjG7THsg5eRHXjcteBtUVLuWzs2FFex7F54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210507; c=relaxed/simple;
	bh=ivlUgyT8iqfIHAOYNIubrZCR55JJaAGg4i4Z2tKZMCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UM1FwhYBGKlCibzQZvjcojQ6GL2YnoHlLWUyQ8gHsP2CNtqw5Y6kijbQvs9u9eFOwumobknnvPekx+EF1lG7vo9ho/INX04BeL5tOmkQAA6K6X3WmqS24eyzVHs9657Nh1QZNY/YQyMvhtCIngOdMc5IIGpIrtHl/g+Wjww0FjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kea5k2fR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so30141255e9.2;
        Wed, 05 Mar 2025 13:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210504; x=1741815304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkfOGAJyjI2lzXCaMBa1FddJd+TtvvII6nxqC6Kgsa0=;
        b=kea5k2fROZpqaNSKoigXu1TiFA/krkR1lZuoTylooBLISBEjOco8z/E1URrHKqJ2w7
         7cKFFjqDPrN+YsXgmc2lZ4GlbhlIDQOAvw4h57oZgcvgKgODnA/ruFVrNlyzAGp/NmS2
         lBUjCwfAE0Vt5Xg+AMeJUoFEDejZUj7/ccRB3H5AiVbXGaRCkBdOVh4WXGIxiC8jXniT
         BJ6f0HqM3KdwMuwL8RFU+KJy6k2/Q5/xP2PV7lQyAzHD02uVyqm8m1WBSgXty6M3i0Ec
         8P/UUzBGJBpZbUUf+lqyWqgGyrFGcyGsPQOdQUB8W0H8lyGhAE/9bQAFHLgL6jTMzYlK
         Hq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210504; x=1741815304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkfOGAJyjI2lzXCaMBa1FddJd+TtvvII6nxqC6Kgsa0=;
        b=ifqy6ZhRGltxIgl+raZ1DCnD0ah/dueCfqlYapEX3y2galtP2jfKDj3fTo00CvV/y6
         KJqpdh5zzB3vHzQa3iH54dme84IHOw5OYwDR+nFtoLHyqA+rMG81c64ePngHdghcXXJB
         fyCHQqPgOEMdo+7qlIgMPcS6G+WW5UfvUEKzDEqBDQFQArQQjka70tsK9qIfShnhKVC0
         1bevYRjeEN8ZYZAcvp2tEcaEL8nBntfgeB9Douv67LYINDc2YY5UbZPYITXfRCxM20n3
         W/iafVsS7JkAVGPy3zebbA5fQJQrJM7Ng0LtIzBzRmFu+KNb5fZhNJvImZPgfNJh46uA
         3ImQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQA4UsXFuOioHTsVvsvEVzg9kdjyLQPME/pdAj4TNVk5BiAjXr36ppGSqCJTxC1QKFweFGU+46LgHaZpXW@vger.kernel.org, AJvYcCWYxAFuKU4lpzf/1dUMGjW5tmF0BHq/JSRkLqEmi829PBPpJbx21sNdkzSL72/PfCRJ2z6JdTeOptZbwtaDxQ==@vger.kernel.org, AJvYcCXdA+OYgHlRZ2h+l8uSOOZ82CkKqUSx5V7dhQOH0AXLWqcjddwefrX3UxzhRdYF0C2pEojhWt6yJ6bvo5RUEvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjkoZMXr/AlCYKKLioGKUNCxC5EIS4NzeGtyhMxm1A24ANteZz
	Ye3eM1kEwBaWhD3jU3nEzkMiQqlSdgLDjDqgfoppbu2FVplWpEAR
X-Gm-Gg: ASbGncvdOrHtKbCNkswe+A4aub/NvL9ZHAdx1gXaUUFyg0fI7vR5Br85qxq+0DyrTVS
	aFOBhflfbAWjtP0UWu469Ktj9tje8yyMeel9+DDlQ3L+OVgt/xXLsZeh3ZHkulsANzNU2n/jGRW
	dgHfYNkZ8mFblyGSumsyRM7n8x5Fn43J3T6AT/XdwjRIzrZv+zrHCLPKy95ZtzYwmE0m5M7+ylV
	XGYQ7fWGoL2TyVvVn37cqRnsBbhdKoKtCMHe/s4756b06HQbzhcRoZFHVqlDdft9lERmjHHZZmL
	4XhDSveSC6xUlWaA1ap9SlWQgAtH6LBZn9EBffTsldOiGTeHDG9wUtmLDROEy3U5jGPKqalTkjQ
	aoIFkEjk=
X-Google-Smtp-Source: AGHT+IE8jxO6kdtaaWpEp4oWi8exS7NgMp++p3+pS078xL7aEkKJBfV7Vnbc8oFxX1styMXDjNOaDg==
X-Received: by 2002:a05:600c:190d:b0:43b:cf9c:6ffc with SMTP id 5b1f17b1804b1-43bd298a59emr40252875e9.12.1741210503722;
        Wed, 05 Mar 2025 13:35:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42e6bcfsm28935975e9.32.2025.03.05.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:35:02 -0800 (PST)
Date: Wed, 5 Mar 2025 21:35:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Marijn
 Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Vinod Koul
 <vkoul@kernel.org>, cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?UTF-8?B?4oCcdW5kZWZpbmVkIGJlaGF2?=
 =?UTF-8?B?aW91cuKAnT8=?=
Message-ID: <20250305213501.496ea4bf@pumpkin>
In-Reply-To: <ed9e65a7-6cdf-4d93-83a8-464b47a4bc1d@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
	<1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
	<13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
	<54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
	<k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
	<29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
	<e665514b-5a62-4afb-b267-7c320e4872af@web.de>
	<4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
	<20250305141732.26b91742@pumpkin>
	<ed9e65a7-6cdf-4d93-83a8-464b47a4bc1d@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Mar 2025 17:30:28 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Wed, Mar 05, 2025 at 02:17:32PM +0000, David Laight wrote:
...
> > And the 'fun' starts because NULL isn't required to use the all-zero
> > bit pattern.
> > Regardless of the bit-pattern, things like (void *)(1 - 1) are valid
> > NULL pointers.
> > 
> > Of course, while C allows this, I doubt NULL has ever been other than 0.
> > (It was 0 on a system I used many years ago where the O/S invalid pointer
> > was ~0.)  
> 
> Kernel style guidelines don't even allow if (p == NULL) so we would be
> screwed.  :P

Doesn't matter:
	if (!p) ...
	if (p == 0) ...
	if (p == (void *)0) ...
	if (p == NULL) ...
	if (p == (void *)(constant integer expression with value 0)) ...
and the equivalent assignments all behave the same regardless of the
bit-pattern use for NULL.
So:
	union { long l; void *p; } lpu;
	lpu.p = 0;
	return lpu.l;
Returns ABI (implementation) defined constant value.
I think the only requirement is that it can never be the address
of a valid variable.

	David

