Return-Path: <linux-arm-msm+bounces-67419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62BB186FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 20:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C4C7A9278
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8DF2701C2;
	Fri,  1 Aug 2025 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqjb021A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4341C62
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071219; cv=none; b=cHytt/PVK2Z/ScBhheTIIklLD3l1CJ8Asuc09NghmBazUyK4IeypcEh08m8MEj+2O/va2Z1mZNwyFBGbPJEXgyhyzaXhts8zMS37eXsDK61/otGNpQ9p57M8Sy5+t2KWUY2/atSKcMnr6fqCne/21zyLt0zrM3aBIpZdx/S3g0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071219; c=relaxed/simple;
	bh=e6x/dDP5ia/NlQH+0MKdj/wLpx5h4B+ZdMfBV+aj6qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeD0opcjuS6AhqVuYGl2mcU/qKGUYs7hdX23RytydPR3oq997g4ekPx4VbS9ukQyXGNBYQDcmR4964GIy+rxTGsmAAMIcyWOp3XnqSYKNrYEdc/D0bsr0lZU9zGzkum8/ds0PfylSL8LtArKDEW7VeVRBVpB0OEM3nWaA7f7ayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqjb021A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfOWT001851
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 18:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0qBkf9JDSmf
	FwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=; b=lqjb021AtTqCvnIJMJBuUKy1mw+
	SKPUHSZlPGv/P89wjiX2SYFjrHJfsfOrmAeW50LSXHK3LPcaZpjRUMIMiGKVv9l+
	fsz1dmWa9hHOHAGkgdauML9IhAYm3w2/cFdcuzXzn+uRAZj5ymAKCQ5jZtwCO/L6
	jh8aity2LH5dT6DNbCvbF5/07qdwLikc99JXmBKHqcSh94zDrcv8gWs/MFTAqQFP
	wRvF/F+jZsQXtqU9XGaAKaZ+WqcIE9sHJfO+kdHzPdMET3MbR9UXycmCFmo5ME8w
	C4BFLfa7v6ANOSZmRCZbbDFei+f0bYxtgxzaZhuyh5DWKCz7dPHV+OFRj1Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xtckq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 18:00:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31ea14cc097so1785147a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071216; x=1754676016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qBkf9JDSmfFwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=;
        b=cZ74uoO8Yu4I+1TeARl7x9D1N4JdZ3vrki8bs+UwcjNCEZbHJTMyXTc7SPToPf8N8s
         /wrF6Td19A333dXBJ/kqt2GfJ2jlfRIrlSQCyy4knDFRpDHV0x/2xCdElaMLJuph4l1J
         61JNTiO3oc0d5eIGsNIpsgA8/6lETNyQedqkGhk7mDxW14rafxXFPnQTW2dvUlCWrkeb
         v/QcyngCYtwdvoX//e2DklNRk+xiTrAsfxtFB4uqRhNbVcZG7Iz+WR2VvU9ajIfZsNSo
         PeQrWZ1b7lZkhXBs3ApwkyiCJPm/uSnevjF4ybMSYjXn4UyjJPlnhFLF6hCDVB/oSOtp
         erpQ==
X-Gm-Message-State: AOJu0YxauGGxti9rPFh3yzL//wpko5dkAX1bKnIHGcK3DRnPaFYDCGw7
	XqV1aXr02UV08BxU3ZA1KnD3LqZhSU36drx7S11KJhTXLynltw2ERKfhugcwpa0KHwD0taSTa/V
	utLSAEPKBgJ9HegLr54DY5jXecCxpBSyTDYSrWRM6VycYBuKfJ/+ED6Hr0ix2hpFzXgQI
X-Gm-Gg: ASbGncsL8JoDnAseJ+ztSZk5idgZdY5MwxPMhbe4yn4QFFyxsYA1jgnlX1FbDD5KMtU
	3Q/g7Y+0YGsWXfxVZ72nUMxn8Krrkt4vdpsqYbZgOIea9Zn3Vs2L8ypMfZXA08ttHjo323XFm5X
	xfEYo12KGkUhomZCY61COqmJUyKpy4kB7nWpWdMbio/oV7kmYHHp2ncS7+4dAoAhuH5Di+fOCqw
	b2/k4iAq8qVon3gbK9tmpH1OrA/7PaX7ZzufB7ovMi7blZrgZJV0di48gXCVW0R5n9IPsAYGEdC
	K2fgMYWGublQ/a7XSpnRGegAW7/+lS6PfX3XFc7yhkNt8oAkZ24=
X-Received: by 2002:a17:90b:3cc7:b0:311:ad7f:3281 with SMTP id 98e67ed59e1d1-321161f1e4amr1051147a91.12.1754071216075;
        Fri, 01 Aug 2025 11:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCufiAuEtwIrk4MYNpS/nkKxgS/INszns4WCKtfrhQYzpgeLZK2wqU3sVv0g6l8Ck4AhkzDQ==
X-Received: by 2002:a17:90b:3cc7:b0:311:ad7f:3281 with SMTP id 98e67ed59e1d1-321161f1e4amr1051082a91.12.1754071215565;
        Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63dc1bb7sm7971555a91.10.2025.08.01.11.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
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
Subject: [PATCH v3 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Fri,  1 Aug 2025 10:59:58 -0700
Message-ID: <20250801180009.345662-2-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688d00b1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: kdSrFPH6FcgphOqdq3lyIBklF3tJUSdg
X-Proofpoint-GUID: kdSrFPH6FcgphOqdq3lyIBklF3tJUSdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX2Sk0s8c7adXR
 d38NE9ju3f3MUY11W3Ei/eT3HUvCakBPXqPrgZF+gevrRBPEFLIp9FjJnCbPlgQowGhmuKDy9Zo
 bMtBnZuA70HFI4QBnpBx1BrGWltSndsy4dQWxznHJGKk80N5LRRtzkXOnQKGT7UgcmLMMN7gt1G
 0SWlX8gAnrZcH3GMOiMQ25ARkSWoQq/AIzlPYod5N3hGdUFeuRiJMd7hIgVagk59zz5RYyzZBap
 U0uJ+tzpMCuLMC4wmf4ulgbgXPab9pDjMx6tJFp4av8wUmFng5zV9g+LUWcmtAZbQxUWHfmHNGo
 opyTSnYipPz9JDSOpk55H2SMBNFr3HbdZYlMMnyfUdqvqSMlr3gaEeaF+ZlyDV59dBWouukHRKs
 sMt/QoJCp/gWqGAgJnupAgaNgvDYK7RcsOdwnVrH0IyOWJOkHfryl7PiIGfsmqDAzsWHQFAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138

This is needed to properly interpret some of the sections.

v2: Fix missing \n

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index fe38ea9328d4..a35cec606d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1800,6 +1800,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d\n", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1877,6 +1878,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1


