Return-Path: <linux-arm-msm+bounces-30611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9B896AEF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 05:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16F51C215D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 03:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C3A47F4D;
	Wed,  4 Sep 2024 03:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qnl7N6Qo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0935C59164;
	Wed,  4 Sep 2024 03:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725419657; cv=none; b=XG3kv5tovkzyBLeC9PLePegkCf/gc4KiLoHSa96vH5uJZ9NhUTuPzE/NL2qe5eA/q0rJlgY8pfNyDieJS2ZBJ8H1JP0jmoQu9BsrvUebzeYNuyanfTnHRwuy/jFpzPhhY6r5RBF0rkNXsbMZJuC5v8by27522wflyhtc1yoV/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725419657; c=relaxed/simple;
	bh=GuX1ClcBP7lkc+WLmn/PjY3HXaZ5/ev7RgngsoyHqBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdzUurkK3yRCjCkTLwmWEDFSK+V8oypHMA5xdps27Ael0OHP2moNwwYAqYRMQTCwnEpnANLumP39+/cT8yVQ4jKKA2/uCIZN4kWExE13Nkw+hv4j9nhYG3YJreTOHH3Eg3By880ciaI5b99TRXzbDh5B2wjJeFOEXyT97fg03iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qnl7N6Qo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4840XR3l015575;
	Wed, 4 Sep 2024 03:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o28dlcLH6mXQQ4eoxEfarQtCQ0quIOyBrKvVpvueI3k=; b=Qnl7N6QoJsejDEtb
	qgl8jMtUm9rP5dgmk1wQfpim2AGFiZDwqpHkdRvzilSnlnewATQEW7vseGj1L8F0
	U5q321q1A39qRYyef4UdC4HX6XBcaFixFgBsLOFBNY5zTQqk+4RlZExsZXMBiAU0
	fgckN+5ffPvFDHdjLgaUcK7D0ebPk3cNW154u1MgIp6rCWCrFCUL0hxGtMDh775e
	zUIVlJCralxF7YviTX67cm7XRhvtMIpL7Zk87UC/VEoqTiEx3BISzT497eMdCCLj
	FR33oeSOIEjhhuOJhKZKCi8VLbSm0U/e8zE09j4ude1WwTeHVCs3ppD7LLW4afS8
	poWSAg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69bg8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 03:14:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4843E6Tn011364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 03:14:06 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 20:14:03 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>
Subject: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Date: Wed, 4 Sep 2024 08:43:24 +0530
Message-ID: <20240904031324.2901114-3-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: IHgEr2i_4Kr1xLaSqzVqYJRMSHtqOfkM
X-Proofpoint-ORIG-GUID: IHgEr2i_4Kr1xLaSqzVqYJRMSHtqOfkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040022

Ensure that the bad duplicates reported by the platform firmware doesn't
get added to the opp-tables.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 2d77b5f40ca7..114c3dd70ede 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -386,9 +386,11 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
 		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
 
 	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
 			 opp->perf, dom->info.name, ret);
+		opp->perf = 0;
+	}
 }
 
 static inline void
@@ -404,9 +406,12 @@ process_response_opp_v4(struct device *dev, struct perf_dom_info *dom,
 		le16_to_cpu(r->opp[loop_idx].transition_latency_us);
 
 	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
 			 opp->perf, dom->info.name, ret);
+		opp->perf = 0;
+		return;
+	}
 
 	/* Note that PERF v4 reports always five 32-bit words */
 	opp->indicative_freq = le32_to_cpu(r->opp[loop_idx].indicative_freq);
@@ -871,6 +876,10 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 		else
 			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
 
+		/* Skip all invalid frequencies reported by the firmware */
+		if (!freq)
+			continue;
+
 		/* All OPPs above the sustained frequency are treated as turbo */
 		data.turbo = freq > dom->sustained_freq_khz * 1000;
 
-- 
2.34.1


