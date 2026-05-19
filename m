Return-Path: <linux-arm-msm+bounces-108571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHPEHsqVDGp1jAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:54:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CD582ADA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0368A30391EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2D2367B77;
	Tue, 19 May 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Xu0Xi0jk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9D367B60;
	Tue, 19 May 2026 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209636; cv=none; b=FMNB4zLObjW45VGwATA7Y9RNpEYF9QhCFzCj4uE52wTm6vFIL87yURktpwf0p3FwUyW+wr3FeEhWEaXUHiE4DrQnIIB1XrqjnDaWsrgIXuCHlKK/QTzlY4LIGtWIqlGGN8p9kPmsUOwl9YdKWoC0oOJNUy81PqVKrU/yZiHMzkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209636; c=relaxed/simple;
	bh=APX+21Lmcl1UqcTu1hL6sOJ0l3RM58jeHQWgsDXqq9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXuPU/0UnV23skhd3PGDZobmwzaVUYPQYtZFpwjXLNdBEYO1mR3fFxZ3VduHsqG/spN0qnwrgANw5hoIJzQXVWuupy+TqbIY9jaz5dZel225pAUgWpzpCkbSh2crQVG5E7y7kuxzBDAf1b7n3y5Zfk6C79903aYEALCxTHJidn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Xu0Xi0jk; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8sTqgK7mp+Unp9Wpw9+a9pZzPmJnG02xCCH/x+as8c0=;
	b=Xu0Xi0jk2I5naAv7BW68F8wp+zf1WAfWvdPqJpYEhtBNnvKKpsM19fbiGRrZPS
	F4gw7ba0Z9JxW9iVOQ/J8DKU643Vejg2Re33hDXOK5KpZquw7itTVc+DsmEKjzR9
	6MmRfJR7mRKX3hFEotycCpHiXhM1D+4enlNArWgobDb24=
Received: from [IPV6:240e:b8f:91b3:d000:7f44:7c72:8a1e:7e64] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCHGflilQxqMA8gCQ--.43458S2;
	Wed, 20 May 2026 00:52:51 +0800 (CST)
Message-ID: <e0c89a4a-709e-42c6-ad1c-7ec50cc5790c@163.com>
Date: Wed, 20 May 2026 00:52:49 +0800
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
 <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
 <m332ocvmmdzcgnzmzxmbn2nmczxuhplt5efh64fd22fagrot42@x3okixj5qjb2>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <m332ocvmmdzcgnzmzxmbn2nmczxuhplt5efh64fd22fagrot42@x3okixj5qjb2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wCHGflilQxqMA8gCQ--.43458S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr4rZw1kKFy5Gr48Xr47Jwb_yoW8uFWDpa
	y3JayFyF4UXF4Iya1Ivw48XF4xKasxJry7Xr95Gry5Arn0vF1rJr4FvrWYkF9rGrWvyr1Y
	vF4Yq3429r15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRMrW7UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AQcv2oMlWSKKgAA38
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108571-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 386CD582ADA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 00:49, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 12:27:21AM +0800, Hans Zhang wrote:
>>
>>
>> On 5/20/26 00:15, Manivannan Sadhasivam wrote:
>>> On Wed, May 20, 2026 at 12:09:28AM +0800, Hans Zhang wrote:
>>>>
>>>>
>>>> On 5/19/26 21:57, Manivannan Sadhasivam wrote:
>>>>> On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
>>>>>> The DWC PCIe core and its many platform drivers repeatedly call
>>>>>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
>>>>>> PCI Express Capability structure. This is wasteful and makes the code
>>>>>> verbose. And some even search for the PCI_CAP_ID_EXP offset value within
>>>>>> the suspend/resume functions.
>>>>>>
>>>>>
>>>>> Sashiko has flagged some real issues with this series in accessing DBI space
>>>>> very early and 'pci->pcie_cap' being 0.
>>>>
>>>>
>>>> Hi Mani,
>>>>
>>>> We have discussed this issue in the Cadence driver. I think it won't cause
>>>> any problems. Specifically as follows:
>>>>
>>>> https://lore.kernel.org/linux-pci/5823faec-d972-4c77-90ec-a215c686e0a8@163.com/
>>>> """
>>>> As per PCIe r7.0, sec 7.5.1.1.11, Since all PCI Express Functions are
>>>> required to implement the PCI Express Capability structure, which
>>>> must be included somewhere in this linked list.
>>>> """
>>>>
>>>>
>>>>
>>>> Bjorn also responded as follows:
>>>> https://lore.kernel.org/linux-pci/20260505212306.GA744158@bhelgaas/
>>>> """
>>>> It's true that all Root Ports must have a PCIe Capability.
>>>> """
>>>>
>>>
>>> Ok, what about reading the DBI registers very early?
>>
>> Hi Mani,
>>
>> Yes. I have performed the DBI read register operation at the very beginning
>> of the following code.
>>
>>
>> dw_pcie_ep_init()
>>    dw_pcie_get_pcie_cap(pci);
>>
>> dw_pcie_host_init
>>    dw_pcie_get_pcie_cap(pci);
>>
> 
> These both calls will cause crash on a lot of platforms because these will be
> reading the DBI registers while the resources are not enabled.

Hi Mani,

Next, I will check all the DBI register-related issues. It will be fixed 
in the next version. Thank you very much.

Best regards,
Hans


