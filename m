Return-Path: <linux-arm-msm+bounces-102567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FnfHvdp2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:09:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA233D1B33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A61F430193B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1DE2DF13F;
	Fri, 10 Apr 2026 03:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRuqc9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkYFOs4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8813112C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790564; cv=none; b=l8BS1quzO1o2YNXv8ZZewNCh3tB+9J6SkCzxwctbux3ELpi53NLlcqyu/m/o6cxMKW7GP3YRzGV82Wp8rBSphCGYvappa5ghH9hF9AnytsKWYQp7ONIFdGlXQBpcT/LjjIQM7jLhtNA/gRRfX3elkEor4K3SD5xvvLcaIfSOVfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790564; c=relaxed/simple;
	bh=jC0NQ9RHOp8mcRO5W1kWueVWIj2hU3N1BlDUF4uk6t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MqLR7ZXzp0nscAwsc8z70K5f1Bn6wtUJdZLz4aRvjcRg9MB47FeJAw3BkXsdTC1Z2fTZGx4jSiafh8q6QPKiOK3jLmDp9OFv+i5L6OjwtAex+ayazuIjofhxMUV/v39E/rEwfcra8WPEhCFvE2ihsevD4+Uz+pk7JGDTZEjc2HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRuqc9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkYFOs4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KSwoN1433129
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2A87x6iq1XnknEDF+ylr1BzadDS+vv13wHQIVeglFM=; b=ENRuqc9rp3pB3bAu
	+7FN9DTsWMv2JmUzgOwXOFyrPh/Xchkt4UmRw68zJmdkPLXzz011WFWgHe/WD6os
	hr7VvcC5VMvIU+vGSmHZAaVaOF1naXT7XA67YUL2oqrJ2uYIF0WTC3GyVOkhthsx
	YLArgr2EBt2SVhTUJ6VMPBDpdkxRPv13dIEZVGTTE1wH98i1/IgBFyJKdHP9umg5
	D3DXxYRBhSRXCITcP0oRJ5u5XyN7g+8kUd4oLYBSkRmkeCMCmiOGcaWyQDh9mshA
	SX2ZFmqihL8ENyrRiJu8TGKCwEYWJRuDungMQbzD311WqdC7ntmmA4a9VIcWdnoJ
	zrJbcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfagwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso2333460a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790561; x=1776395361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2A87x6iq1XnknEDF+ylr1BzadDS+vv13wHQIVeglFM=;
        b=hkYFOs4T2SNctQayhrYnSQ1JLf963JYDzvDH8LKphQ8B/ZDEhGZgd7iR7fy5MYJyZc
         XXiRhBm5tdQ133OpRjHAhEhvxMD7n90PInveXX2k+gsATOe/2d1ax6sW3BqJ8cIImM+n
         Etnte3r9Vq1Vm7EPkya3uMgLJ0WMEo4bCDJ+KUes9nG1yaAYhUCEQL4pC6C6sdPPu0z2
         QVEElMjCz5Quzq8XZVXxQDXsiwd1CdbiPOT/hJwtTPYqrl+62zw41nLmBbDO1OEmIJFr
         AErd1dIbNpbNTPkn9v1lIpD7oEistYtEyxnSlDEav7CRjzrtEVtQY6flXNQ/fcC9Y53t
         0+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790561; x=1776395361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2A87x6iq1XnknEDF+ylr1BzadDS+vv13wHQIVeglFM=;
        b=Rev2zDzBYt/PHTtGqzOr4yP9ImpjJh0d4iQYocCA3IzCYQB4h+P9TNPxiGYikl7c/4
         gdw47dqfi2Y+nay54ZYtGqnV1PCxl3YTFpmYD1dE+Kf/jZf9CFAuxtmtAqwWzGSmOD5c
         p0H+djkMIdmQ2vV1/QSXSvcbzkWLtPWr5Gpw2V24eYAyO6WbyrdqwQsnoq3IRP0btI9e
         bWCPRo+h69ihPwinIFKi6rQlOtC6ukV2U1qRGt2B5uaV+fCneePBqdxtsijHxHeUzjN/
         dj3ApGfAtnmWEU9guWL+ebmnR8T+AK9fKMejWtsmixsv+X8zF8UfiWS3ZduntvC4V4Eu
         OPjQ==
X-Gm-Message-State: AOJu0YzXNziGii1+xb+ZNoTzz3bTZz406qShRCiT3inTt5xwi7BZwTQE
	28hjEh3AZLAkoGyr5UkwIjZTXJB0TVmfDr+xmE+YWNgqKu9XghYuN9AcJFQfdjrA0hZWacDKdtE
	00KhGrepWmuW4fG3dWaqs8nFk0tNoKIcqd/U+uKc90fC7Mx6qRqI53OSDJaXZVnG9fLBB
