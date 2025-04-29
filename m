Return-Path: <linux-arm-msm+bounces-56023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB314AA0278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB64E7B156C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 06:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7B3275847;
	Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVw15nav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB602750F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906827; cv=none; b=ot37X07usuw4iWYq8t4gbLDgQDvSBwuVlqE6IA01vL1mUma6wpEVLUdtHNgdpjeE4dTXwdSvrCf7AiFG8+lfOwp5EwNlIQiPkneKFo3TCi/WTA0Kinvbsf8O0XI6lCr6PIBTTciBGusDR8x6c9LNTR2533paKEldNDro3D7DsQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906827; c=relaxed/simple;
	bh=JCfwSuLDRnQSsxUrzp2UNscuJYVjvct1rfPgTZbmKh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thSJKhot2T3ptwJWZ0DMluhzpa9B06VJp+mnYvGwSO+mJRh33BGiinmAylUTINtKQ1B8/Icqt6kIOlFQYvwzdfM5mTBLdLtrf2fNe0ZXJrQw65E4z/zcoU4gzml+btsDuvGzJ+TBqAxcbTMmkf4zOgRRfoGzIQ2GGkq0VP4EX68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVw15nav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqGOd012371
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXaMJm9zqA3fJKLXrRirVlQ9wrTmTCRFVGcozylZPRI=; b=bVw15navvi1MF1Fo
	WnGtcMdDyblTEh0b4Ugpl6uE+KSLFjXm/9efa4YkH2zIVjtcp3ZSFvGV4Uc5H41m
	7B00OyX1SBqvOHWHwxGOnbFB0FjRRTS6mJDf+TRyUZdmipQnLI4CPi5emH8X2YdP
	a83KHQBE5GuwhaQxu61X4aRnaavktiJBt9Bi1SPWFpMX/HtH4Xi2PNYqPwEMpGAX
	pzzRzC6E21iFTcNjP2o517Agw+W4ecyAlssFEd6sv56cTk9sWA4HVEU37WdOMXs2
	P0mpWPZDxVwa6Kqm0UAIW/laAioJ9jf+mW4c6u6gUnvK2XduIkoMKFRguDMzz1z1
	NLBNXg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9bf8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7395095a505so4253581b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906823; x=1746511623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXaMJm9zqA3fJKLXrRirVlQ9wrTmTCRFVGcozylZPRI=;
        b=XgkfntQmc6suvlEwaEM4rEMXwA3+HHTIVlN8DWw1r75KrTr6M9h9wYV0JJ33lML8Cj
         9IcpUkYLSWfFPV6o6t//EEnBF2a/rR9ngXxPopXWth1/jUZjBfvn1dNOsmQ529mW8q3j
         X/j7rH115idBnpcv/qYZ5VwVOLrdnbOt2Vxh6tA2FlZTXhDA8y4xZji3jXge8XX4eCkH
         LvGtk0DURa9WvpmO/3nB4PmReRMqAHuSRFVaELCp+e93omnznplxlkuA+QRbWYsiJczN
         kA7vZA0Se12dFhueyrsfioF3SEbhgbSfG+Nvih9Or7J/0oyDQ/9iznCD+Q/T2rn93vy/
         GbGw==
X-Gm-Message-State: AOJu0YwQK3WJoqPlyvbEDKzSGxrcHdsfPCFfWbwiOLmrJpBnYMCqwPZR
	2roWBP6TvqlY1vAuqNtkpQytq3NNHuaXSdDcY3635KlMCL9rA6VvLUGNfnX87rbIMhe6H1mGOc3
	co7qd3GbuY6sjIAQS7uJ2745FLFUUTsyvXhYNCtfqLSF8kDrq4TorKtbFtQXqI/w=
X-Gm-Gg: ASbGncsrmnIJAxynHK+bhQC26Gko/cv1aBzPXmJK1LZihRWKYz7P2pSlBf61He7tKur
	WGj3Ed99atPgueehc6BP4iOZayNGS0NA5A8kDi+B+F8k5BV+HRordGz4qSO572xeOrDBPwQYksA
	xRF1IM+aYjcxikX9VYhFFTJ6oei9T43j02sbqgDBdlfhddY0np2uH2cE5DeQTZlUL7/veOnlBt6
	dgpiwU190cynGUvHPS1Fij7ojVRPdd53eqzL/6pZESsRc4K0nXV8jnXooma2ZcFxuZ0vPP1r3Qg
	maHs5Q8VJ62FJP20w7zNO6Ccg1VMx4ucQZHpNH8+iSzT3TaZqbQgWwnKWSZ4zNVljDjFpLI=
X-Received: by 2002:a05:6a00:4b09:b0:73e:2359:4115 with SMTP id d2e1a72fcca58-73ff7397c0fmr15889190b3a.23.1745906823299;
        Mon, 28 Apr 2025 23:07:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWs/sk/IuEyl57PWfZD9bbdAgc9G0v7sfhSv2D8g1GgEL+YywAjS4cO2vAxjNDzvM3fsz1Pg==
X-Received: by 2002:a05:6a00:4b09:b0:73e:2359:4115 with SMTP id d2e1a72fcca58-73ff7397c0fmr15889153b3a.23.1745906822832;
        Mon, 28 Apr 2025 23:07:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:02 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:26 -0700
