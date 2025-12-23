Return-Path: <linux-arm-msm+bounces-86325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D995ECD8C9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F250300D416
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6A6361DC3;
	Tue, 23 Dec 2025 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ryk9ZoCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRCKJ600"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B5361DAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485547; cv=none; b=ayOnVKXwqhrajdg97QhOIo+CkrZCK8Z/UUjIITqxEDheD7dIVtXUR7AzTDfiTptZJpHBf1nmMOrJULOgkilEPWBIP6rU5mjmiwknP6amT5EnrMCBNc32SnmB9/p9EBtDfa+RsSkHHQ3MqcwABv6TndmglIONg3Xc8fuj3lNNp68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485547; c=relaxed/simple;
	bh=zvRwX/H11Iw+m/YGjFcVcWQhb1l1UXWRA00BxzUNWsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZt+ilUV0vnhzYJTXczTkVDmYUOxsnM9EqYMFk5t89xCyutz4ETdTxra6ud/bM4Ci2Vlg3kXATJmvHezN4h3wg8I5+wzGhlko8BoWiMtsdDbxfKQQnDafJ6QVbf8OVNF/pdvLufxuEqJElfylD7SIdq+hOmrDz9qysmUlnq/HeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ryk9ZoCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRCKJ600; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4IdYr1902603
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+OR//hUeZB61QBkWqkl9LRR0ZX0YqPUetfS
	SzdnPBCc=; b=Ryk9ZoCL9pMOo5JmKb4fOW1rv03aWYfV/H5TdeSxOI8dQAw89pr
	vOoq/6soG/RJFeUk+zP0aZIbUUR+MpTlUjHQCU7yFzvfyhaAbNyMyoU5kZMi5Tfe
	+6l5zt6iKT0ICa9hi9/us6eYFhz717uC3GttRHsKgqnqKx2Ulij1QCrhi2xid4sq
	1TwdahMlfP7Iu6cYzQGhF71j5hKrajxy8W9gTAU+wIJ7A5keQ0yZLR7uc7R894oK
	cPgHMqYjGDrdepYT9W8+pDNq90MO2+2uKEBqvsPqFW4bMEiuY2Y3N6uwrlYhJnC1
	pA0xpmnW3MC8YMkzEGabxYr73eWKf6Et8ew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jnpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:25:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so137091071cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766485537; x=1767090337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OR//hUeZB61QBkWqkl9LRR0ZX0YqPUetfSSzdnPBCc=;
        b=bRCKJ600uy1xHA6XeHZrOfSIdI0nNgYD87rh0MFS3ZLj9OqTDTIzemOW1GplIaQBJe
         Ex0KHHH4cdu07NbS3lQxZzAtTwzUQq13p3ETAKOqg8oHWq0mpwQZH67bRzbvaJaHKJ0A
         HCPNkJiLMmRoG+t9YlbNHQnZX5ys/t8+vB//mkp95RYwjeVi/7whxb+UyECH77pp9dCh
         PNNuATPkRN7i+kz0UinokwFQ7pP78gSYfG/CnUYy7X4sFpfZJ4QSzlHQtJJ8oIB1sN5Z
         53XAY0/sNDy52kjkd3LPK58D5yjlVD7CFrJOQ2myW7izNV23vMqsXIWE/ykRmKIXltb7
         ZT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766485537; x=1767090337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OR//hUeZB61QBkWqkl9LRR0ZX0YqPUetfSSzdnPBCc=;
        b=pjFmQCo63QR7Sv2hIxSf8vbDe1n48CT1IRemyZvpzH7kaIrK9I9XrNJ7wjypLBUPdk
         CzemZsIfV6rpsFAUkYIeGTjZUxWh6NtX83vsFFifYholgmthIgwLLnwVh/jZC88XTjJA
         BAy0/S/eV1QaEPrW5thPOgDHHWkvbSyNFflcBCrIhWNgGqQVhlFiAeNQQr6CEJMFG8/7
         ZWhBXrJJsXwnvUNT4OJFzLpqXthNflMCIhCL3Tf8g33DJPLsZqzvftnN3PZ3b3IzDi6q
         RsHhSFv3WcZ+O0TB79OJQnsRKe+C6a3gFMWSLawnO5qYkWPZ0jECpIdVaWD5EL6zGRkl
         PJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe0MU5GYiPAQMlPj8np0W0OGSVg3sdo1VDEzMyZ+pr4dSzPdcomVS0A+SnDOrquxbxBqt2vAORH/TJkr7l@vger.kernel.org
