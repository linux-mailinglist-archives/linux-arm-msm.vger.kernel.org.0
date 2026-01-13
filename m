Return-Path: <linux-arm-msm+bounces-88713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 58453D17837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6C5C301A316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEF83876A1;
	Tue, 13 Jan 2026 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Dvey9OxE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NFOZycLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D9E3815FD;
	Tue, 13 Jan 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295382; cv=none; b=oR2XfUK5y2uoNoP4nW3fgC8scqUtAQxxn2HImMTqjtHDcmo2jrNY3YpG9k3o5qxTR9XCwDSF7CvMgLyZvMiMlk8dzTNrSJef36ro/sJ8Qcu+XI8z7NoShLC9KW1d2ui5/4wSAXS3+xYSRG58b4cxYNy3c5gNcDL47+4OVpG1RiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295382; c=relaxed/simple;
	bh=gTtDAusvRw7LI+dlD+CYQN99LPzBYnBE4C/Fu3XhQZ4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WPm2GbS71uogdbUFZ+PMXDEmG6Gv9Jf7vw/fNl5bDVTL1CcgjqyELtI11fkXpI15UAnCRJLmC5TytZ3Rx1Bo7ACElvnzFDOcxhuxJdGXu4UXGyHdN+Y372ErDgeLI0y9V53NjYV3Efut7KmmFs57gQyt2ovMj+5gmB0nuS1yS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Dvey9OxE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NFOZycLT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768295306; bh=QnLl0L/h/5jRa9gkOcyx4vd
	8lCg1PB5lHVg4ATEg4OU=; b=Dvey9OxEmcIk6GU63NyPcurvFpy1s261GXo+0NbmPPhUg2Vkmu
	Lae5xxBJYmH/ce3LVLSJwNo00XgPmjU6mtD8L3ijmRcs05e5bJMnGQBY2jAsvcOc1w0qZSQcneG
	M5y8ZZPMYtkQnVm+u0KpEwQy/u8s7imWJ4JN1gIFinVPMJVUjqLz81OtMBGfbMIxrodUp6JS/yN
	mwKUc+g8/Hc5cwSUuc/DkHw0XGCm6NzBiSaqk9mfHXeOY6cgdefPY9UXp8nczIVi+R7+lNuLzOI
	aSBMr5M9hRJ0ewQffONg31Y1uUZWsemUZf0hplCE0rtiC5fF4zunLr0R51wiBvAbPTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768295306; bh=QnLl0L/h/5jRa9gkOcyx4vd
	8lCg1PB5lHVg4ATEg4OU=; b=NFOZycLT29OLI0dnMru2MMjoy97G2whk+81tne2AtYUPAa0t/l
	azYJnj0sMdaxDpskDNX5afDuJXC1TKZoYeDQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 10:08:26 +0100
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
In-Reply-To: <11ee77c1-2ea6-4c7c-b955-22f10d879ad7@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
 <11ee77c1-2ea6-4c7c-b955-22f10d879ad7@oss.qualcomm.com>
Message-ID: <dd4ad11c57d00e9d9f532f40f408b637@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 10:01, Konrad Dybcio wrote:
> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>> The device was crashing on boot because the reserved gpio ranges
>> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
>> 
>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for 
>> xiaomi-ginkgo")
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> That's odd.. were you able to confirm that these values are alright for
> both the Note 8 and the 8T?
Yes, it was tested on both devices. The original devicetree was never 
boot.
> 
>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts 
>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> index 666daf4a9fdd..163ecdc7fd6c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> @@ -296,7 +296,7 @@ &sdhc_2 {
>>  };
>> 
>>  &tlmm {
>> -	gpio-reserved-ranges = <22 2>, <28 6>;
>> +	gpio-reserved-ranges = <0 4>, <30 4>;
> 
> Any chance you know/could deduce what they're connected to and describe
> it, like in x1-crd.dtsi?
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/willow-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L605
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/ginkgo-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L610
> 
> Konrad

