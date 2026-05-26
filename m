Return-Path: <linux-arm-msm+bounces-109768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOCmDNFzFWpbVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:20:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C50085D412D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A52D302EEDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF603DD507;
	Tue, 26 May 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7dlSOLj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBK8ZstN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BF3DCDBE
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790752; cv=none; b=ae0LdKTlZmBaRmvK8ohHhKJodElnf/Ut6w7ket2JRWsIVurGF6kR4q7a1+Lsnv8LzP4+pbKBUzjf6awr7r5OSwdeoC5HBonANvsPjOQxoGVXr4xs3eLB0YAn3kcg23FI2LGQoAp/f0DItUx6I60wOxfBkZTnrb/kYmKbb3c2pj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790752; c=relaxed/simple;
	bh=K3HaQ0i0f40jcm7saHW9ldaN18lyHoCTSnxxmp/1E1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpSMqzZ/Wi0VqpPtFHDd4sTc1p1m4OmDdJFSK3jQf9InxOnXXx88+HRWr2d/oCN1KAcaDIj1x9mt2KHwsxq8hnlDL0U9dKI1a8oLtaQpycx5okKXy3VzaN2FXJJtlv+zkhjpK6XrpFWQbpYzsU7QUdU0anP/l1YvSFKjieme7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7dlSOLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBK8ZstN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8pfBD4117460
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpA20mQebJc+mgK4Uh3oHCMORChwQsgQhTdWjuHd7WM=; b=M7dlSOLjLzB62SuG
	iveiJYmwt0Hf6cWROAGGQy1AiG9fHuOAQDnO5wfbP9Uy4wqAnFhaxctudFjCwXn7
	xOUWA1WQtopocsPtkS3Bg9N4Hnc8V3t2wkmmtxw6iJFcThsOPO02uYpXSsCAyerK
	Dn3tMQ3vrrtpwMNrlZLaRnG9iCAjOdKE+XI38lwos2JnpEzZLbNmMqmbuPrvTRgq
	z82p9VPM4WWvGpH2Y6ncTPWSe6ZJBfVW5mEFnyZdu6Igs1Xs9Iz+EDEOuA1yoWMI
	P33ukWRAaiaS77vLnzH/XAwpDB6ikSuVIObCtYKVzsqlB/LtA7jEtA8JwzOXdy4f
	xzDEWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbcqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc6899bfb1so109289375ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779790748; x=1780395548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpA20mQebJc+mgK4Uh3oHCMORChwQsgQhTdWjuHd7WM=;
        b=YBK8ZstNCXWMZtwiE3xAAgUZQUAhoQoJuhCKwaaceb5ClNYGJXwUSYiZReqKM9vFPg
         zwBtC8wgzO4LqbLJwbaWdX1+7oYpa9xXlqeuYJQwe3rGvNYz0CgSJNHrhgMZLRmcm13B
         NeIUJxlN4MoOEowmPtkDQSb1oz3YnvzmWGbcU92BTfHoD7nZNd8yWvDsLLEOm/4OhfW9
         RD9H/3Qg2WI/6DCZCcWuP60z5HlqskgHBNwQR/oCaP4O0XLdbdV7Ie1qrQcyJ1UKiq6X
         GDoWZuSHLQmOiIzrRa1bHuFuWJ6T+qNJZ72DKcgP3hm1r39Ig5dqrw391wRtntnIC1Dw
         OElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790748; x=1780395548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpA20mQebJc+mgK4Uh3oHCMORChwQsgQhTdWjuHd7WM=;
        b=cwjcstN/8gvtjNziC2B3mgTWqTwt4E0HM/htRfGnQYBpSkOmOpo0TqnhxRMC5iIY0l
         E6Dioh+F9qAaABOpKew8kWJum7rfB/ysXiQqzZDm33lFyaASSOEzNwumSczIxMwwT7yY
         5zlEHwvskFCT6lCwm9ZudfI/Ij+dQn/vi3xG5gjoBGPyvvtGh3eAwWHwCcyYEbA5++a2
         PF+nW+tAvVADm5r+sSF52Dv5ZNC/hhiK4ihJM8YphHlrIhW63Fu6Mq1n+eZzWA/BeBmA
         q8jCdIp2e8tIiNxMcW8x+dr2dXsrAGoh5K0greO4yQ5gqMhJAwzxQbxEJOjdbpUoVXVV
         DLlg==
