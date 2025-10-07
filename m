Return-Path: <linux-arm-msm+bounces-76151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2239BC0343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 357AE4E1A0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4EC21767C;
	Tue,  7 Oct 2025 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn63fSad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43E212560
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815538; cv=none; b=AqYQWe44KHVQd3YRWw0NadhfHu9Zq7X3TP06NiMA/ShifF6bEqnCgnXMFpCE7YCyNTgySCcp4DsAn9f38wTEmgxTnFO4Li/O2Wt8FAOVXH0QnUmbL3LOibNmxS9PlLAIXfj+JStdG3oChT+eKaDbgkw4KfpIDrFsdet841ih7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815538; c=relaxed/simple;
	bh=ua/W/tbCgOc4pgDYbBQugkykrGDY0/RNxIbBVrkw5BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RgWaDHAKxn68hGjZcY9uZrJCQyyTxuAn5ky6aF424T4Fv5rFmOamIjPJppq9bYp8DY0TEwbTKPkKBGu+Lqn27fofiiyA1RrRnnjuLpAFq2Bl8IiAFSoDnQTCoU9Byy1ZUlTEVDqeC0csac4eGucwD50ZRYHjPxJ/Kx+FKs2a59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn63fSad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59725JA0001386
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 05:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u5VbFaNdj1KsSZoq81OM0MFIv5v/4ss3PBG
	tpWI2cVs=; b=jn63fSadN0a6wR0srsn1S09I88b1muAcvYXufevs2vrpP4eyJZL
	YqxvDB//wh9gONskomLqLlIvKvKHbP1uecS46fu60yiFGTne5AIE0OoW+Zcbmpum
	c5hx9FhDUC4Adl75QHG7GX81+hYyj1/Vwcc7r/v7zW1ekoEJJRX6DT5lvp0NjxI3
	f8VYVn/sunDzH+iWpSrZQjlnCMOQvmZKzhSpkkAM62IRGEKXrAIXuvl96XU8YOAQ
	tRUEWM9mjB7fwMRa3wuPiySotF2Gj6LqbfH9jsEZc7rkhr8EwxaKIny14iUo5GS9
	7QQN8yZBm7uU+6eS+dDbqnimnO2XwIolgaQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7p1mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:38:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e6e4f29c05so4210561cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759815535; x=1760420335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5VbFaNdj1KsSZoq81OM0MFIv5v/4ss3PBGtpWI2cVs=;
        b=ets5DbourJluWMp3u/6+O7lsnmv4DuzzB8sCJh8c1/OVLUFDgrDcDjdAIKBsO3aPBl
         9Y4EaWpDOpOGNZpVOkey5n1u5hMLH3qA5QL7+NWVp3/QdpBCXqdv8bjtlNk9C/GogPEr
         qdywL4jTGHKGPtv83sxqoERuq8h/QJnHSdRZ9eUxSVoA3JQu1N9pXQ/DR0bYEHxWoidG
         UFNXAHgEAzW6Up6sASwrrhNqBzMoxB1JeS+g/hbCR/1faHpOQEXwftaPjksSOmNyYSdR
         KnxRckfTPmmQIW6DuIG2ELIf+Hr2ZwbJpNGJ7Dfn/Sha1KNE3afKqaa/U6Dr0srNu9VM
         iWeA==
X-Forwarded-Encrypted: i=1; AJvYcCUtI82krskUpzi/GwkmCvS4EA4ffSnZfz0nQ/KfijvscFXuShN5dKgjnS7L3f6sDFDaY6LZIkqmHy92JM8X@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxjJ79Kn2ypwh5KoiuYnJQ4iayEjxXYExqquvnk5mY2BeevP+
	cm2WCty/DstL3qU/sxyBzjljJEKgNLB87yDNA4+3uNf8dct3ZmPAILtVwGbx6fhpmdQgJ05ggfz
	UQRWT9ZIr6Kjkn5sIixrdr6lHtaaytLFI1b6mLvItzfykvUsayP9OEY1y4ruiNTAOEQDT
