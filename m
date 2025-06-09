Return-Path: <linux-arm-msm+bounces-60677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065A1AD258B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6633A8955
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF32C21D5A9;
	Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="camXxapc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276BE21CC49
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493488; cv=none; b=DCBU6Lzg4GmSUGL01a9/HfLjhc5KzZvXb25F/42b0zdydl6cjk2+kDT4Wo0SwrG7YNsxbZNQl1rUqKw66O7V3g2JojtMJ3tQqQ7vRsixSJ3KwrAgjKswvppLEI37qvklwBxmW2ti6XmFHuqTueHAEKhNaOMyJlvlItbAnraiXcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493488; c=relaxed/simple;
	bh=Nw5R6/u/rNV294XNdLAIM6gmpeegWVncNwNovOkszVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7IK4nQjEc0WiYj0IPFYFdqJtYhXnn3YWtdsAvcLiUVvARmVIEmRiYwvwd75bqz+PPQ4mBGLW7VxHNNJui2ftsuopaGY2rn9zZqjSl4dk4p06wAE3E6y+DVOGlGmxoQj+Xil8O5UQBSiuJnQJvSzJKYEAn+vm2e2b+gRTT/aiis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=camXxapc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995dQw012128
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wDKSo0B4Owx
	KLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=; b=camXxapca/C/5sga8qhF50Bxhjt
	SNi9SsTxyiRTTSRo4DiMOYHTmJIyznRy+nIm4KDSepuTlI9zI2V/Nv1SVFme4ppy
	xGz6ND1y8MjBFX+E/YWoQVeYv9Yi5jrzitoEX5XnxIzhA2bzI20f5oaJTpcNC9rK
	x3pdqu65IFoqIuQHNc9Dfmb7+el7sREE6HY/Fevb5kpdPwJCPmCqDcpK0g6M1EIu
	Lzbtj/pE5qH640sgzDdUEBAAKrudRZOEwJagqickt5+q4D0xvUALIPxwVtFBWkWq
	cx12eOXdsfHOly3DJmTLE1pBUmZj94gUou5T9GEEcRgQg5nxkI683CZ9GPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6tf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:24:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2358de17665so43541795ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493485; x=1750098285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDKSo0B4OwxKLMBW6S+ptTFSRqNPn23bmUpGk8ww0sU=;
        b=cgC6+4KMzVaYfUNunUMtybQZXpWsOzonJNw1SDaFzN40JusoO/boyrtiJ4laBLTuAW
         +b4XbfMWn1aXmWb4r0ErDwshBl0zg6cPt1QrIvqD/qSaLybiK/uKL5/Tdg200K5u13u5
         kIHntRz0/k7lj2VngV4WU5rhWxwMrbuup5tuvDvJKllyBfVM1o17IHMscJk1iHNfgkSd
         RO3ECwN7ihOcIQJjuCvXLq3prakJRzJBhU6MWRqcjSCIAyt7vliKTjacsHEbcUFnkyjE
         CbeIjKFOuUZigFY1m1zE/G37q5ZrBbOjtPjVCGlACuSf2gix0KUveGnSUiiHufO/2QFq
         oARA==
X-Gm-Message-State: AOJu0YxZlfAbGTdoRHizQ8Oj5WnN6Fo3BedlYw0wye39E623gdTBKhDc
	ObkXLFLl6fXiw4p+NFyT25da4T5oF/vmwJCguZ4NKd6MshqUU3Z3PlZkswTMQPRIRVfyF8PbzIu
	+n2kNJbC/kgh7zKnaSvelelLQUinWr2LYFFbnQJdi7MLLeAL14N1myHukFnzjUrDTFIKp
X-Gm-Gg: ASbGncs2IjVAOyFVNsDjcMMeqrI7FszthkfJ+Ycgvegj34kjJTT/nkh/En1bG/jn6LV
	Vk8luI6VjpL35WAU+0DkhSq/H2TL7qWQ4//tVjtVcLRf7sHSuKIXjlw85fKeWmhq6Fgdi+26v20
	PrWIE4267s30HR+ASrTzxrYCPUveK2f2vx7MHz+10N8E2nXQK7PS5YVq58p8dMrZHepDcrCTySU
	bm3gx8SMkAiOrg+GjIDYm4cXSM0weVZkaE1Hk146bdIaxsKmXy4QAwZ83YkBW8byLR8gPnuj9ds
	04Sdvtr2stIeDMvA1bFseTCeA6YtmX0g
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id d9443c01a7336-23601cf68cemr203519935ad.2.1749493485363;
        Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2xRWfunGxYuE2OM2dbnnHB5b46Yn438TRpEDL3+xKAueWZPA4Xlpunoydd121jW5MCcyDKQ==
X-Received: by 2002:a17:902:e891:b0:235:f55d:99cc with SMTP id d9443c01a7336-23601cf68cemr203519705ad.2.1749493484921;
        Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcea0sm58136435ad.103.2025.06.09.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Date: Mon,  9 Jun 2025 11:24:36 -0700
Message-ID: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: coRVIwv6CGqnyLuFpYj6IrJSgmcyNTYk
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684726ee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=DSfSXdSXGXaEfb08ihoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: coRVIwv6CGqnyLuFpYj6IrJSgmcyNTYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX/2m4voLRZeOE
 5xrpDmau9ROEDqenYGvxtFckl2QRTkJrCDwyOyDhzXhXvtusGWVon4+5B3Zi99dbLQVqwivqDNJ
 novBrPB/pTqjD9yuArEWpLfMZnJGGtSdlAuls606PyqoN3ejLM7TsaHaR15gQh2/QPudeOtcomm
 aQgAT1fIRemmm8hCraJXcF+eXeEunRIT6lvtDBSQpfxGmxknBRm4pvQ6gHl406i5uqRj2GZvXiY
 qpEsPyONBR4DopoH2ataUZzAXVyY2o1C61d3c5Uiu314ijKWaQFrfsbdHrdTTJ3punrsXUmXmgO
 dah3S5jJ9fxXJZcXWn3DsKvy7SiEhZL2NYHof404fT+afLtzqRr6+E/xInxCz/q9ZSG39yvNFhw
 qjebVVOiCjv9MxNNDk3xgI01BwjuyLtW25/UtoyGCX9PrW0QdoUUaLhbz5uPrV6cQwmLyavg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140

We are going to want to re-use this before the component is bound, when
we don't yet have the device pointer (but we do have the of node).

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b0390c38bff..778e6ae7f137 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -133,9 +133,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return NULL;
 }
 
-static int find_chipid(struct device *dev, uint32_t *chipid)
+static int find_chipid(struct device_node *node, uint32_t *chipid)
 {
-	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
 
@@ -169,11 +168,12 @@ static int find_chipid(struct device *dev, uint32_t *chipid)
 	/* and if that fails, fall back to legacy "qcom,chipid" property: */
 	ret = of_property_read_u32(node, "qcom,chipid", chipid);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "could not parse qcom,chipid: %d\n", ret);
+		DRM_ERROR("%pOF: could not parse qcom,chipid: %d\n",
+			  node, ret);
 		return ret;
 	}
 
-	dev_warn(dev, "Using legacy qcom,chipid binding!\n");
+	pr_warn("%pOF: Using legacy qcom,chipid binding!\n", node);
 
 	return 0;
 }
@@ -187,7 +187,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	struct msm_gpu *gpu;
 	int ret;
 
-	ret = find_chipid(dev, &config.chip_id);
+	ret = find_chipid(dev->of_node, &config.chip_id);
 	if (ret)
 		return ret;
 
-- 
2.49.0