X-Gm-Message-State: AOJu0Yyvf5Pf3AAfdOrbpwtYSOoE50uqzOHrUEczXnZd1aQueSG+xEMI
	+/9OeLQX1TLGUA2zimdb2rT16lalw+4oyzKUr+s02Ms6E708wIy072RSIFp1ifHMEw0qvUnjPDM
	D/S8ilVxXEKr1jZQtodUU0LWUQ4t7rq/mBBGKTWaHxCK6TXziSaElH7iWtCb+YujJAjHD
X-Gm-Gg: Acq92OHOBe53YnwLLsPFciYN5no2t/aEEqGPWJRtknPPNtTCnX3Tv1paMCJXmyBaLDN
	solR0UI+hGAcaLWWEjDaMptA6BaJIa+VKLygx+XKWS9jM0XE7hL7PrJpBiEyrqm6EynPYuSwah/
	Ao4mfiRBOrQlDItBDgQIlUIU3o0n+190rIDWu8eszbnezAd8mtnSnf3TULQf0Po1GsI5yxGD8Pk
	IF38gAR1ChXgQPb1T9wBYCHHGxWB2LWhZxVCaFh2yeECZ8n0bKSFLgqb3G23ZdX6AZNqAf3Nd2W
	SS3y7fF2PDKsjOHircWNRrau1kzaaRa/sXXzIuti3kY0Qr+hyWGKgsv6CiIj2lemFm6Zpa4T+5T
	r785/miR4IWzbOoO2Fekab8BgTsLw1zx0R9d+YFkeOvY0DphFk0kkQio=
X-Received: by 2002:a17:903:2390:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2beb0356171mr202051865ad.11.1779790748165;
        Tue, 26 May 2026 03:19:08 -0700 (PDT)
X-Received: by 2002:a17:903:2390:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2beb0356171mr202051525ad.11.1779790747641;
        Tue, 26 May 2026 03:19:07 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm159941105ad.36.2026.05.26.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:19:07 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:48:36 +0530
Subject: [PATCH 1/2] thermal: qcom: tsens: switch wake IRQ handling to PM
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-tsens_interrupt_wake_control-v1-1-6adcd75555b9@oss.qualcomm.com>
References: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
In-Reply-To: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779790740; l=6386;
 i=priyansh.jain@oss.qualcomm.com; s=20260515; h=from:subject:message-id;
 bh=K3HaQ0i0f40jcm7saHW9ldaN18lyHoCTSnxxmp/1E1U=;
 b=NB+6n4ck4oYi0niqhUeW+jXk6uZ67KTVAIxa18qHg1NQ0EFhEyAnvjGu28Qb71WY8CErZlarR
 YGe+c9/U5/6CH3Z3jujFdWPvXM8pIodbk6Y+CBiue9lyMveH/UkiLJm
X-Developer-Key: i=priyansh.jain@oss.qualcomm.com; a=ed25519;
 pk=xe57jjgIoTuNHN/Dp00kZl1mAJjmROaH7JV9sRxEoEQ=
