Return-Path: <linux-arm-msm+bounces-107615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIaGMp3UBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB3542A33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8B2C307FD34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0A93F9F3D;
	Thu, 14 May 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+qM+M/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pw/lRn8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB83F7ABD
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766871; cv=none; b=YZG7vNZiI0yNYgEinMhQ8naGG7kwlQ2S0BP+i8QpMIfaXNu7tB12eAPcNEq+BJo5gA9K6n+4ZJkkxkwRwg9w3AL/IziqJFrs4NJDQaGBK/oZ5kDau9g8aoYOvgIn9kfFpy0p00EFerZYT/zSTyde/jZ6SN+f3CBDPvSgiJDsPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766871; c=relaxed/simple;
	bh=9I8fbZtieKCx/gmo5Zwh6/QipI3JStv4Oiuy+n8j+nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M32PasPhCWvBG4DDLJLFYarfpWbqq/ZLJ940OTv2cPl2G9nHxoMZiDI4lggYTaih9gFt0PvAnLnE0m++YmMIpy0ZTHUa7NCa4FFcs4ZPB2COJVtB5YpI2bijXA5MZquG+l39W479020e2C0OPRZley47WkPqs5ieIOCWZD3lE4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+qM+M/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pw/lRn8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSwv2261510
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M7rs8SEMK1L
	Qu/2/xiK9f0eSs0YeYPU7CAo4VX+afCA=; b=k+qM+M/YsSqPCOCcTYoJhS0HWd8
	aIrB5Q3TZRg7rJIvbL/lo1ZRFJaPLj7D7x65Yjfz/CFmN8uTb1RFSg+VTbdPdHv+
	/t1rdCgQjLOLq6SDBIjU6YWpev9tVeq2RLgU5HB+I4goP5KjNnASoRYdMj9Vru5Y
	SIfNmrB7hCY4QrPCbZtA3Yd+j+VxaMcXGUuaREBE4WIaeznHYevwcO1T2f/WD3yN
	EZvzJV04NiYvkyjoO12UupXJ0trXjoonJyElI9GeDC70QrLG1nbK8KKSxj5hHzfY
	vS8Sux7HdgT6SmeXmpksN/0ScHCJK5hLnmsLphlIFWAvXk5tdPYQ2ngWK4g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hj30u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so3421633a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766865; x=1779371665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7rs8SEMK1LQu/2/xiK9f0eSs0YeYPU7CAo4VX+afCA=;
        b=Pw/lRn8tEKTze70e2uinZfM5+vfu6uD3Se0FgipQ8UJnMgYEwROBgFrdvPY1boIjPC
         8dY0s06zcDw2bRidIAZpiFU/d/MtEgQ7TZWtWUMrDWn4SOWzvUyMoNF3yzd5m2SQiX2P
         u63tu0yIcgNGF7hqjv/yMVu4ViJcfhkybQtLmlqBTF7kjb1p9mL59ZSM4Q4t85PR5oVy
         qkYYlV2HwfinC46Q9hkDoXLevIImtveeRwBDpopkSG4Yba5kqFOi7K9voywdoZQQdShO
         1aCv4echOm7TUJdinh3xF1stzIfK1S9hbcDHgnAqBhzIGnfIxHoXhdCRxRio+YGjTBl/
         MibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766865; x=1779371665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7rs8SEMK1LQu/2/xiK9f0eSs0YeYPU7CAo4VX+afCA=;
        b=qGbS99ki7cb8VhsW5rkmA7BPFr9azamlwjl+Ko3Ah0aKI3B7BROCtZT1sys5uExgWU
         GmG7AmgKGvaFywg5oW1blvZAPwkxSOoSN+rkOOzvntXEYLVEC4WfQ6UD9Z1cBSoEsMy3
         03sPerQG6qYC4bjQj75YE4ooopsoOjbKF93osyQRzBhIwDfXASSwmrv0C3vQai1QHJGN
         H0uZtQl54rR6cXe/1r8Jba2vZyX2yjJA8HeZSwfra9ZFE1lnzNmoPzPZFPIvqEzlhPWe
         CI4kIEXxfuVAH5W4A49jF+filzjh6C5C+fJqD1j4WUq3+NFFzUc83qyEDKQUqyheNKLu
         kqUg==
X-Gm-Message-State: AOJu0YxmYUcKoPyAKp/9/RxPhBS2ZFNVb4iYBouKXk8EpcPhGczj2eCK
	TAG4V0W3xAww6GAXQ/VB2L9xkSNocRDP5zpSZ9N6eb/1n1oQTuvGtOgrBScm6fjr+RYxuCAjIA7
	EfwiK1v696TmyLggswZJNxr4r6pLsSCcbt2f4HpltZRyBWUPz9X0jZrSgfI9mpY14TZd+
