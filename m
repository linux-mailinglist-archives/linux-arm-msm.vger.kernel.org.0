Return-Path: <linux-arm-msm+bounces-109982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MdINAjBFmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB75E250B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B5AC300BCA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6F73EBF2F;
	Wed, 27 May 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3SzGCGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfuL1egL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9B374E63
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875679; cv=none; b=JK7x7dfl83ICTuQNLtPHWPzqGiNukxS1LxnplqOwOfrZxvQlXK5SjvvXFJ293SXjN/erfwpV6U3a6I4YVJiu2oZAuzUje1JXH2XOaPvuNMgloOC+RE5Dbk8BSoFLBRXppSiudz29KpR4VRbDWfL8B5hxdu3Ik+uRlg7d/aqsfxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875679; c=relaxed/simple;
	bh=mShQwabQxaZp3idjZ9qH8QOkK78f96MHaHF57YGQRlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9IjBnHUgNf3hD20OvP8dgOBLf2qlz4+TKG5FORgHHqzDQifSP9OhftoPaFcrYe9HpfBpYP3bCKbxnJo2uwZJcOLKlFq5FnmbFlinGLUhUeu7JdXY+50p6T/1bQYs2TDFwhogfKSxvInu62p/iEcnso4Dh2necR8qm4pv2zt+HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3SzGCGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfuL1egL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8meBQ2152942
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=apwYLrYTuac
	I1nhRg64q6TDsz1KsgGXVT58v+eTvBlM=; b=c3SzGCGMSo+whHk35dHzP02uQR+
	T5bafiGztbOPcy+mc/ESREB4R6Zu5940dixYYEnztTpuGGcK52u+4aR47WPnFpD9
	ZVGvTbeUzi/Y4gyYjcKhg9rpbPcpeJ8XL/7h7Dib7auU0RMnGoW5XnV22WZK3m0z
	7FFNThpod5yd6E9NRNmHeCQTR/y8FXKutCDh0VK31q4ODu8glhe5gkS/+gNBvJ+j
	Mnaz8cjALQ8ucUrCFHacMCOQI5QUGD44R+yGh/wZlTz5rYjL8ZlHgvu1rkWh8zdC
	fSFc7EOsChYCZjuxo598emfF5tOO9NDLDPyltzySV4S4N6wRXYTUdCy4E1g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgun0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8510f91ce8so3748380a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875677; x=1780480477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apwYLrYTuacI1nhRg64q6TDsz1KsgGXVT58v+eTvBlM=;
        b=JfuL1egL4E0/vgtU3BFCHTi566rNABgihsdsrQrWfWasXIM43FkAxdt9sgaVC3XCpF
         ZpVdffCQRJpRQ6o+7CMCq0jE9gNOuArjWZrLcAMEfKueCuTBOVqQ9oBvaQJHUKYIUcqz
         WhMieR1h2az8DMUmFZJAYZML9aYweiqqCN2dCx/yjvMrcXzMnGJzZMJyg7kQxxJHm+lh
         CSLWgu9OtOJP6N6cAgJo6Lyag/JjYv5w8Zvfk2QThGAdLt4aK/xxWChkMHID191zMfSS
         6gzjWrnpJY+Le/xTTBzOAHrRE5Uj+0TQ+E0IMgXQcAMnWu/aGT9Syisko16yoVdWIVqV
         p/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875677; x=1780480477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=apwYLrYTuacI1nhRg64q6TDsz1KsgGXVT58v+eTvBlM=;
        b=dBa2FXB+C1y2BGVWg9lOX0zUGLv7maL0AvNFIZZNdLvHBHuWgEu5Y21Z+qPdcrTxTK
         WLr/eJg+pXHdveM0ReyrOs1HNm7Rxxdo5ns1Jayx5ggbYV853CsZdJLecx/qN4yznarL
         chVPscTSZ4WeQ2DjGVVBPmXYTZ7/ki5JbBDWa+TLT0b8MDD9KaoSqhPHWgD880NfDm+M
         hwD3YTEkPftFEL28guYwk5oZpFGEVEOTsgFXzUn1l6UXcqZnC7KFziskpWfQ3CuqxSZJ
         j0vefewBXg0Nf89twcBapgbrF0q3Ty6X2PgpD/I36FR2gBlHLKGLgkw2orFB11ltcNsC
         qGRQ==
