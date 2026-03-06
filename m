Return-Path: <linux-arm-msm+bounces-95828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PfOE5nfqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:07:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E49AB2224CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42CF6315D126
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFC03ACEF4;
	Fri,  6 Mar 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q99Z9MZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8iWiT7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B383AA1B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805759; cv=none; b=FQF2UrZ1Em8pzkNTNtBrf9+qAJLWALOrGZZh0kW+mVcEuXBtf2G34Bhy0jirWBn7xwAWziUy6rqDZIWxgf5Bgz1nDuXj7vGyM5QoznSMENLnnfNFMiybqCJ6D9IcBd9lz6LKGR8Ay4k+unwFuX6hXOwcOSoVAMZHPy0arbVB+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805759; c=relaxed/simple;
	bh=W3J4GAuE0OkEsIunjDyfXoFWhok1q9IhNxf2/tvxZtg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BbE1WImPIrw5+MrMSxQR0moe7cPlmXRXeMm6/jAN4RMYfb32apP+YZ+TZiTZY0LpecjAzt6bBCfgGNYt8zjq07gS9vUNGfyIthwLyiARFZ65JJZ3NR7vCpzBZzMkkVBLCHP6/NHXEk7e2tGOibwR25sxE1h/aV2VagS5UArxX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q99Z9MZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8iWiT7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BauSe864940
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ULJiANy9VcQ
	jrg2p+x3E7lkWPOkdPhmEtKnNZwzpphA=; b=Q99Z9MZYzTbwPgx1J8BQ2n/JIAC
	EFawpSRUbyyVVRqep7QHdz4PL4b3/+1+3RCJL58t595+TV7wrhYm3DU45xasxBz3
	gWL+lPf8kpxo9prR+16C3kQ0qZW7a5GTS9uw402GNFjdvaydjTzLyFc52REnKD8P
	aKkza9VlBMZGHa0VXdbwKv7u5LBD+JHrQXc9rQPdJhS1dZSODBZ6Gvf4UJFCxSlZ
	fAcjCKfXdR6AMaaTEvISxRmFLY2gumgicUwRlgkod1odiu3CAnSGDp7v3jCKubQU
	prOn/KTiJ4BC1GNwJtWVxXtwn4AP0zMYihTG/Fy1bMaq33tD7k4ljeW7wuA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5snpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:02:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffa0b00da1so3216080137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805754; x=1773410554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULJiANy9VcQjrg2p+x3E7lkWPOkdPhmEtKnNZwzpphA=;
        b=Z8iWiT7uQDX9GYZkLr/nFeffR2/0ISvXV9hXaPNuD/a9wphL1bBjRB6LvLAxEltzBl
         HNqN4ArwV0iyZGtFMLGJOqar7qoJxhjh6uoZktA9Dwfc8SO8KL9yQWOm5DZFOxq839Vt
         hx2QMbSosHqq8zSWrYIgkwwZgaPpzYN7o5ZSPpf8vWQZEpP8rvZRsQH2dB7i7CBCLJoY
         6LTJOeOqTYjfAKm4nNZxe7TWT2BYp7wCrLMzQaZ/3FXqJBDzCsrwVqbW9qEob+eG5Rsf
         2ZzcsEeVnLHyXejD4Bo0NHZOYMRej37J9H5KPavg5BEHM1fIrykX/jWdniFrFwHjlF68
         sHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805754; x=1773410554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULJiANy9VcQjrg2p+x3E7lkWPOkdPhmEtKnNZwzpphA=;
        b=Z/oBn19bkkMjmo4Sb1b6solytoyMi++itW0c9rwHFNYn5LEVF7U9TYIgQeEaeIu/Th
         JO4O6jvMegafm2rIszIFO7+7MIjSclB4ZoZ4V0rqnC2pTJ/LmnNei3EaHbPIByKSSdtw
         v8Dq1WDtIaWV3PrQJzngOQ+MqSVVFaDMOpj3EL0YdVXOaCdAIQ2HDgkgl/4Ncdzc0RGf
         52xFRMZP/aaqiYmiLUh4+q90UAsaZUlsmIBNvAaPE5k5jC6TOeSIQo4BjZFLGaGNuEG0
         BJOC+VMSMvK3go5MzWqLr94RPW11vT2JsyLs7AYkhocVgn1T5Wc1fvkBRRs6mIek5wa3
         2hbA==
X-Forwarded-Encrypted: i=1; AJvYcCUYw7/+Y6XkGZ63FvKdBkyPweLbZj9v8P6hYTieJtsfysfKLWzF51D3rLvhOb80NiISJdBT2wobzSvSwDv0@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGq2fDgSR9YuGG97niBVbAsGjLMmRTjjQAQsYxAO56y76aIRR
	ABebv411RPN7ngKpBk7x2wZ9oaZknxL8vW8FwvgxHxJlGPuErXDZx4vi+oqckoE7R9z6SznEqoy
	J3/qKPkxJeV34YAuAHq0mDhpEFXjrSNavVuXyC7jkruzcwXqoaj+cJRc1GPE8J+hF6BXZ
