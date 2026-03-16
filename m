Return-Path: <linux-arm-msm+bounces-97906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIomDznet2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:40:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 957A529807B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6F52302BBA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF32D386540;
	Mon, 16 Mar 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnsvGeGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9759917D2;
	Mon, 16 Mar 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657521; cv=none; b=akDiH92t9UPnsamkC+PjWyvavcx1VF7211Cf7VjGEYGoJejAdib5/FGsGUetPSYc3D5Km1NzD0b/0wpm/+JbIT8dGuH2fs0HbErDVLOuon6a5dTmNHOV388R+TsuGFfQCyrEsfZXPIIwwpL3mI707Qo+rVkssFsVxpTOw3uIsdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657521; c=relaxed/simple;
	bh=k2KfW4ERoGcW2M+vpLCi1Mvgx35e//jGrS2s8VH1EcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XkIU9IuE2riGGr4n/B8bWlD5QPFhm2waXK4iNaPR2BWpqkpANE/4w67CmzenhpqhEAHA6JWU5D2IvK9fHwpbrQlEGOlNAmy5hrZd1WQZj9jB0yFwta87SYlpJ4FAHNLi4GpWwDfq9bU3olazFgQOj3/8MnagMABhzVJ7CtPaJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnsvGeGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64alR3777541;
	Mon, 16 Mar 2026 10:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6eCQdKIkaIpHizpI6Ymc3ennjMskMJ/b4iQ
	nDOcBQaQ=; b=KnsvGeGE/2+QI63QlK3K3dJ8N51GRyospUes/W7z/sIF4VcXns8
	8AwBTcHS3Z+Uj0s61+BXOwpc92xxn1mU3B5XRiRFDY7qJcGknJz/KX7Gndy3aY7p
	pJCCiWeb9AkzVRiqr21UD/0/lGkyh52EIox8/i6EZCmQ/v5I0MAzy+OhvJ8Ik3l6
	jDHD/M3ijQQudAcrpm1EI00XzcCmGsyLjB7e5KIiP09XowkWP9qkQxWjUGROwCjJ
	opkmXMc8xCeSO2/0asaHbhI7wt/l9hvyWJwmzPv2pHJXQIsn8A67aQLo/+YBhaKh
	LAKlUERMUbM+yJSuhwi+e/h6BFaDASYK1BA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w559-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 10:38:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62GAcVR4029180;
	Mon, 16 Mar 2026 10:38:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cw0rktskg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 10:38:31 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62GAcV4i029175;
	Mon, 16 Mar 2026 10:38:31 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 62GAcUx6029167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 10:38:31 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4279625)
	id CEE8E5E6; Mon, 16 Mar 2026 16:08:29 +0530 (+0530)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
To: viresh.kumar@linaro.org, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        umang.chheda@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH] cpufreq: Add QCS8300 to cpufreq-dt-platdev blocklist
Date: Mon, 16 Mar 2026 16:07:52 +0530
Message-Id: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GlpvtEkBNcW41Fk8IE0aB3JWPWZ_BW8X
X-Proofpoint-ORIG-GUID: GlpvtEkBNcW41Fk8IE0aB3JWPWZ_BW8X
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7ddab cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=znRDN1HS16bJCMppkREA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MSBTYWx0ZWRfX7ullTy3ai6wc
 5i/uVzD7nIyCgl8HELF2e0C/MqUZ1N1gh0nDIVHkxkA+FSH7dF/BM77GDr1GLDyiCvsU9+tpiaX
 JY59Cr3kROqwd0hU9ULgbhjyTdDmLpmcLJ8SRoBBfogmEQVtCHegkIlYobOtOa3dUaCrGZN2mMT
 ib1yQQTEbh9wWKlg/hFxCLLrRgMtuYZgst/2mGZA9KLHgEsT0M3uMjOL7onNf0JzlM6vPccGqpi
 jXVGhF/O+dxkv2hagfV+OFlj4be16sXLZfHtEscvUotJTCVSRYJd05Kt6rVWaZWOz5raaNICRhg
 u+2uUQdNSBFJnzq8OvoAJECrQyYMSbAnwBgwbe3pCgW6DK+3+n+bj59Q80WoSoBp/WlUcbUMSSj
 ZEydSw4wCqSFKPcfYwUYATq736tV1zmUWgJQLuvjy3EdIZM0NT/5Y/HPHrcO0BmQpYB3yevUNCX
 2+3rrJiJ5Lgv8Iz1wQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97906-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faruque.ansari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 957A529807B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm QCS8300 platform uses the qcom-cpufreq-hw
driver, so add it to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 25fd3b191b7e..ff1204c666b1 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -159,6 +159,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,qcm2290", },
 	{ .compatible = "qcom,qcm6490", },
 	{ .compatible = "qcom,qcs404", },
+	{ .compatible = "qcom,qcs8300", },
 	{ .compatible = "qcom,qdu1000", },
 	{ .compatible = "qcom,sa8155p" },
 	{ .compatible = "qcom,sa8540p" },
--
2.34.1


