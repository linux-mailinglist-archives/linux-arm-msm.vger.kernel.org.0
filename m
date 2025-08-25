Return-Path: <linux-arm-msm+bounces-70693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C0B34372
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD523B1219
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102E72FF155;
	Mon, 25 Aug 2025 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8SqCiI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DE2FB988
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131483; cv=none; b=tOeZHPrxLc14CthBzP/aj+JXavLY1VJ0oiuwPRh9qM0sG5zp3V74ScwxxnUxWJ7owjI7jYsVVba2coBoe5QK/rZ9Ug4UT1faf2OzpOjdqt7wdJQF6shtmWXl1s7c8cYbVMCg93zKCJFJpY/ZxygDRg11Ax148uQiSRO0aPqxo64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131483; c=relaxed/simple;
	bh=Oz7XAr2iLyGy70EQGJQTUcEj4eynjyeRqDgUDR4tgfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmQ5ZdqvBWrxJLmuOTypYG324x6J5TabgA4rgxGP8K14VvPhj81+ShcIpzNk5nu8z/sMsPq9DMN9ZtiMnNWib/Vsx2YTLi2huwuKT5tu1i+9wDesCYmQXTLl7igtqf7jcKEtN8ctrE9riJVDzAXWTIz5/MAZRaJlQwacBG28Ipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8SqCiI7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8StKo012204
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehd6Z3j9F6UFJbL1ClLACpAxqFTJVB256eRXwzSO4q4=; b=f8SqCiI7IGyNFm6R
	9lCq+wvmY6Hwj7QyViqHMp0qYMBU6Ll2k6LBaC0CUNKraIhForGHSwe5ktTcZ/Ia
	BAk5ELQRXw7oACjLzvoIUS5b6B5EJQztU1qFL7NgjGVYoYOCkE0cNrUEo5J1zO5/
	if3U+op3nC3W1NR7kFyU1SzM9lzetXsG7/C/bCGo9+gxm1JgXeEwfQlzcn4/wcP7
	DoHT97txjokqOOLeHhudq2oDZVRA1YzGIxXz8Ta1XqPGKzqYofbnh+bcc8nT6UNZ
	tqH0Cl93gPYCCa3bu+AYWx8c26GOy2eZrKYnUHqrNHr07Cvxmp6ZeumXP5rBCJ7G
	ZwqfmQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unn90f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-771b23c098dso943674b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131475; x=1756736275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehd6Z3j9F6UFJbL1ClLACpAxqFTJVB256eRXwzSO4q4=;
        b=evqDfqZs5mYlyjH2g6b4uTL1Xm+OeM4QriXR8KsNjo8MOM9DGhmvYzbLQi6cffcxcp
         ZyTNyJSR4z3K5aRPYuUZSCO/aJZ9vOJGbibbqPL7P4CuH2n/RYCbQKgoKwxGF3tD5Ih0
         mA0nOdkWEqLHsDHKC5ZCyXkJBbr/7zqCOoq+K+Hch+GygBUv1fJ2xuOuoD1e7nyuq6wf
         TwzhJgEwKBjN3o63teoaFZNVy6jAb2/zfpcJbL931epRN0UekbEzT5qm3EbdBxKgDlRF
         6nNZ5qqz87odwzPHImzWMITHt8MIA7Hirfu1UoL4Uoz8vJ0PV2Lyelzmg3NYTpCJvS38
         NZ/A==
X-Gm-Message-State: AOJu0YxLkvaKY5d6Vwv7cov0sR4NrLQazrJV8/2csTWrM+ObUFFPcF+7
	NbbFvPuXvCxbAoRXiN2V8K5BqTVOQeeHVXpou0tzEER/mTOOyhb99b/8SwKT/giAzGEXb3MdRIe
	yOlu3GqJX3rzoKcbR2KiOrERX+NTCmncGbyvvcPSBBkYvrYirdpZKo/4DosRqWqURah6Y
