Return-Path: <linux-arm-msm+bounces-61493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C3ADB886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 20:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286AE3AADD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153628934C;
	Mon, 16 Jun 2025 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFCYGbzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBE288C9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097291; cv=none; b=jqLCbFuA5URju6QXG0w6AHuuvoAC6P0wp18VFDJbSP/CjfQ+VGLPNR6U8VzpNdgV7DCUzjd8AJLZIZFqGexYlhtyJw1+pghwoLeMMi7elDBmWJqkaoVUPI82ehYEMZphC4QW75zTmY9tyOvoZpO5pt0CglsOD0PNxU/aP/u4WvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097291; c=relaxed/simple;
	bh=40Pdi6ft+usWK3MhK+AiH73KsRq0ZaqgfM+1c54RgBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfw6hK5XSm37DpvfjgpaL12DMoJJRhOXDRoTDugUVaKiD/Q/Ah1K5zlwUn2o7P7HO0QBlTMam21BXKOw28FyYUG/LaKmcjx1ejtsaEXdyRxr8CAGcno1pCyidlcNUlORZITlkA8sHKoJCCRuNAPiVpJRqSLK2Hy9Wq+pE5oR0yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFCYGbzo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GGnHFA026180
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 18:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5P3OJPWWK/eACSXhWhO+72qcM502Hj+4pvlf7UjgIcs=; b=GFCYGbzoLDDU8zEz
	zEi9lYNQ1WanyeXzFb+LLpCrOhj9EceuuRoGr5FkxyLnp70J/Ucedxp6YSDoW9go
	r2OSHZRoN5ZYX/Dzxf+aYZfSQhKCrWRL9YhPRGckqgUHI+1UhTUQRx6mKynOoio2
	RHn1741qG9846QDkqUjp2u11rJvsAus6fYzeidApFQigeNbB0mHiM8q+xCFqtmdP
	gY2fSvlug4jtXxF9SFs5FzGuLwxOovyh0XKdxE+GYPHtd8DxMRKORHvv0HxpGl4E
	NThAbusKOjUPQOXTDZ66XUxisZNEPKESjkVjD8XWBHmOHWyWZn2SYLwdx+fdbMzR
	Lih9Aw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f75gqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 18:08:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so4111145a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097287; x=1750702087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5P3OJPWWK/eACSXhWhO+72qcM502Hj+4pvlf7UjgIcs=;
        b=GlQQL51DHb//ufKTSpYH26aaTOWFbdKWp8fV+zWrbNhCGI2JfZKUIZ2jsQM4Mz6voI
         E/2TBLZ0gptSkcAn5AJGTO0DxnnYvH0onU+lDnjEkHUaKAPVe34cfsg1vChTYlHhbeRH
         SqKsmQUr4qrdIIVOxs/cVX8JSahb4YY8paVkgQ2HivugBr582Hm8hCQo/3B2mMq+m5wJ
         C2+RZV/sbFGciIxW1DvzD8M2R7rRqOp7/7Q/mTMACK863f86kcHI/fmZSfWDzdhujdbd
         T62IQ5unVojWWFPM+YgdFL/HVda6GiQZZ6rLrA81iAWOoOav/hpCTppBHcQoZD1iGrq9
         Z8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/h+Lgdwam8RmmgA4mFZsP0bTYH6Th33PzprGXyVbRpbHE4WJTLJuVjNFxE5j0Aeq93UfYW9pKmUbpUs7U@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3y/yZ0+0iMy2cgdlZsQ4Rcay/VlEFl4+wtTPnayo6kMlHthG
	G3R0f5usbl0H8V2M1FTlF0Fe6MCEr06WcOH0UIhIfPCRMrOyjaXcQVzgMpYqnHHlIWJDIxgm+Ko
	EdsueVsYIx385ofJZ2HykCS8sQAJMUxsKqRIvjP7avyXGFLg4r8gLeKsWIYAA6e5ZNPKu
X-Gm-Gg: ASbGncu4e0DPDl+rkL/Ng+Ggqj0ZrU3pAkI5CY6Al1vK/5HpXOTdR80wdKj8t0svvUw
	Fpyw8MtlnmHdfGkRXta35eKtN8BFvDZfFSidoqVjFSYnaRVsYZhFHDKuwfgp81R/5F9E3XZdU6E
	rC0qcxz7uHoNqNkJYblopYA35nJtRxjhrDVUztW6xE5462QSIBoed39/LtP/od6uGER/uwa2PoN
	KlxSqSnqyJED6tloec2TX5Rcc6o0SKY4p6DlEn3oTKbOONdeasNvJGtvDdRrdIyl4GBJQXlLFM+
	k6WFyc0tXmkYrLWYcRE/ZE3bp36IFvyn4AzND8lSkXC9HitSvmYyF1Wn5C8t3/ro
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id 98e67ed59e1d1-313f1d50e08mr14807668a91.20.1750097287071;
        Mon, 16 Jun 2025 11:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5xe+5gKXULEPyAiTbu6WxhTiAVcnqfginomJSMt1/TlYTo89ZZKCN390FUIak6t4p8BnjBg==
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id 98e67ed59e1d1-313f1d50e08mr14807622a91.20.1750097286565;
        Mon, 16 Jun 2025 11:08:06 -0700 (PDT)
