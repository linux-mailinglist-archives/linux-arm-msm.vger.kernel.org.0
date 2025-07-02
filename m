Return-Path: <linux-arm-msm+bounces-63385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A40AF138D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 13:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4B053A3479
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7178619AD89;
	Wed,  2 Jul 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBLzMQ5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2A253F1A
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455262; cv=none; b=BrvlyI6wbCWX3g9DUSKnpZMI5T0ge+ssUWgqoOTyz2/dFYD5hVvUG55zPDUhHeMuoZYRUBamCZquyFY0+WzCBiwJDuanFZccy9bPp+Wp1zFQof9zJlwt3I4169msWVmLw9eCEBNmbsjYMYQY9/7jhtQ5VNCGrWin7AfnqaAaNDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455262; c=relaxed/simple;
	bh=WK7UQCNXLhDU0vyO0sEV1vG45WiJKmQMWd40Yeto5n8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tv+sb4q51fscpKLNtQsLgzjgybtCu7e/Q+EJ9mdvO3ZLs4QJrOjP0olEgOCirKYyNp5jLjQTW3r0Wr/TcY2P5T9BLAWUibTYubC2d+0ZWe1U8W6OuLcW1piJGHqZY6jjjSI2kqIavmyeYkSOEkRFq/9gvNRZluZvC13afdY2kYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBLzMQ5m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625FZBe025165
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 11:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LoOyg8E+dTwOvRlxXE0k3S
	wJHIfP+Cgz6iuEBbKvP3M=; b=MBLzMQ5mhi84p1gk1I2aNOpsVMSZR2IRDorJlf
	DsEV/RqUlLOsj+CLXjJx0p+6A5MEOpL60MH8zwiLMF2fO2vcJ+jVjpcHwUwd5fy3
	wigJjT2DNFNZWWBOKWr73INBq6DW3i0r/KQkYM9mmt662i1vguMbMx5Oi95ZD/ao
	1PEWM+Y6Tv4LCmdP9RQMEmMFkcIAp3Q5cBJCN7Xt6o6hEeimSqtc+LR2EVxN1b/5
	QuA8gr0a6Zq8tg0TZA6gscIWeo8q//IXhDJvmr+vU4MRa9vPUfmmMZn1vyn+XF++
	fT2SAXZdVP9hY/AxQMDGBne8a4heWr/bMwtRV6Bdk5i6hJlQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64sm0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 11:20:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2355651d204so58200855ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 04:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751455258; x=1752060058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoOyg8E+dTwOvRlxXE0k3SwJHIfP+Cgz6iuEBbKvP3M=;
        b=mcipXBuu1bCSeLepMP0Hte5d7p3XWrhtx0xT4W7eoKzRjj4pl1lQBy2qQzbP8yXwwT
         SvRIxz2OJjBsPL5/OULHuwTO/SevTSbQUoJEbrOwrZN8QgVB0k+JQdfvuXpNDfL5Lc0q
         jl+21bEu5x44VIuVw4PeUJ1osc0IxLdrlp+ljK3KtPRhFz45ySRUePhc0zVYF+svm9g4
         hyoXhbNDix2MhiCCw8QVSES180aAxY06Lf/m6UgjUVAgup6UZkpFTZ4gwEKLKEXPCIOQ
         /DlVxOJVyHL2SMmr8dkf5H+jaiJ5F+3c0XPd49W52Z1/UhzpDK2WKSpi4AgdDzm0Djmk
         CkVw==
X-Gm-Message-State: AOJu0YyPTb9LirPgk0mBmfeREAbYsxSXyNEydUEQuedAa09PBpLbrTrk
	jMx+kGExRyNBFY5Pxbjp2JlUt8ytRAjWtelUotFR9gln6YR2d8n6lKpkK1K0UJXDqUFmfedD2jO
	Eyspp6VBTz/EZUBsaHLj+dSeU93+/zKrWrykvLlVq5o9HUxQSg+9KR63jUmFUPuSy5Rce
X-Gm-Gg: ASbGncsAwVgA/WLqhvcW0dCTWbd1sskjD8Hb6SfvbpWKwqW3yq0I/GAhAP8aAeeOzD+
	y6dWAJ+bld0bWPnifGQfI7s5G0Fr8ODJxHgxEbWoNmiieoh14zBmRbilSqLLA5Xq+naJj9HTwHn
	iNB0GogQj/mspVk7H3Z3BvDNTryxzwxnXnRDD0QgIRzqvz4cBxHe7URD48LOK8lJIHz1TqZTgKL
	eiEligityFxfzKJqvt8YsHtiSqL86h7uRUEseMcyQVDEYgJ/dV1t+ztEQlPnrQ7pfYW5t2vjaWS
	NBXZNJIKz9pZ167dOxFmfxY16XH8Bin7sqlD8fVlYDUn43rD8CFG8t888Q==
X-Received: by 2002:a17:902:ce8f:b0:235:779:ede0 with SMTP id d9443c01a7336-23c6e5b5acamr38280775ad.35.1751455258203;
        Wed, 02 Jul 2025 04:20:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2p2g9Ug4p5+yOGJWRDZMtRBE5V+yLNk34tAjxPENbi7BZoPwW/UcuDD5kEK66geRwefVDaA==
