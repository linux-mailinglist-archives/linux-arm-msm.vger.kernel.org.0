Return-Path: <linux-arm-msm+bounces-90428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNmZMHeBdWkeFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 03:35:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC4A7F864
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 03:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3971C300B051
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 02:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CD01E0B9C;
	Sun, 25 Jan 2026 02:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDkcd4Ke";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jeanhn9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651282AE8D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 02:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769308528; cv=none; b=ZsKj24zck4hEeAvIczeOqi9bvbZmVx4Gk/DCqZzQmVj8M7vcY4zes6bT3YgO7G8d1ZSKQv9UIi4G8p9JSr5YMWl5sLkSYm/4icPn4lT2ufaci///X9CRSrC/wn2bnrKgFWI098qsc5GGtLiVKpGykfuexJksEfkUeVjJogJRTXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769308528; c=relaxed/simple;
	bh=M6vIPb5eCzo9KK/pqVamV5UIuOKvpU8/09sRfSo3SZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQ+9Ad8T7TotG30BbaJyEoPl4C/GghdjqdUhaXFhxdtSyBoq9ORv0bY/QudZQ8fDZGmSHcmDU9NSK/ukkn18NzhbSmR2U7N7AeULEIKxgwRYSlU47BPZYXudoVdOSZtCYrV2cCeo2tbw/s16NPC5wwk8pnkByQskDHiSEdmWSYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDkcd4Ke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jeanhn9x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P1Ke4h4071959
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 02:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uJ+0YidldMq1eQESUrv+QQXY38QtYgXqNsA
	cvqOaQpw=; b=GDkcd4KeGc27p8nDYLwKGPU6N0XRiE6gYnBqJzbH1tU3mZIOyqC
	Mw6oe18zWFOLWlCPvEfgtqVv1WuzK6YsyH1omk6HhKK9uBc69itDtdnbIcsyyO1N
	uiGi6rITEBWn+xAUyia3ShgQ9hJrMtQcPqsv4eSJuGdKGgF71AfHTxY1VT1+30Ac
	Nsthetikuowql919lM5EjCTXkaZ63u8a10HevfM6hsFORXdlhvbggKSj9tUXtQXD
	Hj3toNgDaXWt1WdTlq3TTs6uJC1wRLdblvaPT67gLrZz9y6HImpyZG4kNf+8aqvG
	ji8fkRmLQoXyTcj5LQH1J9wDLAl4Iib/t8w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dhfec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 02:35:26 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123840bf029so25023531c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 18:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769308526; x=1769913326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ+0YidldMq1eQESUrv+QQXY38QtYgXqNsAcvqOaQpw=;
        b=Jeanhn9x6IBdpkTD79qX9WdRXkaAhjbNJB7pnYrz5mor5n3IrfQOFJyAhrJhVmBiRn
         kOL8b6k97k4aC5U3RyACDmNgvyzdh9p28G/siR++NUU8TnZ2CEGUEH+CnbCmkCggEPkZ
         Mq6CCH8QtyoC8DpNTdpO4CU9YSt7Nlgn2OXHgCTK4iqqZvb93ERsqpxtedwXMR3JbFyq
         DwntlLXXXAYbzh116XNT5My7iT3OzmJtk/JSt+G5BL08D07P3BufN34Y4sW7Pg4wNe3k
         QvxRzhee/TpRRAh+OMq/LIqBHAdMaZyqVykTtfGOr2xOzKiX+buC9ZjYG9WPrK8+d4TB
         Fcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769308526; x=1769913326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJ+0YidldMq1eQESUrv+QQXY38QtYgXqNsAcvqOaQpw=;
        b=jqlEoeNudzLwXc9juEv0ktv9tqeyJhNClO7BpvF6v4jPjwJuXy8M0Fm3BXk3k6ngE/
         Lv8O6seEaRtp79zKaYTvWJq5xxJrn8G6lsU2sGTQxmTn/Zp4qm1jRfFvzFj9OgVoYgRB
         fsEOnpxFISNegpB1q6QdOPR4gN6m5WCwcNwY2UrfFgru2TAGZn8aN41e+9NgU7jXO6NT
         Ehytesk4XfVxWhdR301hJukgryeWPC6k/PKshlcmOS2b1Wt3qr4Ot8sjG67VaA8zXPfS
         WRAlageT4pHenLFL5RQUtnWIsCgiEThVDM3pOrn+JjIc/fCt50xFtKeWvSYRiWsrJPda
         9iuw==
