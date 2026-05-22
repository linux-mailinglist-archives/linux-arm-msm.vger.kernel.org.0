Return-Path: <linux-arm-msm+bounces-109364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA4cBnd/EGrdXwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:08:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A99415B75FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A615B301726C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D1345CC0;
	Fri, 22 May 2026 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oinMPgCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65232C031E;
	Fri, 22 May 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465923; cv=none; b=q7Wx7CYjHJ+XjYYSkGW3m9V0sYLfUWZl2UiVblG4JGLptWjPW6nYyWqHU6XjHUsdcDK3ukLhQgNDHzqIh8W0yWNSFVhLa9vKUojxmaAi44/5b2y+FUVrQm5RzmM55uBVTo1lcL+iBO1/CCKe1Jq1uh8rRPgdIWP9NV1bxtvU2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465923; c=relaxed/simple;
	bh=eDwpnAyDGcw40KTsgu7nsZAQ9Qp628d2vr1Fs9hMH7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzinEID+gryOqF004avWAkUulzZA2EKMK+D0p/Rub9TmBCignEv67DKrDwHwKPPjs//41RtBqlEBJlxY9j5k8OgwwBJrtDRDZu7/TusKNv0UPYSk6YJLnf9Xn0dhJc44OdWMn4Cx7OeVUyhpeGD7x44N1PFjiYfJjmaqT1y61Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oinMPgCh; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ITf7KktGLbSDnXpQlgu6YR/GMDEIJ07ZRAIMb0e+JUs=;
	b=oinMPgChun1Q8pHKMsUw7O6Ts6sSLkljCso/fGRETJlCrCWYKuUrh5jt6+QLet
	wCrZZsaQw81O35ddeXhyAgPV5kLwhQokrIiLeEvdINCX7+mp255mfLQYW4BKUZVI
	U+Par40HllVYF3BAn4GMFQYysZcIet5w1OF+/kS/aAIeU=
Received: from [IPV6:240e:b8f:91b3:d000:1df1:2c6c:16c1:e8bf] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCXFlhyfhBqmV1DCw--.21621S2;
	Sat, 23 May 2026 00:04:03 +0800 (CST)
Message-ID: <09473fc7-e91c-4e80-9d64-0d14d585d89d@163.com>
Date: Sat, 23 May 2026 00:04:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] PCI: Introduce pci_suspend_retains_context() API
To: manivannan.sadhasivam@oss.qualcomm.com,
 Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wCXFlhyfhBqmV1DCw--.21621S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZry5AFy8Jw15AF18Kr1kuFg_yoWrJw4Dpa
	y5KrWSyr1DJFWIyFnavw1jvry3uanYkrWUC3srGw15uay3uFnagr4jgr4Yqry7ur4fC3ZF
	vr4jga4UuFn8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRV6w_UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xVb-moQfnU7hwAA3W
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109364-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: A99415B75FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mani,

We previously discussed a patch. I wonder if you have any memory of it. 
I'm not sure if it can solve my problem. As shown below:

https://lore.kernel.org/linux-pci/z4bq25pr35cklwoodz34pnfaopfrtbjwhc6gvbhbsvnwblhxia@frmtb3t3m4nk/

"""
 > Hans: Before I added the printk for debugging, it hung here.
 >
 >
 > I added the log output after debugging printk.
 >
 > Sky1 SOC Root Port driver's suspend function: sky1_pcie_suspend_noirq
 > Our hardware is in STR(suspend to ram), and the controller and PHY 
will lose
 > power.
 >
 > So in sky1_pcie_suspend_noirq, the AXI,APB clock, etc. of the PCIe
 > controller will be turned off. In sky1_pcie_resume_noirq, the PCIe
 > controller and PHY will be reinitialized. If suspend does not close 
the AXI
 > and APB clock, and the AXI is reopened during the resume process, the APB
 > clock will cause the reference count of the kernel API to accumulate
 > continuously.
 >

So this is the actual issue (controller loosing power during system 
suspend) and
everything else (ASPM, MSIX write) are all side effects of it.

Yes, this issue is more common with several vendors and we need to come 
up with
a generic solution instead of hacking up the client drivers. I'm planning to
work on it in the coming days. Will keep you in the loop.

- Mani
"""


Best regards,
Hans

On 5/19/26 16:11, Manivannan Sadhasivam via B4 Relay wrote:
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
>    L1ss exit latency
> - Rebased on top of v7.1-rc1
> 
> ---
> Manivannan Sadhasivam (4):
>        PCI: Introduce an API to check if RC/platform can retain device context during suspend
>        PCI: Indicate context lost if L1ss exit is broken during resume from system suspend
>        PCI: qcom: Indicate broken L1ss exit during resume from system suspend
>        nvme-pci: Use pci_suspend_retains_context() API during suspend
> 
>   drivers/nvme/host/pci.c                |  3 ++-
>   drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++++++++
>   drivers/pci/pci.c                      | 34 ++++++++++++++++++++++++++++++++++
>   include/linux/pci.h                    |  9 +++++++++
>   4 files changed, 57 insertions(+), 1 deletion(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260414-l1ss-fix-6c9cf2451944
> 
> Best regards,


