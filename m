Return-Path: <linux-arm-msm+bounces-61506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC2ADBD09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 00:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22A2A1729FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 22:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6C321CC62;
	Mon, 16 Jun 2025 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4NdQ9fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7F282EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113787; cv=none; b=rKjeZybrIjiQl8Zcp2IJPKOW45y6Sa4lw1p1TPsaJFA4MAHhMfcd0uuhV17dxpd4+4ooLwCnyEI68tiLMiI0ndBoUcOz83H9BecpB1sd2QgN5PrR/6QtkSKLaBeo5QW6fioxdYH7MM48aPwzS9SorLJ7CaGxs4+4HFaE8oyJ5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113787; c=relaxed/simple;
	bh=zomONDQ0Qx37OkiETP/pnDcvQTypzvtXen0dGdSn/YE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VW6Abqxhk59fhckKdI4zGJalAShqFcn/+SVPTwCcKCPb0nHPT4owJ5Nj/irfBFDyxGtveQ/9QQ7Jzr0jy1V1YBRRit0oLvGpb+XULTKR3j1xMWS3z2f1wgIpvEadurucrQ/suu5DE8HSNxYGFKSFZ0DZTPM9+IJT73zGbH+tQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4NdQ9fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GG1l74019929
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xl/pk5AyXw9fWHquf+0bmU
	vgDIjx3jfKKP6iywcs/MU=; b=U4NdQ9fu+E1DUhB3+8fo5hzxXo8K8KkYEjIN8l
	ir+jT8ES00JHeEZ7BHv3GSu1hNK+0N/o3wXIrIYUrrrpPbrb81jW7hC8DTsuw84J
	D8drV/JYvWKj2d4VAOELGqaOAPZi5NR7q3BlI5TkZgXHmzxFlgD2Ofz+9FbajAW4
	92jxibIpjuBozG3DkV0hv6lRYdi0FcUmA4XmA3aJvlbNv+T33WaXLlWofCktqLlC
	5MGDtAfWoG//TvZp2Fz4zHE1DRWAeXDNLfJQ401/yO0ZRJiUzvNSvj2zYaIU2Ltq
	F3nHhvkFSs9hr/MJUU29v3ePzGaqwABXowgdN3rm7lklRPQA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfe4jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747d29e90b4so3843515b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113784; x=1750718584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl/pk5AyXw9fWHquf+0bmUvgDIjx3jfKKP6iywcs/MU=;
        b=jiLEMi/Z2wPLEWI4mD2XWYHnB3x7xHVUKGD1PhzapqCA+lJgEfIbYTxS6HdVFuUK0B
         KZs0zOFjBEpHY9/iGcGEjGrDQ3fVtHtWbLmAywvJQWzedNTaedy5hz7F0DClPkrWDAtw
         CdhiJUn5DZDcovCZtuL0nWvhGJA/xcxF5ry9d6Y2io2+QyioTKq2n37GLD9oymswphX5
         iht0hs0db0ZVD72s/Gi3DIxc09aGx3e/DY/aD/a5enLLIk0M956hVGutXfBorT5L7gQi
         5Xhfs58Jly8d4r4K4tBS6Pgg8N0Cu+Py4+prKyzja0f5jAmhGQFvznkQGZgCiRnUvHtn
         0Ncg==
X-Gm-Message-State: AOJu0YwvZaISOoq02T26FPBODtI8nz9BNF7f3p9l7eY6a8bPwLNAXwO6
	GYX1ww6xQlhJW4mrPhdBeJRqSAutC4eDTJunm23mbNEWqr8mo75hsZpHJN+5NV7A8ReCM1SS8pZ
	P0+sGVnAF/uUROCwHfUxQRovrF80JVAZIemT7T8x/O/Dw8aaWWtOgcqjk52Qz3vuRLj9N
X-Gm-Gg: ASbGncscGuA0R+dS0JVZCnrvzg1JSBZPsF02pQ6smx5hfnSYLMl1WZD+tlgbEg4VHVh
	Qta910ibcqfyhfMWmwmS5Y/zQ9fPdVoLew8r8SUf3nK3Y6fP5++GCZDsP6GCjWTXD9bVy/ibxX3
	XgdMkcVbaUV/cItCLHC4zloaONrzut5FejSYW4nzoeKPYxTOVj5Fxb4Nuib7uxNmOtQpFgR6w54
	Xjsy1hM0T6Emm6GKV1cTSmcfQu5yp75ggW4SycGt2tPIbMpjD9JtgY1crafhEy5L40iQd8KX+W1
	oLHEBvmBoJzt40edr1HEuSL8a9l6p/JQJiyqpU7hfMHAMQMaoEL7EaSsiRlOvlwR2xacFv5Z
