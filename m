Return-Path: <linux-arm-msm+bounces-91076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDVDB9Z0emmE6wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 21:43:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE78A8BE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 21:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A5EC300462E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 20:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A77C374720;
	Wed, 28 Jan 2026 20:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4cVWJAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D93374191;
	Wed, 28 Jan 2026 20:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632959; cv=none; b=WJEYhEey4vMOtfW1Xp9UJ/ihYHMSOi0awO4QayjlyET/6etej3qtyp8t+x+j1kAQDOMvggTCMwlFaDLHG6+wfwZ0OrFq1bob7DFJNnYRoX237sXmzwtM8RLnpn9DZ7kSHk3JSy7TWAGEZc2kV1ZAW8IoZKZGz0oYjD/lTuLd03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632959; c=relaxed/simple;
	bh=3SvQmj3H6Jb62dTRhDmtM8PEjbMjvKH4NPOreMNMOnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKC/wvPYr71NYwj1eMswM6ar7DQVUxsV8VfK7rQXXkDeuHBvoG3JgliSz+HyM/OSNJ6yda281Te6pA+ram9bTJk3Q2NcNfMeZPO1x3s9gbrZogOqiZ/F9srRAd0FQljdO8xXJPAjN7q61dfejx72gfagBt5mcQ4bE7uGtGPDIWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4cVWJAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63082C4CEF1;
	Wed, 28 Jan 2026 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632959;
	bh=3SvQmj3H6Jb62dTRhDmtM8PEjbMjvKH4NPOreMNMOnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4cVWJAdwkPn3MOumzQcjyVqc9f+Voa1lOlBE5bNijfUC6kAqYiw8IkntWpXMttBP
	 ZadO3E5v6CR4XbO/O+Vub5iLzE8bnAN/fCONMg7nPcytgGdUW4sKN4VBAwz7JfU9DY
	 FunYnre0MmowpBfiSBE5yZUzHgCyuTuQy90ZyJmqcScuusftGYA7qBitdVvYob0Uyu
	 v+IuGU6iyRdA3jWoTpG1t6jmxqc7H8optEbKe+8+TDDa6ql+4AyB7N7gWLpIvvN3jb
	 28X2pdfWNXEMY6j0ezkjo3uUFWHvPBVQmDyE9cQ1Z6XpspyKFjXeFSqx11uBT1U9sn
	 mwZDY0bDyLgAQ==
Date: Wed, 28 Jan 2026 14:42:36 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
Message-ID: <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91076-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,radxa.com:email]
X-Rspamd-Queue-Id: 3EE78A8BE7
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 07:44:50PM +0800, Junhao Xie wrote:
> This patch series adds support for accessing storage devices managed by
> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
> introducing a new MTD driver.
> 
> On some Qualcomm platforms, firmware or BIOS-related storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world.
> All read, write, and erase operations must be performed through SCM
> interfaces provided by the secure firmware. As a result, existing MTD
> SPI NOR drivers cannot be used directly on these systems.
> 
> This series introduces a new MTD device driver that exposes such
> firmware-managed storage as a standard MTD device in the Linux kernel.
> The driver is built on top of the existing Qualcomm SCM infrastructure
> and integrates with the MTD subsystem to provide a uniform interface to
> userspace.
> 
> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
> 
> Note that this platform previously used the standard Qualcomm Linux
> firmware, which allowed direct access to the QSPI controller without
> needing this driver. However, we plan to migrate to a Windows-compatible
> firmware which is more feature-complete but restricts direct access.
> Device tree changes for this transition will be sent separately.
> 
> If kernel boots with EL2, access to the SCM storage will be denied. This
> needs more investigation.
> 

Sorry, I missed your reply to me on v1.


You replied that this allow your users to update "BIOS" firmware
directly from Linux, which I can see being more convenient than relying
on UEFI update capsules, in particular in a development environment.

The concern I have with this is that I don't think an end-user of such
system, has a way to recover from breaking the content on their SPI-NOR.

As such, exposing such a convenient interface for the end-user to brick
their devices is probably not a good idea.

I think we should somehow lock the interface down to be read-only by
default, and perhaps have some mechanism to unlock the write mode (like
a module parameter expecting the sentence "YES, I DO HAVE THE FIREHOSE
PROGRAMMER FOR THIS BOARD").


I don't believe you answered my question regarding how to access this
interface from the kernel. On many of these devices we can find the MAC
addresses of the system in the "DPP" partition. Do you have any ideas
about how we could access this from within the kernel?

Regards,
Bjorn

> Changes in v2:
> - Convert enum qcom_scm_storage_result to macro definitions
> - Use __qcom_scm_is_call_available() instead of a machine allowlist
> - Add missing __packed annotations and endianness handling
> - Introduce struct qcom_scm_storage_payload to improve readability
> - Always compiled-in qcom_scm_storage_send_cmd() and qcom_scm_storage_init()
> https://lore.kernel.org/lkml/F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com/
> 
> Tested-by: Xilin Wu <sophon@radxa.com>
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> ---
> Junhao Xie (2):
>       firmware: qcom: scm: Add SCM storage interface support
>       mtd: devices: Add Qualcomm SCM storage driver
> 
>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  drivers/mtd/devices/Kconfig            |  17 +++
>  drivers/mtd/devices/Makefile           |   1 +
>  drivers/mtd/devices/qcom_scm_storage.c | 265 +++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
>  6 files changed, 481 insertions(+)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260126-scm-storage-v2-0a4f3e900b88
> 
> Best regards,
> -- 
> Junhao Xie <bigfoot@radxa.com>
> 

