Return-Path: <linux-arm-msm+bounces-54276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBEA8900E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A597817D76B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618C11FC7D9;
	Mon, 14 Apr 2025 23:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XheUTK7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3CE1FA16B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672938; cv=none; b=UIJikS6Chzs+5pbEKIuygqWoPmaRv8l4DsKCZbSqa2ZypDMhNdF6dgRggQrb43uixFiXN93fmGOi4boQJ89jzcq2skJnRpIQPvUrcQbcZ2pek8d2qkTDUp7cQ6deT2CbXBDIK1ZoDJHjNyujHu+osjn59pgR5K+hux4h0xOLTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672938; c=relaxed/simple;
	bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgzb24+wu4sKxUWjCllgmfu5hVOiJTeRHVCi8v/7AteCTCT1mgwq47n/kbesncMVl6B7xv1lwAYALRTdl2XXOVwo65OIlSIvkrbASLxD5+YvljELmarc/8xwhrhtp5MGNjD3uyjxP+vVvDGaQw9XzflMLtiHJhl2DvEInJ5W0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XheUTK7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKePbL032464
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=; b=XheUTK7/y2G9YEi+
	3DsG5+WxFCpRsNXgdOQEbMxZ5SyZ946WalYziChn5TLl9SGENYvs7xHiRNzLDPQW
	pwbCvI7tcBrA2d1UESyzD98OQN1ylnmwUSNhn3c5oaWdEkpdIHR0IdNnQsQeyyFj
	uc8kXMsVn8r3qs8R5gCY5NAcr31KxAJwxE42aBLxxj3JqhPoihoQsNBHzOKUtXr/
	PB+/CGNdEz+V54tDuP1XKnw9hSwKZZgy/l0G6/9+/YukBvUMc00DrsNEfmCuoFvt
	0yS2wpxQoktCX3W6qorQNEuuBIphvEdz5ON/yqLhz6PvZUSJ6kyisFn/dkPLO+eD
	r8h/6Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpnvj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73bfc657aefso1067403b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 16:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672935; x=1745277735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=;
        b=xC0oJcviAvxM5ZltypZveWV1Mu6b0iW3BkCt4xklwFHYHpOmdMx8rWc50i/B1Mcx+V
         +CbLY3zfhpvaz5M3DzwMoJddwiNS1kHuG0ECk64U/iZYA38YAmBe7qNwBhpFEPvGvdx3
         1h9zDcH27mfGQ7M1o6rEI7t0089E9hXD14lIZAcT6mQ9H6jlu1YQLYJOU+cQntx2RBAr
         OcpDyl+PM2+GgjKSpYbRtql/lA8kQZfcEwssOBFoYRbrHQ/hEOOQ8NuMn10bzpJO0Xii
         niWFyHWuyKO5WP/J9QpJ0cJI0tMAMXESQi7iYySevp5/eq6bi+GCkId2ROjQ3zf/oqAe
         gZCQ==
X-Gm-Message-State: AOJu0YwZZKnJHk+vldyDAL3e6XiveTAqCCoXqpOej4v7eWlRXQFDIRR8
	JcBhkj5pNQUwOXSYSIAMW4LewoeL7qW2ik/hr51qd2yaNSkWfZPouPB6HYk5BBkm4JCi4ZD8Mew
	7fWKfgLkNnRyI8DfT9GR/G6eKuWqeeRg0PR9C1hOOdJcNFCa4VloTaMKnm7k4uRuU
X-Gm-Gg: ASbGncu3vJGnkcsVPLsZkqxPNGKjpfmmt/mczPlfLvDkloFK1iBtRyBoLecvH+gECcP
	+npNO5QoK/yMI8+wRz/isaxNElsGXnX3f8Ua13gaJv50yeWh+/mieYV0ALvwsNtyLaJCQCu21yT
	FgsqpR4OpPikZNA3Qsq/pIJ34x/NKPL37Eu2yApehI6PYVv7akc8uLWMcnCEn2TsPDvGYHkWvq2
	zsQw+BiuTKkkGbWFCAyNN/vpzvjRHlWX46+KAcbTWLDKgy4aB7N14pSfPPDrJzFQesqWU/x0B+3
	I7S1QciNPJl+V0AE6VULhzwAmFA0+MM5FCxiBBC3CqNoG2HjL+TMTtcXjMbifnvaKbk=
X-Received: by 2002:a05:6a21:8cc1:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-201799645afmr17990664637.33.1744672935158;
        Mon, 14 Apr 2025 16:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQotE4IJwFSf60/yRceyEHCN9NT8RU1Xq2jQoJx1KNuVZ1qE9F0fk4YZq5Qc+GudEIp1XXbQ==
X-Received: by 2002:a05:6a21:8cc1:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-201799645afmr17990626637.33.1744672934710;
        Mon, 14 Apr 2025 16:22:14 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:14 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 16:21:50 -0700
Subject: [PATCH v4 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-sm8750_llcc_master-v4-1-e007f035380c@oss.qualcomm.com>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=1020;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
 b=QMIU6b5l+kB49usMjdLtstOn6pSMTMnLpx2p/yocj5YNe/oym1GeCeLXZRpkrY828+UlmJekZ
 gJv6Uk0wqc/BMvrrUM9korbwpebMFZIQ5WzznXjACViEZE+SX5Qh3BL
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: e4-kZx9K37th-djqMLOxKx4VDEttysEG
X-Proofpoint-GUID: e4-kZx9K37th-djqMLOxKx4VDEttysEG
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fd98a8 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=sCV_76e64iQtlowYmxsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=736 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add documentation for the SM8750 LLCC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a718dcb717ee82155 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8450-llcc
       - qcom,sm8550-llcc
       - qcom,sm8650-llcc
+      - qcom,sm8750-llcc
       - qcom,x1e80100-llcc
 
   reg:
@@ -274,6 +275,7 @@ allOf:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
+              - qcom,sm8750-llcc
     then:
       properties:
         reg:

-- 
2.48.1


