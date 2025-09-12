Return-Path: <linux-arm-msm+bounces-73209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8DB5417C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDBB8568172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8856A27FB2D;
	Fri, 12 Sep 2025 04:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7ozhcct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E39279782
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650080; cv=none; b=tuOGmVcQCN4WjqdKzpk4D+pmCFBeRVjmPpyKJg9Xo1JX05atSCGKjNHaWKZKN1gtbc3cTSwPvMIfgLUHvSG4PBOykoFw8IB33Tx+6jOok9/DTBNYqUWNOx7o3kwcLCi0DvPUVvh0o+gFmPXulRm/GjVkjMlmir7SQ164VTTGRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650080; c=relaxed/simple;
	bh=dH0ZgyEIi9MLQbBH1YZT3jInv+ksN05U4tuNZu/+DGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEjhGUzBWpf3wuXj0RqnL0iV5lCOKalYj+Qi493K+BAaz2us7+Jgms1t7Ehg0EpLe8qFfYc59aXsWPyJa90sFoI6by/fZqHKHcJwz10xzDkX7f97xcMtKTd6eG1x0YMC+JK7CY9AE4cn4G9YpvHFYxHaFQKw3XG1o7vq8sdFCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7ozhcct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIJDCU027365
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXis+TKbeHlsETu6aJDXQIQJ0AdwSh5Mr8oFjXt+FJ0=; b=i7ozhcct2gChLCGu
	36P7U7OM2dgrR2IMKk5WEPG8Kcd3eAuK+QqTb6uoqGA0f44RgKnBLav6hKUwRf49
	tVQw2J9xZPdRE6cXp6yWeKEoPhAfbWJO1cmtNy2Awat0byzR26sFl/7LhWVoYDph
	xWp5v5kDLvZFCDpBRGyAnLAOksWsaeZHuzXxrZahuraZkGENR/B7FKuVGAq+WH9F
	TPeRkto4oQV4YKIOytqe+DS1nKShLja4xHopSW6q8NwARMbc3l3H/JZGbf/rvpEp
	D4wAEVqfXjSBPT7AkHVEqvOnavpasnSPGLsNNUOpMTjkduNCQl6sgDehSm6E1YpU
	quRhdA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h55e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b521995d498so1112303a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650077; x=1758254877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXis+TKbeHlsETu6aJDXQIQJ0AdwSh5Mr8oFjXt+FJ0=;
        b=QUHAZ89yHQyzoRhjrCaxmkGUGW4fcmlCmQhRCqTJu2TjTogTIhuNiXvPcS5cZvAw3K
         oTZPk2t2AuuNduANHhVXCsR6ZeaH6UnCdU/8/CuqMpDUwbqp3Uz15hD5Kt97gQcBdBkT
         LRHEXLr343Bqto5VAslYEzntdY+dgLfDe4nwDx09OLej4BT7mHbatFHKX0uOsmQjsyU+
         twycK/NqVoj5nl4h9/zo2MPaZe/SMZgVfnQNktkkyymDAsI0lkV+wcGZc2pgSOQP4GJj
         hm9OasMRCM1AtGIx8Fjpgw6QDWZZMU6C1swSjQfgG+ZmwUxd99kwi41TDIV43gDZqZH6
         LS6w==
X-Forwarded-Encrypted: i=1; AJvYcCVmEJhI06ao/932jCf9FGf4TqlkQyalV5P/2F1lTBZXLX+l0BmJX6oNPYJP787WuDZ2MEH8UZSvRt1ghSDt@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvC5mju7hztdY1elUDtiDtSxfXxFHx2sDf8rKO6d1AvFc+B8j
	N7C7WlfpoPzvf8GuudlJdEKT1YVn+z5Ar5+7mUMMzKPZCFNIiq9f2CIsJONspQKwLqEZRu4W6AP
	rJcQoOZ5kDIRPZXk/okPoh8pqtEzZhltjn2NqOxsVxgwQYA46XuG5sQ5AM9A4NvIs+C0=