X-Gm-Message-State: AOJu0YzC9Yu38vp3wvGINgavk6c+42dvSxjpo4kOe7AJ7+4VAtZC3Tss
	QNr8rAnYxHO2SgWX4pyijOOBKlw1Nvkp3kLx6ACoVMd/wF8nH2PpFL64jokWQBDfP3Jv+3yrFOZ
	xhk9XxZFIfVQ7uLbCtEmW7i7LCi+rlTQF9mBONp6EQ0U6FEzImAAc2710Uhgp/VInky/6
X-Gm-Gg: Acq92OFYu0FTdeyP4fuTC0FknO6IDKo4aJKvZlCINNzAJ4DG5p7pko8rhY12a60XVAr
	85GzS/AySEtp/l1NhUIuGwEArprEZRSNAzpHWotVA4bSTzsSz/YHsRRgxtsmgzZS4CGhPSQRVp7
	YgR+BCEEv4h0cQb2HBs9iOkjOe6nexNJWxXotxS0pdkwG54Gx8dnXCcfl2xWbvZM3ejUROVH9XC
	C6w0Fhcg92KqbI5ihVpFHrSUYxUG9aGqsdK2DzTO9yEyKngjQ0F4Yd3VUX/pyvNF76X9QS/ihlP
	aPvdB8RiTu8hmhSe7RMdlkuKm/CTTwOrwm5qJqSWUhlFWMtsihqz4REZOq9xBP3aza4DfiFZ6bz
	5sMwj4o3YuirCb8lSMyaowIOboKAfYutEWfO+GKF9dVf5puLMWXCDy87yqqQ=
X-Received: by 2002:a05:6a00:430d:b0:838:af72:fb1f with SMTP id d2e1a72fcca58-8415f0e43d6mr21472654b3a.2.1779875677042;
        Wed, 27 May 2026 02:54:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:430d:b0:838:af72:fb1f with SMTP id d2e1a72fcca58-8415f0e43d6mr21472623b3a.2.1779875676342;
        Wed, 27 May 2026 02:54:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm1809325b3a.45.2026.05.27.02.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:54:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/4] irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
Date: Wed, 27 May 2026 15:24:24 +0530
Message-ID: <20260527095426.2324504-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16bf5d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tOrHYADZn3q5Ogi6NzYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfXzCIujaA5+uBx
 vrTRSE0xFfFJITV9VTH3YO1Hy3vF6s1ZVXQkJ4rJNycbm8cND7iNMddTLOAs7tnkPPJaGpoiCJR
 A9/jyKuBG3oAFfNhlS/YjqbSJBFtvwS6wjFDrMVWXy7QrlU5SygLp2NdHKoa9czrMQByT2M8t2H
 Wl8+Yjf71dmD+yYWGxYej6LQ2gV8Erd2Xa7LIhbgSStvU0hvlYQ7+NbIsQ4LA0Jg6NeNJC+HIki
 fYOoWNL0Rwef5yom9lw0LmNwgyFJw13Bexfx78tx/pvetvk0kfKMQb/Ss+n1KzsTeXuOqTHus+C
 erQz7d9Ul91EF/eQ2P+P6P9Mc/5jtTkfMoHQS6q/0nQ1fnZ26mQjnME2acM6xldJXtrWYD2urUE
 2dogpRX8eM6+qtG+QxVGJyhApKv+H8pwDu/j30fOO+TBVU74aBL1bxNOn5Y1l/guHmOHqTo4h94
 rtTwG8cZrED39QIub/Q==
X-Proofpoint-GUID: 0Y0rYa_nsm86fZJxSdSXIoOuRD70KcQv
X-Proofpoint-ORIG-GUID: 0Y0rYa_nsm86fZJxSdSXIoOuRD70KcQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270095
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109982-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FDB75E250B
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


