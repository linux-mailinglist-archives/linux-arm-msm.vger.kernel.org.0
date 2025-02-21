Return-Path: <linux-arm-msm+bounces-48942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F821A3FAF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5506E442CED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C34B2116F8;
	Fri, 21 Feb 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/L7sqsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C0211489
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154295; cv=none; b=VFoPgr0epE/G+Z4r4GXZr0JkAjWzGB2NpSLFmCHqgd/WFG8hFsFrrZ4CDau9qoljUo7+cA/yGs8LoQDBt06VI/apngH+HsqleorbCNSNlSuTS0PJalhg9pF4IsYAwXIQUTssYd59AyMSe5gM3vuzEL8ApY6VWpAyHJOO4NQST1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154295; c=relaxed/simple;
	bh=o88rw/tjy3HDPJmDRmZM9kcyWyrDf9JHvuhC10NjrKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyi/kTmX7CoteTwn4U5pxv1Q6U3EY3l5KVDEN9i4lmgzuWQvru2BNBIsv5wcNeunR0yMjPYB2aHtiMxpbULDFP3irm44wIJAJGdpNvRBIKR1jL3ZRdTJdN0tGYj30dKx/WMGuHbid5TyFdXb+ZM4Izy96TTAdkr1cf1D4eSSP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/L7sqsO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30930b0b420so20124801fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740154291; x=1740759091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr3XzvE9aqClELabiY59euwbUIuS5g53m16CEDx+PQs=;
        b=B/L7sqsOMExoXjLPPriEqiguh05/7Wx6VdyzE/E1EpXGKIqIFMPtV+gg8V7XYIs1ek
         C6+3WUhg88pXBBBIPuqFQzGBfNOLsgqtnwwEXIriHVmOhJYcRtb+DdJxmEGv5O9VsDC6
         eDWqC1IQUlns2gXf2RwwF6OM0LCjozVNdUBGA8LF7Q8c4DNiM1XRDiWNrthZITRprodC
         ulJXmGZbclPZ8DO3OLY7oNzsqzk6qiZ5NiQ/GYb9KLx8xY9UGhCq5ed+Li1KuYr8sFwn
         ljxFjlVC3NgdoZzslanC2OihQjdu+ybsvZbogzc9yoMwpHkjdSiZTLm80e43T81vyoTu
         GMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740154291; x=1740759091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr3XzvE9aqClELabiY59euwbUIuS5g53m16CEDx+PQs=;
        b=DHwpBEZ8iYzYU09+C5Vw2m09DuE7NDmzNheUJ09X01vdGLD3/7vY8eMhVtsZ2EUCfC
         mdgAKFDqT2RsPuPDIZ/YXDvhKmYNQSTHXw+1m6NIh8w8k5r4y0fzBew/spU9wW+hueXw
         Td1a6RXdssrS49GIFmNSJSpgeR3kSAWGwn9PuKIaQKG9R8mYFxlzOs5LCEPJDSetVLJz
         oam2O48d6KkuWOl2enhs+GcCD2ouQPzZFgo0vJGY+nF+XDlZY1YCA+HdYtT1oqMR+Kyv
         hS/dvW4Is3hTIbSHSoo8w0sUnW1iIqJRrxSVixhinscAYGYH2IrU/vdFOvK4qUhT0k5h
         FDvA==
X-Forwarded-Encrypted: i=1; AJvYcCXWDfaPWJLRdn1iYmTWqmZjADS5/3UhLeM7EPJAwMIxvkdIiNkLZprIeG6/muXAuRGi2dsOyFIXosouoSNq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NCP2AY6RFvzfxILGOFXZfIPrAXAcIwqzjtDoId/ymGKD3d9w
	1qPqBU0Gzd9OmvYRCAPxW47Wkg874Pwj6wJ9g7GqOc+yfynxTOiwZhexCs8OPtA=
X-Gm-Gg: ASbGncsNTUCS/0mRbPU8akBnLpKrw9poHN9AksoNuOPLrustKzSHltiYF1pZ4wmx7Sf
	sxGdGmEHDagaukiQDhvqe3pIo5tRK/5l17y+uomMKYE2XXPoMIy9bMNPe/w+CQsIGcueb6w6Wrm
	UEdleQ3smkqsBcSCt8hNTBRdCHkN1h63rRU8Zyx9uP/zDAr1W9/dW68R7g/LOESVp6+aGuIz6p/
	yVCP9b9kv3tIYJBujH+gBtCvQWFSpnElsx+toSZSTxOmxHV+8814OSw38dkMqtBV0hemqdmJyT4
	aLuSFHZ472/H20oIm+Gogujhol85Ffp+7wBUozVr1+qwisEYBrxiTZWmdxqlQik0dLJyos/d15y
	m6tYDlA==
X-Google-Smtp-Source: AGHT+IGfxPa9wWy0xBwDTcpNaXXhV+ontjmSCYJHc06VMOigSb61bjng4QxI7OTQ69hRP9FYbbAr5A==
X-Received: by 2002:a05:6512:33cc:b0:547:6733:b5a3 with SMTP id 2adb3069b0e04-54838ef5b91mr1459696e87.28.1740154291461;
        Fri, 21 Feb 2025 08:11:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54531815e02sm1986700e87.228.2025.02.21.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:11:31 -0800 (PST)
Date: Fri, 21 Feb 2025 18:11:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 09/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 mixer reset
Message-ID: <tggda55h5mbhqekdmkkk2xpww2mblmtnqz6l64uv23eoh3rfcj@reirdm445sw3>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-9-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-9-3ea95b1630ea@linaro.org>

On Fri, Feb 21, 2025 at 04:24:19PM +0100, Krzysztof Kozlowski wrote:
> Resetting mixers should also include resetting active fetch pipes.
> 
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

