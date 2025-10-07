Return-Path: <linux-arm-msm+bounces-76242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC44BC2276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE05619A516D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98232E92B3;
	Tue,  7 Oct 2025 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQSHA6br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6E52E8DEA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855771; cv=none; b=rjKHwuAJjCPPiUvZF8mn8QfxykawM9M5XWgCY3vCQXl/RL7FGqYvyfBV9HgOd2yilcXKPnQvtIY/0pCZ4CccSnYH5atRguv58FeywKgOXeu90KiCeLjMnvw0gYcrxiy+wstNUWSP4PYVpf0fZnzUN21K1uPbRMNJ9wJSN5cU/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855771; c=relaxed/simple;
	bh=DuE7Kv7QoXg4yMkqF0Nqit8g8P9JPMJqyoG4dmGRg68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JclqJa10hFdrCJj6jYtHYMtBv6YRbmCsNRJZPqIfcx/KiKV5BV43WTj5f/eTS7iWjLuLrf31slD7xOZkbg9LQQkowLZubtK9Lxmnn9FOay5/Nu5sS2cxPdgQGIGSednZWqWsMRYQ06atRA/ONI8Njy/nnBiu01BKGtNCgECN+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQSHA6br; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7bk031501
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV48b0/pnp1fgCAZQFL7AP47khxuiCtxTkt4ytFyHa0=; b=cQSHA6brtoqoH13s
	opEJ8zis8P++TwKgQDN4tQzHoFfUbtw82nITMEvuM22yERYuR0JzBWBe3Qrb0K6W
	nm1VFiunCjCSt1ROJ12ug8upLBdeNf5KsJCVTnTFr9FLSHiOQINM30C/ucjA4BtV
	JsuGtXEoNGutxRh2kZZahP+NJFeXHPSFxArpMaX3s0RMWmqtf9fjwON0LXNj+pNc
	N7B2ZAxQYdiYbxFBj3U44KfCd8bIdGP9EKjA6p7zLFa0+cQNvBibUB4SJ1J8EkQI
	A+r2mgVVaTu57BeOWsylEafW2KXjm9JwXcFg2FQqZji2P2HbPzs/DoljkrLV7Aag
	BlryCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk700h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e538b5f23so70378505ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855767; x=1760460567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hV48b0/pnp1fgCAZQFL7AP47khxuiCtxTkt4ytFyHa0=;
        b=R37v00r5rbQjyELRpTSAA4zGLCe178O81i1ygMalX2QlnsKbLLl4ISFTHk/RgBk/Xx
         3U7TnoP4BF6+x/nf5ARHHDzr71WU77C+LFqNKSpevQuKZka0ufYcMnHd0KAOJuelzG9w
         USphFyc9I1TPWlhE+oE8j4oM1HRUBHAS/U9DJ1XMYtoBn/W7sMQFriwVoQm5Eaxh9pf1
         Vjtkf7V5kUrBLefc8E8j5HZz1qInCIj5zL1rQKnXnyHFCvWapRiITP3yr3DyI6Rg0UpU
         rDCO+QDgRV0saafQH/3cxCz8S9fvR8DVCxJh8PAbClD+9TVozgwbtdq/a6aRFPtqX61h
         T8rA==
X-Gm-Message-State: AOJu0YxJX5YN49ntjPq2fT4IrEn6zg4b0jGv+BcdJ3jU7dTK7Irw9G71
	GpQzeS0YkiDq9gbJxz7jOmq51oz6lp7tPwZRQ6rCzZa0z8zn84f2iazH0R6rTD9Bb0tpH99cBIp
	AThjRfSh+kYGreuX5PTnAoY2Sk3b+aUshtRk0NNLd632VbmZTq0d0HNqUGMg8fpdz6tkp
X-Gm-Gg: ASbGncvJw9AG2dXAX64jw0pEVcK0WIoY52BRo/EFAgvtFeJB47cTM9abd893JF3LfvB
	ftxqEoShV26LHRn1tvJsJKaS9vMD5INtaP7cqUooIuFYC/asG6w85eHB36jX1mHCvMBgkza/0+/
	UuP+qycijPLXX7AhMLpfX24gmJVoktsT7AMULxkGn9yXxKmIM4iFQgFQ/jlwP2hAqggyFAFmhzs
	f4e5YDM+kwBjRA1HDx3eG4p1ivMf+VJ7Rjy7XnJrgTbL/F27UrM8eHIfOipwkeeAmuxwf1MdbpV
	8Op0n5hfe3nXuF5I22sZ0cotNaHCrJ4ZRiDpxCJv1aTXvlt0MeZvAggYmuwoVoQ05FB4r0Dp
