Return-Path: <linux-arm-msm+bounces-87440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B914DCF3DC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6832830AAD09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAABF33D6E1;
	Mon,  5 Jan 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwC7XPXq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkolcsWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0633D6CB
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619430; cv=none; b=BQlmiD9njInbhHwt4Mty8TsaQscJtEOx9AZO4eft2Qm5h9PjxlkFLoSgwV4SKNgYLAfN7FKNM+gSsNqRAVZBR3KH8heTX9QA/uslhQR3xLQzJw/1XwLYo8U2hYwncUP35I3QtNIIQpG9VOOZU1rZQ+H0o7SgeBsbEHYYsZ73T0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619430; c=relaxed/simple;
	bh=vV2i1NyTT5LTxFd6mck1Wvy9FFgG40KJB1WlVoCg06A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNhGIMngt8lk1YhCAqDvvb3hbL56PY+eLDmAN6NYVy+UXd8Y5yzoIKjXQtCZ8Aymqh0x7sXe/9NdgoruAw2oNTMkTKpRK+RXpRd65+VZdhcaghn3oZYqpiO2LwWIMRiNWJijPxS+0RtwBNB8Ksf05JbYA6yZ5sOq93yHAfHEggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwC7XPXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkolcsWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60585nTd3610334
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rArl0MvZfgZ8hbnXrCbwTRUGC/3eEh7sF4jo2FZZGuY=; b=bwC7XPXqIRi3GLku
	20lfZSOiPv/MorNYx93Ja+QScbXJVLjZ2iRiv2NZm41Kr4g+PFlhmpD3cOBiz2bk
	qloqblsbjtgXxEz+u4t7+ukTKbVNoc0O5/XMWU8JUzr4Kz/dku7lMb3pmnLcRelW
	SmmDjNr/Q3ZpawU0TOfwGeCLqbo9gO8k/eT8+PR/cAhsqLC05K6smB+hi7Yrs1gT
	FefL+nTvzsfFV0xdI2hxFBImLSJimqhaOfsWNo2xQyNcqMqPcXeGH/5bl+yR2Iy+
	cXlENMVlXN3fA/uSl2jrSTcbbkzlmVOcq2wbI6BZdJmGPKXVq+kWrKH6yZm0T+g/
	egks2Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4jdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:23:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so13214762b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619428; x=1768224228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rArl0MvZfgZ8hbnXrCbwTRUGC/3eEh7sF4jo2FZZGuY=;
        b=gkolcsWcdBfKfdqc+FJlNHqbq+MfCIcCVy99T0JgNzhpvUHEPnD7pXnBYowfb7uMF7
         1s9Sb1cgBvv1q1eQJG9RY/QmAjNR8qrhxfxFodm4GRIG/+E7pS5MuISq1m/SiqEZRC6f
         HzHT66Ziw21f7reLCFSodtTLJ//Q5XwLTkbE3BENBDyalyc54mCrtA7xOZ1IxcxOs4q7
         yE8jPlhxYJQCWgBNnu7p7btxt+OgUTjgMI5WNjPnWGc9pJwAcqnD4TOsMhYFQFib0cAc
         klEXI7R+Z00pwr+WkuEEGIpXKODhetpZ3giqq99RoByf89jnbIyg4y1nqZPXSkYLJjNB
         N+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619428; x=1768224228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rArl0MvZfgZ8hbnXrCbwTRUGC/3eEh7sF4jo2FZZGuY=;
        b=CFxcbykm7Kjp+W0FMmxyCYQ4vPmIeRmYWTzj+zvXFB+ga6tEVQXRh21f1I7eXEOUsn
         yOoev2D+/iV5SFRAmDB3zxx9nXt7K62f+jU+bebC+ke/mNE7L5/51cYx0//0LIWjGmf/
         GLt5te3HSzqSgRdhlzg1Jj+FyH3RuMD8JICRpcakzDL1YeGYWWCrXscRA4Jb0SNGwlCv
         8lb6tb3efZ4HUXcySlT+ALyEco6kKw4eBMkLCM1c28HlzZaYW3a6jui+GKTBi7aK0FWe
         tGK1w6KWUanEWxE/it1/dUQuRfYt0XNUvlZianhiADnZCAwySFBHluFemb2ndGjYQcNV
         trXg==
X-Gm-Message-State: AOJu0YxlUdV87qoydjyEPptvSerYJcrXcy/JJErL0Cua6i/sAvThR4uj
	Wu/RZUaljfM5vsba5f8F/Rh5rv+ECtVSd7YQURPgxoCw9dzin5A6oKbOKOoE+1BX3Z+ESrc0gKE
	DBbeUZ0/7hZ1TpA7IMJ7R8XYasdVuNNWBwMLGntfJnAVbS2lB1WtMHcC8y9pFswBtMEV92BSWyS
	5I
