Return-Path: <linux-arm-msm+bounces-91257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIqBAvZ8fGkONgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:42:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67572B9009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 823B03073FEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411A4354ACF;
	Fri, 30 Jan 2026 09:38:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71834BA20;
	Fri, 30 Jan 2026 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765887; cv=none; b=lxDqfNgAoWWi399ttHjQZQDdfNpdPcrAgNqScrvSq9toyYvI5qMBF2cZM+cf30UWyH7ZMBywnHRWtxdrqFhsC8pIUwdz33ByYMON6j3b8csKMwWW4lZ66D/DFTcHihsxYBYU6PB3lsLcSIIbTJO0Pk3zOldPkjyRTi9znp0IIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765887; c=relaxed/simple;
	bh=6CQCeSmx1NPfMoOs+T273vl+VJ4+Z2z7Z482ryoAy7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0YgUrAahqdgMLSaFcRBSt7WFKG9+dwL3Sv3UgZdIC3pY9ZAlNJ/u8IJyx3LngPVzdjXKZVB5gAR0tsT15rOLdAzhDPoLsFXW7ZVn5UdtLNcWrC43x69IWZvCoHUGSyw+s8oyjiYhpFEyje2UfjMMdutcYyDm93mgCV384WbDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1769765875t80ca54e3
X-QQ-Originating-IP: l0u9r9mYza1ctZoUFdu/XHUiiwczQrS912ncDLmX2JY=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 17:37:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9275328956173114574
Message-ID: <11D9329300A4B492+9485ef48-5ac3-4030-afd3-e5c7dabfa1d8@radxa.com>
Date: Fri, 30 Jan 2026 17:37:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 jie.gan@oss.qualcomm.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: ORorvmD02XU9s+S0qlE5mrB0ynueIHGRPWHAdwB8pipzKE49FctgEQpe
	RghRFUDz8XOu+Y8//Ptuc0xNNkvHNnznGukWRBW80TsbFaMzOMzsiSvrRtTPQDZttQJTwbp
	HGZQasOrm1i6ygSJkI26EG8bJ/xGHfULfgFM1z7uu+iyP4W5nxgUXNdlD8hENjjZdIskRuI
	kLh7/B/quuU82gNmAfaMwJdgyM7+wrEUUiB5yPh3D2DBf2+gia7mEEdLhW6C8IyMzB7/tri
	sNo+zrQQJCnLgJnp6laSSKzAl8wHQkmCWcG8ftMcbKsMzuI+LjfbJaX9dgfHioEcpy7mqDM
	t4blaOimxueAEuFvLllf3CBs7PpXW+u/vqgRsUPSKmpsBquYdQfH7cPhHuLjWelKzusCafI
	Mz9QyKOSXoXz1hq8quX8q44S/ehqlp/q3jZOgvWJ3Zv0va9+kZw+PlGYFko8yTzFEhn5I9H
	sgkSjxti1M0uo/i7cjfdD8xgCGQWhedypY5cn5QWxRNnFL29wiiiA1LDljt8j8xBjfROqls
	R64oR9dpLCI0vlgs2CKtrA8tWOkcXna3wcEyQrrvvw6ixUS8rxQwknC8JE+OWOxKbKCgBpY
	QOqFFNSIpIX7KBCNnFjFBbmVN+vAS2SLcEfv771zjttGS2v+3Tt//TjYkReKRRnsGGfjY0F
	7qVXef0o0pEtdHMtp9ag1ybqJVK/O7aRf+JmUwfv2tvRoWx8PHTbJYGVedBK4qs+wO5btsw
	PZxwBk1tpL/RwROUfrzQYanjkDCmKwmaCfuSPAlKISGGw31TUUHthkr5zNNytBXPjv1PMn8
	1AhToVMuPwISwj1AVUcoHVZUUjqivm0Tpj69u1oo8yiw50amNwJtdVjNqVFQVaKaISRfopq
	k5b7eCPnrDOpmqpxqQ4+dpiJeyEymJrmrjjrJ1r+Zab7FhGTKUAAMGui5j3fo6atHXfF3F3
	T7S5kAXoCMUmkCYevn8Uq7mQBhYppXQcX81uwiXyOTi7/ASt8bwBdNZPrCPcYA72LGb9mSi
	TVRZ8sazxD5rA2e6tDJKUYAGZXplZ+PGC2cnDw7OYxyfiRlTTd
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91257-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_MUA_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67572B9009
X-Rspamd-Action: no action

On 1/30/2026 3:31 PM, Xin Liu wrote:
> All the existing variants Talos boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices.  However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add remoteproc to the EL2 device trees to generate the corresponding
> -el2.dtb files.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Hi Xin,

Will this work on Snapdragon X laptops running the older Windows 
firmware? I believe that Peripheral Image Loader support in EL2 requires 
a newer version of the TrustZone firmware.

I noticed that the TrustZone firmware used in hamoa_iot-ubuntu [1] has a 
different version string compared to the WP firmware found in laptops:

iot-ubuntu: TZ.XF.5.0
WP: TZ.XF.5.28.1


[1] 
https://softwarecenter.qualcomm.com/nexus/generic/software/chip/ubuntu_qualcomm_iot-spf-1-0/ubuntu-qualcomm-iot-spf-1-0_test_device_public/r1.0.r1_00004.0/hamoa_iot-ubun-1-0-r1/common/build/bin

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

