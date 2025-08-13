Return-Path: <linux-arm-msm+bounces-68853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55874B23D30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 02:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF325841F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 00:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234751CCEE9;
	Wed, 13 Aug 2025 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSrju8JU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544CA199223
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045429; cv=none; b=YEC+Ky04/XGYMyHV4/Gr/WxkKrZKLG5yQXnPms1QYWI/20ehVy1FNfWMlU8Ghf2bDzlDTok6AMtJ5/MeiqtiiUUlp8pwNMKmY/P8t4o4k21evlk/YuG9tJfD+JGLq5VR+ggZ2YIfO5QkpJUcb0TlSYQS77KIchvT3+sQUubupyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045429; c=relaxed/simple;
	bh=mt1SY7lqZqYnHX1E1eZtjcGPUdWHsqyRxnqhxA/coPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mh/9giniT1Gc4ntn41gbDlzeR5jP7CAz02TE+Ks/8YAi8JWCDrm56Sr+Fk9togLMogbaoRR1785edFvXjsI+DphTYS9FzNfEl/+33eh1yGeWZdOfsGy/zlZ6fACAqJTAdumDfbZpL1dWU2cKd0DimbfcH9kMgjTxeHtdoJkVhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSrju8JU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKRasV012368
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dkpk3kW35s+rQ8xADVAl+s3707K3KzYCGbupLzI7XSs=; b=iSrju8JUSKSLlTzi
	i32ZJqSum2kUg6GDGgcVFyJZrUyfoDf7u1dMyiKpHZFKJvOdelWsqzi+1klf80y1
	HzJ1o9eeIlxAMFuXF9xPPxNvGrKCpxMW0fa+CmtKPcEBiMEz9nlGvgcvxowZXZ2b
	5559nNS6vYIinQUdFA0Xj3K97+dZvqck/YBwCAcbrGyFOHVAJERmdb7jyPOmww+u
	fdQ5aUSfGly083os4RzSPtfh3m7LHqwV4YldA4QidIS9aaqLywYD+NzDmC2iMGdF
	8VQFQE+gmJsRXHcYHGXtcfLBi2lQXdQw1IyDZtf/ihab3nQff8BXiRq4pQ8VRsIT
	ocue8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv1vkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fe984fe57so93263395ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 17:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045424; x=1755650224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dkpk3kW35s+rQ8xADVAl+s3707K3KzYCGbupLzI7XSs=;
        b=DEhHi3wUg3e17AlZGFtizhc75+8q4DNMr9CWBuU+gr8fmAkqVk7qAGYmL7MJ65LSga
         bJGkeiQuRdKAj/aKIe9LT9pkUnA7XV18t4zJLzvoZQpCpzA74nm7Vy3E1mRexIJU+MOM
         SodDtA1pymOlQO9k9qsoyFu/9dx8O2mG+a6JgkbMq3DEYpQGtNmInLPxC7y9YYajkAjc
         T4C//l+l1GjEOKpLs5GpJHU4ITcvaSFieqPXAjiJ7zy82F4LWoazqjQC4IJqxn+cq9X1
         YptuZRWrs8u7PRxKDeh/rfZnWA3PMpo/hbQB0Hg4w7RI8RpPqji7hHVsg/9BWa8bNEF0
         7gsw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBqS4QjEOybP4wGjyAeUjoAe419SMYAARCfG33ANx4XuzpVW3WycQDzAE3f574pzytfgdVDUNiqZ9sC2o@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhqWTe+FeHngFQkiKCCWYUQF5qQAKIdEyQzOKgjZ7LJl00y2H
	F9U/idd7dOjiIhhp5wMB3S8AhuaL65ZCuAVLqZhRQjVwFANtPHWKJ/+ds1I98S5qrw4BE/3quDv
	wnRqQl48Utx7PbsaIRlRPFV6VgGKKrcB6FtGjx2O3WMQEPGaey1F14H5sCxEojRSCVIk=
X-Gm-Gg: ASbGncvaSd3XGYJdMEKUdZciQvSC8R3IzI30NMEpF9AAoKjkSFim9AaMfgAQEZ91abi
	lykJzropJkAqRQIQxC6PATMOhwBSwq1pFIfOSgNFiB3l3UoGWJ9MUhOM3r3n7F/wF9XA8vhXk9b
	Fo7JN0J2VxHIbeyHFj9rG2DkO7FqlJlIVWmuD1BR4sEqbBX+TC5EbZoB8OgmnH1u64oXvad3NCW
	7SU33OvCmkuNzX9Djg4tjQOlz16+9XuVCzP+dfFC7VTvpCoCGS8xaL26flZBkLGGPydMx6J2qC+
	PZ1N46QekZizLKaV3y70d8o27O8T2gaPZPJlbKUKwWIPfTZf1EgCfGqwniPayM10m0x9wHA4fbA
	Cfftp+zGu45Qk3gH/b5G0HRc=
