Return-Path: <linux-arm-msm+bounces-93438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCREBrSBl2kOzQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 22:33:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61128162D17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 22:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7C853011870
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 21:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6307C329E69;
	Thu, 19 Feb 2026 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLTSCP9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EDF2773D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771536817; cv=none; b=Eu8WD/B0Q6dclC4NQUo2EGgWv7PMr72hhlSW1BE6LBC+A56bAM4kLAYQkbZthC3GXnGeJp05tir/D0e3ReYxV2mfciGrU1jQ0o4FlGAca1rJ3TNe5D4duZwUAR4cSs1klHZfLQ7erCkNAoTZ8dKQgcYdfz3ZK6U44TIzf4L/KFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771536817; c=relaxed/simple;
	bh=tu9ih7VZyOrVQGXfc5NQvAvrv8wd9KH/F6tOAs57jrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5vs4uxv5FqBmACF2Q2gPFLEF2PTj6jHE1JkAnxr2KSkTId1IV7g5Hd3s+QXwKcAvD/hsclsekqmNANxWyjW62qDSz0/8PB/izJgxlR7ru2RQDQOdo9oK/hN3MkX6+Rv4G1jtKVE7dtjdJGpIcNvDYRYsey9rCy8Ft+2dw+xdsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLTSCP9L; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-480706554beso15664335e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771536814; x=1772141614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/dHv3d+j2SWXa8nq/pQE5e1PmAwAPgRUcEDzB12u8vY=;
        b=kLTSCP9L0eAczgXf1qcnpLMaApoHk5C0rL2ZB/rplhxYk0msDAU3xsmyZcFnjtHZRp
         O3ApfwesTG/bFWj67uQxmxChGjsfiTvHtuBwlbDZLRYatmsZH62ve9XdEon0EhK6wLKD
         27yQgzgKuWamDRFEP2NRuYn6F7rl0VX2Tyw2+rcWk9UvoKu0xhggnFveVnFZ8JnDji8A
         LxOVeoFTpRjGC1eI9jBe9Lc9hes+48QVCpbERueUbKKRkfgUTfIwqYZ9gkiTJdaIS1m5
         XxuBq1yDDrwhZJ6p67BNk9V/y9m9pgV4esUNoVvTUhOX16ydr1bdwaNMgb3KM/HqrnOP
         1Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536814; x=1772141614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dHv3d+j2SWXa8nq/pQE5e1PmAwAPgRUcEDzB12u8vY=;
        b=kv43b/0rLoGYezXzhftTSG4ghByiDiZTxDeZ1KIkQecwoamTTV1hln1kyvVv0QvF95
         YU8VD0Vft7dpRLV5w9so8CxP/P3erBDVkSdbHCBmjUf4EsmcgvD4nLgP9/Ih6xWRrI+/
         sBwRDOys8UTBdehwBRQGUNPynOJFNaJ22cbwaa7yoYnLpGaq+jHv2E47fq0RRMIUa4jj
         xGAQKHCdilG/0CCMz9oRVkasEsr0slhbM0TMMPD05Xcl9e8K3tmzsbMg9NiERlqGuiiX
         eHBmplv6Mbh9QehK2ruBWf26NZWqpGZ6cZddVa7EyvM6x+rkb7+QaVK0HCx07oGxWWm0
         z31g==
X-Forwarded-Encrypted: i=1; AJvYcCWw8DK4gjcoclzn9EQ5mwKsWeJyuWylf0TUha13so5TnGA9YhFXRlwAtEpZmSPAxT/QMk0kDCZXNUs7+ppG@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8XomzClCGWH+4OaxwfIiR2Sf9zz3ek/A+uBESc8gvtUn/+zx
	PrWeWC7Sc9y3hbkIyKCFN8wxgFfpKCaVr44rmCe9e9y4eu0SUwDq2Ch0Ya3Vw+m5Cb8=
X-Gm-Gg: AZuq6aKXY5oGBf46ooTL0R7ME89aXqwQa1tQ18PBTQsH+tEwEWGlOsu7SMLiZIa+20u
	kkO7sqIO1FbKav49pya+t95BdkCdfZKTwABIyW6TxV8ETw4OHcqs9L1+3L/1GxdI+yNEAp1xeFb
	Otg/GE+wsgrLhxJSXKVjzyNKDm8i+oCzGG/rMcyUEMWmGU0Yof5Yz8Y51MCscjGPrk1rK3qALHR
	0XpUdZuADu8MhkfzqOCCyWCy+voDevXbnCtNg5gU3Cx/iSPbRgLUkT8VA1AugftjVp3tQmZ0N75
	e3mzLJ/SdG+X8mJNnHTqB8QINROFad57ZHAqmZsjB+b0YBSLr2sfFyIhfVTZxec0yvCvroqTHPS
	kxoMyM9t3ZTqRvgz4JUd+kzCO53zTwSwwNuP8UDwGtuRLWmxEOwqyYfZcCDwNwmKjucXs3rS7ly
	MRm1qoqdXngIinmsKFLrKd7IMwgzuymd0ACsVL/lCgNDY7zvlNf1wYJPPJtjB6G5gUSsFkn6IPO
	Z4=
X-Received: by 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-48379bf7907mr294890925e9.28.1771536814197;
        Thu, 19 Feb 2026 13:33:34 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm55517687f8f.19.2026.02.19.13.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:33:33 -0800 (PST)
Message-ID: <3fcce591-cf13-4f3c-95ea-03df3ac9f5d4@linaro.org>
Date: Thu, 19 Feb 2026 21:33:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
 <708b6179-90b9-4fe9-9c0c-738fc1c82c2e@linaro.org>
 <CAFEp6-2-Kck-uL3jx5GjRpcfUSgXN+82uCo_tqtybNBF+mBT-Q@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-2-Kck-uL3jx5GjRpcfUSgXN+82uCo_tqtybNBF+mBT-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93438-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61128162D17
X-Rspamd-Action: no action

On 19/02/2026 20:19, Loic Poulain wrote:
>>> +#define CSID_IFACE_PIX       -1
>> -1 ?
> In the CSID register map, the block offsets are as follows:
> IPP: 0x200
> RDI0: 0x300
> RDI1: 0x400
> RDI2: 0x500

You use that define in two places ?

I think the -1 indexing is a bit non-intuitive. Maybe make a special 
accessor for those two special cases you have instead of a negative index.

---
bod

