Return-Path: <linux-arm-msm+bounces-74527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03ADB9624F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 16:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB1B2E416F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B37B23AB94;
	Tue, 23 Sep 2025 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOda4Zr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A197221555
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758636299; cv=none; b=gmxIUSC4oj59MtxcqLGz2T35mbB5XdMTUAVHy6D4dw6d3vH8z78XSBgd0C3YTRjrE5nvPZfVIBmubLJM42uve8VTQEx8ZViQAktbtkPCwJmZxe/tDa+PkUq26UKAgXxAaPpoDaSq0woTzqX/Qeh0f+bvULS9kL2RLKNaxGTGnQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758636299; c=relaxed/simple;
	bh=2fousLnzCI9SazH0eEA8Hzz/eK34wqY0cplvtTgLdC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exOROfoX2Eug2uEOF1NID7PJzxV/w5qqiCsm77VspZv7hVRi3LiyMjJhqlwx2hOq+1hGy6eAQrmehuQuSGZhS/W0MWTr7nyqXNzZz3FHPmek2JySWbc9rjgqkuNMfmFv/KEP1QXd34WZC4tZYDfYFj6IJ37mLnTsJPyqFbAag3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOda4Zr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H6Wn026254
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qF7JNnnC6auZa30uLt13ZSI6pihLUX73qMp
	x0C1fb54=; b=BOda4Zr+Z+o0FBg4piDvNbmefDrgjEeT2fGTBubRDbKmioOlKb8
	o5TfpFoeX070XHy9n41ON7M3QC1sGCjyCfETn+lH3ekRxxHKuSKtYOW3gZpAtsNW
	YMtocaj/mjwqoTxfHbKDYENh6a7KM6maUvnkWWlTtOAlpBYnC3O77UfO0Ti6zZOG
	Nnwh6MRZ7+wcMMA1i65+mc96kUSAmdskM7jNQ3pbJdWK5FOu3ZujvrqsQmb/8brr
	/IPvgpn1oB8Tvh1WUMvRvJs8puGsq7QU+/7smkLVrrMvWCO+Ti4uFMjIfP1CSehh
	vnj+s1BY5utHaJ3zzEVqSzNUAMCl1Y0JYMg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyes1n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:04:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso5432201b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 07:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758636293; x=1759241093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF7JNnnC6auZa30uLt13ZSI6pihLUX73qMpx0C1fb54=;
        b=qy6cKARx65hd6TmLEX0ean5OYv5jjrZvGw1GADC+QZN96sYgg9cOarmEZYWCUS0lLW
         1gWKZ7GHozo5lSzAKt4fAqcR8fAs3WQ8e4JM9uMgYKlYqV/RfJuh7BmWAorA9rCnq/6K
         w+cDzoq3z/NSPWJ56CXt6NIO9uSZ1W+Vjd1hAx7X9z/L4/Ydg6u1XfJhhtkgMSPNIoC1
         rk1DcGs6gG77DW7xHWGm24skqnC3o8ONd7/kkv/sczhOtNgDUYUknazUli88HGiEDO0t
         pnvQIkd3sfzhk/u9wcDwJ7TtmqENmeH03Y3ojU7G1Wmx+oGDBLpDfOALW7sQjEOENpDj
         JzSw==
X-Forwarded-Encrypted: i=1; AJvYcCUF3GFQS9XSDW6EtKQEnZCFkVl99RB5AmXZtwfL2fSZ1RRDZSMiqfHB+ArP2ciTuhuIZehycwssQj61oUwW@vger.kernel.org
X-Gm-Message-State: AOJu0YwDyaonkSVLiGjZP2A5qG3tb0rnoUG4iHq+ANBsFBvCZXb3Pwtt
	GbhGVA4c5cQ7V4gX/Xa3G4cBaxtm8ItWNedBSqgQq2SxcGDuY7eZc12zIcsFVwSyy93NDzCQMmi
	JEvV7HlcKKXDWEjj3C6iT9b8ASBrBD+1O7BFR2O2AASvraxJ66SpUWPvBq2tzTP52YiaI
X-Gm-Gg: ASbGncsQQeUmOdnYUtlZruMGdNsxerDeRZU1WRDnAVjs0IO7QBjn2zLgqgDt/U2tHNA
	3yW4GPn/A40ykCbFkpRSmSbAgA9ZC1Re1jEZ3wojcEZYX4hOzDqrvCHcR7lQ6XHk3Eye43aaGxu
	42wewVGTlifg9HXd3Y7H91dZc4h0fZjT9iotEXOtPI31gYeUuq1FJLmx/Pd0mcNZUk54QRtoY/T
	pUR8l5/rLSfQNen+LzeDe0SWAdO2E7sGSspTw1l58iAO1yw/ctLw5fpaRUlBWLZh3tsvGCcyxCX
	48Gl32E0zzW3fHhOh3d2gfnf8ScPzL0LNKbJnQWtx4sT0hshSMM=
