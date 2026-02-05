Return-Path: <linux-arm-msm+bounces-91945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBe4BtfAhGnG4wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D13F5000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 17:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B328030547CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 16:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9138442EEDB;
	Thu,  5 Feb 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHYZetbX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYS4+vlx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC71428841
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307386; cv=none; b=mzYexBsyj9SrgSzwJz8IK1pc15oldyyynC6ST7Q7v9q9Fq+LtLfdSYy685gvqXaznEGeUHdPrWfIknbez1tgEHVnkatBWq3b1R/5pyHulIoGW7Js+iEe03wpV0kn3BcqW/fH5EgwExj9LT/czz79RF0qIfObm6qx2MalB/SWql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307386; c=relaxed/simple;
	bh=BB5nppALfa5ONhsJzeT1mYsjxvlbVd24aqDk+yVPVaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RCU/iYckQTBgd1AWe7G/h/LK2XMeemliAckW/IVsCOVsC+EIS1jaw107vKSKQ/yeA33hACBQwvv/6eRdU/Jxbr9m+0w98yc+uMu7AKZdihf+I2mZu2Fv8ELNBqMMrhClsC/gneTcSwCbvGikVQHFgIzb1IKwC7UX5inoYVbcvnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHYZetbX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYS4+vlx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BjiH54125673
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 16:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CxaQpH5pk0V
	/At1CTX8+G8U6Yi1ecHRuD74lqofbC5E=; b=hHYZetbXiuMusNQDdJKlAve5Mv5
	gxMQJhYuAhKqiqZIxwBCyKgNXjiGji6EYaMYR/7ym2ikgwCrQBJglRI+5BAkEuOt
	TOl0B/3HKciynLT8uMq9DiJMofKWpMv913Zo+SMExaK9FqQKwV+4/nYc6zRqjXkf
	mebo7AR6tyPtEhdTzkil9wTeCWcZgamXeoEcME9v4KGwyysoHYjc+VWi1hkcuVIc
	iYzKsZNofr+Hvuo5UekC5aUdVzkWrppTAoIeO1Llzlki8TtUinLBQQrR23HXq3M2
	PIgpP4RH3nHkDS6zVfHeaKgRlCIe8wHnWAnja9e9TSEC3rI+kfh4gNRFOCA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8rsy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 16:03:05 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-66b24a54973so2715472eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307384; x=1770912184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxaQpH5pk0V/At1CTX8+G8U6Yi1ecHRuD74lqofbC5E=;
        b=OYS4+vlxTor+CNFRcycwAwCOVH0ZQk+BCtJECKMt67ltCD3NglpqSy8dLdDdsNSO41
         64wXNBKoH0Btve5Y1dCSXqcagu88xLji9i1pnidhS6BuXR9li9nnX6Vb9tdfTn/EsUM5
         eF/OSGTjV7ni8jxGiWQ9qjMlNLG4cnTtKw2alzEUrFkkOJ/LuA7G51alV+AGsFUK3kQ6
         AbcWy5A82Piw1rREoYMm3FZwsjVkjbVKd4UnqsdTYa+eNTmO3lCZ6drqC9oIMJr4pn9t
         nq+dj4rNZJqahR6fNAnDH4pBe2XfqxvMvNbnlRPPPZFOy+B9SaprSCMOSbd7AjlFjOr3
         nKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307384; x=1770912184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CxaQpH5pk0V/At1CTX8+G8U6Yi1ecHRuD74lqofbC5E=;
        b=Si3PHUAllX8i8NosCqFCoRuu7I+/7lvG8qbhGWh9rBG1iWFYwqhwpP4/fofb1yv5mP
         PIDRsLLH23kmGYmhb30H8Fbm7uvvyon4EJQFR2hHwKrDd7lmlLT+kPfDTKM2zRALQ2K8
         qLNyTVNUTZiSzGGR2lozZTdLzL/WJAbEB8uhztCdfDhi+0upu7RtiBzptlz2OHt1U41l
         1rAE2S8HV+pIX8dQqBdjggoSepqsDqwabOe09njdFVpgDL0DOgGql+HkXnf+Br3UF0By
         oOH12iI3EHtxofErIrD+tZpzIurdeGKThNVW3etmqmB69xq5vr2eO4bY/6Ihlf4jfJSz
         WIkA==
