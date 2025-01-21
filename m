Return-Path: <linux-arm-msm+bounces-45657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC29FA179B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71063A657F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222B61BEF63;
	Tue, 21 Jan 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6AZvgMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B414D711
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450168; cv=none; b=anSnMIl3T3mdQ9bnUduKt56mlHraI6Bo0B0E3gVYAnc+lF2EU8VN0hdCiFv8FY3Bv9LPBKhmreKcpEniQxR+cve2nrcWHAOBc2G8RL9h3qLOiFU21y2AzLNLTUp1CwC2Typ8F2puPu26VON0ugDwN3iQ4Np2vCTqtmZMQOoYc3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450168; c=relaxed/simple;
	bh=WN8A+W6E/aB6nOMWeuRitj3dHkGzCxRaq1QHei3lea4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R6dX4e1InuR/SPxkLrlofO4+Zs6xci4gfgdAxOTNV9Sgk1rxgQfNSvRQ5nnbi8YHGsK1t4cmaBJKmQE15l55dvENxZO0D57naM+yX3I5/e7wWnF1qVxAC5MBqHlBl9zbw+6vMqbQb2LzxeTOLBLgLyBSZRDtxuJg6giPXlTlOV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6AZvgMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8YgK0008374
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CyesPLJfzcwBvxumF/b1LT
	PhOvGIhDFbLMF4z4RjYcg=; b=g6AZvgMDmLuRG4q9isjhY3WyeHd6VtaHvpxJbN
	U+TcNzhiMp8EH0h6DymuLXadEwShbvAjEnDvHJYyU04Dkq3eXKS/5wqajFnvAEhQ
	lbbGMqx9RbVGdtrmuTErGKZDSl/wy5V5ICnFczeXGEBeRXr3/g8lydOjw517sxa8
	nkt8AGl953xTTcXpdVuIj4EzNveMkx4FcwX06uVF3oWWNgafHMGT186ZTf6p1XqH
	ogB8Nx3u6z6HOhogFOe02fTBxRMV2pgic0oZCuyKgUXIXsLE497LhWgVDekbElQC
	PB1TMHqDwMwBx33Mc7vH7QtaVTsxkCScsF+aHN1q9wXEChaQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a71nr86p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:02:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2163a2a1ec2so168257915ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 01:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737450164; x=1738054964;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyesPLJfzcwBvxumF/b1LTPhOvGIhDFbLMF4z4RjYcg=;
        b=BiM9AgNSgfC8pGM2AAnrQHPqquibuYZrHB+mNG8yHGc1cMMwDqjOfwMKGaU5wkpzdz
         30U5tBRSOUAItr0+bCY8v5StHgnRSxygvzTt1rkD2AkRcDwBNzUwkN1HYUKGDyWc3Dt5
         n1YEI9bnf6na4WZwiNK+Amsvz4en29Burbo++jv3qcHBqLhLb6iRmw8is5A8g0IqdHpc
         f8SAPp9LU20Ftza7RK1c0l/Y7e6Bf+hKXCfdg4CFAAFl4VG1T9pdH2lT9EEcw7GVJ5ZP
         DV9u854DOh3MEoVP3Q2KS2r3RJC43qyAIUqUykyolHNMUlrdgovI0r24jJC0ZTFTl/Rc
         X9cQ==
X-Gm-Message-State: AOJu0YzEZpG4fSjYK3liPnTodXG7xPfkxFNDYLf00E6uUQSSi/O1jB78
	0mXWWWDLabuwKkXdJH3qHlN+BGbyU6gaILTQ3F/NqcvMLyfl0nmLx6LAZY8hbjSYqIuMSU3OQlH
	tekbaxE8VRey0+MLBY2kVNgNZjZAcOGz1tqLNIA7Q3DqiNLcxc2AErtPmxAWT5Pp4
X-Gm-Gg: ASbGncsz8UTfzCx6Zb1rus8iJRN+FLhHAyTrW4Pk0gYZASZEmTfUZJ/lUPNMxTuOWBE
	pImt27OcyZmRw/A212oA/vcEZ5YAGICL+HklJ+zaE8dbKGGSyQLn3tQ9b9DkqOGILg8x6JGw9Pc
	kYCv0J0IopaSipjsGZhAJIBROF1csreyE3K+EAxfVDkdAkqcS6qfs/5uSE2d8sr0gS20cdu7zes
	L7I95gtLL8fT8WTRfnMYrouBmz4Xtubw7jQV8BOQLl9ShREi5rXYKRzmOawYwGBL94fRjRFz33h
	VOcomH5jicQajJrFAv0WurHPgehJhA==
