Return-Path: <linux-arm-msm+bounces-99633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO1lGEx1wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:28:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B553074DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA887303A0DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EB73E559F;
	Tue, 24 Mar 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGgwys0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jv1ie7U8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A63E3D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351674; cv=none; b=JSgU5/r2PWGD+c7y3qiul+EAeEAByzD62I02oUrkP1FOrSkT4lhu5DoUmTi+F4CH7xqTuLbBImSM+8XKkFILM+7TlPYUPZmmkS6fYb2g8oHvdrXob0nEPVPlFMnVX0zqfKeRxqXP9ViutcXjrgiwfDvsgFPz9vB56sql0Ibwx7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351674; c=relaxed/simple;
	bh=RwJReVeMr7oOhdwBTDK2bsllqWVHSJC05e5UZgDQsZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=setkqX81PkVMRLv+FRsNRjcQb31sH2fqY8o9jyFWQxzi87U/o10Ic3yLcjr8vTWnET1vxD9M4b9ABtdeW4U9V6+f6+Oa51vcNEvcZhtEhBrfcSYI8weu65T6JQIHgAd16KlU+GaMMWdoRUfJJ1DerFZIh/7YX2g1GGKvNYigvp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGgwys0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jv1ie7U8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9I6sk3934889
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oafjRMkd9gEOQWb2JRWS05Xn+cKR98MMSWwCJ3aCD9I=; b=dGgwys0SF9G8AiNf
	vPdr6j0h8O6G/27iH8Hj8FBKuADTGuew91wMl7N/+vPKnCnFTEfhlRCl7PKUzLuz
	PBo7NxRHiKONYWULZzZEYB7Uk0XwBrHeT0CjXDohAR0hhK0Nb4UyC96v6Hg60pSO
	2QKmgO1U1yIChAUZVKN/C+/CvwK9WgoJQh01pKydDpFSVXF0xN3iglARB60qVNwF
	9uxUfz/InPEGZzPEkm0NUIf/bD2/ZN3r0eJQ1IYuKWJXDtB6G6IeuullnEhjUWPA
	g5LkaJe5Xn/W2m8RwyUYbfDuBkpFlGve0LEytNxOaDSApGfZcc786z5QnPOpDNYz
	7wYRFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0m5u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:27:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso50813571cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774351671; x=1774956471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oafjRMkd9gEOQWb2JRWS05Xn+cKR98MMSWwCJ3aCD9I=;
        b=jv1ie7U8LAKILmJLzFe8h+I4axEhu7gZppPY/zM/dUXNj2PcEknfnra8dyftbHLk16
         GA2zPh0ccT00sjWRbXNQUUSjnx2WtgHSAuocZt1+GI4Heb+bMQ8PeGH21Bq3unRfAnI7
         C4iunpEB8myOI9476PtxxOHNhu7vq8N8MUQkICwrp7MHs9Z6reVyH/na6ToCF4t/eBzK
         cCOPkE13Fho4JJEnFg4Xw4YsWkluZh3l71i3MKupCTW5N2sEWpduOv1oE73knqdgSOFS
         bD4K/QMAOCo/K6AmSWgXIyVQYRV42fo9icS+Z/ecMCUyvws797gif3N1+eQhwOLDYz/Y
         Exkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774351671; x=1774956471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oafjRMkd9gEOQWb2JRWS05Xn+cKR98MMSWwCJ3aCD9I=;
        b=fL6XKyU4aRbyX5MXFaOuN5nVasCk0RVxhNjddtAErzyqVvaPSoTVvszfNnfRFFfHwW
         w2CLjg2xreXtDoBdBrrkI+RgkBHQtaU3RbyhOHDVAOqqfVTiTsLu0CUWoRQ81ytfXhIM
         sr39/Dqz78lZMtYgKRN/V4tMEY7JrKIWzE+nndfu34dawM9XBjSbo694sXd13/EUxjZl
         wC5barSzHYbyVp63tSCiGVljwLOiZYV9YUMSSeWrE6aPqQynYWb13EEXB8WkWbJxFBWK
         IjK/H3MeIqC4tKDSNII48WrrjHGII1EE/qf4KgqzL065SSQW5ZGgcS3yd+fq7sWjpBPE
         uPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDUn+UfHxK8IrZBvCZbgZo6pj6Pclh75SvCZc8cF1jbWLKx8OkZKQWPayaqt8etg3Gahy3bTDZnWtVZmDS@vger.kernel.org
