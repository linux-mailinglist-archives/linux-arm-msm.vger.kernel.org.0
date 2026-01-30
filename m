Return-Path: <linux-arm-msm+bounces-91321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM7vKnjgfGmpPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:46:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B549BC9D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 17:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A087300AEDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 16:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706C52EFD99;
	Fri, 30 Jan 2026 16:46:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95318C2C;
	Fri, 30 Jan 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791606; cv=none; b=J3QI0gbnJiieFibE9XDIEU7rlt9OQYfpI8krAIqab8IG69S3M+zywtgrmRK/HK7G1TmsaUOsDTxxLTmUYKYzJXWuMlJhDGLa87QSvUJyqklvHwB4iTaptmx7/OtZrGSL5PYGhTgd5IuRPuTvlmYO863RHR/b+hhRScawYZMJ0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791606; c=relaxed/simple;
	bh=W88IuHvp5+7qrfQfUDVAAFhWY2vqhdR6CG1N1j4G90M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wl7dt1ijTVpPXZ8Lc7Mm00GOfQPYAjSCWjH+wYnUm6QZxvAIAImseEdQvOux04zueegs0ZG6pM0JMSRu1wQEriqeeQA6K4cWQTbcolPRSZrIgOVaZ4sGsjuXCJQirDM6KGlIVXhNY+vxlQiDRAgofK4i5nmxSVpDtYrY+0BGJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz10t1769791519ta032fb5c
X-QQ-Originating-IP: X8rQ7zIuL6jwO9hg/ZyaNKQURyN++V9+GWajqCSeL1w=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 31 Jan 2026 00:45:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13173608927844398011
EX-QQ-RecipientCnt: 10
Message-ID: <8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
Date: Sat, 31 Jan 2026 00:45:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Xilin Wu <sophon@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
 <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
 <87ecn7jin5.fsf@bootlin.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <87ecn7jin5.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M3GnMu55RRKLNOFKaApShYkFPVvYV/bBChgIa8l1NjBUnU56PusqQrr/
	6KjSbwkpmzODdJz/pIWM8eeJ3ty+LoSy9hQI9aRLMrU82TfPAyz8zVGQXI9GX5HL7Nu+Mbx
	mA+suay7NljppU8zu0dswUqyapZS+DV6CO4dlor+tFXHOJsDpQLQIlyxKcHGJd4e2IXIbJV
	bd0wVYwssm0rKc2AfZKqs9mbPbpJiwQFXCAX8grVOlq5hTEWTkZLiu6ZQ9ZDuPxwEpIq4Sc
	iyd9f9pgyaw7KHQDm7OjTUUU3Au28ea2Hv/TkT1oOCVsghQ7ivN4MdYsJXY7Kjx6RsJqP/o
	rMsZN56A/EpyxY/EMYrarev3JT5QaG4ESfR+lXLUau0rqDLwBh+ZNFtV1rhz+MhzBalotgo
	44nMOLxs+gSlwMChgF39sRvm5oKpyvGWs7K77AiQCuJ4mK09gWsdZJTpoIFlWfCXzgB+VS4
	njfNTV+TWZNXHQGU5WXDNmk8uypUThthpc05qyCIgtE7tNmIkkb9mPH5H9JJAifBa9JY0dx
	Hl0FOEyxz3zsiNE790+qw/pL2Ko4VblvJZYwq1DIjkDPA24e4mh6ytTCEFp79vhd19NiY0N
	MmVYxBfcgbmMAQ/Zw0SjTNrVF6gEMUpIVi50+vxkGZ3e9/QtWCNAtw0o0eZC+40HaECU7E+
	Q6htaz6LtJ1x/68/7Pfz0d/mJnZbd0cqXxOqbu8xiZRGCN4SMSnzevgayWBA4h3v7fwbhXf
	fg6bUkjn2pY2oXmZ6d9pk2bX8EVrjMtvq3tGT1CHFdPp65OEUDPWMDbUvm6gqaY03GYkEeh
	/wgCbTDcNR6Jt/o160VmLNiJ0AvAxPx3lM5qdIUZLLzdzpmFLjlT7RfISUNf0crrZW0UINd
	Yq0WX9n/DncBotWBx6VeuOIIkBb3j0ShBfjAcLmXZ2CdZZbJuI8TlnPq366aWNLt9NSd81J
	NJiNgowpjxFvHqelJ9JsSKmWWWsPgpNxH2fxSGO2Ecqe+Sa/c4+NCLQaVnT5+0wW3cO7iZM
	G1+bE5MeD2UqxS3eDpHnlbUzcjeKfhCgcIz0UZh1CJE08yFE0AXqJ+2eLX8l7gzt5wn/J8b
	uVzMjp/nAvxm3krzzh3fSeYRQPUZdBvxN7XYLnxfl4BOiLm2OimiZbfLCEq6sYQ05oL4t/3
	uoxJ
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91321-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:mid]
X-Rspamd-Queue-Id: 2B549BC9D3
X-Rspamd-Action: no action

On 2026/1/30 22:10, Miquel Raynal wrote:
> Hi,
>
>>> I don't believe you answered my question regarding how to access this
>>> interface from the kernel. On many of these devices we can find the MAC
>>> addresses of the system in the "DPP" partition. Do you have any ideas
>>> about how we could access this from within the kernel?
>>>
>>> Regards,
>>> Bjorn
>> I agree with your point. I will add a module param in v3 for default
>> read-only mode. e.g.: /sys/module/qcom_scm_storage/parameters/allow_write
>>
>> For something like the "DPP" partition, I think it's better to access it
>> from userspace than from kernel.
> If it's a MAC address that you are accessing, direct userspace does not
> sound like a good fit. If I may, NVMEM cells are there exactly for this
> purpose: identifying the content of a subpart of a storage device in a
> storage agnostic way. The NVMEM cells are made available to in-kernel
> drivers (ie. network devices have all the infrastructure to get the MAC
> address from there) and their content is also exposed to userspace
> through sysfs now.

Qualcomm's SPI-NOR boot firmware uses a GPT partition table. The "DPP"
partition contains a FAT file system, and the MAC address is stored in
one of these files.

Because the data is stored inside a filesystem rather than at a fixed
offset, it does not fit well with the NVMEM model, which assumes simple
offset-based access.

Accessing this would require the kernel to directly read files from a
filesystem, which is generally not appropriate, so this should probably
not be accessed from kernel.

> Thanks,
> Miquèl

Best regards,
Junhao Xie

