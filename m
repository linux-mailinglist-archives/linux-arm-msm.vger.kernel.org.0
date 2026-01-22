Return-Path: <linux-arm-msm+bounces-90242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDPqNXdhcmnfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:42:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE216B8D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 338A23084C9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5875730B51E;
	Thu, 22 Jan 2026 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="soa+UBw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CAB264617;
	Thu, 22 Jan 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101968; cv=none; b=SVkLFGcV0VBwH5T6RozZeWnXKYYVgri74PihZ6BqTnx6LsCeczXTg/CAeditHUuF6iYbjAC3ETNMJMRIkCDvkokuo/gx8Y0FTarcnbXRTerGFDUd1CcLT1ua81bGs8nKUaFRl7Z16ZRFYjRcdfopZvJF8RFXkr67Ml2VcRtrASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101968; c=relaxed/simple;
	bh=McwNkBdBbVI3lKPxwBMVRD3ZrpjNRQBNMdX/j3SUp10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFIM7LNWZWVS2utNF0RKJbUDgWu4vJqk2nK5JSWM4KNu9a3S6LiOzGRiI3Ypz4YD3dwVUqFCBLufLOliARjm83hzd6KLw0OxIOyJJAWlJ101uT0ou+HYiTnx8klyOtC/dgGuH5SCkdTRJl+UG/ZQ4rG8jEgazkkvqQa9lk+Fsck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=soa+UBw5; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zSSKJTpdy9TXkwfbj76vqHdgLMiL4P0TtwRoVF0tQ3M=; b=soa+UBw57t7Za7BL5h3p7LYBGp
	CmjGZZuqDvVk7zcf28vbxZeAPVuzMb34wdkikfA1lHbScD70dLyMLWv8FkWYv6gHa3rDydgL8A9e3
	WsCpdXtz2OtrevhoKjMdnD0EvdKzS0/7v9Hz8GhshkkwZRn+WTUkkuE7V7KNP3GNrqeA=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1viyES-00000006IfC-238Z;
	Thu, 22 Jan 2026 20:12:32 +0300
Message-ID: <577de3fc-f21e-4ddc-8f22-57fa05f2ac34@minlexx.ru>
Date: Thu, 22 Jan 2026 20:12:32 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: add device tree for Xiaomi Redmi
 Note 6 Pro (tulip)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-5-morf3089@gmail.com>
 <d2aff319-d98a-4007-bfb5-8766e3c3c206@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <d2aff319-d98a-4007-bfb5-8766e3c3c206@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[minlexx.ru:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[minlexx.ru : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90242-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[minlexx.ru:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	FROM_NEQ_ENVFROM(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,minlexx.ru:mid]
X-Rspamd-Queue-Id: DAE216B8D0
X-Rspamd-Action: no action

On 21.01.2026 15:42, Konrad Dybcio wrote:
> On 1/20/26 7:00 PM, Gianluca Boiano wrote:
>> Add initial device tree support for the Xiaomi Redmi Note 6 Pro
>> (codename: tulip), a smartphone based on Qualcomm SDM636 SoC with
>> 4GB RAM and a 6.26" 1080x2280 display.
>>
>> This enables:
>> - Booting to a framebuffer console
>> - USB support
>> - Hall effect sensor
>> - Battery monitoring
>> - Charging (pm660_charger)
>> - Status LED (pm660l_lpg)
>>
>> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
>> ---


>> +&pm660l_wled {
>> +	status = "okay";
>> +};
> 
> This seems to as well

There is a tablet named Mi PAD 4 (xiaomi-clover) which is not
included in this series, but it uses separate backlight driver
and does not use WLED.

>> +
>> +&rpm_requests {
>> +	regulators-0 {
>> +		compatible = "qcom,rpm-pm660l-regulators";
>> +
>> +		vdd_s1-supply = <&vph_pwr>;
>> +		vdd_s2-supply = <&vph_pwr>;
>> +		vdd_s3_s4-supply = <&vph_pwr>;
>> +		vdd_s5-supply = <&vph_pwr>;
>> +		vdd_s6-supply = <&vph_pwr>;
>> +
>> +		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
>> +		vdd_l2-supply = <&vreg_bob>;
>> +		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
>> +		vdd_l4_l6-supply = <&vreg_bob>;
>> +		vdd_bob-supply = <&vph_pwr>;
>> +
>> +		vreg_s1b_1p125: s1 {
> 
> Please diff the regulator settings, they're likely mostly common
> 

It should be doable IMO.

>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <8 4>; /* Fingerprint SPI */
>> +};
> 
> This setting is common to all of them too

Once again clover is exception here, all 3 variants of clover
are using

      gpio-reserved-ranges = <0 4>;

I think it might be better to leave this setting to board files?

--
Regards,
Alexey Minnekhanov

