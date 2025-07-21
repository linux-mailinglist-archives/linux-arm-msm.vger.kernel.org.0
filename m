Return-Path: <linux-arm-msm+bounces-65969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D04B0CD27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 00:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654F31894DC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 22:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440C12367A0;
	Mon, 21 Jul 2025 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBUwIuEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6821421A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753135706; cv=none; b=glEg/R6Zq72KzOC1A9RR/A4rE+F7VCnuUyLQs2A9GcoHNPkcPBrMvpowH9S4CG7jqparTj1y2HYQM83Tk8Lv96LU17dppi6yS9LItNQf098N2uq6IqxCG9PBP254drrnl+XoqjStN/2MM5nXtuyLkrxv1YY3kOcExUTmmjckJHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753135706; c=relaxed/simple;
	bh=4VOWW9VN8J6wxjFlq4RVYF8MJRfKdTUR8LIFlktDIsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4Uj7U8n7Cjurl/upeR2BugHeUDP1jMrNVDmxERFBSUT4SSqNEkiqqghw8AydZcEPpy9iRdgwzyZBRKcYyvsaWnfWFsYdP0eR+iqlNmNLGKZDQbcS0Myig36KnJFAxfFrdBANaoaNOa/NH5POznzk/f90DQ7aUJTSXDGq5nxFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBUwIuEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGpB7f000902
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 22:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iQD4iU1b13+mJXTJjK7EXVdX561Lk/IT8he
	qfle1jcQ=; b=fBUwIuEZ4oUWL67Bn1xXjrYnCc1LCatqCPLeo9eFHEDSgdMxgLJ
	gGU9z2t9oX9iIBCcSUapmMX7wOdrG56j4Qfxj52QTrwuRm8PSAzHnUiSrSAgoRuc
	lRd0t4qNVYLlIF7nGZcdZHd1f0L1XH4Bj1LhyMeJsnLNWyR35In+etn/z1aBHTQP
	cdLhJYnn34CLgLOeHNoBI8rh0Xz+xl8QbV5vlO44fuxwJMwTk9v7m77FohV9megl
	YFolpF5IybmquHvhSZwKBzer/qOQsALat+OY+Xg6xXKm7UXXvKLYOnGKkviiU1cI
	ESTXPLYEElR2tfyr7kca3jXl0vL/SAzqh8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044df7a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 22:08:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c36951518so5395195a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 15:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753135701; x=1753740501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQD4iU1b13+mJXTJjK7EXVdX561Lk/IT8heqfle1jcQ=;
        b=vI/5k7gsrl2mfecSmDuPr0CGlusuzb2Wi54GbAmuLSB1Hme4VSREqNMU9RMgGAqbm8
         FQsBzY45PqRDt8LYpK+zIqBEOB8laxdCHWYWyXxbndVbMBp2OBtPgXan3IFuOK+KR673
         Dj6Gvngw0/byn3dPHJh2MPF6wCguoATGO81OwUU62Cd+Wgn+LB4ROk3jfUgO2ICXOiXw
         gNgaCtzMQRW4Wpvf01yveyETDM2aFqOUYU1YmWCwuckOrVKDz+HDoa12WVuM1bIvCPlq
         jzjUVQz64adaNntmcBQ5bjxhSBApbV6KG9Fi7gzzRLfrJa9GVhjO97CNUAvuLHvly9hh
         NHXQ==
X-Gm-Message-State: AOJu0YxrWRpzpSTi6O5K/Tgo67dSEkbU2bn8ZCOHgs+qZu7Zg+3M9F2m
	XjjzxGnct5rVN8NnquqTCOGp8GSLaKzGpxgIoKaimExF3LD/y88nu40SOdFSAqFYFOmtv8GgDGC
	5cWAQxG8KcTUAdJGYvpzbkJRD6Li3LroR+eDwh34m5Ld1zV7AQLeDbCvmz+ywUzdtGX4m1YKM86
	aJx0g=
