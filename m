Return-Path: <linux-arm-msm+bounces-86098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC25CD4AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 05:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EAC8E3000B7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBC027FD71;
	Mon, 22 Dec 2025 04:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awkLY/5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21381E1A3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766377354; cv=none; b=Xh+R1TQdxgowiUV3IeiCYQhQqMzMYfxF2xZNcVBfRcm0yRg2l2IrrKNBWlpWH39Lc5k0v8OHQ9tpKYs6eH483hNw3ZcfPW4KTFkh7+98y9pOON3gFOxiBDozeayEHN/7Yn08nws06rMSSgd9sP3XiWT1XmcZmyR1B43lOQaTO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766377354; c=relaxed/simple;
	bh=0LwOEmSLUvqtOCFnBOOkFA5xwF1Cm1Ys6DbVr/XikT0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YDGYjMVKXXLJIKPFIQMQeBl+aW0ZBaBpmIAzqN3W9kE12+4AcGAPgUrHPHZG+KlDWt1S2IcYqYdhN81jmtJ10UNKHYETzCwxvEul8TASbBuD+BtDLvvVbBMEMmVt7FPpX8b4gT7CYh8FQ8WJ2/D4Rg5ub5ZYyANuOaV0+kWQ05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awkLY/5o; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so23004395e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 20:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766377351; x=1766982151; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LwOEmSLUvqtOCFnBOOkFA5xwF1Cm1Ys6DbVr/XikT0=;
        b=awkLY/5oXNBRR1PTFM84o7+kdw8iRolfrYgnDWMFBE2DzbgjJxUt2nSCm/rbj17GAc
         DBZmqWnoUgSJuPSndUddgJWbWocTRYysorTvNsod3FykGCP75pkuPuyryO6GhuXsSNwt
         6/HwdDJ2SN8uMfAARMAc4xVPXsDAcMULDe8VgiAd+tNJmVw3BAg3hFIoKGKQio21RSxc
         Rs0VVpF+jJGKTaFg0nBn5q1/Dp5OQXC0dZ0akMdACraTvAP8v9vUIR2TRVoepx+dSJLV
         NpEVsGJLHA6woE1SdpyzB3ETVo8i/O9co5CNU/t2LFde1IZMssOkBis7HKMYuKhTlg4+
         MGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766377351; x=1766982151;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LwOEmSLUvqtOCFnBOOkFA5xwF1Cm1Ys6DbVr/XikT0=;
        b=NHFNPm491TW7DEp7HN6niynNUOENllKdoCMxLERixtmSNeX7jBpAOliYZA5552jNpJ
         0007U8xqmxV38wKvOJ+mDjq41My13Yf4Yb/hdvUo5qNaSprJGtAGCcvUjtZvx6Kmqy0J
         SBkHHVzK1qu//nDladjA4UoRJM53//CBpalPWQO9P/IhjX5c6fDY+jOZr9hEipdQYTAH
         EE5p2N+BSVsAsLMgigOJUPVvjsniEiI1r62R0ZCe0vHDIj3GBvDgt1LGWcxeky+tWCWs
         gQbgYMhzlDwBPlIq3ajBHTGi2Patbz+m3ICh9eB5EG5vzbmn8qocvCMmtHFl0yziAFaK
         gCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG2jr0PdabfUUZJHzomkib+hBcMO3I3Dbmard7GzgayBvO8xftyEaPFEL7OJI7yx5OP9Et8kdlkd3mlFhz@vger.kernel.org
X-Gm-Message-State: AOJu0YylOzODM4TZkR4CChzv4xH5JBlsZfK49nPM8Eau8hil14cdt3lP
	AIe138+8v6Wfr2I8oJ5rZS0EtC11LwqE/yPoZUjg42KbP401ij8DrcmpLskYE8fhHhs=
X-Gm-Gg: AY/fxX4bEgvWPYcRnY9+SYPKaNNIpXuYrR8mmlzVN1pawKfBoA9QTO/Mz/lbHBq6rdQ
	cmElzozqDLxTGe5Mo9f2RlhVFDMY9L6Vz32t5z1ponnRAXCPfvcjxiRZaCEWWyQn3iHoUAVjTEO
	CSuVSfb4iGK8UPKzwYUycKY6ounptOFKaXrEM8nuARoOwAkGR9z/jdNYdAYq6OC+tRh1z0HM6vh
	+sK61YLtm4GSTtEYN/jxDfl8UhQmR7ZimOa0znecfuxXS3WuKDxt5x2fWu+im2YZKk77KBkpbYE
	r+TFu7Gk2EZVsvr70GcJshTKcAw9r2DdZ6wbFgNAB2APIzLAo/RrRDHH2qfkatuVkN6G2x8K5he
	1DuMhdbRLOpl0zmIBTg420PTNJnxo/XMD3M5g8U0e0uDXCwxFs9stQo4GYpg2t1sJarq0vWC5HH
	bRAU1wRcukG6Ahq/XP
X-Google-Smtp-Source: AGHT+IEs9e4aPSZitB+bwWgO0s/e++ZvJwYm1tGEu5X55DpbwZELF7OMqDSKx6sWEcr+z5bswR/5FQ==
X-Received: by 2002:a05:600c:350c:b0:477:7658:572a with SMTP id 5b1f17b1804b1-47d19584900mr84023475e9.20.1766377351470;
        Sun, 21 Dec 2025 20:22:31 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:7db7:794c:2c30:e530])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm19706896f8f.31.2025.12.21.20.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 20:22:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 04:22:28 +0000
Message-Id: <DF4GIFQ51LXM.243ZASZKP9NJ7@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] ASoC: codecs: pm4125: drop bogus container_of()
 error handling
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Johan Hovold" <johan@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251219142715.19254-1-johan@kernel.org>
 <20251219142715.19254-2-johan@kernel.org>
In-Reply-To: <20251219142715.19254-2-johan@kernel.org>

On Fri Dec 19, 2025 at 2:27 PM GMT, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never return
> NULL.
>
> Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
> Cc: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

I was about to ask to check other drivers/codecs, most likely
wcd937x as one of the reference points to pm4125 codec,
but you already did. Thank you for checking this.

Acked-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey

