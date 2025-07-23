Return-Path: <linux-arm-msm+bounces-66353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E50ADB0FB7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D6911892F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 20:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C6B235076;
	Wed, 23 Jul 2025 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOIBXAyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F71233701
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753302515; cv=none; b=ClDZ899q3uEKgrynWhRUF4g9FkFoUyhXMUeLEVuJTYnNxQs8gqJrC23KPsxA9t7RdDA5+UJG+zsKan5nq9MfYbseEJcFRdvY8aR233VC2H69fr2gsnbb7IYP3AnZEixJXAhnnY1cEFI7eGq04mUA96THGpTnBtVwMldI/PQcADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753302515; c=relaxed/simple;
	bh=ni68krQ1ZwrRugsj/OAoNsJ3wM0hzLC+Yz9N/TufK5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUeY9CANiNXXLgpgZIUJ/C0zYADQLyJ/FwGGo6XnNgORM6aSkn3lJWh+c+EYQ/SuOfVfIT98JM5J0aYXuvlBTPF6fJVPSXAI8vidq9qvkv6+fzce56CiWs1vW0LzOTnRHMxgJaiox/Ec8QBavUgZ3mEDsb1/9zL8GmBm+WFxsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOIBXAyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH2IEJ010846
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=go4w6pisezM
	+fmrLJT459t96/m/WbzFkmudzTaE8Fpo=; b=TOIBXAyunTGCoyU9O0+JrziAopK
	PRYLvkqmUc4pYsmtcy8e9DIZzT2sFMbuODU/dH6qrA8bArv2OaLkBwrp6CbT2s4O
	ZDF1kSUtaKWmpXXPANSLKjJ4aBWWuE+1z0y2ChxaawQa0D+Q8a+4o7Mfjz+j4oHo
	VGI7CJ2BFfEyMbhoecKf4EyFA2xx8yocvBB9H7GdUKNuT81cTfKkeqbeJd5G5lKA
	KSdGYL8eFSSbTX5Vua7p05Btr8nXas9/aoCseiWKxpY0IVCILrx/a4lMpQRiv3j7
	H6DFxFoKfCN193E8Istnf5Tun0tSFeKGc3P8HGFiVfRiKiI3ajsKjywRFVQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na4x6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso231459a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753302512; x=1753907312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=go4w6pisezM+fmrLJT459t96/m/WbzFkmudzTaE8Fpo=;
        b=BD8cJJkpd74iEg6Ourj46FCGY9ovd9xDCL9tjdiLi2EkNGCb5kYtsj+vciRkYkKEJ5
         1AKy/DJh/S8gFVSOZgCggY0a0CBs3fvwWGObkPnZBWZTdRV5icsIja+8s8sbEQZpNSL4
         3Y+aOdrmmmfWIxPInmtQ8FsOFcYTsGT1QmDVphVe6aki6JpHDmwFxhcX4Nx2JiOkr99d
         VvplyCiMRkbGcP5vxo25axOL2rCdHdbk8LmleLVS9IzFKPjwbvEsXoMzAT3Vug7BRpeY
         FBZf9E8oWsyxnDIS+3kEm5It8MBkWm0dZeskeQkGH9eokHUK7/YXnodsJ/uPWjUcIRUL
         CtEQ==
X-Gm-Message-State: AOJu0YyxRhCcbAyCmrW+RGf0YMkBjgz+wq2/wB79ATfIjITXkbRoeyYf
	n57zw1PYQQyE+7r8mSwTJMNDk8FUFp+E3R5Ut0Bcs0lFHdiuiVBniV6cMPYs8xoxbJxfsTuEUMi
	c6GFyGLUK+0T2ZWsTuj2Q8y/EfTPL/1OnYqI6YbiEe95my2AsaD9P3gMCLArONff4L8Se
