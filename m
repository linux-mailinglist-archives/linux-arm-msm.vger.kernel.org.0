Return-Path: <linux-arm-msm+bounces-59474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABFAC48CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 08:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED345189BF1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 06:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C292036FE;
	Tue, 27 May 2025 06:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzA0Q4Mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C11FDA97
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329048; cv=none; b=P++ZjZyHiYC/B3hKMHnapYBljUXz0MjXDGhOKHCgeun7Ng2SuGYH4/R1ePZvbYuVdIvGs57AqOZB07DhYE6ntUALVWzrOdPpwak1A73fPYeAudAoJcOKmV5b4uhZkYE9cEwEWmhLeH+9Z01aELnxZb8DfunL64O+HD4deLIrSLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329048; c=relaxed/simple;
	bh=cT4xLgSWOqfNuREgIqfSkNTrYlsBLiswRyt83c71RTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCBz+nhuyNwqnVd7xhzqGCVDObN9qjW2u7e4c9iIfCWqnePOSt9teiTINVn9/vfYsEDOVwF2lYog4Dqse95QglZal5bP22PYzymYrKXzQ0iv0N1X/qBInymKmzskrbrebqbRK/trsPIGh57BOf/HmWTY/eDLDSkWVhnVHlUA8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzA0Q4Mf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QNCnEH010166
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygugRm4SsXMkb/d+FivUiOwn/n8fxWFcMiA6Lz8ODvY=; b=WzA0Q4MfOh83M+fD
	7oRXp45i0ixKCECLgsV34qTA/i9+n7Hzb5XL4oCQj6roNNE9jK7PswgsAxTwaUge
	OWXqZk28jxjeLFnkco7pAGfZoe4Y/3BUmx6IM+CkyK6HkPuDWM4fmttF9iQUb9hy
	Nqoywfe/j5+UM7C/ubbpT7aXTgIoBSn6kZcXwqCLhKSA5B/8lgJXFEW6j4acAyVJ
	cfCnL+PsRT5YEik6jArF0YPdQ0AkgSeLmIQBDNtFKGV/DvqsAEwKfd/J604uDU8e
	N+N2miyVyBg5r5n6eM0hmEEhZQft0tm3pPakovMwYruFRByuPTe421CiO4nVmHe+
	MRmu8A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjnxak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so1739162a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 23:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329039; x=1748933839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygugRm4SsXMkb/d+FivUiOwn/n8fxWFcMiA6Lz8ODvY=;
        b=Dm+fz4RlwC1tseuPzgG0XMPNC+SwaPOX2/6m/levCM+7rC6m37srSgqtrqtac3Bl+7
         oVCF2yMX0yNwM1i0WQNaDNVqm9VOVbpyyLsRKOGG+xYtDCn3fbxLhfNF0Ahu4vcTIcNI
         +yDXrjPn1I9DJAvdNpFjFal0Jt1pKznxncNpsB0UFgMLmEvom7R6CFbDZWcm5INQCS8E
         CZUNGIKqmG2upiw/sYM+jRuSKwqzXChQNN7zF1LMRW06BLKo0twZCqDVE/mDBYf8sEcj
         jOGt6kkkMpr8q72qY2AvJmpFKzSm/Jo2AlX3xhpJjcPT2M9TQYpXL6UFyctn4f5PAxn0
         fwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKTQB4yCrsAQusH/Xl3XXcVFGkhjaDBt7uC5nvxwC3nKoho0b7Hn4NkBGmTs2ryJYBBooyMbhSZ4FH88GW@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLxu7kmF0ewj4SU199g3s457Q69DB2I40nnCwDti7rI/QRPBC
	Yt1/xFg39DvGCFiiLJvz+ZQDWZ2RNq/abHDhmBc4/97ZD8Dn2M4G5FcxjYqJcHVmO+4tPOrYdwG
	Yn4PAQrcErykn/ugrzevvViep9KJyzG9F5NgPuWNKMIerByh9oIyGOLcLYoZDUXYYsjk=
X-Gm-Gg: ASbGncsgN/+TQy6ouFWYtZ/clcI0ARV/QD3yaTKaUGYr61PH3HcTAg3t78wGXIPgqZP
	YbMUDsbpg7wGxIgpJkikQODqzP9VDvvZeC1nqPUZm3LE32/awCgu17oUI9u5bMmQe8DSNPxm/Op
	+/VvCcM7Y2qv2NhqKL+5XM6s6ZqbKvWMxzK2YMELv7GuCOGpHfc1GYco1Rs9ZsH5VcXNQiBsDpZ
	xbLd8Xa1RQSylKN3JigyXHg1vg8qkAEmGUVUN2wjCHm3tiS0ufgWYJ/Ou595/RWndkK3rA0NHXQ
	ggKFZpH9bWjJW8pyM9PkwvPxaJfhS5fHKyL26vD0GMxmGdY904QSwfXu6mp9r0RuQfeKxTE=
X-Received: by 2002:a05:6a20:9d90:b0:215:db66:2a32 with SMTP id adf61e73a8af0-2188c34144cmr16951464637.33.1748329038820;
        Mon, 26 May 2025 23:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXEN+b4LBU0sjDfJGjW0s5KtMVUe6w1X1BROAUzJDl+VzOFSY+j3GfW20682wQFapRYyItgQ==
X-Received: by 2002:a05:6a20:9d90:b0:215:db66:2a32 with SMTP id adf61e73a8af0-2188c34144cmr16951418637.33.1748329038363;
        Mon, 26 May 2025 23:57:18 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:47 -0700
Subject: [PATCH v5 02/12] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-2-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6835624f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GbaX7WeRZ0bjS8mKvltYANIkVR_cQymA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX1oTI23Of5cAK
 PK1c7XrZRmptR8dhF/jaQFc3Qw5yA9qjH/V7m75JWVz7IgukD5/Gls8DKkwgCOHLtfyDo8NSrUx
 UoutivAIg81AfFXNoKDGLJERutcO+LqIx4sqzC/5kM5wJiUKE6nT6di7RSrJN65XzKXZo21wkax
 GrWsSkDUyGY02pd02/7rOtiF/AWSN8s2PV4BNFrxJ57itojNC4lrBjDxjJsE8HarTVNPzjEPIVY
 3/BFTWmpA8gOXr6LcJxKxzsCiRFL1rJMpkFl5MdBgsncaoAHp3gSowE/zmFjuxvOKYu+xLfNME5
 Hhr7NtNIOSY5FW1IgimJKmn3b7oWa3lC76Oeaoj3b8dg23gqNIzeNPz0Y6TipcvWSXCliI0sGy5
 7mxPRZVbDjk/MFQ+8tGjTuFX0Oos44RuO+r5xptj4+PIO50H5NZu3sJ8k1zL7CZ1UhtFWorh
X-Proofpoint-GUID: GbaX7WeRZ0bjS8mKvltYANIkVR_cQymA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270054

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
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 133447f25065..b9ea5a85278c 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -80,6 +80,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -97,11 +98,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
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
@@ -1038,6 +1043,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1050,6 +1056,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..d3f40a03de36 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -14,12 +14,6 @@
 
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
index a38494d6b5f4..284ca6b3e03a 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -65,8 +65,9 @@ struct tee_device {
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
@@ -76,11 +77,17 @@ struct tee_device {
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
@@ -154,6 +161,24 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
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
@@ -315,4 +340,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
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


