Return-Path: <linux-arm-msm+bounces-82810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55EC789FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5AC354E991C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08186349AE6;
	Fri, 21 Nov 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9qJAf/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFk78eB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA3346775
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722903; cv=none; b=T2jCoM0s32eZD6s2pZkZ83c+sEfTPz6r2eVuQiPuS2xjhf2VWbEFElKx1AuT0FNUSogt+SxWg0mBrp8RSeIgJk+aIzBU/7ajl+UA9OaRtgifllB/I4FH/zHOGiZC3EhBeSUmye1bPFfaYPxFJ/le7ugfV4bpf+O5S1BMKDmuxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722903; c=relaxed/simple;
	bh=atRUbTe1wqlw66lPTwU2h2uX5zOo7TURemVlkzfSfrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7up2Ek6/RmPY81vIWy/wk1gPXTAboManOI3uYNFbI/vA91jeaXO9msyLtysKeFTqGAJ3kG4e96kyEkOmcU61lY8AOY2BzQBOFZMcoBHU2gu6r8N/pNW5lz08lcMxMgQF0KaNQIddsLLyg+ahIkD0QR6fEJCR0yMG4xqwTaeM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9qJAf/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFk78eB4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7A1Tq1637274
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGMHteN96D+kdzeh+oroZ90SMRQswPS3eyagrABl0U8=; b=P9qJAf/uka3Y281l
	oBnIVLQn5yirzjIadTqJYSCgqNpQPfzc0SGMe+bj/6riFGxNm51yjrP4cgrujCPq
	bU1M+6hvvXB2t9XjyNuoOEj2SCaXMpMgfoOis2Tk0h8xA0ChmVvkEwd+rmLXb+6O
	+5ums39EIPU/52vHiFXJnY9gX4GFEeXXkVJZmvdsOZwvmkilzSN56BWdX21yW23M
	3QZN64ad0rX1HU1xS0zMcejP5AW+zjtBAOgIYBVpfqMrGDZXVaxJXZDwNxx3TMeh
	oiL4i7ZROoHvIXNVM+HPU89EyVJPjL8+Vpz+lrS0Zw8oQOU8mBibHS15/DPF+ngW
	unTkXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagatagp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c261fb38so3580238a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722900; x=1764327700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGMHteN96D+kdzeh+oroZ90SMRQswPS3eyagrABl0U8=;
        b=CFk78eB4IRHHTNgB7JSQuDrVY9XAhqRFqujuf1zuyUI054sO/EYlNPVB5gASFcj8SO
         j858VZMVV/VXYdjkiuX0KbKii6VWyosgGB3DF3Je/F2yiNPgP+yuCa8H1n4PJpXiAO1i
         rfmNIZae6G8Xr7hy//t/Sxqdkml2XjfLaTPNN2bIzPMj9yeHWu0Vqw65kczKZjniK/ol
         P7xJ/epMyW7zIxaQgUXhoordyaamSaUadUwqjFx9bTj37oc/VYjAP2TUOv4fqqggwwvz
         quusLwc5AbKoplkQyyNQ03XQMDTdvNHHyzAv1v1qgyqqfybvV5xjAzRcuaFDC9FsxRQO
         RGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722900; x=1764327700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGMHteN96D+kdzeh+oroZ90SMRQswPS3eyagrABl0U8=;
        b=VCrw5eWClizGBkt8qs26pbv2ZgZ+t+yDXvuX6kDBLH1sxFu3IwCzbhRQ2ZOJ8BC+Lv
         2Q8Hh2YnJq/s98k5DXTZcjaqYAZ17FYEs4Xs5PyQjtCsIh6rSGWR4U3ORLog8aRjM8i1
         G9/RDFyxCebE/Kw1h4SPXDqT6p22CZW8zIsbGbRY6CD/6T0T8SdBJ8nONRT9Bcn5x9LR
         qp3G6zsjyc0jMJuGS/rH6hWxsZgYAJLJXPL1wQs2m5MRDjw+C5e8grjAZN8VqjrOC51m
         tGf+mlUfNC7FNGRfj5c5z+vowkBH6zjRcUtV/0Dtn2iw3/q6IEQbdrFJMjUnO5KYWQNw
         uYiw==
