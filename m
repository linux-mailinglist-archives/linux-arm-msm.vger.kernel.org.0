Return-Path: <linux-arm-msm+bounces-87436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20860CF3D46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F3B43022808
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275D633B955;
	Mon,  5 Jan 2026 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgmxVvoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7KNwkRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745533B96A
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619415; cv=none; b=tedzpRhWdI+zBVTgTCPL5MVyvQ2WNTvOgEvqDhMAEK5PvtrRusagVCnhtBViu2z3xBKEAz/0Bk0OwlOCuVrdwyrBTiyYYG4ANTc0tpKpd6jq7WSc9p46vs/CR5Bvm1zh/SM+bF0+Mhqh9Laj94zhmc9QmHzkcKcG84PWkLsV57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619415; c=relaxed/simple;
	bh=HrLkG36I07Ib0XRgEzoPfMEgZMeQfHT6NhYwPB4Ll/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDwzO0X7LclFPRx70KHJ3BLrTF3HPr8dLN7v9cQDloQKYZQhgduBYgBBgekbRhB7GFnydMCnm7004+Uzmeu6j8hLjCZJAKwGYhj4ETmB4kfZHSZBrnKzkBN+ZMMu74t8vtgBPjXx6Gp7vajjxPHnZVagVY+PX+1BBnIwTdQU7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgmxVvoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7KNwkRZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059d0BT610666
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ixUkiWjvrA2xnuQivPNMlYRl32u7TOycV7BpXyApjM=; b=TgmxVvoYUlLvcu4F
	1aCF99jzASv23+RPtdpBV8v87aMdpFk0Gesh1SU/OSa5s9slFDas+iubdhXQZPIB
	xg+cHdC8rChoAmeXelqldFYSPa0PcXzIJCSIdIQWB3Hijb+jOoa1mbXS+vAItdLy
	iyc3mMwAjcoMIUnTuRsa3FkiCT7z3eNSnqtJx3yGAtQx47LVXTM8bbov3O+wTsM3
	VcOcR+tcZ4WHEij/NijV9l6+qjpaeEvs+J5z1aCMTaaFrAvp3X9AvUxuXYkpuG2p
	YxurqE5Y4yZQea1dQQSwxVXt97f/nWxi0wQbPzmAAOwzBE4WIE50DBd3GviSZQYx
	0W3o/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0hj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f21951c317so11253500b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619412; x=1768224212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ixUkiWjvrA2xnuQivPNMlYRl32u7TOycV7BpXyApjM=;
        b=I7KNwkRZUbSoY+kTnnkyhIppabcjsoUzsOzyKwSV2LUXHZkoCNkrnr/6tS0S61E5R2
         IkE18oHkr5RTtYct3M75e7eYZSJ8IU2vwEO3i95sADbhHM4CT4YC+pWMyHEP9CNJCLah
         mg7KpNI3/Et2CUqzOEKfOVl+yZXpxa5gKC+R5T5/5A/2LT4tGOXGsR8vyFus9sYlWb4r
         9AyLT7Xzgie+XE4CrNthLBdLYAQfqSJy375Y4rrRWrE9uSgQuEZxrjjWsVcI1pGH0c9g
         NY3VNd8DNQjZTomvtFy/NKccxO+ThDaA9gd2P7zbkspG7ZhM2LgKXPcSSn9OFPYjG6Bd
         AtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619412; x=1768224212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ixUkiWjvrA2xnuQivPNMlYRl32u7TOycV7BpXyApjM=;
        b=Qq/pKxcSdG9asM5HLuKiBLl7/HT5fcjb5o9Ckr9cXAsCbUoY7zMzMsASx/Q5l+A/kY
         JJByCg2B8ORuE2GJPbgIHFJNB2AyNYTLWWdPy6kKnvFpuQ9YsPirOKBCMu3MGVno5Tx+
         Qt1WOy6bvNLUIdd7H+ypnSY0OwI0uplhmfuF/3O4HBnTLU2o2tp4W+oLSXCe0gL+qkQ1
         2cxP4/9k4lN9y9cgQa71F2hEG+S+SN0blM5xHjf5EcfUDxDP6gdwu72E9FJQ5NUBfkI0
         pOS0DqXjNSjdSXQNoS54hJSGVqpm010/xfwW56KhzSvOo/+pNxH7I2RJVAeGYXHT28Kx
         OnUg==
