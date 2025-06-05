Return-Path: <linux-arm-msm+bounces-60291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B54ACEBE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 10:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99A4A1898F19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F7A1B4240;
	Thu,  5 Jun 2025 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3KpyXAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288681BD9C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112253; cv=none; b=V6mNReNU4Rav42wDo6yLroZn7TCP2Qt5S/rTT4F/D03tIxzGmW/4We2dOmAqeeVQZKXVVQlkZa/Xz/NjBQMPHL6AGqg/tT3umg0v/WsbCn9ZBEZt7OPZ6jyj0kzH0HB7Hq20nV/VgMEtn77y2XeumZ4jGyfmzest1iRWBSH1C2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112253; c=relaxed/simple;
	bh=AkHB+thfbIQIqfeaA9UXwrnfoEhwL6KbN+8bNql7SCE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KhvSQHrqrN0vQwnE6WwaXetgCF1EVc+ovs84wl+19IUVn+1d6IyI5dv04mRldC8b6AvCm35fQP5uHFQdEMN1dvH8CRWmrst7Q7x5ih8lKMMdXN3fT+EEHNU836KAeBZeVdoGDQlR2SMh2QFXtzg1xn/r3nxpibPbzcGzvJls3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3KpyXAc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5558K2R1005392
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 08:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F+dqIkfsczA9GFhBQTlcna
	o8P8XWtJj7CYZ1dLe6ckw=; b=o3KpyXAch4TXHCXTeDQsjUBrptC/TpVi5jDrWH
	hIrbQVBcCIZo6KCVjtrWd2eM47hW41wGzCRQakFYDJ5Njt2cRGFp0QveyH5sR82V
	S8IT3EktQE9stKm6JBUIq2kU3DL1o0k7AqvbPpgXYl53QiTOLtxCYWVk6H00LxYw
	sisqVwI/zoCDWNfg3h4DqGbBUs75k3Wb3elW9mhw9B1VTcjaNb6irBNpmtTQDwUO
	hPnlLgikWCZUVGBZ4iGjaiVLfhxNY3wrX1MrZdVvCyA/Gg1MpqRtbhmpraVXfob+
	s/rf3Ts6ZF0mA4+yzsQMKDKT2BflgbFmsC8w5f2RNprWuPlA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me019s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:30:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36951518so679402a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 01:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112249; x=1749717049;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+dqIkfsczA9GFhBQTlcnao8P8XWtJj7CYZ1dLe6ckw=;
        b=Uk8p8cUcNRLn2FtDFE1w0AdlzT3CtCCeXvm6OjyzN+AY6ZVEARsh0rIjkYG+d2zuoR
         ZOkyOXHbvXp78uWj+Z0z2c/sMS4Jjxsl6GHN42vS0L95j7E0lbPQt4xOEcc7P2tLSiCO
         uxl1oXg6cSLkWOQiEOM0pAjjc5cJLvPLCkHdsoB3/vYf7dz1Y3E8H0hSqrVWAI0Zm2ok
         AYH6wt6Dd8e8J2uygWzusyRqBK6IWSuojSTxRA+J/Lt+bzmX7ajJUh1LLLc4vlxyZ1bj
         m4TwqAsYYjR4ncWavVptqqcf0GVvCMqKF3Sz9Qxjc0LhJr+j03zLT4iZ34Ag8cwGIj9Y
         j7YA==
X-Gm-Message-State: AOJu0YxpMMNjb819S3cvQNZ/8SAWPJ0vkBdqcL7FP0BdDfhKgHkhYJX/
	yLLg72bxNnY1wgcgQo5bZvvGzQTRYRB84p/QhUIfxrs5MK61WBFTcUjcbs4RCqln74RqIbcRjmv
	f/maFrIOCF1BBVcQ0VC60slfMbomMSspqNgLM8+P9PF4/r9VRurRpmvVv4+84B/k8TExO
X-Gm-Gg: ASbGnctacH7XL1aS55O8aCmJMAnlP6XsnDyvCyRGKkFHmVDueoxYbVp8P8nSXtku4E+
	f+YlUlNJxdwBe0Rcg8PwDyYxDPzoxG2RwnI9URlRCWm9W/gxy3Py2k/6AO1rlu1eSEr4AjvDuzv
	k3FWk/EEpaZYZ9lcmaPw8iVJq+CpzQjFvw1LvrJzu3NiXqYTK1bbhiuFpe+zFHtI+friCLv5iv2
	p58LFQpCr/HgNjDY3c37friXd0OC9nHHq4iT8kKgJaQiE+6aq+GnGyd3uUxItCgMDI9ykirs3ah
	WbEVjspgDv9/mFFDXbi76SmlSFgOs6eaqsEO4HdKTs1Q5Jw=
