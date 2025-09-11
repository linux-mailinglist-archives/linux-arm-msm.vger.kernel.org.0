Return-Path: <linux-arm-msm+bounces-73042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09EAB5272B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9E258101C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239EB23D7D4;
	Thu, 11 Sep 2025 03:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NusHSjON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69986238C26
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562091; cv=none; b=CFqDvWRVLH8X+L/SBwOn29i7itksXm/1StAYYcX4wuMQdUeFrRnEeJg8DKuPXG+Kyu6iUTOduAdJO2FJioMQyIVbGR6LcvLh1Bq+JJRl5ORcesoQB0f3f5lJYYffc0OrYjP6Az+lg0AaOsdE4hf/dnDX91xLJhMqZQYDD4dwa0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562091; c=relaxed/simple;
	bh=YQcEFnOl6kY4qFaLVPv2nJjyrWQl03MYHwKFS3Sg01k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4feFZdxNkxENQXRjAAqyKpr8V+kGl2i+k2M0cwrbazHLQuymQ7Q/G7c6HnfJSLMclDFaoBcTyRRFllNoDDev/wFULlpJ9U6fsRAzyVGijyZGJw3LiPB+ygwp1cSRP/qiHg9qnN6uvNBTOsQrPdg7aMEtCMcQl4EEJpDgFXg4ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NusHSjON; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IX1j006035
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKbqXe7PMoUiJg4m7VYYPBBjDC8LJ5A/UZIjVDLkyUM=; b=NusHSjONBcCZHeO6
	NNHtprFSfWfZeWdl6bd7CF6//A2hSDg1yDm2z6KzBrfynLDbcKNLqmeB7kTrwhAg
	4v9QCD/rBeVjTh7dbZZIdqTbDyFGbgMVn4/KsH0WTMITAtCtR54omKhMWWvpPdFw
	twwNg0yzbcjFBNogTU5KNGgbsFLXNxVYPd3I/AGHzvr8gVmq6uVa2yq7XhSGfieP
	Qok5WUVXNsN5F18iGfhWtawoMBS49tkJmHdA1j8yo55fmXjZM+fgOQyXJz+GszFT
	5HDnIHLthlYE0+c+pLRxLtqH+Jt3mSWnWxRhOzxXC3sgh77BJxeNjOE1Yf5WI/ka
	nJIiiQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ae3ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445805d386so3501785ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562088; x=1758166888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKbqXe7PMoUiJg4m7VYYPBBjDC8LJ5A/UZIjVDLkyUM=;
        b=GiZDEY3twd/kr63APkI4qWpcZmBzPmdMN8OC84x+fetv6NuyGgW2wdaoHONxqsZHwA
         UOmt2csBCGaiY+XpEGeO5kDuaow3Sqz8Iex3iM7jE4B8O0MGD3LxYfv3Yz2zEB1/CqDc
         vpuDGD/bOUAeDot9xmkVsHvIOzthbqdKVfiVWqIckVYbcJaUDjFmt3bbUfXjZ+5Q8Cnb
         vs3sEMu/jALAzTEwQmdlXxgr2Z3rSCqOiKDIsc1I9h7pz8g7WGAQUnijfKm3uvVgNtx3
         2AMDrEcxQJRWTDscWAhsA+RteGIjqAigDTMlRAeHNyCUlDfVndHGfhlrztLKpCz1hxtA
         nwLg==
X-Forwarded-Encrypted: i=1; AJvYcCXv9vKSfdZJC1V2TpFXaFBwO+JOSwbJyIxkHeM4G+xoaLEEI3c+VB6sqZrdO5nMJmTNAwj/MW5RgdrkSmba@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlvCkeaXWYgh7PxByF7+a6jk2y3+B293n1O0MUe1p6BtjYBCo
	2js8aA4vDe1aIM9NMGWuLCOgtzfCjlu+pOgM8LZDNzPPhxK+rSJFwNY4JMVxzWMkfSRsP8ascdZ
	2s7iNXyB+JfprkDt6rsW19XQ7Mg9ErQEPN3xa3nETApVML8XP8M4idhbmI6EOUj2DdNM=
X-Gm-Gg: ASbGnctRBOsl/MK6hjvUW+4jgB87N0W6XIe7S9wyGHd+Kn53tdS+wbVcz5sJ4D5KAq8
	jLNIyHoqKJzgLAkxjAqjY+nh/jnVvAp3E1+bywRrD4I+noukNxxgr/HHE8c3p6L6+7So0Fep/tN
	ktHTuGS87OG75myPgvsK7oCwIFdqfa9u6Ked003fkmLrXZo5rq7JBYdl0MlZVGmB3eqQ4rswROD
	M/D+Zljd3m3uNbNlIIlmnTEUn8HxSufEt7BRTbGlM0zlYR+MPWb4UEINwYpGutY2AiSEfedICgy
	Cb2AnT8ULqk+lB3iSJ0hrILxl0t4Kcll8MH8g8/B35rEkLEyT/i4dZBtX6uY41pX65bEjhLVLio
	QIagHsCdxT+MHNmYOPa1eI6o=
X-Received: by 2002:a17:903:38cf:b0:245:f7f3:6760 with SMTP id d9443c01a7336-25175f72ac4mr220641495ad.55.1757562087468;
        Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2kwOIrXlQY9Hp2LbT+Ha1VF4JSti2xLqtCO4iZN0yyVAUste29kkfj5azPlxcC0nrkqPLFA==
X-Received: by 2002:a17:903:38cf:b0:245:f7f3:6760 with SMTP id d9443c01a7336-25175f72ac4mr220641085ad.55.1757562086931;
        Wed, 10 Sep 2025 20:41:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:15 -0700
Subject: [PATCH v11 02/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-2-520e867b3d74@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c244e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uoJy4-cJ4IltpJ2mPMYPV2Gzj9u7zPbG
X-Proofpoint-ORIG-GUID: uoJy4-cJ4IltpJ2mPMYPV2Gzj9u7zPbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/VZ4l+vHF0xT
 uFfmTxwxPqnjqHaiNZclj9oHxRcZlMhfozmPhMHrCRr6CYtWvnR2oeFS4ClRrIOPO5RWgKlhSic
 L0zm9dgQwliBblJvHZZ54rVEOzjerzKSUEaRa9aONa4tukjaeaU9l6IrvnARvOmet8N2lMGdC9f
 j/Sx+wOEVHinCku4HuSIFvLL8u5Boyayb9I9E2YHQRJFi4aAA3/tvxND1CEUzUOIERguLgILale
 edSN4bl3gsPQnfZ44p4F6kFxYWMygUxm+R9xEsYfJv2YH4AP2PMHQdlTAkZx7CDvJ9DQnqATiDA
 XCj7z8BnFr+BfASIEcJvuuJk6VzjalbboK2xbCSqtJAX3B3p06/c5UBDfSH73bt2V3PEPSjt4m4
 XA5R863+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

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
 drivers/firmware/qcom/qcom_scm.c       | 119 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |   6 ++
 3 files changed, 132 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26cd0458aacd..9b5a9a0f68cf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2093,6 +2093,122 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
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
+	if (IS_ERR(qtee_dev))
+		return;
+
+	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2325,6 +2441,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
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