X-Gm-Message-State: AOJu0YxkP62ixxcicLHe0O8BXSy7mLJU8yOlbsSZnzD5TgLc+F9km5Hw
	lZUey84ADrBhM4jamDwk30Wj3VXzNJ9J+H122OtM58MqNR/4UQ/q4AZnDJX0L4VqMpBMM3DNsWO
	JUvb8rffeIwIOll+LKO6zwQsql3oNRlHvMjTo77JmQloJa+nurSCWwGSYREVMVujEx1Bl
X-Gm-Gg: AY/fxX4ys01rWU8PB4FDNtwCIlrY8fBarEtlyGQasZpzaw8kgIFWzceb8i3HDcBnMGB
	vhq/VXU1CvrsvzRSf6fTtb7nJWRYBkZIY/Iu62M9l/RHqu2PKqqUzlI8oM0viiZKuisxwP5TGNZ
	aRLsYaNqAwl8/wAToNyScPtFatgW8KBntlE7l10EdiYJS1CAdaZwub1s8UJO1+wFNDbBJAi9HPr
	8Yyek5Ub9rbYgIKklDovLKf4ObMV7oJLfrrMcwULK5mUU1xZIgwIBpQdUhRMyZjueRictChM++E
	iAvbhlaAfZ8BWFaK1DEAd6I+beNcIRTDjQF316lbgqNgQ4ROwfK+U9kvQe4wwX1TXVpXSxRJn7c
	E6F7uSzsyeuVadh4oF/NY8E1G3t0FdwUBcL5R
X-Received: by 2002:a05:6a00:4483:b0:7e8:4471:8e4 with SMTP id d2e1a72fcca58-7ff66f5ae03mr38215247b3a.69.1767619411404;
        Mon, 05 Jan 2026 05:23:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+OmHz3U8kN2GWNtwM65IjApm5j0ep/tO3ITPoxAyzCoic25jZF7MQ25wgM4nE9IGG8nMJhg==
X-Received: by 2002:a05:6a00:4483:b0:7e8:4471:8e4 with SMTP id d2e1a72fcca58-7ff66f5ae03mr38215227b3a.69.1767619410822;
        Mon, 05 Jan 2026 05:23:30 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:30 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:52 +0530
Subject: [PATCH v10 04/14] firmware: qcom_scm: Introduce PAS context
 allocator helper function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-4-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=4036;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=HrLkG36I07Ib0XRgEzoPfMEgZMeQfHT6NhYwPB4Ll/Q=;
 b=YiRaLse+KM8syyQNGIDwZvKaM1DSMbpFOU4ROmDFa2yVE9Paj9VMYZI8oxQ03C2ZkNdgyI/X5
 /oSxL26nZJfABAeJBF7CAAQZ1zSuYkLon7814XQ9qEfh70m07uk1eun
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: KDinwcRsLpO10XBjQ2Q56kTDZhnEMpAb
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bbb54 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FtZ2CgB1kwCBZN0VdloA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: KDinwcRsLpO10XBjQ2Q56kTDZhnEMpAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX1CUDODM7nHU2
 J9zW3LTxrm2v85bpZpNfHaZUcLn7IKmcmQoz4awlkDdMK1L/IK1IpyP7pTbJDlKutpmweOK3gkN
 j/YSu8nHHM2/HcPtr9uzjf3+eMTwce56NUlxkmhPxQvaHigv5Wp6s7SUaZgPYkMndLnjeR5LqQr
 oGEJGfUuyDlPIdmnsVf0PM47fDQHey1u1U5m2c9taZurSfDZkx5v/Uy7ECgAogd9limXVnHuLnI
 93FQUiqEDwQY5JIORU5jOTW02p24YyEn6xuI7mV1KiTE904zr3QdjCf0qQXvaxUbSJJh2BLdx3/
 g8kiTwPqx0YZjuKtAbYUPi8G+0NnP5i7km2N0F5nDoQcaydWdZhjOUdbSZbf46i+FPCvqQKQ92Z
 TybpOJ4tmuJrQH0xu2LtRPP0Z+hbKCRvnsWkROv074Whk8pBVMuLiGaGYgI1hxKXGhM3jHv5N0V
 O7ZcNZUa8WsdLASgSVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050117

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

Add PAS context data structure allocator helper function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0a4d5d58c177..43a6187f4bd2 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,40 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
+ *				       context for a given peripheral
+ *
+ * PAS context is device-resource managed, so the caller does not need
+ * to worry about freeing the context memory.
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Returns: The new PAS context, or ERR_PTR() on failure.
+ */
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
+							     u32 pas_id,
+							     phys_addr_t mem_phys,
+							     size_t mem_size)
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
+EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..5045f8fe876d 100644
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
+struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
+							     u32 pas_id,
+							     phys_addr_t mem_phys,
+							     size_t mem_size);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1


