Return-Path: <linux-arm-msm+bounces-72884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C4B509B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 02:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7579C4414E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 00:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6305012CDBE;
	Wed, 10 Sep 2025 00:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqZ857Gr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2E141C72
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463085; cv=none; b=TMMDFLyvKKxwFJ9cu+hZwgcZrtcoQyEOYK3boSrfGEoA5oLg5lXW+JcHAj8TQtDBDhn7KWo+3ygE11+s+9Fx0jXc8P2TQQneWukQnd8G/5tbkYhRuiIxVvDm86CsGeKgXDYsRcw+PIxpl0vnJ0pcqbAT1ehjPTaSFmctRlkx+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463085; c=relaxed/simple;
	bh=ZRS6JSqauRlryJc3bfvaAzYiMZgptSB3VgRLdbw/uJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivuwdTDOERLFSHccmZvZFr7KTcDCR46GSJT2enpU9n8V2p5eI47NqVvjh37CeSZ6srjULiMpsBwTroLIhTgr5kXwDEn1U9qwaCG2rp7Z+cPa+LxcI5zEu74GIkPNPzUiRPVZTSfUw6wFZQ6oe2DQ+dBW+nEUHhwlBH9yiN8e0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqZ857Gr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HqxaM030492
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8jY2HwwgMRulTaAiPVsU/MOC8fxFx36a56qnT/3OybA=; b=oqZ857GrknySkiTP
	8OxQvZv7gcfyhtHQS7R2+iIUH5KQrb9FZaRkXoGFXed/+orxuB4r1BoDPrRBb/7m
	wjE5Q/ED/OKS2EbhGXfR/HVf1R6Xrh8yPpMraSGZe2BbtAp9nmrA/is6VG1RXILZ
	AISMbpB89/SqqnfklD5E2/C1PwMbEj3R5ya7+R2tl3U2hV2qF+PYQaGY/gyILipI
	JxjbEgoMuhd5HXEA+H/zHYMyvuzGE+n34Mteaa0JV8Bi3mRQnxIGO4SzptCtNpwC
	9nHgzoS7nX3XiYv3JO9wAqAuePCDFKzfI3WZhSGGzacVUigwcpBz5ynXP4+P/J1C
	hcxDVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9ja3s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 00:11:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b548b9a0220so556803a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 17:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463080; x=1758067880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jY2HwwgMRulTaAiPVsU/MOC8fxFx36a56qnT/3OybA=;
        b=tQg+WbsAvuDzy3WC7zYySF0QWvkXRFM4MeYihZQqcsamSfM4aYwwlIuJi2V+ov2cUO
         UAx9JQXBIwaCn36gJi2gCdTa71eTMi9sXT69CQ2vHK9hHBQ6NdJspfZTpL3shMwOP8Au
         nEs5yh3fG7KoXEBzCB+beMo2rOx9NqeOb9bPqrM0FMBRnEBxx4wbDgFEVt8ug0P1cQz8
         o2bTgkvwXP5GQSKZ48qxAmtRPw5OZKindy/f/4ZnxGj+Ejlc6YK4VamgWDwiaWWAlRj6
         X75i2UFb2S8KqcxXaBXRjzFnO5qX37mCtLJKC6UV3t/Qj0o87mFRlh3Ju1I4QbVATJtI
         ForA==
X-Forwarded-Encrypted: i=1; AJvYcCWJYHpBjgs0zDmFLkKbP2Trhsg57PmJAoqkzUILOy4uotZhIu9MNkOleBuYgOa4Hv0DczgK7GRbbDnXZ+Bs@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6CKbNMjC34LBSC9swjN22b/HpaF5mu91R34A4RuySu+hSfAm
	nQhrX5xKw5/1Vqqxc7bwCl6y6zsL8msur0D6b9TgrvepUMegQenLDW7LLVPl2FdnqFCXqMGhRMZ
	tQn7j67cpgiafjjVA7pgdP98hBcPmonWapYOB6r5QZfrcOjbLOwDJYki+eknxDsC/hs4=
X-Gm-Gg: ASbGncv6jiruSZl+7ZOs+p+UOmA1Ib3PuAfOwpY7PuNNTLQ/rYrf1y7r0AgJPkYU5IH
	wzSCvZ0z1pGJFaMuzC1aHDiG/22g2bQZjZuQ1y+9oLBqhCWjBFjmMEW1g0EnUD8L88aFG01jNtw
	LWG/CCgxfz8y5+VF7jCg7Ur4ju+71O8CEimvc0hnKZSDtekV21uyJLqVud2CF9vIumEpsdEtJo0
	g61JCGb0UAanXC/CBYlTwfH9Ww9khl8u90dJb930oUWSPf4pnQXvDKsKKTrq7EsYNWUVqjJiJp6
	bFyJ/zqzzpcmq5qXn+JI9LEMxWAwf/hIPZqDpWWlMS0AwXkudyDbSul2hVXMUmfXnpyAvkXLY+i
	AhorlzzblLB3+UWxBiHNfWVs=
X-Received: by 2002:a17:902:d490:b0:24e:13f6:23e with SMTP id d9443c01a7336-2516d52d43fmr148372495ad.8.1757463079847;
        Tue, 09 Sep 2025 17:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM6XHIQCW29yMyzTDh4Y1gyHfVNYY+raVtASU/ynhT5cDb+vK6J9J7gdFDyy+k6kWU/N8gtA==
X-Received: by 2002:a17:902:d490:b0:24e:13f6:23e with SMTP id d9443c01a7336-2516d52d43fmr148372075ad.8.1757463079246;
        Tue, 09 Sep 2025 17:11:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:18 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:04 -0700
Subject: [PATCH v10 02/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-2-20b17855ef31@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXxurIC3BDeM8t
 4zLbdUMm8o7DxOBLJi8ASKRawPKXk0Fyj5mG/wlYpPcQw7osBSbcYzmozp9mcRXtVghCRUxTZt4
 thXeOJGOHayvLdP6fcIuFoBrw4KTCK7AzWp2OP7dEgUAq4JRMZFjGBkYBcbFyRXknUtOx6hPuBe
 3iJyFdHdQT3U4s9sgoz7NrcwM2QnWbtsh8gvr6rHC2FV8pfM8TjdjiplRxF+Dso0a6vxKToMxUK
 viHMS680kMFet7taf4nOSSVvMr1vMgV2Z1VaRa9bL5y/7zHFiweQV8bK1x23Jd7nHS56fVtsHIn
 MjZW9DfDppK9gcKt2NS3gFbXT92FrQdXalsM8sU7vWOhLwGZxpbjYWzxh7mvS/Wy3AM0qizSACd
 OLQMW/oi
X-Proofpoint-ORIG-GUID: 0IW9ITT9t4NCyMei_6k3rgt3-z8oiOUP
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c0c229 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0IW9ITT9t4NCyMei_6k3rgt3-z8oiOUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

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
index edeae6cdcf31..948f20125c8c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2094,6 +2094,122 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
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
@@ -2326,6 +2442,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
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


