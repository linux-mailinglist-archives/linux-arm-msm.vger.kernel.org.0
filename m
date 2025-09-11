Return-Path: <linux-arm-msm+bounces-73045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70206B5273B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 334FC7BA2AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E9F258CE7;
	Thu, 11 Sep 2025 03:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeVnbJLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0124A066
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562094; cv=none; b=HtO/zIdM7NX6yAzDa9ESM3hjvNv96Pm0XBYgozGR5xm2Dcx+ur/elJN0AMnKJ5EIiEAOO81mmZZJQL9ox/r6HAJpUmKSNRSpm5OKBQQyS7nYvZje8OsGFZumfvMhpID5JkV5GHTL4WSE6fmFs4ZrTTFvOrsDDwSiioGhpxKq3V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562094; c=relaxed/simple;
	bh=/X/slCEZNUYsN1/1Kb6qKCBb1SuAXT+Ssp2opHduLeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NA24hpJF215iQ6mawcfeSlt5FGHLe9dvYO6mBSIeHBi2wOOyt1w7cwbkc+7GeqAIBbw8gkT2D3qbxpxboaX4m8E8vTi+wiXRhTRK0TiKjpwJus8g8sa9vTlesor/nWGWKzwmntcCaU07NsShYg3QSDyVDBtBA8bRvbW+BvTyGTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeVnbJLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ib4B030857
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfnro9xo+EarbMqRFrPWzRQwLLoVHW/MmAqB1i9xt2Q=; b=GeVnbJLw5Qb6NLSF
	K+I9V5+6UJzRozu1AVPFBHRNBqFo/xlaP1Tun07LFpSzEWQZd+6eTTDHr5cvOZds
	OcoGnhLN4RRqeI//u/tzlMGRrFuCT/ZAd1PTTCPJJX37+sv2kQEjBzk7FlZxMrik
	CUNe/UHqQdJu8MWGN6vAQIiEtJI+v2zbsAdxQDunPPvnbdbkg0YXcHxWsX54gb4R
	HupxtCml0LK7/uaI/QqLMd4kzlFcUL9dKBV+qSwdSNswl3otScZYV1VrhBNnpISv
	gnBnjERXypPPCL7T6HaWIJ5eHjoM7g5Bx35bpGBN0nCqBtAyAfSJ8Ui0x7t9L+As
	9uoJ8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg5x4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24e04a4f706so2871995ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562091; x=1758166891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfnro9xo+EarbMqRFrPWzRQwLLoVHW/MmAqB1i9xt2Q=;
        b=gWw3Q1r0ZgZdCWOhod5UBnjdts8Ls9/H0/MMu7k5BlFghiEDUlh6Ne050lsXez8QDI
         fb4eVeiXRPZa9P+kla5JTLFMu5RJGJ1+4MblYGi+vsrLOIvjUQoYlo+OhLX2TRUoiBxO
         +w22eBdQrCpjFzkd1G0Cnxa7ogHc7P+XIUU/ISNGGfNaPOCm5X8aOhC3WQ2gQhuPV1GM
         EazXbXaVs647jlmPPGYPoLcblUxuQq8voSyiqd3UckFpP791mlu2bk+5sNZ7h8S6LhQn
         H6YigZ+ckvQ+1Cfr7IFfydDAKh1YK+xwOmY+LzcoDoLtpCyN4V0iWfu7xM5Tj9XDqvpF
         Hgeg==
X-Forwarded-Encrypted: i=1; AJvYcCX5+Cc7F6mSFOdDfO6m+HOG8o+FrCdiIHr+8RXVbnY5l9TkdoJTBegKaeFmKuM16ZPL5irTsRWl/3XGNOuS@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4v0qL1ELGsHaWsv0gs6QDO0T9vs4GzKIeToqt3GDjjLUd57/
	np6yWuiHTvuIEyN5f/a3NX2j2xtPYbtNxavDD2DmZESgNMWgkgh/P0RpPmCko2jgtLRuVTEExvh
	pxt537GkMjOxvDh3APDpAuM7L+Rnkj1vw88YlyZbQ3KdD8/spM2LA8WRDxT9q8Iy2JCA=
X-Gm-Gg: ASbGncseTXfdRdXHLdLteIgzLwRY05gZEgMHVA/ZZiyLzDxNUs0RpsRP4tDmKFigp9F
	r/E32tDPqJPdDSYO4TkbomXaI4SMFZo2fjsDVnSMTfKj7n6sDIOFexBdEp52W6cyOfEYxx8T6su
	iO3493CvOhgTBKP5KsMD1mmmU/XWh6NftssH52pcD2jswU+ZGUrsiJLdcV763E6pPbU/ns2t7US
	LuwDOy4yLE6Z+1/c30DwWCpmPi/Cvh+uBV9v1FJtBOmVHwat0BikHf1KPU9VafxcCLBDAMHGICZ
	p8dcOyPCQZyctg7k1KR3BMGwmoV9bRA0xaYn4QdlyeWgktwnkuV5To/PYaVGQf0I7ZY0tcEESDN
	mNXk36BUh3AtT4m+drjBF0fk=
X-Received: by 2002:a17:902:f681:b0:250:74b2:a840 with SMTP id d9443c01a7336-25172483a34mr238753035ad.44.1757562090730;
        Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2b0ipDRDvZkbzduHPtXWYapgLH3UaQWL1xsBCUzaccisMS56SSp8yl7NyLyuUuiRKSMRPXg==
X-Received: by 2002:a17:902:f681:b0:250:74b2:a840 with SMTP id d9443c01a7336-25172483a34mr238752765ad.44.1757562090085;
        Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:29 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:17 -0700
