Return-Path: <linux-arm-msm+bounces-97509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNQaGoUQtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:26:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7D283E1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60BEA30759BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AAA399357;
	Fri, 13 Mar 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9UTtKZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6xm5JJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19683947B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408056; cv=none; b=JbDzv/jysJ9ZMitTuffmxLZLlajcTHkR3gIv6W6N/OiyHxkDl9VcV5D63DXX2Vs3pcA3QIcyjpY7KfkY/WMGLkFNojb61ONtHtsh6/KpWODFIczc+/rNoSq2mfH4vdogx3n+wnQ2jTuiC8nuWQ1FCm/DHf+DOT1zRMYi2jD9Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408056; c=relaxed/simple;
	bh=shTpjy8+H5B7ZoannBsh2Cco1ExUgSP/Jsk01EQHXEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViGiiCtN2wzfjwl1UvCW/u/w29ctN9r4CXOm9ipuGIlsPJb0EqL2nqVxw1zskIT06pP468TwwibT18IrWtc/fZHbZvXfu33jSY/fX0LCZ1Ebta+xeCQV9atOI4GNSlI9ZXCRPvbZ4BfpkguQkz29lruqmTQ3/5S1cyR0HAlOIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9UTtKZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6xm5JJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vBWm481522
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1SvUxm3L8jpr8NBTirkAHm9fds4yk4J9NAxbtLExdU=; b=G9UTtKZp/pL+Yju7
	YKbb0+MQ5FyNlVg2lSfqV1pkYVroNN0ySpTL02BslVn0fZPjLhahDPtPYMcrA8IF
	CwMA6XWgfClBKsBT1E9XwqkWywpP0v3Fuom1/dr98Cdtm8ILVx1XqL/WarT7TcEJ
	oVT+COU5KDJUTtjOB55jDoYRrffBwbPVkeAkFu3wBIRUsekm4cfQHbGXt8XcvkpJ
	2Ax0H/3FNI+o65bQiXAiRowAh4g8+JVeFc9cJ/L0mKXC6UCQqJxBbiXwX+QV70D1
	5yMxb4MgyUavr8zNsHCNcfbAa4v2CQxR1M6AUkhVLFdrTFHGB+7zh0JpwB00qPvC
	rC4VSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rujr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:20:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829ad8a2896so7230157b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408053; x=1774012853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1SvUxm3L8jpr8NBTirkAHm9fds4yk4J9NAxbtLExdU=;
        b=g6xm5JJV76+PnYAbZ0SyColTFCYn0n2hPjemIYgOPCvf/sEY2Z9QQKzmhSUjtMQgD1
         F3RkznxJjHCUcUik5B54HLqDJsB0sHf4adIlSPcGMLjp5pCVXOQHxif5iU4a6lADDI6Z
         Uz3V6MW4NLQCZCw6DkSL2A8FIZbAvM7ocv9kN/uJ5Dfi15yoVmom/NrLh891xCocErFG
         XpjuQSKDrNPjhqDgZOdzmz9B4eEziENRx086f9mRdPQ/gS/WHUuMSnxk/g8g7S31eIBP
         1PRnrCHKUT2Pkaq6YMsanQySvr/UrGMTKU4MA0azd4IuLZzi4Idjyuqv8Kvt37cWSTrv
         hQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408053; x=1774012853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P1SvUxm3L8jpr8NBTirkAHm9fds4yk4J9NAxbtLExdU=;
        b=cu9T/ufVFGUtQb1BVIoYc/DcsQRX8Mq0y096j1TIBBnXOUJdtvYMqJu04R/WakUSrp
         5gZGSFJMqJlyr8DtHYibkN1qWXtKREiYY1hOVvFYKybxf0rsJS6vIxKvmwadH5ZF3R0p
         mERWeWhQefNdsMCfto9JPUQDROnoPD1aJ0QUIFiXKFOe/gp/5m2Lqud+395NBJ0p5/Mb
         hWk9dSHYOv+kJ3l7YZ+2x+C0U/10k62jHUQw9wk+CQqboKSuPLk12EACUyd6srNTN/VT
         TwTIjbjV4lxLLnHvGtxP+ESCudjOVRD4dEIVYoZRCMA+9XCttmvQQHQU9Dt/cA8ru4tn
         kJAA==
X-Gm-Message-State: AOJu0Yy9Q9OhfkKL9PhgRdOH0MUdHSbIgsXUFI1Vzp97ITEbEObjh41q
	CIvP+HlY+PM2QjNkgeKHZxbbF8KW3Rtc3FiQC90HW69Bh/UkER86ufFj7VTaSEeZcIff4BV9HsD
	YtbrFdJ0p+a6NkwfLRcnVKudw8qNwQC1AvPx0q4icwKWUaMFgzCRjJsNgCnlUW+cKGMYW
X-Gm-Gg: ATEYQzzz6RBQhGp8ZOCsk5hFST7wwVw/0LxtPYav/JzwCpT+FAZHm0s13+vIB8jbPJu
	LIq7JgYZwq5lPcMP4TnP26q33qEzXDgCrdfqG7TaWm+3hL2LbEqdq7CLsjIDpNHsal387x1eZST
	8uVxvu1gfrmBPP6c0YoC77onYdVghltYCeRiHVqxVxDRS9QIBovq5pgKVUVHjHpoJwqg0EC2CyK
	bMxgiAXqN6PVkMCVretlcvjoajMrAdSR7kARdoz1PkgMr/aid+YmwUZcycMpDN3/oF2wqTHi0c6
	oXIcjZKNChp2dFIDXG/DMWQoPcd8vcsJ5IfyxWc5PO/nlG31G+dPZ+LFku83Lyc2B8ghXbPjYNL
	iy6To3M+VF2ZW+D8RfW1L1d0YDc1N5SaVwvxdJUf5Jbx/4tpIFxBuc3EF
