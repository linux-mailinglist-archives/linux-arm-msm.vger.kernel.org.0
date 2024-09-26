Return-Path: <linux-arm-msm+bounces-32626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E525987BD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 01:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8557B22743
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAFA1AD402;
	Thu, 26 Sep 2024 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JH06Lkvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34C15AAD6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727393504; cv=none; b=QvPcYXe42bkjojUORxRfSOuqobfqtu2YFvUMxGn9dTCjpWr/ByemdmtbXsidJhyyTmCrzPSSIffuAq1JzZJypNpC8/PHdfKVy97ZVyL09948ICbwcDsBNvqB2KFNG/TWSB5p2bXrgoZxVVEZ/XBZFAW54zrneOtlfBiqKyTF084=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727393504; c=relaxed/simple;
	bh=Bp8HPf7stQdrTDsUCg5klmtzyhttsI7grk8NeOenYZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMlbNeaeLh2FXq4qZ6cStN8gvYrnb8vE5h1i0hiEyf3CGLlurWMwhd/FhstM25s5jOG3+zRrQFzDBxZOVN/DjGViUvV1x6WAcNp61lGH0lefLLg7LUph1UO1HqCg6fkGBP+KFsgcozSwqHwiP3jcrhiX1tcc0GMCVTWqTHPIuBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JH06Lkvm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d60e23b33so205584066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727393501; x=1727998301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hP7/C2ERKTWKRLlTVueOIVkd3A9IVhWvPRqsiJv9ebQ=;
        b=JH06Lkvmr7dcbPy1VG08QIBISc+Sel9nI4Ji1eyR8OQDkFhuxTeBERHIVfh5JJo7yi
         IvPRlaOOmK+KwPWyUgyHx4bayRzl8fguneYI9rbvB0VWDc/2BnxbGmI7bqsb4UFBiqhf
         tEa0kj3SnlPd3hAgAeTwwfL3mbz2Fc84XReUrixfhJbERRM7M7HQPWUYQ5TswksvnPIV
         spVwgebAh9jvlSvrucOhgGFNua/QuqN00kkc9pFMLRSpAdVrS4I8NZRBeoLw1bs58H+e
         lnktICXl/ShUoy6LTrRelUwOjlrCcAgbJYpiSLafEIwDLzjVh5xhVdmo9kdcKxlOhNLz
         Wing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727393501; x=1727998301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hP7/C2ERKTWKRLlTVueOIVkd3A9IVhWvPRqsiJv9ebQ=;
        b=AcMY7p8L7BB38ItQBkWLx0ZASB9ZGtAWOhaUfc/zj1Sp6AWdppJ4t784mj7x1yXF6L
         +ok5oy0k4HmCcWDSS+yxrCWI77I95fCs6p838P4Ute2PnQZQJmJXelTHgO9rVIJQTgKu
         Gpujtu+7zksPfycBpr6wJWE2JRnFAYF1mucRl0i2BOwrebnxPY02soFP56AqIN+MhDEo
         e2rrxY0m8BS9NbGpnesOhjCIAwWSWHJNIfZFpe57ee22FpWaBSFFPIIFyh9/uri8Joen
         eNIyuzkh4SqG8cTqE1fGRJltwCJmrySWdMGRVr1ZgTR17f8Pz4o5M6OnzrdgXYxtrGE/
         n0fw==
X-Forwarded-Encrypted: i=1; AJvYcCWHI+mZYsw7U6MH9cfxC/e44KxIchThowUyC4NiiGeQ7UiTn4WtBJPUY4PpwurKNMtgExJP2mPhblWBrmKt@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHyB8cYMamBuSpESqbPf/OUc4gGddR1hYF+M5cboZQ/2mHuvd
	Ayn3LfxdPrTw6nMnpvcBtwqXBoVDgnp3V5ba3Ud4KsCHsjCl+8b4TqQ0O+oDd0A=
X-Google-Smtp-Source: AGHT+IE4AVD5jFUsWhQY+2HFi2yt7VOe7tQYNHSxknZoiuanOX2bzSzKA56+0M4bkU4Sm5lwRzL3zg==
X-Received: by 2002:a17:907:9305:b0:a86:8d9d:898a with SMTP id a640c23a62f3a-a93c4c282bbmr98056766b.58.1727393500403;
        Thu, 26 Sep 2024 16:31:40 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5ae5sm51114266b.63.2024.09.26.16.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 16:31:40 -0700 (PDT)
Message-ID: <76a6b4d1-5376-44be-87de-011154d67771@linaro.org>
Date: Fri, 27 Sep 2024 00:31:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: qcom: camss: manage supply regulators as
 CSIPHY resources
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2024 22:19, Vladimir Zapolskiy wrote:
> The change is based on a recent discussion of a changeset, which adds
> CAMSS support of Qualcomm SM8550 platform:
> 
>    https://lore.kernel.org/all/6d78c1de-00bf-4aea-b0c6-a147faa40a8f@linaro.org/
> 
> Regulators shall be managed as CSIPHY resources, while apparently CSID
> subdevices can be run with external regulators kept disabled.
> 
> Performed regression testing on RB5 successfully, however it might be
> important to state that on RB5 board L5A and L9A supplies are always on.
> 
> Vladimir Zapolskiy (2):
>    media: qcom: camss: add management of supply regulators to CSIPHY
>    media: qcom: camss: move sm8250 regulators from CSID to CSIPHY subdevice
> 
>   .../media/platform/qcom/camss/camss-csiphy.c  | 35 ++++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
>   drivers/media/platform/qcom/camss/camss.c     | 20 +++++------
>   3 files changed, 46 insertions(+), 11 deletions(-)
> 

This looks pretty good to me. I'll give it a test tomorrow and let you 
know how it goes.

---
bod

