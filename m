Return-Path: <linux-arm-msm+bounces-83018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDC3C7F9E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C3F04E4664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552292F5467;
	Mon, 24 Nov 2025 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3urMDeS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMjUmObb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88344226541
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976359; cv=none; b=afxoixPtnoVz14E2th9wG+hLESkuroqPay7jdqJXPJIVYWvlsKeN7hl3XU/U+txouwZ9C293MFhMuEW7lx/kVvOqA7HOr3koCTz9LGlvUJEmFBrXM8X/G1joyj8eanbNT4lrR6swaFZbNBnI7LKKrNvavDhHI8s4eBV4yO3a4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976359; c=relaxed/simple;
	bh=oRRfUKdL+GmbC9P6NIsS1/W+cYLgkE8khqt3B0OtrCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tyyd1HI7uxBoBveubkm74VwHWQ1eki5Pa4QzDn52lYBSmZ7lLcqih5PDrEneYQEnivejOyapP1v9h0vdeeI2lVo0emNtgrP3RmYSEVo2cC9Vlzgtw5OTyutoQHNdd7BD70foBoFzJ7Nq7SsXQeXlAoqD3JcleloaaqqPTqOYLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3urMDeS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMjUmObb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8cn8M2979239
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GGkbpCdUpu5rIxgk+rlTy5
	TL4Vx3yHm2kdYqOkYYbMU=; b=e3urMDeSwnPrrYHNLCco6jndcLcjBTyrVcsR5B
	9AMnRSQRCJf7GLz5imOMtUYQ06S06Yb+qFmfRKgmpu9BWA/5Yh77uivSuab7DmVe
	P+EchGSAq/tXIRtju8TI/l7vYD9YRQ40fYC4/4wG1J6qoBp+lcmwUwmhPkrZ/jad
	DNFPyIdZAy5NVEqWg1RbTKt2kUYoP/20xqWzzANB19ov5FbWvd0yaTHbnUXOAeSg
	j2iAx3A6nTJWzN7YUsfmZhnV7fraIrCSra9b7qezZByEAr7Zn0CWtHMRiQUopOme
	2ZVOZ9xxxvNwEY58jmPYmy/aaRQGKzZCUpI58Oz8/+OK26Mg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69smebj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:25:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dabf9fd0so52475795ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976355; x=1764581155; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GGkbpCdUpu5rIxgk+rlTy5TL4Vx3yHm2kdYqOkYYbMU=;
        b=BMjUmObbeV7g4bkWkDZ2l8o4W9oo/e2kpA8fJEXp39WGME6/0CbFHmZlMGnN/yujtc
         U6fzPw66fZ/MWksKMRnj3K5K3a0ekXI6bYpCN/RzrTXKlgSHqlow8ElYzskrr+OC2/m9
         WU1wD+K3KtOhbImcWi8S6GzwNv99Jxk2+iUzcnVb8TbRBpy8rY0g0KAVlmlIrd0UIjoS
         NXd0u+AliI6hB4hLg+Du6hPlBLqI3Qnzs8WQhcpaR8vXLjE3dOwrFbTD9vI3Jhdvq7D7
         ZJhkj3io8nu8MyqywqShrlCO6T0LD6TtOrp0nY2smmAlXRxkwF8pfy1AbSy7OClfSFBD
         13KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976355; x=1764581155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGkbpCdUpu5rIxgk+rlTy5TL4Vx3yHm2kdYqOkYYbMU=;
        b=R3ounTwwYvECud9g79cJ3/JzUgLLACEkH0rHGpK1QcKP8w8NaY/ItGqrIb+tchI4J0
         cR8X+T5I5arVPQQ2GerZryWwaWo9mxgx8JYRf4TR448KHZqrdTKh8lSELCFxvBWwl+//
         8ZFPUFyVfFZYbOp/p9q/OT6b8tLmtC8h4FA4oM66a67xMvulrTvdeg4h1csD5c3AIKfe
         9P/O5T2DW7qA3JJ6lT2AWuQ/tsXwFQYNcVTsa2kqcfqWQxPpxKfUNZ+QGOmg1J62sBPN
         IqEmqUetSSen1c6Q1qf8w7jBn9PydkS0P7f7G9FqRuDFfd8FHNqvy7jmU7IU82jdhjCS
         +U2Q==
X-Gm-Message-State: AOJu0Yy99fttLmCzlZHZ6J1YPukn363khqFfawC8V4pdr7+lUovsNu6r
	b148O95NCkoFFLcqnE8F31yfcxH+V5zsyklWjac1Ky1w5vpEslvuUC8lFof+tg16flBZT3C0A4E
	v7r7PexfAd8DPd3DnHdLCUbs2nb43C7y0+fvXKyGeITaIoEqMfLUkYkWNs5o/6O+92CP6
