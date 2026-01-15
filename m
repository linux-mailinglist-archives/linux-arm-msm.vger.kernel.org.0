Return-Path: <linux-arm-msm+bounces-89263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77480D284ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A88230BC94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8339625F798;
	Thu, 15 Jan 2026 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBbcOpvn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnPIDEKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1631ED67
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507550; cv=none; b=jzlGteDo2Zcoy2V9ezbTutLsCYZTEoYn/Qe58nCmZHouJDdqZNlg9B069/ANJeWzU7huf3zFzU0eeuQH8/9rV4mQHJQb49FwohaNsxS91ihLAVqGjM1wYGofIia2YF1mStek+96hB2z+eVzGENKBAdQlsXsud5DaSGUtyrWvJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507550; c=relaxed/simple;
	bh=F6xYL/L+rt7LV4dkOFjr+7V2E+S4X2JsuEZcSii4Ri8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrENiKtihj2y/5z9Gf3xkAKw6J/cK+lgzVAO49tqk9wwOeEMdyf+tXOJ3SKOB+/x/bu0sp2/YTRWB2EuPpDhxJASrYcjmk0Z2wXL/GMBZLRKvBgx0AklFqMrq1oFTfJ5OFnNXDwgCGH5op/CNuZuDWzgGkmeXbU8/CZd2pI6fBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBbcOpvn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnPIDEKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGDZ2866209
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEUYQxV96PnR8jNNyLBEH4rtFWeaUZ6wJwqJC8OGj6Q=; b=NBbcOpvnUfE/+xRo
	/JctWD51ZYlKt+wisjifw7TeAA99aUyoW/4r2kfNw9AnoeZDPuVaN1zG14to5qiY
	lq9JHTNbPr08dg/h8ZjxbJHueGmcHDtQqBIFX4rfDY/uVoZ7hugIi4rGFmIa1eOd
	/KGZ66OpNiQ/lUsVCOXwJx+FzutTMoBv1kvPUXfm6CdZnefJskkcai7u90G55Oq3
	HMzy3KnCl6yV/5jk6oGs1PRtwsd9Q3cANGrUhkfBdSs3lcE+btvvcj9P1T8I3UsA
	KZp/TTpVNbzLDQMDlnWzvv/5c+cGGWiN+YYOrHW5RiXidUiaEzHLIfS9MLWvtUGa
	fophKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2japs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:05:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso624971885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768507547; x=1769112347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEUYQxV96PnR8jNNyLBEH4rtFWeaUZ6wJwqJC8OGj6Q=;
        b=VnPIDEKSly/K5CMn+nQ+Bj2KieOJopByWJkFDG1CRFt1s501kFB0t9TrCDA0CKw3go
         vhhGA889bvB6n0+zVym3GGKi1a9OTPrvMcw/vWlt0EWxLIPOFLrXW0zM/+ME5C74GYt2
         rU6/pgbfLrpYSmpvGbFtnZU0UeCrinreWufkWlxf+1q4RuRPC3EiBY3XK5E2mynlu0QE
         TPjTiU3ikJUIwoq4MM8TOa4Hpor1w8JgstQTurB0p1bDDu/Mwa0+322+HfJKSC23F45I
         WpThKKb2XV5tFwWwU2kRx2JzX5VqFnblIBea4pw2MpsPVcAEVlYFPHBkKiB3VgkGqrxi
         iPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507547; x=1769112347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mEUYQxV96PnR8jNNyLBEH4rtFWeaUZ6wJwqJC8OGj6Q=;
        b=b5OQ+kFIKY++Tq1jxYXGOkLCDOSrGRF3oqFVzTFUQ4H8mw522/8G4drzThBxna9E75
         rpskdqf02Az4lzrkbpJ2syGh1LMPX1dzEJu7+wcSeqcejNvEVSdALsFA3ncu6fxEDiLP
         3wpiYrcECkUi1vAZhto4frE624hDUdXyxFdBThlnQqwxmds0H8ahTKdNHyNgAt1r8Lno
         x33T2PLSTXPRpdtpBqSa6f3kVmoKHt2pIQaqqHQvisKG6htSTD1Q4EFMQmkGJBYBlK8t
         NEeV4Y5zWD0lvVGU8TXK9Brt6KX/Fjm8KU0QIW1Ciz0ASnWj9AFbegsoTTj6SHxVpYGQ
         qjUQ==
