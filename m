Return-Path: <linux-arm-msm+bounces-72888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B3B509C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 02:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33CFB44175D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 00:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB79C1DE2A7;
	Wed, 10 Sep 2025 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QX/rgTPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E61C54AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463092; cv=none; b=CTa0f2jHCqYDxqH92uymJksey0Tyen73X3rapi1pJ4WYDv59jMoI5mnobFIFJiPax0rYI4DIJVnO90W9+VSWWepibhj5K8Kfg1lNCpDXU5qRNUIPKcWvqymbREE9nJJ1R7dCXllCXgs0s3ro4IFEaz61ioQc9saa46cGCWn9CnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463092; c=relaxed/simple;
	bh=p1+amx9xWqw3n8rwGKlwrcFPH327CAYQiayrFQb7lOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEXvW9NZylWj7JaxlMQhuKxr+laQRYc1nzaeHverm75Kt++L8F2DxwGIsbnAeQEMcEi/yoy+DQ0SNJKzC0xaNwq2MpPacru6R3PDn7S8m0bdUM9mdN/pSho5qXZqBRrinisS27pLS5SyWWGOwhCPWE2O9jpmtdEIP9QaM+enIus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QX/rgTPe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HiCX9023942
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJUEScgHd669sTbCi3K/5DZAJvI+GRUfGpoFZdMFrdg=; b=QX/rgTPef39viCOo
	UQYTjVCuAOZAPGAkbaIBOqV+/E/CvUPeOPNUqhPYnWv6be1dV9p+SbqYT0ppWqWj
	cyrDGxfyQ0iW4QVw4voqQbs+dyTPYoOuvM/rFV5GROqLO01vWRWXLHsS1/JlZLB7
	fJTPp8koUv4O2xijU7Vp8trztwK7l/RKZiixJhv+Mta6JbMw/ARcEk75kpNly5uJ
	RvuQqI+hSEw8HEZPQN0pA/zrluQKu+O2e/7i2tHWt6j8fKVIAxRQgslrG2ZGnYFZ
	QV1FKi0b3SjvzfsVAzok6NGicB7j7JhBX0XeANbQ/SycAhz3RdVHe2mU/75jZFbC
	QVgBdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by92247-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:11:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724ff1200eso5550074b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 17:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463087; x=1758067887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJUEScgHd669sTbCi3K/5DZAJvI+GRUfGpoFZdMFrdg=;
        b=GmuvaGKAGSFdaOG5jz2ypm8bj/8mhI+AmCQ2ZR+Q1xMYRW7ufabhDW9DQbpFLCmUsU
         MNq7I9ll9i0X8NA1yuUtSW9AXyb8JCI8CnpBRxvd+xg2OM9Y2bAsZKmb2n2KKIgboXue
         E8K5nSIdH4SQSvpoWc1oorF/P528rIR4HSgj2wBNwVXMDZ6uOe0ENs3Z/it4Hfx0TN65
         C5MAhcoBFRQdxMPX5RgvXA+ngib+5r/ZiDto/KUzSyOk/84eufV8Bp/0zEPk/I6ix4zv
         un4Nkd1L2jkY5IQZIDVWdf/8hzGtWl4zSReRKKr7HIx6Ppe9aAnqlifpcerGhwfnZvAx
         olmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHF8s8FdSetHnlqlNzPQhaw6mAf7cp0eNPPlI7Hmf0Ak4MS6DiJ/xoYMYyB0whqFvjlSLyVtzbtFAeoynv@vger.kernel.org
X-Gm-Message-State: AOJu0YzrNxA2SccRRy/AdsrEH40ckeHf4nfgT+rbiICfy3fEbLFtxqf7
	skhTJvJu+n6uRZdC6Pcoyhk0Nydt3Hl9TM9ZToQ2gzYW3QUUTEFskzz9kgxtYJrCLuW3Gg85t7v
	LfZSq3cK50OEhi3239T867Zb6trGu66hy7+U17MS9uZuQczIRuyjyHhFB8Z1vKUu21SQ=
X-Gm-Gg: ASbGnctodqp4Y+tMiyce3eQQIHrjc3j+KWK51kxw0sLSgvZ7m41dlfILnBLq5SoMCbL
	LEZTIAAIkS++Pz8qpLH41a3MJ0Q3h42ApKJfBVDKxzN+xCCAZSoWtuHSB3DF1v6mZHA1IPjKRtc
	wbTP2OQTtE4yLrM0LTS+Zo46OTql6dmK7DPds7cSEekP5Kl5Ra+qC4mOmMOAxCEt5RvcjJWeUfl
	+wQJXAzTv3MQ6u22Htf4K9luosuOGwUU03p8wQ9vtKLrbdGTBIRCPrkmnj8HGtIcwcYDgVesVM8
	SQOONsVC+XMHJsnZktv+MgwLQfX7IA1CsMIh7lNM5ehPBQ1jodQZBp71RDhWYxAaowjO7QYN1Et
	YYE4QiFIDyBdf+nWYlHKVtuo=
