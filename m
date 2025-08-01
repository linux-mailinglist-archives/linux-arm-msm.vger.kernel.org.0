Return-Path: <linux-arm-msm+bounces-67422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BAB1870C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 20:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAEB77B6A40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AA528DEF0;
	Fri,  1 Aug 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKlD83Pp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9528DB57
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071225; cv=none; b=L3lv1SNnoyaF0bU2yVdwEqEICNOojcaxa+XwPP2xZdLz90cMm1kdGA7E92BmZSmTFkkYiYC6OiJ8IWBcwkHt8S8EhKVWuuj4Urw/JILazsSqFuWYwpGpMODmaixa2iKPs+CZ7s7SH3Tm8aCfZ94JoZtPXiOiqhTKNv+oKWGNp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071225; c=relaxed/simple;
	bh=9fs+9v5YYJG2O8rReWV91gfGQBXOKP9cTCTwMY+QlIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk3jGQocUVt5HZQRd2ZkIgj7UKODs6/iHQmeEK55bfrCm91/YmYm7/cD1I6R9bwcp46o9awibUEnjPrqkEz2S6XIEJrEUfr0DcOx9sFbxsg6VrOEEF/tcUCpRD+mU1CJPvPcLlWz1SBVXXN9sXdAtq/OfNDn5tD16fJYy7Yyrio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKlD83Pp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfKtA001414
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 18:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c4KQRsxVztP
	sTBbcxsf/rU0NN9GCrtgWESCaGZHxR9Y=; b=kKlD83PpUsSxT+R9tgtLKssh7oa
	axtF6CJtuTg5VLR1lshYjT5/h82lbogM/aA8syWTCnGjh+JXEDBI9rsaZ0T1Iv6U
	JihWXcgAAaUxL5EV36kx/BSpbuyYFRxK6J0QiTt19S+87SbaeNNWOm7d0nXOr5p3
	QWbz2beTVcQgppV+Ok7D4tlCyFHXAIFcNED1k9B0l+RvIoxFI4ZLxiVjVW1AUio9
	haVhuAL4ZSQHHGvyWvv/oQ+/6GKE+qsfbeMFuTzgJep3tY0OknlZcBvcFzVRqlQo
	KZMKqEnEQIpeBtmWX+IGWLIwT6ayQiu3weljB1rfEHWIFqbBDKGuuOxOs+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xtcmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 18:00:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f3cfdd3d3so1200347a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071222; x=1754676022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4KQRsxVztPsTBbcxsf/rU0NN9GCrtgWESCaGZHxR9Y=;
        b=tkLf3rJtIeXIw+HzlPFR2aFoka9Z+EXo5mrCyY8bYZ8NAWkfIKZAWgJfpeb9D3xgBK
         Q/0SSIZVN8v24lz1ETLeUggASdDkt0ptkr21Ddy8gXUnCWK/5t+3dQLbq2TVqxUTOnbX
         u0p/yuwZoaBTAJAceT5Zjl4e/D65gl478UneYtunJw5xQ9yvPy+5l+M7Mf5uuxbucSwG
         CXMUD1jfsqvDlTAL3pE4t9IVks2CArLR+sNIdK4zbneTubRWcLjYrKWSqFFa8S1LE4Zx
         sDRQJwIogohTMVwmpc7qECKkGQsRhp1pDDNgKhn5cz/4ukn7iuV72fh5sJDsB4HVCzF2
         6kfw==
X-Gm-Message-State: AOJu0YzIhFsGE5tqh6gkXy1ymYKBW5AfSH0s7Jg+FI1fDlAzVLpfPKc3
	E7jWslrKHOaARbjP+0i26lb5ZPasp6/Qb6Kq1lwHm4M+r1K52lC2XpXCoZ1WvSXS1UHku6r8cAO
	R+H5kNzvfKSgr5O0PFCbmJWYO9hhZ9Rorsp117ANYj+kP82osAVsuxcyOQ08KFOgEvP/D
X-Gm-Gg: ASbGncsodoWE8cgIZq6D2IPPLWxXcTl1vM8bF9GIQ3muM1oWJo0h4kzLy/a33/mi/s0
	bOyZLZU4okoVx1Iu517oPndcd+8caqp1iByDa86+f8Xq0O1tUAa65Yqjeo7BEpYKRQU/V/rYhvl
	zqUwgI9ZeHWgWZoGOaPAn+Ggpw7t0qt2Yr46uzD/zoBNtugZ6oRIEVOXi4onkg7rxXMBDsYaS68
	ATd+RRraDsyCAouAwm0HnijCyGFYnuruk77skImI5MpI+2bUvn7eMRRsymxVLxCARkP6Cg12FxL
	Va9a/+uh1Gyh2YnRcVFo37569PJJAamCZghQnMVnAEVnYt/rVV4=