X-Gm-Gg: ASbGncst2jEE4sIrXuQRrQOPjwohDh+TJTjByKrEKs36VWJd29rfmZHLlncH5Ys9d7Q
	XMGCZNpmktyKRaYrC3aF1gqLfEn4mjfSwVEPguKCBiRVQlKIgzKYqGBGcW0UFtDNoATOF3Kbh1r
	bW8zLh7AqyESKn7CBktnb/834h5g9V+j7ScNQIvX6zbn3tjmSleY4dNiXSedBywag3ULdqqF5jZ
	rSZuIkYcGoApjy0ekyuVVzozU/rq2j2ZdEtuNVxK3ngR+BHSr5rGaFTeVWi3AHtMldsmSClP05o
	P6C5BY+9XHzCTKBQpF6simlqvWHmEKYITOISCcy9fnlVRaZHc01JFz16UXAmC83K1YPIjEZszU8
	YQrIfixZ1lcS3u8GEFLKnwXRTwgCV2j1cBYMXv9I=
X-Received: by 2002:a17:903:1a06:b0:297:db6a:a82f with SMTP id d9443c01a7336-29b6c5088ccmr133368075ad.24.1763976355254;
        Mon, 24 Nov 2025 01:25:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrJrf3FlSDWzx0QjNnW+yGQKfRH94449PpVh7Ybt2aT0dzg7QCeH1s9XXGDqan4thpmpBtpA==
X-Received: by 2002:a17:903:1a06:b0:297:db6a:a82f with SMTP id d9443c01a7336-29b6c5088ccmr133367805ad.24.1763976354736;
        Mon, 24 Nov 2025 01:25:54 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:25:54 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH 0/6] Additional regulator support for the Qualcomm SGMII
 SerDes PHY
Date: Mon, 24 Nov 2025 14:55:16 +0530
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0kJGkC/x3MSQqAQAwAwa9Izg6Y4AJ+RURc4hhwI1ERxL87e
 OxD9QPGKmxQRg8oX2KyrSEwjqCf2tWzkyE0UEIZIqXO/CLCx9QEOLA1yv6c22NTl1Ax9nmHGWE
 Owe/Ko9z/u6rf9wObmecfawAAAA==
X-Change-ID: 20251124-sgmiieth_serdes_regulator-027fc6b15216
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=2187;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oRRfUKdL+GmbC9P6NIsS1/W+cYLgkE8khqt3B0OtrCQ=;
 b=LY2dCeXA0T+ip1EL+9qn+4Jg8LpL5jU3mJK9bqBvk0LpWn6tZP1ql0WNS5GFxHNG3Gw9zOQ38
 ZtoU2cyZxK2DGnhZpojw80bw6Up3eU4rx0eAgH7Ir2/Y6u3xH7VYZBh
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=PNMCOPqC c=1 sm=1 tr=0 ts=692424a4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kig__V_yA1QLnvhfcNIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VLLAY1VWoqh7Ve7td2KhdJ0MkJAy7Miz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX29hMFia4b2NC
 fTnQ4uIo42sq6iVMl6WBmt9Syi4SJLzJPf/meE8OhJt64UNUzoteHF4qoxRcUVn9X9jjzcEqDA/
 VZo4oCkdf1A5O7dtD734J80Obse9iXwZVGjgFJiESXp4SKe+za7frfWfbnqLKGn53bgw2d7eVTL
 EkJLKWNkYyelCAFIfGWlv+ScbtufBetbJj0sCQt54vg45gg/EuYU4HCgYt5QRTQN6fUioyodzso
 4uebohFBqs09gaiVi7hNmlip6iEF4700dVP18C2/wBgV5ZWcteQGU1RA16cH6Arzgy5bFDgLGnt
 gNnbLxu4kbJeAy63sBQcTE1bt/nXU66/KLDCCjn5maSWH/gIV0OrcJ90DAOUxLIyc4p+weFingm
 Ee2c+ThTqXGv+lX3yZxU7bc1U4eapg==
X-Proofpoint-GUID: VLLAY1VWoqh7Ve7td2KhdJ0MkJAy7Miz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

This patch series addresses a SerDes power-up failure observed on the
QCS8300 Ride board using the phy-qcom-sgmii-eth driver. The issue occurs
because the SerDes PHY requires both L5A and L4A regulators to be
enabled during initialization. If either one of them is disabled, the
status register does not reset, and the Ethernet interface fails to come
up due to a timeout:

[   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
[   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed

Presumably, the issue is not seen on all users of this PHY because both
regulators are often shared with other peripherals. However, the power
rail schematics for boards using this SerDes PHY show that it is
supplied by both L5A (1.2V) and L4A (0.9V) regulators.

This series has been tested on the QCS8300 Ride board, and the reported
issue was resolved. All Monaco and Lemans derivative boards require this
new configuration as they use the same SerDes PHY.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (6):
      dt-bindings: phy: describe additional regulator for Qualcomm SGMII PHY
      arm64: dts: qcom: lemans-evk: add additional SerDes PHY regulator
      arm64: dts: qcom: lemans-ride-common: add additional SerDes PHY regulators
      arm64: dts: qcom: monaco-evk: fix the SerDes PHY regulators
      arm64: dts: qcom: qcs8300-ride: add additional SerDes PHY regulator
      phy: qcom: sgmii-eth: add second regulator support

 .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |  4 ++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  1 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  3 ++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  2 ++
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 24 +++++++++++++++++++++-
 6 files changed, 36 insertions(+), 2 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251124-sgmiieth_serdes_regulator-027fc6b15216

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