X-Gm-Gg: ATEYQzyodCj0tS9/X14haMwoUYPf2hS10uesXj1RIk2SES6lgNzGzpxAn78vZJmfi78
	YkmEOK5buzka9oClcHVqaYk8e94LcE+ud4jVA67W8IU7XfGPDYrGGMSczF9/FWLpkvdak3ET+i5
	lDoPxhiflhlEDVfsbpKcSjVQkSYNvL7N3xgErRgwAgVdzs8yaPFYK7Q/0w1/EE8PnHz68Vgkbnk
	GR334DYxD3wm8BxcrxKNpXa0RxZFJjkCZEbe8QaqANUEplloEtFEH1S5a7HDEpzTiChRtjpc68d
	+iWo8bvEheG0LaQTBHQWfnkjclJCMysW5WcfOuhGICXwJutq/rjMPbToDgCJfAomR1b+B4MvIVV
	mUPes1fDlWWonSmhloJlTnDqwQ1HReGs4vFe7JV2md/OQch9hZa0vSySQrUQ3ZJ7yw/f2zkLQ14
	vFXZQJOZ1aKxuLWSyRtBV6pZsIU9OYcr+xxpwXSHVEsA==
X-Received: by 2002:a05:6102:26d5:b0:5ff:be25:8934 with SMTP id ada2fe7eead31-5ffe5ef4af2mr636951137.8.1772805749403;
        Fri, 06 Mar 2026 06:02:29 -0800 (PST)
X-Received: by 2002:a05:6102:26d5:b0:5ff:be25:8934 with SMTP id ada2fe7eead31-5ffe5ef4af2mr636878137.8.1772805748603;
        Fri, 06 Mar 2026 06:02:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Fri,  6 Mar 2026 15:02:16 +0100
Message-Id: <20260306140220.1512341-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: paczUxjd0WFmG9SC9QgN5i_z2avL0DmY
X-Proofpoint-GUID: paczUxjd0WFmG9SC9QgN5i_z2avL0DmY
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aade7b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LKvSMrVZLPp8S4whDCgA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfXznSsH4Iu61+k
 8qpWKYM3P5ZE/9zcx38hm/WjvIJLlyh+uySUXTjp3jvw1CZCYE/UkbHap05aaVz42pT7KpzlbZD
 n/VDlnE+WA8nT+7X+W2ZmJWnw9xZePECNZpDMhOVHYlHAlI8pS6TMMASTGaTA1DkI/6rvFgn7VE
 SVP2fbVVcAfIsNYTnwkFoHasenKa/eXfUTSXg7HTjAad/E3vB88ItJ5Px7Xvyiml1xEi9cvZ6bR
 N3dAz09GVb5wTSH7+Ey6X+WUCbUrVmDZVy5oPC7CPValhHD8otOVblLhgRJX4sUfHv9YRq95z83
 sCmb68EqebWTu+DE5fXI7gwDq8ylOyKHOwVI72GSkgONG83LMpDaXbSyOAVXfcaLnQMUj1LrVsN
 TGHxM0c2ETne0w9WI8uUkk5klcG1vdwQCPHpd0YNJUc6y8dNj6wVf+wJad8kSDj5DLlWQFiTk/8
 LbK++ehMxaDchCUChGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: E49AB2224CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The former RDI-specific register definitions (CSID_RDI_CFG0/CTRL) are
renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
interface agnostic. This refactoring provides the foundation for
extending csid-340 with missing PIX interface/path support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34..adcbe3e01d62 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -41,19 +41,20 @@
 #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
 #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
 
-#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
-#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
-#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
-#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
-#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
-#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
-#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
-#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
-#define		CSID_RDI_CFG0_ENABLE			BIT(31)
-
-#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
-#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
-#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
+#define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
+#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
+#define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
+#define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
+#define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
+#define		CSID_CFG0_VC_MASK			GENMASK(23, 22)
+#define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
+#define		CSID_CFG0_ENABLE			BIT(31)
+
+#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
+#define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
+#define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
@@ -71,7 +72,7 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
 
 static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
 {
-	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
+	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
@@ -88,7 +89,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 * the four least significant bits of the five bit VC
 	 * bitfield to generate an internal CID value.
 	 *
-	 * CSID_RDI_CFG0(vc)
+	 * CSID_CFG0(vc)
 	 * DT_ID : 28:27
 	 * VC    : 26:22
 	 * DT    : 21:16
@@ -97,18 +98,18 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	dt_id = vc & 0x03;
 
-	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
-	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
-	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
-	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
+	val = CSID_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
+	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
 
 	if (enable)
-		val |= CSID_RDI_CFG0_ENABLE;
+		val |= CSID_CFG0_ENABLE;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type, vc);
 
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_CFG0(vc));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
-- 
2.34.1


