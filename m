Return-Path: <linux-arm-msm+bounces-66932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1647EB1434D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76A82163AD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06681C8631;
	Mon, 28 Jul 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOV+dHYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7221ABDC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734861; cv=none; b=WHu6N/FeRJMttGhjkSi2H1mBssrP6z8kCq1w4IEc8MrhRvAGAUx3o46dry+S+LDXQxyOt82oQnQbkfDeBrhlAxpWbH59eMQJpYNKLPFfLt0TC+qLXL0enzvJ8CvSROyhG6CoqMkYxmnx0eCNOW9HHl6KNp5O2OyU+5LZ9fa65l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734861; c=relaxed/simple;
	bh=cKdFC1SVSPgpyZumkMcdQr9+XbDPl6Xq75PSfnUrhdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QL2BnCTDYC/A1skQyMagDGvr9O3VRfki3IMZ18EBzmcxXt1DjgMkJAfmaNbKhig/yU84LX+tP1F9c4LxofoW269UpJbjILPS14IX+NbMswreXNrpmPRVVxdKDzNAMgUI2fenH/cVeu2VXw6u1WYbHQJhINNpJSALQQGOY3SrLc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOV+dHYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlNsE023507
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Vx9YOMF9/vaXXfGAitKrXqT/YmN37duAwQA
	vLpyxaqo=; b=SOV+dHYK+WJTfpTVBLvWtAMYbSlZzjo1WkmIzRaTjaOOviYOA0A
	JvCLdsPn/jE/Nncto1gn36Pyynu6vdxV4ForI/qlFJmJEBquwn3RKP3qSU5JwLBK
	arKBt2Hcp1qmIKlrBjlnIzYmqQEM7S71EdGONwPlvqFTy2vIHJzS2iExCf6Cwsuy
	YAuqT4JtQic/ytbL2etrz2qokMFPAhR8HBtaTg950tIshxXTwuCEF5Z1cZx+vbFM
	6RYC0rQNVKPUbOKSDw1vteVC+4IF01RcxlWMcNPyXNWiTHcDx+AmWA4AG9hvvWn+
	KGCxEfVezrIa55qdmphmQUCPa6BTNXRMDFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748f13ef248so4681896b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734858; x=1754339658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vx9YOMF9/vaXXfGAitKrXqT/YmN37duAwQAvLpyxaqo=;
        b=c7MJ+EMWdw/Mg4Bo6mqgzO91/gG/BlvTke0Ckrb1j4yPEEGrGGtsxAsvYQYGaUH/Gi
         taaI05etfHibxBDpm7Ect8K0wpLtdR6/Yzdq2GaZG4ONcvjVSR8PPApKeI8/lLZrppag
         +Ei1UUqRtwjDUhQ1o69ELA2sPk6/Fts6wdMEZdCVRmghE+KLI7vA+yn6+Bw2XEpULV4G
         3M6u9MBns5G4WIQ32BYZaoEp2wqYovAr9OYimqn8WM9slkTUR+fylwWnSB3Omx1ldn/K
         jV/SnFDNdboSzJ7qGjhWaJGCQKj8xrm+PrGn5CxIFFeSG2Kv4GEeDfnw1OPD0QcgjtX3
         tonA==
X-Gm-Message-State: AOJu0YzU+WuDYIaK6KYDz+nqvPggAEyVauqkVjzyDVd0/t3TA6ysE7hs
	muQIpYJOBvM0Wc09ieeJ4kZnr63tC0fA+M/hOT1WSk2FbBp5EBKwMHWJCvclO3BYUYoUl+XN3i2
	kTf/r6zy5M2V7WgjVTagWq2SEIDc3rmKQSZg8NPemciOBkyT2SW6g3tE1y3tVJBhIyPKDGkE3Z9
	71
X-Gm-Gg: ASbGncuyDSjVnht5EOX2dpzraDAgG5adFnfXqOQLwzGYYv02NNQlf7YQncZKRP1mmUq
	nIft7Lb/w2Hv2fooaD0umGh79je7nE+ea+Wgw6LOMH77vbWTeUUNeFmmJcE9/0VV/w9gucIZKdR
	ZdS1/5ILEI5F8iuj2A6rjBomvgHYx75e+xkC4SzvM5Tyt6e8dCzIpXPrxEVmgnK7e4kxybo0/Om
	1uNov+b/1NZG+AEUp9YOTu/dhkYm8uUbJFXd5ZlgY/bgCckzk9LAEavLtzGsMfii5zINbN1Nu7N
	gyn4ecIRWUrT+PqzWbh3yKOf7pXICRJTjxE+WrxH0CEoWBQSCcc=
X-Received: by 2002:a05:6a20:3d82:b0:238:3f54:78ef with SMTP id adf61e73a8af0-23d7020a87cmr21229910637.45.1753734858340;
        Mon, 28 Jul 2025 13:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NfubVkX7OmnivNJmSnmau6UKEHaNttBxrPWDyk7ZRlG/54KN/lEb53AfFRyD8rGryWhf+Q==
X-Received: by 2002:a05:6a20:3d82:b0:238:3f54:78ef with SMTP id adf61e73a8af0-23d7020a87cmr21229878637.45.1753734857904;
        Mon, 28 Jul 2025 13:34:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6ae43bsm5545654a12.49.2025.07.28.13.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/7] drm/msm: Various snapshot fixes
Date: Mon, 28 Jul 2025 13:34:00 -0700
Message-ID: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX6/5lw36IEPA0
 FyFeqnB9SNl9+oA3naY2xC3AH6+W0/ez5o8YGWcOKHJyajJNj7/kJsZ2U4gnz4Dgun+sfzDCZP3
 WloUPhFz3bxoxASuEyv/BB4vOtN2SS9ckATbHXr4zfhbDnu5/3+7VK9Og+Yxd4K4vwMTWBMaGBi
 PkqS2D7mcafIsmjAkpPV/qr8s7GOM6MHniORaNPD0x+4YTwKrxJNjCnjF+9EbyZNxfPqPPZvKZl
 l5vKmTt3vciZyz1LlGtRHt1VyBMCBqSFK3gHhtTZxBF1/B3RJdBL387upgUCj9y14+nFAMAlTIx
 CW3WXS9k7JsNDs5QqJP8wIf4O4AoI1DARHyuE50QLmZ3AhmfzzmTf/aK0Cp+S9d22uDQAZt6TR2
 z1CfrP7uuy9xKhPoygHbDUJ4x0+pKT3dsVpCA6QXXR8/RqE3Rl4j84Gkv2P2iBY9LrILsDsG
X-Proofpoint-ORIG-GUID: ykoW1VvXulDGYn11sVnql32IaqyMHBZE
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887decb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ykoW1VvXulDGYn11sVnql32IaqyMHBZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151

Various fixes I've found so far while ingesting upstream devcore dumps
into internal tools.

Rob Clark (7):
  drm/msm: Add missing "location"s to devcoredump
  drm/msm: Fix section names and sizes
  drm/msm: Fix order of selector programming in cluster snapshot
  drm/msm: Constify snapshot tables
  drm/msm: Fix a7xx debugbus read
  drm/msm: Fix debugbus snapshot
  drm/msm: Fix a7xx TPL1 cluster snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 26 +++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 +++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 ++++++++---------
 5 files changed, 73 insertions(+), 54 deletions(-)

-- 
2.50.1


