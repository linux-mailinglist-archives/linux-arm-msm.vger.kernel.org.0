Return-Path: <linux-arm-msm+bounces-80547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134FC39E40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 10:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0326189471A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96FB22127B;
	Thu,  6 Nov 2025 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSLKx8pI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Euh5obur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E787219A8A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422477; cv=none; b=i8hdX74C3ztter6Sg07NXqBGnqWrNtzqw5Eoc2QjdYsPD4B9a6AKN8DYD33ROqKix3sLWWiUwynGn1RJwTtMhCSJvKC9tklgdNfUWE/9Sazop6HD3oB4F+kGw7bwQJXrgYQb2F56ZYrELjyrlN1u5ZMSGMXZge49/kf93lrHeiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422477; c=relaxed/simple;
	bh=vavezM5McYCdO0GTAExjvodbuYeC8rvFYUP3Bzrb6a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAg6FcevS85fXvgh/Eemz1B5w8IgdXvzcZxd0PCbmhH4amFsIWSM7VMMpsoExOpWEd47o5nKRN4NVhMAl+SYP3l+Jff1ztDyjD2JH+5lw5KCDAtNvsOi5beJwE2viCCcNNS4XDRfgyBgTaolNONbhkX4TRYsJfEO02IXTTKSC4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSLKx8pI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Euh5obur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A67jmpt2164533
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 09:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IBxiMX/J2w532V+aM7PJT3Rhdmy1U28t6gabb7CXog=; b=hSLKx8pIVW45KUsN
	UE5qLb8ljopgQ97CwrnC1XRVYnlbeIqDY038Sk3CR9zQENRHt/lvWe/aDxbbGneS
	3RJk3WO1YHDNZtvBotsfSLca3QdcnMj7lNqHXqeViHhZvydRyBeHP1k5L6L9KMWm
	hAOQhhkM24EwKjEbtTR4I/Nx/1zABG+ROYSnyrQ5pnXyqYFzVJuUigL2Y5k/S6BP
	ZQNXJ5gaDs+M6dFf0aSDex6f8G+371Qvpwogtnnprvt7IsX2q2utiPV5LZGVhZSj
	V9ukR/kvm6aPBv1vY7TAkfcLu1DjBS+bePfFMy3W9zbeMCpOFXsbm4aSsuLrcuxN
	IXCxqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6esj6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 09:47:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-883618130f5so5355685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 01:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762422474; x=1763027274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IBxiMX/J2w532V+aM7PJT3Rhdmy1U28t6gabb7CXog=;
        b=Euh5oburOgbQyEo3+sqVXqEORRndoSlqmAN6LGWQSBl1sGYMlx4wnBx0tFxz2l6vlV
         DHLF7gLt2BVJ5QZirossefsLdfaGdmaCyLcBdBdlBR5TtX9ryNXT9P0838qCyFaHcBZ0
         GKv+ZTSH47S8iQ+l6XTWrUC5p7ykvAaOxyM2B/502fTwiLq8qAyUzIKpdYghmputGnPn
         NXVasNDInm8U5ScXlpTumOWA6Tbeqory/9plMw9lzlmaMB0aVzvXcayuqS4FHfuN/jpt
         hYBOb8a8HXreZCgj4ll8Ih2G7F4fPwzFsNtgJ6cmjBcUcVBc4szZQh6Bc5jPodraOavS
         n1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422474; x=1763027274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IBxiMX/J2w532V+aM7PJT3Rhdmy1U28t6gabb7CXog=;
        b=IMhzImgOOxeaIq9jR3Is1VyY0yhHlKLNsgj51huBXXC+yAen01f+8HG72blKLDGAQ1
         9Q+DjpyWaIP/8gEVWcl/Vq/hDagcE9eW5pBJmI0YPX9YLCU5HAHK78iFZQVUGJiwdQcB
         iCx3a5UmPLdXlrv1Vr7VK6l6S7G0dsF4URkrjpwIFx3KNFnE1eeMyZaTiBBSo/5hEJUu
         A/75Vm23Fp2IJPvhMblWRhfXSj6Iq6jUGbksJMP0XPxek0z48A9JR6+tZkfpA2XQV7u1
         VZt4nzCXKtZ5y44tanQUU0hdQBkkHwbbI9A+HD8PNRdM4iuqSrV0bO0e7+JDM7ZPolRS
         f04A==
X-Forwarded-Encrypted: i=1; AJvYcCWsD3OfxmqY9E9mA4nWqPnWjr7AcKNFHTaNMgBimdoJlia+r8bkttEgR1OpadCQc+CAqeg01Vp7FFHpPitl@vger.kernel.org
X-Gm-Message-State: AOJu0YyczHYYcvXMRsRfBnwjvdbhKqBXOh6cPKAddZTVQEb8X05TtOBC
	J3F7agWJ/yAQTzDtEy3+pIRBopVdssSTQwrM1XcPPCX4aifZwQV4Uh/OtrUREynS2lcTrYk2Hn8
	HRFzXhWbPJx8s+p5bEBoDLUqcVri3wKvNUwmVQvsyv/zknhS1MRE+lyUHhcGpuURXIsxl
