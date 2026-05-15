Return-Path: <linux-arm-msm+bounces-107874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFHZG9wLB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:04:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3C454F06B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB6A130CC1BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BCE48A2C2;
	Fri, 15 May 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZvA+ula";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCJ041v4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B9480334
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845706; cv=none; b=E+t6HNuPypMqTynG42+0Uwzr6VRS9UlfdcmPHmSTy9qHE5pCZWAYHk5+AmfsXGNZpnT2NSG035Rv0ftrfQxN1qPBAnQxxESWVtTChOAFihvw4toOlqKkzDQAEoLxXxom7d7ULzsgIzERsFFXcSVemnoXF8I8mFvLCahkgCIk2IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845706; c=relaxed/simple;
	bh=sv4VJqZ7JjuYZ9AdNyjmibmQwBvNg6eatU4XxzWlZyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dli3b2f6AFOnobrwPM793U3eRGy0PTpjS5bs/mhw0L0oPC/f1qg2+k5r3NzF5rd99Xpm1twdwWIO2WdiBGbJt+CxdR5HsViIUCZnLpx/aJGPpb7zk04z8RwBUI8hcUnM68bKpruIB4kg4UJr9DIr/x51+9YvOcLN4WUN9UU22wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZvA+ula; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCJ041v4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB0wJE4020900
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=; b=PZvA+ulaKHzmEhEe
	anvLPWWhs9oZhOu3MeynYkEvJDfDa1IPTxzcAPjOKnaXKvAPInpo7bFNPmB/o+l6
	aR1rkZu22hA+fDlqXhDPfGYqh1hPTSfdnHei9oYfUokdrBHxtXyzRKesl19mRcPo
	/Gh5ZlRwkwXUCPCxH+BjMMnXBeyGCnEo6675h/1G/b/JiARJCsbV+8NHsmXm7j/I
	udCPHadeC6vtsKNCgSYeYMMw2ASYLDGfdeO5RC1Lx9T3Jx8a2Q3UN84x8qO7H3m9
	400/QXfY8xMXxYnYaFgFR8vJuzAzlfnFelvvSXPDCQeEYM+Ojm3bhCzefcKUnjl5
	8W1+mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru3wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so52054021cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845700; x=1779450500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=aCJ041v4ZlRcMnydXeqA/0/4K2O/lbHNqQyeO1E0E1faqB5ayQdCYbrwwQwjMBarzi
         mc6yYMMBNLDpZxGlgyjGxhF7zSVcwevGgfM0gAKwvVyTM+NSSfzPq7MGPbeouwJnStEL
         ANkvmIEokWfnWW5kRhySXUwMYQAnvHpufWvMzJhSR5C/LmkNtU7+ajplvZ66W35tG6gS
         hZwE9hghK858ZZ0MztWCiiluRTSaJnzrdc1850b8Nu68Tr1+dbSX1kkyWx6WqtY6DYl5
         6I3NSbnr59qqr4lhCppUEGfrJRtCnET+Jqgr5ngU+p1SZnKzmqBVJ+pe6G6efFCMd3w8
         nFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845700; x=1779450500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=pdetFQko8kKAgjBDrFoD1I+mltkpEeIr1g4fAK0mIqlTm7BhKuAbHlzJyUJAIN1POp
         hb2m9kERHIe5SOxZrW6rs8kFF9TarZRrOOpjMQKsrVlYy1EbZ1+zLTbkVy5J254agqbU
         gVWxIDLv+MSA3ifPctoxetQrQrSJWFHRiahdoRymbV6DaW+ap/uPmp1Dh6fRC+oxZcRL
         F9hRU1dUmq3h63PICxJRh1FzMAy7RBLTenysT/qRDwueBR52eOekROSIL7w5DMRYBK7f
         XpuQGq6+PJWkEmNj2cxcRo5ymphhjM2sDB6jXyKlJqJD1N5r2LB5W0nJUoy7SSDbovfH
         WLIA==
X-Forwarded-Encrypted: i=1; AFNElJ8kDBJPhXtcJoGEu1zhUpSdcOWw+C0lMIEnqZSHmad3bZyrS5XVF3NQxb2Jk9OMdPKVCPu/EnyGG1vTQJtn@vger.kernel.org
X-Gm-Message-State: AOJu0YzMG5gUD/F6v2cdvKy7U2LzY3Pt8mj2wAcWkvlBHKEy2Q2vYrO/
	ICKJpRT5XEeS4FMzTF2skqpoDnI0Kr8ZlXs+fTr80+sh+1v4prIhggL2/kCHIaCIbDSabXd++63
	KilYsjLK9pWU8Buxh1fv1P1srr4M7tayoVPOYg6IxiYTZUfR4QnFtWIXwdcdDwsah+b+m
