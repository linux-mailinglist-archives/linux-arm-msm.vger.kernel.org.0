Return-Path: <linux-arm-msm+bounces-87779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0ACFC141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06B723013EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181CD25CC74;
	Wed,  7 Jan 2026 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCaYqVEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J10CRXOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1D26560A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764117; cv=none; b=ARbPx7oq1rXOmrhdHZry6j+wJV04U0z/MO/C/p9Nt1j6gVKe3bEMU1IU3mRFOBsnz3amTxJ/bbybQH++a99NZq+Or3fJVsw7x4eAmvTrW9fThLboUG3rliTWbHcyNID7ZU0ocCh/iBtKi+/kmVF4gnmubkjCAIoEVIDgkzgmuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764117; c=relaxed/simple;
	bh=ASMSlk9UjiBi0fWyNf6kwg3unKIiesB4YrIfAVwtVjA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qIAycXT38A10+VfSFC9pkZvQL2lyTD+PKlYGka61T10M2a2effovrdSHM3NG/5zhbWgI89Yf0u6y/CgtMZJnrocuPngwquBacjh9cTumdlXNoSn0SQaVwII67taDSIQ7F/CCyB4x/5qgUFI04MhY5P0H9by+PVejiD611hIZgoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCaYqVEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J10CRXOz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073vnkY4090702
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 05:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f+77550onuZ+yiKavi2Hb/
	3NPPvy4UOyg5lTrpToA/s=; b=ZCaYqVEMa4aebIidVlRfiqO+vxRppQWxU7KTNY
	or9Sn/bC6ubFKi1kCH5hXDNlkDcnsN40XnPLBZxcM3zruPBA66uS//R+nXYF8uAf
	w4jD0kVBlRV1fAF/y+zwHow/QGtV0JlNmXa7ypBxRBMm8xaXULfOVV6KPx8Fdkbl
	OgNywnsgNPoMOEIkEYoYNI28PG7Lecy17S7j7P+Dqoiur1nBgOmDzQKdQ95V/E5H
	LgJhDfUtDPxKe+sKo40Ce1XplD42G0OxotSXUpFikVx3vx7Kr5FAIN778yIdbPKd
	LvqYgEc21TqCRCoc+9t0sXocSSZrols1TlIMSQ493AXljNiQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyunb71b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:35:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso320292eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764113; x=1768368913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+77550onuZ+yiKavi2Hb/3NPPvy4UOyg5lTrpToA/s=;
        b=J10CRXOzEsCXHx0shhAeT93zb0IfJTBZtrnz3nMtN0lM5xUoz1tUtmTWWmQllXP4QL
         KLI9+T5XygxrZmOtpyVCkuiaWNoeldQnEOEw/lFbQmYdckyf8LHRlE8qnqUwn/FWUD6j
         aaFwfHokUg6eF4crm+xxkcRSbSQ7tEon4CmTkIGDLp8ZP/3wT5bJycIVC2un94c1JZCG
         P2RV8QA0WE32pedIrK/TxdLuQmsoDx1v6oRCdgpK+HizqKJURPxVtMvzDarHngrJRAFc
         2HbMx6iXHj4QCoeZrZUcHBH95YgSH2uPuyn7Nv5t7kNbRhNSAhQmr82YmIj6towptk8b
         h8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764113; x=1768368913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+77550onuZ+yiKavi2Hb/3NPPvy4UOyg5lTrpToA/s=;
        b=jaPsWckUj2VHv8wV/HobxYnFjE4rIbCBXHOUj+u9qcBBDoCAvh3p0J3OphdnOa0CH9
         yTIyF3PNcnmljnVatx01CdDTq4IL/+auaUkPmD8gQUkHgRp4zcylTK7iwE9QmV70jY5T
         1ETAijuczzNCx94/swOR0wnNbf3bAMA4W3hgj9eJgn3ssoKUKDSMFKtIhSU34FH1uXnF
         GVAu7G1w+W0rIhJNvwPBio9NpxfBP5xzZu/hnUqQotV1bhE7ryL05VpEi9y3BAEMYEeG
         U/YvZ5OR5YwhoS8GLE9iNw7qZCgbXendgWmOxV7Da2BfYC4xKlOtEVUigpA3RySVx4qq
         X5cA==
X-Gm-Message-State: AOJu0YweUpOBAury9pGSvrNqSaoGExMSnRclmLhj0GS5U9MZxYt0vzKd
	XPSOrRN1wyUInixzbzF98gQC8dPpt22NR30mqt69fUhyafoqVWrmVdJx/XRTdzb4/NugnL5iDG3
	qKKpCQpqv8xj+NPSlN04LRcA9qG8pvQ3tAUVueazXAW+JLvzfHHVxStJxZm+Mv5a5mmeH
X-Gm-Gg: AY/fxX5kbTGAxQZ4vF3ZwWFEA8o4r5Z1utms8LOeqEq/0B/4KZBuJuPBDZgKY7TZ3kE
	INkEVSR6D9Eetvaouvjo5In10qDMVj5gvqvqHFdJ+rxwmmZ/JyGCk6X7mrPShizhfXpHZk+m/ql
	Xd4fauXrn3sKvMx9mP82UMVySTIe/WPDgf/RIRnLb96sn+cSkb8o2mrsHbSzOuvsuSy6a5ds5OE
	lSwUKUgnsMZbqzJXrFiB1rEuocJ0oW4CmCDXuSAjQIoZdWv5mOv1tZE9ShKvXIK82WlZmSijmmG
	AwmUW9H5SImxGwfdCDI3P3Ve5MrS1+zOyAFOBE3M/JUoooImlpQrya96vKn5x1kXkvHa5yHYKyY
	1dSuf2Pg+OsXR9YiF2OWvUzbQMF+SQRVsUaW4SPkMfIQyu8tggdLK
