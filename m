Return-Path: <linux-arm-msm+bounces-91109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEoiCILwemkiAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:30:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28BABEDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B74301052E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 05:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964CD2DB78F;
	Thu, 29 Jan 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkGaXqoa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAlwTE9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221032D3EC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664635; cv=none; b=MNaB2l4/YX91crLQV2RNXeCJFOhHGETEg7vS+8Z4mhT+DzAXk7yLUHswb7ePJEpqJnACWXkIul6lY0izIBaanTDVz0EXdh/FzPVwdy3uh5qh7fIaYxgKZX1q7nidCro01uml78X2VYySU+c2pkCba2s0q/mB2etx/4mMHg5j1OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664635; c=relaxed/simple;
	bh=S+dfZOIi931W71NhJZXxidF3+45eyhzuzBpclxD6IC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVB/hddCjUKn541smABmnYVcbaXs/4GbjoNj4XvS9EK1X4tV0ZwKwQpvUnXEKyjDTliSKbk5OJ27AEeCp/HP6t9WuLwlJc0xgKcFFZZ2dnnM9DZIPYUqibkk9cHzy8+V8GUP2zVi7NX0aARjdou95/cmjdj4vkSK48e6cnF81cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkGaXqoa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAlwTE9v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2ol331565054
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=; b=nkGaXqoaF9w9whPY
	fEBH3bMtELejZwf9rNUBnzaHis3LwfitrizVnxrNhNqr+onU/86dTrKrXbL/sg7j
	Dz541WvgmktnuUvPV2Upc9+PSX8DNC/Ql7ZGhuUkfrtOYSXhll/QOxDtCc8HUvO2
	lUfaXCy309J4zYHgTQJd6AXcv5rKP/GH3+Q5MPLwMsb2+I1m98nCR8X0T2ep9Nro
	vDph9PwU6dWTcii5bcCTzkf0V1MZayTokXAYShRfmSbJzf4C4F0by4WB9ru6uBZS
	Zjzly3/CSBseW6YThVTwS8vEIX6QD5m4Jm1d3XbBtiFf3i21L76FFR9q34HOKuoB
	S6JENw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfgy34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:30:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so1036414a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664633; x=1770269433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=;
        b=WAlwTE9vQpZjy+Eb0FZWCil+r4ICPYcESZ34z2tmB7uNgarm44Gx5RECLlnNalZ8F3
         nwFFEKxCPdf9zqLcuXmR2GSIeWpA80K7BJjaZVRq3AwsdmXS9TtbxSEjv2/Tw6H1Ap6P
         sDMN+h6epOuGkmda6eFfCNHFj1SqvB4fSE7uDlDERZHPTMIolHIclblrkoDMB1ZHT/O6
         SVWYSqxIYl6yMEHXMEkd1UVM8OCmNrNicXX8A69ZHf7dnQnu3vecLcwgQgsY2vbjwbuU
         EQ2CNjo3T5Zojk2yVb0cGHh6F2WEH6w7Xe0NQjyFn1b8Tg0zl//c3wK7Z743fDlAbXrv
         tFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664633; x=1770269433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=;
        b=asffbZPP+5azQTPdEZ9raxC2jX4FKSa8d7iexuGPKZVvzFZ2xZSFpw877Qjab42jcv
         /rdP91nhF+zaCWG/zJlq8QadWWNQbB5Q8ySAgxJnX/W6149Xa2IE63Ej2aaMlavRGtoZ
         qWFv8r8TUf7tzojqE5FVgmPFvuijmzEX5GNAHynutNfd7efwZ+bqMLzTuzgCpIVV8uJ8
         mS1JWwzo84eC236+KPInmIG0iA3FCILG+OfUyflwb4tbdHsSl+z7t/Bgf5YWp4XWbRP7
         ydSGGaJ09dbICSKcGeFLeg4GkI5cnOWcK+yOPukgFqIdpj7TceBpBG4pJ1nbhof3FRRz
         oXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3rB2aLedVheT6COlJqLsRubq7jozy6CjMrCdMEA6s/7mQZsTMsxZPbDq6h0BnGXzXmmKvvspgCpiQiQZG@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIXF45DPD171P6fRDsO63fDfd5xGuqT7Rl8s2mYwqwBFaRgst
	dp0h+uc6/ZD4VISOx/AF61Uh5Kx4lNrhRZ6w2Dy0piltNiZBQ5qAtVSd9eEv6Y5XW31Q5a5LGij
	xNKfkrRD7e1OePOEzlsSk5hqR7zykNKCNBO2h1w+ql+eJpPugzy4lbN58449NBvSFT+3q8KywWn
	uG