X-Proofpoint-ORIG-GUID: UXMSQERPp2D36hIfCsxF2GNvHSLAxqCP
X-Proofpoint-GUID: UXMSQERPp2D36hIfCsxF2GNvHSLAxqCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4OCBTYWx0ZWRfX6WyYLyMmF+tY
 eGi44dKJLyaUxHV6lJAcAQMKo0DoIgGmPl08F12g54OFsgduvihQrpiLxOuQBL5saE1WBpZtwXk
 l5m/bHr3BcLwLKKJ6Kgy4r9cqoOCa9bxlUe6vFy+9pafcu5brTKbBToa/40rs9F8to/J0Mwa4Nj
 lI2YdxXNzkTdd5NSXu37b1Tgbx3gPNsPRNVxlCMd+7FLtgrEn47NlXMfEz6t3xci7XeJJc4l8xb
 GT2s4IuEqvfGO5YTu67CA5Z+3mO7ZsYTLymNIZ1q5hiF6HUV9XwqkmQ7kht3M/suIezL6qL8NTg
 rG3eABCNP+73ejyNaLqjK5GlN/4Q52NlcS8CDEryGwN6bKPHcqBEShmsSeriHI4iRHKd5QvXObg
 XrYTAT+jOnmMMNdRu1IWjL1/6n8wxeMylpt4uZQA/BHWO8Unb0gPhdugvZ3f6D5obyEtUf3vn6t
 Rtn6LhHjzBl0bbBEoLQ==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a15739d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Y1N8Ec-qMYIBCvTlKQUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-109768-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C50085D412D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This change improves power management by using the standardized PM
framework for wake IRQ handling.

Move wake IRQ control to the PM suspend/resume path:
- store uplow/critical IRQ numbers in struct tsens_priv
- enable wake IRQs in tsens_suspend_common() when wakeup is allowed
- disable wake IRQs in tsens_resume_common()
- mark the device wakeup-capable during probe

This aligns TSENS wake behavior with suspend flow and avoids keeping
wake IRQs permanently enabled during runtime.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c |  1 -
 drivers/thermal/qcom/tsens.c    | 72 +++++++++++++++++++++++++++++++++--------
 drivers/thermal/qcom/tsens.h    | 18 ++++++++++-
 3 files changed, 76 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 8d9698ea3ec4..e06f8e5802e8 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -263,7 +263,6 @@ static int __init init_tsens_v2_no_rpm(struct tsens_priv *priv)
 static const struct tsens_ops ops_generic_v2 = {
 	.init		= init_common,
 	.get_temp	= get_temp_tsens_valid,
-	.resume		= tsens_resume_common,
 };
 
 struct tsens_plat_data data_tsens_v2 = {
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..d5d880a2aa08 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1086,22 +1086,30 @@ static int tsens_get_temp(struct thermal_zone_device *tz, int *temp)
 
 static int  __maybe_unused tsens_suspend(struct device *dev)
 {
+	int ret = 0;
 	struct tsens_priv *priv = dev_get_drvdata(dev);
 
-	if (priv->ops && priv->ops->suspend)
-		return priv->ops->suspend(priv);
+	if (priv->ops && priv->ops->suspend) {
+		ret = priv->ops->suspend(priv);
+		if (ret)
+			return ret;
+	}
 
-	return 0;
+	return tsens_suspend_common(priv);
 }
 
 static int __maybe_unused tsens_resume(struct device *dev)
 {
+	int ret = 0;
 	struct tsens_priv *priv = dev_get_drvdata(dev);
 
-	if (priv->ops && priv->ops->resume)
-		return priv->ops->resume(priv);
+	if (priv->ops && priv->ops->resume) {
+		ret = priv->ops->resume(priv);
+		if (ret)
+			return ret;
+	}
 
-	return 0;
+	return tsens_resume_common(priv);
 }
 
 static SIMPLE_DEV_PM_OPS(tsens_pm_ops, tsens_suspend, tsens_resume);
@@ -1172,7 +1180,7 @@ static const struct thermal_zone_device_ops tsens_of_ops = {
 };
 
 static int tsens_register_irq(struct tsens_priv *priv, char *irqname,
-			      irq_handler_t thread_fn)
+			      irq_handler_t thread_fn, int *irq_num)
 {
 	struct platform_device *pdev;
 	int ret, irq;
@@ -1204,8 +1212,8 @@ static int tsens_register_irq(struct tsens_priv *priv, char *irqname,
 		if (ret)
 			dev_err(&pdev->dev, "%s: failed to get irq\n",
 				__func__);
-		else
-			enable_irq_wake(irq);
+		else if (irq_num)
+			*irq_num = irq;
 	}
 
 	put_device(&pdev->dev);
@@ -1232,11 +1240,44 @@ static int tsens_reinit(struct tsens_priv *priv)
 	return 0;
 }
 