X-Received: by 2002:a05:6a21:9982:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-21d22c6620dmr8915815637.27.1749112248694;
        Thu, 05 Jun 2025 01:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGylkJnpUOGJZB7KO5B1USnsbYCwCycZuG/xEPtXYdkFvCeHitQoWPi0Kj0W7n6zqS31uMn5w==
X-Received: by 2002:a05:6a21:9982:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-21d22c6620dmr8915778637.27.1749112248213;
        Thu, 05 Jun 2025 01:30:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb37d5dsm9819095a12.34.2025.06.05.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:30:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/2] PCI: qcom: Move PERST# GPIO & phy retrieval from
 controller to PCIe bridge node
Date: Thu, 05 Jun 2025 14:00:36 +0530
Message-Id: <20250605-perst-v4-0-efe8a0905c27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKxVQWgC/33Oy2rDMBAF0F8JWldBMxo9nFX/I2ShyONG0MSpl
 JiW4H+vbGpq6GMjuGLO5T5E4Zy4iN3mITIPqaT+UgM9bUQ8hcsLy9TWLFChUaBAXjmXm4xH783
 RBAvYiHp7zdyl97lnf6j5lMqtzx9z7QDT79JgvxoGkEoq8pZZM0Wln/tStm/38Br783lbn6l3R
 hrVGnUQDHbgjbP4H8I1YsPUBkcBFf1E0+QBv2cS0IKxYt8gOUe2dcb8gfUaNwvWFUPoOOpIHH6
 bexjH8RNvd67HhQEAAA==
X-Change-ID: 20250101-perst-cb885b5a6129
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749112243; l=3003;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=AkHB+thfbIQIqfeaA9UXwrnfoEhwL6KbN+8bNql7SCE=;
 b=aBzd0q2UeMu0y5PpuU6Sn6yccSOXnqz6vMHKIPHsDdx2cBR0KzPn5z8pXk6xw4fXHjJhJeuMH
 dVqAsYgwRisAaoZkRpz3s6opfGgtqzJCm/5uSENhV5KFxKTlBabmnQL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Es0fQKzagJOnMcA8y7_MWJYu6cDOD2w3
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=684155ba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DNAdngzMxNmsW-howNoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Es0fQKzagJOnMcA8y7_MWJYu6cDOD2w3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3NCBTYWx0ZWRfX6WW8GWcvvcrc
 CzmKZab4UuSx24FArQBdFROfoS+LqvCNKIT4Z3hqXwICdFP52ucCo1A7Wb7C9v/SGxuZEkWoYkL
 Ffg2pmJUF9M1enSz7L9qVoZYcgBRHiSuZTIT5GV5+LSaDXxsJp7ZZi7JgR/eSLNSOh/f6mfh5kC
 XGNin2U/y3bBZrkUMSxKrtQImLTZV+14FvkQYAkMSIPhpVThTaETa0Xevxc3p6L3z3OYmI9bdvu
 yWCi0TZvsC5XDRWFxy4LNMKLVRtuiqj57z6ndQVEUUYJHlQ0adlzi8Dn5Zuf7SesemJ6vCnInRT
 Mco3gYH2cwSxM8KnLc4KkhBEGuRR28ztrRkmbyb3gBcG0JnkYxO0hJZknX1kseI2FJMx2rBzpv2
 Zdhe8lSbhXeEULQl/ZHJB8Le8M32gj0VkVLpTljsxfdiiBh3syXya1mGg8WVCM46U/n3YmnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050074

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

Note:- The driver change needs to be merged first before dts changes.
Krzysztof Wilczyński or Mani can you provide the immutable branch with
these PCIe changes.

[1] https://lore.kernel.org/all/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com/ 
[2] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
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
 drivers/pci/controller/dwc/pcie-qcom.c             | 177 +++++++++++++++++----
 3 files changed, 192 insertions(+), 33 deletions(-)
---
base-commit: ec7714e4947909190ffb3041a03311a975350fe0
change-id: 20250101-perst-cb885b5a6129

Best regards,
-- 
krishnachaitanya-linux <krishna.chundru@oss.qualcomm.com>