X-Gm-Message-State: AOJu0YxJHmynZX6VVqemRI/x8CNGgWahKDiTcisXwrgaaegFN9uJHWWi
	L0Xz3y7xm5VXLc8qnjiYBK9UumFEgyNwHKzzRlwjFXNMijdO3n4Q5h/2Gt79y0CwFBerAwTB9+q
	n7ypIO9jLcofkcu+34lqphF2JMQLvOUok05Bbc4YLS8V+huOV/fEm5F3BXJr2ljdzX3bv
X-Gm-Gg: ASbGncsouIAdjjByYospSX83ccFse76pXG6VkeUxpqoJVFiYXfCVK1F6ud7b6IdRXgc
	4RxioAyFzK+VD5sioT6YTOrEj5OoyMZ4W4/n7cSocMRmzDpwS7fFZQVxI0HynIiCeDZ0IvazWCd
	tgC8dwxn2X6r23/WHvN+V11JuQNyuuVx/QPBgTcyHf+bpap1w/TGl8tuLBHymy98gv2BYLsOnQX
	4oV+zjCsAb7cCP9A38fKFfAyhr7p/RBguZnu4/ofIHQIej2xvseBRrF++TE7G6a8kdnnHmf2d9f
	okD7RRvdJZXLuZuItSKQ3deI0v5ZkDvAa20XtTmqAbswv0YNQrhtsrRv0Q7mYBDok9ojvOnzTri
	BMbikW0hldZfLWNaRM2k1JQCyeh0GF+1/HFt8
X-Received: by 2002:a17:90b:2f4b:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-34733f2de45mr2302148a91.20.1763722899585;
        Fri, 21 Nov 2025 03:01:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHun6eTxQZztKqbKIy4EXfyv4Laf/KztaRT+F0JNkqQRthBtd5FcxMQdybDyeVSM2bhhR66sQ==
X-Received: by 2002:a17:90b:2f4b:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-34733f2de45mr2302072a91.20.1763722898933;
        Fri, 21 Nov 2025 03:01:38 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:38 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:06 +0530
Subject: [PATCH v8 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-4-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=4059;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=atRUbTe1wqlw66lPTwU2h2uX5zOo7TURemVlkzfSfrQ=;
 b=bHlSlo92n3VgckL++DWPpGBDbCq4f5xm9w2gE7vSUVmjL7bmjBaXcP/cS2TVKuaTmB74lmOPv
 6UqD0RSxxo2BaXHGvpphrEyeIlCv6Uj1EDZiQZ0ovWA3gJLlWIEVh7W
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=69204694 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FtZ2CgB1kwCBZN0VdloA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXyoL2q2zWS9zT
 Dyc7VuaGbEO/sIMj2slf0kqC3t8cqLtkVkoRDxVNuYVynrbh+UNeW6nBRA7lWmgZrZgWhY3guf/
 G5XiCQ0ESO1YLr0hcMS+Yb7i4Tzx/XisJQ7d1cM4VIaFKJpDXDyVS8oCvIPD4NRh7WLI44Nxwzz
 eaXdY1Qd6hR4nTEwp4vWZvfnRETRnNXpbDz4tb8RBstRZp50hyUE7LXA9iFcn8b29+vHo3Cloe3
 KwztiMccyT5navbqNq25XTpciin+K6Pjl+uvKUeFgcOk3tl3h1h+1+T4zP3s8fx7pa3rggz8OOQ
 3o5p3db7bn//2NUwz+nM1rDfag7NCfBi2GjuQE/8xzDfGkf/g3PUh6hPYc5A3K/VZCa5FoqaYmK
 pCYmEdiUfHt4C/wOVmy8NMQc8ZT8+Q==
X-Proofpoint-ORIG-GUID: OFzbwDZvoVoRBMUTNsIDSVRKJvjZsb-G
X-Proofpoint-GUID: OFzbwDZvoVoRBMUTNsIDSVRKJvjZsb-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

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

Add PAS context data structure and initialization helper function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0a0c48fca7cf..e9e9d03ea36a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,40 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
+ *				      context for a given peripheral
+ *
+ * PAS context is device-resource managed, so the caller does not need
+ * to worry about freeing the context memory.
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
+ */
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
+							    u32 pas_id,
+							    phys_addr_t mem_phys,
+							    size_t mem_size)
+{
+	struct qcom_scm_pas_context *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..4a57fa676513 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,20 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_context {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	void *ptr;
+	dma_addr_t phys;
+	ssize_t size;
+};
+
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
+							    u32 pas_id,
+							    phys_addr_t mem_phys,
+							    size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1


