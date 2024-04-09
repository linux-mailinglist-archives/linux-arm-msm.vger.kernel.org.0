Return-Path: <linux-arm-msm+bounces-16926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 640F989DDB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0392F1F2778D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D944130A4A;
	Tue,  9 Apr 2024 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibExW2lO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9812FF80
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675062; cv=none; b=pcUYdgKrRWT8V9kM/8iWjITm12csGJH1Cu9A7TlAD/f3F1/jw/h5Pnz9aCiUE6LIluI1YbYY8Tw0CETwmGcKMDp2jExL6FpZ+Cd2Q/Jra22YDNGtzv9Zl6gXWAKwoAGx/elf02bbk4h+qKlasvOdrEnFWeOS+hPKJ7NoZxGpv7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675062; c=relaxed/simple;
	bh=ssen+WDRW3hqF3y3gAI7KjfM6Zb3SAVS5pRaVtu5ya8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFDH9AdOnd7gnsDuDT6l622mzJ+V1HpGV8AnuqA1qR/h27vvJ11fcfgka3GVaOEK+1YdaRAOIbOXvDWmCpJvqXRD9KSqw6gsVmB+8l1/0JpGqkWokJDvOIZPQkZPBxDGFkVzJesyhqJ7nE9dFx9EpiyGFwfVLZPa1ZrPVpla1KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ibExW2lO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d895138d0eso19129391fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712675058; x=1713279858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YM+s20cdEdse7t7bN3iKiAdYaiSxxuKdZKKsCgmaYw=;
        b=ibExW2lOTRLTYJMF5CjRfqUXmoTJKkGQ10QXFP6JYNALJP5NdP8ZnajpNpEZXMj7HN
         fhVrEAe5Jyr02ARfUIKLeqmBM03/wWCAt3b41O4SK5owlMmOdyDoOP+zovzC0VelOFsR
         GL66zVe+G5NbXn3qVY1F8Hdq6JQD7pOBxtw5/k/U91ULHutRbEiltMBQDvP7Xp5nOnod
         CH+XWbCR32sJS6xUgBD6o1tSHdhTBcT9sUMZJnTNavp2wCurVRsFCLTU1+q08qeDVVT1
         a996YyzSCjcFsRKu7d2SJM6DhXFTETCztVDQpVqQfbh+sooUK3/8meEJOF9QN8tdx49z
         BotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675058; x=1713279858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YM+s20cdEdse7t7bN3iKiAdYaiSxxuKdZKKsCgmaYw=;
        b=K+i6iLdfUItYssIbfja4xgcsJQoWQDNDmwQfBDZ+kzdymCjK9dT6efFPjpqOCOhSUM
         i4lrZPhzJ+tIBTK5ZJXpiHUkAyPGmSJ6OJc7cTxgQSaJZo6kiDdX8XyOjd5yPktWlStJ
         RqoFf9+cbw05DwKjV+TFt9sHzDebabDtlti8wFIy4RCqvntJmYkuI9AwHlEt/mX3mZ6/
         zoPGmWH5DVoroXNK5cb4zmTjwwBRGWYuu6XBqSqGzFYEls+oaTzOZR8LrDBL7OTcXdyF
         NAVKE5cohvc5p1BfFcgRMvNvCtLFT6yIzEM1KM51Q+tG2lLMM4edORbfBF/IlDGolp0l
         JKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZQ2HTxruRF6uj7JM3xY1x3gHrCix8WCRDan3qwTwxbyT4bttquyyE+B2Se7A07E2PQyZB2uGPtygA3q8onfhKoHh2Lbe1V63MWw7ZbA==
X-Gm-Message-State: AOJu0Yxes+U6N9MVxgpZ8J73xighNkhQ5uCskxdWxVYuMQ3ds0ijtZ/8
	lliVqtMa3BI0myNoxAS4LNmmVHZLeHtK6n2oy7DsK2ATAXIiBXtDiJo4063AkJ4=
X-Google-Smtp-Source: AGHT+IGoHv754pdfAq6TjWUEj3Tebb540y8BjG8KDvn0k1jGyKTq4jOdTq4eg0QQygBFoeLLrn8fzA==
X-Received: by 2002:a2e:7d12:0:b0:2d8:7200:38ff with SMTP id y18-20020a2e7d12000000b002d8720038ffmr64570ljc.24.1712675058205;
        Tue, 09 Apr 2024 08:04:18 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j14-20020a2e850e000000b002d88d978484sm841131lji.132.2024.04.09.08.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:04:17 -0700 (PDT)
Message-ID: <a8ea0f53-40c0-4fc5-94fc-a88f8e0319ac@linaro.org>
Date: Tue, 9 Apr 2024 17:04:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: smem: Add pcode/fcode getters
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-2-ce2b864251b1@linaro.org>
 <zc5u7ixaser6ekl3sltzxccstu63tpydxybquxz5hcasj4cmfo@csjwfifugeod>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <zc5u7ixaser6ekl3sltzxccstu63tpydxybquxz5hcasj4cmfo@csjwfifugeod>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/6/24 04:21, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:30AM +0200, Konrad Dybcio wrote:
>> Introduce getters for SoC product and feature codes and export them.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]


>> +	/* Ensure the value makes sense */
>> +	if (raw_code >= SOCINFO_FC_INT_RESERVE)
>> +		raw_code = SOCINFO_FC_UNKNOWN;
> 
> This looks like a c&p from the previous function. Should we be comparing
> the raw_code with a SOCINFO_PC_ constant?

Looks like!

Konrad

