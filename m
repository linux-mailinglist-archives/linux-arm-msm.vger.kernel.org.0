Return-Path: <linux-arm-msm+bounces-93883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFT2LJErnWmwNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:39:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA9A181B37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1194304E7CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF3C18DB35;
	Tue, 24 Feb 2026 04:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WPWbjnnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m15579.qiye.163.com (mail-m15579.qiye.163.com [101.71.155.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294A12AE68;
	Tue, 24 Feb 2026 04:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907981; cv=none; b=LM5UHMIzPe721kTHZA5AtJ6M1ZXMvrr3gbt2JnRfskROVfJDGDYnA0B/DAeWjJyQ8Q0pE2+6CY/FV9xRg9s3ionjfJgo30tTzAZPTuh5kZlZ3wVMSHflZ3jYg3hdxfldfrNpi99PbVwQ3l1eVzcwBahnG3yld5RfGGxOSY4VEYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907981; c=relaxed/simple;
	bh=sw7tWezUEjlzVVPU4rieZoQjVZSDETkAbioWUbWG+vI=;
	h=Cc:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BzD108twYnNaqznhdWVV7Rpm7XE/08yqT+3yTdW9mj8nAbx3g/cWRRUhu3BztBS9W9J8pL1hQl63X7sxuBtNLBpFbg9YT9cyeRrCfoWXMxTZt4frzlr6inwwMOP6TqzJUG5rDAa6q2ory+j41YdTxnb1RvRhSXlBVqV4Ueyf5c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WPWbjnnj; arc=none smtp.client-ip=101.71.155.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b44f50a;
	Tue, 24 Feb 2026 00:15:57 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <phasta@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
 <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
Date: Tue, 24 Feb 2026 00:15:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c8b4937c409cckunm8f51f82c98962b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlLGlZPQkJLT0tCGh5MTkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WPWbjnnjbzLg8XQAO7EVzoV3katKKHr6FzaB+u7EmNlbQTAWBq3qz9Ui8TQFJF2BRvSp0oOyu6Z+tx0Rol0o6YMXNIrZG3fDIPln8nNOGTVwulXzaejRTvZCqoJQPZksFTSFs1q6TDVWUjsYl1bQOauLxPjS4c/Z3y59FHvpvnw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6sDnERtWKN0yo+2JS4OKnCU7q/x1fS633xTB1pvqPtk=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rock-chips.com:mid,rock-chips.com:dkim]
X-Rspamd-Queue-Id: EBA9A181B37
X-Rspamd-Action: no action

Hi Jeff

在 2026/02/24 星期二 0:01, Jeff Hugo 写道:
> On 2/23/2026 8:55 AM, Shawn Lin wrote:
>> pcim_enable_device() no longer automatically manages IRQ vectors via 
>> devres.
>> Drivers must now manually call pci_free_irq_vectors() for cleanup. 
>> Alternatively,
>> pcim_alloc_irq_vectors() should be used.
> 
> This seems to break bisect.  Surely you should update drivers before you 
> go changing behavior.

Patch 1 introduces pcim_alloc_irq_vectors() and then convert all needed
users to it. Then the final patch(37) remove the implict IRQ vector
management in pci_alloc_irq_vectors(). So the individual patch for each
driver should be safe IMO. And if these patches go via a single
tree with acks, it seems unlikely to break bisect.

> 
> -Jeff
> 