X-Gm-Message-State: AOJu0YzvTHVO6GOPwKwXgy0sfOD/6m6nqTKn6c0pu69w2oQ6B2Fdd5YJ
	vLCCnYaShhUTI0eyfU2b88VRAoMPx4k6XCzRD05BtGMsf0LIxnK+n0n7x4cuC0Qs82V3v6RueOh
	q01B8ipCul20AiiGCsfZN3hx6RXPZxzjqAXVaIb4oTddPzTmIbXfMMteXL+zPRI/0PMN/
X-Gm-Gg: AY/fxX7Ngfm3fsjFJpKEJ66UBTVUfQKjVA3hYZAc5oDQgQtgeMuG5nl9R7apKtKRLcW
	4GmFFBciJevIHUv4iy+oWRV5uyTuDE2m7rpcRd+iIRHeus4jLj6vWC4RmEVWcBkmH2XFCyfDYbf
	n/viLWCV/11ltsocRwWhFrzNfoXt643eMGVLwXIT2DxbcQFTuRXFM+4m6IXA3Qpf1DmP+060Lgj
	0R95HU0s8cyiC1QpB4SZy0HxyUt5bKtkmzewKGujxI9Bt/KFxE1wKfdW4JCDYBzJfTUMrF9Y4W9
	yZuElPvEunZuDrFxkIORbxYj1gNTofmxUKtuY3XAi4jpdqDtcYLslK8x0mY+k33ShSxGTOKdk7L
	ZBoMTNKPydvKYvz0pLzgQWd00j9h6HcH+fOfTrw==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr217434931cf.48.1766485536805;
        Tue, 23 Dec 2025 02:25:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl8fPW7TNWQRs7Hu9zO3NdksfR56nD4abYcEDk+i8v4nEY+Zxs/yOOf+hsxqarMZlRi2Jbtw==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr217434711cf.48.1766485536444;
        Tue, 23 Dec 2025 02:25:36 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a204e9sm110489935e9.2.2025.12.23.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:25:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] media: iris: use devm_mutex_init()
Date: Tue, 23 Dec 2025 11:25:28 +0100
Message-ID: <20251223102528.14355-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MyBTYWx0ZWRfXysg2xgMou7VR
 UKlgBERFwE2jFaTgcEO5ocDb8UpUVn3RyQy5rGwYIQ9RBfl6LKwj/+DMtfZ0mQ27oOjHKakbng0
 EK+aeIyVw8zjxomRBCy99w1TMz8N0a1ZJuC9zTcn+k6m97BX1PrvGDc/kdFLGF/C8m8HMaujK+L
 VSN8h67+sw+ZOYDB5oBBq8BoZGUIZw3LdM/2UO0vKNL5VoWqi738iOPP/cf9b7Fz979oVS+aElV
 hzR61MMeOWXTkQ5CJb77+6h9lqyXcgOPNzNRJiHtY5Qp4wLFm8OB7HjCYLOnB3Zbfw9NIBu01+i
 HW+NBayPF/g8W0wRo0MmYwVJoaCZoGkaaTTF0kwxzlGrSOiXmg4jC3ZMDLOI3wf5E8VMs4gMs2l
 BQ8qFrlkLkiBjqhxroyBJMMZm5MQ+vJeLs/XwR8WcXFZFEPt37DS3kQjbBSjZh0ONv6w4MGwNfa
 B7NrTudtXgrx9sK5VYQ==
X-Proofpoint-GUID: GlC_Sy1oDKKJFwmVTiww_vhs28PcFGoY
X-Proofpoint-ORIG-GUID: GlC_Sy1oDKKJFwmVTiww_vhs28PcFGoY
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a6e21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QaAPo6qSa6uZtGOUjrQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230083

Drop the call to mutex_destroy() in .remove() by using the managed API
in .probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576..0a4e7595a16e 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -202,8 +202,6 @@ static void iris_remove(struct platform_device *pdev)
 	video_unregister_device(core->vdev_enc);
 
 	v4l2_device_unregister(&core->v4l2_dev);
-
-	mutex_destroy(&core->lock);
 }
 
 static void iris_sys_error_handler(struct work_struct *work)
@@ -228,9 +226,12 @@ static int iris_probe(struct platform_device *pdev)
 	core->dev = dev;
 
 	core->state = IRIS_CORE_DEINIT;
-	mutex_init(&core->lock);
 	init_completion(&core->core_init_done);
 
+	ret = devm_mutex_init(core->dev, &core->lock);
+	if (ret)
+		return ret;
+
 	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
 	if (!core->response_packet)
 		return -ENOMEM;
-- 
2.47.3


