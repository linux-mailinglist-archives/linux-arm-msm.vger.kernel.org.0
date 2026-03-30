Return-Path: <linux-arm-msm+bounces-100683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGzyB4sxymkA6AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:17:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98C356FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A19713004626
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002F53A2579;
	Mon, 30 Mar 2026 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b49kfNke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKw8utNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F07C37C92A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858619; cv=none; b=EmIgkBjkyA1EcqGFGQJbmJ9FJ3K3jFMCpov+if6rBbjQVwrfy5RMscSjFrpKSfHd243Psk0mb9Z1DuhlyxY8C4NQQCQQBmnXBUMFPtICkFyQwxoFFZDzWeoXaVorx+xKtWhsnpIKAuYu02vZsB+jMeGdSZ6/CYqvQ1lmWHDgXGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858619; c=relaxed/simple;
	bh=xDHNMwUarD4/IFRYAxF0A0jOcLNBFoAcxyEwKWzzDYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYueC5kfs3A+WRi3dDV5ccRGFO1XgGrwtgW+ds4T154fHYlVjBobjxnv+SbC66BQgZz8ydCYVm6cw+QR9dXf5Rz4WTllp0ezjjVaabvRb9O9glyPTf1QMKfkXNS3x2J6Cx3vzk+VMuonBUV6AAb0QDhU4E7cHbgmU3PcgsfFGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b49kfNke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKw8utNr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4Aj4g812878
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4SlIIe0Yv6128iZ/AbQ/BWaZIoyvY16Ez6z84/Mszk=; b=b49kfNkeI7A7ncDq
	eOhKf32tL19D+CJNVdulqKqAHOGKTAEI6sG8sPLaYk1Y6WJ/Mh5TIWioObX5bsG/
	KD//IfvLk4HpPYyECLJ3kFzLnFltUWkwxZz5HzcCIpamAr7G24q1gsaspCrRxOb5
	Th7aZn3syZ+2CGS7gvdU2vG5Guc3IzvPeKIVfQj2NIdfOGvhgrdSbEbVu/VaT7C3
	3Tz1x5S4Q1S3jx+uT57wEEHYSqJbiOyPglOrat/6AAynyzxGW4d3GVxplVLKvr3F
	wNll/ppNCsfkm5cHsR9JsfcjEdLBW0N2ne8ghHdSkWadqBXZ7egzgZL9OYvGIN3q
	siYc1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7d5kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:16:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0b57e192bso34271355ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858616; x=1775463416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4SlIIe0Yv6128iZ/AbQ/BWaZIoyvY16Ez6z84/Mszk=;
        b=NKw8utNrYpc7Vq2KzjfOsLcrQAXT31fJmHZjnuCHDm1ooNje5uh2sNzarTM+uiG3IT
         1bYOWIvHIMVS1ewGxdgZI4svkWNuEu6SN0RKjyi2DQFRY7iWBo1AHvOgDFR/e1s9LhVC
         VV9Gi5f0S+F0tTfFPLfNOLASrnGSy7Ia9l1UmqkLUURiE8IrHmuOGvJNFM2tXwsJ9yAA
         5mw7iAa4BSyQPWgc5xoHdau9IC0HUy7RCxmVEf6YfKYBMWUF5vcd7CJstyRQgzyM+VSs
         otrvmZYA/7X2dfv2CxmQWQxPllgn2qLZ6xoqPRwuMwojlQOEgrE/hiuivrPVd/wYOZ2N
         xMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858616; x=1775463416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4SlIIe0Yv6128iZ/AbQ/BWaZIoyvY16Ez6z84/Mszk=;
        b=O/xS5X8Jqr3hRzY3HQ/qNnK06Xh7bmA5RfmbVC5JVuowUMiObXP0VPqCtVDanOOKgh
         kDZaDQZ+ZUq6DiPNmPJSRi2UHK1fEKZGHQkH1nEsukcPMoQFukGwtcFQlDK4yQkjZ018
         l6KDTeOercNju2wCkfkQ2kNRZgg64CaLLBsNweGa/IFEQgBjZyG5PFPyTMvIHuCyCq+g
         ZGBEWJqb9CvqI74D9RmKoyn7P3zGLdyCT9njzOIsrfc+cfMq2rJZoyblGdVU51eR1xul
         4rWkf2fK530dMd4kxbKdUVP4rbfl9BJZm4UBUGJKQnTssz34H4Rnv5HMIGPfDclDOG1B
         GL7w==
