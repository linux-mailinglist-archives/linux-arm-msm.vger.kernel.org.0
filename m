Return-Path: <linux-arm-msm+bounces-23737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA955913840
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 08:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 938B22820A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 06:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E326A17C77;
	Sun, 23 Jun 2024 06:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1ad/Fxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43402FC08
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719122480; cv=none; b=hkpaQLMgx9FgwDLi3PAwHIObhetdE3ntBndxsLgnmFzJrTKjQRPH7CStsI4B7Kt8Z79WT/Xq9ZivylXVN7BeyeGI1MHwH2y3oEYlLyb+sFm+kOIaktpn7aX4v8nILFao5+HBpj4WTQq8HrLak1ddj7D/1Mj4VIxPbvAxoaGyGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719122480; c=relaxed/simple;
	bh=QsXiMBMnUlHYeP5n2d2JvKCASEy1EtNQFInS1FsH9e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2YcFDU9s84bKRsYz/aCAOD4yel5qP4IcVkVtoPCOoZpZRQFXEXEo4jW4ZCL7Ch/pd8ww9acH3CX5tFuX6S9VoWEu21rDahD0sPkkZnPoHxcUUWU5Qi2Mg6bZe1ryue7U3PWj4cRGHmFSjno2mmAiuns5Ux+6IKNGDBQetc6It0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1ad/Fxs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c819f6146so4206086e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 23:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719122477; x=1719727277; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oO/yeKrqlD6AMd5wV3WFZIiC2wA8T5SaNuGSHMCz+LM=;
        b=T1ad/FxswEPv/V/HK8eV2GVBIH5w4LWZ5lvO7rxh8Cob56L6aznAIgqvzdOmx/iL7h
         5d2uM5xW6Qgv7YmtKjqg0xj+Q335uzRiQgM6H8w/SNOPGhYl28tc+lhihRNV8rymMc63
         ECZagKN4teoIBpCSzKpUEkEdFHQ6+W7sZwBW0AVhZsECDBfVN+xxaPv7qYgH5HRSkF8w
         oI0jCepgNa9WdO+b8zY5mhekG+3sbCdeyCcJMu5NlIrPyv0Sv/U+msqVupXzb3FpsPNG
         TLtPlbNQI9pkcyQSSBLMxrkDCDCrtp3h73NSXT2/gYzI14oROhs7q2CGVKT1nBwTMSuT
         mPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719122477; x=1719727277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oO/yeKrqlD6AMd5wV3WFZIiC2wA8T5SaNuGSHMCz+LM=;
        b=C7FVUuf92Oc2p0C0eDoJCrxYdYodmquZlNhLggM248sekY0mSoS1QfE6GWX1DU7E5l
         QmegAAe0kjYJxW+ORq/WuEv1OZyOTgh4AqNRp6zJNYTiX9StgZ1WNBBeHv5+XJyEzdNR
         5crUZL9SqL91GOaeQ5EARLSv9m/c8N3dpB0RYnBlg1L6knplBpludCxWejM1TlzsfSKY
         O2HBMEbmsl1CrR13sR3772vkTD6uDQKhp9W36b1sd1o0yH2dQeXunk7cnUalvwnrDq0r
         1tsl5W+YDEkGzhmeRTQ+siR2pLoD+6q0QYF7QscCmTtrOQvN6dZ/P7F1TpkuTmx+mjwm
         m3fw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Q0+UBF2yeQdlRXVI09ZXymoDQ+eOjkaCttV1qL4zeC+9eWXXJIXC5vUutwxXBNyD9ZUltPPJku0caCIvyb1atHeVEEUt7iJdkzH+DQ==
X-Gm-Message-State: AOJu0YzlV/e/OqznNddLK9ArjsBBEHnS8drBfJPxTPOv7GVp2RU/ufD2
	HskbjDftaoTUq94k4bH1KOwYOFx2EjxBTTUweFYwypHKurxvufm9BuSIbR6jwb0=
X-Google-Smtp-Source: AGHT+IFPlO6IKb2eGiTUnC9Nkv6WxHGRszGQWaUUwUdgPx1JDS5kmDVtdDq+1Ch5metEWw5+VYTjtw==
X-Received: by 2002:a19:4312:0:b0:52b:e800:25d8 with SMTP id 2adb3069b0e04-52ce183559fmr598972e87.25.1719122477496;
        Sat, 22 Jun 2024 23:01:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce17c3821sm162388e87.241.2024.06.22.23.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 23:01:17 -0700 (PDT)
Date: Sun, 23 Jun 2024 09:01:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/dsi: Add phy configuration for MSM8937
Message-ID: <hmgnm7xgrf7bzae4wkfz3rvhmubprsa5qo3tydjq3vjhapj7wj@klsgm3tlkctg>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
 <20240623-dsi-v1-4-4ab560eb5bd9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240623-dsi-v1-4-4ab560eb5bd9@gmail.com>

On Sun, Jun 23, 2024 at 01:25:54AM GMT, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Add phy configuration for 28nm dsi phy found on MSM8937 SoC. Only
> difference from existing msm8916 configuration is number of phy
> and io_start addresses.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
>  3 files changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