X-Gm-Gg: AeBDietnUpBL+HayhwjDSolD+RBXAMuWsbPNY8IbQTZomLUS5RH2Zkx1DDlGLLt/pgH
	PSd3mBuXtWYvHB5m2pUcTHGtAEnJySMmf7oKzvgDy6Xfx8lBBCOKtqjBdpCIdWw7MVb43hV8qUb
	OF5heX0GQAM3S4hWL5OrdRoevFG9VaCgQD+3xCpNWfVma1PJP15hPd6wM2crvmQftmE8zR0BT/5
	g3mHDph8uYgJxo/7qR0H5dqy3UaZs9m2O9hn+soWNEGGdEwtICAFC+OJZI9ooo1ZYVDGym/pfFF
	WQiw4Ms1i+hIYfR7pPieX+uLNE6OzzuV9B+QICLuqgajDXR3RWNTmZsYnnBFFPmISt9ZK3BntzC
	LEFybyBNjUeoKHtMVZQnzwWRy88sY1e3TDXpREwIXgsH1xcM5Aak98QzxG9xbyhMEYOkhS8Oa/z
	8Y+rcuYRmK
X-Received: by 2002:a05:6a00:1947:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82f0c1d9e1dmr1664904b3a.6.1775790560965;
        Thu, 09 Apr 2026 20:09:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1947:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-82f0c1d9e1dmr1664868b3a.6.1775790560462;
        Thu, 09 Apr 2026 20:09:20 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:44 +0800
Subject: [PATCH 1/7] arm64: dts: qcom: lemans: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-1-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=3366;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jC0NQ9RHOp8mcRO5W1kWueVWIj2hU3N1BlDUF4uk6t0=;
 b=zWx+zU86ioVVmpqUPsjS8wTwGFrlVThB3XXd2r8AlwKQ4TKb8NRVADAoba+iUtbHMu74y4F3/
 cMeDsQ4pwXrCRbak/09V2Xu49FUmnONukMrzgWWVBAFayuvLBk/Raoe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d869e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AGQJ8-okPX9lvk53HAUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfXzax1EVurlQUO
 6Fxt45p+XG5lragjEEoPxgCiYzx6XBbaga3UNyig4C8bSBiolRugRPqw4auYOsaW3lg4lVxjKEG
 qG9X/OWnLhJt2jHLNjlAxGOWI4QovOWD6S8LH9xI4gUULl0bbBSJtzcsHhCiet5tgE/XK3wik8Z
 uIA1ENScVMWTFC/+x1THSPKSk3dmAP075mHLtGA3VKtNixBjxCXD+7gY4i7CQsK64WGM1GBWDZA
 3Xx7VEN+OyCmXkaLKsPfh2H4Xn4yuqXhgLyUr8MFSHHRGpnbCnn+sw8vu2JLurV7ZZ94U2LatuF
 a/qtG2VEXMQ2jCBzkyuIP/LYOE0lQyxq6Lz4KSWnzJ5gKOAtvSz83aVIxw/ewtE9z8vNi3OnUMR
 mOJ/ZzQ7pC5gGcFu4AdCWznyaBIDzQA8iYVW7vpLGNkNKbL+e9iD6nLK0AB5CXC3vgRuthdelmH
 v44dMU4IRPrsOP3ThZg==
X-Proofpoint-ORIG-GUID: _MCQ2SXiXVMdHElgRv03urUBj3PxUp9T
X-Proofpoint-GUID: _MCQ2SXiXVMdHElgRv03urUBj3PxUp9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102567-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CA233D1B33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the lemans device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..7cdca20708cc 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2847,6 +2847,7 @@ tpdm@4003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2906,6 +2907,7 @@ tpdm@400f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3374,6 +3376,7 @@ tpdm@4b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3394,6 +3397,7 @@ tpdm@4b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3414,6 +3418,7 @@ tpdm@4b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3434,6 +3439,7 @@ tpdm@4b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3454,6 +3460,7 @@ tpdm@4b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3474,6 +3481,7 @@ aoss_cti: cti@4b13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		funnel@4b83000 {
@@ -3795,6 +3803,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_actpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3815,6 +3824,7 @@ tpdm@6861000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3897,6 +3907,7 @@ tpdm@68a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3917,6 +3928,7 @@ tpdm@68b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3937,6 +3949,7 @@ tpdm@68c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_ext";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -8590,6 +8603,7 @@ arch_timer: timer {
 
 	turing-llm-tpdm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm_0";
 
 		qcom,cmb-element-bits = <32>;
 

-- 
2.34.1


