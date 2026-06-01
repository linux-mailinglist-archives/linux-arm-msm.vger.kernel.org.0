Return-Path: <linux-arm-msm+bounces-110507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHO2F+YoHWq6VwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:38:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5061A433
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00796300860A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 06:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B182376BEC;
	Mon,  1 Jun 2026 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kn99TrSV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvdk5GRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1737700A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295893; cv=none; b=jXNtCVdzs7mFL5DirxFGmRSZ7NQEBJ15VcS4wIol79l9YOMp2VyWu4KumdGapVPBogZjsZiDcAWV5/dwiTQ8evnP1ZKXWWEKjl5Q9B5gnOgF5P2uiD7AplZEKomg+Hf8URaudCvUBdmihFE0lb4lBTfiuJQ9pyB0tNXr5tcbow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295893; c=relaxed/simple;
	bh=Y0JrFTV5T0FffiMthuYxPMnO5mjs0Hi/IfUnmNg51OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDF3POzYNVEmyx+8io97LAFYWCqon83FtoYkoX/JJb6zxovS0Ho5aOnHPf17v60sv43lQw05A8QYfH+havbm23mSY017B736ofZ+C+vj1XjeqaL5FwagQ1jvgrWco6SxRBcVOnxetUdGyoAsOcK5IeTR2SVVNseSvsMQTb/1W/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kn99TrSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvdk5GRb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLsGGO4050258
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 06:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxZPef7xjYmwBeDaOPNB0KkqX4i6Nl78lGfvpZ8AaMU=; b=Kn99TrSVqxqpFWY4
	V6anuhg0bpzlUKNNPGCPY2uKERLi3rOG1GYkDt/laOfifDrIewDIxL6anESW5//S
	oqq235RzKbzLQD8f2fdBuvdcGIUpvrczus47otEuKotYO0pld+aSCoi6dql38fdo
	TaSa25IS3RwY89bP4aDL6xN3eKhWoBOf1wnLTVCT20zws+VXSCXQmaOxQJsRax8n
	JDlzmXwnrDHm1PUFVOfViKc9XkrBMqqjWXuBlhWV8xedFScOSVWz/GrkHgAf1y36
	Ed1SzYIBCN9fD6TO9xTPE3/2W5EBJaCuDsSXDz5V0u0th6XX6MxDbdxBQBQaWy4b
	VOMC5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux55nf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:38:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8584e3fc96so905954a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780295891; x=1780900691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxZPef7xjYmwBeDaOPNB0KkqX4i6Nl78lGfvpZ8AaMU=;
        b=kvdk5GRb89b0kJY75C8mx7UROo81deAvP+A4UQL2iHXeQcTR9mhiASUpSZY6OeToZp
         pzRYBO704pStd/sx/uBWqWmydFWYszzx4yZnuP9XfR7iat8We/AwsE4gLtl1hjxoCxb4
         XWvIDsn9yqEyR1YZ2UMaRPBhuNHVvQV1oa/15cM23uQd66YaQ8TMfDTF60m1rCS0xG55
         U76CCIpFzpuwaFngmRT/1neegdnwFmVlYuXVOAnlLUnDICyt7NtWNIC2jGk1b5geT4Uk
         va6ZDCBCzpRyniUT9eJDEnCmU+hdETb/iUyYofox+4A65mdVcqYDo/C5+ydI4sArsSl/
         qGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295891; x=1780900691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CxZPef7xjYmwBeDaOPNB0KkqX4i6Nl78lGfvpZ8AaMU=;
        b=oCN5Cuys6SvrpRCgfM/ilso5YF0zHnAavKEJGoRnEk6UKsh4P74juMhapiSs39hgEZ
         LsGCObBULJZi1BM18M84x+67B5c6b+yv62PBEZryk0Uik8qUkhikqmvGCUXDonXXNRGO
         gIqkfHkUIMZY209Lw8KNxgmgvvgy6aXPgCBQb8zBGY37boqiJPNIrNggYAYAt5rcKxoq
         8nPLoLcqfd8i7DltXfxP+aQqS6tRpE7X2GlOHi6sPKQprcj3hT1DFx70Ondg5ootLMmg
         DeuGb0flhd22z6gcFXpg5MRdIfs2Bk5aqXK2VDEBCnoC7ysO2UyqKDAmYifkk7/8Tr8t
         mMBA==
X-Gm-Message-State: AOJu0YzDjry6Dh3N3SRL1mG0XuC18e86+osHDDOrkuF1gepFKj00Keog
	tH8935YcBu7gFvbTtSw4BqZzil/Nkr1+u7Eu+RE4EIWwsVkodj5ErRhjOd2XdXKyj7555u23tG3
	wbqmZTpiRmx4UqcRwjPQhXiyfg2MX710W1U/RzcL3RS2fY1sdW34q1Mn+x9AsKW9Ox9P9
X-Gm-Gg: Acq92OHvasiHWLMlh8oiXKMPRX6b3SUygW2VyzN7Hd6LAtqEYX6+iIUlEm7jByi2eFo
	nJwNGIWGj+qEqlrZuSdGSVdsl/QZPEW5xhOABFbeVrrS2JGx811owoYG7EKpBBGK6o6U9JkeDqr
	ppdjKLu/plxmpmzwnMEyJOvk+9xqV1hLmEQ/+5Tum/3RwJU7W3mBJjYkiph4qOa/tSQNHK6jWM4
	j6eYr/TBgTdpwkBKX/R2fQmcYgfCH8xYmAW02nAx6FcOL6nARkfInJbsqecTBigB6t8zVC0FOu+
	hfUlTVWDA6MGe6hg/n3+6wwevbJqZu+T9lwp2KlGjYxm7yb63X238PBkMqMPhAcaOtMsWq2GJNU
	P9zmLUs0Zm4DRzLntCLP1DO3tfFWtiRjKfkVeYE+F+03uLGqQgQw3vKj7zfAbx4zRzw==
