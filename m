Return-Path: <linux-arm-msm+bounces-60394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA1ACF718
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82E187A14FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AEC28468E;
	Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCgqBwvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D1B283C90
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148383; cv=none; b=FtJeRlAVO4GvlLbg9D3IXTOgn1HltPb9ek2rW7aTlSPX79Q2mbU+LZVX/hLyO7k05N71/0+zCR59HOobqLNiO6MsUKU1VBL7Hf8eZ09nPO/YvLwI+vBERvtc57xcTlXf5REO4M2RGpG/LEBkcRLiMUzZGM2LcIa9XHcnBKepFbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148383; c=relaxed/simple;
	bh=asg0ofK7A9j8GXUsqP3RShrmeE25j2whkBS5nOJbEJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXhfjcdGeht91V/3iyXMO87/JjoPKfZ+sDSU00mnHw2pynuGhk0DMr/XpehkkVjHzF7vsBiC6LXfbmJ2C67g35GGPes27IXnavhYI8ZcZj8XM5oSVG2eBIUE/6eWqj22Zyvlc7bQpa8Zu7V6UPAJHCrDFAiU4D0d7bRWVjX/Ues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCgqBwvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559f4Rj012952
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ffdUUPweRzg
	vpO3v9DoMvCSyNHDyemApNNm03T9kbrM=; b=nCgqBwvcddObPEvajmL7730nKjU
	/vphKVp4/wfzO9IZG+mUCSlP7tSU3GaTGt2ZMXBkf7xHGVtxhVEtF/0DmdxQIz57
	XY35OBMcI5sEtRteJjWr5EYXSSJGDNe6bexcOa1MpqCEaQrVMFpBjmAdaJvHSBnn
	6xseS24P4kwMN42wZACQ9HZS+39/zL7cFBtbpTOJgjnhzWDw6VHhAEdtb30p4JV7
	o1yVwyuLt08w6dLObLF00I0yThX/jaQQqt+/FQ6zQ8trW3cQE+fwFyhBQw89b57x
	iMbDEOEk4jzepqsG4HjCxcEYraW6BdMpUU5rQYkb6/CVQMRuO6sN+ZMnuuw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wg080-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2358430be61so11042305ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148379; x=1749753179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffdUUPweRzgvpO3v9DoMvCSyNHDyemApNNm03T9kbrM=;
        b=IcTqjGX6ksVByIlmbMJ3qF23Bo00f/6UngLbG2oLNSkV5lb1U1h+Sqhq0oU7T+4HG2
         qxv/3Ze3RZxJjbVIPxTOcxLMY3/RLLbgMaZjuHAlxi2yCLPvLVTKLWKvHYM9E69xlqNF
         Ox45w1bZnalx4Agf63HkqxcI7cfKJyVPngWIMhpX6tgWVw1eaYtv9kWazzm1geipOybc
         Sk0Lw0UceCKXW2SNdZEERAhPZa/0smT3BpZ/IwsFVAsHJjHyJ2eUy66BfaQENHgCvkKQ
         UEjNTvSaeK04+Y7NEmuLpPpz1Sl/CTXpg9d9rzzPpAN+HaRtMpDk+At+/PUFsNu10hP7
         nFNw==
X-Forwarded-Encrypted: i=1; AJvYcCW9wYcIrUuBcYUi936O7KZz+ka+MYRW0juuGBq+NV9+haW5kqEq9Nipg6We7P3prxm1gyphpgi2ph0iDx2L@vger.kernel.org
X-Gm-Message-State: AOJu0YyUG9oOpFYjbtm9wLJ1yE3AwdTdQm4+3BUwFjTOBA1SHMLt74tM
	iTKFC6oPFzMTGtZlm+Dji+Y5k3LdVsXzTANGbvzxba8MvHwqOAWj4eW2TlVtoSEweL90lKVZcmz
	XnEX1fOeUYtVlJ2GIODppnU4kDpXd/xTjwvWcmtIsaLBncv0iO6HthEOUkF7P9arfawcz
X-Gm-Gg: ASbGncuArYh2f6Rof6tjg8digThQslcFBYf0muyURLiWeAbfrP3bL2yQruZ3dLVyFXf
	t3F1j6mTpbLEV4eNl/hPskfpMXpVl3TPCsNLMKnXWo7j66nDuIdQpBxJsGX1Q+xpZLLWy9da8Gd
	WIYoXqOKZubjGw+zcSbsJaZFhVe8eE72NZQnNlBOA+D7XscjPjfVzAsHF1f5lsscBeKgJ7hsEgT
	112pkDgxS7p2qle0CPZXeaYivPwJx6mUqcQqDKUoRrH1hKEK2Q3fLnmdH7Nnmh9MFs1hrFB44nL
	IYrPFvQNWaWjX198SvxVZw==
X-Received: by 2002:a17:903:8c6:b0:235:f55d:99cd with SMTP id d9443c01a7336-23601d04741mr5714525ad.9.1749148374199;
        Thu, 05 Jun 2025 11:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5kPTJZ9p7ITwX2L2PkFEST+pWrFDoURTl9jpp7xvKlXfywvcT8Oeg8Fe8Ntp7oh74HigMLA==
X-Received: by 2002:a17:903:8c6:b0:235:f55d:99cd with SMTP id d9443c01a7336-23601d04741mr5714185ad.9.1749148373797;
        Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd75f7sm122855085ad.111.2025.06.05.11.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 18/40] drm/msm: Drop queued submits on lastclose()
Date: Thu,  5 Jun 2025 11:29:03 -0700
Message-ID: <20250605183111.163594-19-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lOsOkQgEm-H2dYRslSSdNYlL1o9uVw-c
X-Proofpoint-GUID: lOsOkQgEm-H2dYRslSSdNYlL1o9uVw-c
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6841e2dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX7AGqUR8nMjYG
 H9+TwOCmdOJM7GgE8MxVZYuKy+o9PFGm4PURw9zfEfQL5+oXP3I7yV3arICG6D3gd4T3YdeeOJx
 ufQ5SlqAfEqcW65qViLCqbNkj2n6cRm+qSKlY5lr8Z3Q7GZxDgiCJWL2UVFV/rnuiCD27jFyqrk
 JKMXJUxg9SxPP2md6IVhTpdMaokk6c3uxebjF6MOy2nn8iu7srm7w30eswLrCnyoImp+q4BYS4M
 CNBZOV+6V7OBxbhL2mXkHX4ovOSNAKYW9zjeVCPZuIhArEoK0ymnLSrQp0cSyaJsjrxu9n6Kcnv
 VQlJdcuraBa9LaHe22kY7SYEEAbA5Tg2Lq7dpCauIzt7pGscN3c3v2XcImceuSHQl3Otw0SiJfy
 OfqX7i0ygYcv8ZJbOJITUX+CXfHlpZLcZGs3fXpRHnzVy+NMPMWL81VhoLnlTS3raJgKDYDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bbf8503f6bb5..b8bcd5d9690d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.49.0


