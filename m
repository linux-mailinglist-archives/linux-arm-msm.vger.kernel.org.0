Return-Path: <linux-arm-msm+bounces-12520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF4866B2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 08:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A4B282066
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 07:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC13D1BDEB;
	Mon, 26 Feb 2024 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+q8lpu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEC47F5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708933203; cv=none; b=BI2WwAPlClIJGdK8+EWjd8T0oH9nVLCA0aRaaqzR0hEQR3V0nGNS6Bfp7X/Zh9nIkBY+5wlz8Hmm8jqV0NwzJ7O/5MuCAgnsN1woZiGEszCK7amQwiz7wJhZq0zA5jY0uqYVj+AXG/ws/UirDWmPvMT+aRW9p6+iRT42FT57n0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708933203; c=relaxed/simple;
	bh=zmpYv9Svtptah2ncNTzQzc5VADtG4m5P7o9zoKaM+ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1yYljt/QNL5aX/AzQNINAdi3f7COy6REhPWBSM2GF7sLh15r5JhDfq9dgOf+tdpm/VZKvMHUJMC78kAb78yPs1lHr0U/cWwAJKtA6gKXWMzhmn4XzbLlvAQNz4tYPurX7x0q/OgQkFD7F1qjNeWQNjlUAWykwIYv7SDVWMV13o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+q8lpu2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso3347006a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 23:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708933200; x=1709538000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jimvDQWUONLBjFngawUWwbeK/1icdHtiLsVkB1Mz+c=;
        b=O+q8lpu2vOGU9PUenmCw+sZrIbLSA/FUTDPha3hwdVJfdy2RlKuqmcDppTnAwkAB9k
         5tcsEatRnF366WkXClwmcNn8vD/Nm41a1BHDId7XQRpuQ88LHargYLBxgWpGL2LiMKBZ
         HioBp9LMIhDm7hVUkKHI35zuiAUZZaGQkvSYgcjbccuw0iXLJCXxv+kO+5MbUANTroCp
         A0CFzJ3Lk5WJGbGQdaWWshqZD55lI/PWDmtVuESnEl9gxjDlBxc1Exr+RJUIQrBR5akK
         XIqmeTgtoXTKmDfHiqStwU0pKo42qKcpgSz1nilsofSE2cZwDH/MGPHmkDfw/KNxswd6
         YGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708933200; x=1709538000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/jimvDQWUONLBjFngawUWwbeK/1icdHtiLsVkB1Mz+c=;
        b=BJaHj8uGLAjsYvv6ytw+1QMPuRhfxhB9+aIv2/KX9QFAnVbH7GsydXay75IU9wybZ0
         hBjGban2NGL8FyD/Po8F19sb2X3wNP5wEl4hhSPWjsPqm72evH+2pvDVjAiR57x4JXVe
         tL1B9h2rvTVwipTPFJgTe+hov08xRL30H0cs2hLjH9Tk0tlNZVmFw56pextfLZaFDhQP
         PUS+sxCRudVDV4rwN8jYI4ygIKj9mznqs1+qtPGLzHjzEcRCABd1MlrH2RywP4lw4uVo
         grQ2TIIZI7k0D6qnjoaI3S1yANwqSFbaMrBlEKbme06mB1U628jlPpBLMWkK+GBuIbRS
         b4gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvSF1NJaSu9jISMwy3e/Q5mqvF4B8tauoU1OfaM0sHea5bdhRx/mhnj2VVFHF0RCM9zut938sgZQd6n4IRjmFIjZVFp/BWrmPXlZxxVQ==
X-Gm-Message-State: AOJu0YzERYdcAawjgAklddhgUex2Ve5PdFI49hKUc4jRaTIjWw4dOk6W
	baMXROUiPQo2jXDJ9yX470Cr2Wo1ykP+vnBllahMxpWbXbyiAXOCMha6WGMbXJg=
X-Google-Smtp-Source: AGHT+IFrWB+bZorvZBVtGCTLcLUMdppDPc9Fn2xMqsUibDZ3ukclClnan9lxi2UYOfXXT3UHfZLHLg==
X-Received: by 2002:a50:ed0b:0:b0:565:6df0:8712 with SMTP id j11-20020a50ed0b000000b005656df08712mr3961070eds.22.1708933200201;
        Sun, 25 Feb 2024 23:40:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id m7-20020aa7c487000000b00563f8233ba8sm2070682edq.7.2024.02.25.23.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 23:39:59 -0800 (PST)
Message-ID: <574aef68-aee2-4855-8fd7-e1a54c1b58fe@linaro.org>
Date: Mon, 26 Feb 2024 08:39:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
 <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2024 23:34, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 17:55, Abel Vesa <abel.vesa@linaro.org> wrote:
>>
>> Add the X1E80100 to the list of compatibles and document the is-edp
>> flag. The controllers are expected to operate in DP mode by default,
>> and this flag can be used to select eDP mode.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Rob, Krzysztof, Connor, gracious ping for the review. It would be
> really nice to merge this patchset during the next cycle. It also
> unbreaks several other patches.

That's not a netdev... or do you have the same subsystem profile
expecting reviews *from everyone* within two days?

Best regards,
Krzysztof