X-Gm-Message-State: AOJu0YyB1v0uv4YDEbzqKvOTnMZCBhuvpuf06L5I8UQvlGGhth1e3RG7
	Ic1UOLVbZexINzeCHvugwesBArhDnVzCU4068nt0/+uaiAFR5Ka7JXfVe4Wdg59ker28WaGas3O
	Mkk9J779Zu7JJfASfRi0FzONrb8pjZ/geGzz3Z5gJkNgxj3XZIv77hNKVC5cVAK2m7nBt
X-Gm-Gg: AZuq6aJ3tLDvCHwsAl+BEQvHEqv2VkKs3MCbGCegWZR37nMQm1AhC5uM9qeM26IojdQ
	nKlWutkOOm9I/2rWj4nDjyg9jwAy0Fj/EpM+HzYxEnaBpLMrj6T31eGVvEE3hXT1fRlhA6/czQa
	RAyXlLV5Uvd00d+KaoerJoU7zKeE1Qk4RpWRwm9gVjsx7qjDZB3gVzO4nl2QFLewOuw1CBsf/W1
	chJ0Z6KGF6NLRSnCcx/KmAJIwlAA8I806EcNE5YimdEP3XFSM34xti2fC/T5fob90UmilJ2CaeD
	nojRRZ1Qdwtzv3oo7rW+6Vi8QD7lYtEuhJa7X0tRpk6mIXxGAarDDib+i1m1sC/nLtCQM/x48qk
	/wBzWBpAYtJ0A4ewXPc5ay/QqiEnb1kM2il5y4N3KIL1jrzlmE6XvTZH7ROQnMFS0sn6MKZUOOW
	DC
X-Received: by 2002:a05:6820:4dfa:b0:65d:62d:b6be with SMTP id 006d021491bc7-66a201b13ffmr2967483eaf.7.1770307379864;
        Thu, 05 Feb 2026 08:02:59 -0800 (PST)
X-Received: by 2002:a05:6820:4dfa:b0:65d:62d:b6be with SMTP id 006d021491bc7-66a201b13ffmr2967465eaf.7.1770307379377;
        Thu, 05 Feb 2026 08:02:59 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:103a:9c65:ad2d:82fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm13770002f8f.40.2026.02.05.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 08:02:58 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 4/5] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at boot
Date: Thu,  5 Feb 2026 17:02:39 +0100
Message-Id: <20260205160240.748371-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984bf39 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfX4idthkXLusnm
 eOoVGKVCf9+2GlrIIa6IX/TsVfh8hafLzkdz+oDKBNSPVX9Jn+vAOe46Mj//JW69BsCMQoRZhnC
 Lwa0YsQaoOxQZkoRH4Zyo3LDvll3jOMjs93JVMPtc2oBrsZZmbN7R5fyWUJQvT5Nm/+7qm3Ge1x
 2dAj+UYUi/MbhafB9M6ghSt3q1gg127v2wPNOtCfsSnr436uARN0jbBwc6lV+27JQC4c2VEozgb
 GS2FWVbYHK7eeh9T8TcxoAHdqkz9pHXT1LSA2TYoXRskxeP3ViUTTUS33raGuHH6P5npy1Xdsm6
 WBZ3FwnMJtTKD0MDRR1lQhKHpAFgkw2JMNDOuJqT1kqkX973/4wuD9nrPwv/nvmiLghbn6sz7rW
 5phlmRYUsjj4QdXMNVA+wbRtIjBkWXs48Wry4F37s4HOlwfN8HyzyEt3NJl3xCUT44yOHEZPlZ1
 S/9Hd3XmyU3wy1XqaFA==
X-Proofpoint-ORIG-GUID: HcOXk8tQAyxlsovHkS4gt0aq65II40aQ
X-Proofpoint-GUID: HcOXk8tQAyxlsovHkS4gt0aq65II40aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91945-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77D13F5000
X-Rspamd-Action: no action

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 258e0e966a02..73439d223f1d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -1284,15 +1284,15 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
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
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-- 
2.34.1


