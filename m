Return-Path: <linux-arm-msm+bounces-103039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC4YGOHK3WlGjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC53F5A20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E3FB30377A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B83282F3D;
	Tue, 14 Apr 2026 05:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdkByIx/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdvAPtta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3A2FE598
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142894; cv=none; b=e89yo2l6+50K49uelO4SCr4DJP9CNnSIWWsVd1c7MtG7Cldtl6iL7ahAOJP4bR9lyf24YF6GU2lkM95N/v7HWLXJf1PBI8VpurY4h4rf53OdRN7xSW1REFF4SLLQe3SIkl1xssLQpDRFolENZSqFv0EDjX6cBwXQabmoAly9u0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142894; c=relaxed/simple;
	bh=fWGxEoonf/oo9WtQdDfbe3IkEedzcHjEPcoyRgZE6vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTVk8+dDevJLAmR2tKdjyU84y4gH6GSZ5x0fsiCPqWN7/8a3Yn1TZHvha0mcD8oH+yCFSepI3kIG5RAdzu18DkYRq/H3DMwN62+IK1GZKgK2cQuyzuwvB+uho1taJJT+CAWGDGhh/yps04dScBSqehx3kn9BUgJ47ucPGDIG0BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdkByIx/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdvAPtta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBIbI2510997
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ervXzOVwYOXbrB/9/dp4G7nXAxNkEjjJ29YUopnTZBY=; b=pdkByIx/movL9uYT
	nsF288VLaTfac0bMaztN2OEb0uRZA8VJYR60fsOJU8ZgZEAIZy0ttJNqHFbt2Vuv
	P81NWGmkPLQNjXJxp5MIdZ/CXGS8OI8WsDKoBTRBOJ10IWmJQA4usoTBL1ryDX/M
	tiQxbmj7uex2ZFj/Ih4dDPfd1Vl5pxVu8Es3CkKrokbhwbEVnqD0mPKe/zDY6FC4
	78M7eMbJBMxb+gONBUIJimKY1DHAD7O8f6BZ62YKf0cK+rkRMyLjRia9GrOOJy8j
	nIShspZghp4uAHt/yDPVB4wdQtsdYuqgxphwm9lee606nQOhqbeBbWk0x6KFd7DI
	r0idvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867s24a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:01:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adc527eaf5so37080305ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142891; x=1776747691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ervXzOVwYOXbrB/9/dp4G7nXAxNkEjjJ29YUopnTZBY=;
        b=TdvAPttahJQzgT62gdhZ9Ux6vXUNdM/xwNoXbLyIawh1QhO4EnVDqIEXijzUUa2v+M
         mHfpudpYIft3Ip1yT/OhfqEnQBXlbb6hJENfLco8a+04SfW/t7/UJWRIPHWCr81Ck0T1
         1JaVaaTOu803YFX6Am0FuufbuJtQmrueWcD9f48ORPZkr9feO9oqIyFfo3ZMLt4MVeHF
         WJrnrPxyfCfoY9WI/5v6Ku5RAceKkKaUlTlcfy+MVrcqagEg9SYSoekU3LZXvGy74d+Q
         O9V5x7tx6uMjtvgugBYO+NofuUZsNYkvZJqgYeeN0s2NHKznRBVUTdL/Vj52isJk2b6a
         z+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142891; x=1776747691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ervXzOVwYOXbrB/9/dp4G7nXAxNkEjjJ29YUopnTZBY=;
        b=JO7Ib+jnfIgjvjI/Ad+Os5wA5FgCfW0lnAdqsXs61GMxH3g6jrdSbOsWSGNPhaNo28
         A4ZzISXps+E5HZ6dzskgwvqvrNki23gKXrHg/mTWlihtqh7zPrziKBFUpBzV0v5CW3cH
         9xgk8EtGW2R/BczRUkBTxQYrBLW61wze9bpt9Gbo3XCf6XTG/e2iAU86yG7ejPHF42w2
         pKnZqmjoC5XJys38ffOyJi6oDzrqsCs40/+8Pa/SsLXxkfIkrYldtGimlhNU89+L9bXK
         0IXVBllYsqpdx0T2+x3NJBkWeyaaZi6WmU6W2uhWlEYy7qqOZJWIhVIA26o9Bfo9ynmV
         KadA==
X-Forwarded-Encrypted: i=1; AFNElJ+bQbJ00xrF5Z5hOcXXTE4JckClcCSPFbRTyh0q64j/EGmgrls69yiApTOAS0rMlNKDGEfeFabXqkUTj46S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/aAzw643e6jA3RRxxEBFSA0/BH8IF9xlUgF3+qb3AA4YXTZZ
	1lHYWzrxtb0zTcWtNC6AY/BOKK04KlNQr2p93kjp/m0QwJ/e5mYKCpizKDafcRRa8bYPaWONc4v
	PSaRJcPvb4vzQut7rF8ABA8dRRw5LPSRyfAjHvgwoeBsbbCH70LHqN5TMU2psKQGeOYfA
X-Gm-Gg: AeBDieu1dB/We1cIJjRly9oNbZ9O3qsl2d5Ri/LIXzXtssY5ZtLBQBo8eoBbl31lEuW
	c4KeKO782NzW/yZWLMw52byufShPcLc+/O0iRB4gXMynGq3O8DvFCreihUrBzojw78rlDXOoneE
	q3FSxgjHk6isvctXbSHXhi9miyaQ6PPgftAIsOPNkhS2PdIe8dtvuIKevxAGcs65gH7R8mAcmxR
	V+WpCRxbO5YeiNj/vi2fhF+vg9COaUyjThLhtFCbPNaph5u8r8x09MaznkY8l53RU527MGi1G2e
	y7ZzakA5FLBqtp7IfpTtULElUzLKHUBvrq/8PA89/O3zCsUkalH2G/AaxyZQ3yRHquZM78rQgM+
	sHjJjb9bOq/ffquuTFC1iIY7JuiC4VZEfY1+snxpZf1COrj/JOI/3pY8=
