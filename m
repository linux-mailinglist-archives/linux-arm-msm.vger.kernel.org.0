Return-Path: <linux-arm-msm+bounces-67026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94DB14FD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 236C77A045E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27288292B38;
	Tue, 29 Jul 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6wM7N4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F5291C23
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801072; cv=none; b=QgqxwQN1LUUR5R6VOdU8n/NqZMwPpispEkvwsUSvSpykkD2kRxFTtIPfgd4BgDbzdFicVXqDZXvhFtGcH2fVlwc5O7Asewk9ZjwKBENY2P2f0UzPGpc2GAR9BNq3sGHNkMzGbSbqjJYTSR4PWUYVOZn5IB9VWjBp0TPijYgNPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801072; c=relaxed/simple;
	bh=a1xn1H8/fa/A9qraVB8eAftc2nCQicSPOhezcVcH5EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMU3vWcRbwXNHZ6J++vGTi0ZsCws436RH9zCm+EAAXfuQTHzQrhxeXkSq/O84oaPSyJfOBclGvllGOS2xie/tsiDNfsoGDh0Ix3KlNC9B2nRoqZc9hhxezQ3IKEy4c16jqng8v71DoklnBkhMW3IwhTrpCtaQO8+iO+LUv/NJnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6wM7N4l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T92ePV012781
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V9+fcbz7W94
	r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=; b=g6wM7N4lQvCzapGTjsB24ecQdnP
	AZKmCtkvjBv21XGHYm8aWaC+7I76LlAa2KB9QE8lCJvj8qwgnFfprxqu86+uw/WG
	FmQiSjoc5ug0xhf88AG5LhRtKEmAgulTy/1cn4tRNff1OvmFxN+gznutqPG9sGHF
	x+vlR73Y1jpcIKBdTvVH6RMXS8EiSvu/Za1cARBm9L4u0XO3xM/+o1pOobtct5Vq
	grnn4JEVp+dspPJ/18t9WcQHWDfc8zkB1b2Ye6/cAXTD4nVo9PIFr+ULuZH3agAO
	TNLen4WvhzPmqFop6LZq102scGiPpbq3m1ltK/r2T6FAZ4QfyXNp5FbySTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda0f6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2400499ab2fso18260975ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801068; x=1754405868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9+fcbz7W94r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=;
        b=IsNu9y6E5BOW7BcblwznKx41UyolqxiUcYi4EolApf6PSjqZsTMx0/1i9b87lsts60
         s40LDKeVJ/5tM7yyxhoOGNgQhgrqTF2QPZD+ly8w3pRyA+NeGAM1zoIrLHwK22GLU4fM
         hW5vYc6H22iDiOhDKcz1pHca697SRooJBKDKAcGv2TB4mWSlw3b/2zsfhmweJFqiEPpa
         rrWspaISIa9z3RQBjkm1pvXBvfXE2smk6MYpW+LyWU3wEJyAebeFk+ebIhMQJzwBPltt
         T2Zsxmdrubi8iY0rz6R3XiO9Tx4gdKm0GKjocvfzzP1BxE5ki/WvzsJMea39sFSXc2sR
         K9sg==
X-Gm-Message-State: AOJu0YwFhx8jjJd0jBjDMSHIdlwzu7OiLaKNDPukb9/uUkJy8eAl2xSs
	+Wf9RlMMX9Z1E+skxZyLylO612//2/lnxrmXBsrg+hR8jiNL8Bxe3Q+esVhmjCdnHpGe9ScK6aO
	bkD7ZS2q9QBgwEBGHQo0t0oPU4YA1YaHmyqpzKoMHNMiHrQ/XImq9hXrO76nzwgUIZOeQ
X-Gm-Gg: ASbGnctCdmyRTA1UFCqqeA0PIwiPvmVpVSmkBcIoOkyDwLBDGkRubKNMdaxbtYyUdVf
	/8ikGLzckchmWtzjS7MHV7z7upqUW4BXFz19gU70m6Js4lF8N5LiNRmT7/jPSefXYa0ZFeKd79p
	s6aaP2FH7MDD8aWlSgkUVX6frZrVYIOLmovsMyCEj+Dai9Et7LWGq0edxUucXGZhbqAkX2u0iMg
	D8KAmAP9MHa7pbVLkzsjBt6DVTcAm/eqLqRElSf01v4mIAOFkxnk3w9yMGQ/Z0gLCDaiXvD+QGN
	ptweNB2SHz1H1sbWQQliygbzvztxnCGLvfjd/5u4VjcQnEa85YM=
