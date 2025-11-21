Return-Path: <linux-arm-msm+bounces-82817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD706C78A4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id DD17B29355
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBA7347FED;
	Fri, 21 Nov 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epVQvIcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nws86s/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCA34C98F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722932; cv=none; b=C9E5w++/I13PAewexZHyLWF41erx4L1ImGzmrCgE+e4BdT0f6aEwznCkWrwP1ZzUJVKySlqvQzcgkiPWASJ2l7VGC3rbqO4JcJHIKfQUQWOtJK7qCnoCpuQZRv5Ut4vUwm01nTa3j5NFPC4vh45xyQY72wmYuyeXy9fULVt6A2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722932; c=relaxed/simple;
	bh=WWOhgu+15cNgL+gz2TfzhH1wjXOgU6AXMCE0AZOZb5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOzo5Nwz3Mihm1hoKg5Sekll13i1Fp0PEfvMx9Es4CXixbMnFYpvAxbxi4M8WJlk7D5xm/+mObGVX0VJXxF/ag99bVfuhZWAFECJszgHg8Nk/sapqLtsmINx5pZMHjqUUfXmFgn+z92BKg1U7Tm6KsojsSvXxFfhpkCmOaXIEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epVQvIcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nws86s/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5Rtcv2756789
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXAFQ6vcXOpUfeBjvRMj2UfNd+ePc1XpZL5gXuKOA7s=; b=epVQvIcGO6h/yhYU
	ojnbgwtCn9rSR4Li+wSTDYHbC1gkgzY1xZwXlK4Hz/Vzb9vRhY1bsYzjUygL55CI
	RFCjZt9uEaiYSjDzCmPqhZCZZuQL0eh8PXzqnUJAmJHUEbGBsig83AqmSlui3oSZ
	iHFYi5gWpqUmQ8RRjeSKE0Dwq44e2F3c9DeA1wFITAxHMKuPUsBLXb9rFFzs8FIp
	UN3AypI4cb3+/OJtGWRnrnkLPv4POAkGH3sLSSKiVguX/skipJOzBsnQx4j262Nz
	UCu97lfulviFAxoKlZ3j00qKJeKLQfuZR8fuyZCMKu6vi8PtfFo+tgV4/Ku0S0Sc
	8B8zzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy615bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:02:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso5613672a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722928; x=1764327728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXAFQ6vcXOpUfeBjvRMj2UfNd+ePc1XpZL5gXuKOA7s=;
        b=Nws86s/WrT6Fa5tNHNbd4Gy3h0GB+uVr92KTXPodgMmSSAox32mKRbFyex1IbJOy/g
         bwB6DuaTYIEidYh1MtvHArylYn7VvsLpzgUGU7/8WaAKOaubyVQVCyDmltDEYOi2Tk6J
         UBNF2CTSiUIUGA+hwf6To0uYub0Q/5bOJT4sOwIDV7zJdUQdLF4mkWm2kxHlfzpjZole
         e8xcOAN2Ga37DjALveCMAiQukG5pdI/sJI9/V1HUHNVOoy/z7Ly+I8x7WTHyOLNZcDy2
         7vaTWNWwMx09C4YDBNyhUaji+mHXodpAX2yc+/3QSiXJPLPxPij0lfr3uqF9ileKae5z
         VEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722928; x=1764327728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXAFQ6vcXOpUfeBjvRMj2UfNd+ePc1XpZL5gXuKOA7s=;
        b=llahZLjSTLRTslGQpBAdydxNiyys0G2svFQpgpoERjecSAN2UAbr2M+u6oRxJsgJ3I
         YKNld4yquXtMZ1DJ8jULIe+pvD13PLk6bkGCowWqiQBjEaB1naXqtG9bTQp+QWBGVNVJ
         XZMpgCP+ztbyuIb5XQGcc9uFkxUKX8t60XCzxgvAwoWw82jWboYofmNAQwIiOwncNpWa
         IDERjbbB6NHcFu3DkPpzAIbe4f9bEFVN5GXJ02t4lAemqP7CrvTtRxTd9DoC/AhDwFrS
         i8pfk9KMge27LL5gedjge1TS3jyOXwPS5GEyTmLZ9cMR8yxncs2cl6sxTOaPSWtJYxeU
         wpFg==
X-Gm-Message-State: AOJu0Yw4Mcbn12iDP3pJDc6WH2cmAFgNX+usJawJW7gxhTzDQF52gcTu
	KMAXp7DrLhIVKWzRlft1e+Y8i/kiifxE/d7Ecd+sTbscfiomneMTf2k23Gwac3hQxcRKom5lWrU
	QB/yFo+IIRhJSI30NV0CvT1iD6TsdUVEXlxW43q6N8f+W9QsrLgTiIuyo6RI5e8hkYCcC
