Return-Path: <linux-arm-msm+bounces-61147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA5AD7D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2CA3B5613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 21:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4FC2D4B7A;
	Thu, 12 Jun 2025 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0svTzDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BCC156C69
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763451; cv=none; b=RaU9JsqMoL/EP9KBD+1sq3PrUeduIERmR8zi+u9UT4UNhr/9wifxshmtbflnVQI7LjQgmQ6+vRXjY2EdgCf5rsQSZ4bigyWEC1Ac1T9LWQjh7Rc8HoQktwScQTpQe8XIQpstcp8xbLxwHrz1J72G1GRYZevDXBmYN3tBOu4vrKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763451; c=relaxed/simple;
	bh=EAiFdZRb0iwdQ7gdqsgVwQKl6NqJs/YQOLPXfSliJ50=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QhjPim3/uEXgqa1+utElR3dqzjhFifzeQ35yV85rIsxNnPpQEUF8AtdYtw5kEJX+hhgDrRAQApKQ5Gpo5UnNqcvdqmSxBNmeaF21j4gqrC6U1J8PbnAyWD9rYVxcII2sfftR5cjyLr2U7P10bGbViWWaDzNH3qVgy3V1qouIulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0svTzDM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CKMwv2026009
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 21:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4kkaqz6aoxGxzS4kTIIcyBNqY3fNdzJXVUNZZZLfnE=; b=A0svTzDMFjZBJMSQ
	qmC9YDrXyO+28J483GHtxHwYApBrQNam0M7my+6AY2nuDc3r9QxxpKGiaB9wJM1y
	71aE6XuWmbm4/jFMn/gRO/83sWH4dbIgAm/VhqikjFXZqHTTOued/o2dgj25Z4xX
	d29f5TvThXd1S/v0C47c1zhmyNFXx00BRch1kmnEqxiyNs3IT9Qsb9ee1ai5Y6vj
	BTwXNRzWMyoU4+ldx8LwVbY7h3fLNvwthfRkilgvWZm8WA9moBl7g28f6n6ZVxW9
	ayzektr493EYn3yENzj81Zicveg1gJGFQyZqArFRmzem2u+KKcyUSWlPLexXJKen
	1gIdGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6hw8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 21:24:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747fa83d81dso1279554b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 14:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763447; x=1750368247;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4kkaqz6aoxGxzS4kTIIcyBNqY3fNdzJXVUNZZZLfnE=;
        b=Fdjr7CAkG66YROZlV+YY++44AqzpbL1lXYypLB+orBJHpeArDIOrHFd63ROsdpOWil
         4XYZxPpkAbJ5g3hFGaq0sB4wFj2XvEPOSYSr1qQav+6TUsLJwpVAPWdMhm6jtMorU5EF
         +c2GFkrWE/DjvXQpBKgPdEQLNe8kW17QUfiMIinpAHD2JGaYE6dRYPc7jplb6LAHL1LI
         zq8kii/FD6mx7Rr59QWXPiwDmXFdkAotdM04piDFLqWTGGwSRzWUp5BAJ/5rS3zo4hfj
         AcP8TWc3O3j3ZyGGEu7LIay2sVYgKQyVPsMIJXuklyQw7LnYINL81fWSEuuGBxv/saEi
         03XA==
X-Gm-Message-State: AOJu0YwYQAE71w4E4fBXRO6uQQjoNZyBdYAVR6/oPV+MI3L73g6fzR0a
	foGUUh0I6KgiX12CPbzhIuunEsbNLjrkqFb6M1ajC8ZJb/9t6oepkD8Zs8AO0TSuclc12+FCm0s
	22FNHBRbyBuNHxwkFzLICc3UJfWr7RqmhB9EYx5T26ZAv678kKhTX7EkHT6yr518dRPEkS/5G9a
	Q1
X-Gm-Gg: ASbGncsL9910DbnojDR39JzeKAEzLqXsrCSACOkLSBxy26vbP0ZqoM0vFnoi0MBCyjc
	MG89U1M7KMSIFyPKllFiORmOwtLOL1JeyV/uHjtf4U85xsoN8cBwyePLd7A2P2BhCc6WiNEpjHM
	s4Oe9H2yXO5IGobYJog+VG6EI/VUoM6OXYToRdarDzgz6jdp6hIjz0cxcvd1aKTAFe9s1u3R9bb
	RgtR41euQMTVQ4z244nfJo2S+fMB5gHN0/9d8CWTr7UOvFDSt8di9GGVlH8ab7vem4o/KLzAOlS
	wB7vYkQwc9rGoeA6XHda1IJ3GrV9q5esq/P3k/5dv4F4zM1hbFSgMLfY7n+ybk93
