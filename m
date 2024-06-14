Return-Path: <linux-arm-msm+bounces-22727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 322C8908A40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0CD2815EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A141946A7;
	Fri, 14 Jun 2024 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hb77qV0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42431146582
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361587; cv=none; b=PH5jHcbpl+VJoqdYALAMTFCjT3ZsGlxVyFLIpMITYnJ3ftdAdbREyJdKDdPvf9VHhOCeo1qdmn3cyRtwit/H+aLpA3AZNRUGWHjloO/LbJBpmVDiM/l9G3F8+Fs1LV5jnx1CvwmBFrcvIjY6CznW0QosgKJ3/v39dqjYsksAwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361587; c=relaxed/simple;
	bh=z+21OcPJAjV6D/4J7/6zO4ml+szueCiKIz5ZtXCez20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCJoVPpj8iQGSfsqzWuNtJildQd/RDTfQddet8rNO8/V9dpz6LH6XKZp8ymk27bmwi1/RP3uCxrE75FxEj7obztHbwAPzHGTLUvgtS5H/1gWgd+oaGrlo8n66zxu4hpcqmjdnCf7DOb5cLmtePOVNd9cwfjryC5fgGo8T4B2wbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hb77qV0O; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f04afcce1so263147466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361584; x=1718966384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v046Ynuau3r+2icIo4svtRx0/kg7YGr+WrTgAD4SYDM=;
        b=Hb77qV0OjJTp9rNwhKYPZPND9iZYFvdmJViEyZq7uKNsNQHBFHVKSotrnblHEEjipX
         XO4ZhqA4O9N8mRhTTyUL+XYlU9PcWhxHZqJuZJwJsxGIEDT/G2uRaL8klCwbxK+I3IDE
         OWKPxY2WiKZXN8xzxg1UlGn2JnyEmRP6LqrBris/NIvI7/iolqjQBg6M5suCk2wjtDr2
         iUCM4uFLC+HtI6itrjJE353nFXHLcjxwUwq7IxOYkG2QYA5BTPrZct2CgQJk61z1OjDu
         KrQkjaqrk8qovoVujhEukd7f3ajJWlCw79rNjpL+oxqFtINTQNKWZcgKGyakrbysmNv0
         8TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361584; x=1718966384;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v046Ynuau3r+2icIo4svtRx0/kg7YGr+WrTgAD4SYDM=;
        b=Ph9TXv4+dNOIGNUy3/jN/5Cxzno6G4fmoxTCG2SriyqucAqJ/iQcuGFzmpuv/iKd4M
         ZzSHGVq8nuEKpMUdpBN4i4FG3p+Frd0bOzRBap9nVw04spqTQ/dQmkWxVYvVG40do8bj
         L3sooDZ8bLxb81WPmbp9JPaoa9kcpHM7YyeHmfPCKGCzbWde+dBJSeIAE3dngoOEF2pY
         Y7f6JBHM2EZI8nuKUdi8eMifTVHfO3hPwzacljpLYSkKBdon9cu3BTS3hfZtpLB1EpMA
         7ArwukJu8fN0XKresUlCtwC5/PkVGba1nGKyUc0QOVa8fik+86akualOlJncbroW9Rww
         l7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl2NwBaLhgAShH0UGNyqaJMYV/tyr+Itxeq9RPLvx9wEII8ucRcofbX9O0f5XeqTZTgCufsDpJizbZ8A9bxoxFvAvgj3LU5AucJc6wZw==
X-Gm-Message-State: AOJu0Yw9FV14MJ/D3IWH0v15QxcsJJtPgVXdWhih/TsKASUg8TNh4Y0Q
	SCBGcZlNbxXj2lOwLjmlqyrH9jv0BRwDQTDBbU6r+1b52Q8xaggRWIWWWUXWCWlOLoVNKUN1C1E
	f1Ak=
X-Google-Smtp-Source: AGHT+IEx+k+d6jmLnxxySTuX+K3zHE/R51D+3f9To16Y8uYNB0SKgQpBH0n6JwaZnMUULpDr3sMbZA==
X-Received: by 2002:a17:906:3c56:b0:a6f:12:8c48 with SMTP id a640c23a62f3a-a6f60d5f66bmr174412966b.39.1718361584558;
        Fri, 14 Jun 2024 03:39:44 -0700 (PDT)
Received: from [192.168.0.18] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecdd2asm175134166b.141.2024.06.14.03.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 03:39:44 -0700 (PDT)
Message-ID: <7b9c8a44-d0cd-4689-986c-f16d1239c91b@linaro.org>
Date: Fri, 14 Jun 2024 12:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
 <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
 <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
 <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2024 13:04, Srinivas Kandagatla wrote:
> 
> 
> On 13/06/2024 12:00, Krzysztof Kozlowski wrote:
>> On 13/06/2024 12:49, Srinivas Kandagatla wrote:
>>> LPASS Codec v2.5 has significant changes in the rx register strides.
>>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>>> after SM8450 have only Left working.
>>>
>>> This patch adjusts the registers to accomdate 2.5 changes. With this
>>> fixed now L and R are functional on Headset playback.
>>
>> I was just about to respond, are you sure this is suitable for sm8450? I
>> looked now at registers and sm8450 (which should have codec v2.5) has
>> old style register layout.
>>
> from 2.5 the layout has changed, I have verified it on SM8450, with and 
> without this patch, This fixes the issue one speaker issue.

I tested it now on SM8450 and indeed it fixes missing channel playback
via headphones.

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


