Return-Path: <linux-arm-msm+bounces-54275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E06A8900C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86B103B1DD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 23:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458EF1FC7E7;
	Mon, 14 Apr 2025 23:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgSkkKZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20DA1F4163
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672937; cv=none; b=r1VY7M1qsJWzcpEmxQRDy2HPqWrgqaMtW7ehGxEejrqNrhaybV8/8ujLohg/vMYAy0GNQx/xi9QrK8CM6nGA1nTR8qU8YpFbO5bbWUx1BLSaS23mQ/EupGh5RZC4wPHEakkSJRdSEYAGWl9iak2JrBFDPYcVNQQldUmUwLWC6Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672937; c=relaxed/simple;
	bh=VD5wTEQP5v829wquCg7C9IVGza7nDnglV5SJXmWNxmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cbBe/T1d/ymlyiEuNhjXnBYJIZHOiEYjmBNsm1ucfxwpSR8E7MAblDZNw3PfZZpxzLj6AAPN0Qi2rPy1YfsYgCtBWJ2r5KXXMvMG4DraBQP7S/60PNetPPR6GpjuTqVVllnkQzCaZXPd/6sIEE00R0NQAsgg+0cXlDNlF02aIMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgSkkKZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKe3jD008753
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RaZqjdWox6vmbkHvqyfAHt
	B2JWfGbBnE/jddhGb08pA=; b=BgSkkKZePyhOPi/ZXnDprkUqPQjtjrw9xbuocW
	+F+IWVo3Ei9S0TauHIMVP3J1TwMTUTLcrgywotrnjLswWMwIZouxnq4WxFNcR/5e
	0MuC+2JuCCYeg5mA7t31ab/wJp5JxKib7dEGD91GMcsnJ6Bp+rJyCJzqnTa6vzWp
	otdu+31MBk7FJBzIH8+XHhlc8tQhy1TG3ceU6xcBYGohhK2lmKalErB4ZdnugbA+
	97+R2UjDdPn2k4B4ZIanAsjUFY9UsFD2S2zbc4+HKYtzx+opPONJMCfTEk8UJqGl
	NOD3uGyVIcyfB9RosfeUnVfEG+B6NAh4KAt4dZEqkbVMd4iw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6e23f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 23:22:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736d30d2570so4260171b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 16:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672934; x=1745277734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaZqjdWox6vmbkHvqyfAHtB2JWfGbBnE/jddhGb08pA=;
        b=w13G3RH+HE1y1syXYXnoCYkqpk5NUKLD4wRRe5OH0y003ZltGclIG/R45L1fpkNr5v
         IbNvIDY6f3RZtpRNQsZHKbD8eeizK7boXjr2LAcxo8qYyfJ6t+WjRh1b93g5avoe447R
         1bjzSFkCPTTNFHIMjgEwmPrJQxl1L5CK/8ZtM8Ljm90vNlp9nO5FF9xrjJVEFOEz4odl
         HXILG9m3eiLKEAGzbjo3sBnQ0QhWGW00tEjY5vwAkySpQLw4Ulp3ZTBjtSNlRdKBWTmQ
         jSktjzSdFgZDKd4tjLoA3LTBo5A5sbf7zW4MjB3PVuDStXS7gE8k7s3YhWzUyzM9Lpu1
         hSDA==
X-Gm-Message-State: AOJu0YwUWvZY68rHp+nYeF1G877GIHhbkTN5XWK37Ou/GGJfWgqJw1h1
	f+QlTz1P1Se62xH5Cj0jWpi7+fk5k6qc79V7kJBcB1qtG7qNMs1SbjYS1lHI6Ieq+9SyG0glW1o
	OaAHXOfEsqorSj50EQmeN/oQK8bUBdz2SLvM/Fhv18ZyL6gDGibVze86QKE/5FSeb
X-Gm-Gg: ASbGncusj98qvYRHSiTpOtnouTMNWDAtAXDjPHq7fKRxsRfp6GRI//EnJM4ydhQl7Qe
	YDmQuHMxzcZXqyjMuRV8KJdZl++NS7pEmme3WQE/YXWHfSm6h3BIMSdE/kdfKt8YTHpAYz2Iwbt
	8cllmHfxsuR1tta50roqrxAhVm5Zqu8LEdi2Y8tZhneBiGDiJllHTt78ODbUzS9CeusJe9GlIg1
	2X492r2Kac+DsJeN/t+EA0NtUWOKTdnfZvpD+NV9jl7AMneSxGGnjQ/7eh2FZTCg1abIJAlPvbz
	z24qG3mD06famCBXevzpHmA9fTNMOCZljTbhHI12kspg/XgbYH4rowwz5WU8BUnwmYs=
X-Received: by 2002:a05:6a21:999b:b0:1f5:709d:e0cc with SMTP id adf61e73a8af0-201799908c2mr21844645637.40.1744672933812;
        Mon, 14 Apr 2025 16:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqzi2keJ7SOGWqB8DNIqx12NrhOhOvCEPjmQHwinVzhB2Cm6nLjGMrH7xEbkj0y4huJRvbgw==
X-Received: by 2002:a05:6a21:999b:b0:1f5:709d:e0cc with SMTP id adf61e73a8af0-201799908c2mr21844603637.40.1744672933429;
        Mon, 14 Apr 2025 16:22:13 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:12 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 14 Apr 2025 16:21:49 -0700
Message-Id: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2Y/WcC/23NXQuCMBTG8a8iu26x19Su+h4RspdjDlJrs1GI3
 70pQVFe/h84vzOiAN5BQPtsRB6iC67vUohNhkyjujNgZ1MjRpgklOQ4tEUuSXW5GFO1KgzgsVa
 KWxBCE65ROrx6qN1jQY+n1I0LQ++fy49I5/XNUb7GRYoJlrwodcmA2VwdbndnXGe2pm/RDEb2Q
 TgRqwhLiAIBtBSlFDv4R/gXwtYRnhCmaisNqa22P8g0TS8sFq0sQAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=1916;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=VD5wTEQP5v829wquCg7C9IVGza7nDnglV5SJXmWNxmg=;
 b=/CVvLH5JraN8SHvw5hxkvWwDJS4mBPxQnCHeB0Bh/K5RWf0J0ASl0Gf9Hqa1AW1mH55NZgPzX
 8VLKTlppBzWDm5A4TZfGQ8haAouFry26upy6T3mzn86f8xpeRdpAySC
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: ebO3cg_DLpgyb22StRUSD3ymo6AtWPek
X-Proofpoint-GUID: ebO3cg_DLpgyb22StRUSD3ymo6AtWPek
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fd98a6 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eeNx2805JM5utdwWTRoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=706 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add documentation and functionality for LLCC v6 used on
the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
and supports slice IDs over 31, so new functionality is necessary
to program and use LLCC v6.

---
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
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250107-sm8750_llcc_master-baa3de44b03b

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>


