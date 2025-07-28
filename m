Return-Path: <linux-arm-msm+bounces-66939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA3B14370
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7401D4E5BE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423CD280A5C;
	Mon, 28 Jul 2025 20:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQnJb8OL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CC27F736
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734871; cv=none; b=FlIVQw+YAemAVevWno/iasuwGENo60TRlgtrZ/yUHUU1llL7T3nNyfKNdOdBdPlXwAR/GXPpfwWmkY0CtzsXAn41ZL+oaVafg6cPWNlQuzH6l3ApJvBs+PjUofza6dSGunJR+vDLLRXkhOlmq62h1jbeNQWZaVVS9rX8FfRAwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734871; c=relaxed/simple;
	bh=a1xn1H8/fa/A9qraVB8eAftc2nCQicSPOhezcVcH5EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMaCQK00HzY8f3/hYQNnYGr32W1KQ3+5KOu4rHgFKKo539lYwQRvVncLQ5Qk+C9VS3nIZ50/lS43l7gRCoUwcNeFGgvQAQkrfIA42kekNG1X1jdkDkg3Z13a/Wvo4CjqSagw3wvegpDYE2ELaSw4StvBbwelndRialKJJTabdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQnJb8OL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMFZ023468
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V9+fcbz7W94
	r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=; b=UQnJb8OLWP9QwXGogs/DlkXf7Vm
	zpe+3nPYqDV73hH5QmVsF1roKS4OGWEL3pbWD4iayMxZm3VJe4BZ5NZMEtKL2MbX
	A7KgUc9TvKS2opSSx9Zyf65Fhsi2r1OC4fGNmWZlCVqZ4qJe5pE/N92kvaoYyR+e
	siRfoXrTEpn/JqYkFYnQL6t/YwtpTGkBG4uLuoyqH6680TT5IjXnxxhA2+eUh9Ya
	J/nXg0CdXetsjayL53lOMwl0D6vdiDj9uNVaJTQSFbNAH7tApY1sFKfM3npPLy8h
	J15A4g04+UcUrb4/1Hp3n1EpzdqyTiJN8FeR5xFmjrRsDtrbvnbINTzmXpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2403e4c82ddso8187745ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734868; x=1754339668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9+fcbz7W94r3G/u7UQJHN/TfdQW561mZf8p47PIeZU=;
        b=RVllO8qrhNJbyqzXPcUDv7kM0TSTzsvp/gGjqzFECkJx7rxTaC7PnNfLfc15Wnp7ht
         fV3Xaozx5LTju3PoC8ZN4MSwUfroJoO6Q25CAR8ntbMGjxHna13mHrAITl/gsX0DMDHf
         mP96FBm6ey6EiO01coVO8xFSnNt22KFrb6plIR1QTbYnWV7qCAaG28SogsdttbvUHB4h
         sS4P0miv/Uydh0mPUL+7yHroTNBdb2X8Nur8VFIQf0eUvxFmPhachYSlMRf/FWL4PC4p
         odbi2mlpAziRWcH7Qd1L0XkrYwhwvl7Nczj6bcaEmJHWfbVsVxKDeIg20KBc2DPYo1Y5
         Yuhw==
X-Gm-Message-State: AOJu0YxFI6uDvKH4wz0BxiZsYbG8N5KdFHhmKTMBf5cbmWic34nuWWao
	k5XgxyTq5ed5b3qsKNqTepqw7TQIPBvMS01vfq+uSAJi3yhl/OwmYQmLaZMvEzcLPnWxwsjIv5E
	T619jR2PWPzpRvVqrP9AJWsDbrIJx8mm6Gvjg5k1Nv4kcmlNcMtt9FNMKeRk5kdU04Pi6
X-Gm-Gg: ASbGncuqJ1wXSTmC3aN25H+Nme477URjyy2D9GisWMU1sGPI42DGpIgRzYNQoyn3NGN
	7aI5BZrKWN3HCsxx2k48AAbSyMtAVfSEHVOWUi+SPD6ZLwJojzeHpEns6VuXIomltrfcYJw7qbj
	XV8NUmJ1xSgVXC+WIY4OsVcHPFbehHmEFiBcEAQg2+pBEusm35cJSr7po1PXVei9hG06EcowvZZ
	o+thx3vpdP2zE1dDalh3OxjY5LNEauuY/aDrhGnL19gZP4oHYJxvscF4RjBsIrIIRJhJx9oPfZg
	zy5sdUI+FT69Q63sLeJoioCb0+INzr4Vk8by5USoJ9dGpy4pXWw=
X-Received: by 2002:a17:902:f083:b0:23f:ecc1:ed6f with SMTP id d9443c01a7336-23fecc1f05dmr88609005ad.17.1753734867974;
        Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYWCqRtE24tEVyEPFKQ+MJ3KSpNHmjoUKuOAzp/vLakvO+2T4gVctQrTsB7zyfP/q9HW23Q==
X-Received: by 2002:a17:902:f083:b0:23f:ecc1:ed6f with SMTP id d9443c01a7336-23fecc1f05dmr88608795ad.17.1753734867535;
        Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fd62dsm61122835ad.111.2025.07.28.13.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/7] drm/msm: Fix a7xx TPL1 cluster snapshot
Date: Mon, 28 Jul 2025 13:34:07 -0700
Message-ID: <20250728203412.22573-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfXx9W0endDgie0
 aFZHX6254pngyYd7kovGtAeZbjNynVvThxeG/qUtQlm8h+ys5TaaroFjTLTQDDnCXBtMurGL8Og
 Sl5UNOvnP/Xi+Qu7IH+dppCymx7rlkICPDSvHnprQXY2sr7f+7iidJaZapwdfQfhck+7uTG4rwz
 EwsHF9zW8o6gxCoNZmoo+dji51Y26/8ClmB6m+kwAcu5HuekzHOna6v8/qeU7AFvPYgE/5+3geC
 dCArRY17LlNVUSt998n8qkH5+wByWXD09MjwBlV5+ioeWHfjKyOMXFlyuIBCef5DrinukZ9esTh
 hv4c0f8+Kq1BUyHTaFibXwkbDqOaQFP3N7uW4QaK9QlwhIM+A6IT80uGK5JPqMf2jcvKn2tIjiU
 aHjLUG21Cy6DB2aZv7PVUerpK+t39L2FOTpwSsWekRSpH47obXRn/sjGPJeGD3FnAKJoxPD6
X-Proofpoint-ORIG-GUID: 6WkK0k--ohMDRkhwD833fVLSQCtqxU6a
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887ded4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=zhZQclFZcvAaLIcfx54A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6WkK0k--ohMDRkhwD833fVLSQCtqxU6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151

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