X-Gm-Gg: ASbGncsk3FCXi3TUf3tJfJPCK4CW0cIKkDgapBSRTMwQDiC6gMQeZF8vv9yiJCmVfZ8
	ejlylgaB3okSAxVwAzpfxPnBnXdiQbQBwibGJEnAVxukWrc2Z51O4IcHv4nl8Y01aG+5+dFu0dQ
	PJ0GnUCeP64SGQXLhYFPOfCmXurpgIFdKcEji9Gj092ezRnbZH8UNskzHacqnQRRHOxfkfe4Smc
	MtowfZ7Vxni1sK3PB6YWUSXGN92GIXF7pZ5G6pD9ugAt41JstTS6NPEJEH4gTL59/SliKpa7Ral
	vnLzT9mUGt06OrKmVjplf0Jd7i1OkSGwoPGSvQw0OWKrZcCNbbtVmlKh7selsN4fsoRZXbU4mXI
	HFkP3TH3yB0P1I2etrlLy5N8wDOzcEU2dk6xf1q3/ADkCuf9+cU57L90f
X-Received: by 2002:a05:622a:18a6:b0:4ed:1869:6c05 with SMTP id d75a77b69052e-4ed72338594mr57540501cf.5.1762422473666;
        Thu, 06 Nov 2025 01:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpuKuCWzp0t7fCbW5KVhS4FD/Jdg9+sVXbJS47KWq/o+LFPWmer47f/TSodncTzWe2GNegOw==
X-Received: by 2002:a05:622a:18a6:b0:4ed:1869:6c05 with SMTP id d75a77b69052e-4ed72338594mr57540311cf.5.1762422473198;
        Thu, 06 Nov 2025 01:47:53 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6412a27d68dsm516869a12.9.2025.11.06.01.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 01:47:51 -0800 (PST)
Message-ID: <4aface5d-66eb-41bb-b6f3-ee8ce5d5da6b@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 10:47:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI: host-common: Add an API to check for any device
 under the Root Ports
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com
References: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20251106061326.8241-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106061326.8241-2-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OCBTYWx0ZWRfXwCZNvYo++LHT
 kzKq3iAWR0mn7wYGKGfThttI/sM33K/csuyWGw5LaMgPM++7ySEAdShwcLN4CwDLjFb9HeFdprn
 L7Ed6f2X9wuPMqBDC4pKTZ5/ZhoZDsZX+/UL9ROGm0cZC1O8E453xSxUVbB25KmHk0U7Td//V9i
 sNtMtUHIslAH/5OkxG/N6WeyQtP3NWCXakD54FntWx4ZW8qJOHhlAhVaiymDaAAvQqXIBuALUY2
 b/3otFMPRQFoXUpeeW/Dn7pa2VQ2PIM+npLPcMN5mQC+Ela/jEjhXFt4itO1rpAaZONtyDnjrzT
 B4+qb6nmiEmoODtccvXvL8qOUy0XA07g0XD+vW4eUP5TcLaVaUE7w+bniLyj9Fp7ukzaGNy7sxO
 XJAfP9hUsVJu1rcFo/0pZXp3oMgmNg==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690c6eca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=X544SMn2G6euAj6E:21 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RsEGIJiJnbDJ2EEs828A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cv-IDYoeYKA2Rkt_c1A_uNCFwkQO-ZBQ
X-Proofpoint-ORIG-GUID: cv-IDYoeYKA2Rkt_c1A_uNCFwkQO-ZBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060078

On 11/6/25 7:13 AM, Manivannan Sadhasivam wrote:
> Some controller drivers need to check if there is any device available
> under the Root Ports. So add an API that returns 'true' if a device is
> found under any of the Root Ports, 'false' otherwise.
> 
> Controller drivers can use this API for usecases like turning off the
> controller resources only if there are no devices under the Root Ports,
> skipping PME_Turn_Off broadcast etc...
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/controller/pci-host-common.c | 21 +++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index 810d1c8de24e..6b4f90903dc6 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -17,6 +17,27 @@
>  
>  #include "pci-host-common.h"
>  
> +/**
> + * pci_root_ports_have_device - Check if the Root Ports under the Root bus have
> + *				any device underneath
> + * @dev: Root bus
> + *
> + * Return: true if a device is found, false otherwise
> + */
> +bool pci_root_ports_have_device(struct pci_bus *root_bus)
> +{
> +	struct pci_bus *child;
> +
> +	/* Iterate over the Root Port busses and look for any device */
> +	list_for_each_entry(child, &root_bus->children, node) {
> +		if (list_count_nodes(&child->devices))

Is this list ever shrunk? I grepped around and couldn't find where
that happens

Konrad

