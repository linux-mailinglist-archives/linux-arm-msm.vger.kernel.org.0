Return-Path: <linux-arm-msm+bounces-13480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C932873656
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 13:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECFF1C238CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 12:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF5580049;
	Wed,  6 Mar 2024 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbVnHnTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747080025
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728184; cv=none; b=Q5tf6qwz6FRWqKOIIL2jcP16rIv33okitZ3bQjmG0A0kiDH6eAUgmMXk42Z6xn4IzvxdLxUo907A0e81+Y6EvhiJ7GCbC9zbYCF9hYJ7cZAjKWBXgFavcINWB3FRGwsHM3gZSIjF+yaWzK6FE7CcdyE+2z4oE6Jnsrdk4pz5MLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728184; c=relaxed/simple;
	bh=ObV6wJD1dGgKfM/SEje+rpocSBnWnBjqtC7LP1pKvA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/rVijJofgvIUtcgJW+Xz6b7SnqsIS39tpcJ2GbO0CkED4lhXXVRivxDBikTOpB07lZA0bOx8w9BwyM+Ho/3qJfNIf4v8t3m7g1gFSp3uq0tnrrC/yUEjoi8aBphoCxctSbxvXeVX8KCeiSrpGFQjHteUpvJ4Xrqqu0DKD5mGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbVnHnTb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412e96284b9so14914795e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 04:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709728181; x=1710332981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WArnjLr/e7a7LyRrU5MGJmZcAQ87pJ72IgQ8oXzK1E=;
        b=AbVnHnTbD3uI9KsmUiL8paCc6W3k6B7rjOy9UYooYpI6qfRDEuJF9IokCGHiGL7X8O
         Dj5dnX8M/o2wukcpC5kvwYzR/dh67mko/x1Ty+PhNhlyv147FVHM7Jehq9uoxnjuKTjz
         /Kt0FIttmVKOJMpIfn4jUOd8jPO75XBMxN5pEz1erVtxw3nNMEo8z9Te9VQBOR9F0cXQ
         kfHmr5tYcjsjrbyBF7DfMWpVp9U0Rrk6yGMNKulN4TS9El+5KHp/0S7oaureBknvS9UV
         kmdUEQPGv+8b54eL5yd4VhpLgeEDdzZ+YRToJ+ybq5Ql2MsZiQ2Iy7cYknnTc0NzyNXd
         f9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728181; x=1710332981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WArnjLr/e7a7LyRrU5MGJmZcAQ87pJ72IgQ8oXzK1E=;
        b=pHv2Lc9TmXy6amoKo3M8t1008VyNCqP/dFsBTNhQqnJlhUvh9KTdBI8YjcQD5dKTdS
         QcEknwaTHBqBOlu5ZeiBefl00TnIyEaOWJUX0d9wWKonSN8zAzl2UxSRWnswn/6fKHDS
         EXtFZMgeIoTWtxOmIL5CmMahQoAgnRAtVSF6lUPuNzIH3RDC4q19kP8BFwFuUJxbGqBH
         IfEqNCfRaspdSH1ABztzbTDjLREWUR0irbV+7+t8z7oeXXst6CsNTW6biypQAjDgxxUH
         S2EaC7CKfX3r2tF/jJKscN3go1ra/G85+YWOIibD+YQP6cjUrfvpS5CEPQZcahcaaqhd
         I3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUlhsYX5pRWrIHNEz3xdKR3AIC4tuyXAg7wFXSYbea5hm6OjHVIxE4E+YsWPxrHIxKuPJGfOOkSRjrY/60aWYcTrkoXi3oyxeQkNeJdFw==
X-Gm-Message-State: AOJu0YwlrvdNtKXj9O7rf+93UGTlmyv3HRYrT5akJHUXBp6mzbGkJnUf
	IVLPo0GqxUDdn6rCqNDz1w0F3NshULi48XY7BifFAe3fUy8/vynBHExS3mp2ehI=
X-Google-Smtp-Source: AGHT+IHGdd1EPcqo84bI26AwHBzuTmTNGE0sealqhVdj3w5L0TRy0WhbbcD1LSh1so/dlV5uuizfVw==
X-Received: by 2002:adf:e641:0:b0:33e:469c:8afa with SMTP id b1-20020adfe641000000b0033e469c8afamr4385548wrn.22.1709728181164;
        Wed, 06 Mar 2024 04:29:41 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bn20-20020a056000061400b0033e43756d11sm6811932wrb.85.2024.03.06.04.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 04:29:40 -0800 (PST)
Message-ID: <4034004c-a017-4384-9086-6e0d6c154b9b@linaro.org>
Date: Wed, 6 Mar 2024 12:29:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/20] media: venus: core: Get rid of vcodec_num
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
 <20230911-topic-mars-v2-9-3dac84b88c4b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-9-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2024 21:09, Konrad Dybcio wrote:
> That field was only introduced to differentiate between the legacy and
> non-legacy SDM845 binding. Get rid of it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


