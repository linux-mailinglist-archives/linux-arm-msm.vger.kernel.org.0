Return-Path: <linux-arm-msm+bounces-81726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E6C5A9F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2A510355FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C183314BF;
	Thu, 13 Nov 2025 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGtxKzUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWc1N8jw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F403314B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076680; cv=none; b=aQteQG2Q8oxbPGVE3rb/x+3GF5U+nzfki1ij7w99NeJCi40lVUDT1qqD5F3EsY8dRNHlOe7wwtGQFf+Jvan4GghelJ0byXiAC+40BLqFCC27N7mBCPcUp2QLwZY9w52BpSJ071Qa7EioaPOg4bEKKbPrJDNu0mE40fUiBWALDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076680; c=relaxed/simple;
	bh=Q9m5CNKx9FOzxd+4ydSe4NBkO7HUkggyOwY3jdIpxD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuK2AHSQ+EEgYkhnjYvFmqyrSwmcaYt8QvAGkRUXfwwm3MpdsFTAeNe88Z5MPXtgpofhGk6Bh4loyn/b5ShWG/OWJ3nDzAhmwC6JnyurD+twrRXhG+8VIiwZUd8oODxyYroJi7s5ApdiTfScPDG5fA810N7EANjPnBwMcEluldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGtxKzUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWc1N8jw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbAJs1435106
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CB6S9RVY8vn0wwCs22L7iOojAOJ0e95Ai4UolOq6vfE=; b=KGtxKzUH+J5DQrn+
	b39dfSRZwLf6w3PqwnzLuD56w9NEAa7HaZLr2mWjRVzZzzwCFoOmPeAbyz7nDD/g
	gA1v4MOc0aOqQjbfUdWG4JXqjjtvKfunW7IHSKhwphD9XdaS5ic6FueqWpxbM+ji
	vLl+Un/09Lw/eEzw7GPvvTgzz9sptbc4g6f0zz08qFgHbwMBx960KQp+QgcnfyFc
	u9CmChwS6XrHHbhuzCl3JHPPRwTZP4OnDZgEGpStQ14pn14lXzUdmtesflaivinD
	r3bbk5h6SNq6dnm2z9JBP2qCTSU5qVuREnvwECjPk/UH3Epz5tNSmITRRgmDhJYy
	t1IpMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g044n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a675fbd6c7so2256725b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076676; x=1763681476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CB6S9RVY8vn0wwCs22L7iOojAOJ0e95Ai4UolOq6vfE=;
        b=fWc1N8jwVivLn8HsU88gvX9M/dMFsN2595Ydjl842dkr+DDy0Ghc8x9oY1fXlZ+tX3
         1apErufcn+DEGhTZIR/hq2oHCaoEowmLfqZPmbh7LEs6lRO4y3kDuYlvWN3Mer/UNqJm
         FtdkcRwKh+FE36ZsrimOgBqtQuR57lm76zwFz7x/72I5deY5iUE7NclxctPfgmGB+EuI
         wL/qe9aSDl4EZY3aTKFg9aeUzV52g9nBd3BJL6T6MdQSqayR+Nfg0PVB3EQzDSktaskw
         pLOU7Uqq6iKW3r0LW7ZGMQwwv0spY8LyFYJXiYFPHWOm3ItRTai8sHKaCroYsz+ki313
         EyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076676; x=1763681476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CB6S9RVY8vn0wwCs22L7iOojAOJ0e95Ai4UolOq6vfE=;
        b=o98T+/iwfmXwwfM3nAJjQEAXxM+0UeQnqkbd0mkjYzT98MOP61q9JXAgj13LBVJ8m9
         E6uL//cteRVvDwhUovjqab0y36niU7LcLrdTBebelJidWMQV0mLyQzmfJId55+YuKIwO
         BsWG71qrwd1p5S6xw/Ud91e02QDZWqUrw//FXUkwkIYXCDeqPhPH9KyreWzZmbXb1o/v
         zfPHi6+v4D1m5bxHnj9wOLQk1Iik48AySvmlVzwD2nL9iMvPjBDE8Kna4t82ulK1CVWh
         bOTD6xPcVT6KVdAOos3E7QdiRr7PL48PfGBzXBiZ6HDQY8DZoaFf4DADQkz3fnO0tfam
         egmA==
