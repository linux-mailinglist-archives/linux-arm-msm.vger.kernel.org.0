Return-Path: <linux-arm-msm+bounces-60255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5FACE3C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 19:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FFD3A51AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 17:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744D21DE3AC;
	Wed,  4 Jun 2025 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlXBYn9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83901ACEDA
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749058746; cv=none; b=O7vqO59fBqd5/2ZiUr7VZmg8vl+JdEzrGR2jRlXZ4bPSUjdyomqsh2EKtdSuiBT9tdCeyIxKu04flN9AC86AgrIse+Fyt6RGjDIZ85daEi2V9fP8Y/0uYTuITOtHh7uQYSSS/KB83WKrKUQBMG95VoEg4JIOnJLDmbdw0aVN/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749058746; c=relaxed/simple;
	bh=jroGMO5AkV8Ovxz0MYp5BHp3GgjYnVkrNMoKqqHJPBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onsCMRWQg8ROzPuPDT+RnLr5JEq95VvFpe93Ra8UVDN25cVNYnznR/JwYLGMG1IsIpJsP47DF1gO4j2V7tOj6rt3etaXR41qg+EdoaDLW1IBdJdDEA17xlIooufkBS19xfw8rLXkTgLjMN4mFrzZHMEcVHfP/zcq0aV81cEQKMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlXBYn9i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549IT3R013814
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 17:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsF/mWMPVk1F5lUmzbIbWurkFTDnR1ya0VDDIO7Ymwo=; b=jlXBYn9iZYcTArub
	8dH4uWTeD4R32qi5AcexBzSm58lYDf/jsa2lFUkf1s2PSQCpvEyvrVM+oGyPV5pj
	fcg1wnGghi3oqUIYY3ldXq0b2VLJvCfwRZWqCGoTyLFVL7Fkpmh4u7R5Wkbz+APo
	IOrR3ZB8oADiDIEz1TxUTskxuP4z4oJgwXlq/ijbt5/HSiHTqEK8virQqotA8Waj
	ydV8fgVdrOX5vsmAxEwMQmC2N5+QMer2kd1SNRT55NZt6GVO+l3Z2Sa3BFiOOypX
	5U+YnECh6a7nPuntKmKWRExHf0TOCGWRtTc3tUJ8WXHRbhyMqfkX8XQtWvP7o5ro
	r23Tew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sxv3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 17:39:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742951722b3so106215b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 10:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058743; x=1749663543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsF/mWMPVk1F5lUmzbIbWurkFTDnR1ya0VDDIO7Ymwo=;
        b=Jv0MGz3yT0HDbNjQKqj8d5hFI5N0Z2qi5hJ3feWxmR6DfYaM6jgAH/oUHyDigZaY8J
         Ng9De6jG23jDRPgcSwgwOZNBH5VfRfAiagnej7Cq7nYFkkOtnEMWH7A2g2M7SKUqbCd3
         TwkkbNrKQ07UHI1ztErB3aoyKZpqYJo2gkYsGMx3wPtjRaZ/Ygxb4f4nQpABVfOh4JFR
         +rnd3fRqB09bvIyQEPOWuwfB3k5CDRtl2m46eYNmMyWv+X2KxU47PCFsKTDDl0WOjYpO
         bvOfCFU0Q3YwiIPpuy2z253YSkI+hk3p2qjj3LYqezKal5nuTjOky1sG0wrUPSgWexB8
         GuZQ==
X-Gm-Message-State: AOJu0Yy/Ka8pMZwkBmefD3QD5viPNkMYg2lW6nLEgSHdIUBQ4GxnAoAu
	b4jXo3SSgP/xfkAZqgszrM33Yle9FDQfA0JBYXfew29jV9oSAB1p1TEpvmEzZ1GX5iMXJCSCkyN
	S1sNcSDOgrpZotxuuOIzEkmAmcnUBaJ/HdZW4b72y2e2UIYr6t+9MnvdbAFZAY9BOnFz1
X-Gm-Gg: ASbGnculwW9gI4pyHNT2BAxHlBsK++YG0SKgUfAmVebCAQLYoMOWXCh/BL7z6gz8ZFD
	deHke3hg3OZriBPHb4FJlwfNR8z4kYzVOmybdPR4/UKEbtCxj8Dwtq0QXJK1i6RXnD6cDiYOgLp
	u4IwexWq3AbHS43iweVqFC+XlH6fy3tuu9AdtuSdiaXdL6F0AwaQuUvX3cM8/Fak8UGkSWSIUa9
	ypAUgUcetR0RjqiDrHclcxEoMCErZpiYppAtGwewYZsqgYt6AXLgbArmoGOYubj5bLI2ctqLNlf
	USqrjMNIzwz53/a6fNbV9nPUDYKVMDXb1pi82ws05RUqkukAxygEtHw=
