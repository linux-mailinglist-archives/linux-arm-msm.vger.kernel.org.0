Return-Path: <linux-arm-msm+bounces-12925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356786BC28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 00:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CB01C22BAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 23:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17E813D319;
	Wed, 28 Feb 2024 23:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7HSEoza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC413D315
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 23:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162818; cv=none; b=pY1DrVX6yLNj4gs0dzM6watBurxkrSp1gBphXoaWp9O4aSUKvFIallgKzXN6cG1S2tL1Wr2BO4+wroV2mApoFAE0WjTvIYg2FqJeWwh3WVMTKgZJd1M8JaDbRcNEhb5z9D7QQxhkbEHbzfSrKVrRBecNOM1J/oQl6XM74YKNL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162818; c=relaxed/simple;
	bh=8FTj6Koa44+7wIfYWJIPoAle8PfST8SPtRF2sQxL16I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcHGsgNS9dgc596VNBxM2YGyz0ingSgPe7iq/MkQ7QBUb4aeTLsgcuHVnKYtKlHfeh8441XCoFvkZSF0AFkxsS2XTUVOqbrHZkA1Yi7U5jzxeqTiqbKUoQzWGxrUZVpYb8EDPaSK9KrxiacIgPUBm9Mz685TbLzytpNKHMD8gPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7HSEoza; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513235b5975so273564e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 15:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709162815; x=1709767615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7eYiCisy9EvDzPpdsA8EnqFrzrb2WGQGdFzfYxWz3OE=;
        b=K7HSEoza7DCdIqrcWgXXP62YbQCQYuMTXvgq7CHcNaOta4aWB5IYuuPC4ZTd00TQIC
         dDRItLh2fANircRuUuzCH1UrwlY9WjWUkYNIifpwhQpZaSCv3QvyOjOFE9UCNApaduLt
         CdW+mGt3xCIKGv0rTlSKBJBDIehivzbzwHRLyo4oebRX1cs49wR2n6HOLU4FkmyciG6z
         1TUR+xNX++n69zJfmA2NwhWLV8fJkRy8wmSK/Feeme5DN6K0hzbi73TfyBdqJLngT4yn
         FhMoJWm4kvhic9OJBIgQUnC7VIrKHWDadTbXx+K1t2jyR42CznPlLgT0h+P8q7ZmuyiL
         VHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162815; x=1709767615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eYiCisy9EvDzPpdsA8EnqFrzrb2WGQGdFzfYxWz3OE=;
        b=sylHMrNtaN+0Wtr+OCVb3dSyts3uneprofDLlOl8yDrvfFARYCkz4AO4fT/As8pgfu
         FrR574WvoksRLSvHPlfKTb4Kd9jDl+Q+o884R1HbRELvdgARlZCLt4w6FVnJ6eWmcq/K
         JHAb1AbRSv0y/jhPQdCKQRtv9c72InjWHObp90nVIgmx3cfUHUalOYSgjxMo6vQ7wnDA
         BqemLx2DDtlR58u8QWC1rbPYpzFISMguHWgNq+MM4/zr/U07uVj79wd6o2TRl+os5YuQ
         OTEuE+A+UPejycP3TXrvNBIK9yhhKpTEdEohyLCmHR4ygPalGcb7lKUFKsaEdXhf4o/K
         AvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMSfYL/orOJ6mVK5AlFoWzfWZVKsO/kF6xV+DpDZeQeAyDQK+vrO8QshuhjTIRIc704PGcweyAuWn0m/vpAUQgTjbuz29N0FAkFVoSfg==
X-Gm-Message-State: AOJu0Yzs1121Ro5AQnZPrHuTBCiDluyADbXwqN9qeC6ZxyUmrgcmg0sY
	SqaZoD+lF4pnI9q0LjNouS5zYMtcOYUo/a6CU0xz5UzRdbg7LgjrV94isOqhVfI=
X-Google-Smtp-Source: AGHT+IEauPA8YU76AZ2HWn9YzhqJSaQh/sxY5dBOq9kCUqmFc1a7D67zChdJwrqxqulBHP/Mq3mKqg==
X-Received: by 2002:a05:6512:34d3:b0:512:f6a0:1311 with SMTP id w19-20020a05651234d300b00512f6a01311mr236650lfr.47.1709162815082;
        Wed, 28 Feb 2024 15:26:55 -0800 (PST)
Received: from [172.30.205.146] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512028a00b00512dec300dcsm28686lfp.2.2024.02.28.15.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 15:26:54 -0800 (PST)
Message-ID: <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
Date: Thu, 29 Feb 2024 00:26:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Use common error handling
 code in pmic_glink_altmode_probe()
To: Markus Elfring <Markus.Elfring@web.de>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Zijlstra <peterz@infradead.org>
References: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/28/24 19:05, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 28 Feb 2024 18:45:13 +0100
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

(+CC Peter)

Hmm.. this looks very similar to the problem that __free solves
with <linux/cleanup.h>..

I know no better, but wouldn't the same mechanism, down to the
usage of DEFINE_FREE work fine for _put-like functions?

Konrad