X-Received: by 2002:a05:7300:fb95:b0:2ae:4c8c:2b6b with SMTP id 5a478bee46e88-2b17c78a4ccmr1081480eec.8.1767764113124;
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+H/7CHO6IFJ1t6J1rM75SzTDeRS8Tr9J8IukN6ntL9Ff4XA2rG26v3WoAJf7taFR/KyXYIg==
X-Received: by 2002:a05:7300:fb95:b0:2ae:4c8c:2b6b with SMTP id 5a478bee46e88-2b17c78a4ccmr1081471eec.8.1767764112539;
        Tue, 06 Jan 2026 21:35:12 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:12 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add CMN PLL clock controller support for IPQ5332
Date: Tue, 06 Jan 2026 21:35:09 -0800
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI3wXWkC/22NQQqDMBBFryKzbiQZmypd9R5FJCZpHVCjSSst4
 t07Fbrr5sP7zLy/QvKRfIJztkL0CyUKIwMeMrCdGe9ekGMGlKiVwlLMNgwNTbMuCmzsME59L1q
 LpZdHdLJywJ9T9Dd67dZrzdxReoT43kcW9W1/vuqvb1FCCq15rjWVPqniElLK56fp+XjIOaDet
 u0Dj29Ip70AAAA=
X-Change-ID: 20251127-qcom_ipq5332_cmnpll-bc27e042d08d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=2244;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ASMSlk9UjiBi0fWyNf6kwg3unKIiesB4YrIfAVwtVjA=;
 b=xNtf6jnuf+kTlQMeATA57cmtAc3xuBwh8UaB6R4sH+dpf+BfSg6iaHYz5YbI8GJuZqUKLchZ2
 ZAgUUhIe2EZCEMdM7xBYMHnol9YGG+bEIzCptEgx8sA3URky76dxHFJ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfXwwpSWtahTvcM
 AjI4diu3hAnDgPzzTl1Nr55e0Ulo38DCZZFbhrojUw9/lFgG3We8Fc8y6xCOqmGUJ1pcoHT87CI
 SCrIDVJTqnsJuywxTjUJRBfKE3+K+5K2ZOBQNsHszUYto3TKynsk8xh/wo4CEF7off/mxG8hcbZ
 ZrwILukxkGTnQckybtHXkgRMTDCR/JJrhiqoCW+/bR9sPNOHOYBYE5Uf2TiYofMs4uoh1IeOrYE
 F8de2K/sRc/gZXuOYqI15jNzNdUrtxLxC+GDYEvOdJu4ux2QjIU0QJsw9AXKM+1oXnD0e+KABYw
 Wv8qmp1ItC4UQzoi/ra4U4O3n1LySFNai7rd62wBRUuML80I+kL92/D8j5v4v6DZvcFd3NC5dc2
 TsQJN017pHjWhdk1+SrF+iyTzBNyWar+zk9RsP/Fj5Ems+X9WGgCZ5kScjetW18SbgrODwVngq/
 elPocBX93x2QnQaHGEg==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695df092 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=-DZapK9TY56_rVS7fsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: EAx9XSyZvzQoBQKdUisHKwvCFX0VRq-j
X-Proofpoint-ORIG-GUID: EAx9XSyZvzQoBQKdUisHKwvCFX0VRq-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070042

This patch series adds support for the CMN PLL block on the IPQ5332 SoC.
The CMN PLL implementation in IPQ5332 is largely similar to that of
IPQ9574, which is already supported by the driver. The primary difference
is that the fixed output clocks to PPE from the CMN PLL operate at 200 MHz.

Additionally, IPQ5332 provides a single 50 MHz clock to both UNIPHY (PCS)
instances, which in turn supply either 25 MHz or 50 MHz to the connected
Ethernet PHY or switch.

This series also introduces a SoC-specific header file to export the CMN
PLL output clock specifiers for IPQ5332. A new table of output clocks for
the CMN PLL is added, and the appropriate clocks are acquired from the
device based on the compatible string.

Account for the CMN PLL reference divider when calculating CMN PLL output
rate. This fixes the doubled rate observed on IPQ5332 and is a no-op on
earlier platforms where ref_div = 1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Changes in v2:
- Use WARN_ON() to catch a factor or divider value of 0.
- Update DTS clock names to use 1 line per entry to align with corresponding
  clock definitions.
- Collect the Reviewed-by tags.
- Link to v1: https://patch.msgid.link/20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com

---
Luo Jie (5):
      clk: qcom: cmnpll: Account for reference clock divider
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5332 SoC
      clk: qcom: cmnpll: Add IPQ5332 SoC support
      arm64: dts: ipq5332: Add CMN PLL node for networking hardware
      arm64: dts: qcom: Represent xo_board as fixed-factor clock on IPQ5332

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   | 24 +++++++++++++++--
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              | 29 ++++++++++++++++++++-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 30 +++++++++++++++++++---
 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h   | 19 ++++++++++++++
 5 files changed, 97 insertions(+), 6 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20251127-qcom_ipq5332_cmnpll-bc27e042d08d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>


