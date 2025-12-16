Return-Path: <linux-arm-msm+bounces-85354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED545CC3476
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 911F6304B7F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB2F36BCD1;
	Tue, 16 Dec 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVH6nD/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJuShlpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1036997C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889524; cv=none; b=PUAXp8Qs/3okQJttHYej5r74g8ZIee9BVfMF491eTzYSozvr0DZsS4NEoUuGKg+/USE5VlrLHxxhYKugVvO+n/eRSyEz5ISbQChi4xdL7IkxXqfMxbYA5tR+Yd6FGgsii/6ZPrhfvDH/3K8nxxVOQTXpykBVZ43aGqoWj5PPW5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889524; c=relaxed/simple;
	bh=jEohyugUt2xltGKMjwJH/v02rbokHrSkGszVOtUh1RI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mh066W9ESqwzr5ygBoFikb4whTBHo48l5rZbdj0TXi1kUaCvdbYaeYw7JQ/GrLjsgHnNtU9zOhxFgeJ54vXCOtdnA7Ofs6vilqTKSVlhCgOsJCy7F0+UBlG9/n0Xg1WJk76cX+8Dg1ziPoGVrhMTk+sRPZ3m+oDYbGcH9UscsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVH6nD/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJuShlpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGB8eZK3872258
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V4gvJGhNuoZx4aXPrkf3CJ
	Tlv/0fPKbsYo+ci3xMIQ8=; b=MVH6nD/3ET6SmBzRPLuSWiCmia6j0FOk+Mq6l1
	VtINLCmhzeyIaNbGEJaFil2mpm/wQ7hZbgKv96RlvTH62LMUaAVeGDiVAgCbl1wq
	oCTpa9ZZAoReGxsgh9OMrgTnyU9t+8L/a1VWQym/EhOc4RIFx4GpxhLbQe6NmbFo
	hWeKGZftpWD6yF3jthqbkU6SpLybsUI579MMQqfQweJcqLxYnHJTqOMAG6DDp+bV
	xOLF1ozx+gAT7WHJKlbZPGeSRn0Dc1QBxuznUbeLT5Dwapa7zGbUC+XB2DbiIQLQ
	99TzGxJeHsPT9UcCevvGBr9fHyjicSqGIsMC8BqeclTxwcXw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b369w8ag7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:51:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9321b9312so9264676b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889518; x=1766494318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4gvJGhNuoZx4aXPrkf3CJTlv/0fPKbsYo+ci3xMIQ8=;
        b=hJuShlpH37zMRZEl4M5XdTGQXF62LGB6NvmBFQkAxj/JSrZxWwxRbL1h0PKWPajnaA
         sHleX7hW1mudd/byJSCk/XqthVCfuzsI/orrfW/PhE7fPs/Cx1a7eDQM9mU4nnjh75H4
         5mpnbX/naGWOINBqL2RKHcQp6TvFwX4paRVfFJkDJcPIo1Rf2eGaKQvaiTUOZccp8gxW
         J+ettQ0rlFUGKoQ/aTibYhf+s0g+nIY+O1Xwi6kiAoiaPYJaNXl5iiSDmYaet3xVuK7e
         T5hvPezpBPklgyE5ixXLAcj4zC5PVes95Q8+eMShA4mfaVDwXJokyWJM5fXcOAe2IyNl
         UbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889518; x=1766494318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4gvJGhNuoZx4aXPrkf3CJTlv/0fPKbsYo+ci3xMIQ8=;
        b=NBHHerHYAAvM1WMSsGmOH3kyocjurkzovQmm9r5iyd0ssct8RGCk7IBrB4A1hvoR2c
         NLa1XKn420zbYTa8Y2A9nyAVMhj5wQ4DVHTwg002js1okw7uW7gAjS691aK/Lo2VBjK1
         TF6UwyqgBw+jrQjrdrhvaj2RRo001TuUumfynPW7kFBb4cffP6mJ8h+hxGPklbXO6lQz
         XtpNDMUBYfcFibn/tEU0vFVc6w07o/yIPOfZ1l9XupYKTq73ptwhXrKFBtAlccaiFR8V
         Cp4BVfLGR2ZF9JKZCUpNwYLCgIniBZ0yqAv9dO+QJeCGm5TWZoW/4DMxfzyNgoI3rsoR
         UjqA==
