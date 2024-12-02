Return-Path: <linux-arm-msm+bounces-39903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E19E0656
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFAE9B29894
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC43205E07;
	Mon,  2 Dec 2024 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxeMPYfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D383F204F87;
	Mon,  2 Dec 2024 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151830; cv=none; b=nVHb4YoppgWHPVLZ6EbOWS+bS+cGtVC6eqVzFMlLWTiYegDzLYn27v9aX902/0PpdpNkzIFx0j3yxc1pIevTcsauy95xYfA50qil7Liej1QExCNMWT0JaeGN5t7rnffEcSTG5VB43vm1QwBMo40K2TxP3V5qTl/pWZy7ZLOxjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151830; c=relaxed/simple;
	bh=85lFhRO/J/E7HnOpdb/OWr3TDzN8MFbfHpzs1aekHnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=somauUTaPQBm77DfAzzTtfREDxi27cFvmc/pQY7it3O5O1tUOrxW8wm+l5/0V2QZ6yq5+MdaH3z8hIusAE3Blgn1PKNvnm0frnkFDsLjsulrddhUlM+LXyYSEg3Fs+7vlBJULGPtBnHqNi7Eupg+FXeclMoC9JIexg+pPvbVyz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxeMPYfp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so35397675e9.2;
        Mon, 02 Dec 2024 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733151827; x=1733756627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=;
        b=YxeMPYfpHXluLj3ygBiMae5nBLu1cWPbg/KKohLUPfQ4ytIXeiJBvl6AyGZ9SR5CeP
         CXpdNd8fOTEfu8N9nU89ywU9ZrP0l8t3qBMFOpYyN4cseO1VfpuF03X2nxO3Tk9rwyVY
         ec0K0xgbFKETO85sD1tn69FwZH7+wnPRIGg1qBDDMf6n161dp3jLdrKijN9e49DthDmH
         +tSCeNjJa1E+fvLxavAiLJaihgYPVJln9zYiOQOf+IEGQNIuAjYtFwpEsvWKtHq6cokS
         nWiJ11Fcg+kK3ZHuT7JdQtCHfa3UvCxw50tVulaDWIMMSCt3D9AwDXsDLoXBEKhRoERt
         uY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151827; x=1733756627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=;
        b=wZuA4rsb0xPnvie/bAryQ1ush5M7Z6t147tmhKklSZH0Cvjnm++RT85LH4g2cYbOfl
         Sw0kFs6riqFfCgywbR45gOOVSLBv6Ejig3bzWbChNVDt95tMwk02Ha+cP9g3U3ioEs44
         OpzfXRgDLTimTgWBQC6A7Yy6afmmojwo+txuS+Oy84cPq0e6xPsKFysQS9clwLrK3vcy
         Rdpa5W7GYXVvW+o4MSq7tUhPOAECXiZSUQfTsss9PXLTCOoA8T5NNjqOb677yFcR+mPB
         N08dMOjwLIW7lgDX0ris2QaJDl16l9/Rxy6JJ4/OvfUgWK5ByEOVmmwp0v4rqR+jBsQK
         M+aA==
X-Forwarded-Encrypted: i=1; AJvYcCUGaoQtDUXekFBAuNlGM1FzcDjjxhbE2FSYdQGvQ+g+jIwKhRVqwuSe+dA7e252KBfkpxJonFRAOkopb20v@vger.kernel.org, AJvYcCUvGqrR4GJFphQXiyZ7hGvF9Z8lN+vajydwSFk00kdyefU4JC1gV1bjqv+QYC5fov5IAXxXbM5QAJcSNAZa@vger.kernel.org, AJvYcCVE3oPAVfoc/N0jjXp4jzNbIm4NFKv8lmXREVlgTy9sjeXAHr/yRTNycubPwq4xwuJSgq6hAJCwjUcZKvEQN6fQ14c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZD02S0rQidhfRRWqGdmvT+9gc/513XSHD+dI8JzIqUa05yH5
	fupSEK/OkRYpxVifiy2Sc9gZJeaGIS2JXnpTP34MJjq4C6OF/Swk
X-Gm-Gg: ASbGncvnyCZTrKZACnGOxaXJHVTfM+E4O4pjpGu3pnmayLlXa5eIHa3Vbic8wJ9CSzQ
	pAa2MnsmwCqqRCt3un0elO1ANs51+7yXQpPIsDOt+v0+Yp2pft/19UosCrw/tK9v6EymcZ0N7N9
	G5JrRN7+e1+SDuE5u5tNkGMGYZVaRl+GliRS4/UOefIO48XD/ggcgYnlFRHiLIt9N2O4HhRnVVT
	9XTyl8ruQk9zDGvI+nvhl0ypafFxkBizs5rfPZNHP76z6k65BeXG8a0PVg0PxBdoQ/D4aozr1tC
	AMLEI+f8Mwvx8mazepE=
X-Google-Smtp-Source: AGHT+IGDnqoQPM9S2ZXAYcJFrCBwMFmcYVdD5NrlXMVFXBAOrzgALnyLT6wqVMw+fFjssl311bGusQ==
X-Received: by 2002:a5d:64cc:0:b0:385:f092:e16 with SMTP id ffacd0b85a97d-385f0a153ccmr4698133f8f.55.1733151825042;
        Mon, 02 Dec 2024 07:03:45 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ec6a3d8fsm5080310f8f.101.2024.12.02.07.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:03:44 -0800 (PST)
Message-ID: <0eb908f2-2304-4a91-9c91-e7f291da9dcd@gmail.com>
Date: Mon, 2 Dec 2024 16:03:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/sti: hdmi: use eld_mutex to protect access to
 connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 01/12/2024 à 00:55, Dmitry Baryshkov a écrit :
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Raphaël
> ---
>   drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 847470f747c0efad61c2ebdc3fb3746a7a13a863..3c8f3532c79723e7b1a720c855c90e40584cc6ca 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1225,7 +1225,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size
>   	struct drm_connector *connector = hdmi->drm_connector;
>   
>   	DRM_DEBUG_DRIVER("\n");
> +	mutex_lock(&connector->eld_mutex);
>   	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> +	mutex_unlock(&connector->eld_mutex);
>   
>   	return 0;
>   }
> 


