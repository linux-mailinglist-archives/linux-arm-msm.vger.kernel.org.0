Return-Path: <linux-arm-msm+bounces-78338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8FBFC6C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 549F91A06899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65B584A35;
	Wed, 22 Oct 2025 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6NuJbze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4D26ED28
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142572; cv=none; b=flV8jbtPQgF3STqDZwS0ewodnybVMXy6/iyBs/E6n8wEJsrg/uRcW3lVa0/DJLC1MByOnmgwd4Qk/KsWPa6jss13A5e4QNLE32dyb97vAsGmxnHsnuCAeux0d0y+8k9wdeo7O52r/XHuJSfCoTE0+uS6F8NZc3XmfweRjMZ614o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142572; c=relaxed/simple;
	bh=qxtafgdM8klMYYn2NHfFsUf4KpMGxlR4zblqOzUKm1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTdjZujuUUHj76YVzF2lUx7civfGzU0PD9mdoRje4Xyo5pOppV+ldQup8oddys8tt+1dvirPQ1UHJmrWRxPoC5gWCjY0igyvCAZ4VSXHqNQPvE1gRmzBT90dh0PlOFMwwoVEq9RJ97APRUG5VHRDVzaRNV5Le8CCEvcCY6OcTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6NuJbze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBwV9T030208
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zSVmBGXhp89LLakLqt63pmwsBW5eaBUwdfU
	ubrpC18w=; b=d6NuJbzeGuRwEx5D+DQ0dSfBwqu7MitpxAnOaIig2TtG1eaoXN6
	YhZW2P1WQymi9rPl/ajhMhAk6FSWpermj+WTT5GybauA/91sx6fyW/yDW9e1f1I8
	oEmEQNaKOaWCdcO+ZIn5zYLKHlA/RROsmgfqDt05n8jlo4AQNrSAN8cs5THG8L3j
	XnGcDQLjHSUI01dtVYcJg5GzchLWaXtMO6k62akzKWpHt0PoKNVntNmWLDMh39Py
	446xVKp+yd/9mG00efBNaoD0kHW3TJKvhACaT/jPnbNg7oQm9HMHzLU5r+OxZ7eS
	9+bi1U2hRclVX/zeDbZOIQlYf9DQ42hECSQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge4vce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:16:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-556fd0bcc47so322973e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142569; x=1761747369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSVmBGXhp89LLakLqt63pmwsBW5eaBUwdfUubrpC18w=;
        b=vstQjt+S0lJt0ky5oElk5EqHNVtvyCGntbqvW002vxZPWNn/Roj4adgeZOB34V6lR9
         KIo1ipSXRKcbBUq+v8Ztkxqllcrut0ucYwIQIHvVkLg2Aul2dn7cl8uUekFmGeQ3GQ0j
         Yg6KKAw7xhBMR+3fMdjg9/aKpyGqZim+X3i4FYNewaqXilK5WSi0OQCq+QcuMrrb9lFx
         wtvBj5IsDxn/L77b5Kfr0532jn97Z4fgVA4QEFegvgsYV+vPught5BzX6q28yhL9Yk/C
         iFkljw9IYSPVbkmMbYT/xibkfzgiLrim0PKCY2+Z3vUQHeuO/ZF/RFXW41tofzpwCNM2
         rKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUahaWN2BP2SuC+YUvYa1NTZTu7+RCoyxi1HDFQ7sMGF43hOi/2f9oVtyoBW66n9sGsOR+V18dKRhafspR0@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5L2YpF5MJ4bZmhI4rgOx5zzpAFN77j4s+5IkNlBMVOfYFOFj
	R2PC8lkK3LoRZ7Q8qJiapsI0HuLmrheE60uwKWIG5UqDfhVnyfWoMfE+jYEYGrqjvZ5AM7QoJz5
	FEgW2IsuXvmkAYbGhUFKnN0aV3jEoTmhwXCjAnbC7loF2SpjbaFgsPNKMDaWPyyX84cL2F8KQR1
	9rwy2+3w==
X-Gm-Gg: ASbGnctUJjltE9xZzFCxyW6mW7Kev0ViSkSj90zzOOdpvzbaMa2dt6MtaFxLkRzQBKx
	/s6i2FqmeJV6IkhcOLdid/1s1G20w5Jbc5727jVcAeTqs/iDab4t+98g0W6khWmk/mh12yY25Gp
	Vipd3rbisFnyNgdAMueQ30hGRuAvjqd0FNoI+yntNqKr3U+cytKrpUUvKBeh/ZVNxC7UMCuKZpl
	GmYpRgr6gs1DR9m9m6Zlllro7JAoE8V/sg708hR3NUWAwj1Q+R/JTdx2+zsSdDf+Kv0BJ6L1n8U
	6ACCjqYMMLEkL+igzf23eq2pqamqymX4JOA4SfiBuuA8pXQlMKjZVbQ34htkByGElG7URhCYdmw
	IZe2+LlKfzkyquOfUCpMjWIGFwEYblKT3pgEI00c=
