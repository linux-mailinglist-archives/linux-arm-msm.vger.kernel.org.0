Return-Path: <linux-arm-msm+bounces-81150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03630C49673
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 22:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8043188B2E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 21:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F412FF642;
	Mon, 10 Nov 2025 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmZY1rUD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyHEiRPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA4256C87
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762810172; cv=none; b=GfxmBSaZIZywviuWZrkOTcLn8pnFfEwN7btm8Er4NCcjU4QRWuiCc9V0Xbycwk2lsuuI/Oc2IOKyQ5k//6D4UR2XTay2DRUgZ7WmRHFUfhdJ5piC53qSnPIVSht/3yf6etPPPXNq8t6UxRw9NXy6oSeoQTue56/0kS+an2OI3Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762810172; c=relaxed/simple;
	bh=g+y6MSy72euGXPhtDEt4v9F2/OTUfa2+S7jFbeHaTz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tOMZVn0G1s5dSEaTs9i8wP/jAg8JJ9LtkPJmTcxRQlZNXqNrd5yNxg7dtoQwL7mSQTQGavyVrf1ZShpkD5m+mKRzoyIDTvqPToo6W7nsEcHz+sxvZ8cs2utlWEh9nyB3PrniUbTh+ih+JdcDbLFCkYpZRaV6tKSmG9AcBp6iFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmZY1rUD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyHEiRPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGs3dI2992495
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 21:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zjm8QOGOt6wRLYUzXj/zuV
	GSGpLuzn17DWxZW+DBPow=; b=GmZY1rUDXKZpodDpaa53tQVEKjvCp++ltB4StH
	KFPq4Yh8+6H/qMsDU+UMJzAep1WV13Fcs2+lbQbjZuSglypbxLGAYnx6WF4Lc8Xa
	clyRCE249k6cyq1dm7IIx6IU8KLGL24q7TYIS3ktDtZxgdG2qBfLfX4K1m2dDjf/
	PiYOkycWnhQtenTI3kLsMqP2Ltfk5XP4SehEzjqYY3nHUDk6ADBGJ7Ka7RQ7eZ94
	XpGcFxCECbeCnz9/t+ZdGs29TCQa8rN5D4iw3cg+78Au2QfPeW7MCKu9C9/yw2Mo
	imQMnZEcTHiYubEZACm8Fwn9AQ3Npdg1dwODKljeiAJWFliA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88t4x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 21:29:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956f09f382so1502145ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762810169; x=1763414969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjm8QOGOt6wRLYUzXj/zuVGSGpLuzn17DWxZW+DBPow=;
        b=RyHEiRPUA5jmjxjfW4NO51pJxA54xneGxbJDzZNyRXGMYm+1VuHpr/b13KHHdh9bXG
         OlnDFpJLrmIQHIFUOpGhgZcYmavQIW1AAVG7MksdwTw2nguMRslJMfAik2uAN3TwgUBO
         sjYgYd4taKz/GZHtByzj44PS89ldUYGUPulf9988EefqILAmbrdFfqFCdNdclBcqaLhv
         CXWbMyU8cHa28udnr0PJap+Pfs+wXLHF7cqjEvxojaZ9HAQkLvyXmPyXDW5Z3pTGBfLV
         89piYi4z6KgiWYFggyU+7PUHv50C0rl3qzpv+VdS+zH0pyYwmoVfOJ3d+RmhX3T+f8j2
         P8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762810169; x=1763414969;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjm8QOGOt6wRLYUzXj/zuVGSGpLuzn17DWxZW+DBPow=;
        b=PWTxhEzuLIytmlg/gG9ozQaonDLilLxlbU3caVRyDF+c+W/blqSVmky2I4Sitev7o1
         WXjZ7KVsBu33QZQhTc2pj8FboyH57MjiEYVxY3CPQBt/Chvz/G6e51y6VkEHkJPciL/g
         G1wKde3oUTHHdJyAy1tuzqUIk+bn5pIKzskq0Kw/Jmt26YXSP3JLGqjQfQOeyx0lWQel
         3nUnyrob4SeWBTqt37BSfTWqDcYJrx3SI+6IzQYBDEvgfjhhHJDzeLeVuIG2ty+fG4zH
         38qoaxafSzcWxJ1lnaGa3K7MYygEdbS53y9f0rsoMqdpH3a7GsF9599Q3WbeM7X07S/H
         Sw2g==
