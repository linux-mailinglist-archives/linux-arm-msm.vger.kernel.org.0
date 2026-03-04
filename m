Return-Path: <linux-arm-msm+bounces-95457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB1rHCWkqGnywAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 22:29:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7491207FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 22:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D90C230097FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 21:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC23386C2F;
	Wed,  4 Mar 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RXhkKbCV";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5A25tT79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2F386432;
	Wed,  4 Mar 2026 21:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659614; cv=none; b=rZ2s9QgO/ge1wM0qRtCDGBU+BlMyDTg8UExIorZPKrZKfI11HitpM3Jnk0z9n3X1mfoGn48uaM3YEoyvvMKyxGKpdUuof6bxJBSsADYx+Q8EL4Qk571dTd3lKGqWcAeKri8jOXG5iFB2wOiMBCnI7XifQTJvKYPvV8iBij95RNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659614; c=relaxed/simple;
	bh=MVhmd4cWE0Kx3+BczUBvTeGMoG4y8lKZBKmcPBNai8Q=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Gfe/XMsySc/inxPfauKSYAE7DWc9bfi1IqTwyVDNJ78veUYXOwoSSBlGxvxQ/yLmi9i88b1xZ3mv0gCCrtmkMZWwlILJskDOTjbwp/zZOqj+5BeAPyUrzhHnx/UmWZYeefDfK1y1ELgJPiUbGsNPJKuZQSjSdK4Oo6SkA8wbMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RXhkKbCV; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5A25tT79; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1772659603; bh=ph8FSrXPg2/n2Ad6/2vbcmV
	Qb668+5s77efPfp1VCHA=; b=RXhkKbCVAcPaz1mI5rRjFzXC7h2MjdCW6IahRHDaBTZ+tjHK1x
	RTT/M/c5Law8eJDHHNzFpjjAJeQZgJ2qZDQcx/8Lf8pBOCXYQF6pwjfgLdRLM1nsfs/2fN4Yz9d
	M2IehnG3rue2wkgHxDfZxcI+pEpn2m4MRi9rCjwS2S4vwjoHHYxsU7bb4ue0dgym9+tEk9fAbvl
	Dd+vjSNMauLHbK03xU1F0OGeurPYtMUes8Dj9hhi+c8qmCr3j6ROf4pW8Bg0/+/9dNMgrDel2eI
	5a6cVJFvrD6Ec7fFjGFqgRklFL+agMXkNSXJlrCMTvhIrV8kAb8CKT07iqSSfeR9JHA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1772659603; bh=ph8FSrXPg2/n2Ad6/2vbcmV
	Qb668+5s77efPfp1VCHA=; b=5A25tT79Aq2CJfrW6ibkNOhBuEcu5Z+zHyKHR5TouGxL8S1LnF
	GdgmMJp2WuIpZlaNxy8r6DoX8/2BojAevyCw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 22:26:43 +0100
From: barnabas.czeman@mainlining.org
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Biswapriyo Nath <nathbappai@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
In-Reply-To: <xgcv6gcaw6xxelkafo23waz4sbw2cycas45qhzxkfhbeuukzbe@wwssuc44mp7y>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
 <20260126-xiaomi-willow-v3-2-aad7b106c311@mainlining.org>
 <xgcv6gcaw6xxelkafo23waz4sbw2cycas45qhzxkfhbeuukzbe@wwssuc44mp7y>
Message-ID: <f1028a5b2eefbb0672f0a5e55d0691d1@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C7491207FD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com,vger.kernel.org,lists.sr.ht,mainlining.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-04 19:51, Bjorn Andersson wrote:
> On Mon, Jan 26, 2026 at 05:34:52PM +0100, Barnabás Czémán wrote:
>> The device was crashing on high memory load because the reserved 
>> memory
>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>> Change the ramoops memory range to match with the values from the 
>> recovery
>> to be able to get the results from the device.
>> 
> 
> FYI. If you add "memtest=1" to your kernel command line the kernel will
I have tested with memtest=1 also, it is working fine.
> sweep all memory at boot, which tends to flush out most such issues.
> Then you don't need to rely on "high memory load" for testing for such
> issues.
> 
> Regards,
> Bjorn
> 
>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for 
>> xiaomi-ginkgo")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 41 
>> ++++++++++++++++-------
>>  1 file changed, 29 insertions(+), 12 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts 
>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> index bf03226a6f85..d5e5abdb3b2f 100644
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
>> @@ -36,28 +42,39 @@ framebuffer0: framebuffer@5c000000 {
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
>> +		/* Matching with recovery values to be able to get the results. */
>> +		ramoops@61600000 {
>> +			compatible = "ramoops";
>> +			reg = <0x0 0x61600000 0x0 0x400000>;
>> +			record-size = <0x80000>;
>> +			pmsg-size = <0x200000>;
>> +			console-size = <0x100000>;
>> +		};
>>  	};
>> 
>>  	extcon_usb: extcon-usb {
>> 
>> --
>> 2.52.0
>> 

