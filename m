Return-Path: <linux-arm-msm+bounces-85443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E166CC64E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 07:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7FA307C6CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817DF32D0F9;
	Wed, 17 Dec 2025 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvAUBtua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8j0pshZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7183632C94D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954300; cv=none; b=a1HA1Nl/xSEmBIjUu0o5kiL+vsZEY2AwgWgjQGoHem7aYoXY13o6rF8dStrDHVJcB2rurLLs8ZVXh73px4bL/NqjbMcJXqmdnOLQ9TbJf4rMIKsLWT22z+JxA7FwzqDgL9PeenVdqY3f43Ik8p9Udvkpcrg1KEuBK1J1FMz8vrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954300; c=relaxed/simple;
	bh=pJMvf4gE2407W+gdv4k3Yff8Slpho2ovd+794M5ZMsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYdFYyzstJOUTjRDOKhIzCUFGKZxgHmHqVs1vgAX1M0CCCX+jLDuwF2V2ya/TobDiIvFl2xfH1JbnxnBTNxGy0L21gzAoI6MIUd91TVxLR2PQ1/xRhqK3wpzVbSD1PSae2C3JTtJWjWw5pIdrRp+bxzXDxmfdRgAw0DWec+I4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvAUBtua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8j0pshZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F2cv1872023
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ob5zAEDq9ei
	IuOeJH/1kBFZzN1Bl+vkD4rqBtnGwSaE=; b=lvAUBtuakOsB/1RYpCYNFp7RKeg
	3AEwA0HA4CvzRAVT2AfkOVwOP3lnJ5bhL4iFatXtBjMOH8f+5ipgaVdteUJdlIgj
	xmbQ7EBHCmWFmSoXLG8ZrbphzJ20cSoqmogwQWgTSwWnzMYg+FluVRQmgweBoncs
	v56QZuu4oGCneQEyzo0p+pj1jUr8zsXPo1HRtaSgJnDYH8h1yt0jAYEqmeIebOmi
	SmduESu4vVcyuk7n/QEBurQwbdkgqHRRuby+tDpEFL3Q0QB5cDopJGXveN8o/9fc
	FqGYPFZBFzng837BYsJdAixi3PVL33lPZUVlD9IhA4ourVukaimQygecjAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq8vqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f47c0e60so69609175ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954290; x=1766559090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob5zAEDq9eiIuOeJH/1kBFZzN1Bl+vkD4rqBtnGwSaE=;
        b=e8j0pshZHDbU6FBHVU0sidcUn9+xlVGe3ldirHRe7fWY57LzrHuqkJHcikfZeV03G7
         9kPy0x60YJPY6oIL1NSLDt4V0Aal32KXw1ADyfR7rYMTWS+4vJ8xG6dj2UTO6yMMRfLx
         9X2xrgjR/i/+ZDSnT3BdUG0snbxYTETVHLyacS+vs8yp4Dhcc6AsB6mRkyW+tsmFXnmZ
         YZLpdKkfLQ7kKA+Ojvk16Lj8+sg1DWrJPH8CYkct6dtRTyHq+HJqdQekVKxO5t9u7O4k
         F8pfhzvMYz8lb3ZHTu2rYc4x7owgtZb1AeQeKu+Af57v8m1KxTExxdO3DK1UdERoVDLX
         wBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954290; x=1766559090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ob5zAEDq9eiIuOeJH/1kBFZzN1Bl+vkD4rqBtnGwSaE=;
        b=YWOMvMIUc3bO90kV7JChU4g/AQYE3Kr0s5l87tKmsbBtZLLlTvGskLlKbHF1/VoiEI
         qXT3re1CW+Ayb5VmxqRj4VxdesVcOP8Szq2R6Np/WSv43e3OMuojcB+7uMFJo6ueF8qX
         iOQOr3HWiq5LDB3ge+aq4GB3gx/x8fuaCpPTEYHsWZvNLFlaJZVjPnUIUCjc5KOf8zst
         2ddwLOnF6/4ym3/DgiyNm0RbR355q0Kzr6Y6mUTwGPKmnAya9LVdXpnW7qHu6mqNDUTI
         NlUrBbSTCkRuR8cc+sb5+l7f1KHD/8IrCc2dP0zWQlfdZNOi36CHLU7EXO2GfJmlV3eQ
         8yuA==
X-Forwarded-Encrypted: i=1; AJvYcCWBZjMIUW8ZfxxUL20DyOs4GPKHUVmECyzGfu6MOoVtDMUugOOE9j3DxVgGfV6+9Z/xPloYeEU/KjZZ2fRW@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLBwXbtBcmr2Bu+3eiAhzbk6oDe02STQi7MJLbtr9TObi/wT+
	BZxatT+n0xLhlnMZ7zaYmVP1ErPcbdVQLq15Woqc7OdCDt1DS9jGeVEEfllb5TZF66auX/p0LO/
	axYhIs4O53Z+/B2mW6bUkZvnEI8FkUis6LpokSzMQBK7/ytVBAj08OFFIdDHceQqdp8Zu
X-Gm-Gg: AY/fxX623buWtTuFz97+8SgqRAK2b4QssL8PgAqGbOIgnyEan/iYzgUgnGlEXYq1cus
	T4Kq/WRKdDEwDuUcypwulP84MSquI0j0RsvKBYyjoNNoS0R4Lc9zWNs+aaE4WaRXgEqGhZfEtmr
	+zbj7UxY6mgczptJsLVQKsT35MkksUWdNZG+veM1qoTSkWr6ob7W93XcK392qmT+fcGRIU5TIvZ
	j7yB8sOa9cqcWc6X96MqGZl4qAElNcl8iDyM1fUfDP9dfrqw5kHHq4wV7EUOGjTJ3AoQC+oX0VB
	MxWi2WV7OOeMQfXgwcGyG4z9NAnLucSUSYoKS/RowBPjpKawr9SRfxh78zEXwRodyVK82wnvOh3
	PyCxlTkIeTLd+ei8jS/Vv2Pjfq8nn1AT8qq17t1u8I2VICLGzWQ4U5W6MU/8KJIHpHP7j+1Tycl
	pA