X-Gm-Message-State: AOJu0YyVvgqpJ8CAzOyA/GW/eC8wSZOcUH60bWdv20inU/WiUOFlNFPA
	3noXk3Sdbx/7kRBkRYHlrvbVrgqcQK1UZjpgsYYnJia7QptzclksIEqDGOwVFeLPsSiDYRoR9ve
	mR7hM7aDBK/ATfv4nWh9IbVyMZAr0BI49+W/2BFIQMt6CHXJVBfG4iMpYIMDE3l+ixvYa
X-Gm-Gg: ASbGnctQar6FTaTSVLdFzQtQ33sumq/10GFu31On+Mak1/adWWAuoGHHJbTqLevJgKS
	7NxO3qaCvC/P6oLrMKtiVCO44r3+7WSAl/k46q8v6K18eME2pnahyq3okmv5GV331nqiRezthrv
	xoJQdSdLeSdiGVhARNg4BQ/GYfc96cYT5WbEqF94dzE2h9C4ElR6s6vhrDan+40huv+5M6IPZQi
	XfOjQg3tdPp4jCzxc9PAuIAOeEv4M6IG4BaRuMHIcL6aVKE2t1flyx9+FBtPiZQOA5g6HDiJ1Lt
	WL2EOfrdrfNDGaSp+DdZ9rr2fIhtgo2HWgjmtPLkCgkjWj/npCR5X9FdOdscMB90W7BMxEjL2hN
	Eaxh40f/8izQet7Ug/L5HNdU=
X-Received: by 2002:a05:6a20:432c:b0:334:9e81:4e5b with SMTP id adf61e73a8af0-35b9fa7d7a2mr1620099637.5.1763076676381;
        Thu, 13 Nov 2025 15:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdM1TwSBI7bgq33ThxEnHBZmojfXX5geEyT5PoZRuCcR8MI8vCw1SVH8pAT63wHxcRCPzgVw==
X-Received: by 2002:a05:6a20:432c:b0:334:9e81:4e5b with SMTP id adf61e73a8af0-35b9fa7d7a2mr1620072637.5.1763076675794;
        Thu, 13 Nov 2025 15:31:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:31:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:09 +0530
Subject: [PATCH v3 12/20] drm/msm/a6xx: Share dependency vote table with
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-12-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=6424;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Q9m5CNKx9FOzxd+4ydSe4NBkO7HUkggyOwY3jdIpxD8=;
 b=NPkyBRxYexgIIAzKrksfzpRy0u9mDbXENkjhYmm8cIG5w6QdjcjACga2a/91CypC7DfAVDUlE
 r5RFSeSv+zNAAJGYNDldjht8qM2ircdr6UAw9rn+VDW1ghazd7F40cF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69166a45 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jvJuTtenM57zLa_9FEIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX927m8scB3PgP
 P9pJ3XoNFkHrj1igDRRQXvylvt1njV9uQbYS8137jKjWyPHtTPxjsLGPySdJ23EpTuI7A+Z3XBu
 soAJ0t9arGtoBI0KxlpjPdqay6bLhHOADWaqKnQcZaBnD21bwG/N19avGzHs/OLgbimFpOGgR4A
 TWb4jx78MmhVufyDeJwdStohe1g8oweRRS/AadYKxCkhoITANl0jXrtEnDJ81tuOdlQsfW8UGYR
 v0e4UkS8D8COU2jff7n12P3Tvge2WY1P+iv0MFKM2m49Ii567WT0zZlMvxy8eHSvmg+wryPocf1
 mjb+vhoBybW/M11zTw3dnQ0vLavJ0npwsDJ1AmmD/GRaVh0EZWWkH20uElHjuFFMBLxmxslV6dT
 PENo4YA3nXawiunLNhQb55t/pA85xw==
X-Proofpoint-ORIG-GUID: I-CeoCe4pldM0J_Aiq4NkbbEK7ShtU5l
X-Proofpoint-GUID: I-CeoCe4pldM0J_Aiq4NkbbEK7ShtU5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