X-Gm-Gg: ASbGncsZ6AilFxEZ8kJ5qf5xIkjrwo9f8CE78BQcSYlC7hkxHPXAcPt0oE+ASIli6Kr
	le3vKfhHTRy71rl6A7shJuhS7hW2WxnACbja4MJN2uWZmGTJ0X8XgtHR6fJhCBBK6+VgELKSOjO
	/go+qQxgzo7KkLhw78WZGEJ/T0p9dm7O7ImY8GsNCIFrnEvoMyHDScbpFg7xwOUn65De8lqlyxI
	h6H3pWeoBraMwLbbSrkiZKFCKKGJ8Du32fMRPIetH2yCa2bI2tbH7C5l0hhFiXuk7iF7BdWybDB
	GbIpwsEMtQA3FcYTv5qd1yNMy65s/V5I/EGFEaP1L2IlQxK+ZCkYNuEEEnNeWqRpDGnOFBv4v6X
	NWpAlntURKX3k+5R7ujtX7YmiCb9IqJ5RuzbJ
X-Received: by 2002:a17:90b:2b8c:b0:340:cb18:922 with SMTP id 98e67ed59e1d1-34733e794e0mr2681468a91.14.1763722927842;
        Fri, 21 Nov 2025 03:02:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH/wWdGg+S/9wqhUP617bIhp/9ZyuuJbpQ9d3RLQMXrEEckDyKTEBzOwXL2FgEymyJI7CBxw==
X-Received: by 2002:a17:90b:2b8c:b0:340:cb18:922 with SMTP id 98e67ed59e1d1-34733e794e0mr2681401a91.14.1763722927040;
        Fri, 21 Nov 2025 03:02:07 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:02:06 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:13 +0530
Subject: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=9190;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=WWOhgu+15cNgL+gz2TfzhH1wjXOgU6AXMCE0AZOZb5w=;
 b=iXGow2RnQMWDX58PYo9RNlYKnazWr/PM0U7m/laZerfZ2gZxJ7Kf1RDHdipvAfEuzlm60gPr5
 IEhVetEMFd3BYHS71gevEZVzACGND3zaLH9DV6kWKygq3YfXS9j36ns
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=692046b1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KFEUUOXM5gBsW3BA6b4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ohte07ZyT8qkSJBE6sLsMqvrfY-rOag1
X-Proofpoint-GUID: ohte07ZyT8qkSJBE6sLsMqvrfY-rOag1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX/glQN+sYNtET
 do9sitVys9n9qwmyzdDY2tCFKBEzA8rl2btTfiAtK8fSc3uzTiKBYABEuS7ZQ4sC7hEiUYzZ0mN
 dp9YCetC9JvK78TFyZjZ3Tpb+LEsKZe1QrmX8t75moK0AmBc2TWkqvoTh8Bo1ufs92Qqlg9jtxa
 sAroqfE3DSS4mDwxyWXLubOTYI0oV63eq77dHZHNFtip6r+IoeKD8XzeBAm7si2apFaDeIqvo88
 YULf45EgwiJDO0Dj8et9gfGmU0G+3NrcoCWdGvE4HsbPjmGk22AUKtJqDIzDAsx7s7KaIzdDx4L
 pHMQf9hkVfFomMytq4c5WWQK9wCnC2qJpY6FF2YBStDtVlaJ9QIXUmq9kgctWqQjPKuLnG9Ltjx
 1zrezMknl6XWcdYK+jKyb+OhekoI1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

Qualcomm remote processor may rely on Static and Dynamic resources for
it to be functional. Static resources are fixed like for example,
memory-mapped addresses required by the subsystem and dynamic
resources, such as shared memory in DDR etc., are determined at
runtime during the boot process.

For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
hypervisor, all the resources whether it is static or dynamic, is
managed by the hypervisor. Dynamic resources if it is present for a
remote processor will always be coming from secure world via SMC call
while static resources may be present in remote processor firmware
binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
with dynamic resources.

Some of the remote processor drivers, such as video, GPU, IPA, etc., do
not check whether resources are present in their remote processor
firmware binary. In such cases, the caller of this function should set
input_rt and input_rt_size as NULL and zero respectively. Remoteproc
framework has method to check whether firmware binary contain resources
or not and they should be pass resource table pointer to input_rt and
resource table size to input_rt_size and this will be forwarded to
TrustZone for authentication. TrustZone will then append the dynamic
resources and return the complete resource table in output_rt

More about documentation on resource table format can be found in
include/linux/remoteproc.h

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 158 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   1 +
 include/linux/firmware/qcom/qcom_scm.h |   4 +
 3 files changed, 163 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 84498d0d2f0c..c4420b79fb57 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -27,6 +27,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
