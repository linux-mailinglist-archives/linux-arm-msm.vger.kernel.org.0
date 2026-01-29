Return-Path: <linux-arm-msm+bounces-91180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEs+B0FXe2k0EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:49:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77250B0244
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57F2E300D157
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0031387588;
	Thu, 29 Jan 2026 12:49:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24743446D0;
	Thu, 29 Jan 2026 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690942; cv=none; b=CLKwYfLBWjtQenbLkbxqpUXRJxyae9JpeZVXj/7DEnCG9VWQzf5h2yZ5PFnRVmV3SWmVcwcqwpk71HtcA1gmkDnLmXywktnyEOlXRNzAGMPtaqXbAJZUkc708XJAW+HqufY6CK5xwDAgscFhR2JTpYhDQco+8i7eUDeQzkLTrO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690942; c=relaxed/simple;
	bh=+Q740mks8URXGrd2KIYxh4yLk1icory6ETiyq3SRSL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OD+vE4RLZlLpOacwtiEwk+WwPqU0Q0T6nlrWxY72jvdcQQAsejtbLONbOV1xo41G5A9bh7k5lE3XwfMxRzMH14o4ggWf5W4nEUVjlansEwBy+G2S3AEw4m/uMCvFtXQZPxSOb48u7Z3NLiRKM2YTM0N04tAm1vpeMukZZNGo6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1769690855t60ab1644
X-QQ-Originating-IP: wYyPjWPI//T2UB90xXQhGRavoGv4dQM9a2sofjs/Waw=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jan 2026 20:47:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1389357313924058083
EX-QQ-RecipientCnt: 10
Message-ID: <2397C90D8A633438+88e8956b-5753-4842-a1c7-b0f6a78580c1@radxa.com>
Date: Thu, 29 Jan 2026 20:47:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MgDzoWPZpMu1Vduoi8VZqzB1qT3rNCGCxMjS4QKsCZieNWylTA2vYZ+3
	Q8rwTLRvZlv1kdKoMKszowVLNOTz73m/9hzv6cGXruE6DT4RpW0Wsw8NwA2PbMYO4ndgjOV
	Z6MCBWm1XE7iJ+fMn2HtP/4+YnanhDm/hd8b4ATUzmehhP3WsYAEiDIR0uNV06CL1O9veIF
	v9hIqGoMfKzN2W1UJr+3tPISguM5OQl1C9ZcwgB+lDWlYz6c04I7XhrBMFlbgTm6r0Y8UAV
	EUcbPp9srh+Kgi5LZc0r+tEZFq/P44ayPY+dg+lpODglAj88T2+lVsqRKLNX1zlRyL9pyE/
	d2dBgHGheB57yTXVEX0vef3HdedyRU0D1fYW8Lc2HCAwUgEYjzU+wqcMCUyS+3ZTABQsPL+
	8ozSaeoHcqbK9yIUGW+UKAOlqFNetV6NMl8+Czrokoch8LLQEml/9YDNCGeu5ht3todY8sz
	h8r+pGr084RErVCpSPMd+OoSXJeLqbH0JSf8QUBn9tadh2avp73k4wZIzeuEipZhtR/VRMM
	n29ptyDfAN6UanHJu26inUHe5q6zV+j2C+w2RZnm/QmrNOQnsDH68r+J6DvRnA7E5HnkXz7
	8Z6h8i2fW+jmqBgdOK4TlavftzW+6037F2zeIlUYX3sFCe3mSay8HdLvdRyQ2SCI6JjajxI
	+RiOZEN3fbZGf6wepkXQXxYq3BpzRZkcLSfS7rfmifAiz18nGxtNuwyRFX1sRw4sVmpjDlZ
	r18CFiyWpFaeLO7v8lRDCw6WU2RB1U0yJFXTb+V26y2YNtefFO+7kQCS/xCfuRhx+VEwkWX
	X/PB0lt4egYL8ZslHu/AHopxiE2o10ZMgB0YyGldfQwT12sCTFq9NNKDJv5hG2pX8eGk5rV
	YPKj6wTjTWzzZpIECjvbSRrgrWGNKKAvQhhkKPRzLdnlyBbKzFyGPxedPnjx5pU294ZdF1O
	U0p4ZJ1IQF6jfQedIYjCPxb+FUDTD5TMHfKu+eTCpnurtXzRf69nHM+16/1KQueaBXYAR3U
	pqMRTopf9yhaDfUkfx
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91180-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:mid]
X-Rspamd-Queue-Id: 77250B0244
X-Rspamd-Action: no action

On 2026/1/29 5:43, Trilok Soni wrote:

> On 1/26/2026 3:44 AM, Junhao Xie wrote:
>> This patch series adds support for accessing storage devices managed by
>> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
>> introducing a new MTD driver.
>>
>> On some Qualcomm platforms, firmware or BIOS-related storage (typically
>> SPI NOR flash) is not directly accessible from the non-secure world.
>> All read, write, and erase operations must be performed through SCM
>> interfaces provided by the secure firmware. As a result, existing MTD
>> SPI NOR drivers cannot be used directly on these systems.
>>
>> This series introduces a new MTD device driver that exposes such
>> firmware-managed storage as a standard MTD device in the Linux kernel.
>> The driver is built on top of the existing Qualcomm SCM infrastructure
>> and integrates with the MTD subsystem to provide a uniform interface to
>> userspace.
>>
>> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
>> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
>>
>> Note that this platform previously used the standard Qualcomm Linux
>> firmware, which allowed direct access to the QSPI controller without
>> needing this driver. However, we plan to migrate to a Windows-compatible
>> firmware which is more feature-complete but restricts direct access.
>> Device tree changes for this transition will be sent separately.
>>
>> If kernel boots with EL2, access to the SCM storage will be denied. This
>> needs more investigation.
> So you plan to enable this driver only w/ the Gunyah based configuration
> and disable for the KVM one through the devicetree overlay ? I just
> don't want to break the KVM boot flow on other platforms supporting
> qcs6490.

On systems booted with EL2/KVM, the SCM storage GET_INFO call currently
returns -EINVAL. If a platform does not support SPI-NOR or SCM storage,
__qcom_scm_is_call_available() will cause the initialization to bail out 
early.

There is no DT-based enable/disable mechanism, and this should not affect
KVM boot flow on other platforms.

Other QCS6490 LE platforms do not support SCM storage, as the LE firmware
does not support SPI-NOR boot. Radxa Dragon Q6A uses WP firmware and boots
from SPI-NOR.

The root cause of SCM storage being unavailable under EL2/KVM is still under
investigation.

[    0.770124] qcom_scm: convention: smc arm 64
[    0.775005] qcom_scm firmware:scm: qseecom: found qseecom with 
version 0x1402000
[    0.782990] qcom_scm firmware:scm: scm storage get info failed: -22
[    0.999095] qcom_qseecom qcom_qseecom: setting up client for 
qcom.tz.uefisecapp

Thanks for your reply.
Best regards,
Junhao Xie