X-Received: by 2002:a05:6a00:3a04:b0:736:5438:ccc with SMTP id d2e1a72fcca58-7488f70d83amr946342b3a.9.1749763447190;
        Thu, 12 Jun 2025 14:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaro1S2SqADI8S7Y/c1VRuYB/ZsLniuDLm1/0zeqvd20a25ETugb6/sj+dQE9QI9PmVnCp5A==
X-Received: by 2002:a05:6a00:3a04:b0:736:5438:ccc with SMTP id d2e1a72fcca58-7488f70d83amr946307b3a.9.1749763446715;
        Thu, 12 Jun 2025 14:24:06 -0700 (PDT)
Received: from [10.73.112.69] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000749csm214938b3a.68.2025.06.12.14.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:24:06 -0700 (PDT)
Message-ID: <683bc42f-2810-4d8f-8712-80f933c4b8ad@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 14:24:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Qualcomm SA8255p based firmware managed PCIe
 root complex
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
        manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_shazhuss@quicinc.com, quic_msarkar@quicinc.com,
        quic_nitegupt@quicinc.com
References: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
 <584d217a-e8df-4dbe-ad70-2c69597a0545@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <584d217a-e8df-4dbe-ad70-2c69597a0545@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2NSBTYWx0ZWRfX3d7CNlqwnQ/n
 V44uyA/VfwZsc/+xeVscB1tZPFpXmwVhSYceXpWLbXQyHXRgBZxF7icC4vYzzeQ6bPRgGGBB0qf
 eqLUKL2L7FtM+AgKvocypyYV0BAKm28cUCTKX+bxF0iL5b8xFkIViEk1cMD4kKw/N6nTgJFYCj1
 KyMB62qtDBziuUxyATVz0qz8PxZ6OiRVzpW1f1Q9hDQlpSlMcRJqOAq+wmIoh9rEnF2LW2DNIPZ
 qVv86mRNrzqR9MDjoVu2YBGdGQxkqGgmfNvQ8WQPfI2tEFoaDprLODRyp0nJaBFlz7rcJ27iQQX
 bHm9f73kh7L4ONyNufrogGJmgvpJvioIUKBMFzZ0nDU4YVsf7TpJEA6rl95dKq0wo8wKZ3VkbtM
 A7g4R5ZHwmnD9DFfXHGla1CNH03E+6itKW9pbAkTVbJLVcz/fAGWcnxpyaIzv7SpLNUaqBth
X-Proofpoint-GUID: z27Wko_Hmok4GPpvTpEdQdva2XOj5aY8
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684b4578 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=zt2UopkEdLRU5ZEdUz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z27Wko_Hmok4GPpvTpEdQdva2XOj5aY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120165

Hi Mani

Gentle reminder for review.

Regards
Mayank

