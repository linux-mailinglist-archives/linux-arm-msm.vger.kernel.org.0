Return-Path: <linux-arm-msm+bounces-71352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE049B3DA68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 08:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DCAC165C22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 06:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6341E25A341;
	Mon,  1 Sep 2025 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnYaqLU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA8238C3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709903; cv=none; b=qT7ZzrIFAueFseOCM1IO831Gt/tmnkqL1+R6H6xFgT+nIiYu3DJL2eAiMsGVYotx+3HtE9HOPZnpycmmt7BHd25aFwF1Gm667aL3AeOC9u45AgFjhfWLYAeJ0ypkphVA9+Sc0NHF+ektfRKNrjfjhuxLwJCvdAAzdxgEjrtM0M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709903; c=relaxed/simple;
	bh=Bohuu2nXAiF4O2/AKaeromzfaJnb02aZ3+OBrSc4vGY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hRm7ip/gMLMcRkN1FjqixTQHV1xpwf/NT9lSRnDQp84HviVaWtHSKYGnvX+fMFg0IMSj3jzu/E0MkjF+7ZnheQmBqV10EQ3GY/fVA55gf3BoYc4bx8PGNgZhb+CqvJNY0QnEgZDMYIilZGkA/Aw9inWeO/rdB+YFGC6avt6Zdtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnYaqLU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5810njDa029671
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 06:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SFxB4b5152ACgHv5hL26zS
	RXW9kcmLQr3SA9+ZzOJSU=; b=RnYaqLU9QZOLMDiXx25IYxD1RD7AFdIdoGz3oe
	ziKNbMudY/P/UPHIoEqXJ/eLZeUOLmn6OdsLFU3YzD4yDYsWT4K2Am2OKzIJwK5U
	1eNBIlcpaGsxDEIAfMxweIA/3X6+7hA1inRDqm2T78PbMpY2vhIOO4OWjWqtAmx2
	MIj9HqfP6Od3Y84g3YyvKJzfSHTviMNyvb/75H2O3MvxeSpdbwtKSWk++sgqROea
	cPgwkzTxN9BNscJXe14jYLlcYAE6D0wQPvWszeRZ/PUJHl0TyOZRSyBa7hut6Mlr
	HRGhNu97+Kn4ltjL+GiPrT55E16XtJb9sxaBXdLEvb3zAOWg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp3sh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 06:58:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4c72281674so2624543a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 23:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709899; x=1757314699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFxB4b5152ACgHv5hL26zSRXW9kcmLQr3SA9+ZzOJSU=;
        b=svUgXZ875/Zuu1Rt94AThx8FVoOfTTjMw8G4k/hOa4kQqFwdlWvX6EQiDRflT3NskN
         Y2FJ2IHCWQv88gR26pXOyTwM/AJdxtiU4HcNSA7Bd3+n5rkVCPgqVqFdohAF8zBuOwy6
         Ka11DBuIDNL99ABEqOd+sCTqSc+Hkk6kXrgHhHvgYsAKZsxulugclcx57286j+AhPpIK
         Hq0cHWqSnJRQO1fhiOqx1z+lZxN7w3Bz1hF2glpkKvV2tHoiABXFO1+Yiu1cidvZmXPi
         FrH3TrWNCXLcF4dbQplJOb0vHUo0Atz3qsRXSAAMqqvQn0uxagz6wBORcvO7tsUPkFf1
         SgSw==
X-Forwarded-Encrypted: i=1; AJvYcCVXHlV29WVqWaf58Z+PnAfU17Tw8wOBd8fkzzU0JWVGO1zHO3iCvLRbB95Bxhx9kmibZUYXcJY2FclCPHw3@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNwtuQjd0DtolW8LAbQ+RctPabpcEp8dnbSjBIR4OeOqjD/OJ
	TxgQ+V4HUEYigGpTvlkjLF81oAOQ4WVv1wjFumkequ10l4CXNjY7SwoHbwKgfvhpgw8kfGrd8qo
	T9yuMmdTKWCYfcSwqAlQ4GvCPfEcRy/i9glExkd3rtsM9sNlDq7ZVGIx2WcVf4ddLlpR+3BBOFf
	Kb
