Return-Path: <linux-arm-msm+bounces-111878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OCRLIpDBJmotkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:20:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2EA6568C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ijBQgyJ4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="AL+Y/Hz0";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111878-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111878-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3D16302B3AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD32340281;
	Mon,  8 Jun 2026 13:11:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F9433DED9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:10:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924262; cv=none; b=CATJ7TZGnGYwwYZY3ZKy+CMWqCG5mzIys4mz5BRXvctF+ga8xchaZ13zgQ5QjRdMeHB0RjPwlvJ9kuK0DGixbAX9fg3YjO6PrSzG4r3PMp2j58y7Oqn82Nc0JgwFyHouev12chWzbjVvWZUTvJ1xb4ppiwYVhZy+QB1ma7bh4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924262; c=relaxed/simple;
	bh=mOqJ9sJg/Xl1Q1NebzWDNEm74bMMGHpQSETPNL3hcA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS1DiFV/EkRvk6lF0ZZjG+wC/5To72r9Fn9HJS0RzlUFj6UMX/t/gnbHH1yzExtzQfDVjXO4b3N7B7abBF7XRGGxMkmss1vCIlB/A7jvu7MxYbcaA0bvAqewYchwSDCtZQZ5ernmHczrotlmDsCVVymxU8Jd4sJqFuRLKX/PPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijBQgyJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AL+Y/Hz0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9TSN2965423
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aItuVwfT0Py17L0Z/j0AtLEycMQjz2A0HhDTz+8vjwU=; b=ijBQgyJ4KNRsQ9MH
	I5lScRxcxEcd+LlTSWrJL8xagLmXV6j+pfJOMdJRNb6cUPt/Ej0Xz5dRMHk0yNrr
	Y8TNsrjLQqyylq0fCtov0hctLchBLWd0SyZetvV5CX1dkuAAkaqr7tgzfUfzdv2v
	3XQ28xh6H6GY/ULNHSPjQHnuKYB88KYugNNZADFDojMvUGkaX4fSXf7BEIEX0Im0
	zSIDzDnSz7BpERFKljOXDpAMm9DPBXGNh0fEZOcG+ck5I3vGv8242WEoDksK5xio
	QUZ8ceYqHCQ2Gw37g2b5YItSt80kIPxvdYpRczAgV8Ra1vSHi975r9j4feFkQsCH
	nWKBOA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrks224-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:10:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf2bc4371bso37329165ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924258; x=1781529058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aItuVwfT0Py17L0Z/j0AtLEycMQjz2A0HhDTz+8vjwU=;
        b=AL+Y/Hz0bkNNfsFD+LWXrjBeTTGWHHHsgAzFTLi2/bneV+Ej9J83yhR7isNJ5JXeRs
         LQ/Xb89aNjzriQUOMPfcBGubqyPs6s4kBuDE7jXD7T3G6eImxYvVuQaDCG0YjGlKk4mQ
         AV+xT9eePpJpY6QAYXQF8ATztw0UK+jN6Hm2Kfno21fL4hJ14E/boUJ4zB714mwhFsNe
         Pi7Xta6xSFmcfGYhvGFPJxmhiKSR8Voi7Xwpg5tUZmtbhkuy1ODq1CycMwMBQY7RQQ5M
         2Dh4p7bvO05Vu4ufdbYgf0d+6gPPaXxV/intFT7b2SNgNVZ+5lkP6nb5ocrK85394oLF
         ERag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924258; x=1781529058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aItuVwfT0Py17L0Z/j0AtLEycMQjz2A0HhDTz+8vjwU=;
        b=idv72qant2IcZyHGZjWAG/kuGcAKDW4vF2eEWSlfhmCvnze808gnaBbXa3B84pdkHY
         3PssByeR15lAC7XFjQ38KmaGg4OaPL+xMb0Qd/59noFQRMkn4sBRptJuycHQlUAGgTEw
         qjZDXHTP2mOLYMwxI4sy9nL+6lwY2sivgPKz9f2TfV1F9uQsonZw7MnCfA7CcqYByByG
         TyxBhgbB3pU7R7esYTBXynvwKs91c4e4UkNwBAdgA8uVIUYi6HvOH+C7QjrS/TeDvhN7
         3+RB2l1a4gMLV98Jg+IvWpt8yg2QTfDQ35v+i76Y6a360wU74l0F9nu9Ira3A0GHq5cE
         S9sQ==
X-Gm-Message-State: AOJu0YwWVCyAPt2mDQoVq6pP9RwtPz2jDNKIvd6R37HQRujzdAd08f13
	vlB73o/ntYV7qeBsG0mgKUYkH/ZEScALFVcsUL0UrAI3vibT/KjTvYc3l7WuUTA1gdEvBFmZQLA
	OfCPTgQm4GPmEb/qDO7Vw6Ejr/fqY9lbDdTQDZCv2s3EyLzrwwlqeDKFcG7S9F2hIlBwx