X-Forwarded-Encrypted: i=1; AJvYcCWBTEzUEddkj3r/RFxFjV0rfMVH5kVpA3pzvGpJQ022trvQyRw2SJwodVOnvy76voTkEF8gvqqrkOb06G1C@vger.kernel.org
X-Gm-Message-State: AOJu0YwBp3mGA4MNOnETLQFFhvW6b65X/FO0/aTTJf4ctivTSycWMNWj
	RYDNmxwzHWbsYLonSdVbCKNrX5pnNMVlsqxBHC3QvXm9bCTVjxqjjZI5jsJ9Hfc3sOrfwD1Q2uq
	20Kvl8NJ6+f0t3/LE9pGVzUayiyWPLZTQU7PaOOR643qV1k8TZl9KLz23eeeJD0cEAIWm
X-Gm-Gg: AY/fxX79Avw5JZEMRIQFx4Hcgr8/4Quur9mBZTVR7PACzwXKaIxVPhGiVrUPEdJGNLc
	Umm2rLuvtJBHx/z3W3SslgfuwTLPxBdj26rycjZiJsPWhsFeL/9kzN/2Q2Y+PjudFt5jCAvgw9T
	fPJw4VQ/uZVTQX3F2ZVvqrSLKDpEpm7wIAbEwZvXnSWKEpZiKOkkiT8Wf3zY3T+NCJdVK7trIk/
	CQZEUdl5aN3rTxDJcBvOrr2WIKiphuESqbMGYPi4Ap7Ct7cB10ofDHiHm100h1B05+PjzaHsbMt
	pKQh2eFgh8dw99pkuXoZXiw4XN+dWTI3/GOVmei+YVklkvJvGPeS1HVFoe9BMbO3NHjXZCHLrS0
	+7AjUT/Kxtj4qopU+a4nEiltsHM0FPHxl0L3PxoFKwQ==
X-Received: by 2002:a05:6a00:8016:b0:7aa:bc48:abbb with SMTP id d2e1a72fcca58-7f66753ea07mr14129556b3a.3.1765889518208;
        Tue, 16 Dec 2025 04:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnw0nq+20BiU/H2/8max6+ztNgOlbQQNUoPUNmYAiLOQL26Oahp2+NqahZ4UXkFI52v2vvXw==
X-Received: by 2002:a05:6a00:8016:b0:7aa:bc48:abbb with SMTP id d2e1a72fcca58-7f66753ea07mr14129532b3a.3.1765889517697;
        Tue, 16 Dec 2025 04:51:57 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f5ab7d87e8sm13634362b3a.25.2025.12.16.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:51:57 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI/pwrctrl: Major rework to integrate pwrctrl
 devices with controller drivers
Date: Tue, 16 Dec 2025 18:21:42 +0530
Message-Id: <20251216-pci-pwrctrl-rework-v2-0-745a563b9be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5VQWkC/32NQQ6CMBBFr0Jm7RA6akFW3sOwaMogjUBxiqAh3
 N3KAdz85P3kv79CYHEcoExWEJ5dcH6IQIcEbGuGO6OrIwNldFaKTjhah+MidpIOhRcvD7QXZTQ
 rbanREIejcOPeu/RWRW5dmLx89o9Z/dq/ullhhnlhctKU6+JYX30I6fNlOuv7Po0B1bZtX90kc
 k27AAAA
