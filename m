Return-Path: <linux-arm-msm+bounces-54782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B2A941AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 07:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E44E34606B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 05:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFA215747D;
	Sat, 19 Apr 2025 05:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTE0abRs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11AB676
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745039980; cv=none; b=oOaJ6R7KkQtftTtc8oGBIJ+6OX5vwp2pxILttqCPbhM8HNYsgeA8QLHBN0ApxObRWfefY2ztbw8W8B5j5uFLMDk4NWvs4rcBguw0BWB7mjZ54cRNI5ugomMN+66slCiQwCNNTIKKf2+rdW3TyNGK++sg04B6QxNzZ8whYLNBln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745039980; c=relaxed/simple;
	bh=pCUtwHwlvnjyljIuUeik7MfYiHlj0LKv8lBuxtYIixw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=frWk5VeCmj6U1AP/mpFP4sIFLggOWH6ZCCxTKM6eWIW87/shtbFIj7PKDQGCDHuu8ya0NWY1c+d6enaGuPjCLGy4tjDu+7EezUBCUAdCCw9IeLUnO8jI8aRkMVpMXEgDIF9LdsjhTcsZfazGCoZDB13TjOybcNQyz5QCg9rlI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTE0abRs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J4kndv030962
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UScITCwY8q7fw1TPqgcbJg
	0jdZe8aQUjHNEHKoH7YL0=; b=GTE0abRsWrbLESwb7FdLhiyO7b/SQdACI17oOp
	g2q74twwISlX1J5x0Pn5o/MRJRgigthpsb4GEqs30uzIG7OgF7j1QGAK8RTcaaBY
	xjwLbPRsK2fugvAnkDcGYgGalBYEZjvGGSHQwiqHY61wT3H+FAtkOIdZnQNPQA9F
	kdRNirUq9lfhgkYxL7vUzwny5sJT/NBwS/Ve7r6AUD4U6I9zOwtMiz6GJ7kYn5Qy
	qrkxOcHziqiY1S01JI5dmgouU2V5lnwtLbPdyJmEF43eT0ZUue+ht3DpChZrEvnh
	rsGt/85iEULD3bydgbOInb8p/ALXiXQCuz21AHlr4tRs3Emg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e184kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736d64c5e16so2082625b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 22:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745039975; x=1745644775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UScITCwY8q7fw1TPqgcbJg0jdZe8aQUjHNEHKoH7YL0=;
        b=RdW4rP1issd8cm7kmMnId/PTs8IgTkYTjAZYCI0eq5h91n17ajicQOTJ5Rg9pFowug
         WW5s9L8kWzp5+0fX2E+2d8ap+k1JXncVgmS22iUFXDijAugHKy3ya4e9AkIyvl39ZQ4i
         OrxmDprFRwLd44xhW+9MdXUmrmZMi+sl/FzHYvJS5K1aa7A+x2mhZKVnUmgrsMtY5qo2
         AQXQgjBV/6TSrFPu5XVK9fkB8M2ZU04YfelQPvvWv++9LTSwRYqw25LfesJEbaGuH9EB
         q6A41wEH8fcjtMFswXonJ5co/phbExzsoPxDh9p+AFeUqNGO5PCpcQ2L3LCpS3dzyFr6
         qTFQ==
X-Gm-Message-State: AOJu0YzjtZprPwf1ZX0qdH3BbVYR94JxFs5ALaIuzuEKTEXBr5jU7Xiy
	YN2p7EeWpyfJPsdqEL/pAbK/ITes1C8NvwJR5ag+3Nddil0kH9OKGl7u+Rs69d7tEaOpjTpE0mF
	G9dKC2xjSOBCU2zGxLVUJvENrmPvYNfvAsDslsLRmseQ+Rq8t7C0fW70EoQCaa7KM