X-Gm-Gg: Acq92OHo0O/UxaPt3xc9ayOhn1jw8Tk9kt8dqHwhzJLDTjFgJzM4u+hVQtVsS1P5kFO
	QC1tPMWYiiUe5Jh2oEj+MQjkvFXjNjsGG0LKETrlg2hadLHzzLUFiGC8R7g6JjmVn5Z3Nzx08nL
	yyeffUoLWk4yw+IPz/wyfiFk8gdCJLKyp56TgO1E1Bq89wDtuM/jEoaUNdsl2+GdmXmD/0FO59b
	w/qm5gRsyLZUVMdJ20hIULyy3pGipGoRgjy5GqFyuuA4zibAYc86m2TG2ZjD3k8xuF7BCHD/Sqd
	ej/YHz2pCq3fIm9H+GngnUcsCm+TclN6CU2ZQD3MrJYoINfVMm14qBnCSwWaTCxOd1SSTJPT8Ad
	aZ2UN11furFGU0rY9QQlO+/l6RgAd9V4lcMMX257zB3Nvb6g=
X-Received: by 2002:a17:902:e842:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2c1ec964b51mr135830375ad.17.1780924257859;
        Mon, 08 Jun 2026 06:10:57 -0700 (PDT)
X-Received: by 2002:a17:902:e842:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2c1ec964b51mr135829815ad.17.1780924257156;
        Mon, 08 Jun 2026 06:10:57 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:10:56 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:23 +0530
Subject: [PATCH v4 03/10] arm64: dts: qcom: Add QUPv3 configuration for
 Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-3-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=28783;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=y9FcMApryCw7W1RJ91LNYCDOP86qukWaMJOrGo+FRkE=;
 b=CQRFqrhPy4HPaTpTFuu4OPL51jAOMNRcYyHTwx3F4t1tOIalmoGLd2K6J58rgQqzrqGXPcmY6
 OQH5qHREJKzBXb0iGJsk5tkEkNhEMqHl5AuXmiMkPJi5mzzpjVQPZrp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: JBtVyQ_v6IqWh0gH3tCKulXX0mBWbcrP
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26bf62 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lZImzISf86lFr0hzVWMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JBtVyQ_v6IqWh0gH3tCKulXX0mBWbcrP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX/8ql6IUaX5mx
 shpXdWEFJ/mJmOoLzNv+jjkxewEMAw4ITJVPdM8CTihwoper1Uynpou1QQyvOdw5BbLUb6nPFIa
 E/ZpJLnruqTJaZ0p+vGbhUn/w4EOsua4MpSpwCP/XblnX4aXNBDgUYzJ4VRa5DDZozUhOUdPk3z
 /t6A/dfv6D7myrfHTs3Q915Ix/sP6nfkrbT/Z3vTUc51Q70t4x/hX4R6Bw9P3paBQ8QPX8WTXCB
 W9kGfAmhmOzzt4SJjQASpU3JlP7Vi/UbNj0+QCX6WxzQS3/7jUPgWCORQTZTzGiLopTTUvpInew
 D0RpFWHocxYCYN71PDgOg2NOuq8YQVeZPO/4GqVKBoGq8PA1VYdIze8OFjQY4qphlut6WPDK2O4
 8+Ya1pKSWmO0S0DB9vgefZEYQlSFOb6aHlCj/9d0/j8t3fbkgGZ0EIaLRJ6i6zON5yKqWH0CHqW
 m+hW4EsVjlktlCfhGkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111878-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D2EA6568C7

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Add device tree support for QUPv3 serial engine protocols on Shikra.
Shikra has 10 QUP serial engines under a single QUP wrapper, all with
support of GPI DMA engines.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 951 +++++++++++++++++++++++++++++++++++
 1 file changed, 951 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f3..e6ec07a865f0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -348,6 +349,161 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio2", "gpio3";