X-Received: by 2002:a05:6a00:2389:b0:77e:eb28:c59d with SMTP id d2e1a72fcca58-77f5483555bmr2964424b3a.5.1758636292695;
        Tue, 23 Sep 2025 07:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHriibLVf2iW30g+eltTQYpwyfphiwc7EROq76RBdBzt9+tjnANNboDPlS44Gb5y7K/RblhCQ==
X-Received: by 2002:a05:6a00:2389:b0:77e:eb28:c59d with SMTP id d2e1a72fcca58-77f5483555bmr2964368b3a.5.1758636291921;
        Tue, 23 Sep 2025 07:04:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2deca77asm7401739b3a.98.2025.09.23.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:04:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
Date: Tue, 23 Sep 2025 07:04:40 -0700
Message-ID: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w9rNzbXgNYDWi7g6cZFe8gIelbKV6KA0
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d2a907 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9zJA0kw6ANc6jqlDSAsA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX5HdSiytijMxT
 pXnq5c6TQsp5Ngh6WoodB4f44yKtYSNvqSfgr5/3Egn/HAcIJeiMnTR8SXAkI6nCOR4cnnQB04i
 jsvJGYUVruxYLQ2/d5Zzx3uqIOctd3utgWT1mUaNBwnDaRv9YOwe3CZEWl+oqoEgTh5ybpNoBLe
 eDmbpd/qvSSG9/nyW9Or8l4J5tfb2NRjPx7jb57X3vEPDeGjJX2VQOSVZfCp0pUqo8Qe671zk4a
 4CKml/ZPT8IdzULg9ZLpvsGx4zFQqnOTAlIUFU48Ya+MFrFQt4ws6qNV+1iyTSJ2TUtIQUVNxAo
 hDGpRpmDNJVLCEf0QvR7S0R6kcIgr6UACAz0y7ABXfDM6U8oaoG6XETQR3w7dmDGcyBI3aARDML
 Xda5vK+x
X-Proofpoint-ORIG-GUID: w9rNzbXgNYDWi7g6cZFe8gIelbKV6KA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
check both this condition in addition to flags for handling the
_NO_SHARE case.

Fixes this splat that was reported with IRIS video playback:

    ------------[ cut here ]------------
    WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
    CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
    pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
    pc : msm_gem_free_object+0x1f8/0x264 [msm]
    lr : msm_gem_free_object+0x138/0x264 [msm]
    sp : ffff800092a1bb30
    x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
    x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
    x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
    x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
    x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
    x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
    x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
    x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
    x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
    x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
    Call trace:
     msm_gem_free_object+0x1f8/0x264 [msm] (P)
     drm_gem_object_free+0x1c/0x30 [drm]
     drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
     drm_gem_object_release_handle+0x5c/0xcc [drm]
     drm_gem_handle_delete+0x68/0xbc [drm]
     drm_gem_close_ioctl+0x34/0x40 [drm]
     drm_ioctl_kernel+0xc0/0x130 [drm]
     drm_ioctl+0x360/0x4e0 [drm]
     __arm64_sys_ioctl+0xac/0x104
     invoke_syscall+0x48/0x104
     el0_svc_common.constprop.0+0x40/0xe0
     do_el0_svc+0x1c/0x28
     el0_svc+0x34/0xec
     el0t_64_sync_handler+0xa0/0xe4
     el0t_64_sync+0x198/0x19c
    ---[ end trace 0000000000000000 ]---
    ------------[ cut here ]------------

Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9f0f5b77f1bd..3aea9b493375 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
-	if (obj->resv != &obj->_resv) {
+	/*
+	 * In error paths, we could end up here before msm_gem_new_handle()
+	 * has changed obj->resv to point to the shared resv.  In this case,
+	 * we don't want to drop a ref to the shared r_obj that we haven't
+	 * taken yet.
+	 */
+	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
 		struct drm_gem_object *r_obj =
 			container_of(obj->resv, struct drm_gem_object, _resv);
 
-		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
-
 		/* Drop reference we hold to shared resv obj: */
 		drm_gem_object_put(r_obj);
 	}
-- 
2.51.0


