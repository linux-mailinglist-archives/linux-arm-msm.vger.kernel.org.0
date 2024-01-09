Return-Path: <linux-arm-msm+bounces-6725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4F828342
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 10:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5191C24FB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2931833CE9;
	Tue,  9 Jan 2024 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/qX1q0f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79932C63
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e67f70f34so2701565e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 01:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704792821; x=1705397621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVeS9dNi5F3UQMp7NbVYNXBADspqfRiuuFMETtP0Ze8=;
        b=P/qX1q0fsI2rQxko6x9iJdIGwJHoukE6zBOvFw0owVsAPEo0xtTzCawrIkAz2wJiQz
         kp559S3IS8bnyd7YZ0CJoo39x0wpgPKf/FZat1xDW6kwaAD4ot8Q8YJkvHzSMIWq/NMj
         QPVsbgNvteUIgd791gYFi8ra+1rVcwZ/ymeZFeF0+Lp1CkGGe6CYa2SSNsyN6S0ndNvy
         p0Oj/K6DMcddezeHTpF6+wV9CciyNwVTckpaL0/DGnhQ3UlULtn+2IqrSOlOQn9Qh1o0
         SZVt8GgL9yzp/oK+3liA4mp3bdgN5UJRJ6rF/Qk88azGkbvIJLAwk7dym7sAekbYHQm8
         0OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704792821; x=1705397621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVeS9dNi5F3UQMp7NbVYNXBADspqfRiuuFMETtP0Ze8=;
        b=Le+VrTgYt6yX+qnai+SqrZCcD1CYU3FiazokBw8R8WGf1ycklQVazyahEWcTJRBIoV
         xPwxsSJmmiCSPivvriIYAk7CzNl/ejKVhAbfjQy2yiG99FJZY5ew8Bo5Asqr+O0iI2FJ
         vt57FaSzcVsD4iWRyOnjVe8KY9x3ld8kJ8XZfS9gyvHnOM+CGBXmKKNgvsQZbemiW5G+
         cKOWZDU4NBfb9taejjCtszeaYRipJq5bGT6BnIvC1fsLeBjDdWm6pQnZkQsezB4x/bt4
         Oc3TWQJrYEr05zFTYKF3xUaR+4K2oBZhnhVCCPoyloz62OWyrmmEc6XkAFqo7+MLQXvN
         CDqQ==
X-Gm-Message-State: AOJu0Yz5WiDlyA92/xeP9RlE6UF0ykeJ/xSqclaMa11XnIYum+tePyKC
	/z4+eLhY6u2oeeY7+0vc7GTtU2Uo5tqhmw==
X-Google-Smtp-Source: AGHT+IGfNHPtDigajGJRU+dhzRgIlsaLULmucB1e2N68M1etdiT5SBgJNUKqBwAEMNxEMDISWXGtXA==
X-Received: by 2002:ac2:4e12:0:b0:50e:9c17:24c8 with SMTP id e18-20020ac24e12000000b0050e9c1724c8mr2414289lfr.7.1704792821587;
        Tue, 09 Jan 2024 01:33:41 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512218b00b0050e7bee0787sm248909lft.234.2024.01.09.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:33:41 -0800 (PST)
Message-ID: <19eceba8-dfc3-40d0-a681-8c47a0248cfd@linaro.org>
Date: Tue, 9 Jan 2024 10:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] clk: qcom: gcc-sm8250: Set delay for Venus CLK
 resets
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
 <20240105-topic-venus_reset-v1-9-981c7a624855@linaro.org>
 <0cbedc75-cacf-43f8-a1f9-284546ad548a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <0cbedc75-cacf-43f8-a1f9-284546ad548a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/24 01:34, Bryan O'Donoghue wrote:
> On 08/01/2024 12:32, Konrad Dybcio wrote:
>> Some Venus resets may require more time when toggling. Describe that.
> 
> May or does ?
> 
> I'd prefer a strong declaration of where this value came from and why its being added.
> 
> May is ambiguous.
> 
> "Downstream has a 150 us delay for this. My own testing shows this to be necessary in upstream"

Alright

> 
> Later commits want to add a 1000 us delay. Have all of these delays been tested ?

No, we don't support Venus on many of the newer SoCs..


> 
> If not please describe where the values come.

They come from the downstream Venus driver as you mentioned.
I checked a couple different downstream SoC kernel trees and
tried to assign the values based on what I found in a kernel
for that platform. Some are fairly educated guesses.

Konrad

