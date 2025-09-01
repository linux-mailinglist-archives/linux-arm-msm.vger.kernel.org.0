Return-Path: <linux-arm-msm+bounces-71432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D172B3EDE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 20:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621B2175B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAB522F77E;
	Mon,  1 Sep 2025 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="X2rMHn7U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xUwtK7xf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23BF10FD;
	Mon,  1 Sep 2025 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751625; cv=none; b=A5FDS71uomd/s8mBT11LFMshqPXfVvz0mW+5kaRupOX/m/DOmj0u6LZ7KBpGQ5QZoe+gqdl5LPPTdKEUFzgNiysVmPZ0AwhrvgLXsn7iqJ4G8ScaK7EHgR4HdbQ9LU0hmNZ/AW+tb9/QuhPFPO6QOWDmQMh3EYiiAIFJkCukpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751625; c=relaxed/simple;
	bh=d1d5jPzRSjDdDtjv1kql3imYzr4AXIwUF6lyDxXqt88=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XSnp/6CWv5q4Lbmo8jW7BM5UdrllRM4vfOxXgf9yZkUS1vmhjGMthAIKIgRLIF9rQUD1Czb4T7nFwMkaMUF7cS+F1CiXlqf79x2s+tYP9Thv0VPkY23ZhRbQmlnF7rZwjp6FPzDzCOpfTs2ROitqIrczqW8+m6lyEEBi8hIKc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=X2rMHn7U; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xUwtK7xf; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1756751524; bh=T1yPcbAYFYUo/GbWye+XW6V
	2J91L5+TxwHd/8DHOIbs=; b=X2rMHn7U6uVnShypSWFk+sQ2eifGBU/svttQWFJmfs1nAP83zN
	cN4CJ0RwEdttuAtQXfKnvbYUZdONxksp7228GoePXuwICKcf3KaSgKLNKbRQOYdFqjsD7K0y4Kv
	Isbp7amABx7pIA3YwMVBr1dgDnyHbpfsmRHEbA01MUth+Xx2Y3j8DHkLLbNJSsZEGOhQaDD/qmH
	VVaph/IZhVC8JU++UTX0p1UHxrO0QB3zUixtDYs0Nz4z0pXQMqC+voIxij/E0K4vzLNw67J4/zO
	MruXR5rVQRPV8ZDmQOp5UMksR7CBrBfuuj5VE5NFCESbyErsVIaBwU4+t1qSMQK32Rw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1756751524; bh=T1yPcbAYFYUo/GbWye+XW6V
	2J91L5+TxwHd/8DHOIbs=; b=xUwtK7xfluHZUHmvm7G+uqyfp7V5Ac5BBo+s7BFKPcHog6Bv6A
	ICC8NLrZC2JD2rw0BIBdrHu0awyL+Q55qIAA==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 01 Sep 2025 20:32:04 +0200
From: barnabas.czeman@mainlining.org
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alejandro Tafalla <atafalla@dnyon.com>, Luca Weiss
 <luca@lucaweiss.eu>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
In-Reply-To: <q4t2cmg5xtzbga2u3nnxayvb3mom5zaffhyidki2h7pmctk6f4@syj4byco3pwi>
References: <20250830-daisy-sd-fix-v1-1-727e83a987b8@mainlining.org>
 <q4t2cmg5xtzbga2u3nnxayvb3mom5zaffhyidki2h7pmctk6f4@syj4byco3pwi>
Message-ID: <e9750a64c761c0e66a813e206696dc7f@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-09-01 18:01, Bjorn Andersson wrote:
> On Sat, Aug 30, 2025 at 11:59:30PM +0200, Barnabás Czémán wrote:
>> Correct cd-gpios in xiaomi-daisy according to downstream sources
>> it is using GPIO_ACTIVE_HIGH instead of GPIO_ACTIVE_LOW.
> 
> Is the problem you're solving that the DT doesn't match downstream, or
> that card detect doesn't work? Does it work after this patch, or is it
> just aligned with downstream?
> 
> Regards,
> Bjorn

Both, it was not matching with downstream and card detect was not 
working.
It is working with this patch.
> 
>> 
>> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for 
>> Xiaomi Mi A2 Lite")
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts 
>> b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
>> index 
>> 336b916729e4721b5ba8f4f7e368d0d838aa54ab..ddd7af616794290aa1f06228a95cfa1d42b006e6 
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
>> @@ -296,7 +296,7 @@ &sdhc_2 {
>>  	vmmc-supply = <&pm8953_l11>;
>>  	vqmmc-supply = <&pm8953_l12>;
>> 
>> -	cd-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
>> +	cd-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
>> 
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
>> 
>> ---
>> base-commit: 3cace99d63192a7250461b058279a42d91075d0c
>> change-id: 20250830-daisy-sd-fix-011c23468e2a
>> 
>> Best regards,
>> --
>> Barnabás Czémán <barnabas.czeman@mainlining.org>
>> 

