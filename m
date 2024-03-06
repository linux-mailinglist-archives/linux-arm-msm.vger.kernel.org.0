Return-Path: <linux-arm-msm+bounces-13488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA047873796
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 14:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B57F1F21134
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 13:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523C5130E45;
	Wed,  6 Mar 2024 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZ9HSJKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C812FF8E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709731176; cv=none; b=npXe4gp8net6TJ+Q5DBrwZZkpr32jLSGqZPdcumRc5lN012lWtDU7Q5F0ggKmu0jIqCTE92N0qlIDgScH2U83efoHqoxeoh8rODqtMR6fRTwi8CuLoc6yYGKhDnLiZu+91fXfMlVitiHn/Oxlbnkg8yJ2PaHtOCWBnI5M+CgLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709731176; c=relaxed/simple;
	bh=+1UnuQnf/LyqbBxxuD32IaDzT1t4IRlkFzEvr8mcnvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSduy+ldkAQ0HV8xfsPBs8F36YOwYi/DR3itoFdYlNFPtFEd+lKpyiKGaD72ZqN8J3Vlgf3Ur27N+tTZ2b/NEGppsttGRqKKuWH9rKatrmhdATJzfsHUlCmbv57yMvItDp9VagW7K4Hj1IVOONVJmHWXrN3J/MbrtMLKo6Dc9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DZ9HSJKp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412ee78edbbso12444335e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 05:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709731171; x=1710335971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5cNrhfZq9pdhzlYdh0TnEQMMStZp8mSh+S72NM+w1E=;
        b=DZ9HSJKpwDpiPaWokcT2Wv27Xan2794lpkNJy0gdiOSwUvJeWPMj74Ru8UOwtJRNbJ
         kTxEuHMW8n0JmVxGDL5gPlNhLIZNQwxr+wOqhbbOlozAhaZ1C2GfE+h4y9lUWU9QXBFS
         esegUvNg4D9ewwo5cY3AS/LGuIAsArbJM1sBUgF/SfNBhyjNITpoTOYQxbwrg3DTeUhd
         rY8cXCrhJEo4SazBLh/MVmfLz0zujOAlWHPPK8yyhmDVSlPRm8N8lAp7yPzpggNDqZzT
         7k1Q/QBPu3iSuXB2V7+d8S1KMLELPVcOAIIaGVJlzrL6V+hdNFa4EoAmy47UjetoSV3P
         dTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731171; x=1710335971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5cNrhfZq9pdhzlYdh0TnEQMMStZp8mSh+S72NM+w1E=;
        b=qWeDo3GyU/X+OHE7GoyBvSXvPJpquLhRJUU/Q/mOwmmgfXYDsWD8TKM5zoxXMI6j3U
         ZJZgo0HEMbqAPrUF9O6vRHf2jC0fyEoR47B11B/dLHlEAFp6rCDd6kdoASdv6uSO5fb7
         8YD9cML+ovzvbaaL/1qe1bvwBuGJL24rfetzNJmY6pZ6QfR+KNC7cpWf7moEFnbY7QSO
         QAwSrGHT6ponEzTUvC71tgpuk0U11jrlQhHSyLw+iPFamcxf9H38BAz9zLNKAhxbJKTw
         wImwbnmHkjpSlrrd738Vd8QGkDmKhd0IcLwuwe5jU1uD8t6irDDuhE9E5VRB1RabEOCz
         LB/A==
X-Forwarded-Encrypted: i=1; AJvYcCVIldk7FXDqAWO344YsXua5aweLT7NKCcq6h4aex/vwRqJ3fsSPIzVLNfBtUyAnCjX93D2QJvEv1uMNQhdV9wnTNSx6lxIJHLsIOvhzDw==
X-Gm-Message-State: AOJu0YzdKELNxuwPKubUSUwdp9vaOIT1O3TGv+IFoHjzB1cSRyu4WgDK
	ArjspYoO25Bp+x3q3jtn9+87/j5h6AY54YIUWZgflC+dfO0yGAcRO9Y+7V3kM9Y=
X-Google-Smtp-Source: AGHT+IGXrx3fxcNvDo/dCTnXE23sKVj53w6gS0mbDdpoUEKKWG4Jh7EN/sGvulC9XnL8uUGbmWo1sA==
X-Received: by 2002:a05:600c:4749:b0:413:410:1642 with SMTP id w9-20020a05600c474900b0041304101642mr13628wmo.10.1709731171651;
        Wed, 06 Mar 2024 05:19:31 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id a6-20020a05600c348600b00412f778c4e3sm1544564wmq.23.2024.03.06.05.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 05:19:31 -0800 (PST)
Message-ID: <6cfda2b5-b5c9-4d03-87a6-1c31013ecacd@linaro.org>
Date: Wed, 6 Mar 2024 13:19:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] media: venus: core: Use GENMASK for dma_mask
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-11-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-11-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> The raw literals mean very little. Substitute it with more telling
> bitops macros.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

