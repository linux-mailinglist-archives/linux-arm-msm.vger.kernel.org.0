Return-Path: <linux-arm-msm+bounces-102717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOIGKZ9E2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:42:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE33DB847
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDAEF303A3F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4813E4C73;
	Fri, 10 Apr 2026 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XN7p528s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aubSvuqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C53DEFF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846538; cv=none; b=B5viO/bsQUPSc78hZ1ZAT400U13cl6sDAE/GC1imepn7UQCxWfyvqOLracLSV47lGy2e3vlC2KG4weYG5IDIzug/7+cwE+jc69xTsnioWpRZV3DL7E45uwirfjwS6T/4Z+3tgmsEwzeiy/6pHjCbtkTcYAcVbMlOjU2jwRbURL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846538; c=relaxed/simple;
	bh=ouPi1ZiJUsBaKoIcH7MusrtXJiLks6Kjjc7E4RkpFZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkGhUZDGiqEyT6oBSf9yAyB0nFRnK8tTRBELWvJbWnZbswdIpCUgLPEPjQBdw90LNe5xz+Xea80kAD+c8R33ZWLZWgnMZE+gEAzsX8S5dvNhcIu4pjIhCzaZfiWyvxPC5NBX0RsG1uSm8NJ7zarqM0T8zRBcVtq1UijRrYX3Q/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XN7p528s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aubSvuqJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AH4WE3709104
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScFJTMIhanl
	9g/GPsZpHAkrXeh01kbLAZ6veu6zF/Yc=; b=XN7p528sDlb3ikhx+B330AAhx3N
	Hj0GLwYRYkf8kRZhaA39Rd+zGG1ykQxxzYd7JUJUVUqlib/npjcylr6xHoePE40x
	xxNGTFDuf/jsg3ar+ngHNe5vUHYstnvDBgKDW2H9Te/Np2emZlY1Xj4xwH8ByKK4
	bgBVIOfybpIfFSUscthOka1UnggB/NuhLHuQhzQU2o/xitW3tfphIgnGoLKzYeK9
	Cxfjl80KjbuS5b4rJaQYLQPgKcJM0iXPpjcHztZoIkHJ1wakaK+UWCiSRn3SV0qS
	wlzLLBZL7UBMEsudQ2ATRfj1P5gAI0nkqory3DVYg/C2VnXZWHCwsaMOS9A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj2jhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078ff0so1096016b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846536; x=1776451336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScFJTMIhanl9g/GPsZpHAkrXeh01kbLAZ6veu6zF/Yc=;
        b=aubSvuqJQSfyQvo51dohHWoY4w8QsrOm/+K+yCGWVv3wAZpDSlcks85jnjlrK1e2Vv
         rgtlX0vwK6/zqACJpjYYGIN+3kFhdZg4fAasKNzSZWSpujjuTcYggBO8rFArhsTmCZy/
         qMJUb+UqFGBjtQg2mTu7My2ogpq/xxYz6bVGxKa3tQhS4IqK0ywHoFcHI674Avrx1B3I
         McxdDi3GSwbQYFSfTKs1O8JYdiMBkDn1lB5/SJDGn0WLS0iQ5h3eGIQ+huJ/Nn8QCVwq
         FGb6wp0a3uMFh2xj2bUk/fXO+geXX7xkLIIgCJoUyfJFa3HZiyZ4sqprsjiuKPFKGCFP
         Hzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846536; x=1776451336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScFJTMIhanl9g/GPsZpHAkrXeh01kbLAZ6veu6zF/Yc=;
        b=G+yzity/6MoJ2pSxTKKCTH41h+naTmaY8ojoLx7qn7mY2+Vc3AvXiXO50YkqhW83mb
         /Yg54/eBKyd7bnmibyg93N6KOYgOJ2cz7vAorc8TlVbJ0KN5jS9oN/qbqCu8c9kRkpG1
         vLBqTVUjfdZECuzonOTnfXQKzaMmo6sGuOB/diR799reMgqTeeRGXu+ZMA1H3Ah/mXPG
         4YtEe+aBet51IYIRRNfU/CmYOSg0cHAPiutM29D6DhFwtojBsWvyWTsTqmVs6wHfbrCg
         VX9PhObzrbPs8giNUHQM1DEwdw3ib0YtxKjT/lUN6Y4hhtt7rdQ4CvNK0q4S8mEg1m6a
         Et0A==
X-Forwarded-Encrypted: i=1; AJvYcCWq2DvhsnVJAG24Fqc9HEuVI9QDkpPxxTRU+cx5SbMfEBD14s05VLvosiPEv6WFAJoNzuta9ht91OQcl+Y7@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrW7qmVSsBy5ilZF1/9cThYVpXugGplzHwUPlmrzvlpocgM1t
	lTQQ7QYmOP4yj11PtyxOvNHu7uCFFotBgaa2SRZCXHzDe7CHbpCpCiYf/pKqblW4WQhqdHbxm40
	wjVSNYzI6Qk0R74qGLvTnX89CbNMjHxRN50SdLCIficTH6L1VsC6d4vT1y2WICar6c1BZXXiReZ
	xG
