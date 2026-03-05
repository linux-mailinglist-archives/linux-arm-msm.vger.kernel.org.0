Return-Path: <linux-arm-msm+bounces-95558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA+GKyRMqWk14AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:25:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C420E58B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA5B13015B90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373D030B509;
	Thu,  5 Mar 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePdi+N8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBoTXy18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3517376BCC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702736; cv=none; b=SrdGaT5x75fwtOWCsGhqjPRg2S5OpaBCfm23BuA3Jff1P1biJGUH8MXz6rB3L5kW08E4NqviNv8+xBKp4FDVEBDr8MNsca/0ck8ibuzdgIh+3l2/ICgetATu9YtGpYsOXirzfPw6LTDH9K4HsdKgcPHCj+PoLhMZPCibOpx4Ltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702736; c=relaxed/simple;
	bh=/JCIQhJ7DqnlJxNz7YUsR6Ad68yHWeMmEyuU8m+NV5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dt3Cz3aob8ZR8oWGdjF2Lx/mzlMHJEpw+hbNOavUFBfr2A12/8ERE/nLuXIYePDXHsdTXY6ZQgskxpBLt7Cktol9Y2FxHKPCFrS/mjB3OTWgi6YvEd+mir7Ayje89cmrnIxSFTl5vBKb7rDow8A+Tl2bSumAnvf6C1pHF4nAj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePdi+N8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBoTXy18; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AKlX865587
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=; b=ePdi+N8Xes+9wQkc
	6yZ0QDYqIIMXACoK9fbxHTQffU9rP2Wdo+80WOSu+U2NErCpzJN/hSdhQsp0V6X9
	VjcUuG7wpMOAkMRs1eFiuNtjnUY9GSaIsCzQjN1JfUZ7oIKl+JaUybbkWHxN5rC+
	h5G3frbFl8iNp7lwjvbqfEmNe/83Ru3KYiBNS14JCZ82a2GVnZkPl0p1kOclzf/s
	4un5oWtnu9TmqYwDLBtDFt+f7LnFZQzthQZ+2wuoZFBfOwY7TM/9r60xkaMdlQy9
	k9THT4tfBsGu0Ro5enixdKEFblCbGcTpSyZN+7m+gaoj1kwQy83UiiOKPUg7OTTh
	nBKCAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk14yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:25:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8273937bfa8so3196685b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702733; x=1773307533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=;
        b=JBoTXy187ZEwEh5r9si8nSsoJ2EkWfkDRQcbKxyruqCPwVq3nFEWGyoGAQpfI/LCD1
         4A1iXtSDfogKAGA/9rZkaaSH7CSz8QxTXy9lJA9KMmPDh5x3LfVNc5OjNRrTFCZ5h39W
         eCv29O0AswXrHZoCDZgeKddaPEEKUDDUwgHNbs1a1nnQAOvIgcLkAjEyJf53+8H9FAZV
         pxmzcvonNk7dgBKeXgTA4FPy0RGLM2MwslJC7TlagcDDGvBokP0P/LQA/ak9s4aZDmFr
         /zQDuorVpZ+LOgHx7v6SYFIQAUQtWl03yk3sR0EZpixAruwq0DpypsLvKIGF365lQCfI
         9ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702733; x=1773307533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=;
        b=QzkKrP+5CHGIs9fJvWHq8x9iTQidJwnjW0Q/RvhXYjT5xoi7DVuJsD/RW1S0qhAuhk
         DhTl4bbxnVRX9Qvi4c6Dg9ejSpGXdkuIZ/NZSOCRfihq3G28WWYIMfymxwSCdRSlrRuZ
         hp5u4jRtWjF8dsbNRrJh7xLqiIrMpofUmcPvadO5314R6h/iV3FAw2f1V6WaLVViLWA6
         RLWCYF7bxjRMLHKyl7YMCrUUGepvXpmUUKyNYVjDl+CVtoiMatxB5Tq3z+IEPHVdFXWc
         GsM1dvkESeXyq2KQpQgsRLFoYHSsVsfHwu4Np4yw6Obz0/RDdOIgrpDfhrN/J4AfPjtS
         bDJA==
X-Forwarded-Encrypted: i=1; AJvYcCXA4gHlRPH5u/5b/Yh4GtbZ21J/bs3vIshPeXdDVFwh+hg1K5lGXC1QKNCVKvvcr0FcX4C55eVP0Zy0LQIO@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnPQS4h0pqqOc2j2IryWgXQN1321qsy9uIqZJQm5ajbrcSUmX
	ixO9eP+gCBCoAMRKYKbeCIHRCl5Cq7djKlOgI00LpEFMYYzOEsGplnFGWEWwvPMw6nPl92fhd4U
	ItPZUb5LNsFL7yXM4Bxxatk4wF1gmLYoHUbtUy8nPP8kY7qh86U5JHg5DzKQ5FeeAmiNP