X-Gm-Gg: ASbGncta2S+bxe6hxIVIubZdjOeu91IIUxO2UNckZSysTN+fpUhpAKK4s98SyqL6h34
	n6T27Z07djMUjTbeAMOc+4yZfNKUnjNH8buKaLz670BABqM9FH6nBSorwgtDcqKRn3zPVYL4qMP
	w0thVoiYXD7bsFqk1u01K2sKAVKlQQpxRCbl1rlHXyheOswOgUC6gl5nr0GNfmBPOBW3TH6yacS
	ciqQd/8pPMCIRphbg8kTp/Y7QacGSOQZvfwKWCfiwoG6meiPwozWX5ld5fn39Q2WoItB0RZM+ze
	TKZDmHEeZvSagmbVNWatqcAu7+YGAIar7AYZK9lPmN5FZVZFNvFWgnXmLXxOid6+Pji5hGcVOLk
	bIIQK3fHHmEM4yI21vmbq1ng=
X-Received: by 2002:a05:6a20:a122:b0:246:f1:bec3 with SMTP id adf61e73a8af0-2602c90957emr2108632637.42.1757650076645;
        Thu, 11 Sep 2025 21:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxe5EoLzwK1flFNkqEySnmp84+KIiU9R2EXKsP4DHQUWw+0urgcTcrsUJubWjDignI/mmv0Q==
X-Received: by 2002:a05:6a20:a122:b0:246:f1:bec3 with SMTP id adf61e73a8af0-2602c90957emr2108597637.42.1757650076158;
        Thu, 11 Sep 2025 21:07:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:55 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:45 -0700
Subject: [PATCH v12 06/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-6-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: orFK4WPX5YCI935jqzSAp31loxTFmagT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXxRjH/dGKeZ7M
 5PoPRnaOao/dNUXjbvbLyIJMRmiOFCEo4VAazttnHghlh/EMxMrnKhgYk1d9SDFupcOX0NPjN4T
 9/7Rvv29O5PxKfjkfnDrC3uqivX7LDEKHnud9zpXfVRVE6zvFffO11qqiNPXhrTf1U+xXDVHQSQ
 wYylpjxFK13w402FdBN44lGY0rA7NqUwwO/tKVU9hGV9RJ5X9N9D1JkQ5vlZHyjNmz8rwh0Bwf4
 6DAWvK/EyiihVDKrKJxiVEySmexJok1JhpVNKSSIJTU78Nv7C15T9DZOBIu6gOc4yqIciL22aeN
 y9PZ3k7qP5jbftLe/42phbG0AI24Wa9QXFvZKv3/Sx7KNNFzjXrph2nVtWArYe0JAa/u2z9kIMW
 D8OmjDJO
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c39c9d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=fw-SQdjKjSnpQ1BqlTsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: orFK4WPX5YCI935jqzSAp31loxTFmagT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

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
index 2dc36b501ce0..b8f24ff14bd5 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -450,6 +450,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
@@ -468,6 +469,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
@@ -506,6 +512,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
@@ -658,6 +670,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
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
@@ -713,6 +785,12 @@ static int params_to_supp(struct tee_context *ctx,
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
@@ -825,6 +903,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
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
@@ -907,6 +990,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
 		return tee_ioctl_invoke(ctx, uarg);
+	case TEE_IOC_OBJECT_INVOKE:
+		return tee_ioctl_object_invoke(ctx, uarg);
 	case TEE_IOC_CANCEL:
 		return tee_ioctl_cancel(ctx, uarg);
 	case TEE_IOC_CLOSE_SESSION:
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 456a940d4710..1f3e5dad6d0d 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -83,6 +83,7 @@ struct tee_device {
  * @close_session:	close a session
  * @system_session:	declare session as a system session
  * @invoke_func:	invoke a trusted function
+ * @object_invoke_func:	invoke a TEE object
  * @cancel_req:		request cancel of an ongoing invoke or open
  * @supp_recv:		called for supplicant to get a command
  * @supp_send:		called for supplicant to send a response
@@ -108,6 +109,9 @@ struct tee_driver_ops {
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
index 7915e8869cbd..88a6f9697c89 100644
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
index 0e3b735dcfca..9abb0f299549 100644
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
@@ -442,4 +452,23 @@ struct tee_ioctl_shm_register_fd_data {
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


