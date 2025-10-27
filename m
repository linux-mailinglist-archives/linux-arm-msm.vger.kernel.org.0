Return-Path: <linux-arm-msm+bounces-78923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A60C0E188
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D92119C50C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87963302CAB;
	Mon, 27 Oct 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etrFSmYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA4286D7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572124; cv=none; b=eFgx07D/8xh2VcuRa7cMwjSV+bbG6hq/elsnxOxqsIGWQBCjqqod+hgkIelIYRu4z/VKtG1tR0j0aSGWiCTBPM2a5ATJWoOX5mG11ayyQHkLxN0svtw2A0tClGrqwtVvt4lqCJla8lWwNt0J0apqXdPfGxqSMYe2HwfIoR5ycwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572124; c=relaxed/simple;
	bh=fbnJXiQX68kkbm/D1iLlZF0GumHyj/1MlksgTx0Y+yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P5+wmNMCpbAc2xgD8WBy8iIBacPFkhL99LA8IKTK7FnmqyakTF1OETwzuLpHV1tuisXLWfGE9gRf+5i1Y1Sf6rmOET9gww3e1iS3o7qVYlihaZ23eXchlxpyLJ0fGibWxDAmAW2VXIW8dgE7CbJvoHxWaobi1iB07rP7V3/okEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etrFSmYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCL2DL2752289
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ErdY8kXLBkkRgO7ggfayGK
	UKWYq0R05r3pV8kdnXxTA=; b=etrFSmYzd3qEMObYGP+YmmdVsUR1EngqecB9bd
	BGWEnI3xtBl9ig7BNdgiujGFhcXW35AyVY23Le9QFfIKUb2iACwwcdM+AbQ+5Rfp
	5t2hjB9dYlKKk6djVqWRa2Lc/lvrBY/WKgZqxIMz1lwBHt8Y5pI+7hDk0yRRNlws
	WmGbefkVXtOpiiIAX6D3AVlFxMp5bE4i5EN1udC3CGcmv5W89hnkc9aLy8RoZPOB
	gzBB5wE/HcyHy43z4uzt+6kFOs61nz1eszbhHMGgK2PoMpSfDeREHrrvcUSQz+Lt
	fVvGH1SaYSL/NYJEqc615NDhxUqiZ6IbCSWD0YkKw2LXUArw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nsr6vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:35:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba247f3efso55171661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572121; x=1762176921;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErdY8kXLBkkRgO7ggfayGKUKWYq0R05r3pV8kdnXxTA=;
        b=jmTqiaJidIphklNVdkL4+olyJXe4tyMo5kog6yAlCjk2bznC9g7P10C3BYAJIsqBTG
         F/r6Q6wrF3YlyxQsc6INn0OFewACF1i23aj8BysFLny/zdYJj/iMhKSFoUnPh3VE6MyS
         zyiHWE9LLZxX6KKYdLQJHz8H619AE8nO/GJyq5QgDTF1ywesVNnyWjlpbtFd98GblIHr
         SP8+tnuStGSEqw4waZ6P4TSSPVeQrYcGhgL7eKV2sqoZMEujWIawoYqgWCT5csgJkznm
         JHW5tEupmqUdGHupCMBW/11EdmVk/KHgzGsOKsSB1JT47D1jc8Ib9nm7iwUoLkjM6XP0
         PPUg==
X-Gm-Message-State: AOJu0Yx/ELDnKY33YFjpcEqXRBnvcswA2YnW3pIM0GmAHMp6nsKMJV8O
	09PfeEi1Ep6pSWl8UQztXhVBToN1N++8RImwLHwmItWTDmd2VlKGJF1GYli3RVRMz9ZK3fh1fzt
	24tu1NKlLTN3PRHL1NurqkOieMMQJeoc9Zs/QuDA9RkHiso0Vv7CFf2AV38NU+/kOALct
X-Gm-Gg: ASbGncsyL0PIhiV1FNfxsAlqh3VOpOWQao4BPDrBL4osd5QHMTNrpFBGFv+QXPWes7+
	nWODqzjTl8aCp3fS16e0ZGCIK5fgaVM5xWn1HYZkXQMD3MFDsxA3S4ZI5PdHmsOWkt+XfF4joMg
	rpJxveJIQWFBl9TCp9VivUH+ym8ymI0ayDvkcQE67106KeTPQZfbXtSR7MOFnAyh+FAIqFQS9Wa
	LfKjT0/h00ab9ot/ydVnOJSPngggbPvk/UW+ndeN2xHNkdh6M3TdNPLNq+sra/QdXdFBElZ+//c
	mIAyxfmTT7dK4QZ8NifmU0iZ5/ABqTb+6qfbg+LGSlHsE+P5wiHNgZt1Y9aZyyyViGaEgLTJDQh
	CHBLmfnNUvjskne5Bdm+M5ItFEHsWCwTQKfWPDzmLM14Ja9qxfh4HA/4sXFid8FPru3rOAvH4vy
	VP2n9O2/nRUCVA