Subject: [PATCH v4 05/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=68106c88 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: QSkHoEFp8ybn3_tGQwQdjf3WjZ7C5aMf
X-Proofpoint-GUID: QSkHoEFp8ybn3_tGQwQdjf3WjZ7C5aMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfXyKx0X4B/F/ki fmfPv/Fi8AQX9oSBtDg7lnrC7u0boXS5vPAoKQBrUH3gKCLs+beVNJe9YSvmeS0245dAtXOxGUE FLuIGBcnlooCbiTcsdRmYZ0DWjfG5gk6GsxSFmQPBD0+v0gD+gyQHvu5O2ittl0A+RPB+Eqn9/1
 CdF+WvOypLZQO/dEEZyKnYcCxfz4VlFT+N5lU2WFR6hYUnKQhmRtWCahoM9zcTHgmRTcCQ+7pvC GM+WowIijghGz9HbGgKHDCI+MShw58xNNP5zYfnQTaL1ceQOA2W5K0cJ0CdxlYNdD50oirnXXng HE0dOQZHT51YhcRmGhtlSfs+o13fcTSOUkVlLf+fV124Nxv51n+BHgRLXsVpMqGJsd815vf12qh
 HzPhiuPGaOSEVTpV7CNPQrp9MUNDIaasX2dUpBZcxp6vrZVAf2WlDGXPCQa4aTQo7ARVd6bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
the secure world, accessed via objects. A QTEE client can invoke these
objects to request services. Similarly, QTEE can request services from
the nonsecure world using objects exported to the secure world.

Add low-level primitives to facilitate the invocation of objects hosted
in QTEE, as well as those hosted in the nonsecure world.

If support for object invocation is available, the qcom_scm allocates
a dedicated child platform device. The driver for this device communicates
with QTEE using low-level primitives.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 128 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |  27 +++++++
 3 files changed, 162 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..bff1b0d3306e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2084,6 +2084,124 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+#ifdef CONFIG_QCOMTEE
+
+/**
+ * qcom_scm_qtee_invoke_smc() - Invoke a QTEE object.
+ * @inbuf: start address of memory area used for inbound buffer.
+ * @inbuf_size: size of the memory area used for inbound buffer.
+ * @outbuf: start address of memory area used for outbound buffer.
+ * @outbuf_size: size of the memory area used for outbound buffer.
+ * @result: result of QTEE object invocation.
+ * @response_type: response type returned by QTEE.
+ *
+ * @response_type determines how the contents of @inbuf and @outbuf
+ * should be processed.
+ *
+ * Return: On success, return 0 or <0 on failure.
+ */
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMCINVOKE,
+		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
+		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
+		.args[0] = inbuf,
+		.args[1] = inbuf_size,
+		.args[2] = outbuf,
+		.args[3] = outbuf_size,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	*response_type = res.result[0];
+	*result = res.result[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
+
+/**
+ * qcom_scm_qtee_callback_response() - Submit response for callback request.
+ * @buf: start address of memory area used for outbound buffer.
+ * @buf_size: size of the memory area used for outbound buffer.
+ * @result: Result of QTEE object invocation.
+ * @response_type: Response type returned by QTEE.
+ *
+ * @response_type determines how the contents of @buf should be processed.
+ *
+ * Return: On success, return 0 or <0 on failure.
+ */
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_SMCINVOKE,
+		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
+		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
+		.args[0] = buf,
+		.args[1] = buf_size,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	*response_type = res.result[0];
+	*result = res.result[1];
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
+
+static void qcom_scm_qtee_free(void *data)
+{
+	struct platform_device *qtee_dev = data;
+
+	platform_device_unregister(qtee_dev);
+}
+
+static int qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	struct platform_device *qtee_dev;
+	int ret;
+
+	/* Setup QTEE interface device. */
+	qtee_dev = platform_device_alloc("qcomtee", -1);
+	if (!qtee_dev)
+		return -ENOMEM;
+
+	qtee_dev->dev.parent = scm->dev;
+
+	ret = platform_device_add(qtee_dev);
+	if (ret) {
+		platform_device_put(qtee_dev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+}
+
+#else
+
+static int qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	return 0;
+}
+
+#endif /* CONFIG_QCOMTEE */
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2319,6 +2437,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	ret = qcom_scm_qseecom_init(scm);
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
+	/*
+	 * Initialize the QTEE object interface.
+	 *
+	 * This only represents the availability for QTEE object invocation
+	 * and callback support. On failure, ignore the result. Any subsystem
+	 * depending on it may fail if it tries to access this interface.
+	 */
+	ret = qcom_scm_qtee_init(scm);
+	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
+
 	return 0;
 
 err:
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84..a25202e99f7c 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -152,6 +152,13 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_SVC_GPU			0x28
 #define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
 
+/* ARM_SMCCC_OWNER_TRUSTED_OS calls */
+
+#define QCOM_SCM_SVC_SMCINVOKE			0x06
+#define QCOM_SCM_SMCINVOKE_INVOKE_LEGACY	0x00
+#define QCOM_SCM_SMCINVOKE_CB_RSP		0x01
+#define QCOM_SCM_SMCINVOKE_INVOKE		0x02
+
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
 #define QCOM_SCM_ENOMEM		-5
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 983e1591bbba..bf5e64f6deba 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -176,4 +176,31 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+#ifdef CONFIG_QCOMTEE
+
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type);
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type);
+
+#else /* CONFIG_QCOMTEE */
+
+static inline int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+					   phys_addr_t outbuf,
+					   size_t outbuf_size, u64 *result,
+					   u64 *response_type)
+{
+	return -EINVAL;
+}
+
+static inline int qcom_scm_qtee_callback_response(phys_addr_t buf,
+						  size_t buf_size, u64 *result,
+						  u64 *response_type)
+{
+	return -EINVAL;
+}
+
+#endif /* CONFIG_QCOMTEE */
+
 #endif

-- 
2.34.1


