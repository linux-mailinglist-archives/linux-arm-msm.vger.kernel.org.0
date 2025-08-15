Return-Path: <linux-arm-msm+bounces-69360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C995B28077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 15:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91B3E1BC86BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 13:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4932FE565;
	Fri, 15 Aug 2025 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SL9kp3a5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F53226CE2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755263911; cv=none; b=pvctD67ikJNOoR2SVid6p/d8dYk8wF/73KcsltrDgXh7F9yqpt5Zd68dTzf/R/c8kwvuHaegntQjOWPHuS/hdkkncj88FsjttQw3l6Tp2is6p+dxdI7T8ZzPhUOOkoXU7kk3el4bLwO8z/nbUIWhyGMALBcf4lZRcevm1TTKtdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755263911; c=relaxed/simple;
	bh=tZvCUIV6qFGLGvVtuK5LH9xKC+z1XirS0OHevyW3A0I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rGYDJ4cAKP2SHpgz2z76R8YKGq62+v65X5OirE/FmzsG5aWgEG+IU1qKN1TmveEWqXPPF5G3PCbA5xngOx2BU405LduHjxrpnnaEdzc5Gx+16mhQk7Ao26OpFgDPS2HDG4zP/MzBsUbtEyOGCzKdfUPVNPU0TEY56Bt/0M0R0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SL9kp3a5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9lo2v026517
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eNMVupg197IOFiA3FKpm30
	vSm1X1n06imKSWoKuQpJU=; b=SL9kp3a51fm7wWCTEQthkKp2/aXb26FG/BZe2F
	HdxN/+pP0tdBoaybs7VsHgRkw3gBHQ+XhBvfusKIOLZ2Wdoa5w1p6qm3c0NPsz20
	fxySd2+9Bip5XSrWDuRBQVcorIuyU8VO7bC0OhVTSnxlACsEMAlsPbmPTRM7cekx
	1JEvZ/EbFKuTFIRwg9WL5poDajADRS7tNJfaYEvo8WOOp18aGssGYUFXaKl81mBh
	qwMDbENqEBjAgO8EDCnH1qoX/6HdrJ/LRUrAoQK/PbTvhmgfPazPesc5ezKpCyM3
	q5UujaSq9i5rTkSFu08bdCwlVBD3UWYIfk8M17in/OR31saw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6y110-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 13:18:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so2927268a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 06:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263908; x=1755868708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNMVupg197IOFiA3FKpm30vSm1X1n06imKSWoKuQpJU=;
        b=r8CVuy8kao4kLg2jC8mpWQBZnrJZ9gEsocNbnDp2wQkSS5OThxRZ8HxmbrHnS1dVsM
         k1HN+7wUdlxvXj4uzjEElE9HcQk7X/Jy4cbn2/CtUMf5kgYK6KcXqpJrPIhdOeliCFcl
         JXh6zu3gkm2RBwD+V6izj/5eaVuv2mRaL0b5AOJog1IQAk0nXmC3rgVaN3Q8ke79oejN
         PjfSzXxa+A8igtmMPSJsXMZyET00rFvdGOvsyfGseVhdYLOVewb3pXPTSHX3nlxXimwv
         NovxX9gkdweiTBbhdk7kymVx2FlZxU6lwo+YRLKKP0N7J/ZMjUmGvoIHv+jAUcuLkZM2
         vByA==
X-Forwarded-Encrypted: i=1; AJvYcCVMFvmgDaCSS+rdTO9uvHMMtx0JfoFJszwIdxPtvSCDaKgatzmh5S4XoqoiAGBtgrEaajX9NvM8eRxcjRD5@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQbAznuMP8PVqMv6+hKxnj+fgg+z5AZe8F/TLg0NoBvhptiPQ
	K3vaystiaIsOQu7EG4Qe5EnDBar37kYP9oCK7DFlCN1i/bhYsX06hpu67EBJFk64qIy5JbqcMds
	h7PBgVwXQb6pDPHFLI2TZlXQP2Af2M9PwKT4Y1oZ4GDQoI9Zym8PNLQtK9TEhsYHoxKkF0Ps7IN
	XjZTA=