X-Received: by 2002:a05:6123:e:b0:554:e726:7818 with SMTP id 71dfb90a1353d-556a1e67ce5mr587396e0c.2.1761142568489;
        Wed, 22 Oct 2025 07:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNbG74qQ/1QqT42r3mAqC8kCcPXgjlYDbBT6zot0YQc5vXp2D139VS2lNTvrDU3pbAJuVRQ==
X-Received: by 2002:a05:6123:e:b0:554:e726:7818 with SMTP id 71dfb90a1353d-556a1e67ce5mr587323e0c.2.1761142568008;
        Wed, 22 Oct 2025 07:16:08 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab5553sm12143412a12.16.2025.10.22.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:16:07 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: rename constant for clarity
Date: Wed, 22 Oct 2025 16:16:06 +0200
Message-ID: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX6iu7WzGA0LZ8
 WvZmLmvY6YyS5R5R3hcdVA1f3qw+FXbf5JsjC3s7PK40Zv0IZydPMLBQe4viMwZDavX7xj8gkg2
 X/UXtHb+aA2txCVzCFESE1QLnKeiHA3nrcozx7JzSnfkFypIYh4bIBaedSkWnKk8UlZgIRhdifT
 6oSiQgTFpSNFZETOgbP1aOOBaOm4cY+u+X2Ih0mIjloYspf91BYf4JX3m4V64UoOcSLj+oq5Oo3
 krfZLqtByou+0Wm7E0XM6wx3uPiSCl8QFCSSS2uvjX/8e9YWOnHWqnpyLPwC3Z+Fiw9H1vZnonZ
 b+gSPYurDHG8NQ33WN/opbFi26uARmHS1cOg5k/4bW/wWy+/nqJxpLWJnv3GhSr+GFUCTc2zkFk
 yjS4RyUCep7CgTyPCFpIe0VGOGvhXg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f8e729 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jxz3m821_weTZxENAOYA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: xdLUC1x1UR0XdBBqM5VvNUp2UdvIDWqu
X-Proofpoint-ORIG-GUID: xdLUC1x1UR0XdBBqM5VvNUp2UdvIDWqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

From: Troy Hanson <thanson@qti.qualcomm.com>

QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.

Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index b86a8e48e731..079176013da5 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -30,7 +30,7 @@
 #define MANAGE_MAGIC_NUMBER		((__force __le32)0x43494151) /* "QAIC" in little endian */
 #define QAIC_DBC_Q_GAP			SZ_256
 #define QAIC_DBC_Q_BUF_ALIGN		SZ_4K
-#define QAIC_MANAGE_EXT_MSG_LENGTH	SZ_64K /* Max DMA message length */
+#define QAIC_MANAGE_WIRE_MSG_LENGTH	SZ_64K /* Max DMA message length */
 #define QAIC_WRAPPER_MAX_SIZE		SZ_4K
 #define QAIC_MHI_RETRY_WAIT_MS		100
 #define QAIC_MHI_RETRY_MAX		20
@@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -495,7 +495,7 @@ static int encode_addr_size_pairs(struct dma_xfer *xfer, struct wrapper_list *wr
 
 	nents = sgt->nents;
 	nents_dma = nents;
-	*size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
+	*size = QAIC_MANAGE_WIRE_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
 	for_each_sgtable_dma_sg(sgt, sg, i) {
 		*size -= sizeof(*asp);
 		/* Save 1K for possible follow-up transactions. */
@@ -576,7 +576,7 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 
 	/* There should be enough space to hold at least one ASP entry. */
 	if (size_add(msg_hdr_len, sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
-	    QAIC_MANAGE_EXT_MSG_LENGTH)
+	    QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOMEM;
 
 	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
@@ -645,7 +645,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -729,7 +729,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_WIRE_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
@@ -1052,7 +1052,7 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	init_completion(&elem.xfer_done);
 	if (likely(!qdev->cntl_lost_buf)) {
 		/*
-		 * The max size of request to device is QAIC_MANAGE_EXT_MSG_LENGTH.
+		 * The max size of request to device is QAIC_MANAGE_WIRE_MSG_LENGTH.
 		 * The max size of response from device is QAIC_MANAGE_MAX_MSG_LENGTH.
 		 */
 		out_buf = kmalloc(QAIC_MANAGE_MAX_MSG_LENGTH, GFP_KERNEL);
-- 
2.43.0


