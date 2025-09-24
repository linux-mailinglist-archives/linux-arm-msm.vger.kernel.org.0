Return-Path: <linux-arm-msm+bounces-74748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5FB9C975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84F50321517
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB192BD5B3;
	Wed, 24 Sep 2025 23:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCuRNqUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7B29D26B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756806; cv=none; b=RgD4QfC8JbrjJ72E1eeuECi2ofZRQQMG5dUFIXgUPpHUmjJWkj6jUzjoOfsn65hxljUYcrL30WJ/6OZn4q/QiUjeIe6PX6AJg/gwnUzv6cLU3cnxkVkBoNUwzdgL02wvJB11HkC4QxvRve2znYBcjxtLz45GyAWIEP/jNB1kVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756806; c=relaxed/simple;
	bh=tlF/XmDSlCSzHpDbYIYkAuUDBatLs6VY5lZmH+8tSdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P4pXddfmJHUCl/AwbZlrvX7T7oUEbfujWoNL6XsmTAhKXmb4WZT1l+MusVySarPtaSpX8BbUw2oQUt7w3qnpWAd8CtedDfibjbZWxoJNkPfcQahZU2QO+E0u7g8aI1v9JrOhZPHiI8zLHDm/aE0MKu2gW5oohkVgcOU20bG69x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCuRNqUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCoZGl016452
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VNIomdy5vQZBr0Xb1zY4tT
	/Acpu4g0XVUwXNo3bXGx4=; b=jCuRNqUUMjb0jv51pmB8cl8BDgQTKqHaV+MSVh
	voWepDXGh7ziPfsJsEKLw8cf8ckByRtvSAITRASobY7Rp+K8OquQQaO8YVgIAXw7
	SE7KoVv0UD8q0q3nmHnH1PYxAFoZwWw6lFzFzOS4Xrs1JlQFFvQRhioBlSzHbQir
	/5Yk6TnrO5U/Qj+w50tkFgR78EyE1p58UP1oJFC+xMT3Q9MiGVnh6OqNv9AtcVzk
	+zZZRXdFujW3s2tBEVxsQShnhWIaiTLxlJcrwmfLpsBHIxUcnB3ALO/f3+nis5Kh
	fKw2uQP9VQk99PGliSU6wISuLZFrOXulKYmQwDyQ5+T8sn8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhv09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befb83so339450a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756804; x=1759361604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNIomdy5vQZBr0Xb1zY4tT/Acpu4g0XVUwXNo3bXGx4=;
        b=IoSmAKZ8LsahqQYrmpIfEgkABOmRd3Hzzebr4+YL3Th14nskOJjcytNIUSp85TjuGS
         uFHq7/ECSfpSVeQhfHPNB2LGQKv5ydJsYIc0lHJ3wdWeBvlkz8nE7szSn5SMwqkzKo9Z
         KeI5RWQTSxZskIpsXBsl4ximEa98K8sZNn1Iwg9D/Pk5Vbz8rNSDS0CChk1viJanPlgC
         5mGoVP3ijo6id5BMGfdPAIrQrG6T/wXCIXGShuoxAIapedJC+l4v8YL8w69F6sCvFo+2
         nvcHWOFIv5QRLgOofVmuNo5JMvnO+iGRsNi4CZ7mqif+wqIs+VYZauFYmo7STV9gYaRI
         7nQg==
X-Gm-Message-State: AOJu0Ywfw91XIXm9ikbhvydsZX0UupQzJ0qXiDSNvnYOtk12eneghTK/
	9UyZv5XYHiE7+wP9ZYHF1dv3z3felAn9xJCz4eevjgRkLQww8hwXQi9odGeobc2DDKpu7xLKTjJ
	AIJ+IGjsuiHxQeCLnUdUQdHA506wCZ+5GaTRZPQ6QaqcUq6Za3vdfb24XOBer6+HB30q5
