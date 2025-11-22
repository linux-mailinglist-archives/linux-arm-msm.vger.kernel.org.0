Return-Path: <linux-arm-msm+bounces-82985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA372C7D86A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 23:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FBE3AAA3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 22:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC0122A4CC;
	Sat, 22 Nov 2025 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="IKZKTIF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD121E1A05
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763849918; cv=none; b=s2y8ALghkb9P8HHDkEBg9tmdlea0nxBaivxkvhMRK45/rOZsZMB8kLUjZ9MSnP/One7q459S0LvUVcgRtF1bR/DL5J8MqzIJbsL6OHSItU0Z5V2gO9V3pVZ/wOouXRrHxL88NniFJ74Nc0XRjQgI32zboKyIxwYO2d0V9YNmPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763849918; c=relaxed/simple;
	bh=MQVrtt9HuNSbiIesc2oaZsDk+/naS53blUl3ztEh/4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugL1xNWTOQv0YfgKQbLY44/IOROGUD8PSn6YFcU5jZTOOhokxi8xXgSnxA4GEEXy6RNTXuR+jBbkBR5cr9KlK4Uiugbe35o3ii51UwWVadO2FoSba6jgf63X7aMkv74x3+6mXVFXtwQ3LfxDxPXQduAOpHHbv56RM+NkMrzNQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=IKZKTIF5; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <71c15a78-7a50-4913-b677-e5308fcabfad@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1763849902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoMM6Bolfb03l2sUyPTtJho2CMd/eIMtoFQwa8m96vE=;
	b=IKZKTIF5RO4c094AbTdzudHNXyCIA3kxZoiw2wEiuDicGsHvp/q53rS02WIqe4EZddGa9a
	JDM60FD63tn3JzFBAxaGOoPfW3J5HVJCqYmTiUkMZVgb4t2pZjUoxpDllf0rJA4L/Cm59M
	SmJr+DTv3NtCK6uKxp0xx2agBFmcp9In0uqSE/v2BEnAVjE6ZS0iFgLr79mJuNxwUTOqYR
	QnCNPgDQwA7v5X+BLTySHtHRU+Va62iBnOyMVoXT4lVAhCovOeN8Vd4dHNapaFFLp8fAOp
	VJbPOd7yn7lgGNtB3HSbAT74xCUeQL2p7egBc3eRybmNwxOhufN23LyYKaM4rw==
Date: Sat, 22 Nov 2025 19:18:12 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Modify USB controller nodes for USB on X1E80100
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
 <d0c18094-7234-450d-bd9c-e9f545de31e2@packett.cool>
 <81367b57-f60c-48a6-8a59-7e160c312686@oss.qualcomm.com>
 <22ad48ac-e054-4f2f-a5a5-8047266ff4cc@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <22ad48ac-e054-4f2f-a5a5-8047266ff4cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 10/27/25 8:46 AM, Konrad Dybcio wrote:
> On 10/19/25 1:35 PM, Krishna Kurapati PSSNV wrote:
>>
>> On 10/14/2025 2:30 PM, Val Packett wrote:
>>> Hi,
>>>
>>> On 10/13/25 11:21 PM, Krishna Kurapati wrote:
>>>> This series aims to flatten usb dt nodes and use latest bindings.
>>>> While at it, fix a compile time warning on the HS only controller node.
>>>>
>>>> Tests done:
>>>> 1. On CRD, verified host mode operation of the 3 exposed Type-C ports
>>>> and enumeration of the Goodix fingerprint sensor on the multiport
>>>> usb controller.
>>>>
>>>> 2. Modified the dr_mode to otg for the first 3 controllers and
>>>> verified role switching and device mode operation on the 3 exposed
>>>> Type-C ports.
>>>>
>>>> HS only controller was not tested on any platform.
>>> have you tested suspend-resume?
>>>
>>> The flattened dwc driver seems to break it for me on Latitude 7455, upon trying to resume the screen never comes back up and the system just reboots from zero in a couple seconds instead.
>>>
>>> I've looked at the code and I couldn't find the cause so far, but it is fine with the legacy driver and not fine with this one :(
>>>
>> Hi Val,
>>
>>   Thanks for reporting this. I did test runtime suspend resume on all 3 typec ports as mentioned. But I didn't check system suspend case.
>>
>>   I will try to reproduce the issue, fix it and then resend the patches.
> I can repro on the CRD..
>
> It's the USB3_0 host that causes the issue
>
> Removing the clk_bulk_disable_unprepare() call in dwc3_qcom_suspend()
> helps..
>
> Konrad

friendly ping.. has there been any progress on solving this properly and 
switching to the flattened nodes?

~val