A8x GMU firmwares expect a separate vote table which describes the
relationship between the Gx rail and MxA rail (and possibly Cx rail).
Create this new vote table and implement the new HFI message which
allows passing vote tables to send this data to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
 4 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f32e1aba146b..158c0cd2d92b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1590,6 +1590,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
+		unsigned long *freqs, int freqs_count)
+{
+	const u16 *mx;
+	size_t count;
+
+	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	if (IS_ERR(mx))
+		return PTR_ERR(mx);
+	/*
+	 * The data comes back as an array of unsigned shorts so adjust the
+	 * count accordingly
+	 */
+	count >>= 1;
+	if (!count)
+		return -EINVAL;
+
+	/* Fix the vote for zero frequency */
+	votes[0] = 0xffffffff;
+
+	/* Construct a vote for rest of the corners */
+	for (int i = 1; i < freqs_count; i++) {
+		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+		u8 j, index = 0;
+
+		/* Get the primary index that matches the arc level */
+		for (j = 0; j < count; j++) {
+			if (mx[j] >= level) {
+				index = j;
+				break;
+			}
+		}
+
+		if (j == count) {
+			DRM_DEV_ERROR(dev,
+				      "Mx Level %u not found in the RPMh list\n",
+				      level);
+			DRM_DEV_ERROR(dev, "Available levels:\n");
+			for (j = 0; j < count; j++)
+				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
+
+			return -EINVAL;
+		}
+
+		/* Construct the vote */
+		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+	}
+
+	return 0;
+}
+
 /*
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
@@ -1623,6 +1674,9 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index edf6c282cd76..2af074c8e8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -97,6 +97,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
+	u32 dep_arc_votes[GMU_MAX_GX_FREQS];
 	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gpu_bws;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 550de6ad68ef..da113e5b535d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -23,6 +23,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_START),
 	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
+	HFI_MSG_ID(HFI_H2F_MSG_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
 };
@@ -255,11 +256,63 @@ static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
+{
+	unsigned int num_gx_votes = 3, num_cx_votes = 2;
+	struct a6xx_hfi_table_entry *entry;
+	struct a6xx_hfi_table *tbl;
+	int ret, i;
+	u32 size;
+
+	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
+		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
+		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
+	tbl = kzalloc(size, GFP_KERNEL);
+	tbl->type = HFI_TABLE_GPU_PERF;
+
+	/* First fill GX votes */
+	entry = &tbl->entry[0];
+	entry->count = gmu->nr_gpu_freqs;
+	entry->stride = num_gx_votes;
+
+	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base+0] = gmu->gx_arc_votes[i];
+		entry->data[base+1] = gmu->dep_arc_votes[i];
+		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;
+	}
+
+	/* Then fill CX votes */
+	entry = (struct a6xx_hfi_table_entry *)
+		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
+
+	entry->count = gmu->nr_gmu_freqs;
+	entry->stride = num_cx_votes;
+
+	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base] = gmu->cx_arc_votes[i];
+		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;
+	}
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_TABLE, tbl, size, NULL, 0);
+
+	kfree(tbl);
+	return ret;
+}
+
 static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_hfi_msg_perf_table msg = { 0 };
 	int i;
 
+	if (adreno_is_a8xx(adreno_gpu))
+		return a8xx_hfi_send_perf_table(gmu);
+
 	msg.num_gpu_levels = gmu->nr_gpu_freqs;
 	msg.num_gmu_levels = gmu->nr_gmu_freqs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 653ef720e2da..6f9f74a0bc85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -185,6 +185,23 @@ struct a6xx_hfi_msg_core_fw_start {
 	u32 handle;
 };
 
+#define HFI_H2F_MSG_TABLE 15
+
+struct a6xx_hfi_table_entry {
+	u32 count;
+	u32 stride;
+	u32 data[];
+};
+
+struct a6xx_hfi_table {
+	u32 header;
+	u32 version;
+	u32 type;
+#define HFI_TABLE_BW_VOTE 0
+#define HFI_TABLE_GPU_PERF 1
+	struct a6xx_hfi_table_entry entry[];
+};
+
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
 struct a6xx_hfi_gx_bw_perf_vote_cmd {

-- 
2.51.0