X-Received: by 2002:a05:6a20:1594:b0:24d:7926:bb29 with SMTP id adf61e73a8af0-2533d605fafmr20523222637.5.1757463087141;
        Tue, 09 Sep 2025 17:11:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYhuFSs97p3AvLp04BPVBOEDhd9OnAESZJJlKAWg0wZNnj27/DM9UEFY3VTjiNdvHXocRdaQ==
X-Received: by 2002:a05:6a20:1594:b0:24d:7926:bb29 with SMTP id adf61e73a8af0-2533d605fafmr20523157637.5.1757463086520;
        Tue, 09 Sep 2025 17:11:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:08 -0700
Subject: [PATCH v10 06/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-6-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c0c230 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=fw-SQdjKjSnpQ1BqlTsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y45aS2rWLISYFWf-JG0alUzQLi4351fl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX6AubatKEOK+r
 P5kJIKWoEeL26UxbSUOaOZIQA+2tbobs0axVLLh/PLvC/uxCiL/kO9ju5NwaTwWJjnONbVd1k2G
 t/HkKMEwsv8Z7Mjn8JKR9AG2BliXbnMz6Xswiz1prn8+ZZ6VBYB1wCUqJpAgZw3slie5x0no6vy
 f0HlnS5ONnlOhNqDpk6/D4Hpm5Iea5NlMP//0ENCoftKOEXDyU0vmD3iQS+KkqD1xlMF/gmKtli
 QgDwVlIxZ4UcONX97q3RZ7Z1WxsQSJN3cV7pMDTD7SWBwBBJlWwBWcjIus/JOXuCGuVC2am5QAt
 PnuJPtbb3jyuEszZish7/hJJyr+SaEwXVyKZBWWxDyCx/13KUCB+g2aIHgK3IWku2z3U8EA/Zv8
 ppY79mNZ
X-Proofpoint-ORIG-GUID: Y45aS2rWLISYFWf-JG0alUzQLi4351fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

The TEE subsystem allows session-based access to trusted services,
requiring a session to be established to receive a service. This
is not suitable for an environment that represents services as objects.
An object supports various operations that a client can invoke,
potentially generating a result or a new object that can be invoked
independently of the original object.

Add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT/INOUT to represent an
object. Objects may reside in either TEE or userspace. To invoke an
object in TEE, introduce a new ioctl. Use the existing SUPPL_RECV and
SUPPL_SEND to invoke an object in userspace.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/tee_core.h |  4 +++
 include/linux/tee_drv.h  |  6 ++++
 include/uapi/linux/tee.h | 41 +++++++++++++++++++----
 4 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index c21f1909ed17..317cb044d92f 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -343,6 +343,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
@@ -361,6 +362,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 				return -EFAULT;
 
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			params[n].u.objref.id = ip.a;
+			params[n].u.objref.flags = ip.b;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -434,6 +440,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
 			if (put_user((u64)p->u.ubuf.size, &up->b))
 				return -EFAULT;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			if (put_user(p->u.objref.id, &up->a) ||
+			    put_user(p->u.objref.flags, &up->b))
+				return -EFAULT;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (put_user((u64)p->u.memref.size, &up->b))
@@ -586,6 +598,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
 	return rc;
 }
 
