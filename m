Return-Path: <linux-arm-msm+bounces-66354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E9B0FB7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFBB8188799B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 20:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B752367A0;
	Wed, 23 Jul 2025 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4pcGcy2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4223506E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753302517; cv=none; b=QBmfBcqR54ozTl+BPOY8E/dEjQY0v/FD7mRX+2/JYUWfNcBcuj1FK5rV6Cz5AXCCtD3coq+60uTWEwcgLTVrxQdCj7pFKXGoWqTZBd2R4K2RYzVbANSwDGdKqCI5NRLZAQwwODB6/qNZzd5lc9EQP6YEBMkMYDGxb41p9tneWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753302517; c=relaxed/simple;
	bh=FX/3ZHFv7wjTbrH58bvhZjQXOS7g8qWalhEsIqd3tM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nabd83qgexFBkOKRbO632HcpY6ETCzMUuHz6gJaDa9aTetnLSTMeGQ/kHhlZmb57MgEJq7RY2Q9lYOIOeIouo0BEB4sYdOHDZnMT4HCuI9o/yu59lfKJI4bteIOzbCWY/Rh/BnmTDK2f60UnRd4wT9MMISiJytW6evfHWIc/sBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4pcGcy2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH9EtC020004
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jg8G8kDUfiO
	0QN87d8Nmg8E9KepNpwzJOvRP22Q1Yow=; b=b4pcGcy2lrUKAQy2I10T3RvGn2b
	t+63HpxKZk9yhrSZUeuy2/3TlSqrKg2F+1OnALf1oGJQITkXVbZqIHDxbPCwySwv
	UmDVq7/oRsg08WoBQe80b18z2Jr/jVYvcgFVPnQeAGhljqhUK/B1eIsO/FKAfWvA
	0mYzny++ay/+Npx4rD0mGYKnlXoBJym3CYwlRgzXuhcWmxSU+pqlggkzM+k5bd3U
	AVxtjyZ4eyzypCIivqoymC51gqJc98wv0UZrnV2EekeDlRxA1nNdxIysNB6yf7RD
	JypbIqfiJajwQRnbQ4DnRP9ZekRrrm8Cvgha9DdMKH6REYNVOhH10ZjZ6yg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3es9ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 20:28:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so168339a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753302514; x=1753907314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jg8G8kDUfiO0QN87d8Nmg8E9KepNpwzJOvRP22Q1Yow=;
        b=uVKBTdgkpd+tPn1vCTekfyaD3dc14C/Y4Mzi+d9uzDjb+8oTVIYkPpWsqhEGaJO4Nl
         ovMYn+Wnz4DAiIrkpFNIcLscxbO57OHzEbrqfS4BhNDuux+hE5MpY9nxrSRFImGRn4jw
         eTRXo5M+v9HgzxEhaUmhkMZp6te8IEghx6dAVtpLJdB1IHN6I7y9OKpndpx34uWpGbsi
         1v8tUI9Dae0ECqAX8ZQiAymN3gjAXc+MMTwAo9tqJUIdeb3tEVf1cFh43Yg0U5IrxEXF
         txXYkd7bjIo7COnCqR8oS1kcfUhDP1qQV20dX+1ZMAjQpd5fCVYGax2Tppcr6fJrfJoy
         +34w==
X-Gm-Message-State: AOJu0YzZvqZvWTIQJopg9CYe52bZuHlHU4zKymWgf/xIyU93plJcVN4I
	zmaKE4eBCAUYwoqrhoXv0NQDZdHv+MIt/iKkyt1o4ut2CfXQ6EV8WtaP9U4hxDSgqDgcFD0CuJW
	solyHWjOHx4HThLHgGfK6d05zXwbVvJ0gjb4Ugz1r/zDXFY+0euzTudaZ/BviKVY+OQ2K
X-Gm-Gg: ASbGncu5CzyD11aFfN6nYXPju/ja3ktrpEjy+TKWX7I30icrDT2vX/PHidDrv8RumbU
	ZI9QZ5xYR4gFtbgUlzGmcgHHcNI09uJlLTPuLAVPkaP+szUNbgNJC3PC6ZcP/5qmSOwUXpmQitG
	urEONE0TSkeQaV1gGd0opwsS5FV3mB6ASoqqpHmh3zMwOcEtmYTfwjGeBe7KdO2ntG/Ca/kxTfF
	OPIOXg4QrF/p4d2uSkB7pTFM7Q7yYjcYyB1biFtYxW7hlnGC05CLWViWfOshWslQODXw1z46etu
	6auLN1lbXRHLgFNA0mDz7RnTMv3PpQTX2y8jLqpCR1dZ2ejsrio=
X-Received: by 2002:a17:90b:35c7:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-31e5073f550mr6078147a91.2.1753302513766;
        Wed, 23 Jul 2025 13:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK5Ovk21o1hIxl/7WYP8zrKYd43nYxItlCMNkL0IAMZTWY2Xcbzi2QZeu1m8gPG607xMRIxg==
X-Received: by 2002:a17:90b:35c7:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-31e5073f550mr6078124a91.2.1753302513335;
        Wed, 23 Jul 2025 13:28:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6249fe9esm80462a91.23.2025.07.23.13.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 13:28:32 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/msm: Defer fd_install in VM_BIND ioctl
Date: Wed, 23 Jul 2025 13:28:23 -0700
Message-ID: <20250723202825.18902-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YgA8rmUjfTrnbh_mTorh2mspCDcbhWMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NCBTYWx0ZWRfX6ySsI9CYpXYG
 HrNRMAQUoqLRT1vWtTQp/lYwso7lUSyWsnd89T8DpOtqlWOP+WuqsqkgTaBffGVDzXYiD6STKU/
 RkUTEhPlgeNXn+FeWzozSZa7+dkZ/yj86wQqdTv9N5DT8ypRjItMQFrhLyHLrfXoXK9OMeeXvXV
 /a89VwO7FvEcdyDNgjrn+ML1PjM2PJIWpXaR1aBveSaEQrlUxv4LMc352xTKGwgVVicGK4OXzXm
 kt2P7+9i8yYNBut73VaHb0PkoMBIwHPyvUO1zeeMEP1rgbOM4QHP2R6BqrshdIpjhg4kF8KT3p/
 CeuPThg0mfzojiEzsEVnnn9fTr00i3GTiTig8ER0Ye47IccAMDAtO6jqvqNn5KlkNYpCB824iEA
 6t3MZn6u8BLQ36ddNq8r+RtQ4QuJ8vhLrB3byophbzSR/SqLVVqF/XxdKlcuWNjX6Utl4ELV
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688145f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=p_L9ESIXKxyW_a9_XK8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: YgA8rmUjfTrnbh_mTorh2mspCDcbhWMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230174

Avoid fd_install() until there are no more potential error paths, to
avoid put_unused_fd() after the fd is made visible to userspace.

Fixes: 03b6becb03c8 ("Merge tag 'drm-msm-next-2025-07-05' into HEAD")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index e5162db436a6..d4b1cfb3aa03 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1473,12 +1473,8 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
 		sync_file = sync_file_create(job->fence);
-		if (!sync_file) {
+		if (!sync_file)
 			ret = -ENOMEM;
-		} else {
-			fd_install(out_fence_fd, sync_file->file);
-			args->fence_fd = out_fence_fd;
-		}
 	}
 
 	if (ret)
@@ -1507,10 +1503,14 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
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
 
 	if (!IS_ERR_OR_NULL(job)) {
-- 
2.50.1


