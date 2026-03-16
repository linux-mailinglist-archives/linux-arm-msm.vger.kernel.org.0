Return-Path: <linux-arm-msm+bounces-97944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD2MD/z1t2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:22:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D309F2996DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36DD630107AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EFD3947B3;
	Mon, 16 Mar 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw7STTLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6EyrDoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15A355F41
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663738; cv=none; b=hpvD2OGzPn+v2mFilQtsJ5TtRkFZVwTWgt57LYa0vHEa+682i9aELFjKTGyG3E6Bry5wzupLW6fpQ+nbV1wXieg/AXLGWxi/8/o7245QA58EDAViYNSCJbgWG7Ffmhji/tIQ9Z9xfpiM4kjus7wkcDrhWv77PRm5cE0Q+PUaG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663738; c=relaxed/simple;
	bh=HiiAm8Ora0mp19tzLyYJgj5FHJ+Q4afMRgLHqhHi8eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqHLDaDDJo0gpW+4kr5zZKfjDVv2Mu85K2X15+naDPjiGg+Giin6entwBnJSiuHlu/eCLEMdGapAbKJhO1kKc19H035nwAHo++UqwCbvwbbtKrPgOo9TfYLVXsykyqRtyxjLF9DroItd53nKgWUS62CickCMZBeOyrowt5xGZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw7STTLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6EyrDoa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBkced323597
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5jZW70c1mVu3dGOsuxOxRHHZs/ZTHfG90z3TOkm9iQ=; b=Iw7STTLUwaBIO1/i
	dndqZlJFI3uEki3y98pSISAJTlHe0+wvcxbyYVkvB9C1TTMg3YybBjOLuPyry4s8
	TfWHxVHlgK2orMb9fLKb4PR0/rP4mNqh1stAwusurKowZs8gCtueeGc+T5jQL9LL
	ROGSnDfgiU8ITIuNwk6lIrFI6NTd52+o2jYrvSKF8x60I7VFwGYM5+/te0012UMQ
	xXPE1elaxJQ1xyZWQOhqQfECgxslvtB1qAtGTJQtk4sw8rvwqiSqhEVAzY9RWJob
	P7rf9L9c6hMJDBIFhj/+rhVxYhUduxnkJtF0kVLuybTMryh8VZPkaOkGRZhCIf7L
	bZuWPw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qntqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:22:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73887d0297so2499298a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773663734; x=1774268534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5jZW70c1mVu3dGOsuxOxRHHZs/ZTHfG90z3TOkm9iQ=;
        b=g6EyrDoanfhOIDSxhIL/RltVOyzhVNMNMAgM/5UdipKTLPJiHspK/U30EZDFhDgNz6
         fJmf4RBPoWyKck2GAMDdUeW6A+Zub1U0tUr8HnsQB08+H99Yfjgz/za2eUKrV0K35gsA
         gZR5hwf2zogVm6bAlkn48ctC2n5let08arV1Wy5fXx8FUfgi0cdICurILk+TeZskxX5b
         6VgfkAcZiF74ejNmZLeKZHZR0+AdkBIAsmwbgljtiPsZmWtXbtQIYbvXPC5Zu5FQAFHR
         bc56rDD5a5hlHYsB1O+nHoo8DrQ5ZsZhh5bywjQEGR1KYDMfedkcnomCAIiX3n+nX6nt
         WWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773663734; x=1774268534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5jZW70c1mVu3dGOsuxOxRHHZs/ZTHfG90z3TOkm9iQ=;
        b=i1LTUfAR/aCobMJhDUDjEechlZg1zmJGsC4k+VDTWisrPoPqAxVQRxtjdJ3nd1HdwK
         SWVBxmeRUdHGeTcBTNanoUPA3SGl4dC0YM1H6T7nSLRZOP5N+VgpWdGyatNq5WiG/E6g
         hq+Tbawjl8t8HGiP/VFSNJm/TwkMJk3G66x7EV2sGP+QJLptsAgj+VlFLB0j5rQRiQwb
         jTQ9IbHnft+Q2ATU1uGXhINAl/irX5sOrHtYUwgD2rXGdrjOV2mcoXl8mA+TSgyI88VD
         v/dWQ8OixmdH4RIUUpL6Ojkzl2lNnJQPExdoooYy9RbLPHL+70xOCimJhgcvhfwm1FuC
         n/lA==
X-Forwarded-Encrypted: i=1; AJvYcCVgjEsc5ZYK0eTbhlQ6BXG9D5BdnIJmIoaN9WUwy7hVyQRZc19FuJCiY6fHYKfLVW1wTaG6AGihbu9FFppP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Sl16/hWumFUh1mYyydPGiTDVsx15byN7YVk6GE30ufAbDdoV
	SI2Y9+86Q3FZMP0ShpoGcEk9xlOvYkgeej8u8hPe2w4N/wxEU+R9v1w5eiJD92CjafLQSS6EpGe
	j3kX8r0O8l0Mvd23/EuYuVfV8ntwI//cjFisyOeU/mdmquiSqG3EfOp2IrvpPI52ujHo0
