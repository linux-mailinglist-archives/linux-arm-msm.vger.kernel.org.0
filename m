Return-Path: <linux-arm-msm+bounces-76246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71DBC22C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32FCA4F5BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDE42E9756;
	Tue,  7 Oct 2025 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6elETUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27FA2E9EDA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855785; cv=none; b=tYXJn33i192k6Z/6JZzcitbwqzKY37m/k9cWi3Z+I42FmMugY2rUzpvGnrCm5N7l3FZw/E2fiuWxCwVBCtGoF8Bq6sVgP0MHYE0jBX1nZOeyC0BFUPPO6d/K+tUJjTPXc4gE13IeblWx01ir6JE/BZMFiSdcFf0q3X33ialolcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855785; c=relaxed/simple;
	bh=9xHPgyydOeXweGUGYLP/L8fGDVmLTdkNMJ4AMabbVsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfsULU4rGKGq1DjbFxiuKI9xULMpWMQJiWWY+w8/c9BG62WLOwqRoVwzFOHbT0YotU2lsAsax9V2K0FVg0WQOp2mJrZE81r1rZ49K56dqBQjJbgDP0fV1md098KU3yx4sh74WfWnxgnYleAVT9YLo5l99HImYN2NWSewlq9AK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6elETUG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET68q031495
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxNeeJEXNpPeJTacph3hwU9D6rTjPEzDWfJFAW/Pno0=; b=D6elETUGB4FEA2ve
	v9V8DudIneufWVfS3frJkzM98R1AoAUzuGk4jK0GzFp7xqwrQKiSwWzCvB7AI42p
	IcesIE8Jfhd35pK93rjlXmIpJE2dsGitL7GaJ7GtPdNluth0Tz1bTt7DFqbFvPqs
	fV8SriVgyhakGxzUsZDZ3c3kbqfHr70080eck9S8fXxBvkjxNMKarZOyuEzK67yv
	X0KkZx2/9tUtIaKNuGQWo2DcrRs6UGfpv6Tuz/Oz7d+cr34qsPKOTne21uB+arkF
	7oa4vQlbZ3au0l3Vf933sXMz1i32/rrtyWd0kFLaptU5O5XRr3Uv+vOHKjDxLWgR
	uMDsag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk700jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27ee41e062cso79676815ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855782; x=1760460582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxNeeJEXNpPeJTacph3hwU9D6rTjPEzDWfJFAW/Pno0=;
        b=Po+py5BnHirKHJrCJ8VnatCOv9O2/hLpN4OJOXNLz0++T6XeVxgQyxbekHNgRJP3qr
         aGsiTiamJ2eePOEdLoEkXJIVFoSByNS9LV4LdR8wGAsvJHsrrwa/9Gs5RzMgD08qgjDO
         o1EWRumw2DVFQW6GDKOT5ejlgNZYnxsYuXnoAPSNAhMVMVGgK3socOAocsTTml7kd0n3
         W3OeJTPdhNgIxbkClV0gun5EOOlBqOzj4MfxCwDEQfnnD9Iy/DSRc+K/N5wSlE7AWJ/h
         PBnJ4DVpflFYN2488zS+kFScJxnuABqhd98BHMWk1YYUtJfOOJcdO64//Flg5NQygBV4
         RLMw==
X-Gm-Message-State: AOJu0Yxa1SvsPQ12loOdCdJ0eyuiS5HO+B9LjBQ8+ZxjoOjUPRUm0Nbn
	gI3DcTUh7c7ivA1XeJDut8DZPjTNmJT9YpcxLrKQxbmkPo4u1EmGi3CKNJVAES1vNoIBQnKu6IZ
	fYEsxguz7a/RXVtVzQukGOhOZLJGwIxftui4oBtcdU9zg1dH9kB6qeIU0EXp0qLBTvPp8
X-Gm-Gg: ASbGncurWVYXuFYJcutjcylZ2CMT6Mh4FpuzccS4tDqy5iLDqTi+7R0u/M2QnMmmxj7
	cNFaq71Rm72u68+Rt1Zww+4o17i7GdowT2z41mL2KvhuRDZpsnRnzgPcjz3Epf2rvosQBl6zkqm
	7/URkhv0X5bKvIvSC85rp/6VYVyZC3vW4cWReB5pH+ItkNBeFy+2mCgy8+qZ0fCHovQISxx3X9S
	p5rOG1qKRPOFvefQTMWfLOOioya3oRV1qQGGffG7vA66NUaXUz0QLbhOmoMM+yzljXcelF57jP9
	O3AyPHgGbVlblv7ugNsapb91jnuxElutJX7BpTuPF8WOi6C5Q8Cv/OOhB3DKULB0tPxPy4ah
X-Received: by 2002:a17:903:2c0d:b0:24b:164d:4e61 with SMTP id d9443c01a7336-290272b27b2mr4396695ad.13.1759855781547;
        Tue, 07 Oct 2025 09:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4ojBOTf4hVzlcnJUwx3Xx5342YcDt22x1MRR6j2P8Ub0QP6gMv4na8Kc9xIoK/FL1oCbYuQ==
X-Received: by 2002:a17:903:2c0d:b0:24b:164d:4e61 with SMTP id d9443c01a7336-290272b27b2mr4396425ad.13.1759855780958;
        Tue, 07 Oct 2025 09:49:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:52 +0530
Subject: [PATCH v4 07/12] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-7-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=2863;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=9xHPgyydOeXweGUGYLP/L8fGDVmLTdkNMJ4AMabbVsM=;
 b=VrZ32SCvIJGeIMMpBJYfzH1o5GGbYqNyMoNI4YMe/smiKv+k3VJ16nVS2TakCuuqjKkevo5LW
 HI1UfSpKyOpCoaBSor8MRCK151+NSib1r9s3/zsZMHkmxmBJOkOxH4s
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX6/ZQ4I5McCLF
 6UysLhtgS3QAzfc1D6yWHO7dmnTYSXJ5C7dOTrhvvrcEA8m2YPzf0LPk6fW+5hw2okosTaaou3h
 TnOfspq6iqImC/uDtDroA5rBrPBixGIM9fD7LwESCwvgwSiC9RaxCxuJ0NbEmK9btipCbYedkRn
 NIsUdjDyPMpEsLCE1+9lvc9cAnINoWk5AuzkRLTJQn4aToQuhR4/HyQ8vU2CgolBI+GLWPihBEY
 virn2CExVBoM5pGu59Gna5LAPMjwxAqQVOd/ODtL72ogkLlsaOo6pN4naarSHl7XuYdH+/0C0Sn
 7b0sBanoxcjc1nqTtWnvRG24WFaAowQ0VxzfumhwDlUw8OW4jRoc12VnSJEpYvInWNFgk3HbaUU
 mSfsIXcYVuCNRs/vtjC8wTnybT3png==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e544a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XvkCMQ9jN2oI-PQncDkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zrmHWaKwDnvpqc0slB2HxHoJQqACVlPB
X-Proofpoint-ORIG-GUID: zrmHWaKwDnvpqc0slB2HxHoJQqACVlPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

Simplify qcom_scm_pas_init_image() by making the memory allocation,
copy and free operations done in a separate function than the actual
SMC call.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ab2543d44097..b8626897c8a7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -612,6 +612,37 @@ void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
 
+static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
+				     size_t size, struct qcom_scm_res *res)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
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
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -633,17 +664,10 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_context *ctx)
 {
 	struct qcom_scm_pas_metadata *mdt_ctx;
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = pas_id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -664,23 +688,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, mdata_buf, size, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx && ctx->metadata) {

-- 
2.50.1


