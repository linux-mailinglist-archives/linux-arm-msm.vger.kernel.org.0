Return-Path: <linux-arm-msm+bounces-73208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D16DB54179
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 088F43B1D70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D2527A91F;
	Fri, 12 Sep 2025 04:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDos/34I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822C272802
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650079; cv=none; b=RY6qv+rfU5pw3gHN4KYyWK72R7xzlQf2Y8+7wqeDgUE/PiGJr61ZR7PTGd28rMIqUxKPAg2bT7lcpxeqOaQLkd+Rg5IAm7aRGZ5Fmh6ar/t+Y9RHiS7CMQqxPwYLaKPXWcAJXwb8h4SLHiZ8TlyMMJ7sNdN3o7C/CBL4XpXh3S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650079; c=relaxed/simple;
	bh=0JhgAW18zDHm0BoGjWrA+FEp3ImGC4XhwsCQWuaWufU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfjuBuS07lxyqwvcv+pQhB0M86bKlVKmzI90PrvENhZrv7F13VS2AWRYkijfBBYKRAwwPSBC0ndjsniijEAMevd45iqqyOKg6OQ+CUOFZ2Inqnx1mQAoEhUJZxww9PGejmlYq8bedKH2ijwtFQ2zKPiang0hjgN0K1ueLu4hBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDos/34I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIhddQ007257
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZfcfgt5tkDE8WsfLwhw4yoKfImru//GWr+MWDVBGxc=; b=HDos/34Ip3sG+PrD
	XwJ2qySCUJTqJmQhPZtkB8DP5gSKdySdYDqR/u0JgrzAFDr+Vev7Q+vwW6lXqA9q
	N1gHe0tBVZnQx/oD6yTrib7rCyzXWPJSfUk21rK8kMmwIBG45LGIbE1i/P0WFj9p
	z3Tj4//3KHadv97ERUbLpk+ZqAsChNvs3MI5148N53H6mX9pORb/dtt5vWJvk3e7
	qzJiuyLUnuJlVTE5jNhKaszS3nC2NWg3AB9mATeDgwXGgG8P8ERdEISDLP8ozy/d
	GMGxRXQEqixFOSvVdDSlG3dH1B2PtK6LUxZgdTzzOLQwhXuqfBCJpfsH1wR/WV+y
	qTOJUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8aj48h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32d4e8fe166so2008407a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650075; x=1758254875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZfcfgt5tkDE8WsfLwhw4yoKfImru//GWr+MWDVBGxc=;
        b=NKDYiynFKG9/lbk1xZ7l8Ym7vBrgu0GVVJwAxOBvF2Mvjbn8CG5VfKaFgOSL4hRqxE
         glJKt7ut8QRpL0EXLleT8cVy8pF6a2yoHuz+3fXKWkmDBWz2vAJIdbJetqbTkLQO/LnJ
         QG3Ug1kXtZZ+phw+VaAyKYCQVB4zdPtkBzQMMRWUawSJEVZefKyz9RhExQzRQ6WY9STS
         IJrs8fUPGoZtP0dEjB1rtSq0SKWq8/ywMwRrFTpDvod4V2jqWgrXxBgpKOzFJ1TEsSO/
         9b0q22KTHobr0IAaaXOqy1dhz7HRUOqouq3FXwwHP3+GlO6F2tf/bv4Zz1Gq0yUuK0FP
         2XLA==
X-Forwarded-Encrypted: i=1; AJvYcCUWjknwo9ptUjKaxCIR3Ayz/Yyunqe/gduJn4AAhHrvLKseLzdcpX5S7sUm5VShCtQ0HJOF+mYni09QpBmT@vger.kernel.org
X-Gm-Message-State: AOJu0YzPP6Z0r9+9oZ1vhy0Udjw8wpxWUeR9q1HxCfmPyLq4RbxQsleu
	U+y5rR8FJ6Uyc4zUQBPejlN1xkb2P28Nim1N7kfTUQiKNqVHBdhuMa8MrsxwYQ4ZRRPxZWE6HIq
	w8RKyJgpI9eEjX+V2KecXx8MrM2pYHFy8VSlsT2zCOYsZTnbOPmdHAScnkxj8LXlSeH0=
X-Gm-Gg: ASbGnctds5Rfu6lNZZlcSGIFm8Ah8BuRqJzAscdpxPBabDka8H9R1KFIYH4btB0Hx4C
	OIXM7Qor6VpW5QbhgBWj8j91BPzxHEsb8ft8vOB+AqXqzLn0SPFzSMvNWN0wA4IHQtq6QxUKLTs
	7uD32FFLlSkvw3MktdilrPgaWj71Ng4xElU/34hVh1Pa9At1yWgQ5/uLYHqIGIGm8+i35ty8zdp
	QaB7v0RP03X0Tn0kePZVZLOunFQ50Ot6RF2DNyB5wdvrISmlT9L1Huh39qrNQZFJr8rY33VleqI
	xJ9hsIKR5eYGr63CfjpkRscn++GthPKgzc4hsNy/lU7BQHkjALzDsThoJygkGPx9MxdMC/HEOtt
	mvN6zuZV3ovOzereO4M0N5EE=
X-Received: by 2002:a17:903:1904:b0:246:4077:455b with SMTP id d9443c01a7336-25d2675f896mr19178415ad.36.1757650075025;
        Thu, 11 Sep 2025 21:07:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgOznKQiW7+OP4d+FwxWDW8QfAA8M8JZokoKlbaWqHA9Mh3L7nYTbbb3jZvvrlBqMet+mMFA==
X-Received: by 2002:a17:903:1904:b0:246:4077:455b with SMTP id d9443c01a7336-25d2675f896mr19178115ad.36.1757650074549;
        Thu, 11 Sep 2025 21:07:54 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:53 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:44 -0700
Subject: [PATCH v12 05/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-5-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c39c9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5rX0vSQeLAiZnOk2mor1bpVmR1nNqL83
X-Proofpoint-ORIG-GUID: 5rX0vSQeLAiZnOk2mor1bpVmR1nNqL83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX7sJ14Avs/DIe
 qSxeuxy9uRSm1U+bKL3cj97f+9dVd6a72+mz+Ca+za+KQLJQpBzzDxBVdVi4OCMMsGcnvQsCoJU
 ZuH0rX0ioHPykR6gIjbed+4KywR8ZrW4xSyeQ0sqkWm6yUj8b3F8Cyk0wnXOCNthHqhCIto+Ep0
 0xg8BIAHqm6DO3MF1ZdgX7ZrApzp8Dwn2Z0UNwxjAVufD8R7KXuAnqHJbCtJFWTawSKdKiYFWpi
 Z71DLN4It282G6yTK5f6J6WsjooTDKdJGFNK1zi3vyYfjguIyxkWZ1nBHTB5jfOmyHfPdcow7qb
 EozMrgN+ov3zTui2Tmu+/0cuLjYR8C6nr/tDbtkF3VeXX8NpdnKyk/+qc9hLHDB1NHmcU+2BT6O
 FaDVdefK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

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
index f8534a00c56c..2dc36b501ce0 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -457,6 +457,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
@@ -490,6 +501,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
@@ -690,6 +706,13 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.value.b;
 			ip.c = p->u.value.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			ip.a = (__force unsigned long)p->u.ubuf.uaddr;
+			ip.b = p->u.ubuf.size;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -792,6 +815,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
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
index 824f1251de60..7915e8869cbd 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
 	struct tee_shm *shm;
 };
 
+struct tee_param_ubuf {
+	void __user *uaddr;
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
index d843cf980d98..0e3b735dcfca 100644
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