X-Gm-Gg: AY/fxX6C5PBT2k4WVl18JhMqQP7N5fmDtohCMvAPEsOp/9kG1W+7xczrrOnQdnfcM+6
	ukoR+Ndpozf7tOWHe3Z1lfm0y8ovLyHLy8BiRCIP3YQIx33jrnRXGmUmKY7hsV1dCl4DeAAQ0Is
	x4zVQlEsk9b/UAgDmwtBUSFLImlYXAmPUgaV0/dSiLGeKZqye9JR5YqD90FBNQWs4ANl48ECuwY
	7otn6ajM6T+TT5insQ6xv/hkvVWvOSOt/q73LFLZ+RsxlE+gKUU7H2p5znzGPLgwqj3FFfdNltj
	eWW4EMi8vhJjdnjwQ1Q2qSJJ8U4Oeb3gYRsClX36Y3JmrI+d7IqrDT1mCy1z4KY29jfM3QYr/uo
	rXxPVdfHUVzwLn5dR84s1v3Pyu7E8kHUyCG7Q
X-Received: by 2002:a05:6a00:1f06:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ff64ed14d4mr41477234b3a.14.1767619427489;
        Mon, 05 Jan 2026 05:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF07VP7DR2q2g8nZGqguA7SimtIPegjXyDxGOTucGGQKUAbojeYUp868qyYH5VeepK8vfwb6A==
X-Received: by 2002:a05:6a00:1f06:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ff64ed14d4mr41477213b3a.14.1767619426874;
        Mon, 05 Jan 2026 05:23:46 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:46 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:56 +0530
Subject: [PATCH v10 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-8-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=4371;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=vV2i1NyTT5LTxFd6mck1Wvy9FFgG40KJB1WlVoCg06A=;
 b=2lxtiiaAsNEmn8ALiODKr2MB3dwuVPqx6IAzJm9audfD8MMdWvEHWJK6Vdfaltu1imPNNBtbV
 o3OFtp9MxGCDwiAPxEGiHUr7aNJvHTjc1MFUZsjG1lMYy+PqrHIwpGx
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: N2dc4h3pLAe9QutEJ_kiCVdDmezDd60j
X-Proofpoint-GUID: N2dc4h3pLAe9QutEJ_kiCVdDmezDd60j
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbb64 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kRiLafTeVKqDyNwm7Q0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfXz/A/DnzknsZY
 5wACFaoex0aE1dM9lXy33vDEIIKHTFy/NC0zrutkc4L/0GRlidMbrDuNbt1BLoQremK0UmwoCP3
 Te13/WFI86sUDm5yPtNEvHrMIr1GkzQ9QP+VneILah+Tn0B4PWK0COSFj6iiPjKveBWc9eEvAom
 1Tq42TXbYh00Fq/+x5F5KnHU5h/PCLYzs0w1x/EsCuWLQmV9EJ7COIsS8V7Xqd2NLyAzz7vH39f
 oRbcQPqKTeyKfp2FIR7TJFd0kVXBgjyktlU38cfkk6kgWl42eMZEf7gzRv7ApchTEvLKwUGdZfJ
 ZqcOOfmlW0WV9LMi7BD3jyRQqvnDllLIytwP2kX3nbaUKzqWVwDU2KFj1HTJ7yWvWxa2EuZOaMP
 xxdDaJ6wxFSj9MEDG51zG1hkJYZ53nxMLgJM0QwQuEBBfCrsyfVTtq2uPyS+n9QOhzJA18zmyaH
 3PDrT+OinMr7Yygz/Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

For memory passed to TrustZone (TZ), it must either be part of a pool
registered with TZ or explicitly registered via SHMbridge SMC calls.
When Gunyah hypervisor is present, PAS SMC calls from Linux running at
EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
creation for both metadata and remoteproc carveout memory before
invoking the calls to TZ.

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge before invoking PAS SMC
calls. For the auth_and_reset() call, the remoteproc carveout memory
must first be registered with TZ via a SHMbridge SMC call and once
authentication and reset are complete, the SHMbridge memory can be
deregistered.

Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
bridge over the remoteproc carveout memory when Linux operates at EL2.
This behavior is indicated by a new field added to the PAS context data
structure. The function then invokes the auth_and_reset SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 47 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fcb7620b83a4..de71536ef591 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -765,6 +765,53 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
+/**
+ * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
+ *					   remote processor
+ *
+ * @ctx:	Context saved during call to qcom_scm_pas_context_init()
+ *
+ * This function performs the necessary steps to prepare a PAS subsystem,
+ * authenticate it using the provided metadata, and initiate a reset sequence.
+ *
+ * It should be used when Linux is in control setting up the IOMMU hardware
+ * for remote subsystem during secure firmware loading processes. The preparation
+ * step sets up a shmbridge over the firmware memory before TrustZone accesses the
+ * firmware memory region for authentication. The authentication step verifies
+ * the integrity and authenticity of the firmware or configuration using secure
+ * metadata. Finally, the reset step ensures the subsystem starts in a clean and
+ * sane state.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
+{
+	u64 handle;
+	int ret;
+
+	/*
+	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
+	 * auth_and_reset call and create an shmbridge on the remote subsystem
+	 * memory region and then invokes a call to TrustZone to authenticate.
+	 */
+	if (!ctx->use_tzmem)
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
+	 * subsequently call TrustZone for authenticate and reset.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
+	qcom_tzmem_shm_bridge_delete(handle);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
+
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @pas_id:	peripheral authentication service id
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index ad69b51fe6fc..d6d83888bb75 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -74,6 +74,7 @@ struct qcom_scm_pas_context {
 	void *ptr;
 	dma_addr_t phys;
 	ssize_t size;
+	bool use_tzmem;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
@@ -87,6 +88,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1


