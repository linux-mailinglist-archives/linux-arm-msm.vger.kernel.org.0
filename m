Return-Path: <linux-arm-msm+bounces-59476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADFAC48D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 08:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1F82189C38B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 06:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2194D207A18;
	Tue, 27 May 2025 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOnWH++4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5814202C3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329050; cv=none; b=g0eRQL8G//biwcC8bbqzs86PaahoxGs2AZ8WCF369xRxkY0mRczbErTMpXFSg0tiMDEJ7KOGHfcFl7ETFdc/Mo4nT5KTi2Z82bHqmIqSZi9nsBZnsJw1bxUSc78HUWGNfhWUztIl54DYfN7iuv4sVp7AccMVm0M8FQoo/dRvNTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329050; c=relaxed/simple;
	bh=pRLz1zGDWwQMVAzm5GqSabqgeXYtq2VO9G+jvAK0dMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYN4jGQb0q/Yh7RwMZkQIAri35LDYWbxWThdhtXwFZdFAnm/Uy4x8OU6f+VCnK7kauTz7rnXODg5k6XQB5ICAWYkHi64aEHu4YXn+ySjj2yvWnwr+LJqZ5Zu6b4IeKCBY85EspWtnH1ZzgH5KPKtrIdi+tohWUHOQuisKNIwzlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOnWH++4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R0t1H9021465
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvjDllfehXM5VOAFxkQsDSvF3WSZAkGI7aT43HPgOt4=; b=TOnWH++4FrS5tmwi
	JbCJJ8hYDdhskU8qCwBs2VseeMmBd7V5AFTUOMPJPm5HnphWZ+069bghEXBoFThI
	IG0nuMQSny4Ot1liQlLon19cv5iurVJZT/sWoSOOfghkPEWBk8MxPC3CskcVhc4f
	pl/RNm7lQ4VZTaMaHNgje8NxOgeOz62yNu8fxpIx2zT/BK9FVbOEX9EtQKmdOkzb
	B4vxR9sPdg4CaaVX/BM/27ze6A9SE1gA482UL3r2W/kHZZTkrsWZ7o3BM4OvG0xT
	HFFkBue9jAOw0vhrxkdywYL97wtydmDKM4IxjpjAwSC4wj9wx/X06iUGPAbwlWm4
	CAO4Xg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8wwy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:57:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e120e300so3178574a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 23:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329045; x=1748933845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvjDllfehXM5VOAFxkQsDSvF3WSZAkGI7aT43HPgOt4=;
        b=XuUsWj+AH4mOr5aLavC4NyxOEkmMr+6VCouD7Eo5XMaACfA6bSae+/kqdgdUZkrOqU
         dQa6M6hQs6K2iUh9ooH/mqdsx/z/T93uvUVAVCMqaUxm2W0wsVE1vLIVI3hW3eQ51EA9
         Ca7r5kThcOLpTP4NNFBoowUCEPEWgFmQzKw59XZ8852zl/Xw0I1Q4ZzlJDDdxk1FotBy
         7O5mN63yvWFmtPK0OmrTF4hadQzdKJOFcTy+tydFf1cFzMfn/q63DDl7NAArh40fvdOn
         d1ARZtJy4i5XiUi/wbqeCSOlr3LEDvM9YN5AgVZNf4uAxQ43CtswZ1JQq+5270hEzanA
         GOBA==
X-Forwarded-Encrypted: i=1; AJvYcCUijxjhwDtG+dEl0qYoEPk4k11jrphcq/woOa3a+mL7EF00ngvyA7W46omMrifreYlicbSwnhrbHvXmr/lm@vger.kernel.org
X-Gm-Message-State: AOJu0YweajaO+kJhrPAvyt6M2kihoavrzMfp0YUJYu79nMJ3akorypw2
	5gCbVJIg0tks68XFm+PEen0o8ubKjaS3fz1rbN34PBm1xwj13uDcZOR7pdEvnVOjusSTcuaTP80
	8l5SZpJJ5BRHr3Fa+pXLxpcwSpVcPpznRe2i7zvI2WROEAu2yTAFKuntxgzdaEJJrNQ4=
