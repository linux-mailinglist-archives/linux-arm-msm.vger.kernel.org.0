Return-Path: <linux-arm-msm+bounces-63011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E90AED0CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305A23A7A31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A0F2580E1;
	Sun, 29 Jun 2025 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEYYvRIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37325742C
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228216; cv=none; b=VwGy+TrLj4u8edjp5d1YvhWgeX1cZxU9yI3ElGDZ4DmKs43HWqnS6bZAmk225AX4pGRUdafz+dRFz4j9gq3m4cMV9nJesGwIKScO2OuKjdYMNRI0jcBH0FJTzbmVC9lxzOIszeAMnF4YTfvzW6KXwrCkw2zSUwcQbDwPxJrToYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228216; c=relaxed/simple;
	bh=Xrr+912y5vNYEYCSiqXQ5P/O+VoEFsvl61K5HGKqAeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evzI6FIvBYPDkc2oXfITtHnzZqfldyk8fkXmBDC6dMeT2b8HK3cYKbs8Y+fyXpjO601yOLr3h9joHOG8Q78L09Cn2CYosNTKmDfalS2yY2pyxpJOA7M5saIv/gQWuRkaLbdpz7vR1E9QVvLZIRr/F1qpwe+aD9FWMUWC4/8h4Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEYYvRIg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJOCrL023324
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/iFe2vNrJqp
	a0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=; b=lEYYvRIgJ/c+BzHgUGEWGBUactw
	3eZJLwb+PAuIaqgaRr436pNFshpMcEnkTbOPxM17OBCArFDyCQuWtEgWNPMllkk0
	iyakN/9IpTVaPK7Qcf2nbfKs/XwlxTQj8SEUwv4Fk6TIhiPV1ZipG77FGKATDpPI
	/+u2zu4yFg/I9/JXACVNZqEwbCGhkVHrjSpsTHlTNDWEWvZIwy/uqCq2L5Xgun5h
	vUZql0vbMSKbZRDSWXJclHDsEEGUrmPE1J4YmwGE/kj1L+ZlsdqFQjX8N/bocez8
	milxFHUbUrn6kUZp4hi+eVy0ddKW4BYYVZtCjQUTHHqvp0+8CR9zaoKdCbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ajys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso1629218a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228211; x=1751833011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iFe2vNrJqpa0S0dcdbvotV9UbXoILAtHKmoL3TqRPw=;
        b=fOXeIIKmC7H/9VIWkbI70ECe2KqVAFeEGeNoA5S55/2BUfY/CV7uEpwqmTyVW4VzNA
         qtifDkG0+JXcy9IcHszdb+JaXe/hdYml4dG6RCG1vcGoCI+GctmaBAaGZ3JVK9L3jiVJ
         jr2NnXKeUNBJPQt+D197pw407tuZ5RTuNO7NPDiEfL9xcTZQCUUo2bfR1oAoWUsdgbac
         b1DKuLil8yQGBsq0+zXeTwddxaWh4zsZd/oDZmVp0ClK3JGw3355E4CtPOnvsVah+f3P
         M2RP1Y0GgSRAoNnryv648W66SpqD1+TjSVfDIlLJAmhSos6qmV8aZX1tk6T7/FoyhhFu
         7Diw==
X-Gm-Message-State: AOJu0YxHJ4a0dRsiePLj0YLAS+cfCt5Mu8wo9yDR2D2nnufsYvlcd9Zw
	Qj3Zfdlw58/rr4PemXuByOYdHLfYGV0cOXS8IgMA1sA4+aFwlA4hVXbbbC2b+rM37VSYn4XOSFn
	gSdJ4dYt76ovmgQyV5oM6oAHMV33oBfBFetZorUv5wg6OvARYzSMqVm6YHODos3GwO//0
X-Gm-Gg: ASbGncu+OcrXFwXqNKzfKLQIWZu83qoNt6CSMB7RxNGsKXkej3JhJjS9W6k6nl1qvCO
	w0c1SFjvsqw5T2pXQ38UorRBIrFUAg8TJdgZq/ZTAQ/+UI8jB21LnhXeT9ja5BPpOU01QXcf5Vg
	MkjPfJbYC/r5IsYlmwY+WGTBXJvX0g5cVcLjvyQTx0hDAg5Y8IP+Zb64rveh7KeGfFX0NxW1L7m
	3CPjNqhKXosNyYi/7kFFn11l15cvxfjiwAxc9QwhnRySZW7boZMkWDYavCsXS1PjG2iN3reBoOZ
	5ee3cAEHHbECqBvykcq+B/3/pbS9NtmORA==
X-Received: by 2002:a17:90b:2681:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-318c8ecd239mr16401482a91.7.1751228210965;
        Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGajrdA6tIMydlgInm0aLxoXdGIewbBhz8hKgUeWqXuQe48LacCfrSpFmOEQkovD6sQvePVjQ==
X-Received: by 2002:a17:90b:2681:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-318c8ecd239mr16401441a91.7.1751228210493;
        Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c5a8csm64859905ad.223.2025.06.29.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 23/42] drm/msm: Mark VM as unusable on GPU hangs
Date: Sun, 29 Jun 2025 13:13:06 -0700
Message-ID: <20250629201530.25775-24-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f34 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DhdyfM8_h7Qj4WYt2N4A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: aeH4PvJ0rHPjBshLQqg21sSHBkuhBkJn
X-Proofpoint-GUID: aeH4PvJ0rHPjBshLQqg21sSHBkuhBkJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXxiMVAGl4w+hx
 aAnB5kF80BZAcP0g8lBzm5rCaNi7U0odjTsl+Ii5/MTccRg8vMi3T36prig+FT0lkp/UMQL3Rjy
 hqi5z5/RI4Wii53aNg2VjrjuJvjb8dvhDKZ5r6iUxbkP4YE3PU2Pa/GszDjJoaaaUfVzO3ypdny
 MJbZ4JozXZD3WrP+xahFrAFwsIl8SO0SjCMC1AjPbN0lpiNoK1pANA4ZHAHJ8ERt5O4VQ9JVSQo
 Q+R6l3Pjn+T1qBGzfyckxyTUh70Y8NLD3mxVamYpFuB0bcUCuUJmBSw8cDzx6dcAtpuunhbLaYc
 x8g0rC+G1+m2/SsTRZXeUihktAzmAS5dNCoqzqCw5XXdWqeG3xYDscZrf/6cceFHKtIxU2nHH7R
 HQBo7ELcp0s8cUPh5UXFDAMZkZ+1R2QDkCv+OC/UP+wmnIL06V22tBPO57L9+YNVcrBaVlLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b5bf21f62f9d..f2631a8c62b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 068ca618376c..9562b6343e13 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -681,6 +681,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c08c942d85a0..0846f6c5169f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -389,8 +389,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.50.0


