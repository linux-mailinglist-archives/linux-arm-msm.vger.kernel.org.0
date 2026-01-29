Return-Path: <linux-arm-msm+bounces-91106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLi9Nfnuemnn/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:24:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5DABE63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8671B300EFB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 05:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E452D9797;
	Thu, 29 Jan 2026 05:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNMNyL2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ee9HktB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF832D7D2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664233; cv=none; b=OLJq0fY6/IezpLvSoIpFkveJtENiSTIl7NjDVqKT/mDgY0tORQGG8CfNGgOe4cK8ggCiZ3Rko0tRS6H3pwXeOieqrjboHTHlIgxDwEDFCq7IJ71nx29e9Ya1CZiFn5ciad+dAuVZuK7odt9iNuX20w0j/cfPrgFdiQoMx5qmaRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664233; c=relaxed/simple;
	bh=A8ELThvyDSw7bzTxOnET/hnFtmbsB5pdUvsMGPcjp1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKX+lcf1Eezqjo4wmHDxYUZ2c9RKUkc/2jFRZAbeUfySijU+mFlSQnvV/xpvgHIokrtjPSKlnBzvWnPtnAXRBAPoLbXf8521uGJQpqyDvt35d61rwSmy2mygb4kbXFs/T8jjnS5wed5tWg4R4zFrYRuLl/Z5iw6BXsTPTcbSDfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNMNyL2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ee9HktB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2omi12033395
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=; b=oNMNyL2aRmFPZ1wo
	yrTN5iDhAY4/dtyj3zgDH9VPm8jUxSVPhpGL5eEH0wRi434nONRF+h+PycTToS5o
	HSKzoGvHLTeiwIedB+yx5wGmmBmeicYBc13LMC59ghPiyEnZ7rcaEsjQn9nNy/Yt
	yjrQ1OwOesSSefEslhlXdJhz+NruQFAnxGEsQTxihPZ8czaS5m5gomCSrjFXdzfl
	Wpufcmaa1Rg57/LE6/qrrHsEZ3CMmzrQ+qvIB9xqhBiiFUgeSmE7+BZL4mw8Nsrw
	cccIpmsZVDbJImQ4YSDbMsVq9oqAD1+lhZ8i/wKou0z2HxEiSyOrQh1eh1b/LJ9y
	8OosGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7j9y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:23:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f29ae883bso3988095ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664230; x=1770269030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=;
        b=ee9HktB93EG31bmMkFIV2JS5tUc965d/erLnHPIlE03+81f+ClscVoU3ZC7YsU3Qr6
         xJ55exAlgnbWzNeVMvJqEqNudI7bQuwHrsY3CfCrgIRnPMo53fjRFrRQnSYFOy+k4rS6
         N4Vl0a5iwgL+EPyeMDjm4ljz/IXq9pC8EoRzi9fXoPA5rfYC8ArmFa+J1LU2ELOFdfXj
         /kQJfcNtCwIofc5IHa+Le4MOk/wDI+JmvaU1jzwih1uIM2Z2mISi45xInkGppGLgtsZm
         AIXmdIua+rrEASqi9NwvjgrIT9rCqBhX3NcCjbeBVtJcnSibhkcSvFTM27dLukHU8cj5
         KaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664230; x=1770269030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=;
        b=Z51X0qHlOIvhC7W9uwOeuA0tzfR61Q+SOXuUPqvcTgHMGAPeXtB5PnlrFr3RcLV0H6
         uYVlQWpVmU4N9el2bumrEbdKUxDcGnAmIYDbB252ycrQa9CbaoboK581ug4BkV7ze6VU
         jGn4IMAoumquCDPHf11TjDoPPO96mgSh6RgilrkQDjzJ8ppogaWhk8HiIyl0/BQjwJag
         c3kt+/JWQjGMoo8jW0v4gzUiEMu27RhFauUukbHiSc4R9XkRYrr47WVjElNEpw1G7mmK
         D2S3ySGlaQAh1dEWo+IFKKwqTHlRXK4l+foA/eF5Guvl3q0GTrvAnmHIudkUFiu4SOaV
         vBxA==
