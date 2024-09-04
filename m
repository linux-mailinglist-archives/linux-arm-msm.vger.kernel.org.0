Return-Path: <linux-arm-msm+bounces-30607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3585696AED6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 04:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC2328634E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 02:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53EB43AAB;
	Wed,  4 Sep 2024 02:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OVtDKbxN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C0539AE3;
	Wed,  4 Sep 2024 02:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725418629; cv=none; b=XxIiZbg5cT/YQ+z6FynNauGqlNeQyUhQu3rlabnq8RaLqxe2h/z8TXO7ZQHWBrxBRkq43OZDjF9zGDxIdawhZnBcm4Ty2ZUxNPPzFoXsvunCz7DAwAsnaJOFjPnsjO+MFaDxBYIprOzTac4k7wtibE/SmlRjiorSzpE7NL93EKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725418629; c=relaxed/simple;
	bh=qJJmHG8zHNXOX8TUR6xOziUWbvyOSf4z2oApBs0L4Dg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j8DgmXdkjzIS7Mpt2f7SnzoHK0SunOxiRHTfEwbJshKDowv0TwmGmyZhiiR6sshLprWa+arYpQnBMJZHAam5FWua4uOMEuUIeEUGmONH2KmFWHGFMQ32/oLKzXYlnPuUmJ14HxXur89qKSHuY7R/959YOeGgxjy4eTWOWR9svEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OVtDKbxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4840DhtN015921;
	Wed, 4 Sep 2024 02:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hpxlOffj3PvwKhXFNmNs8sFYV+TBYjxZtDo1MAI2Ckk=; b=OVtDKbxNa/pIL2G3
	MCA/OUorgzDO7EUu4V2FWv+1xmRehkgqsstgOphOvmuT1A/aFSVD5jtyF2op4Vez
	i27HEbGWl6C7hGmZt2shyObLBfe3WT9hvnKiGFHHBq48yilLUXDHBS2vx/gzyk8e
	PofwXEBD6h51pvkQfhLtC8TxLqsRAWJMOeZ3JPR9PeARIcFfZeEdW29OT+ABH2Qc
	HQoIzyOQcTMgsJLLtr3cfGDK8nMvTjSMJxZ67OT+RY3uCQj9oQZn2n5v4S63xZKB
	anfdBN/oavzUGQzfeSagEFrflHzL21TT7W00P3q3D88fYApyqHGdnFaWnwI//JJg
	jQJelA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bu8usej3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 02:56:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4842uwZU027663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 02:56:58 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 19:56:55 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>
Subject: [PATCH 1/2] firmware: arm_scmi: Ensure that the message-id supports fastchannel
Date: Wed, 4 Sep 2024 08:26:32 +0530
Message-ID: <20240904025633.2881671-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904025633.2881671-1-quic_sibis@quicinc.com>
References: <20240904025633.2881671-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PbhvZdbj-YX4mrBKZjmEkGVwg3IS_lgT
X-Proofpoint-GUID: PbhvZdbj-YX4mrBKZjmEkGVwg3IS_lgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040020

Currently the perf and powercap protocol relies on the protocol domain
attributes, which just ensures that one fastchannel per domain, before
instantiating fastchannels for all possible message-ids. Fix this by
ensuring that each message-id supports fastchannel before initialization.

Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

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
-- 
2.34.1


