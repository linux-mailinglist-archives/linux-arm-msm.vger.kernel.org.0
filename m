Return-Path: <linux-arm-msm+bounces-49396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6EA4534C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 03:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12AE3ACFF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 02:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C8821E0AA;
	Wed, 26 Feb 2025 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iB0/40cL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75B21D5B7;
	Wed, 26 Feb 2025 02:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537856; cv=none; b=lhrGdXwuEf9WxHxMQOmKw010cjsBag/rtPaEnC6znbTruqG1ZwGe5qQUmI26ZLmEERIwSrtpy4dzXOqaAkB4FQ2FOmvu1r5t/IhxdS4j0131HjFpo3QTZA/dTRipJsOifyYznnC/3qLifVicFHjwnuyvxve0e3Bc2tUM1L7e2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537856; c=relaxed/simple;
	bh=1oL4JnFDzCWo65Z7eFpcyAexAInH261tb8TNWeogKIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYye3ancKHlsXDp9KkxvWk/4xO6TwY9s/FoWCitdIc8SzNPLz5IaGy88NReSOLNN0R38flvxFkKiggOIbKQlzdQVeDSwHcWQ+kPfnMrehjdGqbz4za4BzD/3rAWxzPbuNBI+iTMVY5S43KaJGtOGt3S2dY7al3IfqZ/UydX0vsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iB0/40cL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMYC7m013332;
	Wed, 26 Feb 2025 02:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qje131Rr/amQVhvj70xbXZpmuSbemZIWtBdEryaf1k=; b=iB0/40cLtS2jMtoE
	2xqPyfrplp8K4/2tvuRqOZhsydJnUT3lcGgE0cyUuvOJYShdAiomQ0XQVX7uF1F1
	6zfxYdiPyHtIg2hMVEqM3eqEv1JhXAPc2sGDMsIesJ290kVuGv4KAkbHHKHOKbAX
	hSqb69g01H0l9h2/Wh+1asAEqFm988s0XOKl+9x6ELvtfYjWpWlUEztRtM2LeSBx
	r/iwHLacVaovpH1Sbbqxxc+OwPsu94OkEC4AGkioK5rgVhncEr5Cmp0B7lJBc688
	8O95B6OwH229qBQdIyA0L+98qfs8jTzmbIS/p8JyFs1MH1qR/iGk8UGQ3x7TXXje
	K9AUcA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk8g39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:44:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q2i4qX020810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:44:04 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 18:44:00 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>
Subject: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Date: Wed, 26 Feb 2025 08:13:38 +0530
Message-ID: <20250226024338.3994701-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226024338.3994701-1-quic_sibis@quicinc.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Las44SGPqOcA59WC_rZmPZqYiM8Ve5Nh
X-Proofpoint-ORIG-GUID: Las44SGPqOcA59WC_rZmPZqYiM8Ve5Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260019

The addition of per message-id fastchannel support check exposed
a SCP firmware bug which leads to a device crash on X1E platforms.
The X1E firmware supports fastchannel on LEVEL_GET but fails to
have this set in the protocol message attributes and the fallback
to regular messaging leads to a device crash since that implementation
has a bug for all the X1E devices in the wild. Fix this by introducing
a quirk that selectively skips the per message-id fastchannel check only
for the LEVEL_GET message on X1E platforms.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/driver.c    |  5 +++--
 drivers/firmware/arm_scmi/perf.c      | 30 +++++++++++++++++++++------
 drivers/firmware/arm_scmi/powercap.c  |  8 +++----
 drivers/firmware/arm_scmi/protocols.h |  2 +-
 4 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 9313b9020fc1..b182fa8e8ccb 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1903,7 +1903,8 @@ static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
 			     u32 domain, void __iomem **p_addr,
-			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
+			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
+			     bool skip_check)
 {
 	int ret;
 	u32 flags;
@@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
-	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
+	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
 		return;
 
 	if (!p_addr) {
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index c7e5a34b254b..5b4559d0b054 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -48,6 +48,10 @@ enum {
 	PERF_FC_MAX,
 };
 
+enum {
+	PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET,
+};
+
 struct scmi_opp {
 	u32 perf;
 	u32 power;
@@ -183,6 +187,7 @@ struct scmi_perf_info {
 	enum scmi_power_scale power_scale;
 	u64 stats_addr;
 	u32 stats_size;
+	u32 quirks;
 	bool notify_lvl_cmd;
 	bool notify_lim_cmd;
 	struct perf_dom_info *dom_info;
@@ -838,9 +843,10 @@ static int scmi_perf_level_limits_notify(const struct scmi_protocol_handle *ph,
 }
 
 static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
-				     struct perf_dom_info *dom)
+				     struct perf_dom_info *dom, u32 quirks)
 {
 	struct scmi_fc_info *fc;
+	bool quirk_level_get = !!(quirks & BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET));
 
 	fc = devm_kcalloc(ph->dev, PERF_FC_MAX, sizeof(*fc), GFP_KERNEL);
 	if (!fc)
@@ -849,26 +855,26 @@ static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 				   PERF_LEVEL_GET, 4, dom->id,
 				   &fc[PERF_FC_LEVEL].get_addr, NULL,
-				   &fc[PERF_FC_LEVEL].rate_limit);
+				   &fc[PERF_FC_LEVEL].rate_limit, quirk_level_get);
 
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 				   PERF_LIMITS_GET, 8, dom->id,
 				   &fc[PERF_FC_LIMIT].get_addr, NULL,