X-Gm-Gg: ASbGncsyZvmBP2EqNNVYoT5LHfIJkccvCydsiJscpnkmAdWp0KovolxbGS9Ld8qB1Xl
	yT2GBgrR2N7N6fo//qRzsDxZ2upZP/a8LTiL94fm1kmkyGGX0I8KTxP3BsHiEnlqngg1PXTzMYT
	ugLXYBDQHom/DJUC7oJSzMu7OeBT1VluNjXzwGt7BSvtH4jIxRSjGZ3CObkc4uFDXe6ErCf2Mrz
	VZUYynYQQCwpx9A4fGxjMYIoYCI/ROeHOugYUb7Lthwl/95RRElyPOwEEbAf5sENRlTdjybA8Un
	4uH2dGnUHrUFzwpnnL2g6HLOdz8tFm1Vx3nKSvq0NGdsT+B2FNjBeapO2HaZ3g6tvv0vVJybtHc
	e0XuSbDefJQ1Q+U6g96rHLQ==
X-Received: by 2002:a05:6a20:1109:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-240d2db2d15mr2527925637.20.1755263908412;
        Fri, 15 Aug 2025 06:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqLEwY3YCUoJbxvU9hUE86eQRwJCftdQkbRQCmCifI7oOfV2iGog3bybplfqEg7vBotQR8Q==
X-Received: by 2002:a05:6a20:1109:b0:1f5:72eb:8b62 with SMTP id adf61e73a8af0-240d2db2d15mr2527895637.20.1755263908005;
        Fri, 15 Aug 2025 06:18:28 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:27 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Subject: [PATCH 0/3] coresight-tnoc: Add support for Interconnect TNOC
Date: Fri, 15 Aug 2025 06:18:11 -0700
Message-Id: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMzn2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NT3cySvPxkXRMzAyNz4xTDJAuDZCWg2oKi1LTMCrA50bG1tQD4+X3
 aVwAAAA==
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=976;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tZvCUIV6qFGLGvVtuK5LH9xKC+z1XirS0OHevyW3A0I=;
 b=/y7yCqYrQE6UiowbeO+3Y1+8kdR4PxSbc5lm7I+OXET3NFKx6udfiCilwy3Xjff35ud/O/7Zu
 0677fDQMCsXATGlVNEG6PABModwamaG4PE2RYi5Fya+6LMEzXMH3Oct
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX89F5yZiOU1EM
 7TA8quro8aexuEElKpMLanKVo7s8E/jrOt9/9an4Vu/vq/6KamRFnHFGmqnujFs+Y0Vtl3bkuoM
 iiYIHe5mxj97EwF+BioTScQy/WdKRBg1YbQc01IXjQkZHW7/uwg83FGddD7uZyMNGKKYGuI4Mdb
 Ri+emIx3TQ4Sc+55hCgEWHP3D9IQMNelste1fQ5qWSRc2p5HKksVTu4LsviC79TzxfNqqwSxwL9
 lRBO3AAFvLBjCODhziAEBXzpnuAipCElAhXOs/iq/UzZgBZ4XOTMXOviOX8CgdJuIslUMKYwfsa
 V6fKQpKvAqfPQLgNWcj8ZUyiDjx0gRPvXkJ/RqXCxfHshjekxi3EeOI4/eSZzA2OFL8YmrUlkYv
 O5sn66f0
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689f33a5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=f40Fa9qqsm2vFiWgvDIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 7yUbhmhZWUPnHtZ999sMEarkWdHxrLpQ
X-Proofpoint-ORIG-GUID: 7yUbhmhZWUPnHtZ999sMEarkWdHxrLpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
(Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
this block does not support aggregation or ATID assignment.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../bindings/arm/qcom,coresight-itnoc.yaml         | 108 +++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 179 +++++++++++++++------
 2 files changed, 240 insertions(+), 47 deletions(-)
---
base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
change-id: 20250815-itnoc-460273d1b80c

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


