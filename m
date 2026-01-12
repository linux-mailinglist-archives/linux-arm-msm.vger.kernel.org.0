Return-Path: <linux-arm-msm+bounces-88636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F5D15D77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 00:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A0BA301399D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 23:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B8529E11A;
	Mon, 12 Jan 2026 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fdI2I9tI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I+Y4m0iF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D6281370;
	Mon, 12 Jan 2026 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261311; cv=none; b=lqORj9WQakY9w/FlmjwY4dR92w8lsLbPzdHKefUWBJmn1VZSJSCNbDJAe+T5m3qf9LJ6k2OA3c6F2R0Qn4uWsKGpW1RatvLwuI4oeJd2F4K7KGEqWP6zjBhCziPb1LXg1DlW4+ZYhnYkScOaxqb9YfA9m5QwJYSmOG7eR7PHHLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261311; c=relaxed/simple;
	bh=C7V36cbdJb6YyuUIQW0plhOS7G7q1PT3/t9UweoHhB4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cifCjGhKyax3tS8iK2w3Hzva7T1DYb+cBKO6gByIW4ZLG2l6Z/biT8k37UG2Ri6fg/vy0Zqig99vQFpo6bpCyqqtnwq1GUigdRLTTyZHmXEap9Lc/DXsd5zSYOBTd7PTsAbZos0SfYo4Mu7eIkIaJdrUWPgNnr7lm05Bzxz1eg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fdI2I9tI; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I+Y4m0iF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768261303; bh=0qFiEwVtepNFetO+E3vs4kB
	U5wg/CWl5/+fGowIxbNA=; b=fdI2I9tIHQeO4DkdHxT4b7+6fMyK94LyJCric2MAYA6bZ5dFnU
	H4mUhMQ/Ir53FaBuCXpTZYfKUJ/rom4W/4vIuG+xAptE66ag/gjgoErzdhTyulj7VQoBiceWdmH
	ZYasperKPzw71FyQbG911Z9uLsnTLL+51gTni1tNBkSI7YDzaDt+AheOIgflQNQJoJUJ73nQd5d
	4ybm1H5KuVUW8BK1bis+i2L9n72DTwVbx5rKXVp4dNNUaaTDrkURLvV/0pK3B+IyyQDO0rbPb71
	sjTZrQtY+S1bB1UwSyfUa0zWoVFjsRzMVV2Bk2poJiV0hYDfJga75qsCdaWZE522lhQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768261303; bh=0qFiEwVtepNFetO+E3vs4kB
	U5wg/CWl5/+fGowIxbNA=; b=I+Y4m0iFpti7NDz3nhEMHCkHnbmNUJWJI0DDTtAW7nIEA4AAu/
	uCwF+YI7tb9AX2T79nswQmGuS4yRmGuGcPBg==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 00:41:43 +0100
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
In-Reply-To: <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
Message-ID: <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-12 23:15, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
>> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>> the only difference is willow have NFC.
>> Make a common base from ginkgo devicetree for both device.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302 
>> +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296 
>> +-------------------
>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
>>  4 files changed, 318 insertions(+), 294 deletions(-)
>> 
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
> Hmm?
Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this is a 
new file just the file name is same.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts 
>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
>> new file mode 100644
>> index 000000000000..9e3aeb5a9e74
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2026, Barnabas Czeman
>> + */
>> +/dts-v1/;
>> +
>> +#include "sm6125-xiaomi-ginkgo-common.dtsi"
>> +
>> +/ {
>> +	model = "Xiaomi Redmi Note 8T";
>> +	compatible = "xiaomi,willow", "qcom,sm6125";
>> +
>> +};
> 
> Please consider adding the comment regarding NFC.
> 
>> 
>> --
>> 2.52.0
>> 

