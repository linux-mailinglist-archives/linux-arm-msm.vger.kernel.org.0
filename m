Return-Path: <linux-arm-msm+bounces-88730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7CED17C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AF26302CA95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852D238E111;
	Tue, 13 Jan 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Wba3eUdH";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="obGdS+b0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9B3815EA;
	Tue, 13 Jan 2026 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296313; cv=none; b=NoGXZBt8qnAxhDQBZ0vrA/XxS0pghIijq5AZvS0y6cHZPkZgMLmThbg0kM9fO4WCRRH+CfRo0nudsXmLC5c49pBjKMidrjbSgbeUSIDdCpcNbfgBIDPPcHnJwCyKJxD+jHsFmblu+R7Z3TOMxtE1rMqT++0mrEjmsl3zE2FtYmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296313; c=relaxed/simple;
	bh=AzXKgKkGT5WxYHVWoxvNel+hfZJBjYGlu46iUuROqbo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XsNGWIot2oAUlV8mm4a0c24BC7sdu530RpyCszXGidoms31oXbOS8YwMATimOBEq4Yzemv7CrlbI+v6WQIPtoWaJFeR2ycMnxbPKH/S3Goo640oMHGOoDux/AiTkB2kGWjVnrip903t4bEmDm88NjqqkgKEc7dZhMHvY0kdqpXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Wba3eUdH; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=obGdS+b0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768296300; bh=0pngC0SckCVUXla1waluvTC
	IVJX4K1IOTa/kAtQEAcQ=; b=Wba3eUdHRvAR+rZRfy48fjzNdbplUXMIo04wULwRfr5wRhp8Do
	VZJZF7HwPYf1KXP0j93FXXmTd5sLk2DdZjMmEFD4ak+TnHvc9mED/wXJUKDgQqZZ8iKdcimbGv/
	vbNDRBHiLPUMXCD5tgrkZtLuSXBuPhmm8RBkROLb4m24cPnMA65SVo50DCAfUn63Z2GAAJFOMPu
	xCer8rRrhfvw+8rbzHNt7p6oiRx2ysfHLe7v/UBWHv4kjKpBKyU3lCRAbT+nqElR+wIKNbgsqX8
	BLUewhaFy0zLEmXGBFEInanfESxHM13+kxc36/TYVcqdxB6sTH7SmvMIyHLimrEDEQQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768296300; bh=0pngC0SckCVUXla1waluvTC
	IVJX4K1IOTa/kAtQEAcQ=; b=obGdS+b0g386uxkwoH3w9d4xBktOdZnTxzBZB2IjuewUcspc1l
	Fwu0D2mRBLmlVsmCrE5fVSKVpm9Fq36GcoBQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 10:25:00 +0100
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
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved
 gpio ranges
In-Reply-To: <9662c03b-a012-4b3c-8061-62f71a3f44a6@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
 <11ee77c1-2ea6-4c7c-b955-22f10d879ad7@oss.qualcomm.com>
 <dd4ad11c57d00e9d9f532f40f408b637@mainlining.org>
 <9662c03b-a012-4b3c-8061-62f71a3f44a6@oss.qualcomm.com>
Message-ID: <43741f0228b0e0d6b2991417852f890a@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 10:12, Konrad Dybcio wrote:
> On 1/13/26 10:08 AM, barnabas.czeman@mainlining.org wrote:
>> On 2026-01-13 10:01, Konrad Dybcio wrote:
>>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>>> The device was crashing on boot because the reserved gpio ranges
>>>> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
>>>> 
>>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for 
>>>> xiaomi-ginkgo")
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>> 
>>> That's odd.. were you able to confirm that these values are alright 
>>> for
>>> both the Note 8 and the 8T?
>> Yes, it was tested on both devices. The original devicetree was never 
>> boot.
> 
> Fun..
> 
>>> 
>>>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>> 
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts 
>>>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> index 666daf4a9fdd..163ecdc7fd6c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> @@ -296,7 +296,7 @@ &sdhc_2 {
>>>>  };
>>>> 
>>>>  &tlmm {
>>>> -    gpio-reserved-ranges = <22 2>, <28 6>;
>>>> +    gpio-reserved-ranges = <0 4>, <30 4>;
>>> 
>>> Any chance you know/could deduce what they're connected to and 
>>> describe
>>> it, like in x1-crd.dtsi?
>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/willow-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L605
>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/ginkgo-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L610
> 
> GPIO0-3 sounds like QUP0 and GPIO30-33 sounds like QUP6
> 
> My guess would be one goes to a fingerprint scanner and one goes to
> NFC eSE (or N/C for the device without NFC)
> 
> Could you scan the downstream devicetree for signals of that?
NFC is using gpio83, gpio84, gpio85 and gpio95.
> 
> Konrad

