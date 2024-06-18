Return-Path: <linux-arm-msm+bounces-22991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E168290CA02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B96E1B2A9A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9941553AB;
	Tue, 18 Jun 2024 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+Bh1b9h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5B13B7A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705977; cv=none; b=Kat87EuzW7XrNCkbAOWWDlwfvnbKCNKBkaDBtc9ysq8DXlXD+9NTTZwBHIBD8K/JKCCVJEojVmry+X2uyPlpE8xuBdW0f9ZnpVKgWU2DT1iP3LRy1HoFM7/h/fDnutTZn4rxJ2m6WFJqLWQdjSAcVzxrI/qCb4pwjGNZb86IPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705977; c=relaxed/simple;
	bh=FL2m4h63/JYdTiaKJrp9jJf3fm87LLFXYnkOZJlTIJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6eY8HeiCI7kUM773QNZntA0N/5S6Oh1Obg2frRrMVsVBzthfqRMbjd4UWlTiQUOELOn4sapaB6OS62MwahvkuX9B9Omz6BeUdaHJ7DeK1CV3c+oAmpw60iYYZIJA51RLE0EXcoy6KOCDxorEVdJ+GUW3oYc7ATlJ64Xe5z92SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+Bh1b9h; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so40156951fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 03:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718705973; x=1719310773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIyeFs4XULhFDZJgfL03OcH28UMXmwHIpiQH/OD/zBg=;
        b=a+Bh1b9hpy5b1kmyC+FI+MyXek99RWTV4cWqOJvzsLBKalCAmVnFLLAUiVQD2549tU
         3mEcUDsPfLZoUgzONuQ9t5uH06nWy04FIHp+YUKZtV8ds+SUHcXAK2TrFye8QIfxUYfX
         NTxr3jE+Nn/07LzDVMbEknkauJJk9Pd5sBAZag6BtrWXWkLBITOfFuGtWSNJAnWSDDLA
         w01WyZ40FGQoHk0IL0bdxjyRuO8dRukNnT4Q5TtkyU5f5TNm0eoovqXh+Oms1MDFgAQa
         JZTtfr1/82F147ErRcGZ+Xhn3ovmC2h7/3aySz1224G5ueDyMa0p56+17WJHKP4gwPla
         BJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705973; x=1719310773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIyeFs4XULhFDZJgfL03OcH28UMXmwHIpiQH/OD/zBg=;
        b=hdwBE5tlM2zHgLIhyIvk6YZb+Cf8gk/mSKStpARlcHyR5u+sTuEb23C5rQrVxpDevL
         aUKOaIpQowD6IC9JhulKFchjCP3Gn9+7H3wgIvq1Qt+4TrJQHSJjLVJQExU4DVABkl5j
         paWr+n8ufPuLxV9aHxGi2vVcfYWjQ7LwQj78LxgzJpR8i+rkEw+Gr3Xi2Wxn8Eo8oUfq
         aG8gppRcZ/NQxy8qHj86JukKSK8+MPiHw+dRXMZ4qHRzlCiyAGaXXLKUqgVYRiE7NDG6
         lfMAv2HYqqf4VZNIihKyEDBULGTcx8gHQj1Xpdu45OdPSjDdWn1nw1A5rJ5t4IysyWSe
         MoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgWes9ngsALGQiAcuDtfPiELPT7VZtf7hLg3sFy9k+f/1zMuseMicHbC9g81LuHrhHcaF9fLUDgA0fbdq8ajY9V/ZkbyU6UxFJo0hymg==
X-Gm-Message-State: AOJu0YwlVQ98NqK37maUn7DT06kP3FsTQ1U/qOnr29X+JFlJmthURARA
	Gh5GcvBBK/ZGHy2hbA2qZgLDG8DS+asG/nxMkxfAETLlDW3+lyA2dEhDIxXf7y4=
X-Google-Smtp-Source: AGHT+IEiSEe2+WeGXoJd3Xd2iIJeTICulV8Itc/CtPMx/C82PUg6rNZxzqUkmlCMCr0waHh4qMZ6Gg==
X-Received: by 2002:a05:651c:1057:b0:2eb:de2b:940 with SMTP id 38308e7fff4ca-2ec0e6002d6mr73923941fa.41.1718705972634;
        Tue, 18 Jun 2024 03:19:32 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec07d17709sm16507351fa.123.2024.06.18.03.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 03:19:32 -0700 (PDT)
Message-ID: <b384e6d1-0cd5-45ca-b488-1ae2743c10cc@linaro.org>
Date: Tue, 18 Jun 2024 12:19:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] serial: qcom-geni: Overhaul TX handling to fix
 crashes/hangs
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 00:24, Douglas Anderson wrote:
> 
> While trying to reproduce -EBUSY errors that our lab was getting in
> suspend/resume testing, I ended up finding a whole pile of problems
> with the Qualcomm GENI serial driver. I've posted a fix for the -EBUSY
> issue separately [1]. This series is fixing all of the Qualcomm GENI
> problems that I found.
> 
> As far as I can tell most of the problems have been in the Qualcomm
> GENI serial driver since inception, but it can be noted that the
> behavior got worse with the new kfifo changes. Previously when the OS
> took data out of the circular queue we'd just spit stale data onto the
> serial port. Now we'll hard lockup. :-P
> 
> I've tried to break this series up as much as possible to make it
> easier to understand but the final patch is still a lot of change at
> once. Hopefully it's OK.

Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

