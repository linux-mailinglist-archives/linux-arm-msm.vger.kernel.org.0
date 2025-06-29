Return-Path: <linux-arm-msm+bounces-62968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C47AECDA8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CF2D7A74DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF31246BB7;
	Sun, 29 Jun 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N15+P78H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC45248F77
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206101; cv=none; b=jriqIFy2LElKQ3oSUDVqWZwczZhEytdizJYFEEIKlymE0qSDozr6p5DWRDMSs7uDuONqEYidAgzWzvbWJ/CJ6Kth2QCiJUY3Vx2hsErzmvTOP67TKMWqc0iVPhXrKAIG/DeHXdAGdNhse++Z3LHcifqohYSigXauX/LD67Vkek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206101; c=relaxed/simple;
	bh=gTdjIx8wy++YElnZqgMmZAa5qptcrzEPn6AG4VdQe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRxftb0+c6Yi1VxwxpY6EhjLWPM+XFlFlQ4E17KhatUNZvXJQk54l023wDcwCBW0Fv+xb76VqLnauLlOqSOpBShI2fkjnDo7hy+C1jNfHjm74TMupt82h+Cj3eB9SKaae+iFEBTn5XrziV5UPQIUF6zvSWKVM/m6Y/OTxHSq9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N15+P78H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCIgZS000721
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ufkxvlCaXqE
	+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=; b=N15+P78HFqJ2QDE4lj0Bqkg67/D
	C1V94pwkSemNSxnav6EC9uQNEn3T5V3CT4/rs5lihNXj4oSuN4423eoHYr4IVTVz
	yE4xRjsO1+Q7SOuXZxmY20VdxujXoUlj+kEqrvdiy/u80I3PSajyNStFuW8NxpqO
	hGaMCU+VUnc2MVaSJqaCJ6K+UOX8/tOHPo9KwyFTXNueddSWoSmBz6Yl544HohLe
	timFtgFDPhlkN/IRG+H7P7Dyxii9cXkLR4s2QTmamE+JDpLcgg31jcEtAqsr7f8h
	9Dw6UWpYHuYKoRbW3RM6pUdQ8KncCX9Ccz/5QX4ps8UIjZzasAl4fa/OksA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm285s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313c3915345so5324341a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206097; x=1751810897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufkxvlCaXqE+JOcTp0SgGPSX3GCc3cmG0IREiQb02Vo=;
        b=X45rPsZCcDsSL3uT+n/e1qZpWRHmnv2bj+qpwpztOg/ifXHwIg/c74xxTRpVcbaL/m
         Laa/eXcUUI0k+mORPOEl3EQfivnZfU7GruJl4eUOBQtLrJqdpsnOiXrx0s30mJr8vQGk
         ho8neFa42tVdPYETweOikXwer+3UMnlH6PWr04RjHwQur59MZK8JA0Jm1qKLzZJJPtaH
         glWTl2FV6USzNutf741JRVGEvSzWzaWzxPEJEKB4zwrk3eeI5Esyg3G4uNyN61KNKE5t
         hzuuYAQqyj6fXGNfrimW1U4GHX9+zRizWfdEL0kZFaAkzQfU2f4+ABVhqAYsj36SRdYd
         t3dA==
X-Forwarded-Encrypted: i=1; AJvYcCVQuqmsiu+FK1t+pmO7WOns5LbgxJ/jeCh5qkuICHDQ87W9uXM8TLYliuT0AWFmZydBLJ83ga2eLYkZtycE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0Qff2OWW9ffQrNlflQBZtq9FKfNkcOQMyJn29Gl7gANdImgV
	IOMqXS2HpRrOzWB0xbfjaHVcKykpe5G3K89BGU2ffG/wT87cqIUzTreaKfit0EKl0BFeuFsmiPw
	pXMNJtE31emUlFsrw48fuysfTB5itroNPOP+RWkHc1DBLjKpn3dfxHFxuMy71o8WdSOoP
X-Gm-Gg: ASbGncvPDHs4NisY0A6PY9anClPIF2oci1/ObT0Qew6kPTJFRoS0KA5yiO0jtk7zYMj
	n9WiAT5xdo3XPknc7jXZC4tyy9JHYPkkmZgqK5aP/F9IGcybGxxALM4HxUR0mqTOPfxgbltMmJG
	pK/0WsrzsG8qqZAmGtxQUVxKXWkhzcSJFWSmyD984Ykyu6DZjxdOH0eCG4cwqpKFLVLXKaXJzCn
	BqbLqQOjl+pDhUapyMjrOmxue1NBFMop3REIhEv44r1pt+mYHIQltkonSJjUoXxj/ZvdZeMCGUQ
	Ls2ntNPAsNi3YG/fJhNfd4x+bGQrKX4p
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id 98e67ed59e1d1-318c930f9c3mr14566749a91.27.1751206097274;
        Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJayQhQWhT5vTJXy0mRK+FWWNsp3OY4G0Nbi/rEwA8XLYXa5Wnw/fbVSwXi+QB7lNSjIGwcQ==
X-Received: by 2002:a17:90b:5347:b0:311:ba2e:bdc9 with SMTP id 98e67ed59e1d1-318c930f9c3mr14566701a91.27.1751206096824;
        Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13921b4sm6582806a91.1.2025.06.29.07.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:16 -0700 (PDT)
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
Subject: [PATCH v8 39/42] drm/msm: use trylock for debugfs
Date: Sun, 29 Jun 2025 07:03:42 -0700
Message-ID: <20250629140537.30850-40-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148d2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TglU9Ic7RoTCywbfVX2CZs-bavLkC2bW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX/1Ud3PH/9ux2
 3qVm02rerJYi7AxFFR9DhsMsg+kI09/cxi28FivGG63qnva5ZqaS7z7K+mlvPZvXRmW/BjtpfQN
 siCnwaxs9c1E8moc3+V/BclIDGiY4mc/uvmT2ulJCUHco3R+ICAEjFuiAvL7hnNZCAv3M5imv8J
 dF6d/VEKQT+son9GIq+c2cnu+m/D31fKsa0ZJ/aVfPAAqLF5zRBrYmO8zxtIU87XoeM37PNy/7z
 4+Nrk3ycXY+Pf/ODEJ9aKHLDCsLuEBSmpsMqIYOV1PdpF5TqUDt4PkfzhlfncaWSRLEnM3OgS35
 9BFh8Ermht9gBJQd4FAgITOe9xWpWXPSnzgi2Y9ekL42kM5MimS2Pq/9Wx1q/UqW0ZXn7NEYvlv
 YOSWU66m88pnL+jpbbDj2Ec08Fz4EVQbjBTfEfJ87/zQGFO4qEw6IcW5hk5yXgYVXEVq6Ujn
X-Proofpoint-GUID: TglU9Ic7RoTCywbfVX2CZs-bavLkC2bW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e3ccda777ef3..3e87d27dfcb6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -938,7 +938,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index ce5e90ba935b..1ce97f8a30bb 100644
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
2.50.0


