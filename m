Return-Path: <linux-arm-msm+bounces-61838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E91AE0E30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 21:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E7D1BC4F52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 19:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BFC1D5AB7;
	Thu, 19 Jun 2025 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwEye9gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAE30E854
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362475; cv=none; b=V3wHUyQXbqMM4F8bpncWC9wCJA2vR2t0nK/AHO7NOiXxSFHvV5Jn8ZIoROv2A3doZX19YFadhSXfEsLf24NGXG0bz2CW6AdEfA5qg8brIpECOi+1jUv+RDkhSUGH9a8N+zNrcVALPbXimF/3i+SvacOVFfr8xh0sLcegwWhZLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362475; c=relaxed/simple;
	bh=WEPqgysH2b56sy2q0Oh6sv/OxKTLVLnKJ64jI4P+DPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azOfune4hMspCUITnruU5Bd6TIxZlummp/3yHosL0D9aHoPwk6cPJ7OPumL99z9yCBGxCE2aw4C5RgNjLT2ITl/jT5l75qg9nw+d1NDO9J+Cu+0YYL+P7aVIUH5Sxf/NEskv06scAOWoNdJTGOQzjt44ZwhIejGPdNoQ2+JAork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwEye9gg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso991670f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750362472; x=1750967272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/YzQSu8b3RwwM7ONT/x5qPkpdt9kdrbaTFvzXRTwOA=;
        b=dwEye9ggOs4K4wDRVsUmMxZzQBJ212ilel6aAN3PMsQweFlnRvaTzQfPl40N/Onsma
         mLP5GReYoWzMX16XZkPbAZY03kjEdL0n56O5fMj3kWHiERUfJbnrD6p9iY1N64x4UJWM
         Cq9F6SuIMNu85q0qp0SWwkSOxRaZDXWiAQFNXYllEvmtZkw9UR4ahU3yRHD3kEr5drDQ
         4F+uwrNYbcmC5Rp7nTg5A50s1YOFfuVfhHwAkeLQfZcCm3SHyLQ9vh6u3/M3kkacVCmo
         H4ozFbTZLhJ6Y5nXT2a0c4fhLlj6ZUlQ4LL/fMECqrKmjzPjGcTbHxyOTxWPvcKvzkYe
         vvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750362472; x=1750967272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/YzQSu8b3RwwM7ONT/x5qPkpdt9kdrbaTFvzXRTwOA=;
        b=UINPV7iPPjOXgmy0WX2tL5l65AfUI7mqXpXWQdRWZTGDbPqc3v7fy74f4B6VT8p2d0
         k9gUT2Tx0Fw6rZN+w16OP9MbIRnMHcFpmgcAliS6BZl0Qk23m6K4h2XDZyYVY1V936nh
         sGHlvxu0psoOReDj/Gnd8inI891D9uleZNtvQyI+LxjVBHHVfOtDsk8fjLZxjxFmKNrW
         emOzzukUTiB1RhI2W8H/TEhHgnf5vtqkxEk+4fkp8LVcpflHVbIBozlii7Evig0ILaV1
         VAaJe4jg8xSyZ3jjczAJt+MAggLTUlOyt3aokIREjavDaV10EzXtr/nsRiwbj8el2hWm
         91PQ==
X-Gm-Message-State: AOJu0YwjmFiPu0jY4A6zMvFEbwkndifU/FrMUM5PT5jl/imWYNCt6NLv
	mvoV7g3+b8umXyOTInWz+3rghM1jnN5+BSz6157zS95CSzxypPD0M5lpItjcE2mERBQ=
X-Gm-Gg: ASbGncswh76QSgmQy2TbRhO9ZkNvt4V3EhbgkHE2DO/FaJ1+Ldu6/3hBDoqhyuOLRng
	/0E0ZyWSEWKr6Yy1MOKqwyEYKPPqQKTUa+aoq3GGOYA5Nsv4a7lzJO58PrU/TVO+gX/T/qblHtu
	V76vbNHwY1JSvuHhtQcvGWiQkLfQv0gbNcrZqpdl73FPV/ww6HXh9EExvB0dpNyA2Sbb2aLh+W/
	ffjc/9LSh67Zoze0dkbSs4XoyroL7N7FTOLipBhV7pECWkHkZnElqv4XYg0/KZg+g9GRg8DlpNE
	u0k99SZGo1XRc95KdkYkgjrbq8RRrFyxzfNHlLy+v5vnI+PbWmq6ySMP7nMqk2JEd9B5qIwh8BW
	uuJCz3shSPwhTKnJVlH3oii4ypi0=
X-Google-Smtp-Source: AGHT+IGZxmlzRtzr8nKo8ssqzf01K/9qytNTtjGgx1suMq0UZxAvJQnnjBU4fFayR2vokX4mkjxP8A==
X-Received: by 2002:a05:6000:2d04:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3a6d12ded65mr161370f8f.21.1750362472312;
        Thu, 19 Jun 2025 12:47:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8e0asm37175085e9.23.2025.06.19.12.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 12:47:51 -0700 (PDT)
Message-ID: <85b2ade8-7283-46cf-9246-f441511ed7c7@linaro.org>
Date: Thu, 19 Jun 2025 20:47:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-6-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619142012.1768981-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +};

This looks off, why is there no TYPE_ENC ?

You're declaring the encoder in patch 6/7 - what's going on here ?

---
bod