X-Received: by 2002:a17:903:950:b0:240:1850:cb18 with SMTP id d9443c01a7336-2430d21d9bbmr14926885ad.53.1755045423888;
        Tue, 12 Aug 2025 17:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlF2c43SwSVVhWWTZ6CHor0ZMj81pLl/B1nnCfA8wdytLkLOsLfKHZLinf738/FTtKf4T0iw==
X-Received: by 2002:a17:903:950:b0:240:1850:cb18 with SMTP id d9443c01a7336-2430d21d9bbmr14926445ad.53.1755045423391;
        Tue, 12 Aug 2025 17:37:03 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:02 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:32 -0700
Subject: [PATCH v7 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-3-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689bde31 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kkFQhvIS_e8UKM9JC2s55bUPivzV17te
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX8/BhD+UdEico
 /CU39LmQD9OSqUld4HWurtYPJFF6FqL9EVxiUxE54xs8GVjGnUQkiEkn55V3QRKTBfhpydbMJZV
 00PlFYpjK7Ok/JRaPmEwqW1GAzdvxajP5t7jKBpkb2ZNWUMpcIinPp9td1zY0XUz6qg6EC0+o7B
 HTluA+tfgubwaMJ2dMBNznFTwNDB5rYjem/ig1yO+3DqIqeZRdj4HVczbP04ebcAVs2R8qF3wZl
 8GppeVZDi2wPg9huHGG2h/2m1lYZZpVRc0y7y5tdPq3SEBVXjvRRnyhQL5VJ9uWGaFVFqPOyqeE
 Gpf89y2qvbiZdvYiHVTaLEBSui7VKR3UqE/IWDC5llB9LeNEZVRzd7/HZ1NcixZDv6JJdBST55l
 mjNYitKi
X-Proofpoint-GUID: kkFQhvIS_e8UKM9JC2s55bUPivzV17te
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

For drivers that can transfer data to the TEE without using shared
memory from client, it is necessary to receive the user address
directly, bypassing any processing by the TEE subsystem. Introduce
TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
userspace buffers.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index a2b365bcee51..b84655b47256 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -387,6 +387,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			params[n].u.value.b = ip.b;
 			params[n].u.value.c = ip.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+			params[n].u.ubuf.size = ip.b;
+
+			if (!access_ok(params[n].u.ubuf.uaddr,
+				       params[n].u.ubuf.size))
+				return -EFAULT;
+
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -455,6 +466,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
 			    put_user(p->u.value.c, &up->c))
 				return -EFAULT;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			if (put_user((u64)p->u.ubuf.size, &up->b))
+				return -EFAULT;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (put_user((u64)p->u.memref.size, &up->b))
@@ -655,6 +671,13 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.value.b;
 			ip.c = p->u.value.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			ip.a = (u64)p->u.ubuf.uaddr;
+			ip.b = p->u.ubuf.size;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -757,6 +780,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
 			p->u.value.b = ip.b;
 			p->u.value.c = ip.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+			p->u.ubuf.size = ip.b;
+
+			if (!access_ok(params[n].u.ubuf.uaddr,
+				       params[n].u.ubuf.size))
+				return -EFAULT;
+
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			/*
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a54c203000ed..78bbf12f02f0 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
 	struct tee_shm *shm;
 };
 
+struct tee_param_ubuf {
+	void * __user uaddr;
+	size_t size;
+};
+
 struct tee_param_value {
 	u64 a;
 	u64 b;
@@ -92,6 +97,7 @@ struct tee_param {
 	u64 attr;
 	union {
 		struct tee_param_memref memref;
+		struct tee_param_ubuf ubuf;
 		struct tee_param_value value;
 	} u;
 };
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d0430bee8292..3e9b1ec5dfde 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT	6
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT	7	/* input and output */
 
+/*
+ * These defines userspace buffer parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT	8
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
 /**
  * struct tee_ioctl_param - parameter
  * @attr: attributes
- * @a: if a memref, offset into the shared memory object, else a value parameter
- * @b: if a memref, size of the buffer, else a value parameter
+ * @a: if a memref, offset into the shared memory object,
+ *     else if a ubuf, address of the user buffer,
+ *     else a value parameter
+ * @b: if a memref or ubuf, size of the buffer, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
- * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
- * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
- * indicates that none of the members are used.
+ * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
+ * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
+ * are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference

-- 
2.34.1