X-Gm-Gg: AZuq6aKg7neqKqDi22m9GZAh0qpeDYaZ/3EHRVpyMDUk03hqWlqcq02H/531vid6VVr
	z8a2WoeyXbYakmc+GPWt2RgDow2z7n4UXs2EwyO13CQ77VOpVCLPKTycn0C+sKzcEtt0Y3cfGLw
	0ssQukERHrpzX6JyGCEC8KvbABRdllMGHgTkM/lwgU0O57zmRNQaM6sMfEaSbYDcG0U91LuX4CA
	R3AY9V2X3Sv7jCyZrcpVjYCJGMy91Lz+I1xMc9xzRlBtFrYrV3jE1zWeE2QdqOv1QYQrPXHiFTj
	xfqJB1NVUexKoqU1qwYTrz0TH4R975CQk4DmR+X1BAXNUvA7Pserk6qlTaJKqMt2NqpC6kJV7ch
	xnyJwtOOBl1ZqXwcVBxgNQNMS6Z9cWBUJpBbhvyfnaQ==
X-Received: by 2002:a17:90b:2f04:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-353fecdcfabmr6603862a91.8.1769664632718;
        Wed, 28 Jan 2026 21:30:32 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-353fecdcfabmr6603840a91.8.1769664632180;
        Wed, 28 Jan 2026 21:30:32 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb0a7sm4092295a91.2.2026.01.28.21.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:30:31 -0800 (PST)
Message-ID: <f6f860b7-71fe-4fea-84ed-a93b9598ce06@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:00:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
 <oygssx4tnd7uwofk4ucqj2ypok2zssnzbauzar2f65lzougr3a@vp6b7y4j56k3>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <oygssx4tnd7uwofk4ucqj2ypok2zssnzbauzar2f65lzougr3a@vp6b7y4j56k3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zTCmFykDySuxXIzzNDnInv5bx7k04hLJ
X-Proofpoint-GUID: zTCmFykDySuxXIzzNDnInv5bx7k04hLJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMyBTYWx0ZWRfXxxxOnHI3m3Ok
 A66L8dUXagE6OARkEBV6Vry8b+sPh77qVEEqQClCgViiJL5d22mpkfm3igEL96Kw+B83F1yH4ZI
 6rkov8MkJunVXXRWHPabK/Ff2HiSs4F2W3p3iBFkTHr424JREvuRx3I9reYgl8Hk734t0AbI3/H
 BIKbw5gXBL2QfqQwuutUmaZMOGgjxZTTCCKb7zdsLOicaE9P0NVEs1inQAdduME5xuBb4da9OuL
 JOBgzkw5ayD7958YRxQ7TWDCxk+SfKm2Rm/1nCo0Z+EnQIY2av1vilXBTuh1VnshsAxtw5NSOCU
 I6Q0AOz97EncmHrSy/BC5Z7wKFd5E0lvRqI1TOrhyu/LZejsO9e4+HAx47JMpXOjtHL/xwmjgZ8
 xEpNNbUBOE2vgbLlNnPodXS7UtpKeshIOtJESpQRY5qB74yXWiFXrsw7UfOHD8PcZ7qSyxDUP80
 rtfA0QGZtb2nIwHvLJA==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697af079 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nF4YfsMlPaNBOkUFFLkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91109-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E28BABEDA
X-Rspamd-Action: no action



On 1/28/2026 7:58 PM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:10:42PM +0530, Krishna Chaitanya Chundru wrote:
>> Previously, the driver skipped putting the link into L2/device state in
>> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
>> low resume latency and may not tolerate deeper power states. However, such
>> devices typically remain in D0 and are already covered by the new helper's
>> requirement that all endpoints be in D3hot before the host bridge may
>> enter D3cold.
>>
>> So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
>> the shared pci_host_common_can_enter_d3cold() helper to decide whether the
>> DesignWare host bridge can safely transition to D3cold.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-designware-host.c | 7 +------
>>   drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>>   2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index 372207c33a857b4c98572bb1e9b61fa0080bc871..2c8056761addf7febc1b0e06ddf8ba4dd4ad1684 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -1157,15 +1157,10 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>>   
>>   int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>>   {
>> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>>   	u32 val;
>>   	int ret;
>>   
>> -	/*
>> -	 * If L1SS is supported, then do not put the link into L2 as some
>> -	 * devices such as NVMe expect low resume latency.
>> -	 */
>> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>> +	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
>>   		return 0;
>>   
>>   	if (pci->pp.ops->pme_turn_off) {
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index 31685951a080456b8834aab2bf79a36c78f46639..18d8f7d5d23088b2fa177e84a21d900c98850fcd 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -26,6 +26,7 @@
>>   #include <linux/pci-epc.h>
>>   #include <linux/pci-epf.h>
>>   
>> +#include "../pci-host-common.h"
> Why doesn't this include go in the c file? I don't see that all c files
Ack, will do this in v2.

- Krishna Chaitanya.
> including pcie-designware.h now needs this.
>
> Regards,
> Bjorn
>
>>   #include "../../pci.h"
>>   
>>   /* DWC PCIe IP-core versions (native support since v4.70a) */
>>
>> -- 
>> 2.34.1
>>
>>