X-Received: by 2002:a17:903:2342:b0:28d:1815:6382 with SMTP id d9443c01a7336-290272e3ed2mr5243115ad.46.1759855766866;
        Tue, 07 Oct 2025 09:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl/MugAOwY2ka+h2YJg4YokR09ybssyIndqquRHy+ALHQJCKwsSPnKO3Ej1DDvZbmJc9AP2Q==
X-Received: by 2002:a17:903:2342:b0:28d:1815:6382 with SMTP id d9443c01a7336-290272e3ed2mr5242725ad.46.1759855766216;
        Tue, 07 Oct 2025 09:49:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:48 +0530
Subject: [PATCH v4 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=4540;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DuE7Kv7QoXg4yMkqF0Nqit8g8P9JPMJqyoG4dmGRg68=;
 b=OzYrVBTuRvqiviPCxW5zFBaao6FEOlOeHLWkwFqRizDeD8rkXfu78xUqflIUQZC+Lo5hHs3V5
 szZEhCJSUoiCkD3LhzW9XLHYFDXtfQKC0lStzvgb4SUMAt6Qv9u9Qz5
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX5h8mcf345T5Z
 +CTqctOG9+j/YwpggccYcz8SVSVV2e9JdsNWyuCcrEiht3xM+JdUwcSJtjafDEzA4u1jSCk9Cpu
 t5xPhimXSxR/GYiJI8n7TmgadveYUWTYiVQB0rUxrbSfTLRhkuoxEUB6gYKExPfMqy1LEPtE/0F
 KJCPNSz99ktILb9XUCdzsLR3FsyIhequeq2FeDrmOgABGAjSq10K0Biqz4MXNrROfGH0zwAibn+
 W0sWdl/f5gLIZsBDTbrLkgFyZGY3kUO+CfHYo1kmQ/M9tfPWcUAjgFWXOujR+sjyApRplo2PIp8
 hr4PN2HvGI4qbKnChUKW86EgclD37cj6Sq24oSQs9tuRPmlS1Hzi4mkSEpl4OeJdJfn0xxdcWxB
 aox/HMfhFWZv0OJ6yBmRxojQCo07vQ==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e54498 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=-i9yLzQnIfY35_RK680A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Vp20mN7uLn0KJPKZ63ZSKnWAJrHflyqF
X-Proofpoint-ORIG-GUID: Vp20mN7uLn0KJPKZ63ZSKnWAJrHflyqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

When the Peripheral Authentication Service (PAS) method runs on a SoC
where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
reset sequences are handled by TrustZone. In such cases, Linux must
perform additional steps before invoking PAS SMC calls, such as creating
a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
these additional steps when Linux runs at EL2.

To support this, there is a need for a data structure that can be
initialized prior to invoking any SMC or MDT functions. This structure
allows those functions to determine whether they are operating in the
presence or absence of the Gunyah hypervisor and behave accordingly.

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to differences in
metadata context handling. Remoteproc subsystems retain the metadata
context until authentication and reset are completed, while
non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
retain the metadata context and can free it within the
qcom_scm_pas_init() call by passing a NULL context parameter and due to
these differences, it is not possible to extend metadata context
handling to support remoteproc and non remoteproc subsystem use PAS
operations, when Linux operates at EL2.

Add PAS context data structure and helper functions to initialize and
destroy it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 54 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 11 +++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3379607eaf94..b8ce4fc34dbe 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,60 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * qcom_scm_pas_context_init() - Initialize peripheral authentication service
+ *				 context for a given peripheral and it can be
+ *				 destroyed with qcom_scm_pas_context_destroy()
+ *				 to release the context
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
+ */
+void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+				size_t mem_size)
+{
+	struct qcom_scm_pas_context *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+
+	ctx->metadata = kzalloc(sizeof(*ctx->metadata), GFP_KERNEL);
+	if (!ctx->metadata) {
+		kfree(ctx);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
+
+/**
+ * qcom_scm_pas_context_destroy() - release PAS context
+ *
+ * @ctx:	PAS context
+ */
+void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
+{
+	kfree(ctx->metadata);
+	ctx->metadata = NULL;
+	ctx->dev = NULL;
+	ctx->pas_id = 0;
+	ctx->mem_phys = 0;
+	ctx->mem_size = 0;
+	kfree(ctx);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..e82fdc200df7 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_context {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	struct qcom_scm_pas_metadata *metadata;
+};
+
+void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+				size_t mem_size);
+void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1