X-Change-ID: 20251124-pci-pwrctrl-rework-c91a6e16c2f6
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Niklas Cassel <cassel@kernel.org>, Alex Elder <elder@riscstar.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5986;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=jEohyugUt2xltGKMjwJH/v02rbokHrSkGszVOtUh1RI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpQVXnhtZwgDtQjs20sZnRGBeoa6Woygs7yvgw9
 RwGW8m+7/aJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaUFV5wAKCRBVnxHm/pHO
 9eofB/9YymqsL1YolNRn2q15B8VixiUBeeGbKHB4zCXlTfx7P9EBBco6RYc/fXLwlSOxWGvWVCE
 FnMxZSi28bsVPt82iXP9UZwrAinrP4r1htKlW9IlwEGovZW892B4b9HMkylV474WIIgTPwmZ1IP
 /ny3USuEJ6/QH7Gp1LpX8OoVMTKMVR4Qcj1+D33tdNh3Jke+JhHIl8IuZ5Cl7JbuVmIT4Wi2wIF
 n+5b0CYAFdlFm4a0dw46wGcyQhHsOx7dkIAOl0YP7YglYctKPepFz+ZP/gypIkc2mZTku4KGNsZ
 z+H8Lnzp0f4qRGIrQ4z3MMORQ6hqokHikd9E6eGGWK+iZ1mM
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: ddyCCTESRfNDrKn_5CE-C7HuxD2G_poS
X-Proofpoint-ORIG-GUID: ddyCCTESRfNDrKn_5CE-C7HuxD2G_poS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfX+jPtncZ476/7
 xQ6K5z5awRY7t0ZI5MtW9sfB6ikY8yNaDou+eDZSocXQ3CdF0P+ZmidcdyqK/1SqU0ypdG9Nv6r
 SjxVLkAIVl4GKy6MYAOXpBvn//8tx8xGzWUpqtaPjAGr8tKthWgC6RBXxoQe3Sviy0LQtPYjmlL
 5AQs7BQ38gaB0T2hgQiuXZ8mUaEBKbHj7nA5qqD7+0+X/anPsHeqJSbiTIiP79/kS/pDHcbD02V
 n4RmDZLEwPIdn5Vd8BxIw79j0ldhJoKyilPbGoQNZ5V9hECBU/WITCy0yvd2RF5vJvHcfn0Qlze
 EN3ar9fSroK5Qqbasr4bdqM4BSjFfdcnEKsXoBjU/rgUyLaMfFivaf/AFwAKrHGUcH5Ggpbw1zY
 9+v74j9UEUobHjbUlmjkm6hn4Ksbhw==
X-Authority-Analysis: v=2.4 cv=MP5tWcZl c=1 sm=1 tr=0 ts=694155ef cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=wnJ2AIBC+6MZbTdryK78rQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BTS5Xa3S7kRhHNBJ3u0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109

Hi,

This series provides a major rework for the PCI power control (pwrctrl)
framework to enable the pwrctrl devices to be controlled by the PCI controller
drivers.

Problem Statement
=================

Currently, the pwrctrl framework faces two major issues:

1. Missing PERST# integration
2. Inability to properly handle bus extenders such as PCIe switch devices

First issue arises from the disconnect between the PCI controller drivers and
pwrctrl framework. At present, the pwrctrl framework just operates on its own
with the help of the PCI core. The pwrctrl devices are created by the PCI core
during initial bus scan and the pwrctrl drivers once bind, just power on the
PCI devices during their probe(). This design conflicts with the PCI Express
Card Electromechanical Specification requirements for PERST# timing. The reason
is, PERST# signals are mostly handled by the controller drivers and often
deasserted even before the pwrctrl drivers probe. According to the spec, PERST#
should be deasserted only after power and reference clock to the device are
stable, within predefined timing parameters.

The second issue stems from the PCI bus scan completing before pwrctrl drivers
probe. This poses a significant problem for PCI bus extenders like switches
because the PCI core allocates upstream bridge resources during the initial
scan. If the upstream bridge is not hotplug capable, resources are allocated
only for the number of downstream buses detected at scan time, which might be
just one if the switch was not powered and enumerated at that time. Later, when
the pwrctrl driver powers on and enumerates the switch, enumeration fails due to
insufficient upstream bridge resources.