+				function = "qup0_se0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio4", "gpio5";
+				function = "qup0_se1_01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio6", "gpio7";
+				function = "qup0_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio10", "gpio11";
+				function = "qup0_se3_01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio12", "gpio13";
+				function = "qup0_se4_01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio14", "gpio15";
+				function = "qup0_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio18", "gpio19";
+				function = "qup0_se6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio20", "gpio21";
+				function = "qup0_se7_01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio22", "gpio23";
+				function = "qup0_se8";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio27", "gpio26";
+				function = "qup0_se9_01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio1";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio2", "gpio3", "gpio0";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio9";
+				function = "qup0_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio6", "gpio7", "gpio8";
+				function = "qup0_se2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio17";
+				function = "qup0_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio14", "gpio15", "gpio16";
+				function = "qup0_se5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio29";
+				function = "qup0_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio18", "gpio19", "gpio28";
+				function = "qup0_se6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio25";
+				function = "qup0_se8";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio22", "gpio23", "gpio24";
+				function = "qup0_se8";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -355,6 +511,105 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			qup_uart1_default: qup-uart1-default-state {
+				pins = "gpio4", "gpio5";
+				function = "qup0_se1_23";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_uart2_default: qup-uart2-default-state {
+				/* TX, RX */
+				pins = "gpio8", "gpio9";
+				function = "qup0_se2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart2_cts_rts: qup-uart2-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio6", "gpio7";
+				function = "qup0_se2";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_uart3_default: qup-uart3-default-state {
+				pins = "gpio10", "gpio11";
+				function = "qup0_se3_23";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				pins = "gpio12", "gpio13";
+				function = "qup0_se4_23";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_uart5_default: qup-uart5-default-state {
+				/* TX, RX */
+				pins = "gpio16", "gpio17";
+				function = "qup0_se5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart5_cts_rts: qup-uart5-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio14", "gpio15";
+				function = "qup0_se5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_uart6_default: qup-uart6-default-state {
+				/* TX, RX */
+				pins = "gpio28", "gpio29";
+				function = "qup0_se6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart6_cts_rts: qup-uart6-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio18", "gpio19";
+				function = "qup0_se6";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_uart7_default: qup-uart7-default-state {
+				pins = "gpio20", "gpio21";
+				function = "qup0_se7_23";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_uart8_default: qup-uart8-default-state {
+				/* TX, RX */
+				pins = "gpio24", "gpio25";
+				function = "qup0_se8";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_uart8_cts_rts: qup-uart8-cts-rts-state {
+				/* CTS, RTS */
+				pins = "gpio22", "gpio23";
+				function = "qup0_se8";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			qup_uart9_default: qup-uart9-default-state {
+				pins = "gpio26", "gpio27";
+				function = "qup0_se9_23";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -604,6 +859,34 @@ opp-384000000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@4a00000 {
+			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x04a00000 0x0 0x60000>;
+
+			interrupts = <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			dma-channels = <16>;
+			dma-channel-mask = <0xff>;
+			#dma-cells = <3>;
+
+			iommus = <&apps_smmu 0xf6 0x0>;
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;
@@ -613,10 +896,75 @@ qupv3_0: geniqup@4ac0000 {
 			clock-names = "m-ahb",
 				      "s-ahb";
 
+			iommus = <&apps_smmu 0xe3 0x0>;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
 
+			status = "disabled";
+
+			i2c0: i2c@4a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi0: spi@4a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x4a80000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
 			uart0: serial@4a80000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x04a80000 0x0 0x4000>;
@@ -638,6 +986,609 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 
 				status = "disabled";
 			};
+
+			i2c1: i2c@4a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart1: serial@4a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a84000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart1_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c2: i2c@4a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				pinctrl-names = "default";
+
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi2: spi@4a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x4a88000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart2: serial@4a88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a88000 0x0 0x4000>;
+
+				interrupts-extended = <&intc GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH 0>,
+						      <&tlmm 9 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart2_default>, <&qup_uart2_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c3: i2c@4a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart3_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c4: i2c@4a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart4: serial@4a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a90000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart4_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c5: i2c@4a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c5_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi5: spi@4a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x4a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart5: serial@4a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a94000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart5_default>, <&qup_uart5_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c6: i2c@4a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a98000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c6_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi6: spi@4a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x4a98000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+
+				interconnects =	<&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart6: serial@4a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a98000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart6_default>, <&qup_uart6_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c7: i2c@4a9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4a9c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c7_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart7: serial@4a9c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a9c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart7_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c8: i2c@4aa0000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4aa0000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S8_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 8 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 8 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			spi8: spi@4aa0000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x4aa0000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S8_CLK>;
+				clock-names = "se";
+
+				interconnects =	<&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				dmas = <&gpi_dma0 0 8 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 8 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart8: serial@4aa0000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04aa0000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S8_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart8_default>, <&qup_uart8_cts_rts>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
+			i2c9: i2c@4aa4000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x4aa4000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S9_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>,
+						<&system_noc MASTER_QUP_0 RPM_ALWAYS_TAG
+						 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+
+				dmas = <&gpi_dma0 0 9 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 9 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
+			uart9: serial@4aa4000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04aa4000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S9_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+						 &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart9_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
 		};
 
 		sram@c11e000 {

-- 
2.34.1


