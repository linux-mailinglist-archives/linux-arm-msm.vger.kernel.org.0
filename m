Return-Path: <linux-arm-msm+bounces-31890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFDE97AC6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 09:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C715AB251EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 07:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5915114C59B;
	Tue, 17 Sep 2024 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b03w+eEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F220EB;
	Tue, 17 Sep 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726559484; cv=none; b=ZRt7MAjXhHbNnGPjmRsO1ssXtUh2JNigTaIApAkyED77JZIbwb8I/YYAKvOisFwxhdb9htEMr3MrJ4K2oJ1korXYoMYzB8aio2HbL8rMwZ5kfrJpB83GqfEB2jLpsb8PiiRRkmEQdXCvee2QcNbmG49aixEwpN5jDHgiS1Pkb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726559484; c=relaxed/simple;
	bh=pjuFRl9WZsOXg0FqWF5gKgVdiqZ8jg1lC79dYya+Fr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKg3PnY5kQEGM+IKRHxbUFw99mYUlik+111ZVgyXgghqFgjhJXVn8Xz7UdxBlccJ1xp87h5moFH0Mya/CBJ9JUOVZVQDj73xkRww3z2yrudZTf54c1N4C7icWCgl4+M3kedwlqywF9UYMSJZU/AOAdWqx2wCRcz6Hicx07FOLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b03w+eEB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20792913262so34165115ad.3;
        Tue, 17 Sep 2024 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726559482; x=1727164282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrGH2mPIe89MQypJfzhvjQ7gBAj+5lcgtl2++J9A1dc=;
        b=b03w+eEB1iow081wfwgO+m9xWHrd5vy3vI76EDlNefq/OLbFXoi1mjdrdX5OSc96CG
         ClXv5Sqffz9MdMLOubHb6BDkFRh9qLWgQLqe3K/tgMfLl/u3Ccv1lJTfL6nyLSbDs4ZF
         tYD4qduPLIoNxpdDl2owBkYYJDFz5KpibiERBSedOxht1vDhqqhRkzYfiJyPtfe3IBBc
         WTIYWQhWoDSpv6Str0UFA1M255DvNghxghLcoR9oEKC6lMfS/P7AiCMvQNB3Q5bFFN1z
         tOMnemJabFXroxVYQggYd9KZTLOXYqT8MuoUa6/upNqm9Oy9n3HPA2/SG06RhccR8ipK
         rvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726559482; x=1727164282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrGH2mPIe89MQypJfzhvjQ7gBAj+5lcgtl2++J9A1dc=;
        b=E9YOMNThbSp7U4sLMp5F4UyAHtNjL7Dromt5qwNY2TCkPA2j3PPHfmx7t/Q4qXJKHv
         CcM7yptvDhugVwTvMUCrt8Xq4cUcZjx4bUJRRJieedLa1nFqR0CVVZ5cnV7mphLiFFzG
         U9EaqOUKyl1UaPJEZG9vDAH0+i0qRMKZSOj3GuAXlCZw8/Cwpfv8gdGUIwkVROhceqLo
         TB291R5wcLYE76104aE3NOd/T6d7ReBhcDERGwsdlK9FnJIR0j6qbwHNw3ZAmT2k2hj9
         45FgtENNrGH3CE+u1xIj7BuneiQ2T9JbWupo3m6R2sSp80VIeuo5uqX1JI+MYVaNUizo
         slXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbt+7WOLsqjoR6e5JKh6oq3dBijY/WrfI/f0YtyGBzRup6ZUalqq5l7ZoHcmQxBqDbFcB6E0R9F9/nNoOs@vger.kernel.org, AJvYcCXb6bEXS3UdHHGd2M+5tuFAGEVT+HZK8MI4B9VKLYVPc/YzYmU7+XMsgJS1OCGAx9xwVQp3NxbX4dxM@vger.kernel.org
X-Gm-Message-State: AOJu0YyYpD6czHkoIGwNAY93lkMReGrD9hbFjqIPk22YIs0fl0rrWJ25
	4V78pHTEsb2hKzQE99BOyHa5S1api+Da6Gl5KOtq4cgio7KJdjRjESTz2TD77JvIog==
X-Google-Smtp-Source: AGHT+IEeus8aOTYcUECAdvl+30eI4Dv62kNZY04t3pAKwmTROL2awD8q4KVcvuM9V7BGz+mqH4+LeA==
X-Received: by 2002:a17:902:c94b:b0:207:5665:32b2 with SMTP id d9443c01a7336-20782a69ad1mr210704465ad.40.1726559481985;
        Tue, 17 Sep 2024 00:51:21 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:864b:f5ff:fe5c:59a5? ([2601:644:8502:9460:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19c0sm46139135ad.146.2024.09.17.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 00:51:21 -0700 (PDT)
Message-ID: <7c99becc-c179-4f81-ae50-5fa3bdffe1b4@gmail.com>
Date: Tue, 17 Sep 2024 00:51:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: expressatt: fix pm8921_l6 regulator
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240916-sd-card-regulator-v1-1-669533c393d7@gmail.com>
 <edeb1681-7159-4fbd-ba81-6d007fa12f4d@kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <edeb1681-7159-4fbd-ba81-6d007fa12f4d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> That's odd. Are you sure regulator is provided in SD card node? Is it
> SDCC1 or SDCC3?

I believe it's SDCC3. Unfortunately, I don't think this patch is the 
solution either anymore. It was working with this patch consistently, 
but now my phone just hangs on mounting the SD card like before. I've 
tried a combination of GPT and MSDOS + vfat, ext2, and ext4. I'm not 
sure what I'm doing wrong cause the SD card consistently works on the 
downstream Linux kernel :(

Sorry for wasting your time


Thanks,

Rudraksha