Proposal
========

This series addresses both issues by introducing new individual APIs for pwrctrl
device creation, destruction, power on, and power off operations. Controller
drivers are expected to invoke these APIs during their probe(), remove(),
suspend(), and resume() operations. This integration allows better coordination
between controller drivers and the pwrctrl framework, enabling enhanced features
such as D3Cold support.

The original design aimed to avoid modifying controller drivers for pwrctrl
integration. However, this approach lacked scalability because different
controllers have varying requirements for when devices should be powered on. For
example, controller drivers require devices to be powered on early for
successful PHY initialization.

By using these explicit APIs, controller drivers gain fine grained control over
their associated pwrctrl devices.

This series modified the pcie-qcom driver (only consumer of pwrctrl framework)
to adopt to these APIs and also removed the old pwrctrl code from PCI core. This
could be used as a reference to add pwrctrl support for other controller drivers
also.

For example, to control the 3.3v supply to the PCI slot where the NVMe device is
connected, below modifications are required:

Devicetree
----------

	// In SoC dtsi:

	pci@1bf8000 { // controller node
		...
		pcie1_port0: pcie@0 { // PCI Root Port node
			compatible = "pciclass,0604"; // required for pwrctrl
							 driver bind
			...
		};
	};

	// In board dts:

	&pcie1_port0 {
		reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>; // optional
		vpcie3v3-supply = <&vreg_nvme>; // NVMe power supply
	};

Controller driver
-----------------

	// Select PCI_PWRCTRL_SLOT in controller Kconfig

	probe() {
		...
		// Initialize controller resources
		pci_pwrctrl_create_devices(&pdev->dev);
		pci_pwrctrl_power_on_devices(&pdev->dev);
		// Deassert PERST# (optional)
		...
		pci_host_probe(); // Allocate host bridge and start bus scan
	}

	suspend {
		// PME_Turn_Off broadcast
		// Assert PERST# (optional)
		pci_pwrctrl_power_off_devices(&pdev->dev);
		...
	}

	resume {
		...
		pci_pwrctrl_power_on_devices(&pdev->dev);
		// Deassert PERST# (optional)
	}

I will add a documentation for the pwrctrl framework in the coming days to make
it easier to use.

Testing
=======

This series is tested on the Lenovo Thinkpad T14s laptop based on Qcom X1E
chipset and RB3Gen2 development board with TC9563 switch based on Qcom QCS6490
chipset.

**NOTE**: With this series, the controller driver may undergo multiple probe
deferral if the pwrctrl driver was not available during the controller driver
probe. This is pretty much required to avoid the resource allocation issue.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v2:
- Exported of_pci_supply_present() API
- Demoted the -EPROBE_DEFER log to dev_dbg()
- Collected tags and rebased on top of v6.19-rc1
- Link to v1: https://lore.kernel.org/r/20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (1):
      PCI/pwrctrl: Add APIs for explicitly creating and destroying pwrctrl devices

Manivannan Sadhasivam (4):
      PCI: qcom: Parse PERST# from all PCIe bridge nodes
      PCI/pwrctrl: Add 'struct pci_pwrctrl::power_{on/off}' callbacks
      PCI/pwrctrl: Add APIs to power on/off the pwrctrl devices
      PCI/pwrctrl: Switch to the new pwrctrl APIs

 drivers/pci/controller/dwc/pcie-qcom.c   | 124 +++++++++++++---
 drivers/pci/of.c                         |   1 +
 drivers/pci/probe.c                      |  59 --------
 drivers/pci/pwrctrl/core.c               | 248 +++++++++++++++++++++++++++++--
 drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  30 +++-
 drivers/pci/pwrctrl/slot.c               |  46 ++++--
 drivers/pci/remove.c                     |  20 ---
 include/linux/pci-pwrctrl.h              |  16 +-
 8 files changed, 408 insertions(+), 136 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251124-pci-pwrctrl-rework-c91a6e16c2f6

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