X-Gm-Gg: Acq92OGp1Afq3U412QFmSU8sOwZnn9v89oTassIdnvUt/8NDSMVkGGxdGtDTqbXj9he
	KlkyboEC+uIputR5e/TVNA6YEBcChlR2RGvCvV/9spt7GFLBKLgE36247ihVtAq4gKjd2o1F145
	5fMn4iFAYVMyuraUcoj/eDPH/4+y3GWvwbBAn5mcgCDOqgEDjvq/KfAAk6G5a/9LFO7w8MuxEvb
	8qXn0gA6/WWiT5LfoXnJ1OZaP554ZgNey0PZXFo0xMaF4cZqqAcPMPoGcsjV+/7vipNFu3HZJFC
	EnJUBJBRSImOp2gLGzJ+cehkMhImn2fhlS/dNN9lSbZs7QgBe2Vr2QEw8KHE4Va92mKvCQ619FO
	FIUXEmNeSeHBjPXyM718O9Ur2ArGko8Wh
X-Received: by 2002:a17:90b:3502:b0:366:d9c:91dc with SMTP id 98e67ed59e1d1-368f77c9859mr7089974a91.5.1778766864966;
        Thu, 14 May 2026 06:54:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3502:b0:366:d9c:91dc with SMTP id 98e67ed59e1d1-368f77c9859mr7089919a91.5.1778766864338;
        Thu, 14 May 2026 06:54:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692716c2e1sm1627921a91.2.2026.05.14.06.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Thu, 14 May 2026 06:39:54 -0700
Message-ID: <20260514134052.361771-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uBsdoZEa6YgzJJg8epsgC6_uWtAizSOj
X-Proofpoint-ORIG-GUID: uBsdoZEa6YgzJJg8epsgC6_uWtAizSOj
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a05d412 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=tmZHKQuSfWdd6biKE2QA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX5EXYv77N1yOR
 9meKsXJGPGhlQYQLP56c2SUWl8mEqbE9WpPgOHVkyvSV3RmdL2Lm1U/numUk5NSItufDDdDzLQu
 I4KDnREbFPMTxzxVH7VTaGXP2J6MbL6IrT7c7xWVpIN3aJiRzDW0TK7Zwx9hBpAI1waFkAjDPUV
 dBv7r22pNjKLJ3XtyQev7oFFC7n6PJ63ZQqK8xOMGNzYhmiJGFFv86P2NoFT8NbE09SQ2vDBYeL
 uj01DQi8xULRpeYH9R8UjkfnMUNVNFE2lJ4/Ku333qEqUk0BxDFT2zHUWWwhNQzjxoKFRZDqclM
 krdJDriouAKg9P939ak0TO4ZRPwPaFXuGShLhvMMD8nxObVN/g6ROpeLRAW9WIP4nkISO1OQwoG
 NsPoeC9tLtLQDassm9YczAt9hOzlHW1N58IRf9lVluCQ2AP4z1COjtRXv4f+/A10GQPkh3/1lVT
 1YMcJjZClz7bVG6ySuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140140
X-Rspamd-Queue-Id: 8DBB3542A33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107615-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Wire up the generated perfcntr tables for a6xx+.  The PERFCNTR_CONFIG
ioctl will use this information to assign counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.h    |  9 +++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e578417a4949..727281fbef36 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -5,6 +5,7 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "msm_gpu_trace.h"
+#include "msm_perfcntr.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 
@@ -2637,6 +2638,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a6xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
+	if ((ADRENO_6XX_GEN1 <= config->info->family) &&
+	    (config->info->family <= ADRENO_6XX_GEN4)) {
+		gpu->perfcntr_groups = a6xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a6xx_num_perfcntr_groups;
+	} else if ((ADRENO_7XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_7XX_GEN3)) {
+		gpu->perfcntr_groups = a7xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a7xx_num_perfcntr_groups;
+	} else if ((ADRENO_8XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_8XX_GEN2)) {
+		gpu->perfcntr_groups = a8xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a8xx_num_perfcntr_groups;
+	}
+
 	mutex_init(&a6xx_gpu->gmu.lock);
 	spin_lock_init(&a6xx_gpu->aperture_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 78e1478669be..8c08dc065372 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -24,6 +24,7 @@ struct msm_gem_submit;
 struct msm_gem_vm_log_entry;
 struct msm_gpu_state;
 struct msm_context;
+struct msm_perfcntr_group;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -262,6 +263,9 @@ struct msm_gpu {
 	bool allow_relocs;
 
 	struct thermal_cooling_device *cooling;
+
+	const struct msm_perfcntr_group *perfcntr_groups;
+	unsigned num_perfcntr_groups;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 305dcde15c5e..64a5d29feba1 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,15 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
+extern const unsigned a6xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a7xx_perfcntr_groups[];
+extern const unsigned a7xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a8xx_perfcntr_groups[];
+extern const unsigned a8xx_num_perfcntr_groups;
+
 #define GROUP(_name, _pipe, _counters, _countables) {                          \
       .name = _name,                                                           \
       .pipe = _pipe,                                                           \
-- 
2.54.0