X-Gm-Gg: Acq92OGRRMd/kvvlo9P0+NS+xOnjstK08tzouBwZnpPTXKE6kid9ZRBUpCeofZiUxp9
	cXdJVXtN0sOOAz6lgeN/vayh4AAwPmSXYt5ts19acpNWYzoHJVKMyf3aiMcDnsaFPiRTg2mgp+A
	d04Ozmm7DOkZZ6CehkzsfBZvLJx8YE2zYEaW75kqOc/36q/QkVYtV5hd81X5V0eWMqVdrm8AyDG
	YKGwS127NBwrfP/DUwNJ7PcZO8U2JqwTrfrZKgUw+gKd1vgP18IomZjlfuYuBzTVBNOqyXBliGJ
	a/rLeinBcF/DhxyAbGbe5kmlxMg1EPOqyKHNAqja9wBqhuIM8ibxL7IrOX5W8Cz9Apz9u44jujm
	vYmWJvkmnuwTTU4vgL5p+V9E0hJIqestCs2RzK5OJMmvBDmIZMtKaDDojYQ42+V1QlBwHpK8LoL
	0pW5d0PZ4B/cPNtsM9oz5KfQxmixsM9Jj5h0M=
X-Received: by 2002:a05:622a:4a:b0:50f:c920:a907 with SMTP id d75a77b69052e-51659fd7ec9mr49238731cf.9.1778845700071;
        Fri, 15 May 2026 04:48:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50f:c920:a907 with SMTP id d75a77b69052e-51659fd7ec9mr49238281cf.9.1778845699559;
        Fri, 15 May 2026 04:48:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:05 +0300
Subject: [PATCH v3 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-6-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UQqP5tD2UNNP8smTrGrxEDFFzhpcWSGstXQh9hbGrL4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxY7+xeh2G37uEwzDmXfeb3n+JHM1SdTou+cPXLpwDK/a
 bZT+d4ldjIaszAwcjHIiimy+BS0TI3ZlBz2YcfUephBrEwgUxi4OAVgIo6JHAwzj0plvCrOVVoT
 0XyBO7B9mmDjhvU8xxt//GfoPvFKV7IuNC/hrFS39OmT2kFP19e3VlxfxRc8YZLibKN7s+yexv6
 +8Vx1MWf4rJWMb2wPZYgvPhBlk3TXIWVDuU6Of8sun7h467gwJQEPUxvHC4dnzOl3yN16PzzuVZ
 HX+hUdF3irZC484/D2mrWISyAprFNizdEGy7vXXkpmxcu21qcy87ROSUzbnHT6vVb1eoYC290/3
 q5y1P4px99y9Znc5PRMhj3CyYm67QLPt2Tdi8zWVrPT7FCaz/zSxbZMVWaZyDkXba+OtP2Pwta4
 Wl7Vcl4V8SXEale1XTjPq7e32RcJLt9h7H7hYL0VQyY3AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kv39-AN_wXQ-j4T5rwTsKgU2QZ95eN54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX42OF8n49oJI4
 blaOxrU+rf9J5Wd3b7eNmddF09CTyao/5DUSmUDVBysgCbR5QT0Ob0LEFIUaGvgpPoP7+GlsWHm
 JWQJmmf3/PEdz54y7Ac8V87bgzudijUuD9VCodzyy+0TE49MTU5s38SfmpWj3a031NJiWKR9ary
 5qCvbOrJ0gKI0EbHrhU7CQTDutrLaML3QIPHWBqFw8v9xvyOJAZqNhhjehNTRDZYjX/NKQRosRH
 02QzVvRkwxeczI/VQnnkdJscdEIhJO10TU0ZRuIgqSelLD4UXYNPTvI0IoRZYTk1nwwSMEXO/0+
 G5QL9l4nKCQ+eVDXYOHvezQoFEIOqGboPX6FV50Bg8wYDxdaZMsfp1EQDKSdb7ihBLzvLu3m5eK
 1baZpTKozJZ2MNo7YKfN3FUdLhxcn7PXzfcoJKNDpA6NHA8iUJ4dBOqtJUuB6lfRkv//ypzchQG
 8/41hj/OpTjJ6kUdaHw==
X-Proofpoint-ORIG-GUID: kv39-AN_wXQ-j4T5rwTsKgU2QZ95eN54
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070805 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: DF3C454F06B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 7acb073f7197..51d8faf6fd1a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -283,6 +283,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 9a76149f37b7..5fbaff5c01ca 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,8 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -106,6 +108,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -135,6 +138,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -172,6 +176,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -201,6 +206,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 59e4d68d042f..b8300195a43b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