X-Forwarded-Encrypted: i=1; AJvYcCXF5ziEFU7YSlQqzFEGOcsX7h7p+IKpNifajxrrCgn3Esyn3dfIhmWxJD11sS7+M5AgUS1tx1ScdrYM1ELJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNTlwp9GXw/CXvA3io8OqC4RhgEEnVpcHmrgfkeWt0MO72a0Ou
	8wch3VVccKg0IIi7DZ1fjMsyzAlOg0fn0xy9UEYoD4Pswac9heecAovN5hjAsRq4RAC46yki8i5
	uLvrxQWdtFsCGK90lgC1btFm0eGCWzfxUe5TfOjL6c8TxWjJWJm5pA++NxDIDCE1AV3yb
X-Gm-Gg: AZuq6aLLtcqSrI7dq6iQoUsaYolIejxM9drsuoXcGthmC7vkvCkGaScrtICgfyeF5ns
	puC3DMizxX3GYx87QbHpmMMEfmYYUy7jIMHV3w9zEzSZsuLmrJxmDHagx+vIs2qCEPRXDWjU5cg
	n+9wtj+jVXf5wksDJVmfJJSU04B5AkxAQVXJM9T06c5WI+NC7yruQRiT+h95dqFy1Bkp5c26d/o
	dWrQBB/6h1UUzqcrZFSkwwMLsD+LXwWFfGIb63zPPQH0A91znshM6gePYg70ZF/mxyAqH8Hd8MV
	NrXlIFduS88DZ/R5xeqpUfEv0hbXtJNIny+hBR9NFAaJESFYjdlbl0iI1KPQeGIz3JjZQJLV03s
	/pgNglyDdYyT2eDmHZy+f9yff5eooRkS4pS72smWBgw==
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr64884065ad.1.1769664229793;
        Wed, 28 Jan 2026 21:23:49 -0800 (PST)
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr64883845ad.1.1769664229201;
        Wed, 28 Jan 2026 21:23:49 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3ddfsm38873735ad.66.2026.01.28.21.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:23:48 -0800 (PST)