X-Gm-Gg: ASbGncsff3zWpkHrn21jYf2kcobYXmMeW37rd5yrmw+5cZM6jpJCEa2tFDl0so2chnH
	4u5SkDF4K3gueNdyibGM6EYHuMgYHP7XAdv7QXbq2pgHENSsuhtaf52dKTW67nthH9rDnEiOEFv
	Yr3R7p2qmUT0t4VmO7WG2ym5fp/LvYS+kbtJ+kwSolQeaFDR0MqiIi1fxFSzrrkQpuGFdZl3BLJ
	KAOx1ZMJvld/StO75dOT9SecUzzncdbGp5RVtRtelH2A6EMix5vFYD7EmRYTk0N5B7XuYl9kIvt
	det3YSpV/fmAFfeF1gwpYc5jfEVNPQ/Wn0gzgUMNR+k+wdqMWVM=
X-Received: by 2002:a05:6a21:6d99:b0:23d:34f2:3a22 with SMTP id adf61e73a8af0-23d48db2762mr6286122637.7.1753302511941;
        Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8VTSyv68wujrKZl+LBtm1rzipjAkQC2pZQlbR1Bf3Ipp3TNep0+rs/9z89WCJhtGvp+l5RQ==
X-Received: by 2002:a05:6a21:6d99:b0:23d:34f2:3a22 with SMTP id adf61e73a8af0-23d48db2762mr6286089637.7.1753302511486;
        Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b05e4029sm21283b3a.97.2025.07.23.13.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 13:28:31 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Defer fd_install in SUBMIT ioctl
Date: Wed, 23 Jul 2025 13:28:22 -0700
Message-ID: <20250723202825.18902-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
References: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bvExZCuScIfwb9WQCowki7WsFtqbegO-
X-Proofpoint-ORIG-GUID: bvExZCuScIfwb9WQCowki7WsFtqbegO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NCBTYWx0ZWRfX5inFGxrwHoiq
 G6A3kv2fxoyzx6695dn/e1cGNLCb0jtdyd09k6WM5F2nYZBfdGfF0soyCdzlNoVCw7qO2y/b8yZ
 bc5g7yH2Eui9uiTO7r5E90wgXsz5zsgsGAutlV53lQvnm2iGp860pafR6XMqt7tB13tgbgeO9UP
 CCyYH/Yf6RqcTZ/Z1syaJvXjukUFSZwJ1MbYbL7+ixjTZv24+yw2JMD5vGV6sh7D9zLQgO1Jb+O
 X1Nao5/XqulEUdeYVDxpryipBuKEjmDSmXbmGROct0gQGJ/2dgxEe+TnqcQiRDts+4MbcZwTJB7
 JneWMG/cjbDoR8vNj7oyD/0wodsTTboM9JKUzJOA6N69GbIWd6IvKvaFsyVfwvBR6VR0RfT3uht
 VHJISyKBM+SWkDDOV4QsSVU6mFTKduP5gYRwejtoaKZqVMr12f0oU89ppAFGrwcvcJAuJ/Gf
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=688145f1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=p_L9ESIXKxyW_a9_XK8A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230174

Avoid fd_install() until there are no more potential error paths, to
avoid put_unused_fd() after the fd is made visible to userspace.

Fixes: 68dc6c2d5eec ("drm/msm: Fix submit error-path leaks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 0ac4c199ec93..bfea19baf6d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -770,12 +770,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		sync_file = sync_file_create(submit->user_fence);
-		if (!sync_file) {
+		if (!sync_file)
 			ret = -ENOMEM;
-		} else {
-			fd_install(out_fence_fd, sync_file->file);
-			args->fence_fd = out_fence_fd;
-		}
 	}
 
 	if (ret)
@@ -813,10 +809,14 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0)) {
-		put_unused_fd(out_fence_fd);
+	if (ret) {
+		if (out_fence_fd >= 0)
+			put_unused_fd(out_fence_fd);
 		if (sync_file)
 			fput(sync_file->file);
+	} else if (sync_file) {
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
-- 
2.50.1


