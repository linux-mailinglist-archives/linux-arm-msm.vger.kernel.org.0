Return-Path: <linux-arm-msm+bounces-52911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4175DA77399
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 06:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D9C3ABFCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 04:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D014918FC9D;
	Tue,  1 Apr 2025 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXZ2YVKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425013F434
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 04:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743482591; cv=none; b=OI5ty/OGZjvqKmxW851H061f8WYHiuWxPZ9N21fhfurKIjZ42Yo9JRLxXpY7qXz5YcA0i1SCgwE1D14ml1Hi496x97f0xX42LFKS8v+3XgsB4dbWt1BWjocc2kcaV6iwMUCeXOoP9ycgAs6x0TvSlgIxYh9Ug4fLEl7Im5hR6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743482591; c=relaxed/simple;
	bh=P8mtVw9MDQP3xQkyYXIqf4YUdaLdeyOy/FMYMEHriyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=asedZYQCFr9crZN+vbNmSBF8kuDTEXa+NQoyDwpmTass3m3kurgAeXOH2JOYq7xwZUjWTLphqLQJiz2toV6hgo0UaQSdr2QdSoZGNAQuXrOQTpm6Xdxe7Aa90Yl7sS+zl03PLYmijHNlTq+3wnCRCpFlBLcBxxDExEQ4JBvvRKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXZ2YVKj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDDOg008285
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 04:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=irGq/tNrDDjWuWz56xTF0+
	RmipC6r2LxDf1tLjyCLpQ=; b=eXZ2YVKjDXNRUrLKtHC8g3+jS0U11pgTmOdQH/
	4aMmqkB/MtWLmxjhiz++IKO8m+0jqVzK1hQpT0U8hYSdq52/ydyOZmgqT+ilFBCw
	4Pba28cMfwSZX8t/FKLqTW7SNq9ZXpG9fVicBlCiun054FFwlNQUqHVWs7VPoI/U
	ImPRJZ2IziHKgLP5l6gVpfMlnhdLJbszFs6UT+vzUmFkJlueiJUmOsA5SpTxA3td
	ytfEuyQGCJB3ZGIz91KUguelV5HAYVPslmAzUivvbvvmRlNb9P9h0caE/AekIm7u
	nc9DVsDz99eO0Rr/lTEGQkn/QFODKroGowXXsVE1W5hBJ36A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nxbvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 04:43:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ade807fso162847585ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 21:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743482587; x=1744087387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irGq/tNrDDjWuWz56xTF0+RmipC6r2LxDf1tLjyCLpQ=;
        b=F7QznZhMFwhojj0xJoanTz+Ud/UoZubpa/E1DoT51nJZYJPyr4zqF1+04NqQN5lYsT
         CNPbtmKwEerqcYLuqBUyknjs96oc+0AHMdXvLbmj1FY2F4UCtm3AE8h+GOUjGnf0jSFl
         1jyyF4EAgl8VK3ayP++eBFrpgCpalKtCohm4zFXCFq7iBb6duYVE12BltliqfRwe9U4U
         b5fcqTD0HTJzFLMe1vON0g/7RcqtT+97dJ2mlwySm7zd+M2+JeJ203frKgWHn8Di4yaw
         Xidq5HWwVn0m/pbBi8jt4aBu8paNemfdnm7klkeUng6CCTxyWYcGJe7xXwjNW0qlO9Pp
         A2Vg==
X-Gm-Message-State: AOJu0Yw2QmXa1LENvYi9hNEfWwzl/rFI6dQZVTtuoSMvxGMqTbbruTZ5
	if1I5fFOQShlcjyr8Mi2rtA8m4T/6L5ncqJ/G8MxBO19Z3hdS4W+ZiA2pR1yl2p7BbpMITY16oz
	ZzsTbNfMIj1JSvdwkvS6kClL8NnS/Xavvre/BdB2p+yyNdZ41nMj6ZWv+SHIBsJ+W
