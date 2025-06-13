Return-Path: <linux-arm-msm+bounces-61279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D3AD98D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 01:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851E6189DC77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 23:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB0F28F519;
	Fri, 13 Jun 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYcXUohV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43662E11AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859034; cv=none; b=VCS8WjlBhPURiO+SZ63CsjiFkN1lrsr/xoNzMfERkAfQDsGkln6RQ2Z65cfqZZU3T3aDdM0N+Zgrh/9qmADPuhXhsvlOFEZPCeF8zfvCdJsoy2G/UKcwwaNKlDl/ZL93q6QT+6b3G9wkE6yr5BzMjYqwKIdjKGdV5xdX7GJOruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859034; c=relaxed/simple;
	bh=zNB5ffXRLwWFyZW0OnYE6qGfnMgP7l23FYbHK7hDPGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2wEj4JXShQYVzgyQv2CBSNLGFfKMW8h9cqVARh2MqQbKXJNnSCDFkEN/wO1LtWREjgUFq/mEaszwN6xh07XfugLjKNT0c9epVGmmPZpznyBvij944WC/z0avhjOYOpOpDqJBUD0UV0q4Ta9cBeJ66fvGAjmZKxi9+kz5QlH7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYcXUohV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D98GO6009036
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+
	3AnuH5Yc=; b=iYcXUohVmqKL4uIdQlfsFSW8Sg28c4PoVHPpLqQ3WfbpCs4sso2
	ZVA8whL039C9NKvi0KGXrQQ3A9yCoT8n17jBTaNz93gDBOn3HZh+xp50TPdMcFmg
	Ab7mCELdJ2eeXCDeTep4TvOLi4U+OR75Vjr8f9gt/foxBvUIm31+E0/yD6LvWQa2
	+yjJVMP6z5UK/9n034UMhC40qKjj18H+St89RtznmcbtG2/nnRoOa3BHGJ3vtLK6
	HNETvXQNa3Ct50ItH1EhWQHB8P30yCZayH3S6MF9NLqcv3Orkg6tVqsk+wVUfAFl
	3lCe4LDU36K77zrihXYJoZ20rNqRU9AEDBA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753c0gsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74841f2aee2so1530026b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859030; x=1750463830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+3AnuH5Yc=;
        b=IaTU9yJvDRjf2o1qcVRBVbjAWMtrNunnaMP9rL2ufVr1oZyRfx4c4mirnetR0utvWI
         rpta+myhPZGCAVKpfmgrhWs/CiT8IvSSb9EA8f7djYKV/nwJ0jTYYRmljzSxZXL2rOsC
         MmYovzogMrzmQGm/Pq8NY7lK2pGZKPlHW/V0Nxc0QGEiPc+SuIk1yWrznZkWyONl+0sm
         4lbzhqrp9zJc4DlBdqJKzZ6Eg4Hbn83ZwgSd15BQq3XNynxyepY3HqRO5CnXAGug+ZXB
         MKHu+Ev8IjV1H195xQcSr69v8VtGRlFu6609BHX52Bs8IOusHgOhwHhzEbdg75Pr4/TJ
         l+OA==
X-Gm-Message-State: AOJu0YzjtQjbKV2d0r9hg5igbmuB08nxY8dxmd9Je2KrEolsLzi48cVX
	Pf24v/uQ3P1Bt1eUD7UDoBkMKyVB1dnq9YbLEOFQyhlMF6AqX43GFD80Yx11u8cRd8Pbr9uz+u0
	nuo/pWfIAwYuOUBSeAAJ0DE0gK1oB/FfndZJGNKmGWK8wvw2QTxBkS39lVTlDMsEMMJJW
X-Gm-Gg: ASbGncsRxVI8Tc8Gu3us5wCdIGWCJ6ABisriPDL00lnUmYKG9CcNC5ONSiEKj48pfw8
	zyvSLuoR+xhfWV51V6Uhp2T9QTKdj89AUScfHKdovoGllHtKwtZY1325Io1oweiStZvhx7TrJYR
	1Ko2e/57/G3pkfInT9HskcBMfleFnlunAkZ8SiJr5ShXrwML1AQzNAIY7frncvJGMKvKAmBnPoh
	KMYkjKuxz2F9kXdlgbEehpCHc+CwSWXiqan13E+APk/d2Xb3vG3r9LGPfbb+RqXU68Q0pC57j6t
	RDtjpvAAWcRPOVvbVflIfyvSlm1Z8I5a
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-21fbd4ca4c9mr1765504637.14.1749859030156;
        Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnJbt5NIgLECytUdxWBytGTQ51ZldvE8PCrvMN8X7vGLEoCu4MjtZ4dgCdy6WCUnaT8c/EOw==
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-21fbd4ca4c9mr1765474637.14.1749859029726;
        Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe16432b0sm2384679a12.24.2025.06.13.16.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm: Locking helpers
Date: Fri, 13 Jun 2025 16:57:01 -0700
Message-ID: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfX5eq3Kx0MvwRi
 oPFFeBIy+V1AhzxeI/rEpHwCtFdzciIHX1WVz0qOGXVJnWjIaYLYISauwdauAfNxsv3TafeEnlK
 iLhTHD26C041msASH+rPLl/bsetGc3f0cixrM99/7bz8KyQLMpCLzwbp+TAON2LnBFVs7A9DYv2
 3/pLrsbmeHtmg+nEj8EHYgmcv2rL+FMFGHniZ6kAxdv+3PNFjhTmwFRcDJm9VJXLS2LUTS7p/kX
 8F9UA3FV8Eya+7k6EpJNmhOTZrfQNlYkkMSCDKg5QEdMT5AUbynXjlKdp8J+ef0N1AenpJwWvqM
 UUcicQ78QOE9HaT9oEVjdhjZVZbu8QzUukaDK4jx5uNmRfAcmCxRdAmyJhviP9AvvtKsvqJbfaM
 VyImNOiT84LfX64r0Pgha/NPxnFOzr4nGafproz5R2Ri4wkBunzu24JG3QN7YaA1tVuMLFGr
X-Proofpoint-GUID: 2x4BBIOGV4d5P9Q0Kkgx-IsSfQSOc9PM
X-Proofpoint-ORIG-GUID: 2x4BBIOGV4d5P9Q0Kkgx-IsSfQSOc9PM
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684cbad7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=aKBb6tC2I0So4jIVd84A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=888 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130177

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     | 14 ++++--
 2 files changed, 95 insertions(+), 6 deletions(-)

-- 
2.49.0


