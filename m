Return-Path: <linux-arm-msm+bounces-55305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350AA9A800
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AAAB3B5C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A50F22171C;
	Thu, 24 Apr 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaiC47tf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1078221548
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487043; cv=none; b=Sn6ygSy++Nit6iOM/4JA7W45Ek04soZH5wYQMR2iesJo9uHKmTeesBSJAWOEJ80UPEyhHgjby1nCdcuQG/tFMckaHG6tKu7BElGqfsO8IQpint8u6I6AyhHyykZ4Q9rAFayiBIsp8wG0pSMJdBPP2aLCR9d2KUdVVZGrXwF2fXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487043; c=relaxed/simple;
	bh=xqUX+XKrS4PHNua9Ynz8Kl1TzHsr7LrCKvNfMSAD18I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHDMPJ42ot6g79cDsshdLubJi67eKjhgEfd2671Hwy4ribHtcuV4LHKSzKPk4jpF+MK5dUvJ7a7LKXGo98rhzrWcPiw8x5wIRBI/rDV8ySDqBFI94X3MVIWMPCOwhGzYeAb5pw3ZdQEMZu0Z3c/IDttQFJthe7s7edLkYmXfpz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaiC47tf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9VQ031001
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EJN54KqFz4lGTcY8hYz0K1sswWCGJ8Jea8w74+g++o=; b=jaiC47tftLgUQbln
	EfuuBU7+ViCwfc0WayK9W78o0j/vu/rHwAEkf7o6wpYxjZw5mvv/XtjOXyodVSq0
	K8WU4lBGQVsfgZvQ+O9Db5M1T6P+sQJOdbY7IMf3/TFRCYhC79AApI4vdCHs/O+k
	O7zhafugLhWATNizskJvdTOn5TL64B91L0ZQFQxqAKYxrY6BdCfTngeal0gLizjj
	s4y/xsaxCzUswznsucCSLTEvpgjKfvA28fWGJoYeLJkgO2gcTAr9zICHLbQBNAE2
	XG/T5s1bplPqy2lzVHfTOvRmyTIqT8rDQGx4GKGsz67O+tV2pCwOzbmAZquoC8sy
	R6S+cw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cyw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so134621685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487030; x=1746091830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EJN54KqFz4lGTcY8hYz0K1sswWCGJ8Jea8w74+g++o=;
        b=c46wTQpIUFhDm+FYoP2B8wMInADNG6t/haHSNVlbS2QNFEvEyj06g6fMqLXwKAE517
         19PV9/jzi/weziRnecyUHxKU9dBP/azKxdCWDbhAbwnNq6veD5E2l8EnA/KWhgfmeeH5
         aK9Ju5httq9S1U2IDVJ0rkPvOAp0XHHhH0RNjkSBuOQjxDgtMA4DDQcd8XNyagdbZi2P
         Wn1xn9ZB/Ie/qD4vjpnE2czxBJ+ePRR996zZncPcglu3nvXcyYbLki7lJUsnV88VKRpX
         cZf1TIMLlSze3pgaQEQGbB5x6yXERM7TftmbMZ+voy7FwPM29x5+TPCbcyMxb8qL5Urb
         FA5g==
X-Gm-Message-State: AOJu0YyheE6QhqW66clSQue8NTkKCWN8uKsHvlTQrQmrGBQMebQ3hIm0
	+u1rHU5c8+NOfNLKJfa7f2BcfplMSFeRp2xv53UJct5ZpcUHmFUt9Mk9Oi0WrwQonfJaJWrVurB
	lQ7arR8oTBLT3D87orXrOe01qrep3hSk1iC88Zola33Y9Ni9QE5GbcFAky4sLbckF
X-Gm-Gg: ASbGncvaHiuOX6nTX1W5RU8xup9Z/Hzu0o9eH5Z+OHnzKvRf3wNIZYuIDuKpiHTdx6j
	FPGbzJJgsRPS52NczPWUhVUHXM/7qEqKbVgdrZQA7xk1pC/jtUcQ5VPFZvzqnBlIPNbALLlmRgm
	UyfVvj7X2NMvAkBJl7VwMLOPI5TKznFG6JL1Fj7H9uVP6FYjCeMLNj2WjANGNNe33cyVW/RnDQ8
	m3RvkT6mxm5gvb1XBpE/RitC36xorhUZ2ZslZUzGD/w9w1/6wLWYGnLW5C3A/cp17ge6Rc1YVeS
	T3t6ahj5+KuSAHYOulrGgAtECW4ZB/ad++m4kDFr1xSJShEgt7kDb9SYY8JYGIsqJUvc2tSNWkV
	7ON4xVTUOmvDKVZJ/RvjLQ89i
X-Received: by 2002:a05:620a:191b:b0:7c5:46e4:47f5 with SMTP id af79cd13be357-7c956eb83cdmr271710685a.20.1745487029529;
        Thu, 24 Apr 2025 02:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKYI2WPZxdFfTsgzmkV4jJmvjU/+PPEzpJ6DXYIsepupE8DKxEZbJ9kT9O3tjWxyadf20tkg==