X-Gm-Gg: ASbGnctKVJdVsY0tQss4WgCVgSHW3jItsnjsReMAzNxMHkKOEuq6rwxOJUH9/DFcqll
	pYFl2ohwmfBIinkAmkSGtUr+twp2Mm7wRMMiHip0NMP+R04EUE+trNSI40CYpILhEWpgp/GMF1X
	YAVUEGRMurnwtqen4gZT9Cr9VB0uYk6I/ZDKvpR8JxeDh9m0/8RWjqZXUZ3yHR7V6JO6LbfbTLn
	7xGbN0iBR4t5CgdICKOffDj0W8WKW9UB6THDkZtgT07le+hmsSsOI5rBixky+ELVgxCE3w/B33d
	akSUSKKsqX3r7UwFBqpH7bQcVFY2sy5nJ+VdhJt1H7ZvV6mT1ww=
X-Received: by 2002:aa7:88d0:0:b0:731:737c:3224 with SMTP id d2e1a72fcca58-739803b3f12mr16283928b3a.10.1743482586780;
        Mon, 31 Mar 2025 21:43:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtZsAIEJWihPp788wGt63vNKj752dvqmj9/VqW5Qh4H+Cx1cmehBRPk38CihJXKZRqJhqGeg==
X-Received: by 2002:aa7:88d0:0:b0:731:737c:3224 with SMTP id d2e1a72fcca58-739803b3f12mr16283900b3a.10.1743482586311;
        Mon, 31 Mar 2025 21:43:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deec96sm7940294b3a.34.2025.03.31.21.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 21:43:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: Add support for PCIe wake interrupt
Date: Tue, 01 Apr 2025 10:12:42 +0530
Message-Id: <20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJu62cC/0XMSwqDMBSF4a1Ixg3kRmMSt1JE8ri2ofhK1BbEv
 dfqoMP/wPk2kjAGTKTKNhJxDSkM/RFwy4h7mv6BNPijCWdcsJxr+jYvbEKcmrSM4xBnKrWUvHX
 K+aIgx22M2IbPSd7rqyNOyyHP1/iHq+xkgQEdMaaZOquUsMKUwHW1wo+zJiF1Q9eFucqU8jkvs
 NRodJsbBAeaCTRSeAnSMWW9VQiC1Pv+BQHpwCTbAAAA
X-Change-ID: 20250329-wake_irq_support-79772fc8cd44
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743482582; l=2326;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=P8mtVw9MDQP3xQkyYXIqf4YUdaLdeyOy/FMYMEHriyw=;
 b=Ha39O+1wluW0ItzRTmBUcADI0P4CJ6vgNuIE8PQ2vR8Jn/FI+CylfsLPl4P5emlHzMD8taMAX
 q1Iz5zhUGMDATfs7uHjg5KBBPc9c/CPHi4PxELe2j7yg+reA2bfj7ja
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: L-C63tzxaLLXun_l3vMZ4EYgG5vrS-Yh
X-Proofpoint-GUID: L-C63tzxaLLXun_l3vMZ4EYgG5vrS-Yh
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb6edb cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=Fm6EAR0vVewXWd2bb8wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=429 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010030

PCIe wake interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add wake support[1], [2]. Those series tried to add support for legacy
interrupts along with wake. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ and initiate the wake
IRQ from the port bus driver instead of pcie framwework as adding in the
pcie framework will be applicable to the endpoint devices also. As the
port bus driver is for bridges, portbus driver is correct place to invoke
them.

Add two new functions, of_pci_setup_wake_irq() and of_pci_teardown_wake_irq(),
to manage wake interrupts for PCI devices using the Device Tree.

The series depend on the following series:
https://lore.kernel.org/linux-arm-msm/20250322-perst-v1-3-e5e4da74a204@oss.qualcomm.com/T/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (2):
      arm64: dts: qcom: sc7280: Add wake GPIO
      PCI: Add support for PCIe wake interrupt

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   |  1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       |  1 +
 drivers/pci/of.c                               | 60 ++++++++++++++++++++++++++
 drivers/pci/pci.h                              |  6 +++
 drivers/pci/pcie/portdrv.c                     |  6 +++
 6 files changed, 75 insertions(+)
---
base-commit: 88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
change-id: 20250329-wake_irq_support-79772fc8cd44
prerequisite-change-id: 20250101-perst-cb885b5a6129:v1
prerequisite-patch-id: 3cff2ef415ec12c8ddb7ce7193035ce546081243
prerequisite-patch-id: 820dbf5dc092c32c8394fbc33f9fe6b8da6e6eab
prerequisite-patch-id: 7f87f54386a87b39ca346b53d3c34ff0d0cb7911

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


