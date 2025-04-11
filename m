Return-Path: <linux-arm-msm+bounces-54006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA48A85C4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB90D1B62C4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D06729AAF5;
	Fri, 11 Apr 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJJeqFET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FDC20CCEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372334; cv=none; b=BhEpI2aWWLR4mJnAOBa3MKwM3UHYpJ5DEQ+9NLnDjoOJLCNwxXFhqHpOhfpaztJLXvBL0COJobe29BWFhj6opoFrQKWO3S+1TV89GICE2uWpGNZ5/dq2jcDmM/qB3LRT4mawuvRfUmU5iuzY60GIskVYUYcJZahZxqe8JieuQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372334; c=relaxed/simple;
	bh=xl8pYd1ICKUbfI8bR/MoNAxS2Yv5qFYEOJdtbYDx6hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1uI9qjrpwQjg3A4tShBnMdxrPGWbsL+TrgxjS2tBgnCRfVP49kAaieQTjiy4rWTjRgxYoxW4k+E+qWIEtmjnsF15p8lfMl8MVv8RjC2j7y7S+izc6XDcgtvW15cmGX8t5A1TbZ1odFgWvg9ekk7tpvaQ25GMiDoJwgOa1LU5bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJJeqFET; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so20047995e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744372330; x=1744977130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HVy/7nosTmDrt0FNCHkltOQQArKbp0G/tf2pSSqz3k=;
        b=DJJeqFET+W5ud+joBHyEAp51CWQVCrIUPkDjBV23bi5x9du538YpsU+bUMHe/RiCJf
         Kiqy93IjOZo0j24BZhGC/iY1vnyZmtDOU6YMJ1WQ+MtOuniB+wsCXI8IQW5ZMwMo9mmv
         yUdh1W8aZqDfWlv+dg/KbVgUoutChw15J8H0vEFHtgdKcNu+gpB7F/G7M4ZjbKIf8ZNB
         KEQ78Gc9KxtXGWktBLdcEX8bKfjxGzu+DKPZs2Jl6FwcfNSq89x3v0HzJjAbXRC/6Nfm
         4a/hbXR+4r/WmTyYyecP+SChh1WQeTMT3XiGzIu2+kzvsTgypOs7Hz1Wn3ScleN3wAIb
         qbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372330; x=1744977130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HVy/7nosTmDrt0FNCHkltOQQArKbp0G/tf2pSSqz3k=;
        b=wEBoHkWqXukYAze56Kx0/rxNb9UzGZmfzPbheIprannyTivF5HSGcEHLS4op2I3SCo
         CnbPcTI2l2s9FjHkaRoEpiREK06bLPjEN5UJW7ZzYqSO+hx8fxS3cUn9aC2NkkTBSEYw
         sAbh8ufSZYHA6jtVsDTZGGOEahw/ccPQSjA8Y3L0tBdC5ymOPQnybirH/vaMTFh+TYQl
         G1X8szWX4OU5ddf5oY8MNJL2rTReETo1xze9hbpt1vZ9wDt0vKr5lQ1oZvMPAUCpVnWS
         KGhil1ZM/4t2IfqhBkGbDvpl1VbbuKS/FnjWGeaYV2oirvu9nhGsyRq+77n3AVJ4YKnZ
         0poA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+rCa4CQrI/6o10eBdqo1Gxi49orDp1aiIRKD1xlKaG1m9+/QGZEZNl2+ELMprX35hGZ0EaX6Gn0KDcvq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Z15vTRhbkNz8tSeGUDHgdaT1fKykyathsRXeeMdb24US0dja
	pgeopp+dARlv5+7YnY7DvKrnvkEUZkQ1lGfquFeU5e87YSX/fDUjuivUz3AEQGk=
X-Gm-Gg: ASbGncviJXYjYr/5KgzaX+/iQA1U2WhF/kXNGVgLm17ZKd1JLyiu2JwKZlWFGm+Cd3v
	Q2h3shNM3kyD0/L7i8vYtvI4CbM79U1EorWG9eT96tR0cM1Etw2AkVtIxDwYpZSec/MS+wIb+op
	kwqiF1MgXX4cU3a+yLy0nzA8ZJC5bhANpCrMvjw0sEw4tVYt9JiL6JIUh624cGweJhZ7ShBd1wP
	WJNnRhjOLk9xT0jtdbAwQmlv+lDokvHwTCPqa0PIoZdisz+c8o7G0Z1uGVmlezbWJ7Lm4KCXcrI
	MEbIv6+248Mj4mV6wnA1gO7U5s65xEOR2n62Lh1tUsAhet9z910pyK7PBMI/dfilPstte0rpL8V
	LRfIk+g==
X-Google-Smtp-Source: AGHT+IGzWSil6xEbNUfevW8M1sWzZW1l6nSFBVdrW8vg7rvy79cA0XlcgS4RI4O6ocfdrpULPe2L4w==
X-Received: by 2002:a05:600c:34cc:b0:43d:fa59:bcee with SMTP id 5b1f17b1804b1-43f3a9c025fmr19884005e9.33.1744372329911;
        Fri, 11 Apr 2025 04:52:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm1782251f8f.94.2025.04.11.04.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:52:09 -0700 (PDT)
Message-ID: <23cb349e-6fd0-460e-9f11-7f57609be9c6@linaro.org>
Date: Fri, 11 Apr 2025 12:52:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 2/8] media: qcom: iris: move sm8550 to gen2 catalog
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <3pe2YgIPZDCWHxBWThGQ5xqa-pGXmJC_-sPtFTNKIGg7NoAdMhRl70BzWLZE5B2_zGnnYvimmhqB2Q--OCXwuA==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-2-44a431574c25@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-2-44a431574c25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 17:30, Neil Armstrong wrote:
> Re-organize the platform support core into a gen2 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the current drm/msm dpu1 catalog
> entries.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Same comment on alphanumeric sort and header __PREFIXES__ fixup then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

