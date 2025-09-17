Return-Path: <linux-arm-msm+bounces-73855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD36B7CC2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D455F1C0156D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 06:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2E32773CB;
	Wed, 17 Sep 2025 06:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6IkzPHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F295267B90
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758089451; cv=none; b=OPAxoNGSdbjBCm8nGu5eZmKIZa2boTFM0A4CmiQ4AfwLWKjhZfz+EycusjpggU/lY93wcTbTCrYA5zyzCTvY3ViIW3UxDP3gPIBujOPL53OmpInAeDbk4j44SDPl88FrWZxAWheTAn/foa3/SNLqU3FE93jjPI0/A4p7KLpzNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758089451; c=relaxed/simple;
	bh=tIK0PJHjHLhCI3CxumCBN3sQ6R8rmUvay1Tdd6ERBbY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bSU6tGz7fu+kveidF/EQA1S8uQ5RHTBAfDxRPIaJSGkpoOXwiXqPMNW8+Qqpvc8rmoGaK2vNWn5vk18zKte5xh2zQgEZfoWs+JcltEj65OcbYIVEShiYftb0mgwaaasL12fyYWaHvzxdNjuNuJjpxy0gSU340aFktVgTDkdjGWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6IkzPHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H5R3Tk007048
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CmNtqpmUuDi/GJf/fp3CpD
	cNF/feREiz3DtoDKcniuA=; b=k6IkzPHlcHfYTZAxQ/ttGDsuj3QsoHeqQLrA/T
	7eaQUqVf+l/G/9Eu8C7OeQLe3Ux7MkMXWHKnN4skz4N4W7wT7tTlxh1MIRE+G4QM
	WAf2OifqDvkvL1BEW1Z6ww95IXhBFt2W/bOzU7zmaY5uy/rAKs0Meo6C6tzF5kwx
	gk/ONMk6WqldrCrpxE0nmn0QG5+XwiUercGoRTIqyFAx54ATAvQauo7cJhWaYDnC
	fck6FoxRyVMu6MRuepP3O3je1YlRsAJM+uivhN2Uun/hx+KV/Tf4Zp76acuE2e+1
	Gxy4iZ7w4UCyIakltw0JIV7PbSnnX7pmDihMGh560XY/4xuw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxx94xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:10:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7723d779674so5483571b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 23:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758089444; x=1758694244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmNtqpmUuDi/GJf/fp3CpDcNF/feREiz3DtoDKcniuA=;
        b=bCOZBpqxQS3GWgLOYTGUjnzJaR2l1sp7amRLq9qCYdV27bj+9xzwL6KvwLpi5xJ14P
         dv2vYmf+8IHk962UNhYpboE6fyoVD/Bfag//aZvH7Z31oXuY3GSLBkmvRopyxeJIK5zu
         umeEM2t4GK6C0ePh03FI54dgDgtkROwd8hkvURG5GxDDM36Kyjfl/TdJBjbL8+VM+k2M
         zDZc/mG9D0FU1AMci5Mbqy67fqbuEh7crb0Pzx3PzRM1TeK8HOVCVzhvjtmtxgBvYcdL
         vG6p7Le/WSCdBqrE57g0OzXIw3LUe1pnW0kx+EmmsSwBXU9DZSftOjW4u96jZrfwzjwm
         CiUw==
X-Gm-Message-State: AOJu0Yy5gvTW9g0olEiFwg0eExMwTw04FnJiweGjknIVVUA6+LJUPPgO
	IlL0DWfLNZpf+WXr1FO9mGnvlWJ8/zLPSqfS83nL4CnDwnsD+RE/V3SAklH/6H6rc9/yFjSq97x
	ju02pWYLoHNgV0AdcRtHLOh4+xUprQ0IWptIDBrOgEbVc/PVSngduxAdHlpgXEETKDZPO
X-Gm-Gg: ASbGnctX7JNbuCxE0WRGow7xOQ41nqd6EfiEe9nMkpcZVYwJZyJiEcEzAe3AhW9YEei
	ORrnQA4o728p810yLEoCtc+7DJGrNwwD/IxmHPtY3FQPE55hwEuIdl2CRkR0WWDN9ossPq+LM/h
	5jW8Lo6JWNoiJCHZZcE5ivv4zN+sR4f1SAnOpWnZhnrLsoG+po3Yxu+FcPYDfMYvq0RJlBOo7YH
	dd7Z3+G/d4dublw1FE4l1b7yDSnvs+MsS/19u9Z72u8tdnk32NOQKFxhnafvIlZuio/7RpQKtCf
	i9XjxhN6pdXTB66M9LhDEwoOFYaddjWGGK03fYAKpL/mpkKcejtLDiYrwstbuhSwBkwWar4=
X-Received: by 2002:a05:6a00:3c89:b0:772:823b:78a4 with SMTP id d2e1a72fcca58-77bf72cbfacmr1039252b3a.13.1758089444193;
        Tue, 16 Sep 2025 23:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1rbzawJhcyJMjajZgJ1THLDlRFB+xangzzowj1QlWDOrj3QurbHGJqOH0zJ8WIcqutQKpjw==
X-Received: by 2002:a05:6a00:3c89:b0:772:823b:78a4 with SMTP id d2e1a72fcca58-77bf72cbfacmr1039219b3a.13.1758089443709;
        Tue, 16 Sep 2025 23:10:43 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b1917dsm17966812b3a.52.2025.09.16.23.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:10:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform
