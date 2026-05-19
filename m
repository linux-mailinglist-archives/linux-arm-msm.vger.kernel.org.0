Return-Path: <linux-arm-msm+bounces-108568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNJcCLOPDGqMjAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD745825F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 767A730039AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A138F3EA961;
	Tue, 19 May 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mkAQ+9qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB640961F;
	Tue, 19 May 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208112; cv=none; b=TMBQY4PN79CiaOJR31xzCplJLqUehkRpX9cOQ1RSLURlza/ofejONiUIswtxTeFcgrP8ZxA0HXZSWw0W0RFiupU8wVGpiVdy3AdbzbznhQvpexWvTDkQI1A2kU4QHqfa+YfZKQ+Qhq6z7xIfScsVP4CaljUcq3sBg8oncrQ/B7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208112; c=relaxed/simple;
	bh=FeiTM+7OVHfbYXfRZDgT8Q3Gkd/oBE3Iw726clnjCxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0yHcc6bdGY7s+a35R6HsPfGeV+2t9B/ZBrNjlr9PvHxtiiPXGGMI5IyajpPlxRS2qmSPJvH/qfTsv+IX2xbOS0eE9pl4QTkjh7I2N3gR0A9dLykJ4lhippjUr0dV9pkym1FixGFX7tJbJ6c9utJ/wNbwigjPFHmEJsboaT7pN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mkAQ+9qg; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=HEzVodalGePwQa0r0A0yc+dOQ9J8DF1f8pqfWHrsuSk=;
	b=mkAQ+9qgGabS1i8OItgzH9nPB22PSXb1+d91WzICOmsEtS/r6QFeeHtqKA1W5/
	m9VrN7fmFjkpo6vTEdLqaVrbjqtXsvmwIJodwhdIl3IMv7T2BavKmxqxify2H8uO
	PjyXtOG+aBdv1+ITi0wqxv/8WztCkfwZOUJRUZNCESIyk=
Received: from [IPV6:240e:b8f:91b3:d000:9130:b3d8:6241:39fd] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXEFBpjwxq6iYtCQ--.55083S2;
	Wed, 20 May 2026 00:27:22 +0800 (CST)
Message-ID: <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
Date: Wed, 20 May 2026 00:27:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify
 drivers
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 jingoohan1@gmail.com, mx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260509135152.2241235-1-18255117159@163.com>
 <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
 <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
 <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDXEFBpjwxq6iYtCQ--.55083S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr47Gw4rWF47AFy3tr43Jrb_yoW8uryfpa
	y3JF1Syr48XF4fXan2va1rZF4xt3ZxArWUZ395Cryavr9I9Fy3JrsY9ryYkF9rCFs2yr15
	uF4Yqry29r15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRiiSJUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAubP2oMj2sFdQAA3Z
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-108568-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0BD745825F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 00:15, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 12:09:28AM +0800, Hans Zhang wrote:
>>
>>
>> On 5/19/26 21:57, Manivannan Sadhasivam wrote:
>>> On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
>>>> The DWC PCIe core and its many platform drivers repeatedly call
>>>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
>>>> PCI Express Capability structure. This is wasteful and makes the code
>>>> verbose. And some even search for the PCI_CAP_ID_EXP offset value within
>>>> the suspend/resume functions.
>>>>
>>>
>>> Sashiko has flagged some real issues with this series in accessing DBI space
>>> very early and 'pci->pcie_cap' being 0.
>>
>>
>> Hi Mani,
>>
>> We have discussed this issue in the Cadence driver. I think it won't cause
>> any problems. Specifically as follows:
>>
>> https://lore.kernel.org/linux-pci/5823faec-d972-4c77-90ec-a215c686e0a8@163.com/
>> """
>> As per PCIe r7.0, sec 7.5.1.1.11, Since all PCI Express Functions are
>> required to implement the PCI Express Capability structure, which
>> must be included somewhere in this linked list.
>> """
>>
>>
>>
>> Bjorn also responded as follows:
>> https://lore.kernel.org/linux-pci/20260505212306.GA744158@bhelgaas/
>> """
>> It's true that all Root Ports must have a PCIe Capability.
>> """
>>
> 
> Ok, what about reading the DBI registers very early?

Hi Mani,

Yes. I have performed the DBI read register operation at the very 
beginning of the following code.


dw_pcie_ep_init()
   dw_pcie_get_pcie_cap(pci);

dw_pcie_host_init
   dw_pcie_get_pcie_cap(pci);


However, for some glue drivers, they need to configure the registers of 
the PCIe Express Capability earlier than calling 
dw_pcie_host_init()/dw_pcie_ep_init(). So, for example, in the file: 
drivers/pci/controller/dwc/pcie-tegra194.c. Here, it is necessary to 
find the value of 'pci->pcie_cap' earlier. Then, 
dw_pcie_host_init()/dw_pcie_ep_init() will no longer search for the 
offset value of the PCIe Express Capability.


Best regards,
Hans


