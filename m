Return-Path: <linux-arm-msm+bounces-43111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646D9FAD17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D420618844D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A0819149E;
	Mon, 23 Dec 2024 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSPqvPAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B317BB35
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949240; cv=none; b=a7w8POgme+2enZ5qFxz/iNjj6VwxV3DtA9HqCYU8+Wni6tlqRmAuZVJcM5OrnKZnjs1WOaZRQYMv0mLg4QkQCCDJglU+i2yWYgbd9eNeHZdnWQwstSchhBWKjxcINZUznKW0gE/sPhPT2dw0Ve2kxM1Wwic4VEo4RS2iwiZItUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949240; c=relaxed/simple;
	bh=YQ5GjLoCA3Y+Jn/Ppy9ygZ7SHlPYCBHyH1SaK76iDjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ei+9U+stArjMUoePxWU3eXBwuBu5JBHoiewC1ka5UqBOGuMhZde5C4KDAxAmjUZNploicC/oXHpa7kNahBLhZsFrErSgtA/dSFmO1jiBn+GySS7VNW5IOr8h//phYdmOzPeHh3ytgoSCAREz7NDZHjMuf03QWU1xnSTxM7G1n6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSPqvPAT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-300392cc4caso44991911fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734949237; x=1735554037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7BdG2KEM7N5ZoDGzjtepOxh5S9LOQZbib/ahN8MnCUI=;
        b=oSPqvPATxOtUlz+6slXWFuf4CX/S6aHkh29PXAQokw11gaPze3rHTvlV14CD5jbVeh
         +dy/W5MjSSGOgtXm3MIdJWJRlEoEwXn1gXbZABIuvZb3DvzrLpY8FC2MGtWXLL87UQFe
         5oAdGo0nhJisy7jGIFUVmAWlZMv9xF8B7HhOETs3qgVBAdoJdVsvfZsp092lpVQD7qko
         3I1GRrYnR9VD8T0boqKBrqo26yNjP23fsEI5bdFYp1f2AWdVSVJHuitX+wS4wkZp+0th
         Y1DvKBIowABeUNqCr2SrrM3rxLN5nTl1Tgt2tQQN6d7HFJZyTS6olEAe+/CJBcR6mUZC
         Mq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734949237; x=1735554037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BdG2KEM7N5ZoDGzjtepOxh5S9LOQZbib/ahN8MnCUI=;
        b=HMPk6bLLl0P/2eUWpx8NT5r1ZDw4k3GpAs+WlezQQriaQJwMdUrC7RcmYdW6M++xwx
         RC4trIdjTQpFLUGSCTousKn2vW0WNFlOaQXoru8tun+i2Zw5JZrsPK3yUSf3o9qafPjJ
         Bb/u496Oomd/LRFJtVMLf4RR5ijTdgPm1vxaZwqGte+UKXrdxARTbmkADyvV1dpDiQ3T
         ue/RinlWjv9OKwi+IGd0ky41FvyGdkXItEjMHaBOl0cbi4u9xyLuMiBkaHCnAtn5enqX
         UlHkfJtFfuQJmQmGg22otqijWfPeG+ypF1fbocrEjYsBKEl76zFcq5Fx10mZvy7J3BdN
         Kosw==
X-Forwarded-Encrypted: i=1; AJvYcCVyYbbW3htZ0pHApgyZHI9btLkcNSng4g21MrX4Y7TodDGBqJ5IabDOzwzOd9mi9CavKNLwWMly5Qun3IvE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Hgt3fXA6rLrPaMEYRij9Bk0hqCg8qTcYuOY4QY2PBBf2bGYd
	7gYqcfPW/mtFHQ1Q7RmuTK0z9OqqGtTUrli5Mo+0V1ZNwhanv6KgQn/9vtuwhvy2Gz2p77z5UnQ
	X
X-Gm-Gg: ASbGncuMMlgV0CbQ6/Ij7VNqaeGlUBiAjlQ+DH/w31ziRI3d+3a7M9z52CVc0ALXOzv
	BDmoyVCvypKeq533FGv5ua8DvggY6fweMfXQvHQOiGZCrcWjvdhvL3ghb4bz/1rK1l0tkRS7YnI
	aFfIj76587k+L5TP6mvl1HRollb4OL6FoDRwwDJanLLYI8HJFkFFx+iS5JJmwi5/3KjbyDHN3q+
	UUepwf3TeudPWFE3KtpRFZF60BxAixoplSxJQAsUZmHhuvmdnICZTzkIaCcR2yzHg/8/Pa9n0rF
	vcTWidzuz7SV4OfUU5jTSt4f8D1t4IfNtukz
X-Google-Smtp-Source: AGHT+IEZ2NVogTrl/l2IKB2Z64bE7w+PSxM/M+cf3N5h+nH0zcZBrij9zXjP0FpluXqw3LeiTBOImw==
X-Received: by 2002:a05:6512:689:b0:540:5253:966e with SMTP id 2adb3069b0e04-54229581feamr3600119e87.44.1734949237046;
        Mon, 23 Dec 2024 02:20:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422360010esm1245736e87.79.2024.12.23.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:20:35 -0800 (PST)
Date: Mon, 23 Dec 2024 12:20:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anandu Krishnan E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Add meaningful labels for exit
 paths
Message-ID: <vn3qkcc4ufc3mzpk7qakg6tfujugcvonakkvinix5q62tthmpu@pjnex235m5ge>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-3-quic_anane@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223100101.29844-3-quic_anane@quicinc.com>

On Mon, Dec 23, 2024 at 03:31:01PM +0530, Anandu Krishnan E wrote:
> In fastrpc_rpmsg_probe function, exit path labels are not intuitive.
> It does not metion what the goto does or why the goto exists. Rename
> goto labels to make it more intuitive and to align with labels of
> other functions.
> 
> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

