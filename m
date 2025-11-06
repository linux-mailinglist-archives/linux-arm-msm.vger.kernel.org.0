Return-Path: <linux-arm-msm+bounces-80518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B2FC393EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 07:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E10E4F8609
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 06:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F822DC764;
	Thu,  6 Nov 2025 06:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv7C8IWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KX+i5+PW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879132E11DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762409620; cv=none; b=jTLRITfOGHIJmJ1PckMAtxKg/IbNBGI6SjgvolJ7vMRKC8ppI7RxRVtOpvhyQBAao+SqlyjYu+fHAqG/ip4Gfr/rGgJJDCD/AryqRNwzh7uUFw2CJ2CEg0FVvYovwwYodwj4NTfIuOQ2w7bhvFGkLhJiPhZGQo8XnivHE4cZfFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762409620; c=relaxed/simple;
	bh=DYLwHmGdJ3coXsTh0PPuy3fj9KL/zT5BoMmCnNKTDA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwRgMBJCsbLc9fXXCXNF6S/8mRtyQSOH8OXU7lEKqVmHBy85N5JjQcPJM/DYDA0sAZHgCnhPxXhGC60szrr/4Ye3bv3hOVjAGskLnoyJ9ilO9+lgASSxsDoOMHnYC8iGJtnMozcj5t9FahVLCYiCFZclAwTArh6gVJE0I6nECDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv7C8IWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KX+i5+PW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFXFf1657343
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 06:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hP3iVDjjm1Yh6lCxDh4PcKbNlm1B6eEBTsx
	Er8EUr5Q=; b=Fv7C8IWKKNTfWD7DUqKuBJ+G1XHzrQsl8QL66j8W33JsZeKpXbv
	mghddo2CKE6qqCG8WQJBcnbhWx1jIGXRVIyvzdo7avGzE1nd57wdSVhh5KX74nXp
	uuJI43H3JRk57ZNKCQitR/EBvV995sX1jZxrpcBi0GFlFfX+luCmHQ5s4ulSn9Ce
	HAFCOdHYk0KdbA/I6pKeBVAld1piRNotcrHKa4t5EFwsE/tpt0/6/G12v0iX4OTY
	nDtaEVmp3I57fv70WGzzeB+VXW+0+iDDqvidA/9mTB6D4040y6AKfDkGtsSfMIxA
	tt1G3d7FzGDGKuuFcSUpW1Du9Zk8ppKUVvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8831ajuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:13:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29598910dd2so2322125ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 22:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762409617; x=1763014417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hP3iVDjjm1Yh6lCxDh4PcKbNlm1B6eEBTsxEr8EUr5Q=;
        b=KX+i5+PWDpuGUK2kPeug8ovB6GiGRWmeKstEETsvrwNBiR5FBAKBTtLauf6jeyovTG
         DjWo9aJDxoiyBpKEe1+4LJvifYtplqa0MchZPon4iSRSbOmDZgTlffutROfcP4BcY+q4
         L8UEYNd8fXbKNRBp1fV4kd+BJ7wUKTJhIRAiUE8NZ2TPV7DtKe5RG9/sqEwqv3pCn5m1
         KODCOVrdbMMzXqL/XWr6UpUep1yC/UHRwyXZu9bPnXJxnzRC1FAuGYF9FnaP5oQdRuXV
         gltp6rGS61QZBlXGg+qAinm+6PwoKaCNhSkESDxKuOWqv+ngk7CM/WSpBnMVnwbI96VW
         fyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762409617; x=1763014417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP3iVDjjm1Yh6lCxDh4PcKbNlm1B6eEBTsxEr8EUr5Q=;
        b=sS3PAG8ygbUMmPhp5Rv2eolzRGtMv7glIU5sEwqpnns9IaT3W/lDVrIRpdE4xz3aaD
         UBvqVXSN9XrAwA5xvr0d1rd7/XCEGK3x6PZtzlbLrTtnJuThWpnwROWK92iHm3H0Buyt
         d7eYpQL3H4sGvwXv4Aikcqxbb3Y7bjfkpaARLIu2sY6x+GHfsWXdoGj0BDzCBxZzH/89
         mcj+2cEdjWuqherfi7fsdblOSVHVWoUkd46J5HcMzJO8aweWojbYPaVii2oomv3R776W
         jdxZ0vud+Q1IWt9rYcKuvyXmOs4+IP08DUiRaB84NoEYPc0+HKbH/vF1+E786QxVWJPe
         X2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWV89fxPdUWngATaha9ZFKuk7VBd/o/3RgRu/5sM0EzS0NorB4LbgGaJMl9HpwnjVNLzekk8qryb081CDaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTHpYe7C2reTtJPWTwcLK1rFgQIZOFk+5kJqiWs75Wu3TSGXr/
	2i4LQ2jf6RjqrwgSXkx70KY1LU8wOVkSWnQKA2z4nE/lJaM/YwNatdy3XSRRUCABVwrss++aU8+
	dW07dknL2O5V23h3TgUU/azTIVZc4VPkc3B+gynoEV8zY/CkOZfaG1d1FqGSr59KF7Tzu
