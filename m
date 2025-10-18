Return-Path: <linux-arm-msm+bounces-77850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA846BEC3A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 03:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C5018954BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 01:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5211EB1AA;
	Sat, 18 Oct 2025 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZFkYHsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305181E00A0
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760751228; cv=none; b=DZaTJEWpyYn17g7M6fkZVxxP+MfP34HHxcnYgrh3lta/ETAF+ibQGTyNGg8Ps259b3dW59YUX1FFMIJOQhkBWPbjd+lz5D8q1ZNj6NNBfYUPE/yizojK3gVQfjc9jH8vqBHafssoUThEhaIHnxCJDEzs43ZBrAh996ptFsKuIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760751228; c=relaxed/simple;
	bh=buXpzzB6V8sEDjGSLlS3HLSwcvy9LS6XrxQaYUlSJAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KtEXzVFdeaN/DTZGbffbaDV/DpZl4TEK+gMZKLBn8uSG4M8ieoE8VhDj5O+++iZdTFwk/I5veJu3idvz/9/6mQPculC6F6A5yzzIohJjleEt36bVYF3NwR1cqdHeYzMUYCp+uxqaCP+Rci2L1XqJp8pKotgWvl8oYlt7wKyhEk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZFkYHsT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I0JnPc013782
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyHt6+e//Wm27OxUhgiz4v3Hh8EOKz906PnWuB/Ipos=; b=WZFkYHsT1Yal2fvx
	D1iFhNbGt0819LtqmCDw2K0E/LG0hlK/4iL/pDtyOLcd+3gGNN0V0XOQ/DvuM3fD
	AMmV4m8kd3PJwmma8iVl/b9bWPiOk3Czxf6q+y/LDrZj+l6CbruIkR4gCgQt21le
	ecTpR4CGjc6ga2x49j40NR9eRyCOJWQEUJ9b2XLqe7oSneE2Gw4atkm0SzrODhkA
	82Dpl7BBtSKOyD1nRRBz4S2i6rLaJrsLisrECY3q5ubTQaHxvydolPkKVp9gsYx+
	oTGsvUfvKjex4s+iRBC+/tzSPPNhCEeJG6uBO2OR3Qhknajy5fXSqPBkDIYudodn
	FDleeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08p83ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33baf262850so2553508a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760751225; x=1761356025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyHt6+e//Wm27OxUhgiz4v3Hh8EOKz906PnWuB/Ipos=;
        b=jw4CFpV9rsVCDiNphFRko7YiY/J4hEY/TpEiwH17xcAU0feTadzGGsxikL79pJVifB
         +lGafzA6/3isvdDWhjXGfkcZowGsOYmvGbyfiDNB1LPFRmbfm2poGd7JptRHzLkDGYxP
         lvY2BqtCJTZhgAaZ7LadumfgwpTz1QBcNgvWXzDmyvZTROYgoMfv/0RIUAVErsiLKrVW
         f+vWelHYtlNRVAfaSJX8JLdtaRTvOHpQ4Hd43hQXc+pr6Zj5xMBZWksChxF7uWLSrUMA
         jaE9xFn1GyqqR0CtnrI4MIzLVnXdB1BjuG1ulfnrnN5DVev7Vda/2Mb4+q0m180/UfZE
         b/Hg==
X-Gm-Message-State: AOJu0Yz9GOgnTDOfre+F5suiLWRb/pC4T1dgwORbksSvvbGoFq/P9Uxp
	6LtLKtAdNYYc79asPZRiAwx5mciPwRh3Nq8/3hM3ABY4mLKIOTD1+eTlG13PVjXYs80lYCduAis
	Q37SqQFz0Efe62s4xZDlx2OZYoitLi2zjJU2Xzu/RSUIz18O7doQSPF2wrtQbwc39bLPB
