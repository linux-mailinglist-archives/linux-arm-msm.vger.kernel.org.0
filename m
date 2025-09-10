Return-Path: <linux-arm-msm+bounces-72987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2DB5177C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E95491C8425B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D128431DD96;
	Wed, 10 Sep 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQ9SZMpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4CC31283E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509150; cv=none; b=QNqzwQM9Jmr1Xqk3VrPKrxE0II9V5REB+Q2kb2OAn7cEgUrprvFDQuqaqxjGQxm0lZRk04VQOMhon31hcC0qbZPJY2lgmsi4mN+RuUH60kZZPklw97XnZ6LV5emQ3SdLhYyKMgIacNF8oDUWb6BP0MESNB8+4iJwpRzXgQYz9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509150; c=relaxed/simple;
	bh=/IAl3c3EYOoYwYw+XjY3kagWIsE4eP8CBIYYAfbZtn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVKEBpI/rXDTlQw4x1376ABJkey5i5xOxAiXr9Co8ZbZQ6oIwuE1vyIyuwZ1PIdrNCo3Y7d6OScu05RFTvADlNqMcuvJHIz5PVdpznG0s4T3ODXG2q/jBUeJ33+xqNNMhUqFr/He6vEQ5tzcyZqB2RBzO4AkBIM1jaZWy9uGl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQ9SZMpE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b042eb09948so1307864566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509146; x=1758113946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=;
        b=JQ9SZMpEsb/SUDDlJgz2IzBTIYmG1dwNFYDd3EPvv5OOpA9cW45y58zBakr0ZThuk0
         vCJ4mouOrs686mSRSpwv8gUj2o7j0Xy9ImyHl8WMlvDt8ouGdlZRHl2o5p46LeD3G/AY
         5S6jThsvX84LhYUXZdhpZhACT8csSqv6Rcr5qr6dkPgASzhGjWEZ+HB9SdXwlNcwMUIU
         ocb+AaPmkm3XujUARPBu0+7XskWf5sOYbTTpO4ZWwP95tHLHduLE5mJh9QZu8I+KVldH
         b9WnsIIbw2+Nli2bL19clAzenQxrMmtL4OFthZ+hnsdXt7mVdTV/lApdwLY5HHytSWms
         XssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509146; x=1758113946;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB4gaimWoDJk3NhrrABBopa5Fo6F6OnWDi3KrUcJvnA=;
        b=coDGwhAlyiD0YXfM1Yr/5ZxvVWuj7/OkDHuRe2bznRKaMu6Zrm2YsevCg1Z253rUau
         kt0eb4kQydN6EGJXs0wzhsbJimfdMzOcPsqDRZxN+Zl01k1lqHfbFsrBLaDXMXzs6Z40
         /yPx8/Xn1psOPdr0suQLc1qTLPNioWtD9HualPT8dJlupkAkJbpE4HS5m15PuU24ralY
         iaOhtw+QBQveHpvH5yP2fYz1RuqH9uQfy2gfCilebJRwSMXp31m2XahUYFA8fKr2YUkO
         LtXb+jasXGtTvBX6wXI54L3Ci0/U9Rg7S6EY8tTQ4wbfSC16/HqVN13NqOjL53zLggNS
         8Bfg==
X-Forwarded-Encrypted: i=1; AJvYcCX74JSjSXCvxlE6uyP4dlFuF6o9FV8AaG6AbYxjlWeRpT80QGfhR7kEXuxtYcy/Rkd3C6AB5dobtXHZTWZk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7j633jsm3S70gCpb3dPb37e4lELjTqyqoVWIglTF4Bk+siAei
	HthTo7/eoq+KrOp0mx9VxU83TBtsjKqmG46OLzpD1bg5MHiohDrQcu22N1yi2skFE9Q=
X-Gm-Gg: ASbGncvPJR27CQlLWPgiZ42QKGf/h9ZQuZQ5SMp9jaMT1Q5wfsi/JsH66T6M22TqS7l
	tCzZRvctIaUD42kHhahIJWMxfu0La1D13V8K7o+DAetqgXSOEh8Gcvw3hMbWmE+Q53J6QW1X2Nu
	wgbouOG3S4ZsoF4eQ9iLaeKMEChlJfbfFiwChUzGJSvze3+3+uC2xotCvfYyPpYpNtTUDG+ITa7
	Zg/ff+7sNEFqFYCtC0GH7sJsOdgwXW4wWz7VO/WyfC3XHsL6r3G6f/OUtkzLoQhvWFbxT+ewtWg
	TYt15oYJXvl4widpzu2P0wqlc1q26GxrVkh7wX0bGDltf0bm83EQBhNDWySVIs1yyWstSWIWDxo
	XFWbQkxNSYpfY45Nx2pLVpyEu6tIXxtUN2D9Zo12v2bCV+7yVEQJuhfvHqhIlbwYyFqbUPygzFW
	mScc2Boq384f042VEYgYmmmbj9m8yXAs+pI9OYeTyY
X-Google-Smtp-Source: AGHT+IHo42Ln/UQnJWBf+4snnXCY6UqBRGuJxVk3ykkRWA2Up2JqPWEeup1W5Piw4s3VUCTN4TNccw==
X-Received: by 2002:a17:907:3d90:b0:af9:eace:8a52 with SMTP id a640c23a62f3a-b04b1712177mr1353371566b.50.1757509146401;
        Wed, 10 Sep 2025 05:59:06 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830e613csm164708866b.46.2025.09.10.05.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:59:05 -0700 (PDT)
Message-ID: <8ea6406e-0312-4ecc-8527-3b3740c4c01c@linaro.org>
Date: Wed, 10 Sep 2025 13:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
 <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 13:25, Konrad Dybcio wrote:
> On 9/10/25 1:38 PM, Krzysztof Kozlowski wrote:
>> On 10/09/2025 12:49, Vikram Sharma wrote:
>>> Add the compatible string "qcom,qcs8300-camss" to support the
>>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>>
>>> The QCS8300 platform provides:
>>> - 2 x VFE (version 690), each with 3 RDI
>>> - 5 x VFE Lite (version 690), each with 6 RDI
>>> - 2 x CSID (version 690)
>>> - 5 x CSID Lite (version 690)
>>> - 3 x CSIPHY (version 690)
>>> - 3 x TPG
>>>
>>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>
>> Do not attach (thread) your patchsets to some other threads (unrelated
>> or older versions). This buries them deep in the mailbox and might
>> interfere with applying entire sets. See also:
>> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>>
>> Please version your patches correctly, e.g. use b4 or git format-patch
>> -vX, and add changelog in cover letter or under '---' of individual
>> patches describing changes from previous version.
>>
>> What is v3.1? How to compare it? Try yourself:
> 
> This is a weird invention that some media maintainers seem to promote..
> 
> As a b4 user, I would also like it to stop, as doing anything other than
> v(integer) will open the door for unlimited craziness
> 
> Konrad

This is from me, I asked Vikram for 3.1 instead of a whole new series.

Anyway the fix isn't this patch its 
20250909114241.840842-5-quic_vikramsa@quicinc.com

---
bod

