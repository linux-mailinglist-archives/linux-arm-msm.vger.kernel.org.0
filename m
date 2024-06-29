Return-Path: <linux-arm-msm+bounces-24734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A091CD5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 223122810DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6939245BEF;
	Sat, 29 Jun 2024 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQp/kmWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B6D1D52D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719668652; cv=none; b=IKGygl+8vS2MJUBB3pBJcw0R2dDuJxPLSybihHiL1+5IxxGKrrrg3Ugnah4DtKd5jj29xK3TIXw33zfJEGul+JtUgwRWCEBX0n09yxEGgq5T4qQOzJfdXKT86iM6pftJ6fnkhlde4qY0UmqfaI1HK3aYHtsc8F+tmPEb3qpxrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719668652; c=relaxed/simple;
	bh=sygJd6QL0NbwyrJsKGrwAIO+qL4p7ETZM3vXb08ElKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndpLAssOTnYAo2x/58M5UDNJvLuKCAv6E7x/KlZoKxlzhQiLAASD2LxGnYMJEd/IEuilyJCzOeHI7088fDQyStKKBjIHQhqD7RoGJgobiSLodQVfYXHqiSvBNOlQJhgbJsL07RHaWBdPFpHfodCC1YMblrVKIra6BOMKbxYHO70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQp/kmWp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso1907169a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719668649; x=1720273449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0LV9QNrUseAYBOJIHcEtXZSmELN9/hwOlYXr6//1Yxo=;
        b=GQp/kmWpuL+TJJtP+VS1kdImLPT9/Vea4/J4iro3FUKr0JHexxClamyWcp3VIvniI5
         IxeTOI7e6wgbHltOSlks7rTEcOmD+Jhktk79UwyP6f6FP+KzrBHxtMlw6SwElos2Fmj/
         qFJOkQKq11zoDUQVxwjX+hisigV00hP/TQOt7U4xniINjnRWeiJokcJuV2gY+N7Py913
         zVmPBn1TkPIMcc1KR8xvLoZ39GUnYf1UNPnvQxOzEpCU221koQOqCSAD9hHGfmrSekr/
         4fsjwlsbQJyNBEZTEpQqxFEBm05s6MX1SwGe2g/GAmy0dww/FTfamjhjyAR9NwVEGidj
         yJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719668649; x=1720273449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LV9QNrUseAYBOJIHcEtXZSmELN9/hwOlYXr6//1Yxo=;
        b=vq1ulC7F9QtNlzfGn2Wq5PdXxSE3uUR063Iktc8lNc4Mfj2nn34cXUbcWhzWc3OYzC
         /FZue1Oy6tKI9Z8T25Ear3MAaLzeQRa27CDvK5G0NV0C1tYGJo8fZcVhpTyZ4cNAs8K3
         1AxADN+QvB+1cjXkTZuIrytz+W2O2qN6C+ojQlDVxRjyQAIsSdihg1IwvmmX5uXddod7
         RsMsWGfcYG3/DDI+dvEv1Bg0s/KOFThtqgcFW1j3/U8jur7imrakMpJ52g4kzMTQYWKM
         HIsvg6esb7ck/Nviudi+y/9qimc3fpXJfzmeMdBOfHIkEe1aIojnsxVy+QlN7HfRWult
         tHsg==
X-Forwarded-Encrypted: i=1; AJvYcCUXFzmSl4mHmTzFX5EbrHcnTc2lm6g0DxSbPdn/b2m5CZsAfPB8kUriWyyuyLRYdkzSjqHrGTPDnJzA89BYgD0KauWGRWYY+cB+SYHVcw==
X-Gm-Message-State: AOJu0YyRmACJqEDqYj8lpVp6MmOf3Vh4H55tCYQL+Cdvf/v9jkgzr6nx
	VYrJVsQkwWZXbykZCsNwXAJanZAT1boVeJeQejfUlABjn5yCyFLT6Varm0fsyog=
X-Google-Smtp-Source: AGHT+IGe5k/+Cg0G7hanL845tSD1zIZmGhhQVzgUhbAXzAyOMB+DQ6wjnUmb7w/qrSB4VpoWCF3zJQ==
X-Received: by 2002:a05:6402:26d4:b0:585:a885:da28 with SMTP id 4fb4d7f45d1cf-5879f59bb3emr724776a12.24.1719668648901;
        Sat, 29 Jun 2024 06:44:08 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm2212539a12.93.2024.06.29.06.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:44:08 -0700 (PDT)
Message-ID: <b93ee803-5963-4270-9bf9-9cbcf5d413b2@linaro.org>
Date: Sat, 29 Jun 2024 15:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add MSM8996 support
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <20240628-dpu-msm8953-msm8996-v1-1-a31c77248db7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240628-dpu-msm8953-msm8996-v1-1-a31c77248db7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.06.2024 4:39 PM, Barnabás Czémán wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Add support for MSM8996, which - fun fact - was the SoC that this driver
> (or rather SDE, its downstream origin) was meant for and first tested on.
> 
> It has some hardware that differs from the modern SoCs, so not a lot of
> current structs could have been reused. It's also seemingly the only SoC
> supported by DPU that uses RGB pipes.
> 
> Note, by default this platform is still handled by the MDP5 driver
> unless the `msm.prefer_mdp5=false' parameter is provided.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [DB: rebased on top of sblk changes, add dpu_rgb_sblk]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [Removed intr_start from CTLs config]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Haven't given it a really in-depth look, but we've already done so with
the previous iterations of this patch, so this is likely gtg

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

