Return-Path: <linux-arm-msm+bounces-71244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED7B3B87D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 12:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D0FA04E2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3E930C365;
	Fri, 29 Aug 2025 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XB80ctCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826830BF72
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462541; cv=none; b=DnAIz7Ef4ZBe0tBfoyYkWAiMVKN/I+iHv3mjJ2zg6w1iJj77g2aF4wtUkiyfYV9ngZY/6acesnoMHF9RrPqKXlSghnGL9akSaY9+dPoCqNc7IxgADK67Rm6e6nB4ghJcTyebwsfW7kURfNILzLd+wr9m2rGY8M1VK2uOt/5VqDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462541; c=relaxed/simple;
	bh=e3gKlIgcNEy2r9Mx1i7bMF3/Ao/g9nApBx5pbLsL/sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPQApFtA2rgPm//ApTITdp0QPUjxS5Qbmh9aFA8j4S6bhm14rYG/nBBu4fI+Kple89GDzFXFmMPQI8KkAAy5eCWhQR++2VFhgfJzHqDJh43Dveqlyo5eKjgJMe5umg8nXtkmZInO4ufKuoFsUIXvzkduwCHsX2legLbxuOVndY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XB80ctCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85U6N029777
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spEKHx63+sJKj605M8Bf9cWcS/D+6tO2xX01XfJCvsc=; b=XB80ctCDZ/V39jPL
	2fIQJVIBWU15W4dToNmy77O87oVfb9XXISvxOWSyXJ85KvKGJjn06SWJe4gh/YHq
	k/a+dMYKUXPYogkE+H5cxjwCjVJwD4be/o7uW7qfQ5o8+J0wjcPM+aG6QrjwoVCj
	xPl8aBpKp1Dwk5p9gws22KbwVCo0mRPbJs6u/rvyIRoz1qoacFTnTrPZ297rGeWC
	y2/GuJrflthzEpuojCVG7Imlcqc1WJirW/rGhJPWRDyh6K55T+NF0iO6zTXmNnWE
	3CS3A7aej3ChsxHjqoCfSxcMaKwQBc3ZFeibBF1ZLV4XMTH5diRYVE0LXDKslahm
	eY7n+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5web8uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457ef983fso38037065ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 03:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462537; x=1757067337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spEKHx63+sJKj605M8Bf9cWcS/D+6tO2xX01XfJCvsc=;
        b=lxgXChGNMFlRv1wesK+eydnHGsYcUToL7+sc2/24JUpkwZXWcQb3J4iAHb7oM+zHa2
         SKkKzfKumIA7yCuBLnM+OHwELHgoTS/XTu/AAOXeuq4SJRTnUmBLLG0u2nOo/594kxUr
         S7S4FvI7XT7K9wD0GPzKTGyFmNMTaVSL9RgAbiM/DNuMdErlZPpvl+B+i1PXAZy5AiTr
         f/R7ZBuSpT7FUd1gkGiDtclouDZrLT4baWmYMturU40Dn5m1PVi1ECETQRak1SSxM5+r
         DaCsVI9oASkrlxS5SkAewrtevS8CgQdgmbFrQPLkEN9fghPNUODCLoU7aHPdIMrxujyO
         YH+g==
X-Forwarded-Encrypted: i=1; AJvYcCWDmfGDfRHFRkR56xXozuX5kBe9lfcCq3XGf/XZ+S4tXaZyE43KlWLSR3etH9FWRg64/CiV2cD7m4CIQI0j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcpc/2Bx5RHYrldWRH5M8KAJE36k0oXahLilrT8Kq8TBHxssO5
	CuTe2e5Z9nbA9Y8Rlk5vBWA2GxrSpLcPknS4nXIj4A1Fk+58662d1ol2tMHVuRvuHzGVcDS26HC
	zV8DduD/aES6rzQdY3nRwImnjBz+NkMta0nViHQdGttG7KW9g6J0grUoevBo86mCh66/G
