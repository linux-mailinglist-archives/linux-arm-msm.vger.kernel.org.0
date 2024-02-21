Return-Path: <linux-arm-msm+bounces-12049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954185D987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E45285D1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F6376C70;
	Wed, 21 Feb 2024 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTTLfZo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C2169DF6
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708521570; cv=none; b=sRSSSjHpZ9vdSANc56waZaNa09N6BulnezgpatYGeIp0lkOjDnVzd1qM3kkZ+BcjZ2bWg619g41dF1pRt3G4yVDI/JyBjxco1wYp9ahJeNTvG6OocMbjMtlo/io+hVF1C8i5x64pk+OVlJs/jD4aFE1fgtI9Bnt+X2/qWbGdtNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708521570; c=relaxed/simple;
	bh=q5JilIcVQv0asTMfdbPLV+EjUbD0TRKeDJha67fbVZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsmvPsG1pdFKrpltZwYliJVXvdIzLLj8M3hLDD1+kIJRhhaQb2gizwYT91q1Fegwz55LGcd4E9rPu2qTkAjim4w7amXyu8A05H9jVzYbDAJlCrp0+ldrEEP3jLmEpN6UhCsQ/k7ikfY4wdFtD05XuBmWs0MduVTnvaYpCmoDyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTTLfZo0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so822671666b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 05:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708521567; x=1709126367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtK5MWLbQCBAiuSyFF6bj//hw0Gzw6bHi7DgIgBCBgY=;
        b=uTTLfZo0dTCwgGOQfcGRmfup2/Z670fOteqBjfL7bBF7/ZtdNpwWHLB3cEgQ2jaBLi
         le/uTqPt/GA8qJCQLJ9O5gt+A2QmJ3V7WTCohxttFHaZ1NTTX0Ooj5vzgRSKpDan4X/S
         GGso3gnzPkeyfCXet4ne04seY2B2yoOWLSaj9Mn/1OZ6tfYZU4Zd3ZZUmmriYVVAXIKx
         yyuyh8JTgzlv0cFjKvwDWym+9Qk5rf8QOehtoNlCW1q+ie6XqR+yU4RUW/r1eyQUV3cy
         aVviEUxg5e2TUferbmLJuU112K3M8thEmODr3pIZCUMgTBeRfC0fxaOGrI9ygdQRJqD6
         UEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708521567; x=1709126367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtK5MWLbQCBAiuSyFF6bj//hw0Gzw6bHi7DgIgBCBgY=;
        b=DTymBqb/u+YLydMHV1w6Ipew4JYehB/bJVjmXlChsS/yg+KBplsFZwoRAVCPvKnMAt
         oB24IikNNEYHiJeBJUtWDRpp/RLjTFgwPZOyZBPCY2WaRjju4LwnAfst403ZSVW/KrRB
         /BEBlQMwfg25KRvhV6RamRENwAzsQGBnXQi2fqDGtHyLGhyA55bqJ65j15XI5nExo2ad
         YM8QW1rEWVyUCpBcIvhUy6eOd3xtcwDhdpBNo0YeEy47CKN64rFhagUEx4BtEntZhjI4
         HpTy05wZcs4+CkcrR+QDocsCrrZ6rqnp0EP5ChVgtyTFW0dK8E09U1yZrFJg4wT78mAp
         JhGQ==
X-Gm-Message-State: AOJu0YyE83ESv/df6m5XfzSvDZO403N1ZwRt6cYJqH9PcDdhak3xwDnP
	yNEc624naKFCc4epFa/3fZe5GN/il1N5iQiboadlxFsbkbomr+BVDZA7N9YRqHU=
X-Google-Smtp-Source: AGHT+IGdWyIk8lJxpduRvuF/iGdRqltToq/V8iDbZBmbBmMz4C5k0jcrQ3m1AOOgiyLM7IDCgJPTzg==
X-Received: by 2002:a17:906:168a:b0:a3e:f04c:5dfa with SMTP id s10-20020a170906168a00b00a3ef04c5dfamr3874620ejd.62.1708521567399;
        Wed, 21 Feb 2024 05:19:27 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a3f4bb02bc8sm412700ejc.42.2024.02.21.05.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:19:27 -0800 (PST)
Message-ID: <6010c3d1-9c1f-44be-80f1-faed635fd073@linaro.org>
Date: Wed, 21 Feb 2024 14:19:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8550: Fix SPMI channels size
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-0-72b5efd9dc4f@linaro.org>
 <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-1-72b5efd9dc4f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-1-72b5efd9dc4f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 14:04, Abel Vesa wrote:
> The actual size of the channels registers region is 4MB, according to the
> documentation. This issue was not caught until now because the driver was
> supposed to allow same regions being mapped multiple times for supporting
> multiple buses. Thie driver is using platform_get_resource_byname() and
> devm_ioremap() towards that purpose, which intentionally avoids
> devm_request_mem_region() altogether.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

