Return-Path: <linux-arm-msm+bounces-56239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF1AA4972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D96B21BC5372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18BD258CE2;
	Wed, 30 Apr 2025 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HcXHScSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389221B9E0;
	Wed, 30 Apr 2025 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011053; cv=none; b=Le5e4WLLmZkpb4RuJ3IW2cfxuYbdOzpx1RYDbZ2SK4F/Hnmz99yjsu8BscT28oZc0INIPevqbscpNT5Kgj7mq+gTSz5HHhV5q26lwmqptC3akAPTu5hqMz5GQ6/E/qnUKF7zL2FrLnWqVpnHa7FNQ803OOxMPhyA5xYVaQOH/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011053; c=relaxed/simple;
	bh=mvALsY+IwGGogHBtWJUORKxwQ9SvDdLDCNU5DjW5K+U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hmqtaWsD+OS0LyvJNtWVzlGeRyaTjFl1lZ4oAeHJ3OzHq+FtRFugC0CN36U327jaCog+sSwmu7js6iOnxKQ69NlNJz9GCsVuKVusyDoeKxAnU6EoI7iS0tj9xhadjhTuDgJIq7Z1aOpVQ95Nkhpo9hA2MoP851BH7eLlbzN1Khc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HcXHScSu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Vg8o020908;
	Wed, 30 Apr 2025 11:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hKEMsFz+5InyWRGlQjljTV
	a4FuIOoyVGX3MTSQHG8CQ=; b=HcXHScSu9OWopRFmC+98IqgqTuGr36HWMRe5dW
	TrXYplnoEwyaGk8CXRS6l1ZPl+hrRDIIqJ4LuRFebGnyG9CXSWHoxoOYLHRJith3
	2NcAhjEoX+gHMeBEZgibde9RD11zeYVyUe1xk4cQqSO+m2eXnii6OAIKAkFutmN/
	ppmO/Ny8hCOkjzogelR6fteq/Dx0nJGognBJRt82jCUiUo7Es2AF6WMT255VTkF2
	PJgmMnUByg9k+6aK+aQYbzoBCeNFB1zqVoKCmS5cErAbsBUwAKYcKzy7jnGfSro7
	+q8pjo68aJc7LQd3kG7SWGdXhD3SUxHLmzIpqdRnAOTFz/gQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1svrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:04:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UB406N000323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:04:00 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 04:03:59 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] coresight: Disable MMIO logging for coresight stm driver
Date: Wed, 30 Apr 2025 04:03:47 -0700
Message-ID: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=681203a1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=veiSyZ7YIUJwdJkxcWIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3OCBTYWx0ZWRfXzcHPg5bF2V3V 5ci/HKzPJBTroBOjJXIZ3GGTQt04f/uBScdMxOyZ4J1W0f2HpsKg6WIWR9DX+d7oCy9fR2WE+0q CCaGHLgL0HCRkQd5cq27tEMbX2EiWJXLlFGNrcLRhKOAam+9ZAJj6+uqF6P5pXFP6kJCwqPsWPR
 re35RFMnBHV1KrShHnhGrJWVKZbuIq5LIpDRT2TQrg9ONxBLMEkfpl2vfkyi1hkJrjmLMFgWZCJ 6BYmOktCganK0UogKr9l86WMKK9KGyiIUEW/iMovdZzomAZmhm+9LAyUIQ2gBJEJw0Gw8LATJFC 9c8Mur686zP9gTAQfDVr00hoXt0+BYz79hZaeACWKjGr02oLjLIbMrShel70aCWalrMj6V6XQGe
 1df3gh1rjtxXWrCXb9WfVlp2JrRRelFHmhhhp7AbqNnWufObUsP3GApTzJ/CUlTLtUB8FCpT
X-Proofpoint-GUID: F0SnEkpOGs_Q7K3q_ivJ26wbALxZLoGJ
X-Proofpoint-ORIG-GUID: F0SnEkpOGs_Q7K3q_ivJ26wbALxZLoGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=952
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300078

When read/write registers with readl_relaxed and writel_relaxed,
log_read_mmio and log_write_mmio will be called. If mmio trace
is enabled to STM, STM driver will write the register to send the
trace and writel_relaxed will be called again. The circular call
like callstack below will happen. Disable mmio logging for stm
driver to avoid this issue.

[] stm_source_write[stm_core]+0xc4
[] stm_ftrace_write[stm_ftrace]+0x40
[] trace_event_buffer_commit+0x238
[] trace_event_raw_event_rwmmio_rw_template+0x8c
[] log_post_write_mmio+0xb4
[] writel_relaxed[coresight_stm]+0x80
[] stm_generic_packet[coresight_stm]+0x1a8
[] stm_data_write[stm_core]+0x78
[] ost_write[stm_p_ost]+0xc8
[] stm_source_write[stm_core]+0x7c
[] stm_ftrace_write[stm_ftrace]+0x40
[] trace_event_buffer_commit+0x238
[] trace_event_raw_event_rwmmio_read+0x84
[] log_read_mmio+0xac
[] readl_relaxed[coresight_tmc]+0x50

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..f3158266f75e 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -22,6 +22,8 @@ condflags := \
 	$(call cc-option, -Wstringop-truncation)
 subdir-ccflags-y += $(condflags)
 
+CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
+
 obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
-- 
2.25.1