Received: from [10.73.112.69] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb23e9sm64211205ad.187.2025.06.16.11.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:08:05 -0700 (PDT)
Message-ID: <20a4c01e-d2be-4846-abc6-b2d477975249@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 11:08:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Qualcomm SA8255p based firmware managed PCIe
 root complex
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
        manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_shazhuss@quicinc.com, quic_msarkar@quicinc.com,
        quic_nitegupt@quicinc.com
References: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
 <584d217a-e8df-4dbe-ad70-2c69597a0545@oss.qualcomm.com>
 <683bc42f-2810-4d8f-8712-80f933c4b8ad@oss.qualcomm.com>
 <4yscxqds72lsrdld7tadnlcuk7q6hir3t6mwliu35aljn34veb@hme5q4dpind7>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <4yscxqds72lsrdld7tadnlcuk7q6hir3t6mwliu35aljn34veb@hme5q4dpind7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyMSBTYWx0ZWRfX7Sbu215JNhfv
 HnXbuH0T7/4gFy/p4dFxuP0WxRwCKHCIBYpr8SXM6H7YxLmrveCjhGQgaMiM0gtIP2HS3NxfbUn
 8qiVMz4BkbBncbCfrKm1AW83YcXpgX/BERxo3CNVjD4YDgG4Mk4gSfUGYNUz9lKxwotgcDhRNEk
 kpZEGedXlRcSvf8KJ79hviF2uZKngGn6Igmq3FgdAtvJTxvrGaCpiMK6FYT8bvmlwtEUgiF2fCa
 Mo12lOKXYV2CLoi5BXPEliFcejk8VApQ9HxRIsoxMjBrv9PmxGmSU07K/o1lf/KT6Gu2GOEvnDb
 57iijOwZRXTXAG0SvGM2JEI7lki5qd5n5bLV3W7cnyrmaWmWYUirulgkMJUPaqnRhwDDrcJtmy8
 VDjzh6ZKKfPi+w7OV2R9JgbGccA2BBaSWOvfWcHkhQDtNPKzqxgpi/lYFrpkHUoYCRC9pxNK
X-Proofpoint-GUID: ZLEO1YJLafA5rQhyNAaPgDTB3cmEn6Ic
X-Proofpoint-ORIG-GUID: ZLEO1YJLafA5rQhyNAaPgDTB3cmEn6Ic
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68505d88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=p2hmFKtYKpLvcVhyiQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160121

Hi Mani

On 6/13/2025 2:29 AM, Manivannan Sadhasivam wrote:
> On Thu, Jun 12, 2025 at 02:24:04PM -0700, Mayank Rana wrote:
>> Hi Mani
>>
>> Gentle reminder for review.
>>
> 
> These patches are not applying on top of v6.16-rc1. Please post the rebased
> version.
ok. will rebase changes and resend it.

Thanks.

Regards,
Mayank

