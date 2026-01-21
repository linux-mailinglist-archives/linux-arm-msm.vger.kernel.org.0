Return-Path: <linux-arm-msm+bounces-90035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLjgKBD3cGmgbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:56:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B9C59877
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5112A87414
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D035E48C3E7;
	Wed, 21 Jan 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H60KKQ6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBhq5vn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99748AE15
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005720; cv=none; b=aJivmNTpTenwo11EtZYA2iicetuzRzTBcvksQsC+tG4VfnU0zltaKcbyPrFElJkBSSAlhkWj8hzIfmmRoS9pIQ+O/uJ8qQ7HD9B2PHu4kZWixwHJYqHXF8GmWjoEYBwdZP/wN6NFAto26IlSiNVoUUiwMNSIysLvxdhHIXeS0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005720; c=relaxed/simple;
	bh=Rcyp/WWL8lH1T8VIFCZDQ0hiIGXz0Qiw4hJR8vL2nsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R7GraDLUJND8STIQVtHERShMBn0TEUpCFLakHj8QotWJxUf4lQYP2zraZS0X+UaiMgYsX9EAx1kbbpsCw2S+kOhCssDUHdRkf8izvbrZ3/m1+zSEef7aw1T+V4UI2GHcI51oeToZKdnTgArF910Cd+WhHbYmWeBL+rGsTZ3JG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H60KKQ6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBhq5vn8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAeGkA2816867
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PohhrXGe5PT
	qCgeTdv6SeOzud+fnmfcnSu2+G2CcHFw=; b=H60KKQ6rvL2+7UK5fraNCckFAYV
	MY4v3pNC+CnwyR7EJCSsJruvyGOI+5d2YpV9A86vyxiPu59B7ziQVA4S+a3Vab+F
	CZR85AdD/Pxp4jygGsN9KQtPCrZfb9on9cM3HpRbQSkZ/L3eWbxCif+tduINmZ9j
	tmo7cShkaQM+P0icKmbEd6O/TqeOSlPJUMPtCVDiLzn1J3HreUPuit3oDrlP2Jyd
	PG4BNsp2uFhah6kiQH1dMVPWH7/HSsKF2Evq5KyWlgcQ7rVUQsfW15TamnGgdqaG
	JTg29Aqng/mf75/WxuJrjWk+VWp8re0loABkv51qUp6DlOEPoNSjSIZBFqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btw8kgpta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b4058909so903014685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005717; x=1769610517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PohhrXGe5PTqCgeTdv6SeOzud+fnmfcnSu2+G2CcHFw=;
        b=gBhq5vn8IaVxW0JYaLceN/Et21yC0IfIqDxcqyohK/n4FiEhzVxucZSm5XN8Va2ikM
         z00Z+wkIvzcley+jB6OdhBIKB19dyddBbmEOBxTmtGNpfSuWbHISZ2nCjGP4cHjxk2yb
         UklRI2Z3XXr3swEJARA19LS29PG8hiaxNG+3Bzi1XlRwrq4/YL/VKXyWVxlQI7qQ9h8Y
         dVyNg0p6anGWtayyugHE4RX9WN3EGfFpGDnHRaQY0E98sLGG5OrEGk6633jcy2+aK488
         aeiA9inh9QDrx/UENeCYUXPk5eZiNF/0lDT0vQStf9jbUzH+0sWwPE31DuzcygRcgquJ
         5mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005717; x=1769610517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PohhrXGe5PTqCgeTdv6SeOzud+fnmfcnSu2+G2CcHFw=;
        b=E5TceT/gQqQuW5ff/gi7JFjMJUHzKl/wH6BfnaZLgv1RczVTxEj+LzCqtJmhpQeT+L
         gR3Snqj2A0xqH0iVmjXdETPSslSm0uqYOLpIL5agBa2g6u01V/I9w13apdUXPnBeUOPC
         QKjQ+ialrOva3KXKc2cRdXfVUNKZ9U43GKwDPCshp24awtxjdZQykYxWhuuoQYqw0oko
         QFyBEIOPsa9kjPZSUJknEBjO+tZhrlWLBtOfjnmFXZ46k7mD+IGsa/2cYx+JFwWS3aeC
         fWhwquu1bETnKZZbkf4Ez8p0vZt8lvtIhH4TQAJ2l7pt9v6np5Iw9LoSXoxZ+hVNjGXW
         VJzA==
