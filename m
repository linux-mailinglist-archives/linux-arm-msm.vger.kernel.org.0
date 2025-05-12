Return-Path: <linux-arm-msm+bounces-57639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADCAB45B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDFFE7B1C63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5631B298CD3;
	Mon, 12 May 2025 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpcmobzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C702980C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083292; cv=none; b=al7+mUbhp9KRVe+JYn+V1PRzHyoE+vz/YlpHi68WTvqITLaz0Q4A8kvwswaYjNLCmoTkVEKW8qmXun5S/BZWHuDD+72WQvWyY27lrzIAgQ3+yI9J8kCvSp1b6yocfwlRU5q1aS/hbsbtp992cbkCYrGXoOiTcgpSo0drmJaKEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083292; c=relaxed/simple;
	bh=WNKLjOWg/ZHFKGrIkYN7s19vfVMvbS50FoNYdiYQ6e0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ttOp3wOQ0lnO5zsY76/ZVbnCfY1zDQeidU7j95QV3PjFy7AxYICnU4TC4qrvrQMpzd8D2TcChxk5QgTEYCClVrO2QmnM+hcl04Dn63rmWB1whhcDrilgDS+Jjw7ahl5pFHa60toiq6uZP/e1vFCGtw6QyOBQW1he3ZAtoFrSmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpcmobzV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIjXxE019935
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=psPriu3NT16wk6O3V5Xyk+
	gtpDLG/IM+ilK51Th05KU=; b=XpcmobzV1xf58qoXBcBXgBNbfHChU1aXL4a9oF
	HoYGjkg6Dor3shnHFLxVEAhkH/NKWthAQpqjgFxM2nbBKban99cHTLxQmPRcCGdQ
	fJxJwmFG+NRFEN4Pf5Yitb+39mvBBNeFoTWI6iVYGaiNAKhDvQzrDtBCA+S+8hPH
	BMbyn206ZOLyoYiMGnzrYT9MFSIkb5zQp72BsSh7prhUOEXwov7YBCY4wHD8I7qj
	ETZImFHnA+nQwg4MmSYnMH8YLPY0N8667TwHr5q/4NuchpEiwWqNiSuvN2fDJo9j
	/3xnq3QOy+iM6KmUVk4IegHMw93RBhBW8xvn0y/gz6SqfGcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qdupx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:54:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30c371c34e7so3983315a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 13:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083288; x=1747688088;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psPriu3NT16wk6O3V5Xyk+gtpDLG/IM+ilK51Th05KU=;
        b=aK+std7KJwMbnfz0tyvahbBMCAwdVCSkB+tgX4KX6xH3WCui87SD/VRTJwzvYrOvUt
         r91THtCFLqEk0YH9OwMrT0prruB0mylzfHJMtrR5S+mRI83OF+ZjlZp5SDyseVqEoKzE
         OQwzlH45+10QwE5+ImkDjKtwwu3M1sB2maFntiMtS5fwAYQ2FKIPSMRTOgGgx/1uoeKC
         7uvM9Wvn1mfXUG1GNF2MsN1dsAwxx0cZdE0Iv3sD43hJcqRlyMNkBLP6cz/zedjifAXJ
         O7VAZPa8v2DlesAr8rH9napcnC+cuWi1rezZoCCqgXO+4B2zpmL5v3/X4N4moXUvy1tr
         LjwA==
X-Gm-Message-State: AOJu0YzJlWkYlB/6MYVF4y+Gb5y0Sa6TlUpP0PM6+6iqC8GNj4QDjs56
	RWxYguL3H8KxTye5r0FjcEReoA+20pGXn+4rbr7BCTSz1Q0iHez8l+44rFIVOIns/TsgD3gBTSr
	Sb2pnA0/gi9GnypwCkeoMMjVabWleFMDrc7kRazr5ric0RO51Jb9Z4jSuMInvQJge
X-Gm-Gg: ASbGncv1rrLE2dq1ehE18ZHpG9ma1hOs3nqoi+FERvnYWZRX4TKWmRtf5DoJxTaqq9T
	T4bbb41zujLPWMWmuVrLNi/5WqBuxTguaLO775AZXTd4X25KOQuOC57qsleCvEtRSxSm29kZhPd
	QvyO2GbKVbqXWge42eCI++khZ8Vu4Bx83ldAjpz2HANrpfzjunYzKkkVr0/QxTMK/3/1yd9+Vlf
	k/VK18JVm4/a1VVGIT5U6C1ITWlwbMbLd1ImZxkGXUvcJsj4K1nVfejbztt8H7ZO8WNYK4epTTR
	T/ESvBw2NSJ0vJ0IhjdWzc3cfl+yihaJIgaov7M/e04ekwcC2qc3ZjWJP14B6xX9N+w=