X-Gm-Message-State: AOJu0YyqTk942hZNidUc9cgaQ6z3agyUWeknAkmTJbocCZpoTCxREwMP
	mHmFMRXkjPzc+OdTck7ZtKNcJO+6jw8yBC5WcOHOSo29rDD85GHWuwSMw7a2EUfMThkvzqcKyDY
	/CQex/H7sE9WLqcS/qh4eKUf3fGb9HSxU1SOgPf8tSnYNvvqFXqiAcpscj9LqGvzeS+Bq
X-Gm-Gg: AY/fxX5UbE/Kurs6ic1fjs7NWhes6vn/cbKdMs0f7AeqQqivQREJT4qi40oUdh9LWVn
	RC5mnRyIARq1rfsnJEhpKWL0WGOIj/Emzwi5Yq1Bb1emz+LsBKyBZ5+Cgp9tto1aqoCu5SWB0t+
	p3AAm5ybeyUAbjmYARpXCdyvVgzwW94i4udn1GcVT9g5yBtyk6Np3P7Ve4ucRsImA2ZKznWUgC1
	SBjx57HU8mHDyhQcK8iJ/h6+0EaRMQibna7RlBobeG0pXHJGKAeOpE6ai+xs3LL8S4txer0lgBg
	XBG/Be5UMjtZJsr6acjKBd+WKX8ap80hQMuPDBIzfsb8isJdeYLgQRcUGB9XYPrb0hLqXMf9h1C
	eBpw0jpV67pQkI/dOnDOQrtUVOxhRRMNgpKWSYgGNUR5etkY4+fDIMeKcasw/haDMKebsLAWdia
	Ftkan6im5mruGzFrm31nbnLkg=
X-Received: by 2002:a05:620a:44d3:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c589b97336mr642831785a.11.1768507547096;
        Thu, 15 Jan 2026 12:05:47 -0800 (PST)
X-Received: by 2002:a05:620a:44d3:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c589b97336mr642825485a.11.1768507546536;
        Thu, 15 Jan 2026 12:05:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:05:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:05:39 +0200
Subject: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3109;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6xYL/L+rt7LV4dkOFjr+7V2E+S4X2JsuEZcSii4Ri8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2amx6T0XMXHt5W2C0ulpAcnvv4znSnHVbeJgbHqxbKkq
 UfFtcI6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjAR/Vj2f6r9LJ76Ajmz18wy
 ez7hZ3H681ct9uXzGdeEvnt4RPXzxPq5T103lH/OeP3+T862zR7q3Clij2ezLn90a1dQSc+xOTH
 7J65wm3vzNQ+b6cpod4kQn3CRuXflz72+GfXvU/byspY/5QJaMul7ai+f8lGK+M74NT9zyfefEx
 yYAvIEJtusLpHUemdR0C6bXR8UNudc4vRFftErWR9U6L1YvDW38mB8VdnW9FvcfwxliypbF4nbh
 Jvr5+7duO2t+ZLqEJ+japNMIovKche9n2Rh5TInjsVHUFL2wNuEJwanusQLkqsUWd0SxBn2RzR2
 s5maHD7qIHc3V9T213Vr92ye7o5zR1geaGy+s6PbIXQSAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfX3Nl8LdEIbdfo
 udgjF/uc11x76ybjrP5VWDflZiUffAQ6a7YZTVxzYKGL4jxBE8SPtslcVo0g+XYUXJFfL+zcwE8
 Imb3K7oiGhOM1SlrLOHCHWRLtQ6RXf8dkUv1zkF1tznXEsAEteWtUHoeVzZcfPaHOG//R79lVfD
 0aakQrqYCXhKGstkoRplZcRdfLgcYjjJ8bxIjHyPgL4PBNaFRm8DHNB65l5/VTTeVPEvVbZw1g6
 LSYN6gRETMWZuYNNt+t/XytuKKUvZUXifGy2k4ySZR8WcVGg5mDzqdsZvEjAexXmFuSbP7bqSK7
 6sJNCXJ2+jGuqoas1fFw61RXQam+eCpnkv3Z1shogqJGsoi1XCEU5rBMO+nhHs/DkizJwujGAAt
 DUWtsRBBY6/5XromUY8UsZlVtKMSqGXi6vwMAelEgkiHQY5mplOXRKMdx7TlaTAnIzZSAVFoLcq
 KxG9d6YHqSIpkl3JVdw==
