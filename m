Return-Path: <linux-arm-msm+bounces-25589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6592B532
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFB36B23734
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C3C156883;
	Tue,  9 Jul 2024 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPZKfoqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBF155CB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520756; cv=none; b=jXwb1ELW0HFUtUiki+kSmdXpsr5A+peS8U1FHH7Mj/gyDKpoSlzufOywdJGhEBS4PkpL5GWqlQ7ooWKenSoXY5LCb0ELYLAmHXGzuFOrxD/YoU+WoNMaDRCHD7RxYULvf0z/Syx5QZDYrax6oIhvPNfVliSJOkDPcFZZhHA7RkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520756; c=relaxed/simple;
	bh=A6pd2XpYR/VxdLWZQRqvnoyExu02xN7pHANL4n43oi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMH8rztVyXaL0B7p74k8mpAqgAQm7cMhgTFDYfz9t2lS0CB3ffaZYAPgs71W8FRhcWVogDjjz19BYQN0mDdyfO0T9/TmApNtNsWDKksycK9FMqbJ5RApEtsL1dLPRH5awJC1XiQrN47OHhUZc8uBoQMasaUA0IiU1W7FOpuerW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPZKfoqv; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so7309378a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720520753; x=1721125553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GdyTrVsoTN9O7NSdA88oWiFu9OfV95HskzoQpLb15Z4=;
        b=FPZKfoqvw+z3hsAHPVpMY4VwmvToOOJYXIC1/MEcVe9/JGLj/773nOQglrVoeQA/h8
         hpDftKB5UsHhyzbG8nrlVRQvYI5VWzWpdSHcJoHZH4DJoOPVzeVVJL67TL0o2RptYAQg
         Llard+NtcAPX5JVgltXP4EfMRwZQLaFq92leuInRlthtfwDb0Db49/klF5tFhSiezpGy
         14CtezL5vta2qJRD78J9NxuyrMgONWbJGcwnHTxBkQyd8BUyGqc2YqmTRliQRSWu3kZM
         JKzZ7qXfW8G5NIwsPmLqJyepsLNRzZO+mxUoS2Uc6eRo3Da/y5HjkIdvfLBe66fLqlGP
         CXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720520753; x=1721125553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdyTrVsoTN9O7NSdA88oWiFu9OfV95HskzoQpLb15Z4=;
        b=SkNlbvQXqC2QKQf+4Ie0YRVdwHZL+AgLXt3JE/FnGCM4rJG5oE5owJ0KBR+BROHzZe
         9JiZtkzPUo5Tn4BOJuCfXDyukeFK3RDlCcWxlfK91ljqyakUksB6lL7uIcCw/bVW6Vm4
         SjWWrah6z0rsvuVwcsXadflj74QOqTAbz2H+MGZkvuJgxlMZ2v0xG3/nW2grl+WqCni2
         duzZsv3lZlischf+1eSUAoXdlTD6lU0uJogROj4oJHZ/xBr2hkY8sp0DyWCTpDXRa9Ar
         bA9tHqUSWcd/4xjLOHu6Fxd69zU9eUqI+6wqsi55wFL60osPvC5TwGr+RZ5wpJivh93e
         xbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUiDw8yln8lgvF86HCOFldbwaZrGTOe2hn1NIi52zzrWzx8FZUNubnrR8EDEo5tXCbQl4572x3Smjv2CTabmjWSpl6dQMcNiDr3nU4Sw==
X-Gm-Message-State: AOJu0YwRRcq82MMIbifjz/4Hf9kuUrdAQauI265s9TebsQeU6PuLhmEg
	E7InrF4PAQSkN4PnIIUNxpb6gEPGJavYUNLuVL1b5FnNR4jkzBsfhsNIeQj7fUo=
X-Google-Smtp-Source: AGHT+IFuotZgYfU6wVxhSbZdkYxhEmD3ZRvEboyJqHtucWZwusYkQ9GJldTmncLxCN3+0FO4rv+qFg==
X-Received: by 2002:aa7:c918:0:b0:58a:ffc3:cea5 with SMTP id 4fb4d7f45d1cf-594bbe2ba54mr1263864a12.35.1720520753419;
        Tue, 09 Jul 2024 03:25:53 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bda308efsm883514a12.81.2024.07.09.03.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 03:25:53 -0700 (PDT)
Message-ID: <5a622896-6ce3-4e73-9383-15793b2536bc@linaro.org>
Date: Tue, 9 Jul 2024 12:25:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
 <20240625-topic-smem_speedbin-v4-1-f6f8493ab814@linaro.org>
 <20240630102524.talnb3qx5jfmcj5y@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240630102524.talnb3qx5jfmcj5y@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 12:25 PM, Akhil P Oommen wrote:
> On Tue, Jun 25, 2024 at 08:28:06PM +0200, Konrad Dybcio wrote:
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

> 
> This value is exposed to userspace via MSM_PARAM_CHIP_ID. 16 bits are
> reserved for speedbin, so we should ensure somewhere that we don't
> accidently use more than that.

The "real" chip id is 32b, leaving the other 32 for speedbin, so it's fine

> 
> Also, what is the the max value of fcode? I think we should leave some
> space for pcode too. We never know for sure if that won't be required in
> future.

As of today it seems to be 0xff. Worst case scenario we'll add a new param,
but hopefully the people that are in charge won't randomly change things..

Konrad

