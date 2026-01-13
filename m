Return-Path: <linux-arm-msm+bounces-88717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A0D1790D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477A83086024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC53638947D;
	Tue, 13 Jan 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jSr5nuqf";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XA/m3aMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF9387575;
	Tue, 13 Jan 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295704; cv=none; b=dc3zNGKYsg1etGfRzPbjFsoYJvwLPkLt3p2Pq1wEDDevlBZ3Vb603lzk47PbyMbEiR7ypcpVX60EzQ4jTcJuyqpFObQqUPvjvDu8MbBaAScRxYW7aQuOs+sedUkhnrVI7JvvZKgfH1+iAbCWyeG/7SPp7JXLXDfV7/DctbdYJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295704; c=relaxed/simple;
	bh=uE1O703MTwrvx70+5/z1Z11tZ9XJbRwyQmBnjwbPzho=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QKq6k579Rm4HAPirW8XoBTvfKWEjlpWTEAqtnlbNg9YLdHUpnWarn+O36AFiiDjB9cV22UTEEX6lAZOd2QgzUR6NA/jQaAkvx79JA8gRM9JD9fKsmytIwfGZ30NcFP8VYHl41Ka+u9CV3YWWsQLGjpwOXj7U/shGTyyKUbdz/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jSr5nuqf; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XA/m3aMJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768295646; bh=XJi73LOycOABa27w8/gzfka
	dRBaz+DQ7mqMDZGSxJ2E=; b=jSr5nuqf3VMzItVKoI9XeejQxzPtwyeph8sS8DtkvYexN8O5Lm
	dTLqK1XNcnlhcUeVjdJYOKb/NjdewbvFSdyYEtjZaMvMxSXf+RMBemo5i5hoC3XLHDbwXGx0j6O
	TrlgCyuOueGFv5/gofU8+jG/NrZxwVwMqKcmQfUljo7V4KMaqrdpp08N4TrNjINpxDH5jlUeLfK
	hb2HArIxP5AGy8UWYK2jU9k2TArzq05hBXg03yFkrtDzJDpwfj5tEU2DhNdPpOj3ZuW9XIKE3pO
	/xCpwPqe75cnyF7VjlzyVZYR9o2scHFXP/IaAwcGLGes42p2lgV8ZZUahGvUd+ZCFRg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768295646; bh=XJi73LOycOABa27w8/gzfka
	dRBaz+DQ7mqMDZGSxJ2E=; b=XA/m3aMJ1ceAVBTMJmTzrP0XWTbQdmtiYI8shh0NNnZwltlJJu
	TJnm+DhB5Hl0dfKxxmxaO+ZYz9zc2dgh1ABQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 10:14:06 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
In-Reply-To: <233f73de-b247-4b22-a079-5bd3f5ece5cd@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
 <233f73de-b247-4b22-a079-5bd3f5ece5cd@oss.qualcomm.com>
Message-ID: <dd141d65b3ee1c9e1f3148bccee6e964@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 09:53, Konrad Dybcio wrote:
> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>> The device was crashing on high memory load because the reserved 
>> memory
>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>> Change the ramoops memory range to match with the values from the 
>> recovery
>> to be able to get the results from the device.
>> 
>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for 
>> xiaomi-ginkgo")
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 44 
>> ++++++++++++++++-------
>>  1 file changed, 32 insertions(+), 12 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts 
>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> index bf03226a6f85..4c548cb5f253 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> @@ -13,6 +13,12 @@
>>  #include "sm6125.dtsi"
>>  #include "pm6125.dtsi"
>> 
>> +/delete-node/ &adsp_pil_mem;
>> +/delete-node/ &cont_splash_mem;
>> +/delete-node/ &gpu_mem;
>> +/delete-node/ &ipa_fw_mem;
>> +/delete-node/ &ipa_gsi_mem;
>> +
>>  / {
>>  	model = "Xiaomi Redmi Note 8";
>>  	compatible = "xiaomi,ginkgo", "qcom,sm6125";
>> @@ -36,28 +42,42 @@ framebuffer0: framebuffer@5c000000 {
>>  	};
>> 
>>  	reserved-memory {
>> -		debug_mem: debug@ffb00000 {
>> -			reg = <0x0 0xffb00000 0x0 0xc0000>;
>> +		adsp_pil_mem: adsp_pil_mem@55300000 {
>> +			reg = <0x0 0x55300000 0x0 0x2200000>;
>>  			no-map;
>>  		};
>> 
>> -		last_log_mem: lastlog@ffbc0000 {
>> -			reg = <0x0 0xffbc0000 0x0 0x80000>;
>> +		ipa_fw_mem: ipa_fw_mem@57500000 {
>> +			reg = <0x0 0x57500000 0x0 0x10000>;
>>  			no-map;
>>  		};
>> 
>> -		pstore_mem: ramoops@ffc00000 {
>> -			compatible = "ramoops";
>> -			reg = <0x0 0xffc40000 0x0 0xc0000>;
>> -			record-size = <0x1000>;
>> -			console-size = <0x40000>;
>> -			pmsg-size = <0x20000>;
>> +		ipa_gsi_mem: ipa_gsi_mem@57510000 {
>> +			reg = <0x0 0x57510000 0x0 0x5000>;
>> +			no-map;
>>  		};
>> 
>> -		cmdline_mem: memory@ffd00000 {
>> -			reg = <0x0 0xffd40000 0x0 0x1000>;
>> +		gpu_mem: gpu_mem@57515000 {
>> +			reg = <0x0 0x57515000 0x0 0x2000>;
>>  			no-map;
>>  		};
>> +
>> +		framebuffer@5c000000 {
>> +			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
>> +			no-map;
>> +		};
>> +
>> +		/*
>> +		 * Matching with recovery values
>> +		 * to be able to get the results.
>> +		 */
> 
> /* This is an unnecessarily
>  * squashed comment that could
>  * easily go into a single line
>  */
> 
> 
>> +		ramoops@61600000 {
>> +			compatible = "ramoops";
>> +			reg = <0x0 0x61600000 0x0 0x400000>;
>> +			record-size = <0x80000>;
>> +			pmsg-size = <0x200000>;
>> +			console-size = <0x100000>;
> 
> Does your recovery image not specify ecc-size?
No.
> 
> In my past experience, that led to much better results wrt the data
> being actually readable.. you might want to rebuild your recovery (or
> at least the dt and repack the boot.img) for that
I would not because i have got good results with this settings and
users could use already built recoveries to get the result.
> 
> Konrad