X-Gm-Message-State: AOJu0Yz+ZDTX3onjLquYZm8ptezpaPWpLP69NWEp7DbgcsmVCRsluONQ
	O2Eor9dk6NjxcUpHOX3qTq63Ou4r0TjHcaj2rUsZyebI378wv2NZ60NCY4aT16pyoKV5TP8zVgK
	j7xPvmmkwBir8OiyXn40sGcrO5CYgfumsONRlKn60hHYIa7RbEqrzNhngPvD6y0VUlEcW
X-Gm-Gg: AZuq6aLzO8+twA9GOdnOOMFoLyABEPj6imprjQo9LCtFt+DHNcGF0iL/VPs+TxH2Igd
	z5s+sFKHwUrtflTTnNBcVLhkhFsVak7P/AqWdHaa2etMZQgrmZmAceKpzbgJw6wVJx8GHe/a6pW
	PkyDh3xKBCf/s+lmiRYiI/1Wgv6SGZdXMK8VeeQiQLnOSBSDptRGaDtG8Z6bVpPWIooOjNU3NqT
	rncnXihtAf5YVi8xh7wt5Vwig0d6pA8pBiP3mYcfSpBdEAmVtY0OOKPkkVtxId+0zwjlDhJ1Liy
	A4JkkM1axqPqUOw0zckr+asW7Y2U9AP4Im13LkyzxKVZm2roFn4KHRh/5iZuH87JKDVyLhsmrW5
	y9VKge24h37uESICWFHjKV+uFVets7A+Wz5lwoA65hA7ST9c/Dlth//jsqwr08pFFen960wwzkG
	kjDpks
X-Received: by 2002:a05:620a:1911:b0:8bb:a346:8c84 with SMTP id af79cd13be357-8c6a66f553bmr2242660385a.30.1769005715980;
        Wed, 21 Jan 2026 06:28:35 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:a346:8c84 with SMTP id af79cd13be357-8c6a66f553bmr2242656285a.30.1769005715505;
        Wed, 21 Jan 2026 06:28:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/6] phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
Date: Wed, 21 Jan 2026 15:28:22 +0100
Message-Id: <20260121142827.2583-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfX6jUNQD4LzfYq
 T8CxP3GvT++5WyXTaZcX8fHsMOO1uSpLYRywTRHubMGS5y+Y1pe7VgJKwZQ6c+PAo14GJk28OMZ
 L0b37jXrnnLTvEr6ONFBPoq5syv2N0i6EKezBlaRt0anxHHCQsQQ6P/kHQfkGPfrOeTb71sIi74
 5qrtmXQwKW/CgV4JFFF6CAi0lKJrSTcCfztD/N+XdQ2zz0vygBSI0iB/qW8IprizXGGD84xxDoW
 Q2ys6PHfoZX0cKNIcUOAx3VvL6h5b1oUijvH/MTwLW8u2eDyCrkmskAHFPjdes6p8G2CxCaNEN9
 eSomtPYWV/F0Bt2c8xLIDL/a7C2GtrWmoO8IyPOocOxeCfvHnZhM+QvX3OG9dPklDOcUGfDLI0+
 M3x9gO10ROr4VJgd+IfECvEtIie7dLeLZtzBnD1V8g5WSi0VikRSDCYrkbAsr6cKIqDqafqiqSy
 7UuOrlND0aznkYA+wOQ==
X-Proofpoint-GUID: v0hhn_t6Ktz8Nf7WWamWztn_HQQALrjj
X-Authority-Analysis: v=2.4 cv=BPW+bVQG c=1 sm=1 tr=0 ts=6970e296 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: v0hhn_t6Ktz8Nf7WWamWztn_HQQALrjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210122
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90035-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19B9C59877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d02..cea0e9f7413d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4175,15 +4175,15 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = qmp_combo_register_clocks(qmp, usb_np, dp_np);
 	if (ret)
-- 
2.34.1


