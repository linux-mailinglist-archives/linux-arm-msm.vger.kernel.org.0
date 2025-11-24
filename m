Return-Path: <linux-arm-msm+bounces-83031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1BEC7FDC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D7584E0314
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581232727EB;
	Mon, 24 Nov 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8iPbjyD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K14mz0sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91787221DB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979960; cv=none; b=dauV23jwRuCpD4L8BiNz3Y+XnIhDorB9upWQxUZtUnmOGotS5J7vw8NrC3KBDv0AXZ5NQ3T2GwcYyPNEF08I4f9Hu/vFDjOl4J6/vt15KjDGuF2kqRyUpkZ/vgedidNDN4gTPgDrKfbPhC+VchG5Kv7fPfj4JB5T8NTyXmvvp2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979960; c=relaxed/simple;
	bh=dndUWKbdhmg1WAkMt5KVsWo26hQSVQm2B7N9hO0Nok0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z7ksL1QK1qAT/NXGBDgm1zsXc30QeNJhpqFwbroWQRvG4zEg7hLss9YR583ogFm7BV1UfdNwBO4cZULbQAC9spa/aiM/ZOoMnWDLthH+u6PfqVzUqp99Wo2OgGV9/i/PdJy38T6kjMP/7n+NWhCxBTbAlc09EFjUJuB5DdagBg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8iPbjyD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K14mz0sm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO85d1L1684519
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yh+/VQFOK7zvEMbAZMBZVT
	a5P79BegtmU65rZlKd0cM=; b=H8iPbjyDd8uJOruOIOR9rm1h+JIbVGaeMacrg4
	5tEuD4G0yI3LGmTII9xfVFMSVMOqrWWmtTEL+lqBzBy0NkwIXQlStbdrpnlFgiuN
	nGRQImwmCNW+GpgICbbMCNKeR8UmSHfMUARFOhISON830BPxEXlCZN5eMMxw7C3H
	q50S8gx34QYj14OAN1qOLkZDWoFb84kNcyX6TcwZoqmv+rtMqrhc4OxbhNTX7GDu
	uhtXdgrO6s3z3POdAI1mTXauiPDKvvwiQ2EqyFCOQPZrH21ZCRX1Dtk7Wl3z0X+x
	Zp5rxZ12nlp7qp6xP+iHRfBLtLWtIW+Rr9ggXK5ZZfupRrUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ama099mvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b99dc8f439bso1204771a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763979957; x=1764584757; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh+/VQFOK7zvEMbAZMBZVTa5P79BegtmU65rZlKd0cM=;
        b=K14mz0smZUncteImfPUCyp19ziq9Z7ShBiaKiGw2ZGllzqNScDmxUtIkyC5LbrqUGk
         eUYCR1qTkKbnIpGkrM86VwIzXn8TIYyDJnxH8gpFTGdXLB3Gj9+GgEAyo9MVWcPT5EVw
         0B2sr/go1ncwXENAt96YhgobVKsppdxwoSCKAhtHlLh0xW7wwI84AraWjbnN+xTCmuuF
         hPovps8cKtbWPDUCsz63bllF/qyiCr6/rn4HN6aC4BxBPzwCmIRZcqPQ1t9436lQWOMa
         lvA19XJ4mcARoeThS3cNXUyK2DjlSinLGG6DA7sDMeF/VIpQt77u/McS0l8+Q97k6Wx1
         B08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979957; x=1764584757;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh+/VQFOK7zvEMbAZMBZVTa5P79BegtmU65rZlKd0cM=;
        b=U6Zfa7919BNzjvG/bgrEqDLeDO7iBzDvf1/a7Z6N75Pn33JbQkgcWu4dD0HOKnDJbm
         m+jyxJSIQQGUJCd6Gwv7cxpLRL+F89UyO5THf0zi0luDuBlHPuI1AsvNqvIQ59ndqCJ+
         4FFXHKzK1OVBvczCyjkMXksUVKUbYpqJk7nP415IlRb0nlPBojuFNUqO5qn/XV53fom6
         5XWs2sV4wqjf0unwzjllyfKr2mFfB+tztzko8K626E6F9RbVj6kZWf6DTsmuR4skSVlE
         06yK68qa3VbgbYGuyssLPyvR8ZYsjNX69Cm5d0wKEn/f+x2PAYbxiHvipWcHSLgvnzJg
         7sZg==
X-Gm-Message-State: AOJu0YzISrgizZsAFxocItxaqdJkaNm4/r7js7BxaSdH3lt5vDU3/cFG
	VkcnedVJPRwXv62vmbmFRFLGaHdmHPB5XADOikve0MpEV4Fegk+LjREgmySE+E0Dq3GC8wCcfJX
	SQl9r1l5uiHBmc2qRnTAyr0v6yX7qtsybHyV2n0ve06e2u06vLAVVxWgiNrhLbRmbd/RZ
