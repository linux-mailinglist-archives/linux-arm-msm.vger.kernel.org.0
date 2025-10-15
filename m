Return-Path: <linux-arm-msm+bounces-77355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D51BDDFB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CEB742232D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE95631D379;
	Wed, 15 Oct 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJpFIGIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8931BCAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524069; cv=none; b=LcjGbedrLr4vcGpR2J0j+Jxo/keD1lVuDfy2tJzjFq+0exSj8wcJMJHteuWG8x4Lu01LrrqqZ88aaT9ZGyfLt2TH6wB5RcsHJwSldonxFBb7SKIG2NEWGNaKPBpa4O/YLSK/yMz1KJfnOqbe20VLOHJ9laXqDVRfj9uJ0x5URkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524069; c=relaxed/simple;
	bh=oOngDAIRImYIC9GHr++pcMxfMCky7ceWfaq5P86DVnE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rkLggXaHi6H4HkCHqgxwNNLry5Hw19i2U8Pnv2gak9NE1CgkIlFgjs3nwFUtESpTOp9y6zwGQzLber5P6jXEas7F36x+hmXbiAfWt7cwLJ+Hg7IfJMoHwbnKi6NErB6NcPqhIpRe56xzdUFuE79ZKgmm8/Bzw3QeVXKsjeRRHAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJpFIGIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFjm004964
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zVx7zcXjZCA7ttW8u8NHzi
	JFVZBlQkgSPHnkGQy4eDc=; b=AJpFIGIb6GpIBi261CMt11+G9NvDhc1DYZFVYc
	XbsVHGICuOqBNcdgZVG39nlBwKAJKQTvmOgpP88zr8lhy/x/F6ehKLbXdFQnzQVE
	KX9QwgXICRfQmoR+KVPuq0f3nGqk3/tg6dUDPr5iAMj/9oDajfG8Of0iIgCocrT8
	ILuLYuZS8e35tb47ueeoJm8YzNRQLtbFEV1Zsl6I3hwRnsnn/J6Wu8X9HSF+fOhY
	RZETRvXBceKt7WRH5bhS7kkS52cjAezxl7nsw5L72ynSgjD/5LPhjU2u9CwixVIb
	BpHMSghmVZSkniZ4kJHVKEyjppM4OLapaPqCzDdZ2TYLusjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1agbrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso9602211a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524065; x=1761128865;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVx7zcXjZCA7ttW8u8NHziJFVZBlQkgSPHnkGQy4eDc=;
        b=LVR4yCQJcY+UkMpDoQwHKlSrzJSaE1gZ66kJacyXkfw1p6nnEifvq8I71C59Dcuye/
         b+nMr3SRa4X2SS0S5UsGctkH0nYNN70VtsabtW+k5RVtpdfa6I6dW66YqaouuruZ821q
         eTcrN4LtrPd0S4DggTvQ+vgEJc+cwl3jXvPq6K2C9bR4jChh8t/bfLG550GFgTl1+jmm
         ONwmNOAfbRBoLNfQcbcbRUsEF8pkcj/RjQSBQLxFsYMK8bjdZ0CJDRZmL6udBCEnl7RE
         VDrX48zlLC/P2PdausrWOVDjfoLBkgmug/ai0Hh//MZfyD4IYJHXogEnMXG9lLcUH9yB
         V0hQ==
X-Gm-Message-State: AOJu0Yxo9sAwq+BuUoD2DZIuH+hoTnBCPbxRNKcydjgndu4+Wx/kITdp
	4JkfPvuF61NerNPkDdUksY7/jDZBNxP3LR/4h43Ma5+93u5CWQYRV4WO7VR0fMRZwVkrNm8i+5a
	8t1InKjdFqwiCwaMJJ7hllwJsNxuTNxIk2lbyIyaUqH7TnRFONi+/bbUezXZt0vyRqKIZ
X-Gm-Gg: ASbGncsgjUCRJDHGveNJCqURx+wbpbjDk5VR4UteCrWX35mxKpyLN+ReKD+VQYQvGBi
	Mcro566LHYvUSUKHKDdbXtC9hbQMvmZ5PovHQ3FjHGCK6XOxlMwEHQNMBFvnuUfJc0BDAIpCvgN
	J0zsOPc7re1Xr+7FakuNQkl8Annqt4+IsL2zxkthcITk35UMsvJJjiDxgR5KiuWmM57+Y45Gm0v
	leutafwVh8K+R3JxnGx/NvORANOcbUesXCNiOb0vjgl/6qFsK/QqbOVkQfO11kJuhK2fKpvkz97
	guBAeQE4nMPsU8HNO52FO82j2HTnzhFZwERys1u7XDY1v6rxX8+gsYegpjTkP//01TcLA/xpgm4
	CVEIaYG2Qdlk=
