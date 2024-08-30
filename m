Return-Path: <linux-arm-msm+bounces-30188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE1965A87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08319B20B0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E05F165EED;
	Fri, 30 Aug 2024 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="vJLcx0aX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637014BF90
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007066; cv=none; b=SqNagggJtO37bIoxwrspSKRSKuWPCIHBNl6hpBE5y0A8skO3/HPeIpPcRGjqh6bywhIJ+Q2j3683Z3Tj9kvzrWwRf5OfXrlc/YeT+76LMXyMXr6t8YtU0X53qa+S0No1Uz9pkBoms6HCOGuzniMwoGM0Pi+T3dUpSyQ9GKEnDpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007066; c=relaxed/simple;
	bh=ghVIUx9TaJyMm4SETqSo3lqEOUOm5837gqrdXGcmX9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEEPxt78NTSqkkhRsXEmzKHdMpdBexa3XbOpNk6T/8XmD6ixmtx1o3mRN3g7OAzqF3pGglXHh2264D9fWVIshLf6i6jtOJfokk2Z22bUmjVTXAjTL5fWyHWEgrHhRgp9LjXSZnl3ZwaKpGAPJ/5GYM5jUR3LZef2WL96ZhrDd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=vJLcx0aX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bede548f7cso1671888a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1725007062; x=1725611862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz5xgDVzbjElSEwTue+4JQ6a6tFd6FbY1QoSeaQ1ceo=;
        b=vJLcx0aX1ng52gTR8fxVouBeYaI7CRVJ+/pM53CpY/zwa68XMNfj5y8042L1mdruyw
         9r3zhrGeUqm8oYxln9dDEtZfUNlBlMcjLyF8fBCLuoloct6Zxow6HdMl3PQh4hOv3R0P
         CfvJfCWkLzFOiwNMay04j9z+9Pr6LUjlpX/nzJ9cH7tBxOnuMXwFEGVvmMpEyf3euHaL
         CSS2rd3MAcWvqdQAdDYU+yfEm0xnxo3Mghnd/Wooywt3jvB0g+11s5mPTNXchm8AXZ+J
         lZ4mqSQWGK6L4bFazyzwycvJMJz1T1WHhcYKgDvd8OPAm5Xz1O6dqYJ7yBah3xLmS1pb
         zjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007062; x=1725611862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz5xgDVzbjElSEwTue+4JQ6a6tFd6FbY1QoSeaQ1ceo=;
        b=UbVi0BGy8Yd4+oX1rDurfwcQ70+3XSkTzZzwit3Bu2VOqsUWftjsA2VHvOg6KOoU7V
         czKrw+MRe8A3KUbEjM9SUqu5I33zFp/rkpiucMriRxuGHdxzI/VubBdWFsOZ0pJs6tHy
         4F5Hkt0chOSFf5DZYJ7SxB4B3NONrP5DWg2+5bu6KL/8I1iTERtNWupPl6VC77hNwss9
         36Vc9rt7Q2EhQgw7ox84QbLqRPbW48BfO4ue5XH2JOYWr8aBCKHsHJFNleNMGA8MAR8D
         F0TR54T3pALki4ezMvVMy0tRTlbbcgvJVX42LTncWZNdaXgpflxwtkh42d1viAjXSDyd
         U3sA==
X-Forwarded-Encrypted: i=1; AJvYcCVKR6P3XcmrSotsoK6LztpJ1f1zdXQvm4aXp2HtJGgdIocXeS6J61vFjuHRGqVX9FH36DF6dl/w6OGB7K5W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkq5QEWEdSVpEh4MeCNNw7iSb4VQUoRu4Z7NOrE1HEbha6ZUaX
	bcgDfu9yka1xqzhu04JdbjbbDrX3VaHHUJNQz7eaBE9Dg2iYKM5gBJoDJVkU3FA=
X-Google-Smtp-Source: AGHT+IHoWfq/90PKtaBCC6Uhi6DqQ09Ism7NBj8fzh8R+arnT/DKgjvjTl/SHIkJT75B9ohmJj4xBw==
X-Received: by 2002:a05:6402:3493:b0:5c2:2b1f:f757 with SMTP id 4fb4d7f45d1cf-5c22b1ff81dmr2599958a12.17.1725007061676;
        Fri, 30 Aug 2024 01:37:41 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7bf90sm1674423a12.43.2024.08.30.01.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:37:40 -0700 (PDT)
Message-ID: <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>
Date: Fri, 30 Aug 2024 09:37:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 dmitry.baryshkov@linaro.org
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/2024 10:12, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Seems to be fixing the reset I've been seeing on rb5

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


