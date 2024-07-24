Return-Path: <linux-arm-msm+bounces-26987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C20293B8C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 23:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40DD41F24C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 21:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F4913C807;
	Wed, 24 Jul 2024 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8opjxQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5313C67B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721857386; cv=none; b=KGukjkZPxqObNwRBAw5EpCNHOXkXnyzmBevoiRvRFsygqOLFGnTjvFTD3wY8nWvrs9FoCqspzKKZcdrc0tyvHWC+pdD9HmNBNO5MoE330hg/UGQJnGInJ3U3UyBOk+GxzF3NLgPvJHIAWg0CJ2TcVgiM00Nm9sCOsQg/XgllWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721857386; c=relaxed/simple;
	bh=E2xr7KdHpOeVO8weg/YauvOwd3FI22iwYLqct3kkkuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZ/vk2SB5k9KDqCdO+NZGJQwdA7x7KKjgtXG0LjO1qcE40hfu8GnDbq19jBmsLtZUb/nJxBoPAYYzVeweAvTt3kA0CCDDrO9IkgLMDlWA+1e7ocxUmVgW1nohxKIVFe9GRH2Nhf2aCz82m0iQ6mQff4mA7UwFn6eyrU2N9UVApA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8opjxQx; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so30968166b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721857383; x=1722462183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PVcOW0F31P5btkB2U94IntsHunux8cldHR5tp2dBkfU=;
        b=Y8opjxQxdEgyznwS0k9r440vF2O+MuvdqCIJsPYi3PDQhus9VskEL+6JN7AqWDXqzi
         khlueNx2JiQSLsSxeaihGaAoYNlXUuE4OpDwBcVjT2U4rd8aF1rgtldEKgS+A2riOtBX
         4awJ+tQJrSMFLF/2IZ3lAVb335F968K4oqpX0CWXQuAUBNMnnyKFGLC/1a8ynB9EjtGW
         0OOil7A+BSgQTdH9IDPLACovzKiCB6S6GVA9BSm37rvGICIN614hroHFtj9Dnxd1OBLz
         f8VrP9I1V/v+4w2UCtGpT96EM78mSuNCbv9Sm8kXVQZlwjtiuBK96KYZto8BOrnv5Zg6
         V6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721857383; x=1722462183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVcOW0F31P5btkB2U94IntsHunux8cldHR5tp2dBkfU=;
        b=PzyrKOoljM3k23vJ0ktMAAlkVFy84eZ1Q36aOnQTjR6uqEvsHgSSeBax7M5sehO+6h
         V63xOITXv4JJ+vbQ0U+Aal8HWqyKt0DKv1SjenGXaDJzbyUIQ5P1CDqP080CUdHINVkC
         xAGXXg0e+krLrIiH/q0pz3rUl7uC51FSusNz1z4/RPQYaifujcsFk4+L5PA+Tkpf2Zsz
         H1gRw8rAPIyB+sdIZC6lSAW/k1bSuhyDYOOLvelZdgJLGkF4ux4T9WSfWm7B2se2QExD
         lPQb7gCE1Gg+cZSRUVs45TZMdhsVFFwX8Dv6FK8HD2XCHASR81j7x7giaIYQMDII8dS+
         GjIw==
X-Forwarded-Encrypted: i=1; AJvYcCV1gbqc5V/Ca1os3cX9h6jIVSeDrDSLZM9M3n31k78+iBQyQ4exnw0jGUpSERHK0dEBPtz3X9IHYYUGXaaKxOuwVZF5rLWjTs2wIU6f4Q==
X-Gm-Message-State: AOJu0YyU0tRJKDl1ow1An7v6OsSS3a1s1m4pnVG6oIThL0SpUWVbHiw4
	R9UGZt1ch2C3ihOxqjipQz0x5UiBku9PNjeRjqAEVkzLSm7ci9qgtMSsqoKm9MQ=
X-Google-Smtp-Source: AGHT+IFVM1Nkj2yYiNbf9q5q1cpfowyG3cIYVGgomj/kaPJhDFTuPBpzG2oJBpqSohsBTOMNFw8Xuw==
X-Received: by 2002:a17:906:26d2:b0:a7a:8cb9:7491 with SMTP id a640c23a62f3a-a7ac503439emr44164966b.54.1721857382590;
        Wed, 24 Jul 2024 14:43:02 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad414e2sm1071666b.127.2024.07.24.14.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 14:43:02 -0700 (PDT)
Message-ID: <835d7a84-aa37-43da-a4e7-ef52d8642357@linaro.org>
Date: Wed, 24 Jul 2024 23:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Add touch keys
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240724143230.3804-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240724143230.3804-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 4:32 PM, Raymond Hackley wrote:
> Touch keys feature on fortuna phones are provided by Zinitix touchscreen.
> Add property linux,keycodes to enable touch keys.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---

please bump the revision (v1 -> v2) when changing the commit
message and keep a link to the previous one & a changelog under
the --- line

in this instance, don't bother as it's a simple change and it
looks good now

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

