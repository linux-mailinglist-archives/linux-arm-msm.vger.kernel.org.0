Return-Path: <linux-arm-msm+bounces-62960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD0EAECD9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BB731758CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEC4242D94;
	Sun, 29 Jun 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8KtDQ7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7113BC3F
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206089; cv=none; b=aoTHfnnlbd0fa+udv1gy6eMF+8Dm80BygjgtOpURExvZ0ZnVQmd0RjMWGXfFHGhxOF7wU9GfrpKxlN66ZRMHToEyMFUivE3jC3Ifyoj81MQ96XIdO+lwGLNW5lfYdmNMehstm2rJDD2nm9xd6dmgx2mHjobYjJ7IVSKr/HXliSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206089; c=relaxed/simple;
	bh=VgCwVWqTpqRlfRQ5gyAJCTfkO3Reb3p+U/Zm/p//H08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Clo2qMJnVPGhN5QV50lYt8wn5QnKhNEFmkUx0JtBOibhQnLkQOVF+bydwc4JoJy6ulYGy9XJak+W2W5Z1Gf4NDqV3KujAb6qdFtb2JFF4PHU+gu/ap4s9nf52ct+AIxm2MUn/IVA7EChXRWR0bwpk/k9PINd57wg1yRwn6kudPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8KtDQ7+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAeHqA006623
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fDzBgQEKZYU
	G26jz6qIHJn61zKgVSXScxT3NVbL/LOU=; b=H8KtDQ7+cji0fJIzrUl/zXGdgqM
	brV9B5h7udP7kKwVaaeC/bphrM4sg6sl15tQaH80GAu7rg6eFeypRFlWOIf9ebYM
	VI8q/JIuiRZwZHtxAESM5XZZu26s+pqWR/QwA9T7YyNfrlBzbuedAT+krdxWfX9Z
	wCkXRR36xJFvREGsbAk5STh/F5a/o/C0WxYsQQcgrTquELfXXVwxAq1s8UWDgGP7
	LsO6HhQjm5LE0hpJuNM7fpyIU31ZSkkv1G6aBjTz5spAhQFhXVKKIBkqy/5Fwmxq
	CjfCXCJx1daD2hhSjietLeHWyFczxIR6cb3WuNwuMtbcIkt/loomiXZVY6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23827190886so13868145ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206084; x=1751810884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDzBgQEKZYUG26jz6qIHJn61zKgVSXScxT3NVbL/LOU=;
        b=NIBAk4MH6E8npPzCIUfGlkojbR0sE6EyV1bB4ovBIxIwM7Kx8mBIIQ6OyXLAIjAgTp
         VdpPcUmNy+FG6DtQ0poz+Mix2LMIjs491gLvqjWyr3GiiSeFi96yDNZfxS+TiDBo9EZN
         QDrzZ2NvbrdzkvZEYkP71XmPc4MEf9EJou9ydhc/+aEkS8yr/HJ3XfLDKejzooW4LX0b
         fS2MoXdMd629X+Lucu3HdTEk3bD0ACXWz30wmI6R/R6UaM0ndF+gksNeW5mxb9Hewm0D
         3VLfhiJ5m+vcOydeNwh+AK0m185BGW7WvahZoUvpgcikSSmSa9FOH5kl0M5k+lALyeFH
         gUvA==
X-Forwarded-Encrypted: i=1; AJvYcCX9PlpET0tZByDhqdhcgl10jR0+KC9p6v/ArMr3vMQF+CMH/R3bVIq4XRtiscRrnb6tG/U79vBEOqwTjOjX@vger.kernel.org
X-Gm-Message-State: AOJu0YzxtSkKxAwvMI995qgPfjI9EoUE2x+nDz4RUrdm8jRigKiEHhpn
	6PDMXv+IgMbRafy3uhvDLHUOXtpLFwP9Yiat6Oxoib8G1+6e5rZJly8A7ykFHAtCzozSe3xeBv6
	zxiMvmRT0ORguX8WsHsW9qnalrYfP3nw9cYc7AUebawz5Hk2By2xe+MMsLZS8Xmy2ECtC
X-Gm-Gg: ASbGncsYsvO1cWZVBCPMmxa9oPS8dGZx3od0xdLqW6Jmc7ZAzsQIPWyqy4DNnD1Wg1c
	y2aLZrbNQ7hxWyynZKrmpNqe8Sbry86KQFw1ewi4+0xNbEIwjU8pM4Kwet8VKGnN+XhEtBa1NZl
	CdxmD8fjEEoIuE42UEBmFQhtBRecDkKmjY0ZXu5ldM+by3QeIG/itMqT0psa2h/aCBj+yppF/1b
	NYlBg9EkeEbOeLKkpVTIK2lNUTF+uwYxPdpqK9SOB1WcrSZE7vxPcziqd0vlsuxZh0/4CIGLHFa
	t71i8OvE0eoqQtKq+2DOLutUet9IecNA
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id d9443c01a7336-23ac463470cmr169136305ad.36.1751206084528;
        Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkyc5NqpGoUysSULZkt4YI8T4ojjTyZxoY3YnC9AbbMNNhL19AVyCjD/gR1PB/UUJsbTP6lQ==
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id d9443c01a7336-23ac463470cmr169136005ad.36.1751206084070;
        Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeabsm57654565ad.159.2025.06.29.07.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Sun, 29 Jun 2025 07:03:33 -0700
Message-ID: <20250629140537.30850-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9tBURxZrRB4X
 T4QiS3hwVsVM4I+keUQbPfPzZlUCqKv+GHCe+pOpw8pqlOxO52/JnQ2te4xhAlK4mAqA0UzykI0
 52X0KkfvIsU8ry7zvNJrGON+T5iYPbjtkLcFZHqvbR1PStLpLKgj9X6xOeEvHDzAXykXaXWLl/a
 5XQx2/4c4QpnShM9fIFsq+sdu5nMnXhc2oIAChRb2YTxZ0b8yprh3zlPJcoPqeoBiccHtW26p7U
 7NwsnsUxckD2hPBBIhx5wz8RCVjBJejgqX4zB+725KHKHCHS0k0OI7xKGxeJbrehb9to0q/ETe0
 EjBTU3e9RH7dVFmTVsKdB46Vv6DV2/bs/nDTVytXugtugeiJLz/Q8goimefo9NCqAHIham7svRA
 rPalcYRcBl/pE7iYhQoWxaTcclkwKHbjFPjs7GsbjvhNxPXVl7ZwZJjqqu4u7/oV7k9Q4PeP
X-Proofpoint-GUID: RPsZflXTI2SfG-usDNwgWYhEjkWhy46k
X-Proofpoint-ORIG-GUID: RPsZflXTI2SfG-usDNwgWYhEjkWhy46k
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686148c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 100d159d52e2..b688d397cc47 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -93,8 +93,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -895,7 +895,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.50.0