X-Received: by 2002:a05:6a20:3d8e:b0:1ea:ddd1:2fb6 with SMTP id adf61e73a8af0-1eb2158170dmr31060134637.30.1737450163650;
        Tue, 21 Jan 2025 01:02:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGvQzDjt9tdA5zsQrP5/cDW+fEfzLK1n3QZivRXQjuVJztwislIU9Aqm5uiAOAfxNXgXUGmA==
X-Received: by 2002:a05:6a20:3d8e:b0:1ea:ddd1:2fb6 with SMTP id adf61e73a8af0-1eb2158170dmr31060090637.30.1737450163247;
        Tue, 21 Jan 2025 01:02:43 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa6407sm8528378b3a.163.2025.01.21.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:02:42 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/4] PCI: dwc: Add ECAM support with iATU configuration
Date: Tue, 21 Jan 2025 14:32:18 +0530
Message-Id: <20250121-enable_ecam-v3-0-cd84d3b2a7ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpij2cC/1XMQQrCMBCF4auUWZvSTEM1rryHFJm0ExtoG020K
 CV3NxY3bgb+gfetEDk4jnAsVgi8uOj8nKPeFdANNF9ZuD43YIVKopSCZzIjX7ijSVhttTJ7bLT
 RkBe3wNa9Nu3c5h5cfPjw3vAFv9+fg+rPWVBUQtU9sW0OpCt58jGW9yeNnZ+mMh9oU0ofbdNmk
 a0AAAA=
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, mmareddy@quicinc.com,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737450158; l=3759;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WN8A+W6E/aB6nOMWeuRitj3dHkGzCxRaq1QHei3lea4=;
 b=0CkP669SAOOCrE495yWAF3/rb+A2K5tzLQNgxWjS/yqpNJmJozwR4aNpF6goxz/JN5I9KMLh+
 5tO0WmmGtP1B5XPUCfBl5u0kC+PnTGjMwcHoQgeuGV/MbxKIdZbSNbj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: -I0tb79T4wZslnu2KcCWAZM1dotTRq4K
X-Proofpoint-ORIG-GUID: -I0tb79T4wZslnu2KcCWAZM1dotTRq4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210074

The current implementation requires iATU for every configuration
space access which increases latency & cpu utilization.

Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
would be matched against the Base and Limit addresses) of the incoming
CfgRd0/CfgWr0 down to bits[27:12]of the translated address.

Configuring iATU in config shift mode enables ECAM feature to access the
config space, which avoids iATU configuration for every config access.

Add cfg_shft_mode into struct dw_pcie_ob_atu_cfg to enable config shift mode.

As DBI comes under config space, this avoids remapping of DBI space
separately. Instead, it uses the mapped config space address returned from
ECAM initialization. Change the order of dw_pcie_get_resources() execution
to acheive this.

Enable the ECAM feature if the config space size is equal to size required
to represent number of buses in the bus range property.

The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
gives us the offset from which ELBI starts. so use this offset and cfg
win to map these regions instead of doing the ioremap again.

On root bus, we have only the root port. Any access other than that
should not go out of the link and should return all F's. Since the iATU
is configured for the buses which starts after root bus, block the
transactions starting from function 1 of the root bus to the end of
the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
outside the link through ECAM blocker through PARF registers.

Increase the configuration size to 256MB as required by the ECAM feature
and also move config space, DBI, iATU to upper space and use lower space
entirely for BAR region.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
Changes in v3:
- if bus range is less than 2 return with out configuring iATU for next
  bus & update the logic of ecam_supported() as suggested ( Konrad)
- updated commit text and update S-o-b (Bjorn Andresson)
- Link to v2: https://lore.kernel.org/r/20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com

changes in v2:
- rename enable_ecam to ecam_mode as suggested by mani.
- refactor changes as suggested by bjorn
- remove ecam_init() function op as we have removed ELBI virtual address
update from the ecam_init and moved to host init as we need the clocks
to be enabled to read the ELBI offset from the PARF registers.
- Update comments and commit message as suggested by bjorn.
- Allocate host bridge in the DWC glue drivers as suggested by bjorn
- move qcom_pcie_ecam_supported to dwc as suggested by mani.
Link to v1: https://lore.kernel.org/r/linux-devicetree/20241117-ecam-v1-1-6059faf38d07@quicinc.com/T/

---
Krishna Chaitanya Chundru (4):
      arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
      PCI: dwc: Add ECAM support with iATU configuration
      PCI: dwc: Reduce DT reads by allocating host bridge via DWC glue driver
      PCI: qcom: Enable ECAM feature

 arch/arm64/boot/dts/qcom/sc7280.dtsi              |  12 +-
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 148 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |  11 ++
 drivers/pci/controller/dwc/pcie-qcom.c            |  81 +++++++++++-
 6 files changed, 221 insertions(+), 34 deletions(-)
---
base-commit: e989da8ac2a4999cf6edfaf55880909577d438cd
change-id: 20241211-enable_ecam-f9f94b7269b9

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