X-Gm-Gg: ASbGnctqCEYv+qB8702xcaND2Z597i9mGZY8USjvZn8sIukOfrO9ak8rqTLDclEgWcv
	YY6rY8iKQe28RkoOT5mkEwVC5SDlFakUVqeO+TCAcM/RG7NrTpvkweXcgQevQ17CYXiyRuZkGmL
	hI6fQTtOOU/wvcO6ui3UiobUf4hyQJIDpOIS+wEXNs8eG2nibY8edTlzWmFpueF4CVK8cGVk0/O
	U4ledQ7e0Fa8br2ga019tFOEhKVfWr1M4uX46uE6pfHIkP3B2Ln+qzDwC7Gx5DBAM81R2j9m7rT
	4aVCBo00qiobMcQQvUjci2CV9TJPEUpjUzYGoqzdgNE8PjvKWM47UUToP3+ylUlhd+OxpKM=
X-Received: by 2002:a05:6a21:6f12:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-2188c36c334mr18308670637.27.1748329045349;
        Mon, 26 May 2025 23:57:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1oSK1Cv5b7I8AIYA/RWCjzmPoK2F0wAVTJ8xinMwJa3QGVDIjxj0+zQcN3LZYbDH6i0YM8A==
X-Received: by 2002:a05:6a21:6f12:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-2188c36c334mr18308639637.27.1748329044909;
        Mon, 26 May 2025 23:57:24 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:24 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:51 -0700
Subject: [PATCH v5 06/12] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-6-024e3221b0b9@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68356256 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VBMSEef6C08_EAZnroV8W6nABWZLkbQP
X-Proofpoint-GUID: VBMSEef6C08_EAZnroV8W6nABWZLkbQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX6OoB7z6XBzNB
 dybZxv36WvkH8y++hKWUsVUf93k4JYG7VTJFjO0NdnQzxnisuVn8EtUtWwOIbn09eyO+n1ELmYb
 HsgHJ9yrHEiStvhD/nYdaxhZrFSXPtOR2K4tXdbAd7d3+9YfhxknTJgqbVNoF0ObDvbyWcVDf9R
 WFiXKPHZ9fOPuTU5UjkBkGlXqXZBD48Z7p7MQ3gh48NqVn8+Ya1QOtT6UWubyv8GU42ImMVvXq9
 jr/QlOXxi2mxdX0/JGCQpa1Kz4F0NOScYkjMiFFyA7okrkAJsn34L3Fanmhc3dQs6t23aMcDpAP
 BfntrM6k1TRa6DbY3QzWgArmgdf+6+ysl7l7ju5Mo0CDup3jZTrSfshTM61TJh4Tv5N1TCysz8H
 QgE16SYS90d53dSPAb7oBG/7n6VpmKU0Dfo3ShusZvxcOxsrW0LblZDsmlQY7by90BB3mINP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

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
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 128 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   7 ++
 include/linux/firmware/qcom/qcom_scm.h |   6 ++
 3 files changed, 141 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b0..e3207a9d2de6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2087,6 +2087,124 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
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
+	u64 result, response_type;
+	int ret;
+
+	/*
+	 * Check if QTEE supports smcinvoke:
+	 * This will fail with -EINVAL due to invalid buffers, but first,
+	 * it checks whether the call is supported in QTEE syscall handler.
+	 * If not supported, -EIO is returned.
+	 */
+	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
+	if (ret == -EIO)
+		return -EIO;
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
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2322,6 +2440,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
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
index 3133d826f5fa..665e21feec9b 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -155,6 +155,13 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
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
index 983e1591bbba..b3a7cc20e617 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -176,4 +176,10 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 
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


