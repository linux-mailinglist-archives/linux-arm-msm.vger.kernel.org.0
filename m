Return-Path: <linux-arm-msm+bounces-76256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DC4BC2451
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 19:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BDCC534FEF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 17:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C8C1E5710;
	Tue,  7 Oct 2025 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CT/cUf4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406D155389
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759858945; cv=none; b=mhZvsqUsJkusTTRfc3DASghSJHtCfJRQX8bNL86LiSTDaeiqyP3HDz9VfQPWJncTNW165exDCURTYxs0YtMiuEHWVCWUM1t0M4jtT5McGmMg5NpF1te9MGUqUnyq5JVNfDOQp+66e8/YY5dFkoPWsndQSyf7p7w3Pjc8GQyZJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759858945; c=relaxed/simple;
	bh=pl0kAP1F3l2Z7gs4mA8JJ4dMGyrDIxTTWP16XVk3IwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VDbrMyjBEfn1QI0lkn1KmQr2M0LuXBdX8CshUVPhfekOcCZWFKkwkHHChQBmktWqB+T+RYV2TyZL6Zu+tN/8Ruseke3B8Z7I0MYD7eG5zzYTK1yrz6nUvY7ccQSIV8zZ9pczfBuvJOLSvGBiWat4Nbkrva9BXhMReJxJjDLa1WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CT/cUf4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET6KG029377
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 17:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wyee24WrVjcVFhMjw/FwWzhQ76MJ3q6OE06
	+avcYD2Q=; b=CT/cUf4QmhWp5E8vv/Ju+k9rJMGonB6z7OffDioGKS04Mh6VO7F
	wZ/NNLbAS1WvQJ99FWKiDGaR5UyJg7ZzHl91+ituRRJh2Pwe1++guIyBXVfiPoaZ
	98SvTR/1S8HOEHpPsY8ES3A8JZe/kJ0/rbJqIAUQifiv7KBRv+Flrdwyfv160qHZ
	MclszSlf4j9y/oc0myWVDXb/hbW1iQMccWZoh0H0l938om+Dc+vkXFUBIccCNuQh
	n5usQE58osCFtlxT9blruyIP99mkl0s5JRKUEyMgVHOCmkdbDCmLSg6dvHxLrF+y
	YnwagA3qR4tNmCIjFV1lmqcdoRw2fK6wQ4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkptxsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 17:42:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de53348322so258589661cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759858942; x=1760463742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyee24WrVjcVFhMjw/FwWzhQ76MJ3q6OE06+avcYD2Q=;
        b=BQiewR/6QxrJeIWKXezQAIX/StDH38KnlL1/3mlAtWT6pxY/k4vbD1SFqyNfqezTV0
         jeOVgIXtzU/90jHfbtdE9kpkMtLZrYzihcY7tIQpgcvOmaPOLKDV2A/P0+hgunqdqxLr
         5q13rzNmvol6ehExFpRP51Pac0kD9wjhZZsBwFrF0rLDbCz8rj5MF4VIsa8ARQBgrvF7
         2ACfetWQhIo23gG/WAVaFZ5CIngli7xVhbFxoYbXARsOiw+Q0LWjt48wG7hMD9XfrgTc
         nwRrNrqONbyofXM5uwKaw1ED4uY+0Dr+FU3rz1B6HOOGlGHw6dn3TUd3r2xbtyFlfLKk
         +mTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXW5DTo3LECq8/fHLvskkoNLRyXNfg7JyRFWs52cH8vZzKTpgw83PfNTKWzdXkhRIuTRC70DXGqhTTUsg3@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHbBsE7VPCX3WSdXN6uTSXHhBKrH7eO8IuegaIkFk1H7pV3Fu
	IDB0+qTyRlcFvjKxT/yzSBYHW8fGj+WRkgwPb8H8VHp8+BbmAoMYUPkoygtSbmfu3SA3cuzs7nO
	nOHetceUwvVfZ04eACSxmMz0R41vw1lXxcBIvbaFvmjkdWd5nmnBAKH8rDz0GGbaHwcWI