X-Received: by 2002:a05:620a:191b:b0:7c5:46e4:47f5 with SMTP id af79cd13be357-7c956eb83cdmr271707485a.20.1745487029075;
        Thu, 24 Apr 2025 02:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:06 +0300
Subject: [PATCH v3 02/33] drm/msm/dpu: drop INTF_SC7280_MASK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-2-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19101;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xlGqFQKejkBi19WJTCfzWwC/AtKB39a4TtFtZ23pzus=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwYXy6pCGYPSDx57P69V2uafbsrQt0Rqhmge/zSpVqsyE
 /XoyFedjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIaREHQ2NS0YEf+U+n3+Lt
 9FmnoW82Raj11O3gp7phGauzWDhbGTpP9cx8/sZsRXI2E5/j0SLpk2/KliWGJ3gJRvKaHdpv4TV
 hfeGvoID61p0mT+aH8Vbr3fy6zWJB8uKAvvspz9eemCf3adrqvA2PrLMi/QXNv38Or1khKPz+4Z
 wIvjUXJ1hfvPZp+/EpF3x0jty82JJ1L4HFuf8WV1Qwe43P6kzjX09nXrvwMmwSm0Pjfjel2tTcC
 sFdtj9kXtxbdbNdJ2XnCzVBkwmtHH2rlmxum+m3NrDl+LQXyv9d3LdPkdGVdvpqWPHG/ntaQ4Po
 Htumye+3sn5h6H4sUdPc4NukzHdMd/9ZcROWvq51Dk/LAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8k1Stm39o1Ci gKKxUkhefOWR8H6dPSwKSK/f68N1k1GoTIZLXJXe9ib1MvqsrGj+70q9ECIwLfFMdktT93L/2Zs ut5EdSk6SapnDifJ9gwGcEkZmHGElAttgvJR0iWTc6465hhAzqFQLtHqltZ7/EydMQnaFTYd/yt
 tVXM4Gg5HezktJVon1OJw6N732muG2xLKX2H5U1EvmW1fIVbn3fj2vuIVF09kavcxNExTz+ZdZE lGEiVLZSV/UnwT04bD393ee3DrAtOKZSkuQNjyM4QtZ2/yMXZmAk2OyfZ/AJVr/FRhr5VOMqRAF ufXElE3pf4KXT2oXmep0JCb3ydNIbBOIME6yIlJzDgf1CUfP+1mGRBbu1jEQHjWJA2J/v8NYJJi
 t6xaTdRt8vBdVKePxT2yJCSZvPBw+TQG80/3KZcMC7qt6t+cMo1lSP8IspgWrOFMa89u0i2t
X-Proofpoint-GUID: bdKH2gfsBSqzG54ndBe1jDO696OcOkqf
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04c0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=VRwz4S5yodoF-XQobIwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bdKH2gfsBSqzG54ndBe1jDO696OcOkqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The INTF_SC7280_MASK is equal to the INTF_SC7180_MASK. Stop defining a
separate symbol and use the INTF_SC7180_MASK instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 --
 9 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 6ac97c378056c08c937ed992b81d139cbb1fbbb0..a8b5c5b5a2e8d9d67ee185f00d92feeec42e490f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -384,7 +384,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -394,7 +394,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -404,7 +404,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 0c860e804cab8ece8966596f4ec2b17ff3aa226f..93427f7cac3a370fdac3f119134bf9fee8b87a17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +328,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +338,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -348,7 +348,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e9625c48c5677ef221b8fc80e7f9df8957b847e2..1edec0644b078ac1fff129354d4d02eec015a331 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -183,7 +183,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -192,7 +192,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -202,7 +202,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..7d698fc354666a2dc468a71ff08cb8df0c37234c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -315,7 +315,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -324,7 +324,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -334,7 +334,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -344,7 +344,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -353,7 +353,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -362,7 +362,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -371,7 +371,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -380,7 +380,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -389,7 +389,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 19b2ee8bbd5fd3ab6096ea1c9dc2e0f804bec973..ce050c898b9f21e69e5ff967c2af7c2df1e08232 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -344,7 +344,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -354,7 +354,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -364,7 +364,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4d96ce71746f2595427649d0fdb73dae0c18be60..4291b4f9ce324eb517022eabe3ab6078b1c3a2fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -345,7 +345,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -354,7 +354,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -364,7 +364,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -374,7 +374,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -383,7 +383,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -392,7 +392,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -401,7 +401,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -410,7 +410,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6ba8e3d3d2691534f0981f222fa27..a6ab5c49654010194bfc1d4991ffec411ef6e6fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -330,7 +330,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -339,7 +339,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +349,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 6417baa84f826feb3bc6eaa6b063ad75e597a9d7..ad486b03c54d9beb6d77df4d6b5f142fd1dd8d8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -331,7 +331,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -340,7 +340,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -350,7 +350,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -360,7 +360,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -369,7 +369,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -378,7 +378,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -387,7 +387,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -396,7 +396,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -405,7 +405,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a04d8c5a1d9582d7124c7eb897099..671e1ba35d28a20ca3a483bfc6412a8e53c25709 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -126,8 +126,6 @@
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
-#define INTF_SC7280_MASK (INTF_SC7180_MASK)
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \

-- 
2.39.5


