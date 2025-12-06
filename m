Return-Path: <linux-arm-msm+bounces-84589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE1CAAB08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 18:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7123530836FB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 17:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D2118A93F;
	Sat,  6 Dec 2025 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="icEUVdY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58728695;
	Sat,  6 Dec 2025 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765041647; cv=none; b=I7W3bcOia7jo7KuUTkW5KIxvEPeOHMOOsCfCkbJ4j//eaY2HdXjMcn1gDH8rXVoPJOsPgdBQbLByaEAEV9cC/tOQkV65Gn+n98D0pTT7xEyVtHulSR3DYPG22Oik/jtNyOUplphKRqfwm89XAYb0HU/3+8kQnB76cXrakwJPyJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765041647; c=relaxed/simple;
	bh=EGo/v7W382KfVSCLHzD1MM7hxHiuR4Bevqu59jNGYwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVxvYXnjBZoyNwtqTYFNBS5WYZCr19QtLkAQODeyTFw5+HHNdXpNlJVuOjARY2Ybd2MbgXzG5zU6N+qG2SjpvcikBl7LcUSyurOLE2tftalIELlwv7ccJuJGxYNGsiKOIR2Pln7P/EqkxlnelMuba2GjfSy7CjoU80cT3apqStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=icEUVdY+; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 373FE5340EBE;
	Sat, 06 Dec 2025 18:20:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1765041635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WxSGLhUTyzYWcZS5r6yaEVq8VXG1wutgwgZvpnbYHHs=;
	b=icEUVdY+2TERURlOOdeG7+5X8aPc2w56N9X9ITTsmpLx+HZEFTicnGO3Frb6xih2dPPm0Y
	UyVs1vIQQxgnIkZxiITr4w0r0Xzft0qAyZPPBmgLLHk3/wMgFz8JAKqdXzVQiqnRfIfEWT
	/CCW426ecWfhnoQh5JJeSP19nqPVrZg=
Message-ID: <e0be618c-4224-45a4-9cd5-00001510fdec@ixit.cz>
Date: Sat, 6 Dec 2025 18:20:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-8-3b706f8dcc96@ixit.cz>
 <shhew6wy236saj52trqb2367tq7kgk3jks3cjcaqrvpgiysud4@wweya32qwtbb>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <shhew6wy236saj52trqb2367tq7kgk3jks3cjcaqrvpgiysud4@wweya32qwtbb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2025 17:56, Bjorn Andersson wrote:
> On Tue, Nov 25, 2025 at 09:29:43PM +0100, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> This adds initial device tree support for the following phones:
>>
>>   - Google Pixel 3 (blueline)
>>   - Google Pixel 3 XL (crosshatch)
>>
>> Both phone boards use the same identifiers and differ only slightly
>> in their connected peripherals.
>>
>> Supported functionality includes:
>>   - Debug UART
>>   - UFS
>>   - USB-C (peripheral mode)
>>   - Display (Pixel 3 only, and the driver needs improvements)
>>   - GPU
>>   - Bluetooth
>>   - Wi-Fi
>>
>> The rmtfs region is allocated using UIO, making it technically "dynamic."
>>
>> Its address and size can be read from sysfs:
>>
>> $ cat /sys/class/uio/uio0/name
>> /sys/class/uio/uio0/maps/map0/addr
>> 0x00000000f2701000
>>
>> $ cat /sys/class/uio/uio0/maps/map0/size
>> 0x0000000000200000
>>
>> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
>> side of the rmtfs region to work around an XPU bug that would otherwise
>> cause erroneous violations when accessing the rmtfs_mem region.
>>
>> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Did I really co-author this patch? Perhaps I contributed parts to it?
> Perhaps I've just forgotten?

The patch and it's parts I used contained your S-off-by, so I added 
Co-developed-by as I assumed parts of it was written by you.

That's hard about seeing patches downstream, as the history is not so clear.

> 
> Either way, I don't think I can say that I certify origin of the whole
> patch.

Should I drop your the Signed-off-by then (and eventually all people who 
didn't worked on the series I sent to upstream)?
> 
> 
> Any parts that I did contribute, would have met the criteria, so you're
> free to use those.

Thanks!

David

> 
> Regards,
> Bjorn
> 
>> Co-developed-by: Casey Connolly <casey@connolly.tech>
>> Signed-off-by: Casey Connolly <casey@connolly.tech>
>> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
>> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
>> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
>> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>> Co-developed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>>   .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  77 +++
>>   arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 528 +++++++++++++++++++++
>>   .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  28 ++
>>   4 files changed, 635 insertions(+)
>>