Subject: [PATCH v11 04/11] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-4-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: vAKZfIoqoVyxY18D0YLQj2drJ2xMa0Ch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX3rqFAVBfXS6n
 ohz8+KXkmStx74pUZu//8TEyGE+nkYu8eMnIbsDDsONDDkl4KQyA8KwgNeonkYFUU6A/b6Z5yEZ
 0LqsAdycJjpdGvFSyds/2vHIIU0nyICz4IPIE6UlKnxDqtif+IBWsxc2RfdMY/WzfkT/2stdqYR
 JFMqfawR29vnDh/cB0/VdvWHbsUMMwFJt0NQGqs02YJNz/HG3jLNNZzQJ/aoiNAjuqyWWSGNEeS
 Bf7BqueSZmXFNIRF4BT+AOaROqA3bd8TMH0i/ZECOu9/cUVYEE9iu8HX8S0oNP7gFa7sKs3Kgtj
 ZT3u1k+dAItnsmUrBdjGl86TaHq3AcLumuuXqJT/LR1MLREWpb1Nwxuo1CDIDA7sYvsrIGutxAP
 1+IqBFHf
X-Proofpoint-GUID: vAKZfIoqoVyxY18D0YLQj2drJ2xMa0Ch
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c244ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

The tee_context can be used to manage TEE user resources, including
those allocated by the driver for the TEE on behalf of the user.
The release() callback is invoked only when all resources, such as
tee_shm, are released and there are no references to the tee_context.

When a user closes the device file, the driver should notify the
TEE to release any resources it may hold and drop the context
references. To achieve this, a close_context() callback is
introduced to initiate resource release in the TEE driver when
the device file is closed.

Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
tee_device_get functions to tee_core.h to make them accessible
outside the TEE subsystem.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 9fa042d80622..f8534a00c56c 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_put);
 
 void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
+	if (teedev->desc->ops->close_context)
+		teedev->desc->ops->close_context(ctx);
+
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
@@ -1075,6 +1080,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1087,6 +1093,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index a9b5e4a6a8f7..6bde688bfcb1 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -23,12 +23,6 @@ struct tee_shm_dmabuf_ref {
 
 int tee_shm_get_fd(struct tee_shm *shm);
 
-bool tee_device_get(struct tee_device *teedev);
-void tee_device_put(struct tee_device *teedev);
-
-void teedev_ctx_get(struct tee_context *ctx);
-void teedev_ctx_put(struct tee_context *ctx);
-
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 7b0c1da2ca6c..456a940d4710 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -76,8 +76,9 @@ struct tee_device {
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
- * @open:		called when the device file is opened
- * @release:		release this open file
+ * @open:		called for a context when the device file is opened
+ * @close_context:	called when the device file is closed
+ * @release:		called to release the context
  * @open_session:	open a new session
  * @close_session:	close a session
  * @system_session:	declare session as a system session
@@ -87,11 +88,17 @@ struct tee_device {
  * @supp_send:		called for supplicant to send a response
  * @shm_register:	register shared memory buffer in TEE
  * @shm_unregister:	unregister shared memory buffer in TEE
+ *
+ * The context given to @open might last longer than the device file if it is
+ * tied to other resources in the TEE driver. @close_context is called when the
+ * client closes the device file, even if there are existing references to the
+ * context. The TEE driver can use @close_context to start cleaning up.
  */
 struct tee_driver_ops {
 	void (*get_version)(struct tee_device *teedev,
 			    struct tee_ioctl_version_data *vers);
 	int (*open)(struct tee_context *ctx);
+	void (*close_context)(struct tee_context *ctx);
 	void (*release)(struct tee_context *ctx);
 	int (*open_session)(struct tee_context *ctx,
 			    struct tee_ioctl_open_session_arg *arg,
@@ -200,6 +207,24 @@ int tee_device_register_dma_heap(struct tee_device *teedev,
 				 struct tee_protmem_pool *pool);
 void tee_device_put_all_dma_heaps(struct tee_device *teedev);
 
+/**
+ * tee_device_get() - Increment the user count for a tee_device
+ * @teedev: Pointer to the tee_device
+ *
+ * If tee_device_unregister() has been called and the final user of @teedev
+ * has already released the device, this function will fail to prevent new users
+ * from accessing the device during the unregistration process.
+ *
+ * Returns: true if @teedev remains valid, otherwise false
+ */
+bool tee_device_get(struct tee_device *teedev);
+
+/**
+ * tee_device_put() - Decrease the user count for a tee_device
+ * @teedev: pointer to the tee_device
+ */
+void tee_device_put(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -374,4 +399,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
  */
 void teedev_close_context(struct tee_context *ctx);
 
+/**
+ * teedev_ctx_get() - Increment the reference count of a context
+ * @ctx: Pointer to the context
+ *
+ * This function increases the refcount of the context, which is tied to
+ * resources shared by the same tee_device. During the unregistration process,
+ * the context may remain valid even after tee_device_unregister() has returned.
+ *
+ * Users should ensure that the context's refcount is properly decreased before
+ * calling tee_device_put(), typically within the context's release() function.
+ * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
+ * and release them simultaneously (see shm_alloc_helper()).
+ */
+void teedev_ctx_get(struct tee_context *ctx);
+
+/**
+ * teedev_ctx_put() - Decrease reference count on a context
+ * @ctx: pointer to the context
+ */
+void teedev_ctx_put(struct tee_context *ctx);
+
 #endif /*__TEE_CORE_H*/

-- 
2.34.1