X-Gm-Message-State: AOJu0Yx3T5Vnhy5ExKjmuxpZDpWlVcJ09ddrcIxWkzSyB5jgCWIaKmEQ
	YUnBamAwIyBKTastAPBypfb2zdY2P4XeqKtb8hzigPXNz2DogS4FbMUaHmln+wDdGLf5LOMdAT4
	BBSSiJy7xlVrb1/urKN+DQOj3X477za8Z4cTbYe0O5QLgvufb+VQnc4JNWEXWf9soc/23
X-Gm-Gg: AZuq6aIPwQN+yrf1FSm15Sw3oKnEbDSZFyExO2mj6XmJv0GnZB+JOc7IiuqyyrOfsE3
	zXznUPGhbCnBphcL/8ohZYJ4AGAoDwJR6GZxCvsU2flDLFEkJtSV1cCkXTH+kxTEmkfkwKdkBEN
	e5s0VBcmcIBkDFhR2iancnDCqyMQ99oaKDFYwVkCCkq4vwhSJ284mNo9mUelaO7rP0Co3QkaWUo
	rcHvf2p5BQ9gV00W0NLEFS+A8hq7FZ1NutUX4OsdDbt/wTtT/SoZXTGxctL1d9WRlnJmo/qv1wW
	JmuwMoBPGhcLdH6Z/pgOr0bPH92NsjJNlQWZS4T5nAaOstTeFQ8TE6/MqB3uYVK6yk210as72fc
	AsYcfeJdqwhfkoPYzoMrAnXMjUgfVXCtsUs/2l2MB7uxzMv0G4wNftr4=
X-Received: by 2002:a05:7022:699e:b0:11b:9386:a3cc with SMTP id a92af1059eb24-1248ec9c731mr348229c88.45.1769308525715;
        Sat, 24 Jan 2026 18:35:25 -0800 (PST)
X-Received: by 2002:a05:7022:699e:b0:11b:9386:a3cc with SMTP id a92af1059eb24-1248ec9c731mr348214c88.45.1769308525133;
        Sat, 24 Jan 2026 18:35:25 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91b9e1sm12603275c88.5.2026.01.24.18.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 18:35:22 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
Date: Sat, 24 Jan 2026 18:35:21 -0800
Message-ID: <20260125023521.3862114-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDAxOSBTYWx0ZWRfXxR8mR/6wG2RQ
 ldYIzRyiiAFepses8HCWdym/YuAMKivT2k/61EEzJMvZ4VDgah7bsNSyGCHauJUmd3XbpkLa+4D
 8HPIizQ7v85sVKuXcW1SmPNYqGgbMn41aFDl6esuEKzEleB+z2NpKwyUlpv6iDsDGDKgBiMRX2z
 3vjWag3FcEocvt2mY65KO2fFitGZVAXP3KtwM26nWpSNXbIDuTmiICawBtxCNH8ZuGgQak0o7w6
 3gqUxT2DfUZUA0AaCLYIdBx5n/IV1DdAqRkr3JEknqyVviSuzgCTwADGo/wEpWyMuOB9eIspGjo
 /btnDBoMJGeO8uA+6GDbACKvrAb68eYbJ1f9n+r0rnJq6vgkoooUbDlvHJaIOl8FeqGDzC/3NFP
 0jAZzwpNh5xooyEXaUMZTp6dMoiDowkzBY3TZcneuFXITETQncqogWcQH94jAGVgeX3fDARSuxA
 sE2Uxu6srPKl+afJnEg==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=6975816e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=T-lse5AFNF5OJCeDb7sA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: zVb4gIZcesO0kW5ecjHZ0f1AV0ULyct1
X-Proofpoint-GUID: zVb4gIZcesO0kW5ecjHZ0f1AV0ULyct1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_05,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250019
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90428-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2AC4A7F864
X-Rspamd-Action: no action

Add support for building an EL2 combined DTB for the hamoa-evk
in the Qualcomm DTS Makefile.

The new hamoa-iot-evk-el2.dtb is generated by combining the base
hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..0bbfb385cfa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
+
+hamoa-iot-evk-el2-dtbs := hamoa-iot-evk.dtb x1-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM) += hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
-- 
2.43.0