X-Received: by 2002:a17:903:41c4:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a0e1a4fcd5mr111457555ad.54.1765954290245;
        Tue, 16 Dec 2025 22:51:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+jLipged6UvMrD3Na8ulynn8bBpRtRrg63DRf/JcDs+2XzdYdiq9BaBHF86AMCoyglgGi1Q==
X-Received: by 2002:a17:903:41c4:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a0e1a4fcd5mr111457315ad.54.1765954289763;
        Tue, 16 Dec 2025 22:51:29 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:29 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 4/5] rpmsg: Handle dev_set_name() failures properly
Date: Wed, 17 Dec 2025 14:51:11 +0800
Message-ID: <20251217065112.18392-5-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=694252f3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=R6Is9h_wUuj108RMq48A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX0AAO93sprUAk
 Wbn/L3M5aMATlSDwQ6Q5zIaO8qj+Pv/ofXhNDSUzrjiV0C/BqxA/i9hCTqQLcm6uhYwn8J3EC02
 8/AldsCx0oTuyb7/hwvM3aD3tmSc5l2Nx8coJp5SsTFqAv153w/dbBClGOpK5/D4dHg1ETp7JeS
 dRdUk+Txk8ik0RT//roeGXn9Wb515xRFuFkvt4fcz1maF1asJH2EUu4UaulngseQwi9O7zNICl3
 b47ZmGUpEDvB7pk0Fvb1oWUAqTvp6wP9BXtTeGjAuNbDL9ya0JiaADw+3DNNJnxLAWKFi7FN4qE
 NbsxgZdNZYaN4ZBnLeOfR1ooJXGWCY3RP1usxkXQ0/9LhOrIdJI6VabjAYsNUfh6tRqlTgauj6i
 X2pVk6GH2fCgEJxSTSRAE1Bu5aeLyA==
X-Proofpoint-ORIG-GUID: f4ti18rt7hHwzBneSkowUEgTgWJz_H3B
X-Proofpoint-GUID: f4ti18rt7hHwzBneSkowUEgTgWJz_H3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170053

The dev_set_name() function can fail and return an error code. Ignoring
these failures leads to undefined behavior as the device lacks a proper
name, which may cause subsequent operations like device_register() or
sysfs interactions to crash or behave unpredictably.

Add error checking across all rpmsg drivers to ensure proper error
propagation and resource cleanup.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 8 +++++++-
 drivers/rpmsg/qcom_smd.c        | 8 +++++++-
 drivers/rpmsg/rpmsg_char.c      | 5 ++++-
 drivers/rpmsg/rpmsg_core.c      | 8 ++++++--
 drivers/rpmsg/rpmsg_ctrl.c      | 5 ++++-
 5 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..843bf04eecb3 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -239,7 +239,13 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 	dev->parent = parent;
 	dev->of_node = node;
 	dev->release = qcom_glink_smem_release;
-	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
+	ret = dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
+	if (ret) {
+		pr_err("failed to set device name\n");
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 2793096aba45..61f580ee04ec 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1494,7 +1494,13 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 	edge->dev.release = qcom_smd_edge_release;
 	edge->dev.of_node = node;
 	edge->dev.groups = qcom_smd_edge_groups;
-	dev_set_name(&edge->dev, "%s:%pOFn", dev_name(parent), node);
+	ret = dev_set_name(&edge->dev, "%s:%pOFn", dev_name(parent), node);
+	if (ret) {
+		pr_err("failed to set device name\n");
+		put_device(&edge->dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = device_register(&edge->dev);
 	if (ret) {
 		pr_err("failed to register smd edge\n");
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 073d56858b88..89d232d80df2 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -450,7 +450,10 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
-	dev_set_name(dev, "rpmsg%d", ret);
+
+	ret = dev_set_name(dev, "rpmsg%d", ret);
+	if (ret)
+		goto free_ept_ida;
 
 	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
 	if (ret)
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index a5dd09f19b14..49737d69b44c 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -553,8 +553,12 @@ int rpmsg_register_device_override(struct rpmsg_device *rpdev,
 	if (driver_override)
 		strscpy_pad(rpdev->id.name, driver_override, RPMSG_NAME_SIZE);
 
-	dev_set_name(dev, "%s.%s.%d.%d", dev_name(dev->parent),
-		     rpdev->id.name, rpdev->src, rpdev->dst);
+	ret = dev_set_name(dev, "%s.%s.%d.%d", dev_name(dev->parent),
+			   rpdev->id.name, rpdev->src, rpdev->dst);
+	if (ret) {
+		pr_err("failed to set device name\n");
+		return ret;
+	}
 
 	dev->bus = &rpmsg_bus;
 
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 28f57945ccd9..3e2cfd16df6a 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -165,7 +165,10 @@ static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
 	if (ret < 0)
 		goto free_minor_ida;
 	dev->id = ret;
-	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+
+	ret = dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+	if (ret)
+		goto free_ctrl_ida;
 
 	ret = cdev_device_add(&ctrldev->cdev, &ctrldev->dev);
 	if (ret)
-- 
2.43.0