X-Received: by 2002:a05:6a00:10c8:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-7489cff1950mr12695020b3a.10.1750113783761;
        Mon, 16 Jun 2025 15:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9UV9wLQcUsY/aC3vfdnxVaPe6n7TpuExyAehf70xpQMa7h1OtnP3qBq8I+prIqhHmzBkG7A==
X-Received: by 2002:a05:6a00:10c8:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-7489cff1950mr12694993b3a.10.1750113783346;
        Mon, 16 Jun 2025 15:43:03 -0700 (PDT)
Received: from hu-mrana-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083029sm7405077b3a.81.2025.06.16.15.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:43:02 -0700 (PDT)
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, will@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        andersson@kernel.org, mani@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_shazhuss@quicinc.com, quic_msarkar@quicinc.com,
        quic_nitegupt@quicinc.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add Qualcomm SA8255p based firmware managed PCIe root complex
Date: Mon, 16 Jun 2025 15:42:55 -0700
Message-Id: <20250616224259.3549811-1-mayank.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE2MiBTYWx0ZWRfX6KPQJ7O72MnJ
 9T/DI7/1RZfCcPaZOOyJAd1Wg6u0kpxgBFDGzqlSuJdR+73vpHCaXLqjr/wwzgchNHDRPRiSW5Z
 zt5EbaBLtyz+/t89rWJ8ytSZgaDnpSy9KKPQEt7uZsTtJQDBxySG5u0e83V5gFL+6L/F5ju7Y08
 JnZIuA0F22OFV2E9yu5e9KnLMbNj7r9rexruYmJ8bJ64X7ibrT54KYO2KPBYUXiZE0oq+949kVT
 zvU+mdCqyg1XQJJ55olMsXDqL/+7cDgMoa8VNKxYtE21fWcD/2ITR702i5vBh7nzOcbgs42SmxJ
 4kScm2mEewWq+DAZ3tgGWTUKRr5v+M/abIXwm4Ydtzq93Jr4KdngsZl3NJ0C96R1gDBJvoBYH4U
 XUwrSwLfoNvSxUVZSylxBitBz9FgW8RAzvQrPwPuNnXrS8R5Oir3GWLMg/NvDrS5e3ipmcu9
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68509df8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=cBYbKlKiy6JW2YU5ZBsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wgW0ks_9S1dQS6lb3R3GtiOvclbi9gME
X-Proofpoint-ORIG-GUID: wgW0ks_9S1dQS6lb3R3GtiOvclbi9gME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160162

Based on received feedback, this patch series adds support with existing
Linux qcom-pcie.c driver to get PCIe host root complex functionality on
Qualcomm SA8255P auto platform.

1. Interface to allow requesting firmware to manage system resources and
performing PCIe Link up (devicetree binding in terms of power domain and
runtime PM APIs is used in driver)

2. SA8255P is using Synopsys Designware PCIe controller which supports MSI
controller. Using existing MSI controller based functionality by exporting
important pcie dwc core driver based MSI APIs, and using those from
pcie-qcom.c driver.