X-Gm-Gg: ASbGncst49oTdJqW/qhfFLmJtIV1PNDOkWkR2nhnroxJ+WwZrH7FCunCwdsEPw2yRtN
	FKaFnqJTFqaVffJYwKhTby7dhece/Vn8qtzIDqQ48adp7j1/hQ4WRBm9111KGVtUHWf/j3Q/JzS
	GEmz8eLVZE11oME+44+fMuzi54pDWXMLzCdDsmhWBGV4zQl21z9Qw1vUeqqkHZ7RaiOj4pvvzqz
	Hz0Ngr79YmwuN9jXd0RVPXLG9JhSbQ60MUhNurulti6Q4/JbTVp9BGlztc5UD+zr6D92hTdLc9A
	eNjw7uVNeqvzMAlQS6crxDUMTiIZnZamNAgdTctNXMeoF6I=
X-Received: by 2002:a05:6a00:4644:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-73dc14c6df1mr6097982b3a.12.1745039974899;
        Fri, 18 Apr 2025 22:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH66xcAKN95mphAQHDv11KnhM7xlAiSAVOGHacJB6UPS1F/NYc/9azleyBWV36SJKszclH1AA==
X-Received: by 2002:a05:6a00:4644:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-73dc14c6df1mr6097953b3a.12.1745039974426;
        Fri, 18 Apr 2025 22:19:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaac258sm2607932b3a.144.2025.04.18.22.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 22:19:34 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/3] PCI: qcom: Move PERST# GPIO & phy retrieval from
 controller to PCIe bridge node
Date: Sat, 19 Apr 2025 10:49:23 +0530
Message-Id: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFsyA2gC/32OywrCMBBFf0WyNpJMJ4+68j/ERWynGtC2JrUop
 f9uWhQFxc3AHe453IFFCp4iWy8GFqj30Td1CtlywYqjqw/EfZkyAwFKSCF5SyF2vNhbq/bKaQk
 5S902UOVvs2e7S/noY9eE+6zt5fR9GfTT0EsuuECriTLCQmSbJsbV5epORXM+r9KZvDOUgfiEK
 ukUVNIqo+EfBJ8QKcLSGXQg8BuaJvfwnokSXzAk2OaAxqAujVI/4HEcH1QILcNIAQAA
X-Change-ID: 20250101-perst-cb885b5a6129
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745039969; l=2918;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pCUtwHwlvnjyljIuUeik7MfYiHlj0LKv8lBuxtYIixw=;
 b=FVlBfcuxXKadBTxEhw/sqeWxx18IjUBlLboG70dBiZdUp22v8tesnyNEy5oDCiyRbTpGe0ERd
 Fnvw9kWRB39BiKi+mMqGOZkWQUonJP7J/QAiQQf+1LRN5xCDDBiD6df
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68033268 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l8mvWsQ0dvX29tmygDoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: CTa6aW9xMmDaycx7hydv4xs0l20NY56E
X-Proofpoint-ORIG-GUID: CTa6aW9xMmDaycx7hydv4xs0l20NY56E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=839 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190040

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
Changes in v3:
- Make old properties as deprecated, update commit message (Dmitry)
- Add helper functions wherever both multiport and legacy methods are used. (Mani)
- Link to v2: https://lore.kernel.org/r/20250414-perst-v2-0-89247746d755@oss.qualcomm.com

Changes in v2:
- Remove phy-names property and change the driver, dtsi accordingly (Rob)
- Link to v1: https://lore.kernel.org/r/20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      dt-bindings: PCI: qcom: Move phy, wake & reset gpio's to root port
      PCI: qcom: Add support for multi-root port
      arm64: qcom: sc7280: Move phy, perst to root port node

 .../devicetree/bindings/pci/qcom,pcie-common.yaml  |  36 ++++-
 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  |  16 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   5 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |   5 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   5 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   6 +-
 drivers/pci/controller/dwc/pcie-qcom.c             | 169 +++++++++++++++++----
 7 files changed, 202 insertions(+), 40 deletions(-)
---
base-commit: cfb2e2c57aef75a414c0f18445c7441df5bc13be
change-id: 20250101-perst-cb885b5a6129

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