X-Gm-Message-State: AOJu0YxIH+GhXTMnavH9MyD8rdnHkhMTybhSyYNz8azcsOQMSBnj5X95
	4EzqydyMYodhniLEQyLDlWEkWEF9eIP6c5bg1G/xq5YbJK8GODfr32GCeD3f1Dkmpzw0npP85Xt
	8wMe5kuR81/1EevrExj6ZvCaeQBHTLrfJAL6tb1Im0xK6xp31JxYFxN1lc2OROk3vgNS3
X-Gm-Gg: ATEYQzyulQWA6uEpEcWPi/7rANWmk3LtGuMVLBD3vnNOpnI4u/kxedHEv1G0aNMAyP1
	qVW6ztlU6po6IP7Mkdm+Yr6Akf2UNNBDg4cl8wudG2TK8pXMsuJLkrivhVVS/9cP4+Oj/Lm7/kL
	iqqyGbnU0ftHSYj1GGWIMMGC6VEpV9M8Mb+jF3yq4+mkRqJTY6RaMKED4/ZxPurdywogQ2ztc4Q
	Wbi7L377pqRFnrC74sHCLm/pqY/ksJnRNapRr3zaa+CUTYx50Qyn+QJzG9IpKwiCycJXHA0rjdM
	IWx5hZpoWnavpO45df79HRkeUYVpAeZsg+1Ktmi43cLqBF5DG2MRyT3d+G1Ob063AkoEQRkiynh
	nLVgU5qjXzBue95OxMHEvZjuE/iiixB7cuBV/ZyL2QiEs+yiM8VKODl5b1PkkdKnS0Rv4RVdKOh
	dNQtY=
X-Received: by 2002:ac8:57c3:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50b37505109mr184563721cf.6.1774351671167;
        Tue, 24 Mar 2026 04:27:51 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50b37505109mr184563401cf.6.1774351670653;
        Tue, 24 Mar 2026 04:27:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305085sm3104682e87.59.2026.03.24.04.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:27:49 -0700 (PDT)
Message-ID: <e07812c4-c618-46e4-81c5-d387d91f615d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 12:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
 <t66kmmr22z5anjhhez3mwfbmy64pz5246e4oepvpwf5j5l3u5o@i3gsh22x4dst>
 <015d00db-9ed5-45a7-83f8-1b10bc2ee457@oss.qualcomm.com>
 <e94f9da7-3daf-4393-9455-6707cb963e0c@oss.qualcomm.com>
 <4649cbd8-7128-4c24-8d8d-c12bfd2a677c@oss.qualcomm.com>
 <jhh5xvjssci4z53vsvskyp7327sgit2z7gqu7kra7e3nkaa2r7@rhe74dh2z3sa>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jhh5xvjssci4z53vsvskyp7327sgit2z7gqu7kra7e3nkaa2r7@rhe74dh2z3sa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c27538 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ca1UC_GKNUODAY3tWcwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5MSBTYWx0ZWRfX/DfgR9bMdzrT
 O/I109McJJ620y9ojUMG+wL+SkxY+L+pajdDJBMF7WKQ5CFv1FPLO+1/Fey5BnLfqQwU1ApabIm
 mTo/buYnwKsOQFdv+uRTcq18BWQyHaM/x31L2NK38XlcyWonlT6oIQs/CB+rPF80CXpGexzQ2zM
 N/FUW0guS+D+4ZFb/6eZQi3YqTSiT9UPu4QOehgh36sHhff9fELRVijtsGo8k7T4gm1U4GgdTdX
 mPzQzAlveJU9xUXlm4GkEiEFouLpdNZDbC8s/EgELtZ44al7VQZFfjQ/jYKbsKpSzBqP8+fAH2P
 i+3FjWaG2SAE8v4QUKdTb38GEM3E3YNO6tdTBd5lQc9+7E00L6blqU96TbmVRth7cdLdq7YJUiY
 7txWQt1B+YDuxD8N4cTGUPLoBQM39sXepvOsAJ8KLkOahExHUfeaqViXX2JullaPk2cEMfqA9zF
 s5D4iDrk/wAvzX6fTRA==