X-Received: by 2002:a05:622a:19a3:b0:4e8:b42c:e34e with SMTP id d75a77b69052e-4eb94836cfemr124817621cf.34.1761572121064;
        Mon, 27 Oct 2025 06:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL/k6oJDubDmBz9RbFEPxNjPP3Xc56xvSbGxP94oLkFvGUc3VW74FMXxrNUcFhRspD7ZNgBw==
X-Received: by 2002:a05:622a:19a3:b0:4e8:b42c:e34e with SMTP id d75a77b69052e-4eb94836cfemr124816291cf.34.1761572119124;
        Mon, 27 Oct 2025 06:35:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f864aasm2290602e87.109.2025.10.27.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:35:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 15:35:17 +0200
Subject: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABR1/2gC/x3MMQ6DMAxA0asgz1gikSiEqyCGgF3wQiIbqiLE3
 Rt1fMP/NxirsMFQ3aD8EZO0F7i6gmWL+8ooVAy+8a1rfIeUTyRNGckWJLZD04XR+Vcbw9xTCFD
 SrPyW7387Ts/zA96xHQRmAAAA
X-Change-ID: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fbnJXiQX68kkbm/D1iLlZF0GumHyj/1MlksgTx0Y+yQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo/3UVn1nXqSc2ywmsIG7i7wkAE5ERKMYibym4+
 Os87bouN7eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaP91FQAKCRCLPIo+Aiko
 1RpbB/9MsRHR+86Nxly0FzfgipVdlEGVe7l+h/K+TFN2Aumo33Zh4sKMYONm2WeQfWvNw7kF45k
 gGMevuD2li7T4CCn32odF2VxRIZDY+hfj5g8b1ElsR6aLJbodSNKxJ//U+gZncGOGIHX8I+PQKB
 BaaYYJzxFCAM6usI2PM/sOiZ0BT+uZnk1KR15EOe/pbkrj2FMjuMdNF3vqKOQSpZQYE2ExZNVU7
 SggI/ub8qWjmEoRuKbIeG82hUPzEWCoYFS3GWHKjBC7oe9AXenLemI9B15RjQBmpCijRdpAYOxE
 kVPwUY62EFaZEgiE1F7x+LzfgsMK/QpdzoHhffzuahsn5J/2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNiBTYWx0ZWRfX4A3//8dFK07a
 s0XEvywY8UVWuy+/OjLOayDAiuQTp8xVv6t+MlSj3QKts0MoKhQ92z9OQmziTp0V71zyL4s/8s2
 DbvlUAc+EPb6ahCyfULm+jCJhuyKiCNzRgunavxPGiy0XVIl1BOe8kSIhU7/ZkcuZ4KHkypC7KC
 370gWc3zb1TLyjgnB+oQX3eQGuXLPARP6IfEHOF6i8kMy7PyjdsFTKBYd+XTAibGulZ/zCdGUhg
 znubPxhWhbBwE6SZZvtJf8o5Glc3wbdnsZCYYBDI28EEp3yUSlXZ2+7S98XCtkBDixQmAWI9M9c
 4A6rw7ZKjhPW1awqCwvzgesWQcAqxtZlGKfhEZrLjpXfbPcvp7t9R7jlpMotPz4YA/2pwimtbW6
 33M4SYndR2bKTXH+Hyw0+LHfM8A6lg==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=68ff751a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s4j7PIB9qVrboWrP3l8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bQUriiKCwnWcIRQtE2tByaVzC90o2gI-
X-Proofpoint-GUID: bQUriiKCwnWcIRQtE2tByaVzC90o2gI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270126

The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
the header.

Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index b7013c9822d23238eb5411a5e284bb072ecc3395..cc7cc6f6f7cda639b30bad7632c6e73aacedfcb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -71,12 +71,6 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr);
 
-/**
- * dpu_hw_dsc_destroy - destroys dsc driver context
- * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
- */
-void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
-
 static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
 {
 	return container_of(hw, struct dpu_hw_dsc, base);

---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251027-dpu-drop-dsc-destroy-a1265a9b8d99

Best regards,
-- 
With best wishes
Dmitry