X-Gm-Gg: ASbGncuAgR1b0jPbcEEoSk4BYSDUg1yfTVJdhJldaWmrFpoufOX66VuRf9/Z7rGAEZe
	llLKbBAe0H5BVOy3n4tzUht0lJi3kzTC9Wpc1EYLM1CgqE5ac7ILDj+ewBOeEoCZ9mfg0RGFMMR
	5dZctHLSgMbmz9jdIJHpp8gAxyYjy7GUcRCspks4fhTdvj/A+vPjS8MeTEkExUBR1W2aN2POeHY
	bedytqkMKcsiaO4bcZYEzWSyhkm03568I1PL6Cp9JsOTOLO/cG/FKJVF+FWt4G8wvSjK+dDYCoQ
	C4XVWBDREuy/nSd02Eq1RH6/ooSD4JjEPlyRVpr4d0BOeMR9rRj6rMmCYUFhWCuzB1Tht4swf2J
	jZpjkQMLkBA==
X-Received: by 2002:a05:622a:446:b0:4b6:15d:b3f7 with SMTP id d75a77b69052e-4e576a5c2e6mr214458841cf.12.1759815534697;
        Mon, 06 Oct 2025 22:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHILkrqUNaq2KlDxS2cga8lcDXCJEqx3IiH5NckbA+jy0DSn6hkossQwJsWjs8+vyaBrocQXQ==
X-Received: by 2002:a05:622a:446:b0:4b6:15d:b3f7 with SMTP id d75a77b69052e-4e576a5c2e6mr214458671cf.12.1759815534248;
        Mon, 06 Oct 2025 22:38:54 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a7ee4esm1289021966b.28.2025.10.06.22.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 22:38:53 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
Subject: [PATCH] accel/qaic: Add support to export dmabuf fd
Date: Tue,  7 Oct 2025 07:38:53 +0200
Message-ID: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX9/U9f55bANNX
 LqZvDKtB1xH3XlLymkuvnCQ6lsxAyjTwOPck+9zLc+XOQ1YDZxN3PjC9TQmqzEKsoAdxFyaE/A0
 +I9sQgjACI3PifmHfuDAVMGJ+Q277yaz37QOfiJkTDQ1DqcxGutsNIIZ4dJhN0f5rwV2evBFqgr
 umDG+39xX2VTJlRe5uai4Y3ly2qM7xo/DMrnYlB18Nnkhh0+sddPE+ZBCJ+uDGDbTIYQdkx+MKd
 JrCzVY0StSgERcJHfvEX5qaDNnDVTolMEiuXUEldHcFd85SsSlwBuLlxCpzk0jrwL3DAcKlUcWS
 wWb/TMj++1Du5F0/rgj7qiXGA96CsUBJkAoFdXwrQKoB8alyfGaH4YJiOFG5/nOYKNqo6deaWBc
 lMfD4Ks45RgPHCu5OTg92hTnPYvFoQ==
X-Proofpoint-ORIG-GUID: uzpJkn0aoE65RVRQbymDCLsL-cM-7h75
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e4a770 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=maDFTXuAomIAUVjzP7IA:9
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uzpJkn0aoE65RVRQbymDCLsL-cM-7h75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Add support to export BO as DMABUF to enable userspace to reuse buffers
and reduce number of copy.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..63248c7215d2 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -643,8 +643,36 @@ static void qaic_free_object(struct drm_gem_object *obj)
 	kfree(bo);
 }
 
+static struct sg_table *qaic_get_sg_table(struct drm_gem_object *obj)
+{
+	struct qaic_bo *bo = to_qaic_bo(obj);
+	struct scatterlist *sg, *sg_in;
+	struct sg_table *sgt, *sgt_in;
+	int i;
+
+	sgt_in = bo->sgt;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	if (sg_alloc_table(sgt, sgt_in->orig_nents, GFP_KERNEL)) {
+		kfree(sgt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg = sgt->sgl;
+	for_each_sgtable_sg(sgt_in, sg_in, i) {
+		memcpy(sg, sg_in, sizeof(*sg));
+		sg = sg_next(sg);
+	}
+
+	return sgt;
+}
+
 static const struct drm_gem_object_funcs qaic_gem_funcs = {
 	.free = qaic_free_object,
+	.get_sg_table = qaic_get_sg_table,
 	.print_info = qaic_gem_print_info,
 	.mmap = qaic_gem_object_mmap,
 	.vm_ops = &drm_vm_ops,
-- 
2.43.0