X-Proofpoint-GUID: vVbli8rqvxFc5KDWWV5_LOcMFQI1Sjs_
X-Proofpoint-ORIG-GUID: vVbli8rqvxFc5KDWWV5_LOcMFQI1Sjs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240091
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99633-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02B553074DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 1:01 PM, Manivannan Sadhasivam wrote:
> On Fri, Mar 20, 2026 at 07:10:19AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 3/19/2026 4:29 PM, Konrad Dybcio wrote:
>>> On 3/16/26 1:22 PM, Krishna Chaitanya Chundru wrote:
>>>>
>>>> On 3/15/2026 3:39 PM, Manivannan Sadhasivam wrote:
>>>>> On Sat, Mar 14, 2026 at 07:26:34AM +0530, Krishna Chaitanya Chundru wrote:
>>>>>> QCOM PCIe controller advertise hotplug capability in hardware but do not
>>>>>> support hotplug command completion. As a result, the PCI core registers
>>>>>> the pciehp service and issues hotplug commands that never gets completions,
>>>>>> leading to repeated timeout warnings and multi-second delays during boot
>>>>>> and suspend/resume.
>>>>>>
>>>>>> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
>>>>>> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
>>>>>> Capability bit entirely, which also disabled all hotplug functionality.
>>>>>>
>>>>> Just some background: I added commit a54db86ddc153 to disable hotplug for Qcom
>>>>> PCIe Root Ports since we were seeing completion timeouts for hotplug commands
>>>>> and also the PRSNT# signal was not exposed on any of our SoCs. After checking
>>>>> with some internal folks I learned that hotplug functionality was not exercised
>>>>> in Linux. So these facts made me believe that hotplug was not suppored at all.
>>>>>
>>>>> But it turned out that the Qcom Root Ports support "Data Link Layer State
>>>>> Changed Events" such as DL_Up/Down events.
>>>>>
>>>>>> Instead of disabling hotplug, mark these controllers as not supporting
>>>>>> command completion by setting the No Command Completed Support (NCCS) bit
>>>>>> in the Slot Capabilities register. This prevents the PCI hotplug driver
>>>>>> from waiting for commands completion while still allowing hotplug-related
>>>>>> functionality such as Data Link Layer state change events.
>>>>>>
>>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>>>>> index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
>>>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>>>>> @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
>>>>>>        dw_pcie_dbi_ro_wr_en(pci);
>>>>>>          val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
>>>>>> -    val &= ~PCI_EXP_SLTCAP_HPC;
>>>>>> +    val |= PCI_EXP_SLTCAP_NCCS;
>>>>> Are you sure that this is the only non-supported capability? What about
>>>>> Attention, Presence, Power Fault, MRL etc...?
>>>> Even though there no signals required for attention, presence etc in the hardware
>>>> there is a way to generate these MSI's with these bits set through parf, so technically
>>>> so other co-processor in the system can trigger interrupts.
>>> Are you saying that the RC itself will not generate them based on what
>>> happens on the bus, but they can be triggered artificially?
>> Yes there are parf registers through which msi's can be triggered
>> artificially.
>>
> 
> As Krishna said, it seems there are ways to *inject* these events through
> platform specific means (through PARF register space), even if the associated
> signals are not exposed to the slot. And we might end up using those events at
> some point.
> 
> So it is OK from my opinion to just disable NCCS. But this also warrants a
> comment in the code.

Alright, in any case, this is required for PCIe-over-TBT hotplug without
tapping into the "global" irq

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Hamoa CRD, tunneled link

and with the comment added:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