Date: Wed, 17 Sep 2025 14:09:46 +0800
Message-Id: <20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRQymgC/22Q3WrDMAxGXyX4ei7+txPG6HuMURxZWQ1Ls8Zp2
 Ch999lpR8m6CxtLcD4d+UwSjhETaaozGXGOKQ6HXJinisDeH96RxpBrIphQXAhNw5R2R0hOMkZ
 VUKKumbGSGZKJzxG7+LWkvb5d6xGPpxw6XZukx5T8EtpUzzlTs5pzesvb9SElOnNBGdWdDcwaF
 K3j2yGlzfHkP2Do+02+Xsqw1iekpROnpoJsYEGAdJIbkNgxLo00UMvgvXAa0fj8QFK09jFNw/i
 97DyLxevf9eYiwoX2reBWWNdu8y4QD1AcisKNMo8Ugguqa42G1q+oMn+WvzM141ytaZnpkLsAG
 pXv6kda3en88Wtala9DEQLPpzPhkdZ32rE/5jrThoHWCkHWVq3py+XyA656ftYvAgAA
X-Change-ID: 20241225-dts_qcs8300-4d4299067306
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758089438; l=2931;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=tIK0PJHjHLhCI3CxumCBN3sQ6R8rmUvay1Tdd6ERBbY=;
 b=8foHqZfnEDUUksvnaoTMqj7BEIpL0FYkSYzLFBmbnwQQBAdTr1eEuZD3bp1EfS+I2gz3VHzhd
 oZIgpyD7qVtCq8vi1ySZs66owuyFallCQV8LkNXecQMOrNwv0CvW3FL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 7GXN-9CSZM1DAM8Zf_Fn3kB0SViaSvFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/Cms7q4KKUkb
 LPUZdImsQGdBGBZ6Ytiqf6jif4il2ilVV1AzTBmC2ZGpbKzb9NgQ+wFEVGv4+u7eeq9QmcDIAQ8
 xzHkJZihi2s1bdZJxR3HDpdNr/quFULhLk3r82tAWuL3rkX4g85Kp5huc/2SjOTByUkuQEsbcM/
 C2HO1EyVmk1XdEbZm4HqI7FHvKUColjTZoS6HB1c0ZbV2ZtaB4PtLpy6foa7rG8aVMbTE1lOfru
 mgPrRP3km8HMNEPRK3/TuL0ui6Fffw1OAwUrjvd0U/qEgDfJaPgcWt0qD7Cp2NeAP2tirD76GHO
 eJl7hsId5m7GIDsaF5HpRpRCAMhZHUwdsMJoFpVDarE7fCwbhzJEXUd3chmR+l4MePlJXfNcXDN
 OJ0M7FYP
X-Authority-Analysis: v=2.4 cv=cq6bk04i c=1 sm=1 tr=0 ts=68ca50e6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=D2F59OIt-Y2HKLVK1h0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7GXN-9CSZM1DAM8Zf_Fn3kB0SViaSvFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
It also enables Display Port on Qualcomm QCS8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
This series make top of:
https://lore.kernel.org/all/20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com/
---
Changes in v6: Fixed comments from Dmitry.
- Rebase to latest linux-next and remove merged dependencies.
- Modify DP controller compatable to use fallback.
- Link to v5: https://lore.kernel.org/r/20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com

Changes in v5: Fixed review comments from Konrad.
- Use interrupts-extended to introduce interruptions.
- Sort the dp_hot_plug_det node by pin number.
- Link to v4: https://lore.kernel.org/r/20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com

Changes in v4:Fixed review comments from Krzysztof.
- Add the 4 pixel stream register regions and the correspondings clocks of the DP controller.
- Change DP controlller compatible to qcs8300-dp.
- Rebase to next-20250717.
- Link to v3: https://lore.kernel.org/r/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com

Changes in v3:Fixed review comments from Konrad, Dmitry.
- Correct the Power-domain for DP PHY should be
  RPMHPD_MX.[Dmitry][Konrad]
- Correct the interconnects path for mdp and align the property order
  with x1e80100.dtsi.[Konrad]
- Rebase the patch to latest code base and update the dependencies in
  the cover letter.
- Link to v2: https://lore.kernel.org/r/20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com

Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
- Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
- Reuse DisplayPort controller of SM8650.[Dmitry]
- Correct the regs length, format issues and power-domains.[Konrad]
- Integrate the dt changes of DPU and DP together.
- Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
~

---
Yongxing Mou (2):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  42 ++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 220 +++++++++++++++++++++++++++++-
 2 files changed, 261 insertions(+), 1 deletion(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20241225-dts_qcs8300-4d4299067306
prerequisite-message-id: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
prerequisite-patch-id: 59af38ff68afe283dccd4295951153e59e512bfc
prerequisite-patch-id: 05fc429deb58c4aadd82f7d0d714af7d34d8399e
prerequisite-patch-id: 52ee61224c7589b2122799998a8e99829d06eb47
prerequisite-patch-id: f664581f48278298bc3501eecf637d1eb16dbf9e
prerequisite-patch-id: 465ab53516efbbe38f85409e7ccb3793b05402c6

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


