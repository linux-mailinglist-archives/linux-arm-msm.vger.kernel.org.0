Return-Path: <linux-arm-msm+bounces-82233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E802DC68982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 198292A5E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F012857EF;
	Tue, 18 Nov 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2Yv1UIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965B42F1FED
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458889; cv=none; b=MF4sl1LM7Aot4zOJ4suH0Cryacf6krDEqSNy2KmMGJafIZ1Im7QoIdV++6h/0cuc0CnZWmXzdK1pTqIIirYLDSMQq3/H2trIQQFNEpeEyGvHSneMNRMawX+LmFJdxdj+qf2vjfvHbuDl7kFsdYJt5/wTATxJ/SBegBKEPsaYhmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458889; c=relaxed/simple;
	bh=nakmxTpXhROsCut7CjTH+rY0k2mx1pEXcnbMBfwjAkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSK1K0KiBYezsYSNqo6tvgM+MYbrHtPQRnhA5SEaRkflXQg1fACFbNW8C9epn4cZi0/+285YEPS09jaCG483wIqX1T0Fk9ilD6mhqgghVB2FoNXvI1coLd1esmyznXAYPqGmsGuE7Zlzj1Gh04MXR/o7ucU1nRyb6DNxUd1XNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2Yv1UIN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429c8632fcbso3715519f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763458886; x=1764063686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtnKVLFkBU3sduSzw1o97JWvysAHMmEiAWVYPf3fezk=;
        b=H2Yv1UIN/3LbC+ivIuOuVE1yuZqsGok5HfcKzVIe7jl+KsKZBr4Q+bClm2lO7DUspJ
         9RRjPpX+e4JnZpVu+R4uTfc/QleT3MUkkx1Vyp/R56zbOjoaOPBRlhWVI64hgoukfuHn
         gPR8oMcOwCbEX/61C6uaItwv5h8L8TMCwLyYiVyF3JrFF4iANir94MULcBMAmoB+EyyL
         Q9ui7X60EPXAYbyQ6GVHTUUMnj+4pQ9VOI/G97U9BsoV77ql8t/40jjjKenhFvF2Z9FX
         6EYcNlIi6vAztRFdrQ5MwDs1mwbxt7uvhbfp++ZxPOzMQXN5tkRtjQVq2uZO9y/bsnqv
         qxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458886; x=1764063686;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtnKVLFkBU3sduSzw1o97JWvysAHMmEiAWVYPf3fezk=;
        b=PQvDCiOdwnZx3R5r87MRYXbydGhtiiZxgEKom1MqyLPVsoVnmndkSQ6ewlG1eRSc34
         JFSa9f1TbR2gaPAR+YrZwj0UuZy/pYVL9EIuPhriHXTPAUjDbLSKIlmkfAoslwHCUNjd
         LgEFUDd3e+88XWI4Pfxp9f5ndwhCrBVX7bHAWw+OaPXeQV04mZ7qGcJsfgtQz3KfdraS
         fCAiRWVidHWZk9fYSU8tWAgqqjbJimkeUlA8BgSAd2Y/oh/O9O0pkZICzCDysSTintY6
         l5PEnrpkT69IsRKM++vh6hwGuV5xfmHkkcmA9tY8qmBTPj8E8AVaZtLwnXPdr4bRelSv
         AzFA==
X-Gm-Message-State: AOJu0YyE4BybOCoE2HtsvIPc3X5xz/5xj5yUE1FFUre7lSYiBjJsEjJH
	6WpzNWLEa+4QHFSX1khAuZo85jmv8OLRsZ4don64sCxD3bBGBVYM9khfmaMmWIq2cxY=
X-Gm-Gg: ASbGnctc+Jo1120EqJ9H8wzEaXADUE1TTuIK78Xie7KiR38kRD8FAIAwP2jsvXMoNnx
	DJbb4gJ/6FD1pphElWXmw7Ti57OlFHB2KAQBOC2ruJZTKYSXCJJfQ86y/cRw/oDBEMcGwBLNMx3
	LyEsacawj9vdZui8TvX0LCRR+gHptKLM3dfk6HgW4y7DKwe9Ad/8qFFRe6+Pv1WC72Jd+aE40Yo
	pNWBhAhxPODAmVhnpwB0JySaVzcH75SIkFhIR/UeSdy9RsM4tEWaO0XgRumjBLmAxisddUHcmIa
	+uafEY50GEk10Z/CaCZKTXmj0KoGYBKWGzZ9xzcG/GckDP7eSCJoFTKhe5zSbBHDGZw8rSfDXPC
	psMNgdGSvIRTFaKE2k7210N/UP4EcZjYbroZpJa0roLqX4FM3mHxazgR/k9MQXzn1FrJlCzUMHE
	ExXG3YIbZ8D8NC3gczTE/gqZK3mwn+FKIfQy1UbD2BsYcs+mUcnPDLkRXFYHjqtCE=
X-Google-Smtp-Source: AGHT+IEx0A12Mrv+XQJGWIZngs9UaDoduZw2cyhd7A56k2LZLTca+iipujhKE4+927JtK5S04+21rQ==
X-Received: by 2002:a5d:5850:0:b0:42b:2a09:2e59 with SMTP id ffacd0b85a97d-42b592c6797mr14785840f8f.0.1763458885861;
        Tue, 18 Nov 2025 01:41:25 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b62dsm31225819f8f.24.2025.11.18.01.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:41:25 -0800 (PST)
Message-ID: <ced2ad99-fe9a-4794-be2f-f8760deed0a1@linaro.org>
Date: Tue, 18 Nov 2025 09:41:22 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));

Why not just add that code now ?

---
bod

