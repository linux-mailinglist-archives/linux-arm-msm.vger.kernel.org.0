Return-Path: <linux-arm-msm+bounces-91316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCtbDi+2fGm7OQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:46:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FCBB4FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 14:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D7773005790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B576830AACA;
	Fri, 30 Jan 2026 13:41:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAB296BD7;
	Fri, 30 Jan 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780480; cv=none; b=o63rzfKzCRTgZDBmwVIlow1LxbObhW4ZmlFFdOxBWb4VspT+vSSLlpkddGRsURaByMUvufDG5Nh+ZyFgw4ZU5RoGDr8tknChhs97F78k7hpvSrgPZUmdQqwwayPIcsDSl6j+dWW4EH6FlkiYfb1F6RHCa0ywRrOwKQgl0uY1XJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780480; c=relaxed/simple;
	bh=25lCNnh6AQMNGB2+KhCiZ9PNiljtrugcobbZJtj5zQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCNOZRnK8XtwwZ2N1A8XZeqmTsUkbh84MGSyUg8md4DtSO+L7othSk8gv9M2Ho2zC5Tktpu9WNAmnd72M3t1IF9kw0vplhBSS9S3r/bEB/JiTiWL/rLNWcRggnYH2v5jfBvnHdxMlduonfeRUM46RjAdOehFY/e0mUIEMbrkSG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz15t1769780391t7216e907
X-QQ-Originating-IP: uxJwp3J5Jz7kasf0mzapFd1F9HCnZEW4Tuf3NAEbV2M=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 21:39:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9357198044114509192
EX-QQ-RecipientCnt: 10
Message-ID: <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
Date: Fri, 30 Jan 2026 21:39:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>,
 Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MtYPpoBCfkHltRSTkjoOA0/9Fm2WPhrkzimI8jgFBCBF8yFwCl487xgK
	iMG7vKY+qRBWQ4QDuLyN09/17DLv5ZtA1YrT6DOIzaersVjTcf/RGOIZcN5nCz/LLWClW7d
	0sF7zqmYP7zF9QX4NwPi1x0EtCPm4dkx7KB+HyBGlEQlgf7jaQslA/bRGW2fVerK+OovvaY
	dwuNlwFcP9kB7++vzCYdCfhDymfu7hfLmM4L4Kx1N1VDD04w7laHpQsel8Xb+szN52gXHvq
	7leg6dYW8nihR/Ac+j9L7iTICpqkRciIqK79bwpoEWyU2EQWyhP7JY/pPmglXhYWMlsmdFq
	AHWCm740TGkbVd/qWuxENu4VwAoelj86khb0gKMA01ra/vCCfVXR+pJu9wrqCY1pE7HJr7t
	QWCmnQXzZ/h2lQ1/Orz7/QlqqsTnnqG2wvW1RkbCeokaprSk0D53h7JuxQiAKMCHu8ZATeF
	jZ/ocqWRmyDgWhGWoXYCwEgSQZHi+ld+69wiy/8+y8I2MMKL72wVXJIZC291I2hW7tuU2Kp
	uvR/2WXjJNf+j0W+taIE+qZ9p5Gr4scd0CydXZGFky+J3m2C6p0gvj+Ag2VbBMFkmgNX1Wj
	vxfD4U8k6Z6j2Oiz4pvHq98p2PTw/LjOMqnbWL6Rr0Nwr3YWFjZpikOMfFO8C6izC640glB
	1qCjHew925/UHBBSOPplo5IEXyS4QZQI3wAr6vAdBJs67VLQMEH1HoyUROBKU5wJ4+pcxAz
	ZDs+maw8VXQysvs6gWQprs5kOVtP6DW4sioXfNysSOe3ETcRZGLVsMRfG1BYwJSeGQXROiM
	OgQSwJh/5gnm9lXpVvenYZQUuwl9PoAcNfMSePk8UG7+wqs51Ekz6M7Yf6RTzBu14YFYA/M
	zXgwfvhnL7ObI5xWl7kuJAhUScA+fDEjx4FkE2uZjnHCRizK7as/017RRt2OIQGaUufsvHq
	VVH3UW9giR49lJ5wDhDqoLxAxzHoHtQMujjTHKQo5dEM6Q7OWOLvF9HrV4FOL3iwRwZUHmI
	su6bb7AekWXbQfjgGwp/Ns+ZfuiDBku/aHc+MV2yXb/w3jefiM
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91316-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:mid]
X-Rspamd-Queue-Id: AE9FCBB4FC
X-Rspamd-Action: no action

On 2026/1/29 4:42, Bjorn Andersson wrote:
> On Mon, Jan 26, 2026 at 07:44:50PM +0800, Junhao Xie wrote:
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
>>
> Sorry, I missed your reply to me on v1.
>
>
> You replied that this allow your users to update "BIOS" firmware
> directly from Linux, which I can see being more convenient than relying
> on UEFI update capsules, in particular in a development environment.
>
> The concern I have with this is that I don't think an end-user of such
> system, has a way to recover from breaking the content on their SPI-NOR.
>
> As such, exposing such a convenient interface for the end-user to brick
> their devices is probably not a good idea.
>
> I think we should somehow lock the interface down to be read-only by
> default, and perhaps have some mechanism to unlock the write mode (like
> a module parameter expecting the sentence "YES, I DO HAVE THE FIREHOSE
> PROGRAMMER FOR THIS BOARD").
>
>
> I don't believe you answered my question regarding how to access this
> interface from the kernel. On many of these devices we can find the MAC
> addresses of the system in the "DPP" partition. Do you have any ideas
> about how we could access this from within the kernel?
>
> Regards,
> Bjorn

I agree with your point. I will add a module param in v3 for default
read-only mode. e.g.: /sys/module/qcom_scm_storage/parameters/allow_write

For something like the "DPP" partition, I think it's better to access it
from userspace than from kernel.

Best regards,
Junhao Xie