X-Received: by 2002:a17:90b:3ec6:b0:32e:749d:fcb4 with SMTP id 98e67ed59e1d1-33b51105b46mr40029414a91.6.1760524064818;
        Wed, 15 Oct 2025 03:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqvhKvSn1eHk1xJPg/+2+y7nkSYc/il6T6uqSY+LutIhh8Mixt7BzAgSmrGXlz1/Dd0ye5rw==
X-Received: by 2002:a17:90b:3ec6:b0:32e:749d:fcb4 with SMTP id 98e67ed59e1d1-33b51105b46mr40029378a91.6.1760524064293;
        Wed, 15 Oct 2025 03:27:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787a1a7sm1993574a91.18.2025.10.15.03.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:27:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add PCIe support for Kaanapali
Date: Wed, 15 Oct 2025 03:27:30 -0700
Message-Id: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJ372gC/x3MQQqDMBBG4avIrDuQRATxKqWLYfzVoTaGpJWCe
 HeDy2/x3kEF2VBoaA7K2K3YFivCoyFdJM5gG6spuNB55zt+i0RJshonNfAvlW+GfFi9V7hWoT2
 o1iljsv99fr7O8wKvAeF/aQAAAA==
X-Change-ID: 20251015-kaanapali-pcie-upstream-c11ce03cec8e
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760524063; l=1520;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=oOngDAIRImYIC9GHr++pcMxfMCky7ceWfaq5P86DVnE=;
 b=ZenRdUkd75CqOFjpbQv7VcFVrsoToSHNdW+v6nXSIIbm32dkVP0Esq8fG5KvpCDG9IYxEL8Ft
 Mp0oLUwhn+0DJANqG+wx9Gj7CgTsK2TgDBxH5XLby+WxikzcMreTHm9
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef7721 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Szuw2GHIxefIValPBLsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: GDBNNrou1nlJDuOmonwTFfQedrla9FU1
X-Proofpoint-ORIG-GUID: GDBNNrou1nlJDuOmonwTFfQedrla9FU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX1qdo/GuRGOgA
 wL71GX7N6mdL5Uazzxifbi1rXbQwvkMUeuqDwyJ+IUKQzY6Ni3gO2l6TSem3Dso6ZXsPQRXQHgs
 /uGy2iNTqxpQ8W0lwCjc+VqfqL8vz24sJbvKysZ29Q7FpryWm+bmw/MpyO0axC9tZVZSpRgZuOe
 87Yp9YnOMH7aIzouVcAPuOsoBaXIJ1bIk/5jhSMZ5L59gpMpKPNvyL1sVojXgVx9KrjB5gpcfgb
 5v1BQy5j2vXflMDbtU2YE7KcXJCXeEJqlJ68gy51Qt5dPyd90mAWrSuwJ0VP9pk8lbPKfTG0JW0
 fYRH0024lkWkO24MKxSDx6608CSaxhBLGBqKU++xUFq+MvjeWQXaX6lnuJdLJp+6kQj8D8p8JVz
 xxc/dsBg5v6WqFd07PwfUR0HKTGfPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Describe PCIe controller and PHY. Also add required system resources like
regulators, clocks, interrupts and registers configuration for PCIe.

Changes in v2:
- Rewrite commit msg for PATCH[3/6]
- Keep keep pcs-pcie reigster definitions sorted.
- Add Reviewed-by tag.
- Keep qmp_pcie_of_match_table sorted.
- Link to v1: https://lore.kernel.org/all/20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (6):
      dt-bindings: PCI: qcom,pcie-sm8550: Add Kaanapali compatible
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Kaanapali compatible
      phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe PHY v8 register offsets
      phy: qcom-qmp: pcs-pcie: Add v8 register offsets
      phy: qcom-qmp: qserdes-com: Add some more v8 register offsets
      phy: qcom: qmp-pcie: add QMP PCIe PHY tables for Kaanapali

 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  |   1 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 194 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h    |  34 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  11 ++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   |  71 ++++++++
 6 files changed, 314 insertions(+)
---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251015-kaanapali-pcie-upstream-c11ce03cec8e

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