X-Gm-Gg: ATEYQzwSM23wQ6LofAAe5OFsctG7XX32dQ0cGnkrz+E78otdxpKUtNIiKl6o1Mm6Kjw
	rbbhPvI/oWjT+ptvKFNofl9eunf0YiB5Zc3Rppd4+8fDMdfbMtlbEL4gPH8UNswe3Mo/xTvjYU7
	p/u8LPSkpVIypnFoopI+3D0JcX5rWdj3FxplAsAaKxDNgiQXa/zEjVAF+YZC7ZwcpKkaZi3oSUj
	DB7EDcQutWV3/2wv8BkBvrN8KriWpLLl2UqOFuju6dtxzUnQUyf6/gn+Zpxun0/cFso9cXF4FQU
	051FmfzBQSVAvNZUz5IwkdFNeoyO4V3ZN7jkEwEX5FFP5QZnZVZRVlnu0rY0ql3uyV9LAbKazo0
	JLRSsNmc4gwCK2z/xPULSUxb1/mU+byK+G+adXjDGXnom/vyr3CGQUg==
X-Received: by 2002:a05:6a00:1144:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-82972b61defmr4432217b3a.1.1772702732591;
        Thu, 05 Mar 2026 01:25:32 -0800 (PST)
X-Received: by 2002:a05:6a00:1144:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-82972b61defmr4432193b3a.1.1772702732107;
        Thu, 05 Mar 2026 01:25:32 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829722d0045sm4521429b3a.23.2026.03.05.01.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:25:31 -0800 (PST)
Message-ID: <9327c6a7-b2af-420d-bb1e-f2829ddaef7f@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:55:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
 <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
 <c0cb73d6-262e-4529-8b07-4c545c76015b@oss.qualcomm.com>
 <miorzejq4sxcl7pucaa7fq7fplbs7bqcnflawnw4qnvntxohmf@xyttdgbfllvy>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <miorzejq4sxcl7pucaa7fq7fplbs7bqcnflawnw4qnvntxohmf@xyttdgbfllvy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wUgXwAbAL2gDnD5hrq20a8hQeJoWk4VD
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a94c0d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uIgEQj9WjdynuVTCvEgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: wUgXwAbAL2gDnD5hrq20a8hQeJoWk4VD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NSBTYWx0ZWRfX8qEFKGL+co6c
 kFPlHo5iVutcpGTLRF5J70XDCFVgn9PAxr56mp6q9EOSqJtX2diCFw+SYsETE2RmwlYh2c9FZ+h
 v+0yWqjm04TORKR9bQJsWhG1KbeBOLKzlFbJye7wmfAjrheYrf9b7nVAkng/W2tnXOIB6KLxz0A
 wtP/341oejgFsV7HaR9fRSa1RFww1fyrRpC/WNItnKG20ZIs5LYEcncS59eh+AoraQuMvz7dXxD
 jl3VXYVQqxXjAeDT9QqUaafuGJ0PJvJmQEdEO3Yu0p8B66JpzCoBBdCVN5It4XeONDjDC5JELqw
 9yM2g6e7SJ4RPa5OdCUcm7/hpu4mae6ML5bdFnjb2clRJMXUDrgjLXFkQCv9aG8+ENluU2/rRun
 cDBNtztYSetNkkDjciQfSUYJE5Pt94e5TUYjKfzlb+lXiaTTILGLpUX7p1cUrO815A/J/4bCFiz
 e+kNjraaX7yF2TXzkvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050075
X-Rspamd-Queue-Id: AC1C420E58B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.infradead.org,nvidia.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95558-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 2:44 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 05, 2026 at 02:30:17PM +0530, Krishna Chaitanya Chundru wrote:
>>
>> On 3/5/2026 1:28 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Add support for transitioning Qcom PCIe controllers into D3cold by
>>> You cannot transition a 'PCIe controller' to D3Cold state, but only the
>>> endpoints and bridges.
>>>
>>>> integrating with the DWC core suspend/resume helpers.
>>>>
>>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>>> into the DWC host operations so the controller follows the standard
>>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>>
>>>> When the link is suspended into D3cold, fully tear down interconnect
>>> You cannot suspend a link into D3Cold. Link and D-State are different.
>>>
>>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>>> by keeping the required interconnect and OPP votes.
>>>>
>>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>>> dw_pcie::suspended state, which now drives both the power-management
>>>> flow and the interconnect/OPP handling.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
>>>>    1 file changed, 74 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> @@ -145,6 +145,7 @@
>>> [...]
>>>
>>>> -	if (pcie->suspended) {
>>>> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
>>>> -		if (ret)
>>>> -			return ret;
>>>> +		ret = icc_enable(pcie->icc_mem);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
>>>> +			goto disable_icc_cpu;
>>>> +		}
>>>> -		pcie->suspended = false;
>>>> +		/*
>>>> +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
>>>> +		 * connected to the PCIe link.
>>>> +		 */
>>>> +		ret = dw_pcie_resume_noirq(pcie->pci);
>>>> +		if (ret && (ret != -ETIMEDOUT))
>>> No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
>>> failure. If the device is not found, it will return -ENODEV. So you should
>>> fail the resume if -ETIMEDOUT is returned.
>> Ack, didn't noticed the reworked changes, I will change -ETIMEDOUT to
>> -ENODEV.
>>
> No, that's what not I meant. I meant, you should do:
>
> 	if (ret == -ETIMEDOUT)
> 		goto fail;
there can be other failures also right, where we should fail,
like pci->pp.ops->init(&pci->pp); can return different error other than 
-ETIMEDOUT in that case we should fail here. - Krishna Chaitanya.
> - Mani
>


