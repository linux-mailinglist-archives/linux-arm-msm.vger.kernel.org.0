Return-Path: <linux-arm-msm+bounces-68137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C3B1F181
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B8DA7AE717
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E9B238C3C;
	Sat,  9 Aug 2025 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajZ4qw3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032AC23816C
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699741; cv=none; b=nTn/yL4jXTGSlqFUmFhNf9W8Qv9rpRqbK2LFMprOujJn0LsnqdhVgScJpmHTi9cqRd3b5WCXcPoEuOfYLB7BKlsfZDO0/+A7uhKyX6EmOo6uhb0W3Rw+Y3oyfrRVHQYiYlUzYZphrJ7q0DYj4y410RNwpEE3a29GO6YsNUI6IF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699741; c=relaxed/simple;
	bh=dlkqBGODh3j3sXW+PUd6RTyGAht6wmJhJ9vt60MBI2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cs+atihswdoO3LSOJRX9FjohFeCWnYvbgyzwbMSNmhDJ1L3q0111KyH4wOoGM5pG9iCDAt3w1VjjI+Q+cBH+vUPVg1jNPiRp+/+vzjLp0V2BuNL3TqMUNgOFKJEOALFWVdc+ZJjDtSpdM7xlEtAtndj2AXcJnTG2pjQrk1EDw8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajZ4qw3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5790K2gB030362
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Am8SRRlpRsUiuuIqG7X6GswUkVcm4QHsls9Y8TEI2o0=; b=ajZ4qw3AVALeFnVG
	wAats32HsPCVnTKzz7H+3cKxflvILAgpCk73BXH36NbDo8xY5ASkKU5OQTfFFvLR
	6RX4p0TkPWKIm5YejoixVToByFlcv4rGv47avigjYFcdDfTY/iF2xLlwC5r7yJ9T
	Y7Gz/JL71g/fELB/ZtVuxggsYOJDC/rfXxLOESu+FEa6BwA9ZFbuVpjaps18kSAL
	UiH9IFGBSxUCBZ78BQSGMS5TXNe3dBkjVNgDTRn8YRV8+K+0kIjmFz0TrChSU2Bj
	rkb0TVZY0AnzQiySz/KTjNlVvO8cAz22/QFZO0gv4gmMmGkZ4IJwbKjTNmzlZvZp
	nfyDqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmg0m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so4176092a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699737; x=1755304537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Am8SRRlpRsUiuuIqG7X6GswUkVcm4QHsls9Y8TEI2o0=;
        b=nPFH3SSJvZUiMpLIYr4TXOmgU8kKLyNkvSLDiBkanJB5Prm8E7/F3MYoe1qNItK3Ui
         EsXNYxRR1OuTwzPCuuakACfIq256rRFCgJQXjQn4wJO2b2j7hRSTsxttwW03/JL390mZ
         QsuGeuDsEDTLvutOihsCEzE1zrOoSCVwBxRJhgU5PkSWKmAPQ8rjMYriDvueC/0zxy2w
         jZJG/UlxmHYobWc/43zePPp7g2KUg/1Kp7exQyfWc4w5GXfErmhGPSU5mghz864h6U/j
         zya8wutPDPqSQ61io+CY8f5RTlsk9+JwVqmk3L8/hm0hPOrcn8wvvVsluVG6oVMjq7MK
         PUtw==
X-Gm-Message-State: AOJu0YzAbZeO2BoRywMYogZ5XjNjYyaa/oqBc1b8asO8X3/d2X9NMw8P
	8ohg3cRHfSs+XwbpzXdbpNml8madHPZL3NQ6WZiVvAprWEE9S+9OfwZYGPZaFrWOU/wiUPln3Vp
	zY9kIOdCz85JdLtPpiTcFcGDT/pOrqQw8/jSMIgnFgTByY2YbdySGLLZvAj3/s9Lubd3BZ6BWfH
	+S
X-Gm-Gg: ASbGncvjGroJJp72gvmVrsAUoy1t/ho8bKHldlhK6ocdGWci5YrMzEJzDALySrRf3OD
	0W8P5F3qEUc9MYJw6WjvHQZSwOwLDJ9iSktPBJXyRk+JZp9nWP1hplSR3DA8uCjcKaATqZuOZRk
	KYRvnk68HXJlY5vfDme88IG+bENdVjH0Jyo6g3EISY2MPmbaBDE4INoGNjMUMyDd6zDYLTCPfSM
	BDJWj+D581ZC3EPZpXARRnIwgbNnIK2z84eP64xDxAiih8iA+Eg0V0IGiLTJ8qDIueT5oMbuwki
	ut2Qki2Lm+LcM/B5t2c1I5L9iJHq6BPyhQpptjqneHXJtn06f5c+FU63HkuzCukALSRh+4O338X
	NbN6ky9NV7dZg+6bcGEN1kSSM
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-242c21fd174mr54617505ad.30.1754699737426;
        Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKDv8apsZallq/K7ay2tvwcFTR/tP3fr5zCSv6TlMV9b4Q5I+msieWi+8RSFY9p8c2K/WIFg==
X-Received: by 2002:a17:902:f708:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-242c21fd174mr54617295ad.30.1754699737061;
        Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:36 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:13 -0700
Subject: [PATCH v2 01/12] drm/msm/dp: fix HPD state status bit shift value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-1-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1021;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=dlkqBGODh3j3sXW+PUd6RTyGAht6wmJhJ9vt60MBI2Q=;
 b=ijI/+bZvfr7WaBEdK9j7OTWq9Mt0uUE/lrcNkpvprQoAvNK6hxioFg/i7npV3sgZFasfJwhTe
 2rPCFARIkY5DEARh6P00mQa7MQ5/83Lu2BVkZld78HPNmiSTf2FE6Qy
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689697da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jiMY0BZLP9KyD5qzzL8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JwsAsgQ9gMiaWXxMnkKDiIqiReONxlLT
X-Proofpoint-ORIG-GUID: JwsAsgQ9gMiaWXxMnkKDiIqiReONxlLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXzx97ZGhTkTBz
 hed4Eprgse9nPt6CgW0aHuYRmb2QZoBh1KjNnODTJjuvDJpdF1ETEvxlHThSaV8C8J3brD2KfFq
 20n+UGyr80bp4ePYPRLsp0nBixFEf5/3EZomqWp5XMf3ZE8syBKnG+GusudAp/PBB+inSIZG0Dc
 BuRSFA9q3Li3EnB1GKm1RNk/aU6Bj5olt/Kkq2rqLsa94Oda6nTYrWw9ZmeQQLSMoOcaiQreCr8
 nP7XiDpM6kMqth4UvBLRJBYaMV0fjMt+rTMb/1+f6Q9XUCqqTswZwtpXocQGvEj0UjfKLpaAvxl
 UyXRfQLrl6K2KX0l0eAvPHfDXapNIolVuXB+mt5Lr0KX+HyLxmzi/SSYBeoQ7BoNQrBeXZ+obl1
 96ZYl/86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

The HPD state status is the last 3 bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..b851efc132ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -69,7 +69,7 @@
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
 #define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.50.1


