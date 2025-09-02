Return-Path: <linux-arm-msm+bounces-71485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00303B3F3FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DF594853B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B542E3B10;
	Tue,  2 Sep 2025 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMAJKXiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971592E2DE4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788984; cv=none; b=n5OXryLXSCcIHCVHEBn8Qyitjsk8Y7GoGQ8ltz9y9EzVrK7ChOAW3OFQJW1ctXpNWR2O607X6m9dBG0RFZrmdlheeWlfh1MdLxOHRlPNQgb71mFZXRg9j7q8bRZCi3E7DPGjSGfhqhQHaqG7SAZbU/oXNOK15iSE9OXvkBHkoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788984; c=relaxed/simple;
	bh=HIg3g05OGtAShbO/iwboELF9InuMVYbucP7U4jl28es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXleks1OMX4EXwmkBJpJxAWgVs4Q90gKhuOdU/nx5Ajqq3XTebT0n2JV96khQvQrT1ppfzWFxVmHv7mnlvsuYL64vQ05WLEvhllzFKOfAQDz2F68rb48ed2R/9Oi6MyrdTV0Oy4DHCB3sB4UeIxutEp1OlW6512SoGnhtOkSbo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMAJKXiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rn0k029660
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feDuMDy+t+CpMSTiKqNe6+B83SlcxbDo9HfHqi8FlIQ=; b=XMAJKXiOB0p6dtlt
	n5DdR4TUo2uUWbcrYBlKZ8fnnwF9FfeMs4+ahZ4HzULscl1XWzWWsnIr9CpjPPNh
	NRZR//0mpVjmGoxpOOU2tDNvqIwIa5sf57om1mE8icA7eNRHgISJZITnz4hk5BF0
	1s2Gta8vwsRbYubZo013enepuCrVpBQGLUYdpQ11fXbeiPKAdeZSaSrcDlay+SwV
	NCbN8JuZt9bmo/bt5mrsxAmgQRLF9HkwlFP/fJzwJWeo6/uNDCAZXtfxlhtDphsq
	VLsHO+5uYby9R/a3lfBt4zy1YzKFQLoHRWjPw0ploYFLFVx3LFykXW39QI+toOnf
	7ioxCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8pgg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:56:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24909dffc72so40429825ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788980; x=1757393780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feDuMDy+t+CpMSTiKqNe6+B83SlcxbDo9HfHqi8FlIQ=;
        b=xP/eHZ2gzRxdz7QQAeibZdNVm+DEWgXvvs/qEqvXY/4PvcpEzvL3FYpAu/pY+8ng5Q
         PnEnelVYKUKw81eehEX5wfJbLAH9X7hyfr3Zc8hprVrpxKwRs0HaqPahomx3vw8447QD
         IV6hXbSQiWmGYv3t4ZlL3HdgBEWf3FpaGDBlRCwjJVKDjsr9bJNV1spbLjVU/BYErctg
         Fd/PCXlEptjoanh+hrJ4ID7cjN8a+qQSidn7tMObIY99mmLoJCcwC/k8RPyMMl8Xkr9N
         bajHjCr+thqGABufsN+PEYOVCEzsjE2Z1qcB8yWQILZgvz0JuMCU2uUYhufE/9vG8Rvy
         17IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrlk9ojZOWn+v4ev7V5GLtwqS2LkfXzCjo7B0wZdE9c0orv17UhH060FKGdHzp9Th0xiBaz7CoCAr2uPcS@vger.kernel.org
X-Gm-Message-State: AOJu0YwaIYgqo5f5ajnYt8sQLmyNNLVhbimW3mZ8CwzCKDWdui6L2m7P
	Gi3FLsVtxOJ3HiWO0AJmPz4Rq511UdKDJyqKQnZb9uVZO0Ff4xFOaHSn1/pTI+EZlkkXiwKvkM+
	GWD9JaMPMPyo5rfgKPFbwofZlpGtW4pq5xCG5BAldv80Zo6qQBhJf7oofMPkb2AkJqDo=
X-Gm-Gg: ASbGncs5aZ0CPMP1Kl+ewMf2z6En+Kv9LYcMJMVgLS+lC6S+MYX6XugjgA6ZrOIWh/V
	VUcClbNal88lKi9vPYxd1q+1cSg8oftyEmkufc9aEccQ5Dm9eoLnEqidAVCiUpUOKAy+cATtyOx
	O+mJRo7v1xua27z1AxtcMBtcI5BDdwgE8iPfJnEi186D7PoUidyalMsoAoto1SWnNvr4gDHs2in
	Tq33BL4kczupph90AT/0kLppCaoHJtSMBMKgTtuuv54dJokYhzOc1mG8QSsLqSSdAsmSFh+ujSp
	wyS/pdCv3vwqkXt9ADUo65NQQbyfNMvI+vf0Z37Ka9ypXJw4+YOMKVNpHuoU/vK7yeuHcati/Xj
	gfH6kg2eTcjADvq+4gId51Fc=
