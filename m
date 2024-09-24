Return-Path: <linux-arm-msm+bounces-32369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402B984EC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79167B22BAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C6385C5E;
	Tue, 24 Sep 2024 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzz1JR+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A01487DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219828; cv=none; b=XwChNu2NUrttHDVOTQBey2P7QqWrHLJOgiCtG4gJB5hD1hnXGczDspYJPmDXSUfIpZXt1+NfjFxnSQyHcvvHbHZNUkhZm6uMwOR+S4kjMA22IYal6w5oAUBSERiVMogFU8ucIXw5L+TbZPJGokWu6mvUvoR6PEDivLJtFFdWRSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219828; c=relaxed/simple;
	bh=abFS+qOb693DHKb9vQHqbR04KyCJ37Hu7oSn0DtHcYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hM7exQhB9TYKUIjuP1AQMIC4a7J36bN6wPDQHo6MZnHiOS+Cnzb8F7w6GPRu/W7ojSX1PVxVPc5x3H0mnZUFRB50nbqwl0rjWIlYph3F44pgHwug3aPfsTFzuckv1TfbOl++KxDhwX57t9bcJJNy0ibZRSyhVb+ihg/6Fi12AHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzz1JR+M; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75de9a503so57101801fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727219824; x=1727824624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=amf3q/K5YstY5wPuuYpFOTakoTT4hxs6zudXgHWSQJk=;
        b=mzz1JR+MVJdeWIvgFH8QpNWoPx9m4z5VH9ocpanhHhSklGno2lj7fHo7oNlwkUu1lY
         qOBs4OX3DfHBCLiV7cfStGZFBpMbM/eQPW3J2FncY5vqUf5GAk9YvG6qLWN7VSaOfavy
         HA1W6NOsyc5Zr81uYT314UFHQoUSDwPrujSROeV/9p+cx1ge+1CljSMRONeLl21+1N/d
         4ORxvDC2Fp3sSb9Hc0wLQioqdGuGxZy8/+rHcpd7M4WjtkRgNwywpivBk08fcbwWkeO+
         +GBAZ2CfAAgKoZK1tbAW6qwfiDQrfzIbOEzYlY7iAs/Kp0ku0+c8/h2iO9XfEmTR01HP
         g8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727219824; x=1727824624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amf3q/K5YstY5wPuuYpFOTakoTT4hxs6zudXgHWSQJk=;
        b=i9Zlo7+ItcF2Lv2r9jiE5t4R5DrR/MyDtXgRofEEKssO/PrINcbAqTj/6grJcb/JJI
         BNj4HVkEqcQTU43tu+FPKcdpePM0eJpit2JycaU+tF19Yq3eqhKg4AZPyGXpCgkdhHOg
         5Z+80S5ULQSWBAOmiJmtcTLU8lL9WL47HpKDGxYzlXr58J4xM6tvLjhw4YhLlGY0Sjk2
         RCh06MhqNT4hM1Niso/P1BJV4F8XeT+jPKnTah16/kFJgse1uETO+tiuzr4IHOnyJDRX
         Verr3voLMNOeWDkUOJWRCfvZG8FldgwbdwP+aRG8mg5tpprViARq28arHf2pqOlwxsa2
         Mi3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrm6L6lSSr8BnmG4qlG37Ap8Z4nuEnIdxCoLUSYZN57v75vBDYSVnwpgtF8tO2QbNIlTNWJkSRCcGYcHUw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8raVbfYL1iL757PXU1KefyXGxPz0pYFgdhlaRASly3puW7/3O
	8lGTQEz6LQOsUB5CKk52h4T5ZMDZr+qo6xCyuF0HF1zEG/QoUAeN1s6K9DAxRqo=
X-Google-Smtp-Source: AGHT+IHrcqwe5Lj4ifpe/VvN6Ok72x0l12WG1jRQc+gjBjBJs2YI2Wo9HDUJ71yLZDgpMhF1y7Ff7Q==
X-Received: by 2002:a05:651c:50d:b0:2f6:6202:bfd5 with SMTP id 38308e7fff4ca-2f91ca426e9mr4371961fa.34.1727219824482;
        Tue, 24 Sep 2024 16:17:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d282ff00sm3383631fa.25.2024.09.24.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:17:03 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:17:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 07/22] drm/msm/dpu: Add CWB entry to catalog for SM8650
Message-ID: <w2af6gh45xiw3p3iruqemftdysmyv47cxftogalvs33nrad5xt@e5jrv7bk4adl>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:23PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Add a new block for concurrent writeback mux to the SM8650 HW catalog
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