+static int tee_ioctl_object_invoke(struct tee_context *ctx,
+				   struct tee_ioctl_buf_data __user *ubuf)
+{
+	int rc;
+	size_t n;
+	struct tee_ioctl_buf_data buf;
+	struct tee_ioctl_object_invoke_arg __user *uarg;
+	struct tee_ioctl_object_invoke_arg arg;
+	struct tee_ioctl_param __user *uparams = NULL;
+	struct tee_param *params = NULL;
+
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	if (copy_from_user(&buf, ubuf, sizeof(buf)))
+		return -EFAULT;
+
+	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
+	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
+		return -EINVAL;
+
+	uarg = u64_to_user_ptr(buf.buf_ptr);
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
+		return -EINVAL;
+
+	if (arg.num_params) {
+		params = kcalloc(arg.num_params, sizeof(struct tee_param),
+				 GFP_KERNEL);
+		if (!params)
+			return -ENOMEM;
+		uparams = uarg->params;
+		rc = params_from_user(ctx, params, arg.num_params, uparams);
+		if (rc)
+			goto out;
+	}
+
+	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
+	if (rc)
+		goto out;
+
+	if (put_user(arg.ret, &uarg->ret)) {
+		rc = -EFAULT;
+		goto out;
+	}
+	rc = params_to_user(uparams, arg.num_params, params);
+out:
+	if (params) {
+		/* Decrease ref count for all valid shared memory pointers */
+		for (n = 0; n < arg.num_params; n++)
+			if (tee_param_is_memref(params + n) &&
+			    params[n].u.memref.shm)
+				tee_shm_put(params[n].u.memref.shm);
+		kfree(params);
+	}
+	return rc;
+}
+
 static int tee_ioctl_cancel(struct tee_context *ctx,
 			    struct tee_ioctl_cancel_arg __user *uarg)
 {
@@ -641,6 +713,12 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.ubuf.size;
 			ip.c = 0;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			ip.a = p->u.objref.id;
+			ip.b = p->u.objref.flags;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -753,6 +831,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
 				return -EFAULT;
 
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			p->u.objref.id = ip.a;
+			p->u.objref.flags = ip.b;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			/*
@@ -833,6 +916,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
 		return tee_ioctl_invoke(ctx, uarg);
+	case TEE_IOC_OBJECT_INVOKE:
+		return tee_ioctl_object_invoke(ctx, uarg);
 	case TEE_IOC_CANCEL:
 		return tee_ioctl_cancel(ctx, uarg);
 	case TEE_IOC_CLOSE_SESSION:
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 284ca6b3e03a..eb891de81e12 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -72,6 +72,7 @@ struct tee_device {
  * @close_session:	close a session
  * @system_session:	declare session as a system session
  * @invoke_func:	invoke a trusted function
+ * @object_invoke_func:	invoke a TEE object
  * @cancel_req:		request cancel of an ongoing invoke or open
  * @supp_recv:		called for supplicant to get a command
  * @supp_send:		called for supplicant to send a response
@@ -97,6 +98,9 @@ struct tee_driver_ops {
 	int (*invoke_func)(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
+	int (*object_invoke_func)(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
 	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
 	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
 			 struct tee_param *param);
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index bec9a918b950..92992148b687 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -87,6 +87,11 @@ struct tee_param_ubuf {
 	size_t size;
 };
 
+struct tee_param_objref {
+	u64 id;
+	u64 flags;
+};
+
 struct tee_param_value {
 	u64 a;
 	u64 b;
@@ -97,6 +102,7 @@ struct tee_param {
 	u64 attr;
 	union {
 		struct tee_param_memref memref;
+		struct tee_param_objref objref;
 		struct tee_param_ubuf ubuf;
 		struct tee_param_value value;
 	} u;
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 3e9b1ec5dfde..ac455683ab5b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -48,8 +48,10 @@
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
 #define TEE_GEN_CAP_REG_MEM	(1 << 2)/* Supports registering shared memory */
 #define TEE_GEN_CAP_MEMREF_NULL	(1 << 3)/* NULL MemRef support */
+#define TEE_GEN_CAP_OBJREF	(1 << 4)/* Supports generic object reference */
 
-#define TEE_MEMREF_NULL		(__u64)(-1) /* NULL MemRef Buffer */
+#define TEE_MEMREF_NULL		((__u64)(-1)) /* NULL MemRef Buffer */
+#define TEE_OBJREF_NULL		((__u64)(-1)) /* NULL ObjRef Object */
 
 /*
  * TEE Implementation ID
@@ -158,6 +160,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
 #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
 
+/*
+ * These defines object reference parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT	11
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT	12
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT	13
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -195,15 +204,16 @@ struct tee_ioctl_buf_data {
  * @attr: attributes
  * @a: if a memref, offset into the shared memory object,
  *     else if a ubuf, address of the user buffer,
- *     else a value parameter
- * @b: if a memref or ubuf, size of the buffer, else a value parameter
+ *     else if an objref, object identifier, else a value parameter
+ * @b: if a memref or ubuf, size of the buffer,
+ *     else if objref, flags for the object, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
  * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
  * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
- * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
- * are used.
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf, and TEE_PARAM_ATTR_TYPE_OBJREF_* indicates objref.
+ * TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference
@@ -411,4 +421,23 @@ struct tee_ioctl_shm_register_data {
  * munmap(): unmaps previously shared memory
  */
 
+/**
+ * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
+ * @id:		[in] Object id
+ * @op:		[in] Object operation, specific to the object
+ * @ret:	[out] return value
+ * @num_params:	[in] number of parameters following this struct
+ */
+struct tee_ioctl_object_invoke_arg {
+	__u64 id;
+	__u32 op;
+	__u32 ret;
+	__u32 num_params;
+	/* num_params tells the actual number of element in params */
+	struct tee_ioctl_param params[];
+};
+
+#define TEE_IOC_OBJECT_INVOKE	_IOR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
+				     struct tee_ioctl_buf_data)
+
 #endif /*__TEE_H*/

-- 
2.34.1