X-Gm-Gg: ASbGncubSxUdPaPTKPS0LZt46Tu3SXJCJuQsVjb4mGXJHDLqppyYpyczX7tU1ESkP86
	BAi/V+9KahYjRloUM9QJhK+qRxiE6Oi2OeMJs7aeIUZHHxi2YgC/8jSIw2P0C3id2hShrEdI0Y4
	BYZCvoLjg4Yj9gH1qXhTNzAtYsoluLf/sDg4F/ah0uFtq+OVpDho+1dPrf5UXFbarEGIOGsU4Or
	gknC0ACXijtq58nhOg4bY3g7Hm18sh3zqu0jgKP7aJ/TlTEszPfYFvV2D4q00LF2CKR0whwZTsl
	t/xgF35B4a0pPLslY8jRDAd3ePLRq8ezJXUluVkOH9ZlQ8vfyVo0AIRlqarg7CXEylQoXhtWuzW
	BM3qdEIT0Gb+ZJco=
X-Received: by 2002:a17:90b:17c3:b0:330:7a11:f111 with SMTP id 98e67ed59e1d1-3342a300367mr1473536a91.35.1758756803655;
        Wed, 24 Sep 2025 16:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdtlLUNGJJSlyqnknrbjF3ipSmmLDcYIbOKelFSeVIJvhkvC4jn26Ddrkbxi9be3pwqyR8oQ==
X-Received: by 2002:a17:90b:17c3:b0:330:7a11:f111 with SMTP id 98e67ed59e1d1-3342a300367mr1473516a91.35.1758756803192;
        Wed, 24 Sep 2025 16:33:23 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53ca107sm392911a12.13.2025.09.24.16.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:33:22 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] Add PCIe support for Kaanapali
Date: Wed, 24 Sep 2025 16:33:16 -0700
Message-Id: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALx/1GgC/x3MQQrCMBBG4auUWTuQFgq1VxEXyfSPHaQxzIgIp
 Xc3dfnB4+3kMIXT3O1k+KjrqzT0l45kjeUB1qWZhjCM4dpP/CyVqyhYcphCFklpBLW8GrJ+/6v
 bvTlFByeLRdZzsEV/w+g4fuHf7elzAAAA
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756801; l=1250;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=tlF/XmDSlCSzHpDbYIYkAuUDBatLs6VY5lZmH+8tSdw=;
 b=GhjB8yFSJhE3XlM7FLgPQU2mx4t683odAMUdhaUPcxG1u0zlAsRUbnig06Uw5wi57WJUJm3AK
 VABUOcz9YyuBnBBGiNns9LLItEdxBIUGRSTsNbmFS1JSSZCmADYc5i3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d47fc4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xicjnEbRADQpFcw3uD4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: qy2PRcCcS7ARUIGk0Fv8LLlzVJp-TeYm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX3bMe9h9iqmV8
 iO7e9XcGbU7/9i0Q8+fu+ldOmDgq67HJUkScgNyTsfobthG+bTmp65IhYGPODYFlAApfbXl7agX
 Rx+5NTl68osIOZG7Eziw1LKWom2kvNwoeMHEdT/BBK5SnqRuaYmLgPC1LNKQSy+aVlg8EfEL7jF
 AMdCX81aornf7w/jDHr7/U0Ng2HSzAxo5E6ETTpMDO8OmAEN8A6Uc3YBs4Bt4zZBto/rUjXtwUt
 q7n8T4y9yaoUzBN/9EXrgWz2PVn//rnS5v6U+fET3OuAIFlqBIopA1aE64ODkF1J6qojq24a3gP
 eKKXEM65geY+Hm8yZDI/2hglMx8WpBRS2tva5AywLy3YnomJSM7ql7HHrMK3yA6PoSyiRfigwUO
 qhliDSYI
X-Proofpoint-ORIG-GUID: qy2PRcCcS7ARUIGk0Fv8LLlzVJp-TeYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Describe PCIe controller and PHY. Also add required system resources like
regulators, clocks, interrupts and registers configuration for PCIe.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Qiang Yu (6):
      dt-bindings: PCI: qcom,pcie-sm8550: Add Kaanapali compatible
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Kaanapali compatible
      phy: qcom-qmp: qserdes-txrx: Add QMP PCIe PHY v8-specific register offsets
      phy: qcom-qmp: pcs-pcie: Add v8 register offsets
      phy: qcom-qmp: qserdes-com: Add some more v8 register offsets
      phy: qcom: qmp-pcie: add QMP PCIe PHY tables for Kaanapali

 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  |   1 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 194 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h    |  35 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  11 ++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   |  71 ++++++++
 6 files changed, 315 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-pcie-cf080fccbb5e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


