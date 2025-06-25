Return-Path: <linux-arm-msm+bounces-62540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C0AE8DD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548D3189FB2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63042F4325;
	Wed, 25 Jun 2025 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRxDIN5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD0B2F3C1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877947; cv=none; b=n5w4NCCK1iCU4kf3HwB2gfUBky1eIeP103tg/1SZzGSd3x8Wm5lOCEzHIFByeNmQ3xFnMDxRkNGno5kjIFAimEStAyWgl2XgblQX+KJRWj+lnP3/Y7OfRyYXkKT6OCRNgkJEaPI14lg2+JKsb6U9nqeqAJnUbZgIIbtBik9+oEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877947; c=relaxed/simple;
	bh=qCbhnRnuW+mHLXXemWgEWHentAADrrysxUd/juV5+7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtQE7c6jvO/sZdwvYA2W02BXa+y+e5GJCyMCNhAKFiaFjn3BJKjYhvlmxZW58/R97QhJTMjLzwja8tQwM9sWLHEhSGtkI9uDMSfEiBYX93n+6PHmDNwn66tQJ49xZpo4WGql7GPkLD5pqZya/aOARZEXeD+CUQf0pQ+fbJIJtx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRxDIN5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDPelS027443
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
	RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=lRxDIN5CicFLvLQrRAk+zyEqz8A
	6Bio695kpwmaahDHWQb9FMpv74R8pYMWJNBM5diCBFMy8GeNPuE3kqB+ixa8vYrL
	PcYfxYsKNVtsmA7bkbTHcfO3X2M7dlQtvQH60b61uLGpVogpZNB8ldoBYIcvY0Je
	42bSQgYy7HODZLu9I2meWiO4nznBoeM8Z5uBubThjnwyVomUd8UWNVC4kUHJz7/R
	CNAE9OP4oNdBUTkSR/VQzZ73rneRyG5TjNyC3D6mZldqv+yBi/+0UoELQWizMXao
	QVG7S0mBKOksR85YPgImHZCL8ujBfXD032PwwzR/qDqxvPd+TMyCZjZWCwg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748efefedb5so256310b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877944; x=1751482744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
        b=T8vaBAzqjTUOxZH8YZmXEfn9ksl3hxfNLc34G6T6fTNRWpcC1Jy/mcQECM+AKAWRIv
         gQiOF27GjqXDXwMh/63FALA1HLD6pPVeFF1MvDMfjZ4Nl3MhWqUu7/0gRpfhIuXEYXcJ
         FwHZs+Nz2O2JDZgB9maOpcRlN86/u5adkgS1TctPsxKbCASpNMyoKeOD9doTMvueL0CL
         NfpX7v/E1T0XC1f01Bct0ZEZktEAMiniV7LGsCmr7LqWHeHWKi2aGaJFaZQk3CVdZliA
         PSbtAjKMhvLfx3whc8H+DA6kMEfyE6DE3R4W0geAeLdzdHq+nGfY0hzsGvIqqRa/HKay
         Ulug==
X-Gm-Message-State: AOJu0YyqRmJBj3Xkqjscn1991xiczAUI7+/xzszU1jroO5MEEe9mekoe
	i/jx5r8ekyYbgnWDxpKKEBcP+oFb4phx18MWAOM/IGHmi1kQ06j+2vkpAFYM4OHnicXallps4W7
	5mhx43wNMArIqwQz3P/03xQT51dJeODZXXjB4AYhWMar8b0khoK/kxQHC6UXya6b9AnpR
X-Gm-Gg: ASbGncs6h15TCOAVq1UxqApIupUyo5vDGbU93Ji7UWV7L3NHRnuneWSMn/zMA3ebWAV
	Q9/X5wXQqV9kfO1sZig/2mmcMGTjB/ShmZyrajO/TFjC3IQMm1Iw/o6nwFUhH7fvuW7z/NDcJ76
	2tlQLt/8g5wO5g3NFpdCgdZdyYRCbfITOsHWk4wyhsjQKQR0SyaSDQ4NPlRpYQGGYf39zg7VlkO
	F26FItDsaGtQ1ES32vgDDxxJyzG0X+Q45M2H8EenT1mQN0iSEuzyVbmrO8SKclow/+GvIf4zQkI
	weU5AEHG6w5sMjw+bBwplFUlGvx4xOIa
X-Received: by 2002:a05:6a00:a92:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74ad4500c14mr5889491b3a.22.1750877944379;
        Wed, 25 Jun 2025 11:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv/fci/aWABQPqIxId1qt4Av5ksAJmltuRXsEkge7A5PTFsk2rkR0SaCYSvzUz9d2gs7rt6w==
X-Received: by 2002:a05:6a00:a92:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74ad4500c14mr5889456b3a.22.1750877943945;
        Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872c7fsm4943244b3a.167.2025.06.25.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 28/42] drm/msm: rd dumping support for sparse
Date: Wed, 25 Jun 2025 11:47:21 -0700
Message-ID: <20250625184918.124608-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46f9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: w_4wY99BDAncGvIlEArnA0LQCK7_yRJ4
X-Proofpoint-ORIG-GUID: w_4wY99BDAncGvIlEArnA0LQCK7_yRJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX/MdtVAumZXwg
 RxzxJjXqbD1rzOX/AeLAAs64SFjBI9TcGPb0GCp/v/M9+dSuZSWMsTRMQT8dgiszM09FLHGTL6S
 OZn0hKOFuz5Pp3fNMYjsaCGXQp1A10c3aHkSV4u116ubl57FmR2Uwdb9Y5ec0onICJMAtzspSOi
 3TFO5lFd/kMRRIDAT5tomnXZu2Af1dU9qgQvDi1VrYjgFTfVojjJV4Fj3X3zqEt+I5QBD5Si5go
 gJ5/DH/Uo4gIZ9oECmbuXPCMiQ2Mb2xb5GmQpw4pLq3gXXIaaojLDINl/5PitrwW24tUhpjsOSG
 L+JscE9mfPwh0zk77TyTJqPgdlUEXOCaBQ4kx9D102vaIk9c+dS+j/mO2ZOfzoAqOcYlzL7GEp2
 rn9t5EQBk3EuXYG5WArcYa8zvKjRNLRy2Ik3rpUgwR7w/aHMvANJRGjeHAt/ouuND8H5oVr/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.49.0