X-Proofpoint-ORIG-GUID: 4EleTJZKhPXaWxCj5nnSxU3-2IeZpXpl
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6969489b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8oFmcx1cRZW0fiqr4cUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4EleTJZKhPXaWxCj5nnSxU3-2IeZpXpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150157

On most of the platforms only some mixers have connected DSPP blocks.
If DSPP is not required for the CRTC, try looking for the LM with no
DSSP block, leaving DSPP-enabled LMs to CRTCs which actually require
those.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7e77d88f8959..451a4fcf3e65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -350,28 +350,26 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	return true;
 }
 
-static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
-			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id,
-			       struct msm_display_topology *topology)
+static bool dpu_rm_find_lms(struct dpu_rm *rm,
+			    struct dpu_global_state *global_state,
+			    uint32_t crtc_id, bool skip_dspp,
+			    struct msm_display_topology *topology,
+			    int *lm_idx, int *pp_idx, int *dspp_idx)
 
 {
-	int lm_idx[MAX_BLOCKS];
-	int pp_idx[MAX_BLOCKS];
-	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, lm_count = 0;
 
-	if (!topology->num_lm) {
-		DPU_ERROR("zero LMs in topology\n");
-		return -EINVAL;
-	}
-
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
 			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
+		if (skip_dspp && to_dpu_hw_mixer(rm->mixer_blks[i])->cap->dspp) {
+			DPU_DEBUG("Skipping LM_%d, skipping LMs with DSPPs\n", i);
+			continue;
+		}
+
 		/*
 		 * Reset lm_count to an even index. This will drop the previous
 		 * primary mixer if failed to find its peer.
@@ -410,12 +408,38 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		}
 	}
 
-	if (lm_count != topology->num_lm) {
+	return lm_count == topology->num_lm;
+}
+
+static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t crtc_id,
+			       struct msm_display_topology *topology)
+
+{
+	int lm_idx[MAX_BLOCKS];
+	int pp_idx[MAX_BLOCKS];
+	int dspp_idx[MAX_BLOCKS] = {0};
+	int i;
+	bool found;
+
+	if (!topology->num_lm) {
+		DPU_ERROR("zero LMs in topology\n");
+		return -EINVAL;
+	}
+
+	/* Try using non-DSPP LM blocks first */
+	found = dpu_rm_find_lms(rm, global_state, crtc_id, !topology->num_dspp,
+				topology, lm_idx, pp_idx, dspp_idx);
+	if (!found && !topology->num_dspp)
+		found = dpu_rm_find_lms(rm, global_state, crtc_id, false,
+					topology, lm_idx, pp_idx, dspp_idx);
+	if (!found) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
 
-	for (i = 0; i < lm_count; i++) {
+	for (i = 0; i < topology->num_lm; i++) {
 		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
 		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
 		global_state->dspp_to_crtc_id[dspp_idx[i]] =

-- 
2.47.3


