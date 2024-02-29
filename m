Return-Path: <linux-arm-msm+bounces-13015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6DE86D340
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 20:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4696C1F2253D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 19:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF67D13C9CC;
	Thu, 29 Feb 2024 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCIV2KA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209417E11E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709235338; cv=none; b=P06f7DQTAf9K9LkTsYMYOUfOLzVjHOXHx4iGLNG+VMjFL9mADZmJJJ91Bk90lSPOa1jdav1129+JIf3cr0vdld0W5Bv43991cukbicAV1RPn8ThGV8iOpAsaVt8qd0qnO5IY8uFQXZ7m9H0uCke9jUIViV1YzlEUZq3HKOqWKxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709235338; c=relaxed/simple;
	bh=qKTCl023+TG6ptHz8R2aoypyGdCA1c7zJuvu1Y664kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qbt8OsTQzhWiq4vsxQS/MRO/edpJzhoHxWxxwEOQtCIJIOMMH67sIaqaV05Ncr5QupEjlVZSIdvcllrhYoZt3MOPDhmzMuCwEPFf8uC5hfkMVquuh8HBNZMih4eE3DtSFrPhO4SvLsmC+GAhTl4CC53kHd+84E6LvkJnMZuKDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCIV2KA5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56533e30887so2295243a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 11:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709235335; x=1709840135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+wslvZ31dmSG0Z8CG3nZldsAWmX7kd+egAoE7YdCw=;
        b=gCIV2KA5DxwQQPF42AtfakMAmZYJbJBbpLJ5wTPkQxWA3X10CNklms9Q1+UQ63SKWK
         h3jZfFnzQ7hlgE5uc+4wys/O68QVyJX5MPlaxFLLIDrKDvAiglmeJkxK7vQH3efsc0f5
         lllUYmU7fy+LQIeJyKAlisxm5shYPbFy2tXcA28eycX477pp1E5SLmgnZHnFj27j0gm8
         QV0MBQ7JVq0MYeAlUSvMtAjpoGTSEIprfD7b25zz5c+f7lIp8Y6/3rs7VGpho1AYF4u8
         U31fhNhFz+J3GXlfT77WNqt9M5ICmqYmTbRjCzqSIs8sDe/ojiBPCpWm1D5T87ENtxiR
         0CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709235335; x=1709840135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+wslvZ31dmSG0Z8CG3nZldsAWmX7kd+egAoE7YdCw=;
        b=NDz0yBsZ5EkWzIQE7KHP2XSmRDxgxNKKw55PjLvenFLNmgBtMSUqzQYUbik7SrDByb
         ke0LQ+RQc9Ja+e+ghzP6Kz379vW5LeZw1setMY+pZ64wD72luPI/ytEUCtavjIZYG3ys
         yG+EgXSOkp9SvN0T3/HqyE6N0pOk4qYdQI3ElGJbv4ZOE5/6aBFe7NOe8AX/cYS/OsJl
         D9aYQ+zQkwQ9R3xp6/MPr4t/Ynt2tC8ttaUNBMNRAgszCcoCUsbnPWAw5dLZ3bJPUVSp
         ++0pBHB/XX7TXerdKF9BeAi5EnZPQpuoEHmMfxR2wSSV7DGU/eNhJ8+sFB/xMd2pJbBp
         Tmiw==
X-Gm-Message-State: AOJu0YzAQe2LFwhTtZMyDMlMYL+TJHh+9CGt0GDPAdIMIWVCScIZMOnX
	2pw5tGtQnJ1V9vIq0586S48cSwpvB1RA7KsfAh4Bg10n3K3MHQZOFzIUCBGOjn8=
X-Google-Smtp-Source: AGHT+IHcZ2sFV7SfhSS4Xp21PnLjwQ5ABnDUIZ+eB2HWE9hCK7oNJHNHuZwCPxqlGh03QUk97pJewA==
X-Received: by 2002:a17:906:6d15:b0:a3e:8300:1af3 with SMTP id m21-20020a1709066d1500b00a3e83001af3mr2395177ejr.30.1709235335347;
        Thu, 29 Feb 2024 11:35:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906bc4700b00a441701a0edsm966266ejv.51.2024.02.29.11.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 11:35:34 -0800 (PST)
Message-ID: <41c53849-f4fa-4514-ab9c-9e20b234f67a@linaro.org>
Date: Thu, 29 Feb 2024 20:35:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add Qualcomm SM7150 DT
 bindings
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, djakov@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240222174250.80493-1-danila@jiaxyga.com>
 <20240222174250.80493-2-danila@jiaxyga.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240222174250.80493-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/02/2024 18:42, Danila Tikhonov wrote:
> The Qualcomm SM7150 platform has several bus fabrics that could be
> controlled and tuned dynamically according to the bandwidth demand.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../interconnect/qcom,sm7150-rpmh.yaml        |  84 ++++++++++
>  .../interconnect/qcom,sm7150-rpmh.h           | 150 ++++++++++++++++++
>  2 files changed, 234 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,sm7150-rpmh.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