X-Forwarded-Encrypted: i=1; AJvYcCXWY7o2Gbh2UIUYjxDIz+FXeDLm3ayfC/j5zOpAJ9WsKN8FhdMnGOg8jo88JKVc5QFouYaT2PdoypvxRUcj@vger.kernel.org
X-Gm-Message-State: AOJu0YzuA3lK6/b4QFJZxlBod3orb1yvsUHk/FtXRrE+99r/8Lufy0yf
	aeVFHqoS4FaKL6iJLREdAVAEedrYzXMyv5y+TZsztLo9kyTRX8PYlqsfEPyuyWWw+EcDIzVqzbs
	1HO60O4IH3GrtCN5RNlX4W/4TvK6BqIskqOHv8P2afcfZ9YiSFxMQHxk9htBkBpzdf7Uo
X-Gm-Gg: ATEYQzwmwL/HUPjXldoybc722H4XQnXEy9/v4vE4hnU9D89bjthDZ1EtxlEONx9XpsT
	Yj+lXyJi6UCpt4JPdcf0ChsICS4TY/0hffmEs2+ZBQeippcKgevGwjxEuHY0tGHhtiCj/XkCetV
	f915cfpCs44yiWGskalQCJos0YFgkO6g8/UDgnvbTh1/gRFQofKybPKu+kC8vPupviPRAwnXB73
	3/MCKcxjDR8DZ21e0P/ngyNzFhi3joag2VjQ7At8+aGJOMn2VCLV8ZHxqxe4m02EFq48KmdQ4Cm
	fMGX2qRY5/0D2zkilJLpfCWY01RczQh3O05VNSEnMUofMUCcbOwra4YHLVEHnsZSeXP/gxsvXjH
	K0m1V71BdESCw7AxyK9p6cyI5AH1uoWFnNCcKg3xxNsA1tn9mklv8WA==
X-Received: by 2002:a17:902:c40e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0cdc3ab90mr128223305ad.12.1774858616499;
        Mon, 30 Mar 2026 01:16:56 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2b0cdc3ab90mr128223005ad.12.1774858616016;
        Mon, 30 Mar 2026 01:16:56 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c5339sm73986605ad.79.2026.03.30.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:16:55 -0700 (PDT)
Message-ID: <6e843004-62ec-46e2-a7c7-5e0ad18d4954@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:46:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: qcom: Program T_POWER_ON
To: Shawn Lin <shawn.lin@rock-chips.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
 <20260311-t_power_on_fux-v3-3-9b1f1d09c6f3@oss.qualcomm.com>
 <04fdfe0b-5867-0a94-75ec-44cec913756d@rock-chips.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <04fdfe0b-5867-0a94-75ec-44cec913756d@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca3179 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HIfOsU49naKVPb5QdBEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UT-8Teo-eXG2ZsZXSybd0Mm4wPJMCzDk