X-Received: by 2002:a17:90b:3c0a:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-30c3d65e84dmr22358418a91.31.1747083288231;
        Mon, 12 May 2025 13:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtsl6L/SccWlE8lFkLq7BvNItOdTYpqTlUYsnu1xnBlU0xbZAIY1fNHEj7PBfyh1MqqkjRsg==
X-Received: by 2002:a17:90b:3c0a:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-30c3d65e84dmr22358383a91.31.1747083287867;
        Mon, 12 May 2025 13:54:47 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm7084867a91.26.2025.05.12.13.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 13:54:47 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 12 May 2025 13:54:40 -0700
Message-Id: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBgImgC/23P22oCMRCA4VeRXBuZJJOu2yvfoxTJYVYDe6iJL
 i2y7+6oBQvN5T8w3zBXUSgnKuJ9dRWZ5lTSNHLY9UqEoxsPJFPkFhq0BQWNLMO2sbDv+xD2gyt
 nytI7ZyIhejBe8OJXpi59P9CPT+5jKucp/zxuzOo+/eWUqXGzkiCt2ba+1aRj43anSwppDJswD
 eIOzvqFGMAqohlxhKRabC2+0X/E/EF0HTGMaNdFG6CLPlYQfCGo6ggyQgBNB4a/grCbStmcLq5
 nZHhKy7LcAD38kGqKAQAA
X-Change-ID: 20250107-sm8750_llcc_master-baa3de44b03b
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
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747083286; l=2140;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=WNKLjOWg/ZHFKGrIkYN7s19vfVMvbS50FoNYdiYQ6e0=;
 b=zikdY+jLiOdFrmrepd0IooqOn452jfbfHOp4Q/msILgeiQ+W+mFXDIs+3IvsfZ9kTcMpUmyZ7
 3gUcmFo/1DMAdfnTu+8aSYlY0sq6h3bEDvtjUUJmby2dph+hziX+VLl
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=68226019 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=dtLWG0gh-xmwnkGtKKQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BdO1X44KA5t0Qih09HSPg-4ssNP2oG81
X-Proofpoint-GUID: BdO1X44KA5t0Qih09HSPg-4ssNP2oG81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX/Ws/RJ8+XBHH
 2/O6RP0LhhWy02AOH18+LP5xxBOUJ2nrw6QWysljwYVGw2mDI85lfMVd+mS1rM7cjJePZkThqdL
 eQUlYxp6s4EtXpwCpF9Z6AM8E0c0c8XI+untjY9PjsHe4xb3Uvtp28TSVVIlARaO6/Ft71eCJqy
 FXclzq5T0t+fxg2ghfbqV7sebkz29FZoDImLAx89e4NFY8p/wFyeUp6fRN+HkNJCe92Zy/1MJPI
 5eH0CpWh/h3whinmuP+7tG3qA/q3Om/4/AuOF/5A0iRZR855w8NRe7BXB1iiLDfVAgdXnieImYC
 9ClvMm7jqwytjg0bXb+uNhK4gPRbjt9Sxz85N+upaMWn0ykSqGSUSkxi54RKGuk6uFzIqb4rpG/
 lD2eo9rL97+qX10DSGy3cw43d/JKm7+TXdrO1aPzc7BBSQ0KrNI3vUXH36RbwBOmKYEbDvb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=825 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120215

Add documentation and functionality for LLCC v6 used on
the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
and supports slice IDs over 31, so new functionality is necessary
to program and use LLCC v6.

---
Changes in v5:
- Fixed indentation style on patch 2
- Fixed macro style on patch 2 (added parentesis to arguments)
- Link to v4: https://lore.kernel.org/r/20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com

Changes in v4:
- Updated cache data table for LLCC_WRCACHE to activate on init.
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com

Changes in v3:
- Removed some unused variables.
- Added parent/child grouping features to v6
- Updated cache data table with up-to-date configurations
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com

Changes in v2:
- moved v6 offsets into cfg struct
- reverse xmas-treed variable declarations & removed unused
- removed unneeded skip_llcc_cfg branch in v6
- updated some macros to use BITS, GENMASK, FIELD_PREP
- moved LLCC_* definitions to appropriate patch
- updated sm8750 slice data struct to match updated standard
- fixed style on dt node
- note: did not add cleanup patch to use bitfields
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com

---
Melody Olvera (4):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750
      arm64: dts: qcom: sm8750: Add LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  18 +
 drivers/soc/qcom/llcc-qcom.c                       | 497 ++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 4 files changed, 521 insertions(+), 4 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250107-sm8750_llcc_master-baa3de44b03b

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>