+int tsens_suspend_common(struct tsens_priv *priv)
+{
+	if (!device_may_wakeup(priv->dev))
+		return 0;
+
+	if (priv->feat->combo_int) {
+		if (priv->combined_irq > 0)
+			enable_irq_wake(priv->combined_irq);
+	} else {
+		if (priv->uplow_irq > 0)
+			enable_irq_wake(priv->uplow_irq);
+
+		if (priv->crit_irq > 0)
+			enable_irq_wake(priv->crit_irq);
+	}
+
+	return 0;
+}
+
 int tsens_resume_common(struct tsens_priv *priv)
 {
 	if (pm_suspend_target_state == PM_SUSPEND_MEM)
 		tsens_reinit(priv);
 
+	if (!device_may_wakeup(priv->dev))
+		return 0;
+
+	if (priv->feat->combo_int) {
+		if (priv->combined_irq > 0)
+			disable_irq_wake(priv->combined_irq);
+	} else {
+		if (priv->uplow_irq > 0)
+			disable_irq_wake(priv->uplow_irq);
+
+		if (priv->crit_irq > 0)
+			disable_irq_wake(priv->crit_irq);
+	}
+
 	return 0;
 }
 
@@ -1276,15 +1317,18 @@ static int tsens_register(struct tsens_priv *priv)
 
 	if (priv->feat->combo_int) {
 		ret = tsens_register_irq(priv, "combined",
-					 tsens_combined_irq_thread);
+					 tsens_combined_irq_thread,  &priv->combined_irq);
 	} else {
-		ret = tsens_register_irq(priv, "uplow", tsens_irq_thread);
+		ret = tsens_register_irq(priv, "uplow", tsens_irq_thread,
+					 &priv->uplow_irq);
 		if (ret < 0)
 			return ret;
 
-		if (priv->feat->crit_int)
+		if (priv->feat->crit_int) {
 			ret = tsens_register_irq(priv, "critical",
-						 tsens_critical_irq_thread);
+						 tsens_critical_irq_thread,
+						 &priv->crit_irq);
+		}
 	}
 
 	return ret;
@@ -1343,6 +1387,8 @@ static int tsens_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	device_init_wakeup(dev, true);
+
 	if (!priv->ops || !priv->ops->init || !priv->ops->get_temp)
 		return -EINVAL;
 
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..83a8f3580ed0 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -567,6 +567,9 @@ struct tsens_context {
  * @ops: pointer to list of callbacks supported by this device
  * @debug_root: pointer to debugfs dentry for all tsens
  * @debug: pointer to debugfs dentry for tsens controller
+ * @uplow_irq: IRQ number for uplow (upper/lower) threshold interrupts
+ * @crit_irq: IRQ number for critical threshold interrupts
+ * @combined_irq: IRQ number for combined threshold interrupts
  * @sensor: list of sensors attached to this device
  */
 struct tsens_priv {
@@ -588,6 +591,10 @@ struct tsens_priv {
 	struct dentry			*debug_root;
 	struct dentry			*debug;
 
+	int				uplow_irq;
+	int				crit_irq;
+	int				combined_irq;
+
 	struct tsens_sensor		sensor[] __counted_by(num_sensors);
 };
 
@@ -639,8 +646,17 @@ int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp);
 int get_temp_common(const struct tsens_sensor *s, int *temp);
 #ifdef CONFIG_SUSPEND
 int tsens_resume_common(struct tsens_priv *priv);
+int tsens_suspend_common(struct tsens_priv *priv);
 #else
-#define tsens_resume_common            NULL
+static inline int tsens_resume_common(struct tsens_priv *priv)
+{
+		return 0;
+}
+
+static inline int tsens_suspend_common(struct tsens_priv *priv)
+{
+		return 0;
+}
 #endif
 
 /* TSENS target */

-- 
2.43.0


