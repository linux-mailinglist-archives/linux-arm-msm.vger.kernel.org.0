Return-Path: <linux-arm-msm+bounces-30610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F896AEEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 05:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC622865FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 03:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D63747F7A;
	Wed,  4 Sep 2024 03:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iM7BYbUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AC44C94;
	Wed,  4 Sep 2024 03:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725419653; cv=none; b=H0uOBtqHrJ3rXDCFf9L9iDAgA5MhyifG3Hw/Z+WhNtcW2qbJjb4rqZUQxDq+aViLN4ALEpsnmlOsC8IKF+7Cgic/flVDDalcQq46yK+6GFaHlXeu6APXTTbjs2w7AYi+YXJo/tzbUZoL33+bE7v3OY9+YqHE3nfnjMqRpnX5ofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725419653; c=relaxed/simple;
	bh=fWFfmaE9eo4O7d10iHtjoN0pE71U4S5yKfV+y6Ez5ro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTvmZajpEYwdCAgr9Ly2LSDFZLKg/2wwICZFqOmNGhnvjh/c5q/GogvIPYT8UvQCjLQjtYI/Iw8DgOu+qqRPGJb/lrFtKDAZ+IXmx4qF5XzNPEAZoq/EF5A/V6PTjO4a/PDMguPopdmgJ3is3T5La9QwZD46x+m4Gh4yqO7a4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iM7BYbUg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483NX5TN026179;
	Wed, 4 Sep 2024 03:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kagi0PG0jYrgb38LPz4GDyzohd6Nk3Uwateo0L4trz0=; b=iM7BYbUgXWVLzkps
	vDmieZbVvlAvu4xV7RqH3xiXt4VHs++OdLkjVHTD1JAw+SoD4SzEe9BF8E/6WCWT
	0q9OiGwK/einp2Pf7T3eRHLqua8MMMy6QPhI1dnySKpPaCvtphfDbaY/xJX9xyPV
	4x1pSUSFza1C3hj77Qs7Uo9utGH4znxjFkLzRdHSJflpOnFa6AfyOWeR7U37dnkF
	Xkrwfe9DTrdh65TdaGvcUYl8gb+/VWUgG2amH4a2oknzcNd+mX6WdbRiAIVea1Zw
	nOKGuAgoTeK/snX5sA7UCn+as0g+sgnjvV+/xh6thWtvGEuEylH+LpZ/p4grT73v
	67AW4w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt671g13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 03:14:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4843E2hl018666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 03:14:03 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 20:13:59 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>
Subject: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id supports fastchannel
Date: Wed, 4 Sep 2024 08:43:23 +0530
Message-ID: <20240904031324.2901114-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904031324.2901114-1-quic_sibis@quicinc.com>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gOATn7nnAxf3428tFzXpv6HtYAw2_opv
X-Proofpoint-GUID: gOATn7nnAxf3428tFzXpv6HtYAw2_opv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040022

Currently the perf and powercap protocol relies on the protocol domain
attributes, which just ensures that one fastchannel per domain, before
instantiating fastchannels for all possible message-ids. Fix this by
ensuring that each message-id supports fastchannel before initialization.

Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v1:
* add missing MSG_SUPPORTS_FASTCHANNEL definition.

 drivers/firmware/arm_scmi/driver.c    | 9 +++++++++
 drivers/firmware/arm_scmi/protocols.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 69c15135371c..95d039152f79 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -56,6 +56,9 @@ static atomic_t transfer_last_id;
 
 static struct dentry *scmi_top_dentry;
 
+static int scmi_protocol_msg_check(const struct scmi_protocol_handle *ph,
+				   u32 message_id, u32 *attributes);
+
 /**
  * struct scmi_xfers_info - Structure to manage transfer information
  *
@@ -1841,6 +1844,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	int ret;
 	u32 flags;
 	u64 phys_addr;
+	u32 attributes;
 	u8 size;
 	void __iomem *addr;
 	struct scmi_xfer *t;
@@ -1849,6 +1853,11 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	struct scmi_msg_resp_desc_fc *resp;
 	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
 
+	/* Check if the MSG_ID supports fastchannel */
+	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
+	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
+		return;
+
 	if (!p_addr) {
 		ret = -EINVAL;
 		goto err_out;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 8e95f53bd7b7..c1c5260f71c9 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -31,6 +31,8 @@
 
 #define SCMI_PROTOCOL_VENDOR_BASE	0x80
 
+#define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
+
 enum scmi_common_cmd {
 	PROTOCOL_VERSION = 0x0,
 	PROTOCOL_ATTRIBUTES = 0x1,
-- 
2.34.1


