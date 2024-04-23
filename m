Return-Path: <linux-arm-msm+bounces-18293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFA78AE64E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 14:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4DC51F231C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 12:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC2712FF71;
	Tue, 23 Apr 2024 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrBJgZCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C812E1EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713875795; cv=none; b=h3QiVPZWnpieud3rAgizeP/4xxkmua5eGZ+tQSeJ4hjGyQhusdC07IoQ6ayqXKWJXLeL77yT/fNXXJC/XTIWCI4A0A7urzcp+5D4YE05iomx6pCkRldEE0NSI1Tw0wkiBuSW2GXvBxnqewoKDhll1VUY/zP2ySm/gi+McRTGEeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713875795; c=relaxed/simple;
	bh=E/vCm6ZUaj+g8UsCNPxeL7wXwxO1N9+3euYMitEq/kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3jcf9jm4KhaynSxXR4FYbBIXYTOQBGsxzl7ewZiiWd/P1LWIViUtoIEqExpQbj9s1r5Y93gvvWzyWUFwrzF4CpL8nhlB0zptPBQVvl4Yf4Kort6NnHM1xqJz1QAizbAv01Ku9f/gO40FIQT08k88eXWb7haZQ6ZaUtA9WqO6DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrBJgZCf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51b09c3a111so3627184e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713875792; x=1714480592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EcR6wiJNuQG5uBPTgnJ94TkYBXMQrI+Q5aD+z7eMSQc=;
        b=rrBJgZCfdutT2wNhzCScP2VBQyB2MB3y4pi1ErsvPfJyWsQJD8jTyG2EXB2jjVK9S8
         VY83830xyCMHqQuueKCw8wK5rn5L7W2nyhqIiiM4Hj4C4jM713wBy9Nwv7SHilM2joEx
         n04oZVAe8cxgN4qjHbcdUyviDeobqM9lmMBePMg2Pd0UZ9PW5ReRsBY/fAufRw+YwuXQ
         AQ8fj7rze7PCQIiSOxpvnZpNi25cpdp7o1+47/VNCXOd2paTICDTADVGn/Ub+N3X18T0
         /k/uUb9AE70HliTIdK3JehfDrIFqVRVTm6it6KH/sfOjAJ1sLIiE/OiM9Z8qRZt1brzV
         qtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875792; x=1714480592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcR6wiJNuQG5uBPTgnJ94TkYBXMQrI+Q5aD+z7eMSQc=;
        b=PWfDmOuarm4f28GWNCxMinj2QnECihipMVrWXvgTVSAJKBzvcPntx54Csyb4BBZdXo
         WrLa3FPLDk6j99jl+E5ef2muwy+SrsMP11E9Q2iF7HHlryq4iHXC32vW2ZkLRsY1vTFF
         2o/RgN96vUW0RlBWvqQG6LFVAdvAXr+lDBp9bAHpRK8H2gG4roeIjfP2JbAoGaI+dXdB
         wCZiWhH8VZtl4hpVs0kb9NdqZct2qIN7NEoq+3nhApDjXgKs8vieDLtnUAiUtLEvpWmi
         uLdG5nUHJJ3iHTwll2ryEN2MaN4wNkcZCueAlyvCZ8VmibDDv2hjBrJCfgV28NpNN8Tr
         es7g==
X-Forwarded-Encrypted: i=1; AJvYcCXtzM0epHqe51nLVxucoFcV9aCPJCBze14Ib+F3EXzaHfTrKp2AXRvbvGoD3wmes41atCaYYjXnVEgKW6HwT7fgyj3XCyVGI77202i2lw==
X-Gm-Message-State: AOJu0YwbN5kvR5UzSR7XZrJvmp7zx53lBxb6cHEcN4xDOwgfRErB5XpC
	SlZIZqN447WgGKDmCNqy8O9NdKdxRP2NmcTq/PzLiMBghgz0fWslPS0mKno7Dtg=
X-Google-Smtp-Source: AGHT+IEJpRdPl93hf4hfOkqeiRE3xT9UUu8AhP8A1Hd+r8Zl367qDbSba7OkW4KPmf+cOR9c5qPLng==
X-Received: by 2002:ac2:5594:0:b0:519:27e5:83b7 with SMTP id v20-20020ac25594000000b0051927e583b7mr8063957lfg.27.1713875791850;
        Tue, 23 Apr 2024 05:36:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id d25-20020a196b19000000b0051af5cba0f3sm959407lfa.11.2024.04.23.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:36:31 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:36:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi: Remove dsi_phy_write_[un]delay()
Message-ID: <r2mx33pvuivenwxawsihrblzmuqucxcog3m7i4dy5o4y2qycsh@76frmib5x7x2>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
 <20240423-topic-msm_cleanup-v1-2-b30f39f43b90@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423-topic-msm_cleanup-v1-2-b30f39f43b90@linaro.org>

On Tue, Apr 23, 2024 at 12:37:00AM +0200, Konrad Dybcio wrote:
> These are dummy wrappers that do literally nothing interesting.
> Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 --
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |  3 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 81 +++++++++++++++++++-----------
>  3 files changed, 54 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