X-Received: by 2002:a17:903:2ac3:b0:2b4:5df2:ebd8 with SMTP id d9443c01a7336-2b45df2fa77mr59231715ad.45.1776142890768;
        Mon, 13 Apr 2026 22:01:30 -0700 (PDT)
X-Received: by 2002:a17:903:2ac3:b0:2b4:5df2:ebd8 with SMTP id d9443c01a7336-2b45df2fa77mr59231435ad.45.1776142890206;
        Mon, 13 Apr 2026 22:01:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:01:29 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:06 +0530
Subject: [PATCH 10/11] media: iris: Add platform data for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-10-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=10841;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=fWGxEoonf/oo9WtQdDfbe3IkEedzcHjEPcoyRgZE6vo=;
 b=d6TBcL83D0DGOMbaiuPmG9KQm9zbTGL/nlcXhPvGS8N85FMcfXNSX0Yifk+BwnNpIixnSwOiW
 jN2S8t65aSPAX2NcvK0K/viK3Ok9kW6ZS5/+OlQpiAoVhoMMXSc8fEC
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: c8Co-YJ_DdRZny3cYHPBmkS_Pj5rrGM_
X-Proofpoint-GUID: c8Co-YJ_DdRZny3cYHPBmkS_Pj5rrGM_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX9LcUfJKAx2wJ
 e9LZuOppvrj8HbdJLSIKP5aOhGdYfhL5QrOh5fWgkS+NGI6NCXCL0/ctc4lnkL5is/10CVG4wgc
 ZZPZdCzACcG/+DQ99RbcHll25m5omZl9C8Fb/nzaj7giflmY6Gh0G4SBlWtWjhki3Ap814OiAN2
 1wD4pORNJzC+ccvDzmPDDQhdWTuV9XmnDqKXpuRxjvEhSQgf2v2vlw4aUfqD+R6txhQmEh3IU9h
 WsxwECziTjvF3aCXrwd1jRiH/j1mPRdQyQ7KcUEsfKrH9RwFjWPMfD2BYGEqRmMtAMAYtG2dkNv
 UiJ3oudXyjK9TvLHTy3PgJghDwUV5WxzfwVDLZo14r0SxrGhw+nJn/FH55t5Qn4oM32gv0el6or
 LCIznqJKZ1nEPjl4BGGYCGJjqkztlbNRE1sWvA124qqzN2UsfW6FGsvU9LGVQim92jIbZeqAXTF
 1EQbA7w6HkslvKRaSRA==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddca2b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5whlBFqpPk_D0xcr0aUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103039-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CACC53F5A20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add glymur platform data by reusing most of the SM8550 definitions.
Move configuration that differs in a per-SoC platform specific data.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 100 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.c      |  93 +++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 6 files changed, 216 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6f4052b98491..677513c7c045 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -11,6 +11,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
              iris_platform_gen2.o \
+             iris_platform_glymur.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index aeb70f54be10..a279ea462ee6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,6 +41,7 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 47c6b650f0b4..fa2115092be8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
@@ -921,6 +922,105 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+const struct iris_platform_data glymur_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu36_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.init_cb_devs = glymur_init_cb_devs,
+	.deinit_cb_devs = glymur_deinit_cb_devs,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(glymur_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = glymur_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(glymur_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = glymur_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(glymur_clk_table),
+	.opp_clk_tbl = glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.dual_core = true,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_glymur,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_glymur),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 4,
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
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
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
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
 const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..64b150db9f73
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/media/qcom,glymur-iris.h>
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_glymur.h"
+
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
+const struct platform_clk_data glymur_clk_table[] = {
+	{IRIS_AXI_VCODEC_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,			"core"			},
+	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
+	{IRIS_AXI_CTRL_CLK,		"iface_ctrl"		},
+	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
+	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
+	{IRIS_AXI_VCODEC1_CLK,		"iface1"		},
+	{IRIS_VCODEC1_CLK,		"vcodec1_core"		},
+	{IRIS_VCODEC1_FREERUN_CLK,	"vcodec1_core_freerun"	},
+};
+
+const char * const glymur_clk_reset_table[] = {
+	"bus0",
+	"bus_ctrl",
+	"core",
+	"vcodec0_core",
+	"bus1",
+	"vcodec1_core",
+};
+
+const char * const glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const char * const glymur_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vcodec1",
+};
+
+const struct tz_cp_config tz_cp_config_glymur[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
+
+int glymur_init_cb_devs(struct iris_core *core)
+{
+	const u32 f_id = IRIS_FIRMWARE;
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "iris_firmware", &f_id);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	if (device_iommu_mapped(dev))
+		core->dev_fw = dev;
+	else
+		device_unregister(dev);
+
+	return 0;
+}
+
+void glymur_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->dev_fw)
+		device_unregister(core->dev_fw);
+
+	core->dev_fw = NULL;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..03c83922f0d9
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct platform_clk_data glymur_clk_table[9];
+extern const char * const glymur_clk_reset_table[6];
+extern const char * const glymur_opp_clk_table[4];
+extern const char * const glymur_pmdomain_table[3];
+extern const struct tz_cp_config tz_cp_config_glymur[3];
+int glymur_init_cb_devs(struct iris_core *core);
+void glymur_deinit_cb_devs(struct iris_core *core);
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 34751912f871..53869d9113d5 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -369,6 +369,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