X-Received: by 2002:a17:902:ce8f:b0:235:779:ede0 with SMTP id d9443c01a7336-23c6e5b5acamr38280455ad.35.1751455257714;
        Wed, 02 Jul 2025 04:20:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23b0b3bc0f1sm83926955ad.171.2025.07.02.04.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:20:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/2] PCI: qcom: Move PERST# GPIO & phy retrieval from
 controller to PCIe bridge node
Date: Wed, 02 Jul 2025 16:50:40 +0530
Message-Id: <20250702-perst-v5-0-920b3d1f6ee1@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgWZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3YLUouISXUtzY0Mjy+S0ZMuURCWg2oKi1LTMCrA50bG1tQDAK7u
 LVwAAAA==
X-Change-ID: 20250702-perst-973129cfc9da
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751455253; l=3048;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=WK7UQCNXLhDU0vyO0sEV1vG45WiJKmQMWd40Yeto5n8=;
 b=WMne7DLRCpHtX+CAZBvqMbzA6IYvOj+pa6L17yq7hsQ7tABQFjlG8dwKYnt7n4OXYBBT7KQ1j
 /yHZsyKqgUwCA820sxC8dpk/HOsjelNK9U3vkiCHg0ybtctM/iMzGfh
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6865161b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DNAdngzMxNmsW-howNoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5MiBTYWx0ZWRfX1eE7oCpHGJKk
 U0B/ZGeT7NUZzAPlf4pBkVK1LDqVeOiuZu1xq+UqH6lA8Zy7WTrG4yEcpPoxYLPm41RdUv0PmNi
 NVkctY5Txlu6E3vY331zAv337ugcrHTnzH3sVh5nAyirACK0YDQfqLtCZOYgzh+qgyjwv1zmErD
 dOZVenEDQWR/iYhuKverkjF+pjW4RQc4iwbuC5Kqd6UCZDx1kUp5LZIcMLwxOu2oC/IK4pK0X4e
 8MzsRxVpSzF3Tbc7Ne4+ZkCTXCXQevEU37Lo0zoziSEOsCqXjWYguV59iRLQuDT+mQyF4g48Jx/
 r5XvHWQ5Qz5kpXoqHsOjmJcBQkVRPAIYNo3NBKtYrr0G7aP9gSufI41wTiajDG3eBLtx7HhaR2K
 sYP2/Nki9ADQJewezd+Q7jdIGthLLcIAgU9QektTla1LJgmmcFTxgXL69OlkjK69V6j/ZGTZ
X-Proofpoint-GUID: AwpPioGiK9x4P5DfX0QldW88i_mCYD-O
X-Proofpoint-ORIG-GUID: AwpPioGiK9x4P5DfX0QldW88i_mCYD-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020092

The main intention of this series is to move wake# to the root port node.
After this series we will come up with a patch which registers for wake IRQ
from the pcieport driver. The wake IRQ is needed for the endpoint to wakeup
the host from D3cold. The driver change for wake IRQ is posted here[1].

There are many places we agreed to move the wake and perst gpio's
and phy etc to the pcie root port node instead of bridge node[2] as the
these properties are root port specific and does not belongs to
bridge node.

So move the phy, phy-names, wake-gpio's in the root port.
There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
start using that property instead of perst-gpio.

For backward compatibility, don't remove any existing properties in the
bridge node.

There are some other properties like num-lanes, max-link-speed which
needs to be moved to the root port nodes, but in this series we are
excluding them for now as this requires more changes in dwc layer and
can complicate the things.

Once this series gets merged all other platforms also will be updated
to use this new way.

[1] https://lore.kernel.org/all/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v5:
- Rebased with pci controller/qcom.
- As part of rebase handled one err condition by adding goto err_port_del
- Link to v4: https://lore.kernel.org/r/20250605-perst-v4-0-efe8a0905c27@oss.qualcomm.com

Changes in v4:
- Removed dts patch as Mani suggested to merge driver and dt-binding
  patch in this release and have dts changes in the next release.
- Remove wake property from as this will be addressed in
  pci-bus-common.yaml (Mani)
- Did couple of nits in the comments, function names code etc (Mani).
- Link to v3: https://lore.kernel.org/r/20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com

Changes in v3:
- Make old properties as deprecated, update commit message (Dmitry)
- Add helper functions wherever both multiport and legacy methods are used. (Mani)
- Link to v2: https://lore.kernel.org/r/20250414-perst-v2-0-89247746d755@oss.qualcomm.com

Changes in v2:
- Remove phy-names property and change the driver, dtsi accordingly (Rob)
- Link to v1: https://lore.kernel.org/r/20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com

---
Krishna Chaitanya Chundru (2):
      dt-bindings: PCI: qcom: Move phy & reset gpio's to root port
      PCI: qcom: Add support for multi-root port

 .../devicetree/bindings/pci/qcom,pcie-common.yaml  |  32 +++-
 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  |  16 +-
 drivers/pci/controller/dwc/pcie-qcom.c             | 178 +++++++++++++++++----
 3 files changed, 193 insertions(+), 33 deletions(-)
---
base-commit: 7c184aa42a3dc9b2630010fbcb06c701c440f8e3
change-id: 20250702-perst-973129cfc9da

Best regards,
-- 
krishnachaitanya-linux <krichai@qti.qualcomm.com>


