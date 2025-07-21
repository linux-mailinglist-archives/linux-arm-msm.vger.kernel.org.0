Return-Path: <linux-arm-msm+bounces-65906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F23B0C655
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9EDE163D16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545FA1C5D6A;
	Mon, 21 Jul 2025 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+WMDxcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271B1ADC90
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108262; cv=none; b=ieR6TF7OLHP8/jG0DaQiCvtwQGu7SzT+iMwShMI7CAqJWafkQWPF68BrXvPZD5w2CTgct0I3a9CmIxD23LXSiO3X/w06hlbznAsb0MAMiUaCDW88r46XKgig+VSGA+/Nr8wp1LNSpRwdg9yQw6t4fFsQLETVeAvt3nXaq+y/5zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108262; c=relaxed/simple;
	bh=fZh+W/ZwxHCAw9UO9J/kStJAdZaEn8DxlAbvEqkaCIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l3cq8xwx8s4t2yab4JsgJzUzgTUS9w3eW6ccp40WLnYAcbWUWVttPNqfEADGFtGVvEEKrglnmoHlKOHT8Zb5gcEu+O/HPTQQQ8/q8YAh4j/rTmSuQjzQmhv5JE2w9e1nuw52950lDtRPDz9tE0N0TotQYBc5lA1kEmvqkyr8H+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+WMDxcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LA4ho0015762
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fB17acm6tcauz9EWmhrWe24ExKFYj74gkCn
	0R6MI3YU=; b=L+WMDxcwc2/AOpU7X4q3PWQ6UfG2odLvmQgoQ5CBCefVM23hI2G
	nUg2FjsGEI4iE3ygzXqho+/6BRVqxyNjslqWbmHsggHzq5OA4ORsbXavHwfvLOXI
	yeiRURCZ7iJ7hcpVTLDqnhgAuSkFLq6Yh/yI2uZ989aru0v8XZG5zdkVkFP3bYn/
	n3C4hF0lNRKfbNdDDJRP3D3ZrhNx3z3UjiUVb7XHuEtiKyeYWA+0CkG4I01FPEJu
	TQzWEeJBP67MCQrbETx6qPr6ROieyfPqPzZ98wkJObN3Iyf8AfcM0cT+Xj2Tbinn
	is8TEITIYfGjLhu4tj+QBLYftbaKy1+Ik8Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451dh7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 14:30:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f13ef248so4082916b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 07:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753108258; x=1753713058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB17acm6tcauz9EWmhrWe24ExKFYj74gkCn0R6MI3YU=;
        b=CrbwgUrD4iiRt3eH/x6Vl3WB5KLw9Dc9Dt41Cd+CO6MdUvdpzTEt5j88KMC2fALWx1
         WWsf304q+TThIUSR11Oqbo8JbNKjoC3zGzQhbDKpcklvOwq1CcfpfFheZc4uns2tpqZh
         6JxwZFVC3Hs5XtTme80ih9Zq9ZTMuC+0d4kYRq0xHbNzXgLy5wOEmVuFkKVCWPIXQBo8
         Z6lERUEjnT1l7fQSVAz9zGHx4EHqPeei1QmqpnmO6cG98Q/vbfsuwzAFVko9eTDLzx0a
         q4qlDysZ1r44gNkcJ33HSu9ZUiDjyGcjJWYkrMSMAsSiG5yC9iFQuN3vGyixawfTHFV+
         ZIQA==
X-Gm-Message-State: AOJu0YwwwQzBr7EuAKHMdwTf2ZstIIh5lJg5wM0ZYXyDydYjKIgscp8v
	WlFhDeQj4tJW9C9ztWTyyN0rg6ZqExOI5V2gCe5+mZySvyzvnoQ8f4/DMVcUFdW61K6Dy7QE7cs
	XbTbLZh6oarIN9y9oW6Zy6FbN+qxEp1ID2YoLCJD/v89ems/9Vhsy+C8k7sAFVGUlsjyP
X-Gm-Gg: ASbGncsK5cMZVh+byKjYT5Da6psNp75ObwhFquj7PhqJQBTnaW0lETK5HoStOuNAid2
	nAeDLcl2dvBEt1GTR2KGsLOQMppsG+9wn+P4GEwfRRSwDT939YOZ5yPM4bHiRzqCwVzhuHOSE5J
	8zXW+pWLpmIMrV6IqMxrgDuuwZfgkaFTc4mh8RDhAHBzTwAnrV/t8mooCeaKxpw/N+6pkuB9tTf
	mGfGh7CmqRVQuSQD97JJKkEuSd9pRjFSVLR5TB+jNYJnH2fgZN+RU4j+8muh7+yA54K9eScFxfe
	0RndreVRvJYcxzCs+83dmWnuAmmoD6wGvPJVMO0YuJQHlk2PjOfM7UCMSD839l5YZr8glxacSCn
	K2+ieIeITo9afbBV8xtE03F5CFMEIpP6/mAiTX0oH5YViMNMVodPvmOAzinpB
X-Received: by 2002:a05:6a00:3392:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-75722869545mr25840339b3a.6.1753108257961;
        Mon, 21 Jul 2025 07:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG6I7/YN/GntNBhpwxtH5G52Yy/1kSXDgvLDtnnNoxskhMPb+YeGocnDXdtpvZVJoL8l6lgg==
X-Received: by 2002:a05:6a00:3392:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-75722869545mr25840277b3a.6.1753108257287;
        Mon, 21 Jul 2025 07:30:57 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb155e1asm5750110b3a.74.2025.07.21.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 07:30:56 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Mon, 21 Jul 2025 20:00:35 +0530
Message-Id: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e4f23 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=TVyXueylgh4vxAmsgxgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: N3Al95WxSHdaXyFSwzr2WYw9R6eEJhkN
X-Proofpoint-GUID: N3Al95WxSHdaXyFSwzr2WYw9R6eEJhkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyOSBTYWx0ZWRfX3M3OPjSYSmYc
 7yJ7mIxiTRxWzzBtrMG5yDtsGLd+W4SX2VaCUikRsSuzxa4gnD6GoQa7V4olf6gaYVSuTsCyPYx
 F/A3Rzzyy6Czq/6MQqpbePEh8NXioofH9PtADQt1d1jDrfCgXTFpGl67auDrqQc7L2eG8Vx27Qf
 ytSGduuvMRNPFRthRtikYaz+OuJ+p5fzmn8Ot6thEbKVBnbZhJOHZ01arCtz45R4GHUoTWeJ0oO
 dWAdSvdmSIauLtJnAR6eTapz1ZQUAyESy7TCR8Gw8RJA3lxyJ//MQC8wi1UhGSRkqt7PCQ+AihH
 q+eTosLKDhv7pQ3RFAHnoMGr3kEKNL9yCJ9IaVjM9SjE4HteMqU3DdXF3kf+cbAsX4xQH3P9wgY
 1wHoAJFOGPh1mXiL9k7SJOubLc5CXl8AcG9y5d3k0ECmjVQj8ipVy9ilydK/ebSs0fXc9/sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=887 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210129

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.

--
Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


