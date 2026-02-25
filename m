Return-Path: <linux-arm-msm+bounces-94140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H62CfAOn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:02:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E2199234
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35805302606B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14793D4132;
	Wed, 25 Feb 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3CkoNQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnUeHBs/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29113D4127
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031707; cv=none; b=SM6E1uoDU6D8XAzNj9TaNrRLNU4WO9vgQFD5xueVJXPaCS21ykgMZIn9VJ0Vbb6OW00xzgfdWQ9B7WV6Nufk5vwYHGKc0ShyJbMWYixKPd3uYfeEqCnXq85Bk5tqN6wEgUeLC6qreisBTOxWV/ZjbNPdntinHGzyxHLJ9kKQTDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031707; c=relaxed/simple;
	bh=8oH0CcBNelrfyBEPdCxx6Y2fsNcINvPXmz6A6NuDkyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bkh1TKbEgYFtwSzzFtn6VFCSCqZfWoKzblFMhWIpeB79RtOHRJg27Th7MRPIuebn8VIuYViKhkpRzcKUJMveWnzo6IUYfYWYS2gr3Ekdkcf6iNJnWtinA4COBI4CZI5uBG60exCL/6vrDadZuARPnDuV3JhKespDVaevCwAkOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3CkoNQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnUeHBs/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SJZw1024949
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aw8wohLQMgUcRaUVmeeymttr5jvM6r3f8He9jLfhmSg=; b=T3CkoNQNC1Sj60zm
	RdiZSWZikj63JsA5hnFzF6dGRbVtI4uXLp1QdvGaKNN5Qg/pAoVQR2tquwLQh5hI
	aR5zVZ39ZNgyD+Bt7nvsisEsnl+FCrQ/iyz5Wk/y6WkGLo+82obKihYC44+aR1ma
	m5QDGfj8VZIadobmQaFya1sVl3x526oIiZ+nXtxBFVhjx7i7LiOzVRJMW3iQ5nTa
	dOogVm0eJNuVqpoX1UKn5YG2iMLkK5tWUYgTEoblcrRhsZ7IIRdF5uC14WMTexQS
	Zdmy4k9VhWi0nsc/tRe8VIvwZ3VX6he/hBzwfpYI34kr4XV2NuNtAxl+FYvRcB6n
	3KIk8A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57t5yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:45 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679c69b46c6so22970778eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031705; x=1772636505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw8wohLQMgUcRaUVmeeymttr5jvM6r3f8He9jLfhmSg=;
        b=SnUeHBs/M0f5YtuVpRMnfbSpxrLZHiglD+u1Ow+sQNyqdWbpwHFoES4lPARfUhibVm
         EhzOZ3yJvQ1t4LVmHIi6TMRUt7WvbSreL1Teul0yUVAm7O9NJP8jxn3DbAkRvdul7Inw
         u14st75o3r4bI5ClXD5J3NDZervZiKhjKRVWhZ3EtvaHDxddYSf/31r7qAidkyIZRV4c
         dqZC8k9+E8oe/z3sLDFhZ4mIADs0iFYubruwfOSWEnAKjTocLfZHx7rjkk2HMwDZc73F
         GWrN1N8FthlR7szG7fFlvQr2pTBNB8Mv788ELVVmD667W8f630ht3ElGjfJX0s635LqM
         wt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031705; x=1772636505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw8wohLQMgUcRaUVmeeymttr5jvM6r3f8He9jLfhmSg=;
        b=GCO/RTzA3AMMGWktlsgpkoc/FVGYShvaJCOtBxUgQZIN+jB5127U+bXpPTEp0j7qQD
         C85cL79zXf1TsTbGxhSV1B78KL1ApEov32QNVlAS68vUllX/LwniK84B+lnECxnfqivj
         Rj2ehTqqZenVCnbG4r/YCxsHXsIPWhw1K04+4O79sn/B5tG0qfPFnZtue1p0fJFQ8ReS
         qQ9TAHg9IAfgT3RIhqeLonWq5JmE9pmpB3VTKkQVRjWWj5SGpAPVmhqKTTRcKJMaruzf
         8Ads5jLYKhMa6jffuRBrkqJhafnmv6aHVAG+l50asdyal+ZrtkkhpANl+nVDvJK1bzNg
         0DBA==