On 6/4/2025 10:38 AM, Mayank Rana wrote:
> Hi Mani
> 
> As we discussed previously, I resumed working on this functionality.
> Please help with reviewing this patchset.
> 
> Regards,
> Mayank
> On 5/21/2025 5:14 PM, Mayank Rana wrote:
>> Based on received feedback, this patch series adds support with existing
>> Linux qcom-pcie.c driver to get PCIe host root complex functionality on
>> Qualcomm SA8255P auto platform.
>>
>> 1. Interface to allow requesting firmware to manage system resources and
>> performing PCIe Link up (devicetree binding in terms of power domain and
>> runtime PM APIs is used in driver)
>>
>> 2. SA8255P is using Synopsys Designware PCIe controller which supports 
>> MSI
>> controller. Using existing MSI controller based functionality by 
>> exporting
>> important pcie dwc core driver based MSI APIs, and using those from
>> pcie-qcom.c driver.
>>
>> Below architecture is used on Qualcomm SA8255P auto platform to get ECAM
>> compliant PCIe controller based functionality. Here firmware VM based 
>> PCIe
>> driver takes care of resource management and performing PCIe link related
>> handling (D0 and D3cold). Linux pcie-qcom.c driver uses power domain to
>> request firmware VM to perform these operations using SCMI interface.
>> --------------------
>>
>>
>>                                     ┌────────────────────────┐
>>                                     │                        │
>>    ┌──────────────────────┐         │     SHARED MEMORY      
>> │            ┌──────────────────────────┐
>>    │     Firmware VM      │         │                        
>> │            │         Linux VM         │
>>    │ ┌─────────┐          │         │                        
>> │            │    ┌────────────────┐    │
>>    │ │ Drivers │ ┌──────┐ │         │                        
>> │            │    │   PCIE Qcom    │    │
>>    │ │ PCIE PHY◄─┤      │ │         │   ┌────────────────┐   
>> │            │    │    driver      │    │
>>    │ │         │ │ SCMI │ │         │   │                │   
>> │            │    │                │    │
>>    │ │PCIE CTL │ │      │ ├─────────┼───►    PCIE        
>> ◄───┼─────┐      │    └──┬──────────▲──┘    │
>>    │ │         ├─►Server│ │         │   │    SHMEM       │   │     
>> │      │       │          │       │
>>    │ │Clk, Vreg│ │      │ │         │   │                │   │     
>> │      │    ┌──▼──────────┴──┐    │
>>    │ │GPIO,GDSC│ └─▲──┬─┘ │         │   └────────────────┘   │     
>> └──────┼────┤PCIE SCMI Inst  │    │
>>    │ └─────────┘   │  │   │         │                        
>> │            │    └──▲──────────┬──┘    │
>>    │               │  │   │         │                        
>> │            │       │          │       │
>>    └───────────────┼──┼───┘         │                        
>> │            └───────┼──────────┼───────┘
>>                    │  │             │                        
>> │                    │          │
>>                    │  │             
>> └────────────────────────┘                    │          │
>>                    │  
>> │                                                           │          │
>>                    │  
>> │                                                           │          │
>>                    │  
>> │                                                           │          │
>>                    │  
>> │                                                           │IRQ       
>> │HVC
>>                IRQ │  
>> │HVC                                                        │          │
>>                    │  
>> │                                                           │          │
>>                    │  
>> │                                                           │          │
>>                    │  
>> │                                                           │          │
>> ┌─────────────────┴──▼───────────────────────────────────────────────────────────┴──────────▼──────────────┐
>> │                                                                                                          │
>> │                                                                                                          │
>> │                                      
>> HYPERVISOR                                                          │
>> │                                                                                                          │
>> │                                                                                                          │
>> │                                                                                                          │
>> └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
>>    ┌─────────────┐    ┌─────────────┐  ┌──────────┐   ┌───────────┐   
>> ┌─────────────┐  ┌────────────┐
>>    │             │    │             │  │          │   │           │   
>> │  PCIE       │  │   PCIE     │
>>    │   CLOCK     │    │   REGULATOR │  │   GPIO   │   │   GDSC    │   
>> │  PHY        │  │ controller │
>>    └─────────────┘    └─────────────┘  └──────────┘   └───────────┘   
>> └─────────────┘  └────────────┘
>> -----------------
>> Changes in v4:
>> - Addressed provided review comments from reviewers
>> Link to v3: https://lore.kernel.org/lkml/20241106221341.2218416-1- 
>> quic_mrana@quicinc.com/
>>
>> Changes in v3:
>> - Drop usage of PCIE host generic driver usage, and splitting of MSI 
>> functionality
>> - Modified existing pcie-qcom.c driver to add support for getting ECAM 
>> compliant and firmware managed
>> PCIe root complex functionality
>> Link to v2: https://lore.kernel.org/linux-arm- 
>> kernel/925d1eca-975f-4eec-bdf8-ca07a892361a@quicinc.com/T/
>>
>> Changes in v2:
>> - Drop new PCIe Qcom ECAM driver, and use existing PCIe designware 
>> based MSI functionality
>> - Add power domain based functionality within existing ECAM driver
>> Link to v1: https://lore.kernel.org/all/d10199df-5fb3-407b-b404- 
>> a0a4d067341f@quicinc.com/T/
>>
>> Tested:
>> - Validated NVME functionality with PCIe1 on SA8255P-RIDE platform
>>
>> Mayank Rana (4):
>>    PCI: dwc: Export dwc MSI controller related APIs
>>    PCI: host-generic: Rename and export gen_pci_init() API to allow ECAM
>>      creation
>>    dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM compliant PCIe root
>>      complex
>>    PCI: qcom: Add Qualcomm SA8255p based PCIe root complex functionality
>>
>>   .../bindings/pci/qcom,pcie-sa8255p.yaml       | 103 ++++++++++++++++
>>   drivers/pci/controller/dwc/Kconfig            |   1 +
>>   .../pci/controller/dwc/pcie-designware-host.c |  38 +++---
>>   drivers/pci/controller/dwc/pcie-designware.h  |  14 +++
>>   drivers/pci/controller/dwc/pcie-qcom.c        | 114 ++++++++++++++++--
>>   drivers/pci/controller/pci-host-common.c      |   5 +-
>>   include/linux/pci-ecam.h                      |   2 +
>>   7 files changed, 248 insertions(+), 29 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie- 
>> sa8255p.yaml
>>
> 