X-Received: by 2002:a05:6a00:3991:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-7480b28ae10mr5330864b3a.2.1749058742944;
        Wed, 04 Jun 2025 10:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAMU3gjS9f0zLmHXLR+uJZMjk9c4OLrEdUrP5tIKUjh1bzGk6Z9HQjnSf4ko+2ScZjIrvJ0g==
X-Received: by 2002:a05:6a00:3991:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-7480b28ae10mr5330830b3a.2.1749058742447;
        Wed, 04 Jun 2025 10:39:02 -0700 (PDT)
Received: from [10.73.113.218] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7e3bsm11752681b3a.175.2025.06.04.10.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 10:39:01 -0700 (PDT)
Message-ID: <584d217a-e8df-4dbe-ad70-2c69597a0545@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 10:38:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Qualcomm SA8255p based firmware managed PCIe
 root complex
To: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
        manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_nkela@quicinc.com, quic_shazhuss@quicinc.com,
        quic_msarkar@quicinc.com, quic_nitegupt@quicinc.com
References: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=684084b7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=X0UA8UkCL550gklx81IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzNyBTYWx0ZWRfX0Fq1ubRe1t8o
 LL+Rh7jV9SuYtSrNyF1roi6PDy0ncYsfg1KLpxCR2rAgmKuNRgo7r79CC/mcn3t4RMgi8OlGG7i
 6kHyBXTpdE6Zk3cGfvtABCCibsdz3notIThcKOq/kOin+tWAiZNGj+XB3zKOip1TAOxRX7Aw4kt
 e5gWV2k/3khDM23fyq9d2OJ3SmOJpkMmZndhoKBbq9/l4N7pxVmyClDk4Z3OtkGc1al+Ow4dy3W
 3BNZrN1Ik0uJCa6jci23SFKURAeMSIPHZZr3P6TiTcLo62ZEUJDX/c+PzdykwkqOCK/uOeW5T9U
 tYosrpNtIYd8wcSAnmoLaA6JkGpnLKeR0cxAvFDdeXDNNj1vtjn0lC8DVlRNLD+KWNp87c9z67q
 cBuhHInU4jcfCw2TmUgQBbxCTbQD24AgLDnrFz3B9GkYpoQMcONSzz7tS/YjGFy1pxPIAHOx
X-Proofpoint-GUID: n0sl2-fZy53L_8I9kC9iAOpocaV6zfcq
X-Proofpoint-ORIG-GUID: n0sl2-fZy53L_8I9kC9iAOpocaV6zfcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040137

Hi Mani

As we discussed previously, I resumed working on this functionality.
Please help with reviewing this patchset.

