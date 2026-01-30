Return-Path: <linux-arm-msm+bounces-91240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 74ikIuJLfGlZLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:12:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4073B7925
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C13C300380D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 06:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037682D948A;
	Fri, 30 Jan 2026 06:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9GBk5uR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E522BD0B;
	Fri, 30 Jan 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769753562; cv=none; b=mtriUszfYHEUrnuP55M2qOGbC3GHdTJZufOxZMxqvwePpcTKK9kznnVVp7oXHKJeOkg99pepu1IAIlG5SPsX8CEQtTRFrx9q09Q6ABl/+v3QQ4DVnbsRJQHMYjBS50kOdUAakLcJ8yVr7wAh69vyaO5inW+2reNM9yjU8nKURZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769753562; c=relaxed/simple;
	bh=KSVzag3nVsRlO4X8MyX7NnKVQj7opoNSwXs3KXqyaQs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZFmAc6xjbVw1/UFzpt24A3DlhfACTsEb+Hm/EDZwsA8v3AP/GGICotfLTMsjkiYu5L38/5Li8kquRGY8Yh5bxFTH9Is1HX7OETGTmQdA+MK0pcDNS/hh/JNQW8nkJNlsPL6QYdaJopX8RaPCI1EKH0WUfhwy1ln41JXlpsFfTCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9GBk5uR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U52aPC555321;
	Fri, 30 Jan 2026 06:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DZZrlKqSGdlJzjstjcwmjT
	5zfu51oe24NqbZ10BuLaI=; b=b9GBk5uR4FeqccuTbKu7LYboS2ijcK0F2aSqqH
	95hxfsChxYeOneYPHG28cTouRAYvNs4Bd06XVBORFDtXfpn17tcSqldXcmhr26b+
	ZMyj2Y63S6Zn6sZwXysunYO55BEH1590Mn7kWxZmIco76PXYh9w6nEogvIMZ8jqX
	kwl1WscqY8EwX0Gl9z93o/iohVI5K/3oLu4yoGUksBkzFpDMwYjy6+1Ff/wSwk8a
	/ysd4Q2je+z99oNIi8Y3k49NWLNgNVvG/9lX3MGFqzJ0wMbX8eNOHM6pVCp0zSmO
	ltGxk2udUXp4TVPjiQxcgmiRJMcjq5sYI97irmwJ7cFOju9w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59g5vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 06:12:37 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60U6CZZI005949;
	Fri, 30 Jan 2026 06:12:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bvq5mv1c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 06:12:35 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60U6CZeX005943;
	Fri, 30 Jan 2026 06:12:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60U6CYYc005940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 06:12:35 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 35A8122740; Fri, 30 Jan 2026 14:12:33 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2] arm64: qcom: pd-mapper: Add QCS615 power domain mappings
Date: Fri, 30 Jan 2026 14:12:31 +0800
Message-Id: <20260130061231.310113-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -7JZH5K7ytOqVlZMFAqt0RuxDxZ041Vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA0NiBTYWx0ZWRfX75J4kpJhXZsM
 Ub6Pwx8DA/148F/i2doJxTlyMmAof8FC/IXrn7YlNXlGk+F0ia20FzbU1FHZ6TulcKO/LmK6PTc
 viHCBK0zLbYjoPXubb2MCHlQN48q6psaJX8KfCWn64VeUm/d8vWjOsQ/kn4bIjIvUjbg8o+aaDb
 t0R9Amoev/yT23oW+JbxotFTTjd00Xrp6LLov8Zf8nwYPY2axVUmRrK8kpUhgwkN/yNz9dcsnVv
 VtOrnkYPDRL+eM1o75WJBuXWryOvcLceHkm0drdSzODSlY1OCoaHBprGmd6KlB9yZD+sgM7YsAD
 nzX6+qKflSPAaKBp1T6eUrSd+4o2xTmwMIH8jT6HaOd1NPPYzVN3NDW8TZpYeSa6YSondPFlmw3
 5f4zUNR3tQppzshN0N2Fu9V3YO4djArjiSFYifZUMh8IpQ6UyhjWJeUEjLpB+V06Q3CFMKTbOeK
 jV0NagN3ZyxpMmSiW7g==
X-Proofpoint-GUID: -7JZH5K7ytOqVlZMFAqt0RuxDxZ041Vm
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697c4bd6 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ugCWuRhOeS4SfFBP1JEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-91240-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A4073B7925
X-Rspamd-Action: no action

Add the QCS615 domain table to the in-kernel pd-mapper so that audio
subsystems no longer rely on the userspace pd-mapper daemon.
This enables proper initialization of ADSP and CDSP domains directly
from the kernel.

---
Changelog:

v2:
  - Added mpss_root_pd and mpss_wlan_pd for Talos/SM6150 variants, as Wi‑Fi
    firmware is loaded via MPSS (icnss). Confirmed by modemr.jsn/root_pd and
    modemuw.jsn/wlan_pd from Redmi Note 7 Pro firmware
  - v1-link: https://lore.kernel.org/all/20260122111318.500262-1-le.qi@oss.qualcomm.com/

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..b685698458e3 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -401,6 +401,16 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *qcs615_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *sc7180_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd_pdr,
@@ -572,6 +582,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
 	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
 	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
+	{ .compatible = "qcom,qcs615", .data = qcs615_domains, },
 	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
-- 
2.34.1