X-Gm-Gg: ASbGncsN7ul5n7kwYTsUCx5zkamMKsHFtlCK25vYyHsj4Zv8avsPaOr8FONKyOrdQ9g
	Rh3ExPtAtSzzlrsiI+WrbHQLP449B+Nmyahm/kllI5fEv7WY4iQWxlT0LUOw1wr/LRSVcIoMmhV
	Q884CBgkw6h0i3MogIbCnlccQ72olcXg2INLJ0/14Nxn7iC0J0PQNFDw2PJanFyKAMTv80qKhna
	zCgLkV7dP7RY/JLBwHf26Bz2X8WUvExiBO/F88jfAZkWiIlfQO7qZbkKIx8EfpOQID1xIU7zk2E
	u8ynYGKsshhlDKxHWIv7bG50XLcaWvp48/gk28+iaJbY2MfL1V0nlPSBmflOjHc+
X-Received: by 2002:a17:902:c952:b0:245:f7f3:6759 with SMTP id d9443c01a7336-2462ef1571cmr350083285ad.50.1756462532953;
        Fri, 29 Aug 2025 03:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA8Xh2vbyvcy6mdjaLep3b6m9rvTPrB3vfrqANTg067b9b8/FGFP60iDb4AjB5RBjfuPIKWA==
X-Received: by 2002:a17:902:c952:b0:245:f7f3:6759 with SMTP id d9443c01a7336-2462ef1571cmr350082855ad.50.1756462532408;
        Fri, 29 Aug 2025 03:15:32 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065d1b19sm20102775ad.131.2025.08.29.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 03:15:32 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 15:45:18 +0530
Subject: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
In-Reply-To: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: TvZdxzR7o2JndsnT2mJgLRYlm1EWFGgw
X-Proofpoint-ORIG-GUID: TvZdxzR7o2JndsnT2mJgLRYlm1EWFGgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2d/5vc2kXjqU
 Je4Ia4HnynqOFOyzXk2QF2qQv2dRo7fqmilX819vYEqgXAYH2yD7ypXUYce/mfvbrRjgSJV2H/i
 Lv5YMQZx7frX1x0RR1Ns7n+Tp0tzsDBCCc2K+5j0Mskl5wFfI0WzZVrn5wD63TWR3P5MsmJCkGg
 ypIKuUcjslc8cH9aX0cm2Jd+qYyHFgHiaKaJreDqEaNaHFIiNrVebXNseqddgGQY4PKLQcLnqXF
 PQuuw4xF7dm+QN91DlhYJUf8AciuvBPK5EPz94q+JyQK7tF3VUrnfijb2EqMM8KrfxOx8njcdp9
 +UyRLL1SZeUfN+xRBB/y9Kn2PVqH4ANkFvuf7uhOwFMj0GZ3wXFbGinHcuF6jpKTxkXSjfBUFd8
 UOGQOxh1
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b17dc9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1oqufa9daVNmb7UKLHcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Add compatible string for SM8750 video clock controller and the bindings
for SM8750 Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  5 ++-
 include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index fcd2727dae46711650fc8fe71221a06630040026..b31bd833552937fa896f69966cfe5c79d9cfdd21 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Video Clock & Reset Controller on SM8450
 
 maintainers:
-  - Taniya Das <quic_tdas@quicinc.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
   - Jagadeesh Kona <quic_jkona@quicinc.com>
 
 description: |
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
+    include/dt-bindings/clock/qcom,sm8750-videocc.h
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
+      - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
 
   clocks:
@@ -61,6 +63,7 @@ allOf:
             enum:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
+              - qcom,sm8750-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,sm8750-videocc.h b/include/dt-bindings/clock/qcom,sm8750-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f3bfa2ba51607d0133efcdad9c7729eb7a49b177
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8750_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_FREERUN_CLK				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_FREERUN_CLK				9
+#define VIDEO_CC_MVS0C_SHIFT_CLK				10
+#define VIDEO_CC_PLL0						11
+#define VIDEO_CC_SLEEP_CLK					12
+#define VIDEO_CC_SLEEP_CLK_SRC					13
+#define VIDEO_CC_XO_CLK						14
+#define VIDEO_CC_XO_CLK_SRC					15
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				4
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				5
+#define VIDEO_CC_XO_CLK_ARES					6
+
+#endif

-- 
2.34.1


