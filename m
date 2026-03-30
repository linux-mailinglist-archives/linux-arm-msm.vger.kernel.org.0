Return-Path: <linux-arm-msm+bounces-100700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLnlMnw2ymkx6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:38:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA63574DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD1B8300BE39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4A83AEF54;
	Mon, 30 Mar 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LsvAZ1Nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56E13AEF24;
	Mon, 30 Mar 2026 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859770; cv=none; b=hhA6unORdVhF1evFDBgZgcsP8JPwscwhcFspepFCQwvOB17W99HmZNuusdlNrktl3+wjFLy3aLAgvk8RIqewmYjw7ICpsTDXpBeTyjdY6CrJWjbqFqrqv3P7898PuyYsAScBvp9R1C6O5yMiUzk3CBG7bSbJiCtvKmmfqu2u3C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859770; c=relaxed/simple;
	bh=iHpY9fAXXIjP8wRbTiDeVHAB5cyvHsuMPHAh5cQ7ZiM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=shB4nXbF9cedalXYW23hmIMJZFMOhVkbni4dRCRjGXOV51iKWyyF4Po+9eHbQXyZ3DrJNKT05G0jpkzcvUykSmsTFozcrh31FJA0Pynz9j06ZV3XsIEb6KLmleR/I8KN+Byp1uuh86a7oiXg5YUcr6Sjl0hvxQNfeIzX+dKrnQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LsvAZ1Nf; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38ce06cc6;
	Mon, 30 Mar 2026 16:35:54 +0800 (GMT+08:00)
Message-ID: <e9e8495e-6674-1d8a-a55f-618967c9dbf8@rock-chips.com>
Date: Mon, 30 Mar 2026 16:35:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 3/3] PCI: qcom: Program T_POWER_ON
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
 <20260311-t_power_on_fux-v3-3-9b1f1d09c6f3@oss.qualcomm.com>
 <04fdfe0b-5867-0a94-75ec-44cec913756d@rock-chips.com>
 <6e843004-62ec-46e2-a7c7-5e0ad18d4954@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <6e843004-62ec-46e2-a7c7-5e0ad18d4954@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d3de29d0109cckunmd1408ba6e4d82e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlLSlZNThkeSkweGk9CTh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LsvAZ1Nf7zRa2Di/7Q73ua6eEdKQ/0r6Yrk51EYbjxkZYe8cjnKx+LUyWwCx0+sHTqq3KnyYiOR5QDo6fTc5MqDoET+t1YpgU/AiTCQSrbOZ44+JIUrG7FVFsE/QmyOPD/XnM4Q4iRwQvNq3sZkiXBxgX8iZLvkc9fqQvL2TH7w=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=JXSvhKyX5vdc6cd+UrhRNh4Cy38xxoLfH9FMX96t05c=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[rock-chips.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,kernel.org,google.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81AA63574DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

在 2026/03/30 星期一 16:16, Krishna Chaitanya Chundru 写道:
> 
> 
> On 3/13/2026 8:19 AM, Shawn Lin wrote:
>> 在 2026/03/11 星期三 20:40, Krishna Chaitanya Chundru 写道:
>>> Some platforms have incorrect T_POWER_ON value programmed in hardware.
>>> Generally these will be corrected by bootloaders, but not all targets
>>> support bootloaders to program correct values due to that
>>> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
>>> can result in improper L1.2 exit behavior and if AER happens to be
>>> supported and enabled, the error may be *reported* via AER.
>>>
>>> Parse "t-power-on-us" property from each root port node and program them
>>> as part of host initialization using dw_pcie_program_t_power_on() before
>>> link training.
>>>
>>> This property in added to the dtschema here[1].
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> Link[1]: 
>>> https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/ 
>>>
>>> ---
>>>   drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c 
>>> b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index 
>>> 67a16af69ddc75fca1b123e70715e692a91a9135..63d5628e988d3c07f42099c0d86e6b80fd54ce32 
>>> 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>>>   struct qcom_pcie_port {
>>>       struct list_head list;
>>>       struct phy *phy;
>>> +    u32 l1ss_t_power_on;
>>
>> u16?
>>
>>>       struct list_head perst;
>>>   };
>>>   @@ -1283,6 +1284,14 @@ static int qcom_pcie_phy_power_on(struct 
>>> qcom_pcie *pcie)
>>>       return 0;
>>>   }
>>>   +static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
>>> +{
>>> +    struct qcom_pcie_port *port;
>>> +
>>> +    list_for_each_entry(port, &pcie->ports, list)
>>> +        dw_pcie_program_t_power_on(pcie->pci, port->l1ss_t_power_on);
>>> +}
>>> +
>>>   static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>>   {
>>>       struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> @@ -1317,6 +1326,8 @@ static int qcom_pcie_host_init(struct 
>>> dw_pcie_rp *pp)
>>>       dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>>>       dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>>>   +    qcom_pcie_configure_ports(pcie);
>>> +
>>>       qcom_pcie_perst_deassert(pcie);
>>>         if (pcie->cfg->ops->config_sid) {
>>> @@ -1759,6 +1770,8 @@ static int qcom_pcie_parse_port(struct 
>>> qcom_pcie *pcie, struct device_node *node
>>>       if (ret)
>>>           return ret;
>>>   +    of_property_read_u32(node, "t-power-on-us", 
>>> &port->l1ss_t_power_on);
>>
>> Ditto?
> the property has -us and doesn't have $ref to indicate if it is u32 or 
> u16, by default it is u32 property only.
> can we can't keep it as u16 even if have always less than u16.

It came from dw_pcie_program_t_power_on(u16 t_power_on) which
take u16, so the value will be truncated anyway. Well, it's up to you,
just a bypass comment. :)

> 
> - Krishna Chaitanya.
>>> +
>>>       port->phy = phy;
>>>       INIT_LIST_HEAD(&port->list);
>>>       list_add_tail(&port->list, &pcie->ports);
>>>
> 
> 