X-Received: by 2002:a05:6a00:855:b0:829:924c:3488 with SMTP id d2e1a72fcca58-82a199399efmr3191622b3a.55.1773408052710;
        Fri, 13 Mar 2026 06:20:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:855:b0:829:924c:3488 with SMTP id d2e1a72fcca58-82a199399efmr3191588b3a.55.1773408052146;
        Fri, 13 Mar 2026 06:20:52 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:51 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:49:41 +0530
Subject: [PATCH v3 7/7] media: iris: add platform data for kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kaanapali-iris-v3-7-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=9082;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=shTpjy8+H5B7ZoannBsh2Cco1ExUgSP/Jsk01EQHXEc=;
 b=noiZy9zGls2nFeZW6mGOuwEbHBmNFeMXrcrvgS/ttpZaOdfGvYGEhHLKLAEBS939rQTXnV6nJ
 tq/Z/tch+3vBWvQypz+/ch83F0Qx/u2ATx0/YbJHKrMORsWi+oM82lq
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: YGwNC3rL6ykz5hC4YDZniJd84jEmZtCe
X-Proofpoint-GUID: YGwNC3rL6ykz5hC4YDZniJd84jEmZtCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXwq1DT5oDOFGv
 Xh7C0ovnckj4Jw5+2b7GYJujvRnsLnoDkqSkJ5l9HgtnEwr9OypWstRj8gQfRBPPENJ7rIq4ltJ
 E9mXkSCtfTvJm6/XEsh7JtxvGcc/0gJKDon4ibIOQsxAoq/63JD27mARTvk09hUtjuihGoC9/ui
 KJ3F+r+O1llMaQ1IfadV7mvVDIR+nS4GAL0JwA6THquNExXYgfLl4xGSw0MX+YMMtNTXq/W/tzm
 Rf6ObGx5vOaQM1+l2+gxQLwXjOG+kRj+okWohQ+0bJ82XtJrgsbvhvjVXVDEcGzq1JNtiz0/bjy
 rWc4eSMl+7jo2yytDuDE/bDkdY3Snn4meNTvGmuCsW4lQfbNoaDkiN5i2PSRI6VLi0Ouau1MbgM
 TLDyujSHkFrYl6BMxE2GkJhYG9Z1DRYjcylu93myS82oVhDvODZGyzHPLbKLKQViYZQ056+M9e1
 4GT/PcexnxJCD39d9kw==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b40f36 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oUDkSdWbjXKg0EQNC7QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97509-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FD7D283E1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the kaanapali platform by re-using the SM8550
definitions and using the vpu4 ops.
Move the configurations that differs in a per-SoC platform header, that
will contain SoC specific data.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 90 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   | 83 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 178 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index df63a06b8401cd367c69ab8909af227f04bf69bf..d97e3fb18c3636abbbca3c2086c5263efeca3db5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,6 +41,7 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern const struct iris_platform_data kaanapali_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..df906f6b9fcd80100872a12815036a3aad9e925b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_kaanapali.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
@@ -921,6 +922,95 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+const struct iris_platform_data kaanapali_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.vpu_ops = &iris_vpu4x_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = kaanapali_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(kaanapali_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = kaanapali_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(kaanapali_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = kaanapali_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(kaanapali_clk_table),
+	.opp_clk_tbl = kaanapali_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_kaanapali,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_kaanapali),
+	.cb_data = kaanapali_cb_data,
+	.cb_data_size = ARRAY_SIZE(kaanapali_cb_data),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
 const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
new file mode 100644
index 0000000000000000000000000000000000000000..bdca1e5bf673353862c1554fb0420f73b3f519cb
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_KAANAPALI_H__
+#define __IRIS_PLATFORM_KAANAPALI_H__
+
+#include <dt-bindings/media/qcom,kaanapali-iris.h>
+
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
+static const char *const kaanapali_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+static const char *const kaanapali_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+};
+
+static const struct platform_clk_data kaanapali_clk_table[] = {
+	{ IRIS_AXI_CLK, "iface" },
+	{ IRIS_CTRL_CLK, "core" },
+	{ IRIS_HW_CLK, "vcodec0_core" },
+	{ IRIS_AXI1_CLK, "iface1" },
+	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
+	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
+	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
+	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
+	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
+	{ IRIS_APV_HW_CLK, "vcodec_apv" },
+};
+
+static const char *const kaanapali_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static struct tz_cp_config tz_cp_config_kaanapali[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+static struct iris_context_bank kaanapali_cb_data[] = {
+	{
+		.name = "iris_bitstream",
+		.f_id = IRIS_BITSTREAM,
+		.region_mask = BIT(IRIS_BITSTREAM_REGION),
+	},
+	{
+		.name = "iris_non_pixel",
+		.f_id = IRIS_NON_PIXEL,
+		.region_mask = BIT(IRIS_NON_PIXEL_REGION),
+	},
+	{
+		.name = "iris_pixel",
+		.f_id = IRIS_PIXEL,
+		.region_mask = BIT(IRIS_PIXEL_REGION),
+	},
+};
+
+#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 439e6e0fe8adf8287f81d26257ef2a7e9f21e53d..f6d8761daf0471d3aabec21c708445ee7698487b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -406,6 +406,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,kaanapali-iris",
+		.data = &kaanapali_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