X-Received: by 2002:a17:902:e80e:b0:248:f2cb:e52 with SMTP id d9443c01a7336-24944a6eaf6mr134653305ad.22.1756788980312;
        Mon, 01 Sep 2025 21:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETdNKQIb3iat8a9GBL3nBus7ZBSGWhate5yBlD6Q373rsI+EJcFU/B9FTxXRzZmsVwGQ0zrw==
X-Received: by 2002:a17:902:e80e:b0:248:f2cb:e52 with SMTP id d9443c01a7336-24944a6eaf6mr134652995ad.22.1756788979776;
        Mon, 01 Sep 2025 21:56:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:19 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:53 -0700
Subject: [PATCH v9 06/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-6-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: jyL54AANz5OcJ71lH9Z-np5Q-MTHKH-j
X-Proofpoint-GUID: jyL54AANz5OcJ71lH9Z-np5Q-MTHKH-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX5MlqVASA52OD
 sdzurWSUQUXygLP8dZUOD39P5xuH1xQuiqEKZmLh0Mr2Kne6w8UNI30ZDM45AhTLUKmFbZasHAT
 7yKsn39Gio/nLEeRVUBlqlGKWNVXKz8U/H0ukuM0WjDvYxp6dtwL7bi5GFviaX1XTHvsNKqMGkp
 uCun6r8YUrYxPkb6kT8bXvZyX4E/9rw7E91c3ahFj557ehIrUutlbktpHdysfJ41bLrlX/O0w6q
 29e+S6diKPWlXPkrd2njFiQLxxNjUYou2DqyOFTmgZcZNLjpllVdrrb4BA2Pqtf/nRRrDVf7K5K
 S7QfjVvMEcgSC3Q7rDF65fNihL8Rcl0QaXcQWy5bJUMk9x9Wz5su6vJfS+Hxmqca/8HFOCvJZtR
 wZ+IjjAv
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b678f5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
the secure world, accessed via objects. A QTEE client can invoke these
objects to request services. Similarly, QTEE can request services from
the nonsecure world using objects exported to the secure world.

Add low-level primitives to facilitate the invocation of objects hosted
in QTEE, as well as those hosted in the nonsecure world.

If support for object invocation is available, the qcom_scm allocates
a dedicated child platform device. The driver for this device communicates
with QTEE using low-level primitives.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 124 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |   6 ++
 3 files changed, 137 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index edeae6cdcf31..739ee9819549 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2094,6 +2094,127 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
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
+	if (response_type)
+		*response_type = res.result[0];
+
+	if (result)
+		*result = res.result[1];
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
+	if (response_type)
+		*response_type = res.result[0];
+
+	if (result)
+		*result = res.result[1];
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
+static void qcom_scm_qtee_init(struct qcom_scm *scm)
+{
+	struct platform_device *qtee_dev;
+	u64 result, response_type;
+	int ret;
+
+	/*
+	 * Probe for smcinvoke support. This will fail due to invalid buffers,
+	 * but first, it checks whether the call is supported in QTEE syscall
+	 * handler. If it is not supported, -EIO is returned.
+	 */
+	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
+	if (ret == -EIO)
+		return;
+
+	/* Setup QTEE interface device. */
+	qtee_dev = platform_device_register_data(scm->dev, "qcomtee",
+						 PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(qtee_dev)) {
+		dev_err(scm->dev, "qcomtee: register failed: %d\n",
+			PTR_ERR(qtee_dev));
+		return;
+	}
+
+	ret = devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+	if (ret)
+		dev_err(scm->dev, "qcomtee: add action failed: %d\n", ret);
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2326,6 +2447,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	ret = qcom_scm_qseecom_init(scm);
 	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
 
+	/* Initialize the QTEE object interface. */
+	qcom_scm_qtee_init(scm);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 0e8dd838099e..a56c8212cc0c 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -156,6 +156,13 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
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
index 0f667bf1d4d9..a55ca771286b 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -175,4 +175,10 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 
 #endif /* CONFIG_QCOM_QSEECOM */
 
+int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
+			     phys_addr_t outbuf, size_t outbuf_size,
+			     u64 *result, u64 *response_type);
+int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
+				    u64 *result, u64 *response_type);
+
 #endif

-- 
2.34.1


