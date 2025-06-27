Return-Path: <linux-arm-msm+bounces-62715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA4AEAC24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 03:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7EA9189BB17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3344978F4B;
	Fri, 27 Jun 2025 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCWxXp0E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43272746A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 01:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986350; cv=none; b=AbU7M9hDE+TEvrChcql2txKyi8mfofoeMbVKn2/Hmgf3hb2R7mz8Z9WEIdFytPOYMxQgG2ooMZaiwQYiAQ8FT1Z394KBCDAp2C9Am/u3i+BXN18l1EYBOTS/PnFaczeIvaI1A6hfLmJ+sBe5KgllA7VwkSYsg4i4fLKvfczXhvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986350; c=relaxed/simple;
	bh=5pMT3+eEro9ox0pu/3gJoCitkuT60qFDYmpBxmejqZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFp6XW7w2z3niCwG7vbEp0vNamAtOp8xBsyvdQ38Kku7jXg5IBJGj9mRpbMD97+JuVMV/LFjKB8icp0aakT8NSFZUcvCfb6N941NE6VmQW49H9P+X5L8Q9FBzYSavCFRRq/B4IavipLqx5OtqFx4f/jSGMo0haGe/2vJoQ1ovW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCWxXp0E; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54690d369so1423518f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750986345; x=1751591145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCEH4/nYFQC/5D2TWQLQCIAUawTphbfim/GsSeVhbPY=;
        b=mCWxXp0Edg++D7XPrK91D4EXpGANa4cc3wqKnU7lbaLyHmbh1u1oi4QQwgHQzME2Ob
         GFTe43xf4cAnAqB9SLIpTNf+xBglj3OTc3yl2Y00yz5fKgqnMDqFYJEO/9ySK9GmG7Ja
         Ni5Uvw105ixK9RVs3WtrDAUxmBROT8MlrdSasyAZdmKaeMfhy168vGnCVvthIfSckGeV
         7p7bcP8HpSa/PVezEMrggjSpdfn+wNZQ2zSHfIv3DcxnjfktFjXEb4sqaJ2RtaZTmLtd
         xfd4xnQqddM/Q2ByLssfG5VewSOzvsp/SniHYe8zXDXN+S67cXpSa+yEGrT2jbCVSqDL
         Y6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750986345; x=1751591145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCEH4/nYFQC/5D2TWQLQCIAUawTphbfim/GsSeVhbPY=;
        b=ec2jfTiu5bpnc/GlGbzy4C5DERT/1xgLGcS7cjr6xJ99zVP0DOfpsS3Wn0T0oJ9SN8
         dBONw5Pm5WyAK0kx7LwIbT7psmfa0Dl1AHymHL86kF4OaBsR4i/M7SIE6Kna2Hm+xIo6
         MjoJcAntT69cam2bG0L7NPk95zPqxNQQqKiV8t52uLPYiS165zBxCC6kAOxjuwZYkLrE
         RV3vjqPdUkVgpBUgVGERPsfdBqxeLQg7hNhW+g5dW37g/houMm/wh76vQCdIrESl7Nb8
         cA2YMMd8ap0OVbJG8iiV+7LjE4pYmVije9olaz/HgcK+bd7pY+64ew/RXhOLTVYt2hR8
         j1MA==
X-Forwarded-Encrypted: i=1; AJvYcCVaTQcheYIsYqL8CmX33mn8uLJ0woVRj1tQG+Yu9anYtwpMuFZZTx8fTaPfXhdj4zGkEFWssNeNi1KPWEdq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75OTNhRgisJF+/ILDgB+SoYkVZCieLWccZxuBB5UsdGafuaP/
	Dm17NOQD74FPxsDww4sNtQab5SsxtHQDWRF5qAfilmgZrH724XMaExDkU5llrqReeic=
X-Gm-Gg: ASbGncsbLVruG9Z5vI3/40rjOV7+YFZ8CgVf+33p2dYzUEx5TTqz+4X/MbbbHgUgEUz
	s9wacQhf5dHXot7pkxGjf2PL2NHVScKt9yxNwd5rNjt0qG6gf8+1yyNHbb0nf71jjU6M9x5QFHb
	c699PBNfxTjbar5eNkOpxWBbTqQB5US/iW4zSrO8gzU+1Lvp3XTQJSG4KDm5Z90BoXQN5/TMpFc
	LCIg2lT1N0Wg5Y8l2+wk4kQECZf8GP9jFvh+F6OsKdW4dj5n3CRqU6w0JoJjk3DEFdYYNl44aEO
	HGLoOcMf1XovGYAWSBhyDXZYP8V9ZbI4YRCO1CmD1vyQ5sksbnUxgf/vmrDzxpUlgrBL8xb+cix
	MBPG8FxJrZXb0b31tFRQvwnubNOhBJE/nVfIALA==
X-Google-Smtp-Source: AGHT+IFey/mVIRKk3UWUu/tEfrImgRAEJgM0T9pJubxRsrTOR9on5HnEM0Ys6a04nuCT6wlQIXOdGQ==
X-Received: by 2002:a05:6000:21c3:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3a8f435e29cmr997757f8f.1.1750986345232;
        Thu, 26 Jun 2025 18:05:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380d0f15esm59111445e9.1.2025.06.26.18.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 18:05:44 -0700 (PDT)
Message-ID: <9153b2cb-b123-4799-939f-cc8b7e3f1330@linaro.org>
Date: Fri, 27 Jun 2025 02:05:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on
 supply names
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 vladimir.zapolskiy@linaro.org
References: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
 <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 01:43, Konrad Dybcio wrote:
> On 6/26/25 3:24 AM, Bryan O'Donoghue wrote:
>> The -supply postfix is wrong but wasn't noticed on the CRD devices or
>> indeed the Dell devices, however on Lenovo devices the error comes up.
> 
> Please give the commit message another shot, perhaps with "PM" in the
> commit date above ;)


On 27/06/2025 01:43, Konrad Dybcio wrote:

lol

> 
> For the code:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

thx for RB

I'll translate my commit log to English after my suspend/resume cycle.

---
bod

