Return-Path: <linux-arm-msm+bounces-24142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E5916F72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 19:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 262241C25DA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B8B16F0F3;
	Tue, 25 Jun 2024 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxVzR+vP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9B1487C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719337295; cv=none; b=dCn6+f7ZkeErP7v43s2f8RMXGoe5H10Q3hVyyXgIQpIH4Nc0jdM5RvA5GPXlJX+wg+gFqqE2to+8C+WmMvhPHFsHignOepVufkhVyVG8k4DfEdT4b8KjkChdLEXoF0fQE0pWH0zTKsUf1HB2Z3CYrwc6CJ8BKQrhkm0eeBRtg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719337295; c=relaxed/simple;
	bh=f2yi2IU5DqWZIEXUr163XMRTonIYeoABOkfrHnRrqA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rh46gOj7pVoiDBPqZBQtiirMLeSK/zjlBpLm2Ns497eI4Ev25BXguPkKI9v6VTuf3x43QayAKOZHQI5FXPNG85qMTMRMFPQnB1jau6CpL2Ntw3wdoa4mnvtqIZPhtUAff5CwRoa6u7prJmgjxvsdaCEvScg3F5lSTAJSnRuwR24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxVzR+vP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d280e2d5dso6002828a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 10:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719337292; x=1719942092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ki9v7ssaSA6BilWg71XryVj/a0M5d7KUYpdv/4KTd0Q=;
        b=RxVzR+vPUcHsN2I/boFKTX7y6TXIpaX8ltD8jQGxIqXaf7Rq+0t3VCqy2nNDATq4RW
         HKvwNqJipaK+2XVA0JvIgRZs8mwAHlmxp3jxpEFfBc75+M7j6WgDMFL7NCdcy9PTslyg
         dKWRo5W6bfjHlNzP64YObhf+KJwE10X5Wn6Bxdm2XfIlPp/xFgbuAapbN/8oLqVpsCJB
         hL+DWkb47Dg0fBJ+CcyBRhcNkogn5lwF2/uwpamVCtErTbUOJaAGvx4E99I6gd13XKGR
         onUZQLP+IG58PuP3qusilUknh/7hPqQebbZ76QSjtS+hHT/j4G/M1NFN0BxpK2v4jqeh
         7vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719337292; x=1719942092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki9v7ssaSA6BilWg71XryVj/a0M5d7KUYpdv/4KTd0Q=;
        b=ajIgnJoTWsAchtepn4bBvy1acYDPRcIRNKZYDeqgo0NKVoMGVtyQAtKDRJE9LHyYDK
         WOmzmK44VVhVUnkeTOosUXZm1S2e3vGvshYUSvn1oa6vHBTyJ2f7SRiiC76UaRcDm9dH
         tnGb0pyWP6JHe4kVSCUc89bW7bHeu6PAs83EBYo5TgtlMmJBxOIMmdsuku56iYzE8QTL
         so6MIV4PAC8ez9/jTqlbgzzigCBRkZp3IGLjE7RGAz6V+rc8HfjYXolgbislKJCEl1oz
         Q0tKovFvOYD5Ou1UYeZ0s15oLUgQ6ZWGyFmNPbvvPkkzszsSUdTzXvWcVaV3F44LZIRP
         YsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDPYh7AcAg3WrKFnluZhV8TPexZeQgHpD/s/ra68eSHnaTpJXLFFELf+e7Jepc6l0jCFpz6H3H3+znd8w4CtxEZ6x6t4M5OURcgrx4eQ==
X-Gm-Message-State: AOJu0Yyx5kuq7MQDj1OeIvPOujmNpRqf2VpuTwoEjnmWgZxwvigRN3HP
	P5OtjmHty8czoibc8/gVnN44RDtR9jirUoEheTQsKMghAdu473kPamRzZVcKmCU=
X-Google-Smtp-Source: AGHT+IFXHpuFLvxmcMU5LXabZFM8fwkTghiihqugi+FKQXdejdfFDChRosc3BCFa3DfzN7rIEvPrsA==
X-Received: by 2002:a50:9e84:0:b0:57c:60f0:98bc with SMTP id 4fb4d7f45d1cf-57d4bd69fa4mr6031728a12.11.1719337292154;
        Tue, 25 Jun 2024 10:41:32 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30413446sm6244711a12.31.2024.06.25.10.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 10:41:31 -0700 (PDT)
Message-ID: <11e54c5d-a53b-40ec-b72e-db608ecfd23c@linaro.org>
Date: Tue, 25 Jun 2024 19:41:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/adreno: Implement SMEM-based speed bin
To: Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
 <20240605-topic-smem_speedbin-v2-3-8989d7e3d176@linaro.org>
 <CAF6AEGvhkEWCtCKdRjhyk18+cxbn0QLkRUrMqEfgGU-c+K1YxQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGvhkEWCtCKdRjhyk18+cxbn0QLkRUrMqEfgGU-c+K1YxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 7:20 PM, Rob Clark wrote:
> On Wed, Jun 5, 2024 at 1:10 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>

[...]

>>  struct adreno_speedbin {
>> -       uint16_t fuse;
>> +       /* <= 16-bit for NVMEM fuses, 32b for SOCID values */
>> +       uint32_t fuse;
>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
>> +#define ADRENO_SKU_ID_FCODE            GENMASK(15, 0)
>> +#define ADRENO_SKU_ID(fcode)   (SOCINFO_PC_UNKNOWN << 16 | fcode)
> 
> So, as I understand this, we are actually only using the feature-code,
> which is the low 16b.  So in reality the "fuse" is still only 16b?

Right, a leftover from when the pcode was used too.. None of them should
exceed 16b.

Konrad

