Return-Path: <linux-arm-msm+bounces-87200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84110CEE3F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48DDB30006C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282592D8795;
	Fri,  2 Jan 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="WExSHlO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09222848A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351716; cv=none; b=RgX+XGdophI44SGBOezoB73K7VV336bOia6KpAPn6l3fU6m47CnQa14t1Iul9h0AVYOScjp7JQl5MLmJt4sMCGa5Q8WFuwd8OlM9Xm0juHRteFaKHegisGHEp54BSh4LxROVYIQQwZYx/wyva7J9cLfQqL7zgLWlLvHuvAt8blE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351716; c=relaxed/simple;
	bh=9UDeYok/BJSXrNjF4lcUGB7JPmuZT9lTApjjMDY4D4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EL8xYlUjOA93wZueSbDDL3s1jj6YU589zz8oRUaDia9V3QVZm3sBx2opP/MTLuUTyLlQm2vcAHBHbnRvuBVCOsBUP4xgyvI0SSxfuZmnGyTtT7i3GfFuYwDdQmZtFp6tGw5W++/WCgJXvnO2lY2hJ2ErMZHzEf3pD/e2pZmff5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=WExSHlO7; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <f86a904e-110e-448f-96e0-22bc6b3e4b38@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1767351711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkWUTbMUXcsUBKxk7Q4uqatV2kc7EcEmJyk1cMSmT/Q=;
	b=WExSHlO7kdABt7zUP3Srbg695zH20nbErw9NrbIjEFtCUPdwie5Rx78z0+BO4FbwRsPtZY
	ca4W3mJbYSzwFuyri6zyTGrVZgU2P9lplWhasWLPN6d2X8U7zS29ieb5iGWBfL/PnDznty
	7qASZoJb8owhojx3yLkpcf3mDgZOUQ8Ak8zzyYdVFrAhSrST7QTUBvsWAJ9twMfBMLrxP5
	6XpxWgDdM+ZsUPKjbKM4y3uI0f31NhXqSZvX+ltHn6u40XChWbqJW5ir2Ijl0ThHYulDu1
	3TOvOtDnoFmr/nYoWHsXmBrZH40rSrExID/BknxWAD3LEeBZpUkI6ujjA8vvLw==
Date: Fri, 2 Jan 2026 08:01:44 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
To: Bryan O'Donoghue <bod@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
 <DjKkpb96k7gGFmmmqsmLvO6sKcd02WwZq67n9hY4c75sajI_hENGebzfUBW3Xs3WGJ_oXdeYkNcV-T7UkXO6Xw==@protonmail.internalid>
 <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
 <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 1/2/26 7:44 AM, Bryan O'Donoghue wrote:
> On 02/01/2026 10:43, Val Packett wrote:
>>
>> On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
>>> Hi all,
>>>
>>> This patch series adds initial support for the AV1 stateful decoder
>>> codecs in iris decoder. Also it adds support for AV1 stateful decoder
>>> in V4l2. The objective of this work is to extend the Iris decoder's
>>> capabilities to handle AV1 format codec streams, including necessary
>>> format handling and buffer management.
>>
>> This is awesome, thanks!
>>
>> I've tested it with rpi-ffmpeg as well, and it works great (only
>> required one interesting logic change..
>> https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/
>>
>>> unsupported content with bitdepth 10 (66 tests)
>>> Iris decoder supports only 8bit NV12
>>
>> Any chance we could get 10-bit support soon as well?
>>
>> 10-bit is massively popular with AV1, especially with home encodes (see
>> e.g. https://wiki.x266.mov/docs/encoders/SVT-AV1#encoder-optimization
>> and the ab-av1 tool's defaults)
>>
>>
>> Thanks,
>> ~val
>>
>
> Can you give a Tested-by so ? 


Sure, if that's helpful..

Tested-by: Val Packett <val@packett.cool>

for the series


