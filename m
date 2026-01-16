Return-Path: <linux-arm-msm+bounces-89315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0894D2CC89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2D1330206A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2602634EF03;
	Fri, 16 Jan 2026 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rzV7ZLoL";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="p3WzcOjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA834EEE1;
	Fri, 16 Jan 2026 06:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768546468; cv=none; b=C3U4sM3oZGmg6Dx/AjPduO7We0T7tXGtFRChWUgm4+9qLL7iVv9fN+Wmhmv8wz4wn0nV58D4WdLP+q0NiYYdFeKsgJDG9FclAWHV6QCQkZQVri2OjaRUBcFz5m55KnQgQlNy3WmixIT7SXHMH9a0iEm4LfDUPdyINoupTScAl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768546468; c=relaxed/simple;
	bh=w5JngHceOOcSW/+RZ3zyvzQHqORDZxt7MZGUX2p4Mfw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=IpDyzu5SpJb+/yzEFd0mhdU5WI1NV2hbqBs2CBl+wfbsvQFWr1Am1kF8OJmSSeXbNNAKAWTq8bfhAOf8kPD3VbsbNURBOx0Ne8ruZ07BZ4511+VO237bz55GW2CG0khPd//tZ2seVxLzxvAz4WKm32OWGWNjeqe1hXY4w+kiL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rzV7ZLoL; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=p3WzcOjR; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768546425; bh=poSUto4ivxkV4hnP4TvlfPA
	+aNmV/yklwHDXnK0uwaI=; b=rzV7ZLoL+61BFyqW3zR2P85PQP40tnNjk5kOJHlvXBWmIOU7yG
	L/QTKPOl5PZ/bP/G0x2kHnUYzLZ5zpOFFJ5V7KKrAo/y4kH1p2y1OQzLMz+yl5hpUC7AkN18M4b
	VSeupnJ5OYVAvZhP6fJwQIgN7mf9o1wPTpJN0Yg6Qq5+ZXFMlfUl4UhrW11Tk8QEf/7Lr78k3rs
	X0xaw8CDlDd2/fQ9xUeWrmmXHyiNPxQFeSSmurbUpzDci8X8q0gsGgnzP8wisBSY9yJJfBokAfn
	KElpYuMGuqRF2RQAY+PQN7DFBc64aJRzG//r/kp6+YAws3YOAVDQYRtfYFB7VWM/HYg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768546425; bh=poSUto4ivxkV4hnP4TvlfPA
	+aNmV/yklwHDXnK0uwaI=; b=p3WzcOjR6iHjkxEcM9XdK6BfhcclB8BSKNeOfZhpB3Z7n9Fq5z
	eIPMpmj+ezFokigSzUrPmv7ByRxVrZ11BgBA==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 16 Jan 2026 07:53:45 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales
 <semfault@disroot.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
In-Reply-To: <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
Message-ID: <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 10:04, Konrad Dybcio wrote:
> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>> the only difference is willow have NFC.
>> Make a common base from ginkgo devicetree for both device.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts 
>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> index 163ecdc7fd6c..70be19357d11 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> @@ -1,304 +1,12 @@
>>  // SPDX-License-Identifier: BSD-3-Clause
>>  /*
>> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>> + * Copyright (c) 2026, Barnabas Czeman
> 
> Is there a reason for you to remove Gabriel's copyright from the 5 LoC
> that remain in this file?
The original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi.
I have not removed it, it is a new file with the old file name but
i can add Gabriel's copyright here also, would that be fine?

> 
> Adding your own to an existing file in a commit that mostly moves code
> around is also odd. It would look considerably better if you did so in
> one of the previous commits that fixed things, as those contributions
> are easier to perceive as non-trivial.
> 
> Konrad

