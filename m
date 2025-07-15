Return-Path: <linux-arm-msm+bounces-65018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03EB057C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB8ED1C20081
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8522D7806;
	Tue, 15 Jul 2025 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SilQHJBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332652E370F
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575272; cv=none; b=JvVZu9Gfr2bnyx8SMrUtO2MYu+oMhGkScSVUmOnd4j2pVClWygZxqK2ai5Ma0KFRDEVgWKTkg5uvm03gWyy0bUyCCbBJXqnxKxXjEIFLDCbzh5zS1bBTLnRH6Ph6qvCmeybn8G/sH9DBslNa3Kz3kToT0EHehVcj5mJO2m0kj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575272; c=relaxed/simple;
	bh=9GliLAWN9yboDvyuwIIOcsrA/WXw2EdBByjduEbn3pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W889nPeWG34RZcgV7jUGR51YiHfgceLaBGtTS05fDlACD3tmXo5jI1CSbvArE0dGqezSZwX+/KmCw7TumBjH/MtgynkTaHMTz/bVVVSFyLIo0J9qoFBMv6712rTn54Bba5IqdO8Q9RdouH4ZHKhtg/es53TRf5OlMnSfLpYP8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SilQHJBj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553affea534so727268e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752575269; x=1753180069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/2pXjO/4cLFhq1C0pbXxCDCYXatFBoRRv1ycMlT/jo=;
        b=SilQHJBj/vOqL2aZ1mynhuBa3YlbWYnp2VWNJYIrwqNE/FiZt8SD2CcZIOup7J7CKP
         cTWeZ8gySjx+ZEZUyrT2d9BaM7Dfq/Zayj8ZB6rlvffMuPzE9p8LTRiaoBseKw2QXuoq
         9ytrGvYbCt+pDQUPfjFfBVWp51uSvffrYeAp76EHe0Wu6IaA0fXhRWWcTvgoEU6aNAIR
         7WQ0XvPJwkoHHHItSF3Euzb7DXAfVh7Xq8yS8FOkcKBlciBoW6Ek3cFPHYMoSCs2zFSP
         2rvnH0eqFUtEvRWTlPBaimsXBLWSd9XJsIK0mTOhi8FUK1A3o6dm5A6gHbOJulrhG7dE
         t4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575269; x=1753180069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/2pXjO/4cLFhq1C0pbXxCDCYXatFBoRRv1ycMlT/jo=;
        b=QF2w5fmG2k88s4BESvLkxfMMC7Hoc+e+truVEfsX9IF7qs1btCKVjXxw/3s1+JrUrH
         KS6ecfBngRbgNmx++7wVEeTJgyppRqMKL1lkaMpdOH61outPBeBi1WB2yabEsNdbWZ2+
         vu/YtIePyzjeOnNjZXYZRnXaTAx0fZoWl/kiFe93Jr8yLNqIG7NUJvCI3jWoCvLzGsUN
         0XUsqfpRVHW5iW97ldY/NCK+eRBodcMy5fwbACjfOH9zGb7/YGFToZrAdk+qqCfwhkVo
         6YLUwnR1hK2lp3tGYGNmRCinHa59+Z9B5bicmUKTA6eN1sn3crNW1Q1ftEIqphZET+5t
         pt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ro8VudiVr7XYAjfnGABmMGJklOnBx2Vyj6tT3BJyluBIr3BftSxbH52jYRYO8JPMQMN8d/E4go+G9Paw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1jIYe87t639Vqt+yTXp9oRI96MA/5p0ueEgPtKdCL2rLyBnk
	9J4HtVta9CKk/ESRJYFapXlZb7UIAugNu6wo1452/LsaoCAN+ax2iJgiZI+GV9CbnE0=
X-Gm-Gg: ASbGnct8mMEQkoE24lEL0sVmfX/PA+pDraGHpmA3koR3mzDnuONifPlqNlqa1mAPGxf
	jNKnLVglHkGid382qI/29jGJeuAD8z/jvEXwIvCHT0uuxRZxTENoI4MTN3ObK4ofphrS5Jn3Yvk
	1TzX8XQur1qCjo++En/lFLSwC7NAIPQmItYoWl+UHnw7AlYjRpzWeDrncOl6UcA9F87tt6TSoIy
	ZdWtzERHLrnHKQKcLRcsxSIHUjghDIRDMBfUJuIQjrI1TIxFY+v2kRKF4ZvBk2zezcgZ6xBGz18
	0V3DM6LKs8T3nNqRsV2lab9qzrlOzwwe0GXZpE//nVCEGTfIP/u0S+/NiwOZMMjK0BCBLQCRtzt
	es8MmHZCpU5PhWSlnkZg/MwacXOnYTZ+/1lRyfuFKgQyA1JeXUAxmqkhUL/n3FThOq09PN054DY
	/A/fyuTU00j7M=
X-Google-Smtp-Source: AGHT+IGB+l68nNmN+r0g2875eUAVEOWrNNxT+B1p1QscYHqf8lqIHRGyo9DMLsNHAwQ5NssRAlfp8Q==
X-Received: by 2002:a05:6512:e88:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-55a1fd90378mr115569e87.7.1752575269207;
        Tue, 15 Jul 2025 03:27:49 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bd725sm2259718e87.14.2025.07.15.03.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:27:48 -0700 (PDT)
Message-ID: <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org>
Date: Tue, 15 Jul 2025 13:27:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/25 11:48, Bryan O'Donoghue wrote:
> On 15/07/2025 07:53, Vladimir Zapolskiy wrote:
>>>     Finally I believe we should contine to have endpoints go from the
>>> sensor
>>>     to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
>>>     not the PHY.
>>>
>>
>> 1. This is an incorrect assumption, unfortunately it was not discussed
>> previously for whatever reason, good news now it gets a discussion under
>> drivers/phy changeset.
> 
> Perhaps you can explain why ?

It's quite easy, sensors are not connected to CSIDs. Moreover data flows
from any sensor can be processed on any CSID, there is no static hardware
links, which are attempted to be introduced.

This is a similar review:

https://lore.kernel.org/all/427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com/

> Taking the example of other setups similar to CAMSS I believe as laid
> out above we should have
> 
> - Dedicated CSIPHY nodes

I see no problem here.

> - Use the upstream PHY API

I see no problem here as well.

> I believe individual CSIPHY nodes and endpoints from sensor to CSID are
> more consistent with established upstream schema.
> 
>> 2. The whole new changes for legacy/new CSIPHY support is not present
>> in v1-v6 of this changeset, it just appears out of nowhere in the v7,
>> and since it is broken it should be removed from v8 expectedly.
> Broken how though ?
> 
>> It's a pity to realize that instead of providing any review comments
>> for the CSIPHY support series sent to you one month ago a lot of time
>> is wastefully burnt on a broken by design change development.
> 
> I've been working on this on-and-off since the end of April:
> Link:
> https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org
> 
> The length of time isn't a good argument to apply a patch but, of course
> its annoying.

My experienced frustration is that I didn't get a maintainer's response
for more than one month:

https://lore.kernel.org/all/20250612011531.2923701-1-vladimir.zapolskiy@linaro.org/

> The rationale here is:
> 

A stitch in time saves nine.

You may start now a technical discussion right on the series above, then
I will make my best to fix any issues and send v2 following the regular
development process.

-- 
Best wishes,
Vladimir