X-Proofpoint-ORIG-GUID: UT-8Teo-eXG2ZsZXSybd0Mm4wPJMCzDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NCBTYWx0ZWRfX7sm7myLky04h
 T1HT8jJjEi4K48PN3mCwvLOzCF0YeE75STE+fC9GtBzxDsWv2OycBygZIevjJ456K+rk9OkgqwE
 2M1ZBiypdeQAGqZ+5bw+naoXzJQg6yKKkeKUwC44rmbhKg9GdXjtrC+lTlVr1nhoFeQcmSgy3Ox
 PvxdSQ8bRA5Vj/OjfzmppiKKUAdBMh1x9TaM5p2RLNFAdcmHmZI0zT4DBnGhS2854IA2x2/kkBD
 PIEg8CJiTj1Z0dh9gO2nnlbACGSg9SjqtJ9czNyDeAvnk5EnTnp/+vdzLF1c31GbzCmu+h7Mjpl
 gNWPyqksUn3KPLYdxvxuKLIHQXll/7IW4M+4f8ws5oYW56ew1vwzNmiv9HTH8ln6ZPpIl6aHXv0
 XnkAxAQSTr8CTIdiBpu/YNGXvL+EwotuO9ggK9YRoxeA/N19gkiwNByU0YSq8JyvV9mm7y9hGaJ
 mq0JQBzk1FbuUwxRadw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100683-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[rock-chips.com,kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E98C356FC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 8:19 AM, Shawn Lin wrote:
> 在 2026/03/11 星期三 20:40, Krishna Chaitanya Chundru 写道:
>> Some platforms have incorrect T_POWER_ON value programmed in hardware.
>> Generally these will be corrected by bootloaders, but not all targets
>> support bootloaders to program correct values due to that
>> LTR_L1.2_THRESHOLD value calculated by aspm driver can be wrong, which
>> can result in improper L1.2 exit behavior and if AER happens to be
>> supported and enabled, the error may be *reported* via AER.
>>
>> Parse "t-power-on-us" property from each root port node and program them
>> as part of host initialization using dw_pcie_program_t_power_on() before
>> link training.
>>
>> This property in added to the dtschema here[1].
>>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> Link[1]: 
>> https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c 
>> b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 
>> 67a16af69ddc75fca1b123e70715e692a91a9135..63d5628e988d3c07f42099c0d86e6b80fd54ce32 
>> 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -269,6 +269,7 @@ struct qcom_pcie_perst {
>>   struct qcom_pcie_port {
>>       struct list_head list;
>>       struct phy *phy;
>> +    u32 l1ss_t_power_on;
>
> u16?
>
>>       struct list_head perst;
>>   };
>>   @@ -1283,6 +1284,14 @@ static int qcom_pcie_phy_power_on(struct 
>> qcom_pcie *pcie)
>>       return 0;
>>   }
>>   +static void qcom_pcie_configure_ports(struct qcom_pcie *pcie)
>> +{
>> +    struct qcom_pcie_port *port;
>> +
>> +    list_for_each_entry(port, &pcie->ports, list)
>> +        dw_pcie_program_t_power_on(pcie->pci, port->l1ss_t_power_on);
>> +}
>> +
>>   static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>   {
>>       struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>> @@ -1317,6 +1326,8 @@ static int qcom_pcie_host_init(struct 
>> dw_pcie_rp *pp)
>>       dw_pcie_remove_capability(pcie->pci, PCI_CAP_ID_MSIX);
>>       dw_pcie_remove_ext_capability(pcie->pci, PCI_EXT_CAP_ID_DPC);
>>   +    qcom_pcie_configure_ports(pcie);
>> +
>>       qcom_pcie_perst_deassert(pcie);
>>         if (pcie->cfg->ops->config_sid) {
>> @@ -1759,6 +1770,8 @@ static int qcom_pcie_parse_port(struct 
>> qcom_pcie *pcie, struct device_node *node
>>       if (ret)
>>           return ret;
>>   +    of_property_read_u32(node, "t-power-on-us", 
>> &port->l1ss_t_power_on);
>
> Ditto?
the property has -us and doesn't have $ref to indicate if it is u32 or 
u16, by default it is u32 property only.
can we can't keep it as u16 even if have always less than u16.

- Krishna Chaitanya.
>> +
>>       port->phy = phy;
>>       INIT_LIST_HEAD(&port->list);
>>       list_add_tail(&port->list, &pcie->ports);
>>