X-Gm-Message-State: AOJu0Yx4KsWJX2VFSeKCID053V36Xbt4PpYn6qoXk/v4vVULEAfprlht
	i7RqyWbJwt7y3EnvMCvsTc/wByOD95W3TcAQyF/HWkfcDghMO4x7ecBliLjr53RjCnAXZvYWjDF
	mUccLRLs4ZZPmlW7GpoW800Y2QJjniUie/IQTsoXa9fPWb72eBvdPXPyrKnZMHOIsZFw=
X-Gm-Gg: ASbGncvH3ZBuqeaStlLvdTMv68miVAtKCrWV6MnEh08NIunYdyAV07masWyBJWo37OC
	x9hgUxV5JebaqfgxVrzLB6LXpQzcgQ+SaLEfXxP7nQ0O8qhdwCKHprcvIj8zelu4VY+HU8mTnYf
	OMlAZ+wuSOYXDBwC39c6xKC2zPiMtfTZzUzwyVQYyEWKVVk/EnXQHBtudFvPahSYS22RrrVnnv9
	AU2lbkNJfKDe+c9yDMcwQSLSyAOOWvQFl1Ss9c91lywwsIV/iDEYiy3Y24DH7+t57/eetxwbBz7
	HenYQMO1sBvqfPzrDYpHYP0pBeBlYDNmkGgUMvi75b7EzCVH56gFbnUIu0MRA6RGjD7TeO1xcPQ
	EF5b5vRskRfv0p2+/a/kLGYoNRAYK08zA3g8vSFzLDZC+PbNI6Y2ONJ36xg==
X-Received: by 2002:a17:903:2286:b0:266:57f7:25f5 with SMTP id d9443c01a7336-298407daaacmr10730505ad.7.1762810169255;
        Mon, 10 Nov 2025 13:29:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIuV+1SxMchLbxTlgtjAKcFCy/+6NTWvSU6efADcUbKDtqkuQ+bij8jy109pZykyKrrcsPkg==
X-Received: by 2002:a17:903:2286:b0:266:57f7:25f5 with SMTP id d9443c01a7336-298407daaacmr10730325ad.7.1762810168681;
        Mon, 10 Nov 2025 13:29:28 -0800 (PST)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cb47dbsm156444415ad.96.2025.11.10.13.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 13:29:28 -0800 (PST)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 13:28:32 -0800
Subject: [PATCH] tee: qcom: initialize result before use in release worker
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP9YEmkC/x2MQQqAIBAAvyJ7biGtSPpKdBDdag9paVQQ/j3pO
 AwzLySKTAkG8UKkixMHX0BWAuxq/ELIrjCoWnVSyhoPGzY8iXDmB28TPfsFG9dp17dGKaehpHu
 kov/tOOX8ATQgbvZmAAAA
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: ejbpSV6Csw6viJ9OTYQX1tvXzTwf7cfG
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6912593a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE4MyBTYWx0ZWRfX45Ge+hz2cPY8
 RerNQ9qAsT09YHxUllBuG2Ebhlkkg+WUhsNLgQp6iRKma0mxKe0yL6cuqtFj+wgvx05UrBfXSC1
 UsN33hGUjWaZeASmNG9SXuPn+14agyDYZW2tuL99Z1iYYToOf6K5/SbxzO/Q+4YYiQ99cifXRwh
 g6WpQZ0oizkVM2ozrQlE1A8E7nHUrVe0+CKVz3dLW1eXOANJInkv8JyJa77qsr2QUdWDHj1o2cy
 y/7FPMaevA5b5YxROhFvXz3OlUCYH0iSTcEfcp+A+OSst8xCVnK5e4noOg2j0Wl0JRsjw6mhGqd
 xSzNvldxM2h9jfxew5/Qcs2NRhUAG0c5qNX0FzTwlj/9WyXt+RHp51TaMPzLwysVMu44hIAxToZ
 dB6JKTUg8TCzN5fu70B3h7m+AnBMqg==
X-Proofpoint-ORIG-GUID: ejbpSV6Csw6viJ9OTYQX1tvXzTwf7cfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100183

Initialize result to 0 so the error path doesn't read it
uninitialized when the invoke fails. Fixes a Smatch warning.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650b5@oss.qualcomm.com/
Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b6715ada7700..ecd04403591c 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -82,7 +82,7 @@ static void qcomtee_do_release_qtee_object(struct work_struct *work)
 {
 	struct qcomtee_object *object;
 	struct qcomtee *qcomtee;
-	int ret, result;
+	int ret, result = 0;
 
 	/* RELEASE does not require any argument. */
 	struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };

---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20251110-qcom-tee-fix-warning-3d58d74a22d8

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