X-Gm-Gg: ASbGnctW3O46uWefzEGiRUYJHP+vYL3xkCurfUbum6h8kb4RBmd135l8oYa7JSuZOrr
	hWV5gnktVJn+NzBrB6tGW7a8LgbJMws1pwUTJNEBfierpDVccXBmOp0eE9qUVaavEW+xbzNShPQ
	bqRf/Ycv1fmAgaUB9kkqV/SiF0G31DtBB97koeoi98r42ukxMlWcUQVZEg41nnrsPs+bqBA/2sT
	bJcbu8hO9MQz29QMx2bgm8AJrERweHLPspUTdd0feMFnOEejyUBYsOZnQ7LeIO0JkJ59NjDe1yN
	mVeWLByhvfbBvv36xrlp9+dH5O9lZZyScAlis6pk6WNnYLk3Axddb11PODOZgzmQUZCTF07Yze9
	yhJD98Z43oA==
X-Received: by 2002:ac8:584c:0:b0:4b5:ea1f:77f4 with SMTP id d75a77b69052e-4e6ead859f5mr5978621cf.64.1759858941464;
        Tue, 07 Oct 2025 10:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN+OrkX5PkvcLg4ILXeqCV6PcawkdSZcDb1ry08Nud168rwL5N+vcwI1vQWZ4gau5HDN2Jpg==
X-Received: by 2002:ac8:584c:0:b0:4b5:ea1f:77f4 with SMTP id d75a77b69052e-4e6ead859f5mr5978011cf.64.1759858940762;
        Tue, 07 Oct 2025 10:42:20 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639773d4d8esm7043132a12.30.2025.10.07.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 10:42:20 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Use overflow check function instead of division
Date: Tue,  7 Oct 2025 19:42:18 +0200
Message-ID: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r7wNXqkVHWfTf7Ix8hPDhjeX09QK9lkx
X-Proofpoint-ORIG-GUID: r7wNXqkVHWfTf7Ix8hPDhjeX09QK9lkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXyDGIggK04rfu
 1xR6hVQ34AXXlgEjAYcuoXkQUh1xo48FB1VWDIJJpJ6yo1QO0KoQrUr2qr2M2y4XC0gt3dQrkeP
 e7/a3YHDn51M16Pm8vsTAK9UjUWi8EWytaY0QMj0a868YCOklrFLf+HLhdReLdcYELyBzYDaBLk
 DYlo1dsLCoF+qgTRhkyslyEnNDiXej6kZXX3rHyyAmQyb08qHJxJPQc57kyZmgq9s4Y7onrVXqE
 +Z+Jci1MSB5KnhohwT9YQ+n69EEr0WfOiz6HfQK5IueSxtQdGPeAx+0et8kYRkp0BjjdmfIxFIR
 yydihJaisXQXMm0q/slw2hm1VkYe9E9J2di0Tn/c5mChHjFBiJonNlYwB3DTbYuTNnC0LPLEDbP
 6TQ0olyRDYqI/L19jXhYsoJuEQ0ucw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e550ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fuhP_ZXRh-4HPPFbgo0A:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

From: Carl Vanderlip <quic_carlv@quicinc.com>

Division is an expensive operation. Overflow check functions exist
already. Use existing overflow check functions rather than dividing to
check for overflow.

Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 5 +++--
 drivers/accel/qaic/qaic_data.c    | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..7c809757c325 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -655,8 +655,9 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 		return -EINVAL;
 
 	nelem = in_trans->queue_size;
-	size = (get_dbc_req_elem_size() + get_dbc_rsp_elem_size()) * nelem;
-	if (size / nelem != get_dbc_req_elem_size() + get_dbc_rsp_elem_size())
+	if (check_mul_overflow((u32)(get_dbc_req_elem_size() + get_dbc_rsp_elem_size()),
+			       nelem,
+			       &size))
 		return -EINVAL;
 
 	if (size + QAIC_DBC_Q_GAP + QAIC_DBC_Q_BUF_ALIGN < size)
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..7c304a9e5048 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -953,8 +953,9 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	if (args->hdr.count == 0)
 		return -EINVAL;
 
-	arg_size = args->hdr.count * sizeof(*slice_ent);
-	if (arg_size / args->hdr.count != sizeof(*slice_ent))
+	if (check_mul_overflow((unsigned long)args->hdr.count,
+			       (unsigned long)sizeof(*slice_ent),
+			       &arg_size))
 		return -EINVAL;
 
 	if (!(args->hdr.dir == DMA_TO_DEVICE || args->hdr.dir == DMA_FROM_DEVICE))
-- 
2.43.0