Message-ID: <1787b076-a07f-4ac2-bd50-55914c70461a@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:53:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] PCI: qcom: Add D3cold support
To: Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T_ElWp6h_FOvcEWYW5EctoCzh3uxI9zv
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697aeee6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FNQ6HaZGGcLT-iQI5j0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: T_ElWp6h_FOvcEWYW5EctoCzh3uxI9zv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMiBTYWx0ZWRfX5Mlp9VXk6Y/3
 Z0BDIrTFWSCqBjPo+tFKfO4I4mwGHwGUo94xqak8wN+uSgpbXeoj+9OOD4d0ePFbYCLzNK0wWNg
 v0j7017/dRMqKVAsxQgMYWrzxfpfDg3xXRzv0y3n6b5bxL2rlDhqdHfKaZtEWHrL8MxylJjkRSi
 a0V6kJ3dgd0XPguMcfcMnPNj55bA02ciPo2mR4Dk7QTrfI87OXqRk4FwsOQlfTNzQdXJlghKsyQ
 a1XPtC3FjIPWpzbmzFzCCE4+BxQ9exp0l3AjBi/M/FIatN9m7+saSc6sB4uGD9Wh/5PjmYgez2r
 q5oyEjwhaAHmHurX6l9y4ES4e8DSxqI2cR3j3WbnTDKjNgVzPY6KH3yNccX0SdTNyY9HM5ieCOA
 LvJpDqTjjjsG0QKquE/MOB07cXGNXF8kv6Ws0qVB4AGtjO9Af6y23/SXc5skFgDfcjaFMhvjUaR
 i3xkSFU5oTX7LPPmctA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290032
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
	TAGGED_FROM(0.00)[bounces-91106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 70C5DABE63
X-Rspamd-Action: no action



On 1/28/2026 8:25 PM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:10:40PM +0530, Krishna Chaitanya Chundru wrote:
>> This series adds a common helper to determine when a PCIe host bridge
>> can safely enter D3cold, converts the DesignWare host driver to use that
>> helper, and enables D3cold support for Qualcomm PCIe controllers.
>>
> You only modify qcom_pcie_deinit_2_7_0() so which targets is this
> expected to work on and which targets have you tested it on. How can I
> test it and what outcome should I expect?
we modified qcom_pcie_deinit_2_7_() because we are trying to undo what 
we are doing as part of init for other platforms, in init() we are just 
turning on the resources. I tested this on lemans evk device. After this 
series we can expect PCIe link will go to D3cold(provided there is no 
NVMe attach), and cxpc can be achieved. For NVMe devices, mani is 
working on, in which requires some psci changes[1]
>> The first patch introduces pci_host_common_can_enter_d3cold() in
>> pci-host-common. The helper walks all devices on the bridge's bus and
>> only allows the host bridge to enter D3cold if all PCIe endpoints are
>> already in PCI_D3hot. For devices that may wake the system, it
>> additionally requires that the device support PME wakeup from D3cold
>> (via WAKE#). Devices without wakeup enabled are not restricted by this
>> check and may be left in D3cold.
>>
>> The second patch updates the DesignWare host driver to use this common
>> helper in dw_pcie_suspend_noirq(). Previously, the driver skipped
>> putting the link into L2 / device D3cold whenever L1 ASPM was enabled,
>> since some devices (e.g. NVMe) expect low resume latency and may not
>> tolerate deeper power states. However, such devices typically remain in
>> D0 and are already covered by the helper's requirement that all
>> endpoints be in D3hot before the host bridge may enter D3cold. Using the
>> shared helper removes this coarse heuristic and centralizes the D3cold
>> eligibility policy.
>>
>> The third patch enables D3cold support for Qualcomm PCIe controllers. It
>> adds pme_turn_off() support and switches to the DesignWare common
>> suspend/resume methods for device D3cold entry and exit. If the
>> controller is not kept in D3cold, the existing paths are used so that
>> ICC votes, OPP votes, and other resources remain managed as before. In
>> addition, qcom_pcie_deinit_2_7_0() is updated to explicitly disable
>> PCIe clocks and resets in the controller, and the now-unused "suspended"
>> flag is removed from struct qcom_pcie.
>>
> This is effectively just duplicating the commit messages. Lacking from
> both is a good explanation of the problem statement, but that might just
> be me not getting it?
We are adding support for D3cold for qcom controllers, this is a PCIe 
feature,
I haven't added reference to qcom internal power state like CXPC since 
this alone
will not achieve this. But I should have added to this as ultimate 
purpose is to
have CXPC and main blocking is currently PCIe.
>
> Could you please help me understand what the actual outcome of this
> series is? I was under the impression that this work would lead us
> towards unblocking CXPC, but the other patch you sent will prevent CXPC.
This will keep PCIe in D3cold and achieve CXPC if there is no NVMe 
endpoints.

No other patch is not preventing CXPC, it is just trying to tell genpd 
framework that
don't turn off GENPD, if the controller is not suspended. if we don't 
have that patch
when device is not suspended i.e not kept in D3cold the gdsc is getting 
turned off
and PCIe link is going down. Until PCIe state is in D3cold, gdsc should 
not be off
even in cxpc case.

Mani,
To avoid the confusion, can I club this patch[2] to this series in next 
verision

[1] 
https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
[2] [PATCH] PCI: qcom: Prevent GDSC power down on suspend - Krishna 
Chaitanya Chundru 
<https://lore.kernel.org/all/20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com/>

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Krishna Chaitanya Chundru (3):
>>        PCI: host-common: Add shared D3cold eligibility helper for host bridges
>>        PCI: dwc: Use common D3cold eligibility helper in suspend path
>>        PCI: qcom: Add D3cold support
>>
>>   drivers/pci/controller/dwc/pcie-designware-host.c |   7 +-
>>   drivers/pci/controller/dwc/pcie-designware.h      |   1 +
>>   drivers/pci/controller/dwc/pcie-qcom.c            | 114 +++++++++++++---------
>>   drivers/pci/controller/pci-host-common.c          |  29 ++++++
>>   drivers/pci/controller/pci-host-common.h          |   2 +
>>   5 files changed, 101 insertions(+), 52 deletions(-)
>> ---
>> base-commit: 590a64365d9bcc13ee644a3e73ffdc3df26cf23c
>> change-id: 20251229-d3cold-bf99921960bb
>>
>> Best regards,
>> -- 
>> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>>


