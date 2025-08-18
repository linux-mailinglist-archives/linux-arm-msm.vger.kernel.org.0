Return-Path: <linux-arm-msm+bounces-69603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032BBB2AC8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 17:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21694E1357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7DC25228D;
	Mon, 18 Aug 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ky0zabez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD7424E4C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530247; cv=none; b=nLoOKGmdTXzWTXktFWQUaqjvWZu4hTMYNaMCpRjQcOlSEG3ivZYj2XGEjD1wjXku2jq7AddcLY73RZqHrYhGA3xbgfY9zOwe4HBtfxkfKCu+YUi5HvtdPSIEQlrMyrpnF+QSej6gdNZRZrYq7fYAYmQKxmw+KjnABd0Nlq1zoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530247; c=relaxed/simple;
	bh=57TgCTUzq2WeMoiCZcm+8XUFjfrW9B/gu5wfo9wb4QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAGw0/nuoQ23kNOuokjKTeiY1kIOhFldfCsRvPpOMgZ2S5gJT5ANfaajxDkgdBOuz+nKhv/Zv2BljCg07y1I56M4TFXbaKXjCHdOuwnRTHxSgR/Esui/S/gaZiWaHY54KI4g1+64oCg/LrYzEX9udiRD32eQ6uC0Ug/jZYaIuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ky0zabez; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so20213915e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755530243; x=1756135043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruLwnYHr/tBzoBul3RZxZxSWPFtDBWMLZzMZDWq7rDU=;
        b=Ky0zabezibiUhlGoPyxGYX9+ryKC4iqNLppKLCz5DHvL/f0KYpHTtfkyuO7W/K6m/4
         uXiuxInsbLhgmurSi04hUGyI8TEPiE4hcR+Nkee1UhB+LoGPEBoJFC+U3nQsvzxmGWTN
         IiY0xV4dJSDqlqkzRuVUZGSSSVbEvaoWrKkpgethdcshEBRlxPBA6IVh16KrxboOO3Qv
         uFOyuD/oGx6Ivi3oBaXzY/90B6vlUW9A53YwaCuCcgTuJNjteWopekUXBumUM7Xwu9Y7
         9XTBLTn0F61M1/PP77LzQ97VaydDPZgvPAh8vT+waqUtXE6qVsRcGiOEmWTDis4F/ySZ
         A7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530243; x=1756135043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruLwnYHr/tBzoBul3RZxZxSWPFtDBWMLZzMZDWq7rDU=;
        b=GyU6sBMaA4yPARsjPliVbRITHLN3obFPItDb7kFJLyzkJ8lCi/rg4ispc6WXDhyS0Q
         RgeRWjIMZxy8GoteCHosXb1ZiBiHonJ/ELniyKc1/mpxVXLYnh+LVP0yklIRfKXqCR/R
         WamuObOki6/qTGvnG1wuryRRKg63X0J0FVvtTIF5WasIJq9mqzO7zh7DK6H0vG4N7kSD
         auW0UTXFvy+OPwgxC5I0/gEVe+lnIZjP17znBKEFuF0C6sh8upfg3NU4a/F0dU2p0zLO
         WQ25l0EBBo0MEq9OdJhi5fScjTsO+92jslmXTCtHs5e6lZSrYwc0fvMGFy8A8VNM+PNd
         +HkA==
X-Forwarded-Encrypted: i=1; AJvYcCWIn1ovcJh/moYGXx8Ujg37+svjSkq6vA+h1qXZlwRTEkjR48k2t5Dfiz5i+DlxQWTYsx4tJjn4toB69HWw@vger.kernel.org
X-Gm-Message-State: AOJu0YwnC7GcMbUKG5zGyBsn+ga9ZF2lBk1x/FlqAEdcBspJnLPB4nNC
	U64QOIxtBsed/ZrRPk+zVsEMy0AU7kiefciIuGtxPfxknImw/1RLiX807xGxWAJrA74=
X-Gm-Gg: ASbGncva7VkSBCip0IlmKsDUrS8OJ8nxu7ytRLWXZQNicyy3EFMR7jbbON9YUoRObmJ
	cP81t8C7U0OARl5jqEX3mq+xH2pIf6UxZI7YaGaK0fMY4unBQfo2UBRV5UtMekRbNBLj3Jc6wym
	X2KjYeNN6mhQALhyT3d+JXK/r2Am65hSgyjy3K7PejWZbNlLLqkHV9+H75V2C7wdGmrUORTCRnL
	5muYAhwy28VceOu1R1ncxTJby4N1VlWUX1hMgCMyk9gzMqab0/JKHaLULQxJWrCLi32xgU4ngmL
	nt8vBHhqMUPwrXpSVIojfPHk+82wOsKTqnB+9dpFQiJYnwQi1mpYC3OJvoUK47BQ6+HgaDgpAR2
	VjOPCLUEaOZri2/2MsNN7QKwUGBWTkXKDWSMScPC/esms2563MVBzuC29DlD12yCC2KrZ+3Ow6B
	Aoog==
X-Google-Smtp-Source: AGHT+IHZilA2/hfOmnugF7xNO2vU8LKQeJJYan3o2cZZIRQ3JL1zMo3LM0oL19y1UKFY669tejoA6g==
X-Received: by 2002:a05:600c:4ecd:b0:456:1846:6566 with SMTP id 5b1f17b1804b1-45a218573e1mr102634755e9.29.1755530243510;
        Mon, 18 Aug 2025 08:17:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7c42:c1e9:a3ae:dfdb? ([2a05:6e02:1041:c10:7c42:c1e9:a3ae:dfdb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cfed5sm172006265e9.7.2025.08.18.08.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:17:22 -0700 (PDT)
Message-ID: <0e40af2f-bf57-48cd-9485-5321a05c909e@linaro.org>
Date: Mon, 18 Aug 2025 17:17:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/thermal/qcom/lmh: Fix incorrect error message
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, amitk@kernel.org,
 thara.gopinath@gmail.com, rafael@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250710175426.5789-1-sumeet4linux@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250710175426.5789-1-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/07/2025 19:54, Sumeet Pawnikar wrote:
> It was showing wrong error message as ARM threshold
> thremal trip for setting LOW threshold thermal trip.
> Fix this incorrect error message for setting LOW
> threshold thermal trip.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

