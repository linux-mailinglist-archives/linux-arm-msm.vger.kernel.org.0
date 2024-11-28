Return-Path: <linux-arm-msm+bounces-39448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C39DB87A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 402182820EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7591A7AD0;
	Thu, 28 Nov 2024 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D22owIct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5E1A01B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800265; cv=none; b=MFK8fj4l8ZpzQPfcC/BmEWsSWVx8dyv3NNXBtlBRuNW/SlOmjgxq+euYGxl0AdNfDSCRGTRAqGiDELkkqUsRgZEhoBWadc8aMJLQKObPYdX2ZykyhnBdUt6cM6x5J1MO2o0/fnSfyG64RZ1S9rZe4ONkVW7zzmqEJvkRT2/z/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800265; c=relaxed/simple;
	bh=6N0bgmGW6ZFE1RBJSAYibt4wD8JBkZs1/eYZgRBGMOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWdAieMbxl4srFFfArL+26YgRe0JkpDMdVaEFCF8BxKgUWYXVuBj7GleqlymsZGj34foulv9XMhD/pbLBo7oJnvxMmv+ffkigggWsGBOppKiIwZiODvVezL1CF7I2IylNmZjEOTFYbXATzU/PFGjJHtTrE9W5iK/mzG0OIOdulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D22owIct; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd0ee64b5so106352e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800262; x=1733405062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXmwGgua6b6IFHk+sz5oYErhryQ6lSwss7yAIxQHIIc=;
        b=D22owIctVKxBDkaxGYzFMy0rfpp6kKM1JoEakN4yj1q+xxIzhOeCA24rgu/0Jtf2fD
         YdZCFfXRCAJGK/1h+XMYphJOvJSNeZWdajY5PfBig/rg6avopRRxOwy2ccc8tYBbg77e
         XyQrIddjeRH4ASCI+sWepk0ZT93onZnrKIo14FJ5XLrd/IH2kfEiyQFoAkldqcBUQOuG
         /fId78i4zP2kP6s/AofO8owlxCfXn4fZ21OjvPFnYzmuN/UXR3O66e0falhSxEnAKjnx
         XD2ffpaODjOtiszMWyihs7g+NtWAi6yJV4X+jkQ1sYn6uf8Xqol4l0oB0gLtZ9fp5Ce3
         lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800262; x=1733405062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXmwGgua6b6IFHk+sz5oYErhryQ6lSwss7yAIxQHIIc=;
        b=HiWOM35DpOaAeO8d0VmDqpEfG5f+h5dYGIHYVtuqVmMUbPAAD6KSboUSjMfodFEkYD
         xuXPCoi8e3Lehh7EWYd/VFTxW+Y2p0HGKrfOMa3iKaCgKhUPZ9LN0QH0e7pRbbcfUX6Q
         LWEozfBHPm/+14sQZmnNN1537xKHUB+3csEmtNhJqa4Z7gHHa/ZaZ5Q2ZOJEcQpx1dUl
         I/8norF/TFWgvU39zdJbJ/Efd03ZJJl/dVAbg83JH2zB2qmxpbXTMlB5wUlbBH6JhH6s
         n6ZiqgE7SCQ57OwX8UOGbzvHgnowWuLeQe3FX8LNtHQwp6WevhxH5RNKlSpGvjRdQHtR
         dBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4/zTYssQhvSub+onfTYBp3jWq3B8CW2snDTWpH6d8VJ2T60Z+xtPneWpBo3PaBNqmP5cfnphTm5DhwYsF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5kwsaf0qcZeF9ooKlI3kH9VheQddPHBxfy7AriepEccfVgRJb
	RdDCrD8YdChcdUpJaP7fy8YQb4G/Ub5dqVCWj5VCCVSUwBveL7k3laTxSWPZy5k=
X-Gm-Gg: ASbGnctHX4akW8nG2wJOgahFdxk3cUDjGLSZI6jl2gnHzyEpCPV+eKBQPd6X37uGUnX
	Qr9ShdDm+cAk0Jb7lsQiaeGr5hZcCTX1Z1B4Bxrb1FcprTarugkI5TqjFOds0snCUxgUjuvKThC
	CLPKcEK64K0WG+ucgXw/fzo91oy5OYiqdqRgwOf3DHdmCPyFvdfYT4qn8ypZway4AHMQ6UMz5Nq
	SIRJLGr085GQlTJkh54EnNp1Eur8DSQvV0iCCj0xUlLwkqIbOYTwaGGGnVVV9EJ3cRkgYyuoSj6
	bSgMoAkrZ4W/y+N6x6qfO6+pBWiJ
X-Google-Smtp-Source: AGHT+IGFUJAxjvhsByyBdZMcAk0gikSSjkNb3tPTHIn7AP9ungve1WLXE07mxdF/zOolQIu33Qx1Vw==
X-Received: by 2002:a05:6512:3b23:b0:53d:abc3:82a6 with SMTP id 2adb3069b0e04-53df00d3e59mr947638e87.4.1732800262033;
        Thu, 28 Nov 2024 05:24:22 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f27fsm176060e87.157.2024.11.28.05.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 05:24:20 -0800 (PST)
Message-ID: <b97adbf2-f19f-4cd7-9266-526957c4c3d1@linaro.org>
Date: Thu, 28 Nov 2024 15:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-1-c010fd45f7ff@linaro.org>
 <ad906baa-a93f-42c4-bbe5-968fa939c653@linaro.org>
 <71dd9aec-e2b4-4323-aeb6-53f2491005b3@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <71dd9aec-e2b4-4323-aeb6-53f2491005b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/24 14:54, Bryan O'Donoghue wrote:
> On 28/11/2024 09:02, Vladimir Zapolskiy wrote:
>>> +    np = of_changeset_create_node(ocs, dev->of_node, node_name);
>>> +    if (!np) {
>>> +        dev_err(dev, "Unable to create new node\n");
>>> +        return -ENODEV;
>>
>> Leaked reference to np.
> 
> I don't believe that's a leak, because you only release np when it is
> non-NULL.
> 

Clearly it's my fault here, I'm very sorry for it.

--
Best wishes,
Vladimir