X-Gm-Gg: AeBDieuRDqFGOPQ4WG8EP/dYjrimMFTQKL1omeJzR8jbVj1y26jWnqxteKJAYxL8Lph
	wp68zI+6TUJYXW/2J8kH/C4Tr94P6cW8t8JbiJdbhXemoBYoeB9/RD6klAkJ2i+qCN5c/uzoznD
	ibSLr3eBgRkYylOlpR9I5XUy5EyzaWWAQ4YZodas42OXprhMduWOlqZoOH2hTicaq9ETgNZOW11
	TyLjKBdJfXKkpAJEH9U5q/rVlRKSP6FqRxBZiETs3G+e5D8nkNQRIP5+Udo6mCcwVSugT0H3AT+
	IT0eRgMOnAkMQNULjY1AmRgloF7IO4Z/HAzgybUmKNA62R7YcavXwtpV4b5H7ABqAehN68nP06+
	u9CjmAXjZTH/FycbfOkjyahHxpsfusk3074xt+tqOP2WpBa63
X-Received: by 2002:a05:6a00:39a8:b0:82c:ed02:a242 with SMTP id d2e1a72fcca58-82f0c404ec2mr4565633b3a.52.1775846535647;
        Fri, 10 Apr 2026 11:42:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a8:b0:82c:ed02:a242 with SMTP id d2e1a72fcca58-82f0c404ec2mr4565574b3a.52.1775846534859;
        Fri, 10 Apr 2026 11:42:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 03/35] irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
Date: Sat, 11 Apr 2026 00:10:40 +0530
Message-ID: <20260410184124.1068210-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RW3zRnwRIoHb2waWao0BKmQtVcXlFNwO
X-Proofpoint-GUID: RW3zRnwRIoHb2waWao0BKmQtVcXlFNwO
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d94488 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tOrHYADZn3q5Ogi6NzYA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXysJDxJ443Dii
 YjedGxks3fqTlpsNG+HBKPU/XgogjgKxs6J1uHQdKN2NBKt5vmtN+HKmhIpuUL50D+uUi5pcEcB
 sfrF45lZWC92tm/mH1ZfSEcoddzOyktBARvQ2SV2tDM6UbM3eWZGkXX17CjVy5C8k3OPX1yUkSV
 xe6arYv5x0hquYa3WhmIW9xvTphoOY2XF677g5hiRIRWFY3nJMJDuynxxCFDTe1v3tgLTw/wI74
 JaqvN8VWdIknVgUI8x9BuOoSLD2jL7zNPP+O+IwuiA/bQN7y5aKauc715qyOkZiqe43lRxn4ADh
 PVSrIpbohwk5oWJxbZNZjwsPjB/+khiCm9ihnmK3HS3dyOb8LQno0HLTjRI6GBmmGTZe6wY4oqH
 WKqfRS2Dva3xgsuAgwn7bSGsiditdiBR6E1zBF5Meo3bm49pmY3erDnQZQJPRfNgXcsezBF7AWy
 YxNuqbMldk5DmaqyqTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102717-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55AE33DB847
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QCOM_PDC_SIZE constant (0x30000) was introduced to work around old
sm8150 DTs that described a too-small PDC register region, causing the
driver to silently expand the ioremap to cover three DRV regions. Now
that the preceding DT fixes have corrected all platforms to describe only
the APSS DRV region (0x10000), the oversized clamp is no longer needed.

Replace QCOM_PDC_SIZE with PDC_DRV_SIZE (0x10000) in the clamp so the
minimum mapped size matches a single DRV region. The clamp and warning
are intentionally kept to preserve backward compatibility with any old
DTs that may still describe a smaller region.

While at it, rename PDC_DRV_OFFSET to PDC_DRV_SIZE since the constant
represents the size of a DRV region and is used as both the ioremap
minimum size and the offset to the previous DRV region.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index a72e32896e64..21e2b4b884ee 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,7 +21,7 @@
 #include <linux/types.h>
 
 #define PDC_MAX_GPIO_IRQS	256
-#define PDC_DRV_OFFSET		0x10000
+#define PDC_DRV_SIZE		0x10000
 
 /* Valid only on HW version < 3.2 */
 #define IRQ_ENABLE_BANK		0x10
@@ -358,7 +358,6 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 	return 0;
 }
 
-#define QCOM_PDC_SIZE 0x30000
 
 static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
 {
@@ -372,7 +371,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (of_address_to_resource(node, 0, &res))
 		return -EINVAL;
 
-	res_size = max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
+	res_size = max_t(resource_size_t, resource_size(&res), PDC_DRV_SIZE);
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
@@ -385,7 +384,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	 * region with the expected offset to preserve support for old DTs.
 	 */
 	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
-		pdc_prev_base = ioremap(res.start - PDC_DRV_OFFSET, IRQ_ENABLE_BANK_MAX);
+		pdc_prev_base = ioremap(res.start - PDC_DRV_SIZE, IRQ_ENABLE_BANK_MAX);
 		if (!pdc_prev_base) {
 			pr_err("%pOF: unable to map previous PDC DRV region\n", node);
 			return -ENXIO;
-- 
2.53.0