X-Received: by 2002:a17:903:2451:b0:240:92d1:5cd3 with SMTP id d9443c01a7336-24092d165cbmr2863135ad.20.1753801067794;
        Tue, 29 Jul 2025 07:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjD1LFBD1KVpA0YlTQXKqialrZE77rREWeWa02W98WBwqwV+/tbJVbfbaFAXRlp8TRRBpndg==
X-Received: by 2002:a17:903:2451:b0:240:92d1:5cd3 with SMTP id d9443c01a7336-24092d165cbmr2862505ad.20.1753801067077;
        Tue, 29 Jul 2025 07:57:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24025f5a3ecsm49977215ad.136.2025.07.29.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:57:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 7/7] drm/msm: Fix a7xx TPL1 cluster snapshot
Date: Tue, 29 Jul 2025 07:57:24 -0700
Message-ID: <20250729145729.10905-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JwSQ-fKNXUNvr_Ax0oTKcw-IMaBzBBGx
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6888e16d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=zhZQclFZcvAaLIcfx54A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JwSQ-fKNXUNvr_Ax0oTKcw-IMaBzBBGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfXwUiQwp2l0U5W
 725hn4v70ha3/TTNtFFU5GiAy/A8Sx1aJEdJL3GwoYvzWXYq6gJ03bl0JmJbO2QDZrLbWojjrBH
 xYT5vzQ1xakiw5Uxi/vRbN1/B+GNbkNAdaV1WCf9q2w2NSyKt2BpFpKPgxrdNjh9H/WQXngHuAG
 L4aZFENEq6W2HPL2Of72Jdx04Jtd8WArNAha9Ps4pdEgMll8TUWZwcHssC1gf+7U7EtbIhGUSGM
 YZrTDQm5rHQgXhJhc/E9K2Ox4975CLr+zfAgHZytOBS5XDHAwB+3OT/addY19bVLjIZBEG03O1M
 4QFSROcWwjtzlLv8abfW4L8A381n7qVqsI6Px032KcKYpG2fLtZf/pcJutz9Zljj/l9YfNEVPwM
 Hv8udrqIkrB9roFCRNDF+FbaOAjPb/Ucjhg5lUqBoYNc6gxh5ckJf0s02a1mxH19Hwb2UFVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290114

Later gens have both a PIPE_BR and PIPE_NONE section.  The snapshot tool
seems to expect this for x1-85 as well.  I guess this was just a bug in
downstream kgsl, which went unnoticed?

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 11 +++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
index afcc7498983f..04b49d385f9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h
@@ -668,12 +668,19 @@ static const u32 gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers[] = {
 };
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers), 8));
 
-/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
-static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_NONE */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_none_registers[] = {
 	0x0b600, 0x0b600, 0x0b602, 0x0b602, 0x0b604, 0x0b604, 0x0b608, 0x0b60c,
 	0x0b60f, 0x0b621, 0x0b630, 0x0b633,
 	UINT_MAX, UINT_MAX,
 };
+static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_none_registers), 8));
+
+/* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_BR */
+static const u32 gen7_0_0_tpl1_noncontext_pipe_br_registers[] = {
+	 0x0b600, 0x0b600,
+	 UINT_MAX, UINT_MAX,
+};
 static_assert(IS_ALIGNED(sizeof(gen7_0_0_tpl1_noncontext_pipe_br_registers), 8));
 
 /* Block: TPl1 Cluster: noncontext Pipeline: A7XX_PIPE_LPAC */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
index 6569f12bf12f..772652eb61f3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h
@@ -573,6 +573,8 @@ static const struct gen7_sptp_cluster_registers gen7_2_0_sptp_clusters[] = {
 		gen7_0_0_sp_noncontext_pipe_lpac_usptp_registers, 0xaf80 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_BR, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_br_registers, 0xb600 },
+	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_NONE, 0, A7XX_USPTP,
+		gen7_0_0_tpl1_noncontext_pipe_none_registers, 0xb600 },
 	{ A7XX_CLUSTER_NONE, A7XX_TP0_NCTX_REG, A7XX_PIPE_LPAC, 0, A7XX_USPTP,
 		gen7_0_0_tpl1_noncontext_pipe_lpac_registers, 0xb780 },
 	{ A7XX_CLUSTER_SP_PS, A7XX_SP_CTX0_3D_CPS_REG, A7XX_PIPE_BR, 0, A7XX_HLSQ_STATE,
-- 
2.50.1


