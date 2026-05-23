Return-Path: <linux-arm-msm+bounces-109482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p0ZrGwSREWrRngYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 13:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B85BEB6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 13:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9535E300B529
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9829336D9F9;
	Sat, 23 May 2026 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVb5q4AE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC0D35CB60;
	Sat, 23 May 2026 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779536119; cv=none; b=URmO2sEh0vLZ8/SHZpO5koROhVgGbO87P7seQm/Uz6xDCw8JqdpAriznCcbQn2BK7/obFuo0ZT3v+xyjxjZFjMK791Gw1aRJKnVUV/RwEG8YTYmfacvRhcXn3P2ho0teGEM4MbzxLzFtx+ZDR/DiEeW6mJPza6GKcBxy4mFHIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779536119; c=relaxed/simple;
	bh=Ia5qu7JlVeB1yS0IcTI8hPbZjz+t5BWX0+6NYa+/BBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HAo/53ePLD76MOJMYt5sFfIVmrKteSC6YUpk9btwDxDK8qqxAKRJgjrG/a/fjEmIfDzQGij5ZrXgLLVIyFIEfM8q93JTZ2p7OKs8Pu3kT4tC5ymN3x1W4Y873mUdkPmjCGqNBwQa04fb8mrdf2/m1nSIckjNDu2WtzxRAJHS6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVb5q4AE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C14331F000E9;
	Sat, 23 May 2026 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779536118;
	bh=o6BvjvS8rBGHZfEK/Y2a9oFckQ5H1gJo6XVFIye7120=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=MVb5q4AEA8UmYtvooBwsMHlyw5RBbHG0GAKY43VRV44Y00vqACu7wloCvRO4n4iQ6
	 8rpEU0BcS3OBEMkMxux9nbuqdismvmSx5f0d9aoy8LXj47JSbi+iH0rx/tuJPMvTvB
	 nJSQn+sssQMWaQoSGSWVzyCkYqeaYSpR7J4ZlhfZ5FqDTqYTP66LLTOyFdbU1Ltf8+
	 8V1IAhmNejY5pFol/POpfEER8Jz5zMWOT4mz6nZiNlTcTJNKJ9a8dr3SoVOShwjZ3w
	 Ncxm3Fp1WwOYhh4/RVDUIk73mZK0039qDLWmjsvAqhYB6gm3auukD8tdOKrYRBARRB
	 NB0cq3pm6cdZw==
Date: Sat, 23 May 2026 06:35:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 0/4] PCI: Introduce pci_suspend_retains_context() API
Message-ID: <20260523113516.GA292297@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109482-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 5A2B85BEB6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:41:19PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi all,
> 
> This series introduces a new PCI API, pci_suspend_retains_context() to
> let the client drivers know whether they can expect context retention across
> suspend/resume or not and uses it in the NVMe PCI host driver.
> 
> This new API is targeted to abstract the PCI power management details away from
> the client drivers. This is needed because client drivers like NVMe make use of
> APIs such as pm_suspend_via_firmware() and decide to keep the device in low
> power mode if this API returns 'false'. But some platforms may have other
> limitations like in the case of Qcom, where if the RC driver removes the PCIe RC
> resource vote to allow the SoC to enter low power mode, it cannot reliably exit
> the L1ss state when the endpoint asserts CLKREQ#. So in this case also, the
> client drivers cannot keep the device in low power state during suspend and
> expect context retention.
> 
> And these limitations may just keep adding in the future. Without a unified
> API, the client drivers have to implement their own logic which may cause code
> duplication and may also lead to drivers missing some of the platform
> limitations.
> 
> Once this series gets merged, we can extend this API usage to other client
> drivers as well.
> 
> Testing
> =======
> 
> This series is tested on Qualcomm Hamoa based Lenovo Thinkpad T14s latop with
> NVMe drive.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Changes in v2:
> - Renamed the API to pci_suspend_retains_context()
> - Reworded the commit messages to include L10_REFCLK_ON + T_COMMONMODE as the
>   L1ss exit latency
> - Rebased on top of v7.1-rc1
> 
> ---
> Manivannan Sadhasivam (4):
>       PCI: Introduce an API to check if RC/platform can retain device context during suspend
>       PCI: Indicate context lost if L1ss exit is broken during resume from system suspend
>       PCI: qcom: Indicate broken L1ss exit during resume from system suspend
>       nvme-pci: Use pci_suspend_retains_context() API during suspend
> 
>  drivers/nvme/host/pci.c                |  3 ++-
>  drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++++++++
>  drivers/pci/pci.c                      | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/pci.h                    |  9 +++++++++
>  4 files changed, 57 insertions(+), 1 deletion(-)

Applied to pci/pm for v7.2, thanks, Mani!