X-Received: by 2002:a05:6a00:908a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-842253ed743mr8613004b3a.21.1780295890585;
        Sun, 31 May 2026 23:38:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:908a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-842253ed743mr8612972b3a.21.1780295890057;
        Sun, 31 May 2026 23:38:10 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c9252bsm9321358b3a.39.2026.05.31.23.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 23:38:09 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:07:56 +0530
Subject: [PATCH v2 1/2] thermal: qcom: tsens: switch wake IRQ handling to
 PM callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-tsens_interrupt_wake_control-v2-1-ce9570946abd@oss.qualcomm.com>
References: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
In-Reply-To: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780295882; l=6214;
 i=priyansh.jain@oss.qualcomm.com; s=20260515; h=from:subject:message-id;
 bh=Y0JrFTV5T0FffiMthuYxPMnO5mjs0Hi/IfUnmNg51OE=;
 b=+RGFVW+oPzJbQpCxrIOFCGwa4Inv02vOLnFFKXCdx0pmy1EaO6ms0vyl7/9LOxPzZqtM/vdBs
 mnNGU1VqYHDDrK3dUwcpGY43G8LpswzxFSaR8sKZqXP248UhQcS36mJ
X-Developer-Key: i=priyansh.jain@oss.qualcomm.com; a=ed25519;
 pk=xe57jjgIoTuNHN/Dp00kZl1mAJjmROaH7JV9sRxEoEQ=
X-Proofpoint-GUID: iQBAbA-nyO08wPdWx3HRKCoXQVHHGYuV
X-Proofpoint-ORIG-GUID: iQBAbA-nyO08wPdWx3HRKCoXQVHHGYuV
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1d28d3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Y1N8Ec-qMYIBCvTlKQUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NCBTYWx0ZWRfXxQGLQKGoxMFz
 YLD0tUL3wOb/dyQeNO+SVsvZyXq4Y1H2YHVXtV6WzKBJykVLAxitrMZ9AqJ8ltU1tfreXhJ9Zm9
 bFQZw7FHtXBDMKk0aB+mpORz/svMY0i3Bh72SRB4DvHqw6FcaVDFuDdn1wTTmsDz1yDguTAlYPR
 zVYiu0eHdoutyGl2NGHjqn5kL/wglffooPqhizmuASkmPT9maqkUPZfBrxwT6mpSYBxqivLVa9+
 3qzB5UD8ZqcNRBxWU47/IpAYQVlO1Omzldl7/X8MLAgaU8dGQ9f7lH9iggaiODmPOlQxpuXwC+G
 hQehHDIyotteDERZLKUHQ0mDjKr4vmQ/Jk/atbHXNtuN/McwAT/ODkGfCKB0sRVswZY+7GwXuXQ
 L95QyaMcXv5zrQy+jhbCBFJPOXrVGgMprnZUtMiGDJjQmYJygufK+ha22Vb/y2loI5p5nYZRJv9
 ZOt0attK/VKHSLTkHLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-110507-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CA5061A433
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
 drivers/thermal/qcom/tsens.c    | 64 +++++++++++++++++++++++++++++++++--------
 drivers/thermal/qcom/tsens.h    | 18 +++++++++++-
 3 files changed, 69 insertions(+), 14 deletions(-)

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
index a2422ebee816..5210985b3767 100644
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
@@ -1205,7 +1213,7 @@ static int tsens_register_irq(struct tsens_priv *priv, char *irqname,
 			dev_err(&pdev->dev, "%s: failed to get irq\n",
 				__func__);
 		else
-			enable_irq_wake(irq);
+			*irq_num = irq;
 	}
 
 	put_device(&pdev->dev);
@@ -1232,11 +1240,38 @@ static int tsens_reinit(struct tsens_priv *priv)
 	return 0;
 }
 
+int tsens_suspend_common(struct tsens_priv *priv)
+{
+	if (!device_may_wakeup(priv->dev))
+		return 0;
+
+	if (priv->feat->combo_int)
+		enable_irq_wake(priv->combined_irq);
+	else {
+		enable_irq_wake(priv->uplow_irq);
+		if (priv->feat->crit_int)
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
+	if (priv->feat->combo_int)
+		disable_irq_wake(priv->combined_irq);
+	else {
+		disable_irq_wake(priv->uplow_irq);
+		if (priv->feat->crit_int)
+			disable_irq_wake(priv->crit_irq);
+	}
+
 	return 0;
 }
 
@@ -1276,15 +1311,18 @@ static int tsens_register(struct tsens_priv *priv)
 
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
@@ -1343,6 +1381,8 @@ static int tsens_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	device_init_wakeup(dev, true);
+
 	if (!priv->ops || !priv->ops->init || !priv->ops->get_temp)
 		return -EINVAL;
 
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..5e2da4e0d51b 100644
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
+	return 0;
+}
+
+static inline int tsens_suspend_common(struct tsens_priv *priv)
+{
+	return 0;
+}
 #endif
 
 /* TSENS target */

-- 
2.43.0


