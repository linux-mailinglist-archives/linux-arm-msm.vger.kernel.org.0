Return-Path: <linux-arm-msm+bounces-28579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658489528CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0801C222D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F6B143C65;
	Thu, 15 Aug 2024 05:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9OXKooB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C92E64A;
	Thu, 15 Aug 2024 05:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723698937; cv=none; b=HD+9J1NGmsVgaehnRc/0s/PjOdfwDvxIp8XZBdJOsFPVbQW49hw3I/c6wJBe3cralEPc9uMF8thSHnwn2eZt3KIGfhkRAYfy5yaC+pCI5kAfZnyWJm2Mx2adXdxjBlLosJ1MfvuCsZnrYbFTM6lrKG4NhgzfTeXOVJ/5n3rwYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723698937; c=relaxed/simple;
	bh=FTpidOG8cdUwdkqLhqS7826a0ol9deT8Ic8FFg1dXQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZKnKDRPxdPOHLflFfTF9wS3MJBK90U4M232fFymcJyFtDMP+f5YQxCOgPz9sZmLkcGc5ISjH1AnUTkrLdZKE8qEvUbeOQWrcAvn3X3IRdkHQAwHYpwSPANwQwfvHAGRiMc9MJxH9n2uRbr4j9Dv3WTe0UxrSrmv4NCzNYRareI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9OXKooB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efef496ccso450290e87.1;
        Wed, 14 Aug 2024 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723698934; x=1724303734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlmMnfZnyk9sQ31EPnuWHDN6TPycLzZuMRASfe7DhFU=;
        b=X9OXKooBteugvr80n5fo3H4igKtysXX7X7eQmFzsxAkIIz8Sc4m0b+VeiaJ1GbNyLD
         /IP1WFR6Qx2Vcs4gahjfRQIqoEa5rUe+rqROTYfVBDaIvyl1p2qz+qz3llwVnMCv5IvO
         1kqy+Cgx3m5eKBErC9PNt94GCKRe7jkYhzVzf1u1m1hD6OJNwFDUrUxlZ0uHRthBv6MF
         CQlrASP7lPcv3qQcgCdsobVxtZC7S330RvOO6sFKClow2HOvUVsOIQ6SP4Dc0HvyBy6Y
         WGnsVz12xe6hreOF5Lr4Z5oOdrerag70IaTFaHX8j55C8NpZsj8ubXS8Xbqpg2iAACs2
         BiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723698934; x=1724303734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlmMnfZnyk9sQ31EPnuWHDN6TPycLzZuMRASfe7DhFU=;
        b=eObl++m2ZmDL08TRHlEKzztpPWfkAZrxsLK0J56f9aDe/ELa3DeZHFLWEKwD8qkRqg
         dZTmoyWon0wNAmYWDFHth4n187BzpntS9kHI9dXTmrqpNPv3xoAJyPs65NI/TpZAEdCS
         aUgVasu4+Z4JoEEtT7mY7Pd2fmfMmkXlVHjApLz/KDXkqIIY6JKhP2xZinzxGa9+EccO
         4+uHtIU3Gzn8M4EQLuC4GUcORnm14+6Bu/a4Jfa07miLW7GXO3g8c9sWVb4IGWffTGlk
         Yt2nBbJz26CeDrb6gbF448N9jVctY2pIqaiZRr5qdInUN9brl+on8y6iyIJAZk66z5b/
         rAIA==
X-Forwarded-Encrypted: i=1; AJvYcCWD1GPKrq7ic190Slytt7FuzAvMow6RUFcWCOduZmceXb93Awmc29gBSIEnE53iNl1A7L0e2l2NGHTj1Q7DCWrD0uLcFUV2QVbmjIL4voS+ZFDyZOZ5fP6jQGb6JEWrJdtKI2p+uBg4M+RCbpo+5weZj5kaFl40xn/t53fyZuxwzRTCt87n3teJNDA=
X-Gm-Message-State: AOJu0Yz7CP10TZOqp8BnMdLS2SQG8uwVUlomTzAcw0T5tskvZlLRARbR
	Z9EGoWyUKNp0aLucRXlwzoKhf23iIp8pR347F8ZKxau2fWPupOJjvg1L3w==
X-Google-Smtp-Source: AGHT+IFDckC/7w4xnBRZxUCAEKN6Sz0PyXZEyt9EmhlTiXEASI3OMzRo88vx9HWFpiahjrZdSE3V5Q==
X-Received: by 2002:a05:6512:104e:b0:52c:8a6b:6071 with SMTP id 2adb3069b0e04-53308099ac6mr399847e87.30.1723698933071;
        Wed, 14 Aug 2024 22:15:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d4243d5sm84560e87.245.2024.08.14.22.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 22:15:32 -0700 (PDT)
Message-ID: <daca2d03-d52d-41a3-bf68-0f524aaa603c@gmail.com>
Date: Thu, 15 Aug 2024 08:15:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] regulator: bd718x7: Use scoped device node handling
 to simplify error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
 <20240814-cleanup-h-of-node-put-regulator-v1-1-87151088b883@linaro.org>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-1-87151088b883@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 18:04, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h and use scoped
> for_each_child_of_node_scoped() to reduce error handling and make the
> code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks Krzysztof! I've been a bit cautious to what comes to using the 
cleanup attribute. Well, I suppose it's a time for me to admit it 
simplifies things - even if it breaks the rules which were carved to a 
stone for a long time :) So ... Thanks!

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