Regards,
Mayank
On 5/21/2025 5:14 PM, Mayank Rana wrote:
> Based on received feedback, this patch series adds support with existing
> Linux qcom-pcie.c driver to get PCIe host root complex functionality on
> Qualcomm SA8255P auto platform.
> 
> 1. Interface to allow requesting firmware to manage system resources and
> performing PCIe Link up (devicetree binding in terms of power domain and
> runtime PM APIs is used in driver)
> 
> 2. SA8255P is using Synopsys Designware PCIe controller which supports MSI
> controller. Using existing MSI controller based functionality by exporting
> important pcie dwc core driver based MSI APIs, and using those from
> pcie-qcom.c driver.
> 
> Below architecture is used on Qualcomm SA8255P auto platform to get ECAM
> compliant PCIe controller based functionality. Here firmware VM based PCIe
> driver takes care of resource management and performing PCIe link related
> handling (D0 and D3cold). Linux pcie-qcom.c driver uses power domain to
> request firmware VM to perform these operations using SCMI interface.
> --------------------
> 
> 
>                                     ┌────────────────────────┐
>                                     │                        │
>    ┌──────────────────────┐         │     SHARED MEMORY      │            ┌──────────────────────────┐
>    │     Firmware VM      │         │                        │            │         Linux VM         │
>    │ ┌─────────┐          │         │                        │            │    ┌────────────────┐    │
>    │ │ Drivers │ ┌──────┐ │         │                        │            │    │   PCIE Qcom    │    │
>    │ │ PCIE PHY◄─┤      │ │         │   ┌────────────────┐   │            │    │    driver      │    │
>    │ │         │ │ SCMI │ │         │   │                │   │            │    │                │    │
>    │ │PCIE CTL │ │      │ ├─────────┼───►    PCIE        ◄───┼─────┐      │    └──┬──────────▲──┘    │
>    │ │         ├─►Server│ │         │   │    SHMEM       │   │     │      │       │          │       │
>    │ │Clk, Vreg│ │      │ │         │   │                │   │     │      │    ┌──▼──────────┴──┐    │
>    │ │GPIO,GDSC│ └─▲──┬─┘ │         │   └────────────────┘   │     └──────┼────┤PCIE SCMI Inst  │    │
>    │ └─────────┘   │  │   │         │                        │            │    └──▲──────────┬──┘    │
>    │               │  │   │         │                        │            │       │          │       │
>    └───────────────┼──┼───┘         │                        │            └───────┼──────────┼───────┘
>                    │  │             │                        │                    │          │
>                    │  │             └────────────────────────┘                    │          │
>                    │  │                                                           │          │
>                    │  │                                                           │          │
>                    │  │                                                           │          │
>                    │  │                                                           │IRQ       │HVC
>                IRQ │  │HVC                                                        │          │
>                    │  │                                                           │          │
>                    │  │                                                           │          │
>                    │  │                                                           │          │
> ┌─────────────────┴──▼───────────────────────────────────────────────────────────┴──────────▼──────────────┐
> │                                                                                                          │
> │                                                                                                          │
> │                                      HYPERVISOR                                                          │
> │                                                                                                          │
> │                                                                                                          │
> │                                                                                                          │
> └──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
>                                                                                                              
>    ┌─────────────┐    ┌─────────────┐  ┌──────────┐   ┌───────────┐   ┌─────────────┐  ┌────────────┐
>    │             │    │             │  │          │   │           │   │  PCIE       │  │   PCIE     │
>    │   CLOCK     │    │   REGULATOR │  │   GPIO   │   │   GDSC    │   │  PHY        │  │ controller │
>    └─────────────┘    └─────────────┘  └──────────┘   └───────────┘   └─────────────┘  └────────────┘
> -----------------
> Changes in v4:
> - Addressed provided review comments from reviewers
> Link to v3: https://lore.kernel.org/lkml/20241106221341.2218416-1-quic_mrana@quicinc.com/
> 
> Changes in v3:
> - Drop usage of PCIE host generic driver usage, and splitting of MSI functionality
> - Modified existing pcie-qcom.c driver to add support for getting ECAM compliant and firmware managed
> PCIe root complex functionality
> Link to v2: https://lore.kernel.org/linux-arm-kernel/925d1eca-975f-4eec-bdf8-ca07a892361a@quicinc.com/T/
> 
> Changes in v2:
> - Drop new PCIe Qcom ECAM driver, and use existing PCIe designware based MSI functionality
> - Add power domain based functionality within existing ECAM driver
> Link to v1: https://lore.kernel.org/all/d10199df-5fb3-407b-b404-a0a4d067341f@quicinc.com/T/
> 
> Tested:
> - Validated NVME functionality with PCIe1 on SA8255P-RIDE platform
> 
> Mayank Rana (4):
>    PCI: dwc: Export dwc MSI controller related APIs
>    PCI: host-generic: Rename and export gen_pci_init() API to allow ECAM
>      creation
>    dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM compliant PCIe root
>      complex
>    PCI: qcom: Add Qualcomm SA8255p based PCIe root complex functionality
> 
>   .../bindings/pci/qcom,pcie-sa8255p.yaml       | 103 ++++++++++++++++
>   drivers/pci/controller/dwc/Kconfig            |   1 +
>   .../pci/controller/dwc/pcie-designware-host.c |  38 +++---
>   drivers/pci/controller/dwc/pcie-designware.h  |  14 +++
>   drivers/pci/controller/dwc/pcie-qcom.c        | 114 ++++++++++++++++--
>   drivers/pci/controller/pci-host-common.c      |   5 +-
>   include/linux/pci-ecam.h                      |   2 +
>   7 files changed, 248 insertions(+), 29 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml
> 