X-Forwarded-Encrypted: i=1; AJvYcCUUL/HVsnRcTPQc6+XvectD/upuskiP4znikKl2oOUyrfxgRqie65mwI+2KGxckgYZSNnIwesf+LRobm2Im@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLU+0Av2c2BjjIeSHWLUAqb5Xk6QPWCE5cBGEuWzIGw4dMwY6
	VkHiuB3nh9/WUDsrvVMr840lzW+emNouya/oPWlt63BA5TPHpgojmD/2WeMvfN7IiBDgYnYzIoQ
	MaVwu1BOVCkB1jwdbC9bfiLz6U1NfwxuOZaiyVDpmIzixlYAETPwHfxurRS4qV6Rdsdm7
X-Gm-Gg: ATEYQzxz+rCQsISvRFtsUv9IejZMfagu16qa/K1u0Tl6O2W92qjTyT3eFU/11zKiUPv
	splxdKOLyZPjg8cKwDzUlnyb2qadMJL+TFsMz9NkHSD1tBUSxOhSNnAyip14VaPJxL32ppZEvPw
	6eDIrLH9eygd4aefkvTUp9KJpvBtQVKNhFbCUzO0d27FJnAIVDCGrItF6aYDT/JbiS1V720BUuO
	9+f1tkTTQFm0TfJvf7xZpoIZzV6gBhBcaHXGVrPx0LUTpRprBuIFKaL/aXpl844jAFYzihk+kUG
	eml1v7wNj3icsVTZ8Jhnmq9n+wsaex0gggMxZlJ199I95Mg/hbAAziEm/BwdotF1zP/WGfcvI95
	cnZA+XmqEbpTrzOlWzNiOxs9i4RA0AFDOIHDHOtdX1T47sftkqEDlUWKsYbhOGbnQvyDi78gUN2
	ST6Ek17HDIdgg=
X-Received: by 2002:a05:6820:4a8c:b0:679:dd8d:1c0b with SMTP id 006d021491bc7-679ef9bec9fmr289199eaf.75.1772031703254;
        Wed, 25 Feb 2026 07:01:43 -0800 (PST)
X-Received: by 2002:a05:6820:4a8c:b0:679:dd8d:1c0b with SMTP id 006d021491bc7-679ef9bec9fmr289165eaf.75.1772031702546;
        Wed, 25 Feb 2026 07:01:42 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:41 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/5] media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registers
Date: Wed, 25 Feb 2026 16:01:18 +0100
Message-Id: <20260225150122.766220-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699f0ed9 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dmmZaP2TfQszSoJftQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: b_Th2ouKwRmPDCv1HgryDvpAdmwZD2bo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfX5rZhKCL7E+C4
 X54/i5lJfhIHLR9CH885Jw7iNsVbBf8es+7QdvD5/TfNrubHZisahIybx97EdfCQUcRNjqg4LMU
 olm7LiL0iXQLx9lYwYsyT2EeEOj49RA0h6QPLGdUFFrZ6wmPtxM4Dq6i78fn13qtApq8ufVCLIa
 2vCTm96XZ0sizqfGBjabHMQo6ocSuYiTZj8/z4Hbot4dok7K2KlOnfPEZDNftay0/8yluiX8VK1
 yfYm+oXcbDsyHgY1TP5CxZYsy2xYWvamQOcUzusaIX1V1n8eeS8vFcVVF7OCXJxQBXy6pbJ6bBB
 HcxNEYgFj7WIJP8o81fgVyD74kCQ1yst5TMYKnM8vShtrCwK99AGTZgkz8qyy+IKkCkoy8w0gQv
 sX4ahwKviSqWcWALwP5jAsv/LFEx7tldktezk2Da6IicbE2pyuDRWmdmAsBJux4KF0xDkEBvQY6
 oZc8VpRup1QbqDid+qg==
X-Proofpoint-GUID: b_Th2ouKwRmPDCv1HgryDvpAdmwZD2bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94140-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[loic.poulain.oss.qualcomm.com:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 527E2199234
X-Rspamd-Action: no action

The former RDI‑specific register definitions (CSID_RDI_CFG0/CTRL) are
renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
interface‑agnostic. This refactoring provides the foundation for
extending csid‑340 with missing PIX interface/path support.

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


