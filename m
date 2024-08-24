Return-Path: <linux-arm-msm+bounces-29444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158BB95DF25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 19:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434E81C20E51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 17:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E773FBB3;
	Sat, 24 Aug 2024 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbgGzLCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDACA3A1CD
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724519130; cv=none; b=siTEvpBj1Ii1oYeT/R18v1PvE6W9MXwAbkX68yvt4g2vDyv+vevn433hKI5jswciV3Fta/rRDiVwD4xl+LMqNUZA82AXVwMB8Dk6ukMSOKWVRzx67lEmgCzbjn/zIDeAypHcvrd792p1VR09WGuzeqOqXrawLhEemLmmuaJYYrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724519130; c=relaxed/simple;
	bh=YZb3KQcDwKbRfBpA1jL8YOTnhsu2wLksJptIPtsdgs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQbd1dTegle2kA66coIpOErmeo4qN87F04+rFRLrNfwGmuLDXbi7wmmh6wJ1IAVBIGkpw/NOAkTm+gNFKwjgt5CTUKZ6A9p8jTs7xwI3Sy06cRULQRbXVBVNc8XMjf8fFmi5jEJ3U82hxpry9rUCX5xknyu2aquutan48vsHiCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbgGzLCU; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a843bef98so313224566b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724519127; x=1725123927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1wqIXwilhWQe12ivt8ypdTnldhiR6eZgAaKOzl3oFk=;
        b=ZbgGzLCU8NeN1kyPzEfZytA/xl6HaCYC6XtXQdS89SSfavtANmLmWN9q/H8Q1s+xyj
         ZNOTBZZknjRbAjkX3XROvIuzLxxUaXaCZ1tpBQldyjM4vA1Dm1+k2xvwkiiG3h1V9VTQ
         8puTMyY1YDu7Lpw5HE7PZHdLesG55ApEmHWTCb8HSAfEOtv0MpQ3Q5TMgJ0+KA0lAXrL
         k2FfYM+S1pa5cVeZyZZ4T9YKLXpLE49thy/d9eMQdDts7KGJE2h/g2rna75gVzut8v5M
         7ylGX4TUhp7xt9BP4by0Zn7hfo4e2gontjVu143Ex/JR/XgReUBT4tdVVsrPITnZr0ek
         dS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724519127; x=1725123927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1wqIXwilhWQe12ivt8ypdTnldhiR6eZgAaKOzl3oFk=;
        b=VSrogrzKezo9rFHYc+k5lZswlbua+VcLQ3+g7lJNbvfEJcSYR15d/ONmy3zi97KPog
         6E4NLS3VZVTWMGy7Ugxay+Ivt2azbHurm0KkzbJdd6JH3vDYAqET1jxRUtGIXJcjQ+S2
         tGS6Y+sYt9pO1Qx5o5hkutxQOsL+VzM9X/mtpmWv8SSEGTkN2hTLpXemHnN2gvYQYT9H
         G6GQgHsrghPIycJi6GDOVSywuAuskuFT2925zQ5/FNRJ7Pqyt/Urwj+EEEL/+cCCvwIq
         Uj5RrVUQHi0miek7CJJp/1PdZVeTYnEZ8vTwnYYJCBlexFpAsyVcsmy3j9vWlbLFvy79
         DtgA==
X-Forwarded-Encrypted: i=1; AJvYcCXeoOrF90Q+cj72O4Txn+i4h94L/n+0O7ggRMQApNmBjxUJigMZW6fqGc9UyFSOh+3CC6kR6Ceck8obf+rP@vger.kernel.org
X-Gm-Message-State: AOJu0YyTi5S97lSmytm+Z4S+zRKfpYqmme4cxbgdedlRiBfzuv1P6jz3
	ylZNAngOQqOEKB1p7l961ytoWj9x+Wja7bCyh8856qYRzlz1LDcZ5Nf3WAdSE3vaLdAYxjaz2cw
	B
X-Google-Smtp-Source: AGHT+IHt3Su7ap3ryr5NK4u0osd07i4VrChxnechoJXjiVeQ4wUl6du3KIaeBLPXMzicWs8zA0kISA==
X-Received: by 2002:a17:907:d15:b0:a77:cb8b:7a2d with SMTP id a640c23a62f3a-a86a54d1920mr377553966b.49.1724519126872;
        Sat, 24 Aug 2024 10:05:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f43661dsm423115966b.100.2024.08.24.10.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 10:05:26 -0700 (PDT)
Message-ID: <26b7fd84-34cc-485e-83eb-21daf99020ee@linaro.org>
Date: Sat, 24 Aug 2024 18:05:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 00/13] media: qcom: camss: Add sm8550 support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>    media: qcom: camss: Add CSID Gen3 support for SM8550
>    media: qcom: camss: Add support for VFE hardware version Titan 780

Before your post your next version of this series, please make the patch 
submission titles consistent.

e.g.

Add CSID 780 support
Add VFE 780 support

Mixing SoC versions "sm8550" and/or including "Titan" - what's that a 
reader might ask - should be avoided.

No harm in including "Titan" but if you do, include it in both patches 
and explain that Titan is the codename of the camera block in your SoC.

---
bod


