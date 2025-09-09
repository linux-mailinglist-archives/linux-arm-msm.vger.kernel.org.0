Return-Path: <linux-arm-msm+bounces-72768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B3B4FB52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940FE3B508D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E023191B4;
	Tue,  9 Sep 2025 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JEYDF1W0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3E01F0E2E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421274; cv=none; b=CG6z6weC8XPD0yrh1mRV30HsQrNgCAxDK0MFzD+oxsXAVHgNJcpbzy5KJiXZgZZbZHTTvkn9krfCfslf5QtPB7Yh4P7osss1mi0QY/rZkJTYmupa92QlfTNHNBdJO+fT3Qe7jZuBfVq+N71OZawC14VKLeLpkfOEbyLq68z8XfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421274; c=relaxed/simple;
	bh=7mjj7rz2/91ejYPmnOag2TLqmJpXVzRAQQZ9jyS/Yuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuRln51dfrvbcyDC62pt0gfjxmDTYfHVNCcJYshl/d87kXlAGORxOCl4RWvUQHwPeDuXT6F8rxA8fCnnZf53ycuEpmN5m8cmSXd4kMDB+YgeMzdscgTJF+EiTvl7RtsiR2JjHS1b38Qmdx3mt9FPpoRJjYAXfp4Be1jIVduPqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JEYDF1W0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0413cda0dbso109562966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757421271; x=1758026071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A8FY6t1e4Uc9Ae59s5Q0dm07RQgXfKaJ6ZJfiPWFz8w=;
        b=JEYDF1W0lPqbwNrqtb/LQmskl2uvQcTNfHwZvCq90rtVnZbqZvgbjvH4/rrbIOgTFF
         uHkVBSRZAALE8k5+/PadOsiT6ZZ7imJvjirDGQa10zCKpMVNnZEu1V6x/2iZ3RpUKZGW
         8IPUSYtD/l1UAPg04HadnhRl71ZxvESyf6sKPljuaTeif8gqYoXh99R92QFH//u/FNsU
         6PbRdnxu7Pmfujx4hKo9HsH1MJPEBzHZrBoCZHH//nIgqBON0/I3lAgCA3DQzKIE3fCo
         pLFIH6BlbkJ48iJyqgrBXtk2IYnkO5LTjr5PmRLziT+wPHHeJioadZ3NWSnuOdvcxO6r
         ISwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421271; x=1758026071;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8FY6t1e4Uc9Ae59s5Q0dm07RQgXfKaJ6ZJfiPWFz8w=;
        b=bQcaHawKEdtH1SHH9m7kUKRR1RfqKdUt3gaFCkTzA6XZPxN0RL6E9ITp6RSdELBscb
         FJQWRCmjkR9X/xV/qhmpZjdqgpBY7FbWUVbYV1mgMCAwA+RQezK6MR6KVZNpldn9BIJv
         8PJRJX5ggmbSsleMnxi94neD8AvyylLNCF9KQGXfhSt3v8S0KdVjqabYzJWT4ji9ggjX
         Ca5u73VPtBdqm9xFZB4FEXk8JPKGu/b6EW0TjwOgJvOb8InqE6mtiRqvu6fE7q60SkWQ
         9HWaWMz91ePfnSndC+DUzAc0g39BlkikLq6vjodjZd8o/NLRdF1wnL0BAB1bHJfuHRb9
         BA6g==
X-Forwarded-Encrypted: i=1; AJvYcCW99FqBCBe2iy2OcKwk4F6myrrkV4Eg/gPh3voRuVYKLv9bbS6nkjpD+pgq5BMIp8OXW6D6jcOCo3mFJL89@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5qoVWbDcf6JboCF/g3yZEBklNVoDpiCGsIXSgI6MZEvEpRD+v
	5+ceYMo6cccVi81hxxvS8Lj6UkFN9E5UqJlsGMmidYrXn7nez6sagRqsTGsGt0mwJqc=
X-Gm-Gg: ASbGncseDszrE7nWrmZYbgVhSBhUua8y8RfF4zovE9vK2ir05B374Gz4Zp4IQIhNi2R
	MxT1m4ikgNd7eJE+t20EXbNE8klkKMD1PcS12WOxSGWY4cS/D3maC6vAMTQQ83RmpSYj1MqZyG7
	yGiqqvycNIthbCv0A8BaOO3wJ99uxlnElRTQIMorMGwzdKHzCZ6QNtv+KxnYAEPH5EznrIPMy7z
	M8joyzuQVTN/II9Sng89gwqypnbSFRwQEa1mJjxMJEoVFFKrLM6IgivcRsPjsmLUGaRo/tgiRd2
	2XWHq1tAthIpi7oNtxaZdZWkRsIiy7rBG8Vr95s6xsscBT/UjTg2VLKcJ8DqLECjpCjoZv9ESoI
	hzSzCy28blj4AqsygYpN6EKJxRcks0g/WhpO/852EhJ8=
X-Google-Smtp-Source: AGHT+IE8rEi135RP6VtGcWAWerUo0T15mMkFHkykkUAIx12TkWOyPRkfn7DvpKit5FzG6ZAN4/JF8g==
X-Received: by 2002:a17:906:d54b:b0:b04:71b1:765d with SMTP id a640c23a62f3a-b04b13d6ad8mr574604266b.1.1757421271333;
        Tue, 09 Sep 2025 05:34:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046d420e02sm1466778166b.39.2025.09.09.05.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:34:30 -0700 (PDT)
Message-ID: <d7caec9b-3137-4e55-87e0-831732453b13@linaro.org>
Date: Tue, 9 Sep 2025 14:34:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-glymur: Constify 'struct qcom_cc_desc'
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
References: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 11:47, Imran Shaik wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
> This commit is similar to [1].
> 
> [1] https://lore.kernel.org/r/20250820124821.149141-2-krzysztof.kozlowski@linaro.org
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Uh, people need to stop copying downstream drivers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