X-Gm-Gg: ASbGncuyvl2ypum/vwDbUPe688fIE+lExoxmp2h8sDHxnDGMhRcdG9+YUocDxfqeNbT
	oMfYfR601/ksxfY+Wr0InDGxH7SxZTxwwVc1Uq8K/dNPWDTPknolRZU/IIAREYLezOyV3pEFpqT
	YMtvz095gHdv4LBX+kNCV7TG+KhItojwAU0dcK7laETvDxD/vD10tA9wNoXsAYQZnptBCzk9xa+
	3eMmweiTDCn1DfqT8+gGGUUZZpalc5HxbahaQOrtQEga4y+NegT8DVaDQsDNlcvGN1M5X0sIpSW
	PenpianXbOami58OwM2XBRh2i4kfYSrA7hWi/p/TvEdqwlQ2RgTRDysyierMNPGBSh2gU8kxwt7
	l8ZO5BsCkmLWUlLudTDJFpw==
X-Received: by 2002:a05:6a20:244c:b0:243:c23c:85cc with SMTP id adf61e73a8af0-243d6ddb139mr9824703637.7.1756709898888;
        Sun, 31 Aug 2025 23:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/MJTK2LkXJkAjtOOHujdhhNAOwInpfVcCHf55Vp9xMFEF/nOrcg5TLoWZNE8rzo27oCxGzg==
X-Received: by 2002:a05:6a20:244c:b0:243:c23c:85cc with SMTP id adf61e73a8af0-243d6ddb139mr9824668637.7.1756709898378;
        Sun, 31 Aug 2025 23:58:18 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm8559358a12.51.2025.08.31.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:58:18 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v4 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Sun, 31 Aug 2025 23:58:12 -0700
Message-Id: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAREtWgC/3XM0QrCIBTG8VcZXufQM52rq94junB61oSapWsUY
 ++eGwxG1I3wyfn9RxIxOIzkkI0k4OCi810aYpcR0+rugtTZtAkwkKzikrq+84aKkoEqLK8rZki
 6vQds3GvpnM5pty72PryX7MDn3+/CwCmjJZgKRaO0LeDoY8wfT301/nbL00Pm0ABbvF8xJAyWY
 VmjEAjNH1xsMFQrLhJueC2lRa00qB94mqYPNWPh9BsBAAA=
X-Change-ID: 20250815-itnoc-460273d1b80c
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756709897; l=2054;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Bohuu2nXAiF4O2/AKaeromzfaJnb02aZ3+OBrSc4vGY=;
 b=ET8jnq7cEfnTAI4blvxKkZzx0y6DFwRxd0mxO2N8ainzsfhuOU2lmKrzM8nqL0Fn00ZjlSEsG
 fJFPEVbeEInDZaAU6ivgNEnSv4eMiGVXzWaZcXvRkS1FXVTv8VXkW7c
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: DnO2yfo4RkiLyzQ1LYA2AUkCz1r3xLvf
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b5440c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G-CQVniXWX8y_UMPSkYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: DnO2yfo4RkiLyzQ1LYA2AUkCz1r3xLvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXz5CdqX2C7Vv7
 I8JS7VW/QODc9OhnIVvF/rcewpqA6WQoGvg5azLuweG5kLbRIQzIcWCTINhusMYZQrVrBBGnRWM
 qh6KoYrnfN37CGTn2ct6RCv6oWxgtxz0IB2yWc5nOWktaNLZassStdKbXDjmttSv0RiQbGCD+m3
 u0W+GtieZX5wW2tVMbK/nNPjUdj8rjSvNF8nDPcyzsSReXCq9ELC9eAz71Ggzcy8Da2yQE5TtGV
 Fq9++AiexpqEtjhnf+4EyxoRUU+4aHc5IkoqZQME3Asa89X1sPg3Xnjs8R/3rlWrnDKRTyxCvnh
 hpqemKnQpU8ZkY1BzivzAH5hURLOKwpUltdtoBa3ZDk6klYislVuF910+JRKTFWUmzR8hvENxdA
 dbsLnmfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v4:
- Fix unintended blank line removals in trace_noc_enable_hw.
- Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com

Changes in v3:
- Add detail for changes in V2.
- Remove '#address-cells' and '#size-cells' properties from in-ports field.
- Fix comment indentation for packet description.
- Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com

Changes in v2:
- Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
- Dropped the 'select' section from the YAML file.
- Updated node name to use a more generic naming convention.
- Removed the 'items' property from the compatible field.
- Deleted the description for the reg property.
- Dropped clock-names and adjusted the order of clock-names and clocks.
- Moved additionalProperties to follow the $ref of out-ports.
- Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
- Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com

---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
 2 files changed, 215 insertions(+), 11 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