+#include <linux/remoteproc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
@@ -111,6 +112,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+enum qcom_scm_rsctable_resp_type {
+	RSCTABLE_BUFFER_NOT_SUFFICIENT		= 20,
+};
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -766,6 +771,159 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
 
+static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt, size_t input_rt_size,
+					void **output_rt, size_t *output_rt_size)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
+		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
+					 QCOM_SCM_RW, QCOM_SCM_VAL),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	void *input_rt_buf, *output_rt_buf;
+	struct resource_table *rsc;
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	/*
+	 * TrustZone can not accept buffer as NULL value as argument Hence,
+	 * we need to pass a input buffer indicating that subsystem firmware
+	 * does not have resource table by filling resource table structure.
+	 */
+	if (!input_rt)
+		input_rt_size = sizeof(*rsc);
+
+	input_rt_buf = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
+	if (!input_rt_buf) {
+		ret = -ENOMEM;
+		goto disable_scm_bw;
+	}
+
+	if (!input_rt) {
+		rsc = input_rt_buf;
+		rsc->num = 0;
+	} else {
+		memcpy(input_rt_buf, input_rt, input_rt_size);
+	}
+
+	output_rt_buf = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
+	if (!output_rt_buf) {
+		ret = -ENOMEM;
+		goto free_input_rt_buf;
+	}
+
+	desc.args[1] = qcom_tzmem_to_phys(input_rt_buf);
+	desc.args[2] = input_rt_size;
+	desc.args[3] = qcom_tzmem_to_phys(output_rt_buf);
+	desc.args[4] = *output_rt_size;
+
+	/*
+	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
+	 * size.
+	 *
+	 * if passed 'output_rt_size' buffer size is not sufficient to hold the
+	 * resource table TrustZone sends, response code in res.result[1] as
+	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call with
+	 * output_rt buffer with res.result[2] size.
+	 */
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	*output_rt_size = res.result[2];
+	if (!ret)
+		memcpy(*output_rt, output_rt_buf, *output_rt_size);
+
+	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
+		ret = -EAGAIN;
+
+	qcom_tzmem_free(output_rt_buf);
+
+free_input_rt_buf:
+	qcom_tzmem_free(input_rt_buf);
+
+disable_scm_bw:
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret ? : res.result[0];
+}
+
+/**
+ * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
+ *				  for a given peripheral.
+ *
+ * Qualcomm remote processor may rely on both static and dynamic resources for
+ * its functionality. Static resources typically refer to memory-mapped addresses
+ * required by the subsystem and are often embedded within the firmware binary
+ * and dynamic resources, such as shared memory in DDR etc., are determined at
+ * runtime during the boot process.
+ *
+ * On Qualcomm Technologies devices, it's possible that static resources are not
+ * embedded in the firmware binary and instead are provided by TrustZone However,
+ * dynamic resources are always expected to come from TrustZone. This indicates
+ * that for Qualcomm devices, all resources (static and dynamic) will be provided
+ * by TrustZone via the SMC call.
+ *
+ * If the remote processor firmware binary does contain static resources, they
+ * should be passed in input_rt. These will be forwarded to TrustZone for
+ * authentication. TrustZone will then append the dynamic resources and return
+ * the complete resource table in output_rt.
+ *
+ * If the remote processor firmware binary does not include a resource table,
+ * the caller of this function should set input_rt as NULL and input_rt_size
+ * as zero respectively.
+ *
+ * More about documentation on resource table data structures can be found in
+ * include/linux/remoteproc.h
+ *
+ * @ctx:	    PAS context
+ * @pas_id:	    peripheral authentication service id
+ * @input_rt:       resource table buffer which is present in firmware binary
+ * @input_rt_size:  size of the resource table present in firmware binary
+ * @output_rt:	    buffer to which the both static and dynamic resources will
+ *		    be returned.
+ * @output_rt_size: TrustZone expects caller should pass worst case size for
+ *		    the output_rt.
+ *
+ * Return: 0 on success and nonzero on failure.
+ *
+ * Upon successful return, output_rt will have the resource table and output_rt_size
+ * will have actual resource table size,
+ */
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size)
+{
+	unsigned int retry_num = 5;
+	int ret;
+
+	do {
+		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
+		if (!*output_rt)
+			return -ENOMEM;
+
+		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
+						   input_rt_size, output_rt,
+						   output_rt_size);
+		if (ret)
+			kfree(*output_rt);
+
+	} while (ret == -EAGAIN && --retry_num);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
+
 /**
  * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
  *				   and reset the remote processor
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..50d87c628d78 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index ccb8b2e42237..814d40d64ab0 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -88,6 +88,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
+			       size_t input_rt_size, void **output_rt,
+			       size_t *output_rt_size);
+
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);

-- 
2.50.1


