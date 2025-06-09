Return-Path: <linux-arm-msm+bounces-60678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46ECAD258E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B59B1891517
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454DF21CA14;
	Mon,  9 Jun 2025 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMl/ATCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8C21D596
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493493; cv=none; b=GKm5+1ZBFg6w3KIcow3unqIsVfS9WU5yJx7g6POfM1bvgiIJ3XONigmsRA/l0Hw13yH2gxpczQqVM9+H4wUnpiRaj0TVzcJNFsnecMJqCZol5sOKz/ZyyToJ5HobwHLscPSL72OPfBa7pKCVjoRNxPNoGkcHdI14wfL+kvytP1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493493; c=relaxed/simple;
	bh=2Yz04CrS4eDfH+osQ1AYNYmCh+wB/WulKnvayV3buXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hh2XTGACLlA0a2fZvM/hcZlnBRCblLeE9Cgf6PAGacxbJ16PGoBS4pjoJGca001YAnChWEFMtFV3Ha7GYo3vVxtL7dVV7VGh3fM+pnadj7BNFC1qAWO6IzJzQ6IROOEDmz1yJOJZP/v0jEd1VTFmFimrVUe69QLMFTyEKlC/Ec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMl/ATCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559A0enb032175
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecf/gs5q5Dw
	zFWtmUtIrh+h+5TTwNY0t6ORkyO3PRW0=; b=fMl/ATCopv81RuOcttIfLT3RGCV
	f2aFpC33dDon0kLyS+40JQ4W5Pm2bdSaCyaSfeO9ej6Q5a/5VZIxHJuEVE2pZAHx
	7fOEASnEIUe4EYRLaPVXWGZB2Nauq9gBZBfCoVlbceuikUOLy6EkajeRQmeXwXue
	qLnoGqBfkKECKtUtakL//L6/ak2etxDOwEPtxJhUDc2Poi9/Y6CvkSk60tq0rrnx
	c3bJ9JoRKMgsUss2RGWYKm/eLDxF6B3PoeJg1owl1ALvplNrQXnYIMmXLRlR90JQ
	ZDYoGJVWI6Tzvp23vkPEXxQpD0UJzxEs3HlxlTZyWKH91YENvDWwykoKyDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6tfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:24:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31171a736b2so7913271a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493487; x=1750098287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecf/gs5q5DwzFWtmUtIrh+h+5TTwNY0t6ORkyO3PRW0=;
        b=Yf+CKhFRz0Nj1MBXBZ+t/Ozlik6miHnKlaM4h4Bgyoeg3p7kIdCCq426PyWWSJBz/c
         BqfaqHMndgWpPwxiEk5uEis/HZDZmfvckN55nCKrxD0LS+L4t5SKUGr+NTbwGlSeu1FF
         +ahkTTaVka9zzj3u58IJXhkAQKlmdurMrli4oarCT60vw5HhUH6XwwnmCWHxmcaC+SLL
         hrb/7U8VghedBFRR6gUgfx4MkGmR/TUVsUagKPKHCsm7I6PwdE4NuQffnOVt5avl5akQ
         j++FNlzqVkpmdQP4wZnDMp8ANcYpssDj0ucjzJEtYD8d5rE0TL3UxYLdxgDp3hpJuzJ8
         9Kmg==
X-Gm-Message-State: AOJu0YxmSYXsnDVou/Glyv0Oy5Nf90whoahivKnYj1/d+F81CPbqbSEA
	hMiVK/cV/PxGSiDDOpvvhGzN8bNl0M7jaaHaP9SSCghkPDbNGdoRoyQwoK7YXsf2pBpdEYIXnux
	0vyQ9anvofm4FsXmiO2ouCwz7m1cnQUup2G9uesCSSJoQjw0jOTi/Vi5DHNKvyRkyPRD6