-				   &fc[PERF_FC_LIMIT].rate_limit);
+				   &fc[PERF_FC_LIMIT].rate_limit, false);
 
 	if (dom->info.set_perf)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 					   PERF_LEVEL_SET, 4, dom->id,
 					   &fc[PERF_FC_LEVEL].set_addr,
 					   &fc[PERF_FC_LEVEL].set_db,
-					   &fc[PERF_FC_LEVEL].rate_limit);
+					   &fc[PERF_FC_LEVEL].rate_limit, false);
 
 	if (dom->set_limits)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
 					   PERF_LIMITS_SET, 8, dom->id,
 					   &fc[PERF_FC_LIMIT].set_addr,
 					   &fc[PERF_FC_LIMIT].set_db,
-					   &fc[PERF_FC_LIMIT].rate_limit);
+					   &fc[PERF_FC_LIMIT].rate_limit, false);
 
 	dom->fc_info = fc;
 }
@@ -1282,6 +1288,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int domain, ret;
 	u32 version;
+	struct device_node *np;
 	struct scmi_perf_info *pinfo;
 
 	ret = ph->xops->version_get(ph, &version);
@@ -1297,6 +1304,17 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 
 	pinfo->version = version;
 
+	/*
+	 * Some X1E devices support fastchannel for LEVEL_GET but erroneously
+	 * says otherwise in the protocol message attributes. Add a quirk to
+	 * force fastchannel on LEVEL_GET to prevent crashes on such devices.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "qcom,x1e80100");
+	if (np) {
+		pinfo->quirks = BIT(PERF_QUIRK_SKIP_FASTCHANNEL_LEVEL_GET);
+		of_node_put(np);
+	}
+
 	ret = scmi_perf_attributes_get(ph, pinfo);
 	if (ret)
 		return ret;
@@ -1315,7 +1333,7 @@ static int scmi_perf_protocol_init(const struct scmi_protocol_handle *ph)
 		scmi_perf_describe_levels_get(ph, dom, version);
 
 		if (dom->perf_fastchannels)
-			scmi_perf_domain_init_fc(ph, dom);
+			scmi_perf_domain_init_fc(ph, dom, pinfo->quirks);
 	}
 
 	ret = devm_add_action_or_reset(ph->dev, scmi_perf_xa_destroy, pinfo);
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1fa79bba492e..90e92fc432e3 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -720,23 +720,23 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
 				   POWERCAP_CAP_SET, 4, domain,
 				   &fc[POWERCAP_FC_CAP].set_addr,
 				   &fc[POWERCAP_FC_CAP].set_db,
-				   &fc[POWERCAP_FC_CAP].rate_limit);
+				   &fc[POWERCAP_FC_CAP].rate_limit, false);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 				   POWERCAP_CAP_GET, 4, domain,
 				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
-				   &fc[POWERCAP_FC_CAP].rate_limit);
+				   &fc[POWERCAP_FC_CAP].rate_limit, false);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 				   POWERCAP_PAI_SET, 4, domain,
 				   &fc[POWERCAP_FC_PAI].set_addr,
 				   &fc[POWERCAP_FC_PAI].set_db,
-				   &fc[POWERCAP_FC_PAI].rate_limit);
+				   &fc[POWERCAP_FC_PAI].rate_limit, false);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
 				   POWERCAP_PAI_GET, 4, domain,
 				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
-				   &fc[POWERCAP_FC_PAI].rate_limit);
+				   &fc[POWERCAP_FC_PAI].rate_limit, false);
 
 	*p_fc = fc;
 }
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index d62c4469d1fd..fe4c724caba3 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -280,7 +280,7 @@ struct scmi_proto_helpers_ops {
 				 u32 valid_size, u32 domain,
 				 void __iomem **p_addr,
 				 struct scmi_fc_db_info **p_db,
-				 u32 *rate_limit);
+				 u32 *rate_limit, bool skip_check);
 	void (*fastchannel_db_ring)(struct scmi_fc_db_info *db);
 	int (*get_max_msg_size)(const struct scmi_protocol_handle *ph);
 };
-- 
2.34.1