X-Gm-Gg: ASbGncv5q3ZK0gGBFdhJKcv3VRlafJrT+o+JoHQ0cigamoV4b/L/rc9PaI6pqkRGelv
	gfMqUCR6mVqgOlRsj+o+x0bOvo24V4Zlkw98ptk4XlHjGyBPfhKCJy/rnzNWLHh3maY0OovYyUb
	h0Uvnlv/dysF4YuzBFrnKqhjATyVovh08/McybdxkaDA3qAPjZXyb8OcJ6XxECOHNQW68nAqjJI
	AZAP26EPf46SwV3hxZwKdBKTWoeTXLOhuC79WO9sp0v9dHQ5sn/wR7+VTBiZw9/K3hYlgovSHvH
	mL53uSLWEbyvqVKRv7A0p37xU9z4g5krMBwGDANvv2WFr/Tfk/LQ8TPGm7INcFMwuW3eitM4BhF
	NgkkwVXhFdn3lsxnmC6Ryww==
X-Received: by 2002:a17:902:f642:b0:234:a139:1217 with SMTP id d9443c01a7336-23e302a2b4cmr203854735ad.18.1753135701580;
        Mon, 21 Jul 2025 15:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcnHZWd8CeTH7ihD+mg7cdkPUSLou1oEhob5J/ysSBy9goh62ETv61j3YmyL1ASG5Acc3yiw==
X-Received: by 2002:a17:902:f642:b0:234:a139:1217 with SMTP id d9443c01a7336-23e302a2b4cmr203854555ad.18.1753135701195;
        Mon, 21 Jul 2025 15:08:21 -0700 (PDT)
Received: from carlv-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d9504sm62929755ad.179.2025.07.21.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 15:08:20 -0700 (PDT)
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Update email address for Carl Vanderlip
Date: Mon, 21 Jul 2025 15:08:10 -0700
Message-ID: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687eba56 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Gbw9aFdXAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=6hizN-QJURE5XGzEQWwA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 2aF2LcnxBjLDiumayThjuBMGMOBPOAd-
X-Proofpoint-ORIG-GUID: 2aF2LcnxBjLDiumayThjuBMGMOBPOAd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5OCBTYWx0ZWRfX93NLT9fGwKi5
 7G0MRQ9uBu1SdoWkCKtpxZVlTQrzUTh7iJOM0rmzC/xI05Mrv71gh/ptmjc3SPd4pZKwAVGdxsy
 SfIKgkpIAWWRJyCY0Rg4Bj1hqZzEn9VvC1ISEz4U0Y5jiRapUipFivIfrn20eTj5olNzTMbFhog
 qmEmRJzvmvIFYhfMvmKZZnWr/FVw59sdHRbVlsKNSyXBio3XnEyYZhHffuMsEzWkASD8hEXCElp
 KfDCGHPbeViE1NZQe36ad6ino5yuxQ2ismKQ4742Zk1I4svgVkeFdBj8beJHPxo64lXKVoJDUQN
 c3TroTa0tySrjmZ2YdqNXzO+w6Ldtb541Y5RbCUUwfIPfMCjhTKlWXeostr8gkbtC/Vqtl730P3
 T2iSvddLDhbne+UrhP3pT0MtMegNo1d//em1lKbNOWXX9YYuet0z0ZiYQ/eq1m8yzcdfo4lK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 mlxlogscore=611 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210198

Qualcomm is changing open source email address policy.
LKML and other busy mailing lists use the oss.qualcomm.com domain.

Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
---
 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index b77cd34cf852..d30f31ea01a5 100644
--- a/.mailmap
+++ b/.mailmap
@@ -163,6 +163,8 @@ Casey Connolly <casey.connolly@linaro.org> <caleb@connolly.tech>
 Casey Connolly <casey.connolly@linaro.org> <caleb@postmarketos.org>
 Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
 Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
+Carl Vanderlip <carl.vanderlip@oss.qualcomm.com> <carlv@codeaurora.org>
+Carl Vanderlip <carl.vanderlip@oss.qualcomm.com> <quic_carlv@quicinc.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
diff --git a/MAINTAINERS b/MAINTAINERS
index d97e091b1742..5bf68fc65114 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20400,7 +20400,7 @@ F:	include/dt-bindings/clock/qcom,*
 
 QUALCOMM CLOUD AI (QAIC) DRIVER
 M:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
-R:	Carl Vanderlip <quic_carlv@quicinc.com>
+R:	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.43.0