X-Gm-Gg: ASbGncuH1wREffJ+JuKeF2R1TX5ks6gQN/jboCwo2AGhYHTg1jSllgkgY5mgxSlePa0
	GdkUK2MQx0MAZoKZXjebzt3QGamibZhNMtoF5D9P6kNBw71KDKcPemRzeKwocdM7bH7c0p2wLV6
	gxjmjI3lWfs++LPrrT8wpTEBe+I5nx/5zc+DOy+WnuDMWIqRvl+WtZXwo8onlb2Ir6rX04p+BlG
	8Qu+7x+vMPCOFt0Qxjk+25+Drlylj7GY96paWHfrvpFWDJzkD3pPFFSDwbkzkOAd30vyCypRet2
	bgP3JBcZ9J6aUawkTg6mp3C55aMC5gDI
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313472d4297mr20221929a91.4.1749493486589;
        Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEigB0QkFd2i+DltDS7spF4Aiz+S0w1cLE1zE97QoFV7hOhFnk6CT2wbS3XvV3KokxiU/HvdA==
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313472d4297mr20221906a91.4.1749493486236;
        Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f32c96sm6630688a91.12.2025.06.09.11.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before bind
Date: Mon,  9 Jun 2025 11:24:37 -0700
Message-ID: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y1LwHfXQH8NdMAUT5i7huYijNjl7GnmE
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684726ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=KW-EWzdukDj2kg_Rd5wA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-GUID: y1LwHfXQH8NdMAUT5i7huYijNjl7GnmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX3fcF8TJPZ+Iu
 ipVbNaHbKIbLChWTdXxzVoq56LdFUYMHlmISq6pUetiUbL1ZGGOjiaj7gqB8+U05MGvrKvXkaVV
 r27QiBYt+tCZe0LldaqChNUljDJIUXGJEgpM3vOK65roSYJN1D0AOom5y1q3KCDR0Os1XfvKvrj
 jAU0Pj+LDOirIdhJfYQZVf70yD+1SIt2+uKNEgDnwUL9vCVXRUhGYFToNiruE8gjI42TrzzYa7a
 e6zb5HMTgevfKBx8pWUVQHxD1wXlJUVLVS1zr3evBtAPWATpb1uLXwt71nZPLawL0oDmYmrY2Ep
 GgKyaLYP4dDVr0pQhm8uX8MRCUY1BHQl76flnlb4coluzOP0a/Mt1AC/IfnD6Ev/B02h19/G6ex
 uH47qwMvMrxoIvJKZdaaNxeFaUve1sN2fXTA6tLZni7delgqJfYxXPLt3gscin3Tki/TEqC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140

If we have a newer dtb than kernel, we could end up in a situation where
the GPU device is present in the dtb, but not in the drivers device
table.  We don't want this to prevent the display from probing.  So
check that we recognize the GPU before adding the GPU component.

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 778e6ae7f137..0d12454b1f2e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, uint32_t *chipid)
 	return 0;
 }
 
+bool adreno_has_gpu(struct device_node *node)
+{
+	const struct adreno_info *info;
+	uint32_t chip_id;
+	int ret;
+
+	ret = find_chipid(node, &chip_id);
+	if (ret)
+		return false;
+
+	info = adreno_info(chip_id);
+	if (!info) {
+		pr_warn("%pOF: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			node, ADRENO_CHIPID_ARGS(chip_id));
+		return false;
+	}
+
+	return true;
+}
+
 static int adreno_bind(struct device *dev, struct device *master, void *data)
 {
 	static struct adreno_platform_config config = {};
@@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ret = find_chipid(dev->of_node, &config.chip_id);
-	if (ret)
+	/* We shouldn't have gotten this far if we can't parse the chip_id */
+	if (WARN_ON(ret))
 		return ret;
 
 	dev->platform_data = &config;
 	priv->gpu_pdev = to_platform_device(dev);
 
 	info = adreno_info(config.chip_id);
-	if (!info) {
-		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
-			ADRENO_CHIPID_ARGS(config.chip_id));
+	/* We shouldn't have gotten this far if we don't recognize the GPU: */
+	if (!WARN_ON(info))
 		return -ENXIO;
-	}
 
 	config.info = info;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 87ee9839ca4a..40eb04bab35e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -956,7 +956,7 @@ static int add_gpu_components(struct device *dev,
 	if (!np)
 		return 0;
 
-	if (of_device_is_available(np))
+	if (of_device_is_available(np) && adreno_has_gpu(np))
 		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5508885d865f..56bd1a646b83 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -729,6 +729,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
+bool adreno_has_gpu(struct device_node *node);
 void __init adreno_register(void);
 void __exit adreno_unregister(void);
 
-- 
2.49.0


