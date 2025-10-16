Return-Path: <linux-arm-msm+bounces-77507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76086BE190B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 174384EE187
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 05:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03CE243958;
	Thu, 16 Oct 2025 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnD6QQF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B655227B95
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593781; cv=none; b=shfSZ0o+obFQyJR4ZEC/a9eOXMgTkihW7HSWPqzwDpMrjN6ISNo/gHWQfOS8cZlvjJQLu0d0xgh/zriwaQmHST9Mu/BanM+NiYaka8gfI7aKmL41HtXoUD8Ecc9h8a2/cS8jPf6aKmJP7+ka62iB04mbTe06U/0wkFAgYMYHOAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593781; c=relaxed/simple;
	bh=tBet7xd9Ix+7i7/6lFaf25DY48b+0wTDWRETSg/THcQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=txrhFToD2OtDmaWHZNGvfGio/r0aEg6m6cRzGVLyuJruwVnhfzr1rbT4KZ4gP+cy5U2IR+GxkFBk4MsJd8QM3d5cW6yeXPLUGmnnw3t7J7VVPAt/8kzEKfB7vBgOEuD+piBOSQ/sTCS4gxVlmCjOa5PEhj434itMXxzSzIn9F1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnD6QQF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G2O3vh022883
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I0tZsr+X9rb2BkuKPKohL8
	wWGapUv709og7lMSnyxu8=; b=CnD6QQF8FLP6PSSuQz7seslyPRmsm7yJz2mbfZ
	d1yESe+nLBhWcj8HvqsIufGA0lUGP8IP7rpHOEpG6zB8vWbnm/HuFu00Q7E5vfhm
	Zak5EwNKfnh+f33ceb3EJq0Jlu/p+rfpD7RJjHiqIhVqq5UyI/m7cWLUCPVxey8X
	vKdNO4A97UMdYxdk/JeBgCkQEVcJ+xw6Dg4eVql0ZlKdyNlZzc+LGNFs5Cs0DgxZ
	veM79BT07k2Nl+slYSJxzOEcZWOlKg/KMb6RMM6J534kpdGx7gWZJvHnIkyofEQr
	nPwME65qaYAWBQbyoBq8FEJHuAqrJKRCbmmNHOmRmxJaeVeQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpgf54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 05:49:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so493895b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593776; x=1761198576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0tZsr+X9rb2BkuKPKohL8wWGapUv709og7lMSnyxu8=;
        b=AMHTyErV1x+aGhbt5IQ0FPvhn1R/56b3/4WRUYeUcvDBceRHDrGZd0yh43LcJEOtNf
         f2sJs9pnSHCRG3fCODQUCL1PLgcF3BnpbZZoiRba5uIP6OtV1vDn6swzTVwtMy5ZCJEV
         YUtERLFG1EVn2NN3NqOtyOi2AxEqsWuT+FG7oQC+lomcmDMthJ2UpuE7eWGjy8CTAGQc
         D0XmLKuOkTfA5JU5kULfAVRT6Y14Zczkt5v+X2/iEAn4jOPxvHXLFg5sxgQbysGjM5U2
         WjmXeIyU+1LSZI9hoN0ZNYT0xBVcUfCu6W2GPjpSVSnBLygb2oezdYHd4uOKO5JqDKCV
         YlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHbGWbwlhfajm4G4yD9Uw1TohdDKCf64AFrI1iaDYkPiCyZbsfxMvHqNuqjy3RshvuPblwo8NG4cbR8ggc@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVMQDUQXcHP+Pqni72OW6DKXTo8BzyiII6jwWumivvdqMt0f4
	FeyOGNV96wcqZR0qk6O3ARCXlK8OWm0jKZD5xTBThmxYhAuOnAGMy2TubBDgQB0SY9NU+mXewNE
	y+BXKt12FFtJ79hg4hYodRscO1x3XknS2ofo+bjwyWFY4W4qnYG59didYomh98kVfnYeK