Below architecture is used on Qualcomm SA8255P auto platform to get ECAM
compliant PCIe controller based functionality. Here firmware VM based PCIe
driver takes care of resource management and performing PCIe link related
handling (D0 and D3cold). Linux pcie-qcom.c driver uses power domain to
request firmware VM to perform these operations using SCMI interface.
--------------------


                                   ┌────────────────────────┐                                               
                                   │                        │                                               
  ┌──────────────────────┐         │     SHARED MEMORY      │            ┌──────────────────────────┐       
  │     Firmware VM      │         │                        │            │         Linux VM         │       
  │ ┌─────────┐          │         │                        │            │    ┌────────────────┐    │       
  │ │ Drivers │ ┌──────┐ │         │                        │            │    │   PCIE Qcom    │    │       
  │ │ PCIE PHY◄─┤      │ │         │   ┌────────────────┐   │            │    │    driver      │    │       
  │ │         │ │ SCMI │ │         │   │                │   │            │    │                │    │       
  │ │PCIE CTL │ │      │ ├─────────┼───►    PCIE        ◄───┼─────┐      │    └──┬──────────▲──┘    │       
  │ │         ├─►Server│ │         │   │    SHMEM       │   │     │      │       │          │       │       
  │ │Clk, Vreg│ │      │ │         │   │                │   │     │      │    ┌──▼──────────┴──┐    │       
  │ │GPIO,GDSC│ └─▲──┬─┘ │         │   └────────────────┘   │     └──────┼────┤PCIE SCMI Inst  │    │       
  │ └─────────┘   │  │   │         │                        │            │    └──▲──────────┬──┘    │       
  │               │  │   │         │                        │            │       │          │       │       
  └───────────────┼──┼───┘         │                        │            └───────┼──────────┼───────┘       
                  │  │             │                        │                    │          │               
                  │  │             └────────────────────────┘                    │          │               
                  │  │                                                           │          │               
                  │  │                                                           │          │               
                  │  │                                                           │          │               
                  │  │                                                           │IRQ       │HVC            
              IRQ │  │HVC                                                        │          │               
                  │  │                                                           │          │               
                  │  │                                                           │          │               
                  │  │                                                           │          │               
┌─────────────────┴──▼───────────────────────────────────────────────────────────┴──────────▼──────────────┐
│                                                                                                          │
│                                                                                                          │
│                                      HYPERVISOR                                                          │
│                                                                                                          │
│                                                                                                          │
│                                                                                                          │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────┘
                                                                                                            
  ┌─────────────┐    ┌─────────────┐  ┌──────────┐   ┌───────────┐   ┌─────────────┐  ┌────────────┐        
  │             │    │             │  │          │   │           │   │  PCIE       │  │   PCIE     │        
  │   CLOCK     │    │   REGULATOR │  │   GPIO   │   │   GDSC    │   │  PHY        │  │ controller │        
  └─────────────┘    └─────────────┘  └──────────┘   └───────────┘   └─────────────┘  └────────────┘        
-----------------
Changes in v5:
- Rebased changes to v6.16-rc1 kernel and updated proposed changes to accomodate new refactoring with pci-host-common.c file
Link to v4: https://patchwork.kernel.org/project/linux-pci/cover/20250522001425.1506240-1-mayank.rana@oss.qualcomm.com/ 

Changes in v4:
- Addressed provided review comments from reviewers
Link to v3: https://lore.kernel.org/lkml/20241106221341.2218416-1-quic_mrana@quicinc.com/

Changes in v3:
- Drop usage of PCIE host generic driver usage, and splitting of MSI functionality
- Modified existing pcie-qcom.c driver to add support for getting ECAM compliant and firmware managed
PCIe root complex functionality
Link to v2: https://lore.kernel.org/linux-arm-kernel/925d1eca-975f-4eec-bdf8-ca07a892361a@quicinc.com/T/

Changes in v2:
- Drop new PCIe Qcom ECAM driver, and use existing PCIe designware based MSI functionality
- Add power domain based functionality within existing ECAM driver
Link to v1: https://lore.kernel.org/all/d10199df-5fb3-407b-b404-a0a4d067341f@quicinc.com/T/                                                                                 

Tested:
- Validated NVME functionality with PCIe1 on SA8255P-RIDE platform

Mayank Rana (4):
  PCI: dwc: Export dwc MSI controller related APIs
  PCI: host-generic: Rename and export gen_pci_init() to allow ECAM
    creation
  dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM compliant PCIe root
    complex
  PCI: qcom: Add support for Qualcomm SA8255p based PCIe root complex

 .../bindings/pci/qcom,pcie-sa8255p.yaml       | 122 ++++++++++++++++++
 drivers/pci/controller/dwc/Kconfig            |   1 +
 .../pci/controller/dwc/pcie-designware-host.c |  38 +++---
 drivers/pci/controller/dwc/pcie-designware.h  |  14 ++
 drivers/pci/controller/dwc/pcie-qcom.c        | 116 +++++++++++++++--
 drivers/pci/controller/pci-host-common.c      |   5 +-
 drivers/pci/controller/pci-host-common.h      |   2 +
 7 files changed, 269 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.yaml

-- 
2.25.1