X-Received: by 2002:a17:90b:1d4c:b0:312:959:dc42 with SMTP id 98e67ed59e1d1-321161f13afmr971390a91.11.1754071222038;
        Fri, 01 Aug 2025 11:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuZ5/YHyU5W5/PGpq9mfkW8lN3EVfPrvr2fz5DIS9QKgNMf1X1fXg1DmF3I6ux4H1PpGawMA==
X-Received: by 2002:a17:90b:1d4c:b0:312:959:dc42 with SMTP id 98e67ed59e1d1-321161f13afmr971344a91.11.1754071221443;
        Fri, 01 Aug 2025 11:00:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb0be58sm3946576a12.57.2025.08.01.11.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:00:20 -0700 (PDT)
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
Subject: [PATCH v3 5/7] drm/msm: Fix a7xx debugbus read
Date: Fri,  1 Aug 2025 11:00:02 -0700
Message-ID: <20250801180009.345662-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688d00b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=aM-jV3debDdmslfU2skA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: eO0hHnCAKszdYiA3U6aluKmOApFOolRk
X-Proofpoint-GUID: eO0hHnCAKszdYiA3U6aluKmOApFOolRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX13E1YxMOS0xj
 Wlge3ERxyq9VZBz8JN2RG9vc3e6KZKYuc4cc6rAtp6SmxrZ3jyztL+LTSPcnTJ7WZqVtP6SkAwr
 2yQST5fkgrCJ+5LIVaLW+2EBD6NmOlcqYMZD2wykuXAdVgf3Pp9M9C1ZTwkNrpLo6vmgNsKr7LT
 4jQtCQzJYLMufeLZQxuCJWb4+CGmzVl5iDek+POplXDVZe/NdJO3gm0uslwfL5LwDGEgDI9sQcZ
 kdezq+sJuxFpBS4lHc61I8IL1MpuM4g+MMrWxThnzfpZdHn9b3zCeh6oWz/05JCvXNGL/djOJw9
 hBw3c9Jqu5zupUokog+scFmwjasBThwVCbjOnYXFKopMPeKiS6ufQYEbUBajjWU38TYJqQAKBjV
 546K0e/2/30pfg1omAM8Tza3/k1MTWQBithd4WhvC2rURu5cJRHtGzBAc1P/fF40LFqby3BW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138

The bitfield positions changed in a7xx.

v2: Don't open-code the bitfield building
v3: Also fix cx_debugbus

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 32 ++++++++++++++-----
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++++-
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 173c14f215a7..2c7a52fb0b9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -198,11 +205,18 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 	readl((ptr) + ((offset) << 2))
 
 /* read a value from the CX debug bus */
-static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
+static int cx_debugbus_read(struct msm_gpu *gpu, void __iomem *cxdbg, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
-		A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	}
 
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -315,7 +329,8 @@ static void a6xx_get_debugbus_block(struct msm_gpu *gpu,
 		ptr += debugbus_read(gpu, block->id, i, ptr);
 }
 
-static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
+static void a6xx_get_cx_debugbus_block(struct msm_gpu *gpu,
+		void __iomem *cxdbg,
 		struct a6xx_gpu_state *a6xx_state,
 		const struct a6xx_debugbus_block *block,
 		struct a6xx_gpu_state_obj *obj)
@@ -330,7 +345,7 @@ static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
 	obj->handle = block;
 
 	for (ptr = obj->data, i = 0; i < block->count; i++)
-		ptr += cx_debugbus_read(cxdbg, block->id, i, ptr);
+		ptr += cx_debugbus_read(gpu, cxdbg, block->id, i, ptr);
 }
 
 static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
@@ -526,7 +541,8 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 			int i;
 
 			for (i = 0; i < nr_cx_debugbus_blocks; i++)
-				a6xx_get_cx_debugbus_block(cxdbg,
+				a6xx_get_cx_debugbus_block(gpu,
+					cxdbg,
 					a6xx_state,
 					&cx_debugbus_blocks[i],
 					&a6xx_state->cx_debugbus[i]);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae..86fab2750ba7 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
@@ -3796,6 +3800,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0030" name="CFG_DBGBUS_TRACE_BUF2"/>
 </domain>
 
+<domain name="A7XX_CX_DBGC" width="32">
+	<!-- Bitfields shifted, but otherwise the same: -->
+	<reg32 offset="0x0000" name="CFG_DBGBUS_SEL_A" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
+</domain>
+
 <domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
-- 
2.50.1


