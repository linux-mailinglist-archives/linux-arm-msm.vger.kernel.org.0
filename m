Return-Path: <linux-arm-msm+bounces-48115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D0A36F1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 16:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB83A1892587
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD451DDC37;
	Sat, 15 Feb 2025 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VltFOaff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45BD42AA5
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739633282; cv=none; b=ZbcakOhLo9LgkicCryMDQxORBS/70Os0SsxkNhUVyr0kVPI9QaNqsJkqWKTQDmbPuUU2m11CcpAL4kDU8/s/mN3EqrovvLEhj9hmhJKHnagB24NGF6KAe2uf+d5AjIKolfj/B/k3VQOMrXlx+59MZy1gFbfhLMawPqtxAjiJb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739633282; c=relaxed/simple;
	bh=8VTYB10hPqOrf/u1pOI7j4P8G7PEOPP5ICNgU/q4IVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBVt7u/1IANsT7Qru5F0M8RmlyYFGPHjyd0Jmd5bsn/QnYpVgo5HAT2wbtnCR/R9EG+yf3hKz2GYgU2KRuqO5m4QIh0edkREYl0p2f4tAlBx6ZaLMWwhAV9k6sRAjQSH0OjHhPKdhSAD9qICCyMpxH6iawlaoV7EkBPPq0+PfVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VltFOaff; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54527a7270eso1793232e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Feb 2025 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739633279; x=1740238079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGf5rmg49p6MaNgIwMB/5odZQ50Ill9b6G6pRafnfic=;
        b=VltFOaffPDmZg/3+DKf838X7LTcmAYhHUDmL/QYgJQZaP94OAxCi+S90iVYwSoQ0r1
         Jfctnwoy/dhzYl5FkZzOcd7wcTml6ZqIJgBNp5UMSlOLn1tKE0rj1rNz+mLnaic8+bD9
         ZHd6+H8+4ODmi+KkZcFGH/PSjKkcccM4tpUCqWr3V0cx3JOnKEzvF+7hoNIUny90pWjN
         sx1Gqa/Wvf4Q3Jk/zoxVoWMpbgmHzn8AWABStZ4U6Xky2zKu1pRZ+nZQEc3H+z0PM67o
         j7tJFkXUo4wE5f2V1rZuPICR1cTAtGZOtnYxR9zngEDGpjcIHB8ew5TYI2GCHYOWuDBQ
         B+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739633279; x=1740238079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGf5rmg49p6MaNgIwMB/5odZQ50Ill9b6G6pRafnfic=;
        b=ClqW9+YB3wqDY9iNvqpfmkoErUS6lNZi+Bdz+wA/wmWWiXV0QCgpX4O/8smrzweDTM
         4zA+XyTISP9uqLooBb3CmtsPl9z/BWZ7OZ/1eytBwpUBJ3M2cF18OgQk15jmVePAUSLl
         Z2gd5OqyKoxsfMGs7uBLKjMNkmjRblwczPVHXJK3AiENly9RQ+BEo3DgSG5Q3j3TXm2F
         DgRrinrI2Ls1ojfkteRXTv0sWATtvxOxPrtkyi1xZHm9i/IaQY5mq2iRBdN4eQ7rltVH
         fcmbfPJB4QWnqqj/K/UihUxe++rTWFJFyZB9xLohH5X0l5m+T3hTZeONBcP4rV/P1ZcQ
         RFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0HbDGSlRJ8XtBJ8PYbyFylF2kDhmy+XAALL5H/JBobKxHmhJzUwg0zrNh09v58bvuTMSI78q9sPxgBQwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5nf05RU6LP0ZRdLJBr2py3CU0hxaxRv5Df363TM47qzyJbzbC
	2EBVbQbzTAFMm8bzZl75Eg1EQ3cqz8bE7VYcdqLiff2i2F4UXtJ/HJ8MgBwVjZY=
X-Gm-Gg: ASbGncsfO1W3ZR+l3kPygquax/viw1w6kZfa+uZFk6oqQ3p933o2bBGdgfxp8MdRDuR
	lKhemyWkvYunHJy2llQB10LK5zokTWJxHtmvqERNVN+3/eyBzExl+ypk4mP6NrsrJwnaVGZnMeG
	5vM+S3qLOQyp2hrngbxTOnyvw/n1woLz8Nzwgyv3xijO9NEF7xhf2AcFDU31rtE7lwSemGwGT0l
	jTNGxsQaLURDW4TYuLME+GeTfAUoNP7kCcNO1GSd0+GprlWQzZ8qIULjNQpxN2AzdW0GPKOkmB+
	MD/NGaPT60wk8KMOlSDfFr6HhV6bjqvRgW9gcj39h/E3dxt73LrqewowZ0PacamXsxnFPTw=
X-Google-Smtp-Source: AGHT+IGM2zzla/sAtpjhHsDca+TA2fL77Ecg4EGheoA5N95v+ACAAM7LoIlZRAUhg5mZDNj9h6xYJw==
X-Received: by 2002:a05:6512:401b:b0:545:fc8:e155 with SMTP id 2adb3069b0e04-5452fe4dc30mr1064901e87.20.1739633278874;
        Sat, 15 Feb 2025 07:27:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5453197f3f9sm162596e87.53.2025.02.15.07.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 07:27:57 -0800 (PST)
Date: Sat, 15 Feb 2025 17:27:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 07/14] drm/msm/dpu: Reserve resources for CWB
Message-ID: <55njf2p4cg24bihrp7n4laaize7onslfgke6bwqw4jfofsaxq2@epwug3zfs2ow>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-7-a44c293cf422@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-7-a44c293cf422@quicinc.com>

On Fri, Feb 14, 2025 at 04:14:30PM -0800, Jessica Zhang wrote:
> Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> 
> For concurrent writeback, even-indexed CWB muxes must be assigned to
> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> even/odd rule applies for dedicated CWB PINGPONGs.
> 
> Track the CWB muxes in the global state and add a CWB-specific helper to
> reserve the correct CWB muxes and dedicated PINGPONGs following the
> even/odd rule.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