X-Gm-Gg: ASbGncuV3HDdmcC1klqD2HpZEk5o+7FdoKmx9mXUMIdqWwta1oGydI1dIjRiNUtGtrz
	ujrBPSf7wLm3RnG4eIcCo81PM1KG0uF/HVoIQCeHIglPzgrMwgboOK91sHW1wu93lx550X56qpk
	BZ9nZVzCYmiGV9saH7xOFv/rlm0fgVdIxIOl3qdRzNWjU/rNEqUx2QiLSyvAQe5d9hD/vp+xjN3
	FiZpb7V8dzpr16bcm39NZyeVqIMHTcxXyAgDR/kLQrWTdDjK4RyupF05gSCoDOKmGr+KkUcLOBr
	FxZMhJ0jOpL0Yx7vMl/Y+sFkq28cKfQuQUaqZov53K1YS+s8FgDdcvrJ1GhvIc/IpxPOtGFp54R
	c5rqnf5FXo0N9K1VEYkg2wTSQQ+GWqmc0x+eLKKQE3acHaI1fJWgiRdBt
X-Received: by 2002:a05:6a00:1741:b0:781:239d:f2da with SMTP id d2e1a72fcca58-793881ed30emr38449566b3a.31.1760593776130;
        Wed, 15 Oct 2025 22:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOEd8rbHYWJ4eDFljVCyqfTRjJpdU/axG94GWTg9wQOR3qSxhEvQY8QQFNQQjxay2ed5LGew==
X-Received: by 2002:a05:6a00:1741:b0:781:239d:f2da with SMTP id d2e1a72fcca58-793881ed30emr38449528b3a.31.1760593775634;
        Wed, 15 Oct 2025 22:49:35 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm20657931b3a.59.2025.10.15.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:49:35 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH v5 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Wed, 15 Oct 2025 22:49:29 -0700
Message-Id: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmH8GgC/3XM0QrCIBTG8VcZXmfoUTfrqveILpweS2iz5hrF2
 LvngsGIuhE+Ob//SBJ2ARPZFyPpcAgpxDYPtSmIvZj2jDS4vAkwUExzRUPfRktlyaASjteaWZJ
 vbx368Px0jqe8LyH1sXt9sgOff78LA6eMlmA1Sl8ZJ+AQU9reH+ZqY9Ns80Pm0ABrvFswZAyOY
 VmjlAj+DxYrDHrBImPPa6UcmspA9QfLFRZ8wXLGzNcMvQYw6geepukNutT3HVgBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760593774; l=2209;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tBet7xd9Ix+7i7/6lFaf25DY48b+0wTDWRETSg/THcQ=;
 b=RnRTpb6h4DuPTqsO4yzM0bLovGuaYSg4CV2VXLkDeCrzyef6OtHsSZnX/b+LiQSpbecFSzirM
 zZUkt9VJfKVBAN6+piSxOV0Aw0ILK4ICDei1gMGApxtmXJVIvXynMfA
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f08771 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G-CQVniXWX8y_UMPSkYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX0yoJhNbcdy9h
 KUbbzbemlNDZ70KWeEfABbYAjZVhxhKXzk35sBOX0BvR7GUR4Vv6KszlApkR6oF9q/CYdsrc5QK
 vXnIM3V7swgzlimqAIsU+lK2Wap3zYUMVwVEyfN2bmXWSeVa0NrYkA4U6iqLAfex3XO+z2gmbH2
 ZG+CZYPrGMf89y2v3kQV2cpw8iUBQaQbsjwkJO82y5NZ+BW+bTx8s/jWluvUVHEgh3yXxLhUCSC
 HYNEyavLmnGD9R23osUQ0dxxvCo9LILkfwEBXq6NChA+CDz7qNFUsO65jt1og8V85iGbK6/lzua
 mRPKslZ13sxi0ptIFaFHx8bWNLl1hrZGBjv8N4wKhpne5BSReAfPwgMrVkrzsvYPg/BQ89piVtO
 nGlnABLgsbILxvZy//b12ip6BEMAAA==
X-Proofpoint-ORIG-GUID: 6v9cI-8XstuJmasj8cEUvsdbn2qDCKqV
X-Proofpoint-GUID: 6v9cI-8XstuJmasj8cEUvsdbn2qDCKqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Changes in v5:
- Add the missing review-by tag for patch 3.
- Link to v4: https://lore.kernel.org/r/20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com

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


