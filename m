Return-Path: <linux-arm-msm+bounces-63452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195DAF624B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F9A1C44935
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A4C2F7D0F;
	Wed,  2 Jul 2025 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BM33QmVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE422F7CF5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483001; cv=none; b=hvsssomXW4yeh8ugUWigaYBy+gYbKJBQvCN8S0lCPPxA+sr982ZnilrStmetpmY7WjwFrFnmLSN7gR0M3TGVXelcNoLgBWqbkM4B7wiE6XmmrTFvmDsp58xXJ+/W1e99G0KDGuMw/L4GpBynoHT3bV48GdAVrFiy3dNLcJjrVNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483001; c=relaxed/simple;
	bh=fZrMyQeBezIe5JVG7YLDrSjCLB06wt+81RChdByDOOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4J6Ndojn5zlgBFdnlpBiu+fS4kA/uN4h00yjzdMfN310YQ4aq7FuoblQuWwrFIBA62XnMp8hTFiwylmnbPww5q2GMsKxvvKOsLzUhDMsPUMTGMjYmEDK0BHCTWXipcWr4RYwNuF8BHNerjGxrisg5D2h7J7gcvZuRkuBxv3cNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BM33QmVa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562D7BXv000415
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0/uiwiGylGbdHG4khEzUQ8hS96SResBuOFv
	us9BDibs=; b=BM33QmVaztOEgCmdiz7tuhibFOmZS31wRRdvbnJii1E6LSyjC4m
	daDrp5U12kDNg5ukPWwAaaPpUd72qXhFSPhf7Xn3lKZTrrDJGq9tTrUb0UuAvmT5
	6eBP3i9tGYmU+4Ceky+OE8PhemGaK/EF4Lw+SLXZUI1Hbun+489CjmP6plowQIko
	SzZpA529KcPgnod73DN7zYS7oG3eBxUOPT5tkUD88EWGBlultARIBfF5oPGmqY4g
	GOcsL0mrWZdfA/pn0hDfbUlBEaXPCTRczfWORLvmQUFzrU96qBj31BRZogCXM+7a
	CZskiarmK4vP3q+jgz1cfXxlk03okvesheA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmdnja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fdba7f818so5492869a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482998; x=1752087798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/uiwiGylGbdHG4khEzUQ8hS96SResBuOFvus9BDibs=;
        b=QZ+YcdiuOYiAOVzt6UrPA0ZZ7vVDpCuvxQRmxR+I7/X6arHgo770X1hBYOMNmGrUV9
         FurYWm5VMkNgLTT829/Gq3ewxeM78Un/X8PHKErU37S9H6Pyx3LtUnmfSk9JDMOvt90b
         1ZJcTGXcvN1g9fdOm5xpjfsA1tPrKZjAZdhVv7Q5miRK+dH3PNnsWV4kv2dCoOQFeGso
         v4WUualJBGxDblw6kOM8R/I1HWaySAffP3INkxTYODmhAHtWC9tIEDgTnrJKYUDN1flk
         Ci0EWrKLkG7AMz+H5WG/8X91J4WovXH0y3DX0oijj5GSi7zI4sY37mnkRRlPiN1OCGVf
         ReWw==
X-Gm-Message-State: AOJu0YyFVGFfUxcAj7G/mx0cdAITGjdcztJ5rEYru13Cyo8D+BLTjZsJ
	bggj6UeX8nLZRtGIuCCnj9MW2rTifVE4jyuiXsyOyyPg44W4g3+MKACPtHEd8ABtKkYOWsAtrOs
	yBCmNhMIL+H4k/xIM0RU9E/b5HdV4SR5yMwFw9K4o+FwRQgsFbbQxGuqR/xNhTne5c/Ce
X-Gm-Gg: ASbGncu+MnBmi29ujy/HG6Q/KeYptfOadTzvld8PoBlXJeceOHKIKXWLdY03BdcErX0
	+ZVteJMj9DxR6xqqewHK2EnKivGmNFKRpXDqVdxh0o6u8w54iahEHcOoBuhij+emSnRS8hpf8lD
	SNWnOCQNtZ9Y6u8g2zwGGHiWCKrSDr/g6T56b07q593Hl/tLUXk2Rn5rVBFBI1MkaMbLWTDl5wN
	rGLQyvX7Hg2UKRYu8kZ1ONpWCOBHIyVyQMqF7+Ku+GychevgqjIPubJQlspQ9yULT/YM94GpadH
	KseJP079GVCD8GmGBKnOJJJhwTSTMCsHEg==
X-Received: by 2002:a17:903:1a84:b0:234:be9b:539a with SMTP id d9443c01a7336-23c6e5b0f24mr55528075ad.40.1751482997931;
        Wed, 02 Jul 2025 12:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9tsuRLtrQ2uRtOQ0/LPPD9ZdhX4zl87JWXmSBvbvVQUC6Y83LHsDKAMTKR2oEPIpwyo9+tQ==
X-Received: by 2002:a17:903:1a84:b0:234:be9b:539a with SMTP id d9443c01a7336-23c6e5b0f24mr55527815ad.40.1751482997550;
        Wed, 02 Jul 2025 12:03:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3acc00sm131125835ad.142.2025.07.02.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:17 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 0/9] msm: recovery and mapping updates
Date: Wed,  2 Jul 2025 12:02:40 -0700
Message-ID: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68658277 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=BuRRKxK7vx0tYKGPvLAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: vF4eiGHma8EH3Zp4NnGuvH3GK2J7zIXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXxE4tcAE+Gkix
 L+uiqcmzjEJ0pLQsmHmPAHeKTuqs+SswgF0Bej2M1KW71u1oZmai3R4k33SfmFze/m1UFpkQxbL
 ET0M3yLhGHtqar8Hvx/kaDPAHaaFH2l3xKQwqVld/tU9l0CW/YEhnsopIc/+fdN4LwWlzGSpuGE
 VJGahFirsLk43t0luDD23rfDYpYGA28K2u4HdaluW7A4gki30cbdqYbINzyYLUh4T0bZHlnCCNF
 qshZos7DZCQXJzg7tpjjMM8WOjMRr0gTqE29nkYUf1qI1KiNpXravIIP842erSLBJEkQnX1GOxK
 7vaNw9XyEMtdRLKy/l0rcS0ehy7ZNs3Fe3m7exWaEYY/DCn9t9RcB/+iIFWaesmzoxTz3XnMFsd
 ED9Yy1hwdMTLorHYzV0ENSftL8ueJ6PFfW5Aj7i9YWBUN5OrbFLtVzfNDBgs9jrnBdsAWn8p
X-Proofpoint-GUID: vF4eiGHma8EH3Zp4NnGuvH3GK2J7zIXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156

Mostly updates to address flakes, and updates related to newer kernels.
Plus a few additional sub-tests.

Rob Clark (9):
  tests/msm/msm_mapping: Fix memory leak
  tests/msm/msm_recovery: Wait for devcore
  tests/msm/msm_recovery: add iova-fault-stress test
  tests/msm/msm_mapping: update for sparse
  tests/msm/msm_mapping: Handle BO names with spaces
  tests/msm/msm_mapping: Add additional subtests
  tests/msm/msm_mapping: Wait for devcore
  tests/msm/msm_mapping: Handle larger gmem file size
  tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm

 tests/msm/msm_mapping.c  | 93 +++++++++++++++++++++++++++++++++++-----
 tests/msm/msm_recovery.c | 38 +++++++++++-----
 2 files changed, 110 insertions(+), 21 deletions(-)

-- 
2.50.0


