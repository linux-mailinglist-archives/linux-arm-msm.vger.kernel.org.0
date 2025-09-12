Return-Path: <linux-arm-msm+bounces-73205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA3B54173
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C6E3B017E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0330D272801;
	Fri, 12 Sep 2025 04:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXsvipBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7126C3BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650074; cv=none; b=cosPaWIHqI8HqlCWR6clozpJDlRisv1nPGrN53Pn7lpdDfD9xOLS1Ey7/TQoTblEMa3oP9c5fZgDg1lEV2AaeKYgmmrEruO17VBgNHUCJdlpmvYKsBsQuq8Yeg9DB9Ec1MPBqdKXJg31tK3dw8sx69TNzG+Eizkf6PWOwbnagTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650074; c=relaxed/simple;
	bh=YQcEFnOl6kY4qFaLVPv2nJjyrWQl03MYHwKFS3Sg01k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2DE8d7WsxEazr93cOhdEVV+V31+yAXIj+LFEcCaS6x83oGG87f2JnIC+GSkDtVFez3bz7DXq+31YVKwMW8yo+Pq7fL8W1/jy7dNR98Z+JLvudHixn3fvSvDLaw79tuPVOWQgC1pUc399gSNmuWzJz3glDBN6OELQtW6K1ZL3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXsvipBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BNENgJ001933
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKbqXe7PMoUiJg4m7VYYPBBjDC8LJ5A/UZIjVDLkyUM=; b=kXsvipBYIW3aSwgH
	Of8RHjXtuFVgLbxyoDbLPw6OOPegbsekJIN0kuSWKlAFB0PXAWffqHXbWzV03n7z
	gAOoKiPi969DU/I+Zr3B5qUBWhaEGK5xKM3Ox804grdv61eaF5sM1O2BaEtneimp
	YEx2oaKOsAvk8F4FuzB1ndcjSga6MSYxN58EXbMcmgXqkPwvz05hjYbK44zvTZqv
	tKzLoiKzVsTdb0ioVXVmFHV9uz9t2oPLqGqBjDVvk+0B7qYMnRcG8lHDvqJlM6Od
	MNrWGVo/zXjt4tLXlUUhsOLumQoW0MQy7lAOxAYfVwkTzRRuXwcnVYdLnliBmaeb
	OmsBjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv2ayd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:07:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457f59889so17498705ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 21:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650070; x=1758254870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKbqXe7PMoUiJg4m7VYYPBBjDC8LJ5A/UZIjVDLkyUM=;
        b=NxodbmDNJKtx7wgOAP9M3deaxx2qWxMIY1M3JuDbRg+hWcRorBqRIPwQSUPMP+Gw4k
         sojQUw8CPAIxnjT2QGpdGirL7DFVpGqremXrJE3QLaiZ6TFfpPc7q+GDz7ttHKEk9Lcz
         ieEm6pvcQwK0vICToAEDqX2cHMxFXNc62Xtt3w2AWlzLJbB7JPc0KI6HsP6jTjVLnu5f
         /yDpocnfQeEhIi3KippdEE4RkZ/faS1gM38JJGnVAEAiTgpT2IXfHSh7mGva0CKJeJuM
         /dEufWw7GliHAAc42JVS7HoHxGeBNjKuyoPKts6XKzBQv7VdnNIw/NZy28v2Q90U8KCp
         /gfg==
X-Forwarded-Encrypted: i=1; AJvYcCVDkYW5fwdxdo85Q2VnDzDELYhFpODuRbVfqsLESEB6KVUx6rY7ue2GMCCIicLCx07ekgqU8NbzAxoFA0Cg@vger.kernel.org
X-Gm-Message-State: AOJu0YwghHp5LB8mc8GZJoakhTt9v+SuGoWeSHxHUf6miVp1RSqAs0Jh
	ezV4gDgKuYw5aCGCHBBuWbMycJu+Z//DW4o4STIzFpdOtO+5oHMm+hJN/N27icClkdW9tZMMr+o
	cQJFcPNukaX72ZYBILPW05CMBxRbrrz1iaVc5UvzK145yaF9IZRODyqtsKp/2ozugCbQ=
X-Gm-Gg: ASbGncvWNVgqgoLtKX2fgFOjKEEkHNfZzV6Hp0Lobw5ih6wV/dJjEBjlC/HLF0w16ZM
	9bjm6FDOA0NOPdn+zsL2qdff6v5jyG9m1mKPKDihDms2o4VMwu2kiUtdMG8oYUVlxcYnleMsfPM
	gYDWw/Cz8OtLokujwEcWAwf6sMnS01ybwR1JmKbJvaH7006yIXPO6bA2ov1Jbw5LOWBq/6ZlC76
	lj3SJdHda0flNyyYZegbizkdgyAQ19piAjJ99bWobNl/M9wv51qdI/4ZFTUH8L3Rn1oECGGv7RN
	r+ACs2Dg6eaf6lsfMg26X707M9pP9BqRhZCPvFJ/kF3qXxZO84Uy7Sn8TyLp+VTwr0olEWaUpoY
	YzWNrRuh2L9QDVpsqOey6hvk=
X-Received: by 2002:a17:902:ce92:b0:24c:8d45:8049 with SMTP id d9443c01a7336-25d27a27d59mr18806695ad.61.1757650069711;
        Thu, 11 Sep 2025 21:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB4mg7TG2LaeqQf03sE9iGvVO4eCzJXwkRPWba1ie9QsmEL43RqKOX7WWPmD6tEHJWvh5rwg==
X-Received: by 2002:a17:902:ce92:b0:24c:8d45:8049 with SMTP id d9443c01a7336-25d27a27d59mr18806435ad.61.1757650069237;
        Thu, 11 Sep 2025 21:07:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:48 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:41 -0700
Subject: [PATCH v12 02/11] firmware: qcom: scm: add support for object
 invocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfX46h8xt/1rkm1
 EGx0wg6mQCub3125YG/ciAF0WkmiqVAluGAiSeB/DlIpg/rK7agJkyqmUIeHP/jjij9EmxGtCgd
 kUivekmCPLLoKC6+XHOPN93kbvR3p1E1QcnOD3+PMmvOLjxwurDxiOI1+0PHbwk/t3WEDkfryil
 VbvA4Mj8ofpC3mOOwlPgboBuv8LHkEKMakFaX0iSBbMcv1CgRQP1JrZFs9xjNM21xc6hprIV1yv
 yVxJuB4aw7FR+nENAcvD+eRCI5QsVlAO3irNY6k32fzSxwKEDLbbJRGto5uYqex1gszdu4wBMwR
 s0vciTRxB0oNye6ntLWfBbKN421BTnIftg5zV0hZjMOLxkSHlWa4/+yu5Gs4PlTrZuTn7gOpkI+
 kewJJqNU
X-Proofpoint-GUID: MCMreyTIQ0yYqlufnb5WYV7-cpLyM9eC
X-Proofpoint-ORIG-GUID: MCMreyTIQ0yYqlufnb5WYV7-cpLyM9eC
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c39c97 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=dBYAKgxw8cyf2mnx-aAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120

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