X-Gm-Gg: ATEYQzy4svBNjejZ+4SWu3kMNG5+pE6bXX34ZUwyX1dx57BVOKNudYZLcl4n9OewhHr
	wFdQlF59Fz3dZn88k0Hd+1ko6WafVhy6aJBN1yaw8ZkC1Mm8N52ISAcK75cGMakKasH3FWKao7g
	9E9p/Acl8H5r01txTWNPlKItBH24cavIIPNBb+WG0+wDtQYQxplgdki64UTb+I123+4+7g5/Vcp
	sUplHtBpn52N/zc3R8K1UBXGZt6Z/uKTYxsUhIaj1TLlx0uX4ozb1AhKlIx192l8ipzTzN2ciV6
	+gE1bOj3ApLqgwP6OkVRCcHSxxkvRseIzlwwlLfvEV8VbtlGDiWtamkwfPpguFH4tAkAVAA+8fe
	zHIsuDsqBSh6J2ZD3FvcI8UvZcNO5Z5qeAHsiX8isY/qTg5Bs+DmV9g==
X-Received: by 2002:a05:6a21:3981:b0:398:80a5:8bf4 with SMTP id adf61e73a8af0-398ec9eb7eemr11219964637.10.1773663734354;
        Mon, 16 Mar 2026 05:22:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:3981:b0:398:80a5:8bf4 with SMTP id adf61e73a8af0-398ec9eb7eemr11219931637.10.1773663733841;
        Mon, 16 Mar 2026 05:22:13 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb649a8sm8896693a12.18.2026.03.16.05.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:22:13 -0700 (PDT)
Message-ID: <015d00db-9ed5-45a7-83f8-1b10bc2ee457@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 17:52:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
 <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gmt-bn7VfA94f1v_Xwxg1Fl-LXRQnpfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NCBTYWx0ZWRfX3fuNsVNK88DM
 W9BOnp0B6cbx4sBktFhcMfnUFbhYLgAsWFcps511J93SNYBbS5X+lbzPO8Tq3Uf+vRXzCD/c7Gi
 YESOAyab/YUbmAGvYYPDftMbyNdgatUO3YOKeS5YPQho6/lL/3gMmIJ+fUEZNRoGzOjmOlDjjNw
 U5DCto7x2k07FnQOEIntogzCOKyZcuWGGHokcd2aBbusi1InDfJO/QqxmwVIrJCgUzbZzw9vfVq
 jeTUuuy/BZQcjqOFEwgG4pKXgbndZbLJkP90ltEGVDhqfVhN2s1ILkxhUO2OKXj/lPz32jrE1tt
 oZrn1yqP1ok2YWcfNY75TLTdKx6Bgf9aBIOT/0hOpImEp5DJzEZciqBQGWFI3d3AqvDvS8/A/hi
 CoDZUZoJGBJSu6bzu6Z6GohtCfMnW2Dc34JC3NCNEWlDCoGaUFNkXRGjQ7aD+nu+PIsjDKskL68
 i39Dheoke4LmRzjf+cw==
X-Proofpoint-ORIG-GUID: Gmt-bn7VfA94f1v_Xwxg1Fl-LXRQnpfu
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7f5f7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ShDbLQTyCWfcQnIfrFwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97944-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D309F2996DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/15/2026 3:39 PM, Manivannan Sadhasivam wrote:
> On Sat, Mar 14, 2026 at 07:26:34AM +0530, Krishna Chaitanya Chundru wrote:
>> QCOM PCIe controller advertise hotplug capability in hardware but do not
>> support hotplug command completion. As a result, the PCI core registers
>> the pciehp service and issues hotplug commands that never gets completions,
>> leading to repeated timeout warnings and multi-second delays during boot
>> and suspend/resume.
>>
>> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
>> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
>> Capability bit entirely, which also disabled all hotplug functionality.
>>
> Just some background: I added commit a54db86ddc153 to disable hotplug for Qcom
> PCIe Root Ports since we were seeing completion timeouts for hotplug commands
> and also the PRSNT# signal was not exposed on any of our SoCs. After checking
> with some internal folks I learned that hotplug functionality was not exercised
> in Linux. So these facts made me believe that hotplug was not suppored at all.
>
> But it turned out that the Qcom Root Ports support "Data Link Layer State
> Changed Events" such as DL_Up/Down events.
>
>> Instead of disabling hotplug, mark these controllers as not supporting
>> command completion by setting the No Command Completed Support (NCCS) bit
>> in the Slot Capabilities register. This prevents the PCI hotplug driver
>> from waiting for commands completion while still allowing hotplug-related
>> functionality such as Data Link Layer state change events.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
>>   	dw_pcie_dbi_ro_wr_en(pci);
>>   
>>   	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
>> -	val &= ~PCI_EXP_SLTCAP_HPC;
>> +	val |= PCI_EXP_SLTCAP_NCCS;
> Are you sure that this is the only non-supported capability? What about
> Attention, Presence, Power Fault, MRL etc...?
Even though there no signals required for attention, presence etc in the 
hardware
there is a way to generate these MSI's with these bits set through parf, 
so technically
so other co-processor in the system can trigger interrupts.

- Krishna Chaitanya.
> - Mani
>