X-Gm-Gg: ASbGncsYGqFK7ad3+lu5fySCb3h07ACGuz5QomIMZ+sJax7/gGLsfXeYHfIkuKUBLAt
	qDtba/HVbLKaE+xHI7L1SOmMg4l4DEJAENVv3CLjS8vi4z924xmFmx7v9hYOp6Wcy7n+vZo3rCG
	AY8C6BHrZ1N2ffMEl/mi/YG5rnq36uolXAWFduli82LZvAL3adgd/dp0oemAOvZ5JNfPLOfKk6C
	pRrKWAkgxVTCoriA0reLjVfRSlLbU+mk5UcDNzh3RFzwm2ZK5quyrJWPfRUD4QJiU7AOD/BFGqZ
	u2T7GW6kvlcx03bfRIgmnp1mHA0swqbbpUhr77hvqFkHGls3J5Vs5ibL3TvxScCZqfoFIOg=
X-Received: by 2002:a05:6a00:989:b0:771:ebf1:5e45 with SMTP id d2e1a72fcca58-771ebf1660cmr2234365b3a.22.1756131474900;
        Mon, 25 Aug 2025 07:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG09CpaFtCh665b+UlMocJfA8OyKjoGgQ9CL/OZNsmGoCPdzMYCFLICiDjOWQzYZdEyXdcfOQ==
X-Received: by 2002:a05:6a00:989:b0:771:ebf1:5e45 with SMTP id d2e1a72fcca58-771ebf1660cmr2234312b3a.22.1756131474287;
        Mon, 25 Aug 2025 07:17:54 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:57 +0800
Subject: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=3193;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=JGxMLypPbWKxuAwuwREf9cwiYhjKSbC5pwhS5CeKWxI=;
 b=RznuqTe8L3ZHOURGRmWpwGF4mnaHM1muZz9YRCIleoH0fWDqRblDuLOyyUxyD4TKnrGV1lEjN
 MPHaoI4QpkuDxuQkmdMZuprEovAdbWskxdLf/oo8w9MxRVeU4KmJVxA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: ufJYHnV-PqvX8FlNFgn1c4oYdZnG2VE8
X-Proofpoint-ORIG-GUID: ufJYHnV-PqvX8FlNFgn1c4oYdZnG2VE8
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac7094 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXwUVAfulaA3nQ
 YU+4YmW4dflS55W6DCIJhib9IfjY922cuP4BsDGGQw4VliP54ebpDwiWO5U9CP+xsQBOTNpLzqp
 yySEqeFaGkb28KrEVUoK6WI2dcuP9Ea8YOaZMG8KeVATNFwmlqOzuNbXPKGzcl/4fwPgflkg/Uz
 b4/bPUg5mU9SVZJqRFBsNIqamuluspxWac+n+bqiWgvDz4bhfS1mTFYswbXsgQwipBY+acSoPHH
 oidVz+1VcrTiYkNUFR97jwyz03vzgMS4lhQqfvEm4iEFT6oHUZMhmuaJUTZrs1+0kAolgCyc/Aa
 5eFOmuj1y4O6cXqyKsrG0MxkJPAZ+dCRL7WZ33BcRboFfvaDAh59iBmK8i/Kt2IkOXidKP5ZPvm
 9P/Xlm1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_prepare() only prepares the link in case its not
already ready before dp_display_enable(). Hence separate it into
its own API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8e95cfb98bd08088a707ffb5643a5021a288095f..78d932bceb581ee54116926506b1025bd159108f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1438,7 +1438,7 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 {
 	int rc = 0;
 	struct msm_dp_display_private *dp;
@@ -1449,10 +1449,18 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 		msm_dp_hpd_plug_handle(dp, 0);
 
 	rc = msm_dp_display_prepare(dp);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		return;
-	}
+
+	return;
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	int rc = 0;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->prepared) {
 		rc = msm_dp_display_enable(dp);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e12496ac73f853a2bc120e68eeb84e5a2de6aabe..37c6e87db90ce951274cdae61f26d76dc9ef3840 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -38,6 +38,7 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display);
 void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 void msm_dp_display_mode_set(struct msm_dp *dp,
 			     const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index b6b77ee96c30ca60e31cf76569e262a237493aeb..b0dba97e120566f7376e047b319a60c5bc36ba4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -87,6 +87,7 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 
@@ -196,6 +197,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 

-- 
2.34.1