X-Gm-Gg: ASbGncsy7vIEw4ImJ+AAcpd/vP/Hib6cji/B/mdmehndPCaSAO9ttn8k4LNOz8qNnZA
	WA0jOgJ82WhchaSMcgimdZPqziKo3Xuw4Ryhu3YLaySnQOA017auJhHtH4gy2gI+Hdp0/+GhfKa
	hLGaIvmnqScY8sfJJISkq8jCwCXc0CCGeNFTo1ZKZE6OS+eptC7oqIGG6JKrca/p+2LXxvSaGJ4
	JLyLGp8txCgVEZPzGPhSIlvaVlH/rnlxpJ9D7MAaWT6DnuAyj/D/7jrv46kye24+0F60VmEnbdK
	IpuKVaTyAvp6o8z9g1j8JqSBbO5HMraOYjnM8XAgCD6lQ74I0FAFvs4Zk/nKnLix5EyHdZApQw/
	5m/u6GB3Evy7lJ4fC
X-Received: by 2002:a17:903:2a84:b0:295:4d50:aaab with SMTP id d9443c01a7336-2962ad21137mr94077445ad.20.1762409616891;
        Wed, 05 Nov 2025 22:13:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEewmaTtY8AK26J3oyoLch8DjGfmDdZM/mLVA1EXvkwehtfnOLT0872UXtmqd16alDYM/BoXA==
X-Received: by 2002:a17:903:2a84:b0:295:4d50:aaab with SMTP id d9443c01a7336-2962ad21137mr94077055ad.20.1762409616339;
        Wed, 05 Nov 2025 22:13:36 -0800 (PST)
Received: from work.. ([120.60.59.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c73382sm15036305ad.69.2025.11.05.22.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 22:13:35 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 0/3] PCI: dwc: Replace Link up check with device presence in suspend path
Date: Thu,  6 Nov 2025 11:43:23 +0530
Message-ID: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AXRHXZXa5JrgUWPNm4UWzY4mnrxRqHef
X-Proofpoint-GUID: AXRHXZXa5JrgUWPNm4UWzY4mnrxRqHef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0OCBTYWx0ZWRfX7B+ext33sgk+
 PQBSzz3TXvdAqT7Y9Z+VF/tEgm624NRXrrTUcDL2OEuw08HTXelGe1h6UqXRqOCpV8r21g/IZ2/
 RgHzRsS8aymL6pTlr8OCRrP2aopA5FQesxrYKE+Wj2edpNfhAby5gAqMIxa2w0eZWtOOcxk+BV9
 Iw+dntREGuoBx6svpx6ebJ1VEioQiUuR+ZiQNO0rct5O3domHkjMx5+Xffkubu96lzICxXBjY2a
 /+K2Fg5cjEIBNJhbUSpLFn3xPLgv1gdCWEabc7oKlglBBPfzklAo5Xv/ZdFGDoMTTgWCIrQNdNK
 bGiTuGp6kKJSzAfy/p8uUqX9bpCqrHKcVbfeXG+MCK24yyoj2y/w3z4KreB1hbmTO/rQ+9ZpAYm
 ABtbnqmGwfob0NC/YmqbElmPy6PejQ==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690c3c91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tomDxdmRQcfPzRosr6lsLA==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=h4SL0BZ7AAAA:8 a=nOfjJzbYKU6Ixk5oWvAA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=Cfupvnr7wbb3QRzVG_cV:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060048

Hi,

This series aims to fix the usage of dw_pcie_link_up() API to check for Link up
during system suspend. The motivation for this series comes from recent
discussions [1] [2], where developers wanted to skip PME_Turn_Off broadcast in
dw_pcie_suspend_noirq() API when devices are not attached to the bus. They ended
up using dw_pcie_link_up() to check for the device presence due to the bad
example in the pcie-qcom driver which does the same. The usage of
dw_pcie_link_up() API here would be racy as the link can go down at any time
after the check.

So to properly check for the device presence, this series introduces an API, 
pci_root_ports_have_device(), that accepts the Root bus pointer and checks for
the presence of a device under any of the Root Ports. This API is used to
replace the dw_pcie_link_up() check in suspend path of pcie-qcom driver and also
used to skip the PME_Turn_Off brodcast message in dwc_pcie_suspend_noirq() API.

Testing
=======

This series is tested on Qualcomm Lenovo Thinkpad T14s and observed no
functional change during the system suspend path.

- Mani

[1] https://lore.kernel.org/linux-pci/CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com/
[2] https://lore.kernel.org/linux-pci/27516921.17f2.1997bb2a498.Coremail.zhangsenchuan@eswincomputing.com/

Manivannan Sadhasivam (3):
  PCI: host-common: Add an API to check for any device under the Root
    Ports
  PCI: qcom: Check for the presence of a device instead of Link up
    during suspend
  PCI: dwc: Skip PME_Turn_Off and L2/L3 transition if no device is
    available

 .../pci/controller/dwc/pcie-designware-host.c |  5 +++++
 drivers/pci/controller/dwc/pcie-qcom.c        |  6 ++++--
 drivers/pci/controller/pci-host-common.c      | 21 +++++++++++++++++++
 drivers/pci/controller/pci-host-common.h      |  2 ++
 4 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.48.1