X-Gm-Gg: ASbGncsYA+EHl4bvPWi4FVHhtDMYvdGV3eDPl14/p4flrhjmWZhehRk/5NwRtyZv3lb
	Gsd37W7xZg7MnoPafizGbU0/jYamQdOxHGS63B1l+8/MB5Qw2yZZbtCdjdkgKfwFAibVaQ5tXl3
	XHlPDti9GTb9l/HTes+AC9GAIYc7oX5IEOKG6K1Zv0Ljvmft2EyUFBiYwT+KWnguWvZivWYmN4C
	nfaKWshQgm+nUJfisQ1/T552qd9/HVYE5JuwM/wrk4yXlV+NdNshkN3DzHxwOwIphkzIFIROHSy
	DSmMnd1IeOLDLCUuDOjyZ8twR1wMSITSHvTkGNYqwwud+ttk0ThfWwjZdO3OX3l/6qR5uY0KiXO
	8dsukYrPwJf4aRXTO4CH6a+PUDx0IKwX2f6PBvL0WhsVfxQ==
X-Received: by 2002:a17:90b:1d09:b0:32d:fcd8:1a9 with SMTP id 98e67ed59e1d1-33bcf9184fbmr6171155a91.32.1760751224679;
        Fri, 17 Oct 2025 18:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIKBsbjRuVOEEafzTskcxI+RIZweN4v3yg7SFBNeHWuxqa9Up6EUtbI6hu7qPV7UnkBxYrVg==
X-Received: by 2002:a17:90b:1d09:b0:32d:fcd8:1a9 with SMTP id 98e67ed59e1d1-33bcf9184fbmr6171120a91.32.1760751224239;
        Fri, 17 Oct 2025 18:33:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddf16bcsm791695a91.4.2025.10.17.18.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 18:33:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 18:33:38 -0700
Subject: [PATCH v5 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the Glymur QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-glymur_pcie-v5-1-82d0c4bd402b@oss.qualcomm.com>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
In-Reply-To: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760751221; l=1696;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ORqLDn4tPxAJKBqLDSOiTLOmLrdC5p3+AUzGMEo0jrI=;
 b=CX/0QSCszI3KvpDNAdbz5w/KezYYoQGSTW/BMRP/Y/UANFpHNaQ7g3fYwWTse42LYKhiCnKtk
 yMwkgU4A+l0A3wrq190ZEWJwbKdWxzkI3EjKDLU/hS1jJtPSuaOGu6T
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX6KgI2VsMcAPA
 OToFMMADU3OpU8EtTMcP3n9rYcx65uyWWpcmGc+IehifI2M0p0OYEDsRhY9MtRFm8y0QZUtOFnf
 CWqPKxBXe9/9QN/urwZTXCoZ7GgxAAHgIBtxLWN+O3k9wFyq6lcfy/pyEZEQzDpupbacz+3tsPv
 Hl+Qftfj1nbSAfnj7haFfiWonh+VL+/LHdnlzUhh/pkp/FFcVZM8/abQ52odCsuGupKK6GBvBpM
 kWhqr2vRlHq3A8ngGJi+hLzRxsCui9czRX9jog1jqwGpCjB8q1qdouLQ0MB5tnDGlGHMsmmnRr1
 Syk0pzy894IVM4lfbZ6i7Tgz2hLjSKwW3igp4XnByuIE7eLbYaJskhaXM22dPIHF4Mb07sZ/s8W
 MPOClMW4Rx8vPSLaHGEVu+EpdNYG4w==
X-Proofpoint-GUID: 3FxLoMdzrJIW0G-Jdx56KcKpmfOang6S
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f2ee79 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=prgL3jgsdPShhDvlN2UA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3FxLoMdzrJIW0G-Jdx56KcKpmfOang6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The fifth PCIe instance on Glymur has a Gen5 4-lane PHY. Document it as a
separate compatible.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 119b4ff36dbd66fe59d91c377449d27d2f69e080..3adeca46d9aadce103fba8e037582f29ff481357 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -178,6 +179,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
@@ -213,6 +215,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy

-- 
2.34.1