> - Mani
> 
>> Regards
>> Mayank
>>
>> On 6/4/2025 10:38 AM, Mayank Rana wrote:
>>> Hi Mani
>>>
>>> As we discussed previously, I resumed working on this functionality.
>>> Please help with reviewing this patchset.
>>>
>>> Regards,
>>> Mayank
>>> On 5/21/2025 5:14 PM, Mayank Rana wrote:
>>>> Based on received feedback, this patch series adds support with existing
>>>> Linux qcom-pcie.c driver to get PCIe host root complex functionality on
>>>> Qualcomm SA8255P auto platform.
>>>>
>>>> 1. Interface to allow requesting firmware to manage system resources and
>>>> performing PCIe Link up (devicetree binding in terms of power domain and
>>>> runtime PM APIs is used in driver)
>>>>
>>>> 2. SA8255P is using Synopsys Designware PCIe controller which
>>>> supports MSI
>>>> controller. Using existing MSI controller based functionality by
>>>> exporting
>>>> important pcie dwc core driver based MSI APIs, and using those from
>>>> pcie-qcom.c driver.
>>>>
>>>> Below architecture is used on Qualcomm SA8255P auto platform to get ECAM
>>>> compliant PCIe controller based functionality. Here firmware VM
>>>> based PCIe
>>>> driver takes care of resource management and performing PCIe link related
>>>> handling (D0 and D3cold). Linux pcie-qcom.c driver uses power domain to
>>>> request firmware VM to perform these operations using SCMI interface.
>>>> --------------------
>>>>
>>>>
>>>>                                      ┌────────────────────────┐
>>>>                                      │                        │
>>>>     ┌──────────────────────┐         │     SHARED MEMORY
>>>> │            ┌──────────────────────────┐
>>>>     │     Firmware VM      │         │
>>>> │            │         Linux VM         │
>>>>     │ ┌─────────┐          │         │
>>>> │            │    ┌────────────────┐    │
>>>>     │ │ Drivers │ ┌──────┐ │         │
>>>> │            │    │   PCIE Qcom    │    │
>>>>     │ │ PCIE PHY◄─┤      │ │         │   ┌────────────────┐
>>>> │            │    │    driver      │    │
>>>>     │ │         │ │ SCMI │ │         │   │                │
>>>> │            │    │                │    │
>>>>     │ │PCIE CTL │ │      │ ├─────────┼───►    PCIE
>>>> ◄───┼─────┐      │    └──┬──────────▲──┘    │
>>>>     │ │         ├─►Server│ │         │   │    SHMEM       │   │
>>>> │      │       │          │       │
>>>>     │ │Clk, Vreg│ │      │ │         │   │                │   │
>>>> │      │    ┌──▼──────────┴──┐    │
>>>>     │ │GPIO,GDSC│ └─▲──┬─┘ │         │   └────────────────┘   │
>>>> └──────┼────┤PCIE SCMI Inst  │    │
>>>>     │ └─────────┘   │  │   │         │
>>>> │            │    └──▲──────────┬──┘    │
>>>>     │               │  │   │         │
>>>> │            │       │          │       │
>>>>     └───────────────┼──┼───┘         │
>>>> │            └───────┼──────────┼───────┘
>>>>                     │  │             │
>>>> │                    │          │
>>>>                     │  │
>>>> └────────────────────────┘                    │          │
>>>>                     │
>>>> │
>>>> │          │
>>>>                     │
>>>> │
>>>> │          │
>>>>                     │
>>>> │
>>>> │          │
>>>>                     │
>>>> │                                                           │IRQ
>>>> │HVC
>>>>                 IRQ │
>>>> │HVC
>>>> │          │
>>>>                     │
>>>> │
>>>> │          │
>>>>                     │
>>>> │
>>>> │          │
>>>>                     │
>>>> │
>>>> │          │
>>>> ┌─────────────────┴──▼───────────────────────────────────────────────────────────┴──────────▼──────────────┐
>>>> │                                                                                                          │
>>>> │                                                                                                          │
>>>> │
>>>> HYPERVISOR
>>>> │
>>>> │                                                                                                          │
>>>> │                                                                                                          │
>>>> │                                                                                                          │
>>>> └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
>>>>     ┌─────────────┐    ┌─────────────┐  ┌──────────┐   ┌───────────┐
>>>> ┌─────────────┐  ┌────────────┐
>>>>     │             │    │             │  │          │   │           │
>>>> │  PCIE       │  │   PCIE     │
>>>>     │   CLOCK     │    │   REGULATOR │  │   GPIO   │   │   GDSC    │
>>>> │  PHY        │  │ controller │
>>>>     └─────────────┘    └─────────────┘  └──────────┘   └───────────┘
>>>> └─────────────┘  └────────────┘
>>>> -----------------
>>>> Changes in v4:
>>>> - Addressed provided review comments from reviewers
>>>> Link to v3: https://lore.kernel.org/lkml/20241106221341.2218416-1-
>>>> quic_mrana@quicinc.com/
>>>>
>>>> Changes in v3:
>>>> - Drop usage of PCIE host generic driver usage, and splitting of MSI
>>>> functionality
>>>> - Modified existing pcie-qcom.c driver to add support for getting
>>>> ECAM compliant and firmware managed
>>>> PCIe root complex functionality
>>>> Link to v2: https://lore.kernel.org/linux-arm-
>>>> kernel/925d1eca-975f-4eec-bdf8-ca07a892361a@quicinc.com/T/
>>>>
>>>> Changes in v2:
>>>> - Drop new PCIe Qcom ECAM driver, and use existing PCIe designware
>>>> based MSI functionality
>>>> - Add power domain based functionality within existing ECAM driver
>>>> Link to v1: https://lore.kernel.org/all/d10199df-5fb3-407b-b404-
>>>> a0a4d067341f@quicinc.com/T/
>>>>
>>>> Tested:
>>>> - Validated NVME functionality with PCIe1 on SA8255P-RIDE platform
>>>>
>>>> Mayank Rana (4):
>>>>     PCI: dwc: Export dwc MSI controller related APIs
>>>>     PCI: host-generic: Rename and export gen_pci_init() API to allow ECAM
>>>>       creation
>>>>     dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM compliant PCIe root
>>>>       complex
>>>>     PCI: qcom: Add Qualcomm SA8255p based PCIe root complex functionality
>>>>
>>>>    .../bindings/pci/qcom,pcie-sa8255p.yaml       | 103 ++++++++++++++++
>>>>    drivers/pci/controller/dwc/Kconfig            |   1 +
>>>>    .../pci/controller/dwc/pcie-designware-host.c |  38 +++---
>>>>    drivers/pci/controller/dwc/pcie-designware.h  |  14 +++
>>>>    drivers/pci/controller/dwc/pcie-qcom.c        | 114 ++++++++++++++++--
>>>>    drivers/pci/controller/pci-host-common.c      |   5 +-
>>>>    include/linux/pci-ecam.h                      |   2 +
>>>>    7 files changed, 248 insertions(+), 29 deletions(-)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/pci/qcom,pcie- sa8255p.yaml
>>>>
>>>
>>
> 