X-Gm-Gg: ASbGnctah/xGxF0ZegJmjhih0cHOJWZWvMcit7c5sJERNh3b0fhOKxL4id/TcxvgFKT
	s9XmVWAw22UpnS2Sd4nc4PB1QJRTPkvlfWSld0xjOjpRo2YMkEqVPx6gz9mMnIVr8RgUy4Gxs+O
	2kclUsdE12n2hJr7wBntvdyzY2mgC1zcPC5cwAKrZ9nVC307x0ieZtOFPNclmuXr9lFef4JUiZb
	jfEMjHDX1TQCBmThGYT0n+ra1kANPGYxASfPn3nVx75WKa5nSvpGqVev+Nn8Lfh0vOUxzEZnUuX
	1zmmJ21da8fQrS2JMATanqUV+0kM1YbSHFCOzKzz0No2k9x1G2d/ALFfivOkQnU7TtrTWa4V3Dw
	DXCYwjIdg25vJkV4Vxe/siAUSbwiUZxuobwDQJwPTcTa3QB4qfVOR8/k3
X-Received: by 2002:a05:7022:3898:b0:119:e569:fb9d with SMTP id a92af1059eb24-11c9d7178ccmr7166573c88.12.1763979956870;
        Mon, 24 Nov 2025 02:25:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDKas93DmoZZqsZJ9oANiX7q+S9cqJHpgGphcW5x11I4tvPDfAtEzxXRjUnrPDkkS1L7/Oow==
X-Received: by 2002:a05:7022:3898:b0:119:e569:fb9d with SMTP id a92af1059eb24-11c9d7178ccmr7166547c88.12.1763979956251;
        Mon, 24 Nov 2025 02:25:56 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm46140627c88.4.2025.11.24.02.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:25:55 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add PCIe support for Kaanapali
Date: Mon, 24 Nov 2025 02:24:33 -0800
Message-Id: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEyJGkC/x3M3QpAQBBA4VfRXJuy4ye8ilwMBhOtbbdE8u42l
 9/FOQ8E8SoB2uQBL6cGPWxEkSYwrmwXQZ2igTIqjaECN2bLjndFN6qgW2/MTVPVAw3UmApi6Lz
 Mev3Trn/fDyeAXppkAAAA
X-Change-ID: 20251124-kaanapali-pcie-phy-31968b2b2916
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763979955; l=1819;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=dndUWKbdhmg1WAkMt5KVsWo26hQSVQm2B7N9hO0Nok0=;
 b=7ccUnsaTF0C2etMKM7C/1EBUPtck6KzU3v8ImILxPKY4Xrpq+yVYaxsKuwb7XqkKuq+IH3J/G
 szQeim40xfhAwxz8CFfN6hVsgeAgY2m+i/0g+XuroSO9b9SEEWFlqfv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 7NYfc5sZrx788rwVSsbzmwAdkJ7xAEUR
X-Authority-Analysis: v=2.4 cv=PdHyRyhd c=1 sm=1 tr=0 ts=692432b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=gau1cqUgYdTfV32JTLsA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MiBTYWx0ZWRfX6uDh66OJQNST
 xqzDsElnxj4ff/Umf031lSBqFo8bEWQFW19K6rGL0IxkfQy78eyk1/OQTq9Jc9zLSJQVbfxJkDZ
 /VjWwb43yDCT6LjX7QQ5HLA7PLl7y8kDICkhbzjj+iXeEoHIyZTVy26ulqc4Od10fqT1okSFOWx
 TilV8oHX+gZ54SVZPZ8MZORXERK9qX2tV+HXT+MVoK5hNsjnbFew1vItff+YNXwpZUDeg8eWlre
 fDY9BfG6ylp1Sxmbnw6+3n+ULRMYHGzcyUrBxs7+GGUbMrvUyk6LujY2p5WzeSptryhBbhdqeRn
 q+trNtdLFmQewJekTimSKrobD4i4ZJTZ4QOeesNPLrPll+lGSgnXr87j0leGO8GfeIMqKD3y1Z6
 hZBG4J/Ir3W6XvNzSzzoT7R67uOxRw==
X-Proofpoint-GUID: 7NYfc5sZrx788rwVSsbzmwAdkJ7xAEUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240092

Describe PCIe PHY. Also add required system resources like regulators,
clocks and registers configuration for PCIe PHY.

Changes in v4:
- Rebase on latest linux-phy next branch
- Add reviewed-by tag
- Link to v3: https://lore.kernel.org/all/20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com/

Changes in v3:
- Rebase on 20251017045919.34599-2-krzysztof.kozlowski@linaro.org
- Add reviewed-by tag
- Remove [PATCH v2 1/6] since it was applied
- Link to v2: https://lore.kernel.org/all/20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com/

Changes in v2:
- Rewrite commit msg for PATCH[3/6]
- Keep keep pcs-pcie reigster definitions sorted.
- Add Reviewed-by tag.
- Keep qmp_pcie_of_match_table sorted.
- Link to v1: https://lore.kernel.org/all/20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Kaanapali compatible
      phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe PHY v8 register offsets
      phy: qcom-qmp: pcs-pcie: Add v8 register offsets
      phy: qcom-qmp: qserdes-com: Add some more v8 register offsets
      phy: qcom: qmp-pcie: add QMP PCIe PHY tables for Kaanapali

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 194 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v8.h    |  34 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  11 ++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   |  71 ++++++++
 5 files changed, 313 insertions(+)
---
base-commit: 3b64ea4768e7e64b2d9ae5833dbcac19f6212145
change-id: 20251124-kaanapali-pcie-phy-31968b2b2916

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


