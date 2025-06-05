Return-Path: <linux-arm-msm+bounces-60405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10897ACF736
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E536174640
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D34D27E1C8;
	Thu,  5 Jun 2025 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT7dY6ZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612EF27E1D5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148417; cv=none; b=Y6z709Xralv7H0D1byzVNCnTXRsE34BVt1sVbRI8OTlV91BL3U1/InBGh0G4N9dLZzuCVogLV7mxFqyyF6NBxlwJX1Q6w5k3OJ9SDLnYbUHyqe1VJP9mXV1+dNRDtiH1eVBNB+LmtGtATkoSOjY9FYbvmKGw7D/iBhqJrCL6/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148417; c=relaxed/simple;
	bh=eFxBT0OAg7rchLVBxX/NKfn/olJKKvoe8oSOxRdtsVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTCsMja2dL6GFZjm81rEfnE5uigvGL5HZt4Wy6NyOLIUGdLB2SOiMKoYYbT1sho4CQ5tNUeT81ceGF4+zBNl+hZb4ewTfANRDwbzhEeGQ/WvrdJX63VNBSz7zf3rPprGJNEnKQPpvfmCSHXX7KGZSBL6FZ2vUYftvf8d63MXiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oT7dY6ZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HIVBB013476
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
	9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=oT7dY6ZWx7dyYOYToij2tW+L4Oj
	09gGE9IIAf8cZNxnCLF0QUnYTrlfQnMh8kPGizzYBkugN3Zm843uF8xj+GRE2oVW
	2A/H0ly2shTaTL+Zlhy1GsF3L3CcAcQnJFHEwzOitJIV9513TwkRQZSkuMMV5/HU
	ERPcW9E+c3VVSG2WXVKvAbbc8/xdyYzioCL58CUkjmrPCwjojKGewmOY2g81Wo+M
	jdRg/on3fMHpD7FCz3yi/5F0jXLEGh1F9GUaLlj9Z9wANRDmq8uQZCKNPmbROQzz
	bpeUj9CmQCl1TvDyjkl1mDmVc7xjNJACsVF8Qy4JgsOvWjUFin1WMgb8n8Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nta2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747dd44048cso1187359b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148401; x=1749753201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
        b=lshXZ0D/qgS5afNpA+5CBxtoeFeF46GPjkoBbVQTpRPiBJg8QY6UNqYNUNNCk6glJ5
         IsdDqbayeRm1JlEdbD+5HQM1sqQrxhM1+BHH7M90gta8Jv3cOa4vHfnb2Jhqkpz/KJAN
         XL9wgAzO0/vvyNS9oqORiCYmqFa7R0GRvOz/boFIYilUei0/pfBktaV/oRgQKBjzDwjb
         7i4Fg8KebsfOpYy6b/QRFpPSBqNtLUTazBnu9qFKq3d0rSI2Mdk/ha8TMhLTOM3BdIsH
         ZhCxJIO5WFxmvjwDiUL4GGXdiPsR+Zwl+sCtp6szMxvwO8A7fzIuLLW4ZT63KaGypWJh
         PBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP7OXA3Klp3zjgli9RUCG9F6GBiS+u57wYFb0poM+CveiWvn9qaAauD+QAQQcw5beRdPfrVHVKiL0bq8Wf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvi18T8kZlkVbq+mJZiPVT0T6TZw17VFjPX3Btosra9fAlfD5P
	vTQYSKeA0M0hQFkIBEQYvD38WElagCo6oYuWc+HjHtfGpBnQGBUVoqLW+Fdt4W47B3RMMC+Epq5
	PabHGudqCbw1PTCBrtBW9gUuiAD0DRSTDmHai76TfGNh/lUn7GskI1Aw/qAE06mT97iCG
X-Gm-Gg: ASbGnctAptVOAvE06nGlTBuzG84hqGaY3u9Le1fiTygDE+gzK/zT7yJ5egS2gL8gYfl
	7VRgLKeePqfxneLo41ZPNF0a6E6ycGKqbBowJ5L16A0fgUtXUjvoKd8PSL8TV3h+79Q0SWBVAJG
	sAlzhc210JjxwV8G4LH78u5CkCLjypJPsmU97hamOlxk2VvqVujTFm13aCTTNxJ/KJlKtZe3/fp
	ggR/m5KLWLh6FM33tb3s5a9szbChP/W/LFKp2fBKPVzs2uZVOwdMuc14h8ci/P3Q3KufW/X23bC
	K7NVwBOXt39kv6g1YjFr3w==
X-Received: by 2002:a05:6a21:998d:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-21ee257ac7fmr368472637.20.1749148400881;
        Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv2c+RdwYHEoeR38pw2sdo71gINKvZO5oyAxjTcUM0ezUYPn99pL8wCFAVNClAdFPkoX+B/A==
X-Received: by 2002:a05:6a21:998d:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-21ee257ac7fmr368441637.20.1749148400493;
        Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f668354sm8116a12.42.2025.06.05.11.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:20 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 37/40] drm/msm: use trylock for debugfs
Date: Thu,  5 Jun 2025 11:29:22 -0700
Message-ID: <20250605183111.163594-38-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6uWskpdnhb7QgZRotdGfrP_03B8Eaqdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXw/Qq3kfMk2+n
 BUejL3Fh6cv1p9QMSJFKjUVNAPA91hqOA3YGRvsPxKZe7lovbnH29bTRBDvc9UikV/OHIbf9TlP
 e4JsMpRZ6gY9rdZWM5Mvm/2kezLoz4N2CjhH/GJsHhE5RbD4aU+dblKA+dIh2GGzmu7rT/tSe5H
 h0VmKJlzpN98Zq9aOqe5ji/1mHA5RP1MSIl3Tdc+t8hJ6EywgarEYs/hb7yU/Ikyj0LMqDhkWa1
 aMJGU43d5Q0ktp3cc4/oceHknQphJ07s+OqCD8QOojqADhBQrAnDg7/DsYDHhx6SfTRioLWRsS3
 VHeICt3OzZjFGXC4cORO/SEo0L9nfzyEwMZV4zIgRysmKdZqilnE0CxFczZcOYp5v3XgbyGcOR5
 XPGVkuiSPUl2BplLHWfb4Lv3UTLkYhQPlg3S/3WIbKGX9SN2Pov6nbVNlpNqE6y76sie8CEG
X-Proofpoint-ORIG-GUID: 6uWskpdnhb7QgZRotdGfrP_03B8Eaqdh
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e415e6e32a59..b882647144bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -946,7 +946,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 57252b5e08d0..9671c4299cf8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0


