Return-Path: <linux-arm-msm+bounces-97958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAJqI8oDuGlpYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:21:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E06829A40E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58994301DED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798F0396D0D;
	Mon, 16 Mar 2026 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y149H9Ug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mq9U+vWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522033976B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667223; cv=none; b=RJ62xEDLZR3mdMjm0bcQjlyIR7sxBlM31yn7qWtVrIMnihHjmI4D3vuwlCUv7/c/xEB4Iixklw6zZw1mbKhtSj7XFMu0HUgOzlb6B/NygPhbC7m8rl3oGQtPEpil9mnnllr4zEW0IoiQyJAcO13qMiHs4FD2FKPEqGiwTW7S9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667223; c=relaxed/simple;
	bh=dJbTfvAcFEBr0KgQiHACLmah4/Nutv+8vmj1PgJofSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMAkaHkKn1FNxv0PMIISVu4eOqqtEgNqXB+p4xZF9kfBwUwxX9g84J6ZiYRtBWyb7A3U79NquDXIlk3JdJtkzucIgnritCPlS82CktNalUYKTdyISYWUijPoYeiDcLLQl3xZBzq0EHgcmPI8lRJsHAmKXqA59b3aq11aYtSSrwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y149H9Ug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mq9U+vWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GC5x5O1724895
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbJPBsQP9F6kyoPC+2wB07LxBFNQb4kGKV2bLW+wM9w=; b=Y149H9Ugm11cflVU
	PmU1pISnb4e3D7cdu0GnqzOV/b80saYTAFSFeHYJg2nci5UhilckxhrS8GX0bCMa
	GQ5sinfUCD7cnekK8EPRrQ9iFU5Ut6goACXpmB+EBVABFAuGW4ZC1rR5SC4vBnqe
	rYug0nX+xnItYIsAYVgqRrAnewJRffdI8b+tQev6pZTRqhap3HyaiHANuvftzJRd
	yVlDF5EF7hIu702yTgKWDwNNdL9aGQTJDaeSjuFwvUBJPu8mIxCBB70MHtFkOrZK
	IN22NcE13MmlsnKly3RqzV9rip3G1JubUeVw4wxG68l29p8BipNOdu/DGxgVynQm
	yVwScA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udnsfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b9246248dso1687228a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773667221; x=1774272021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbJPBsQP9F6kyoPC+2wB07LxBFNQb4kGKV2bLW+wM9w=;
        b=Mq9U+vWB1gXAb2m9wTlrTGGcHK6OnvDEAehKv0shhf/G7xfds3iodQ55FYMp15Z9Me
         qAeRq4X5XSBb8sHSq6IDhAi2dINW8QLi5zVVnVz5Cg8ksK8P8ZfjRD8z5HI71MoNLR0A
         pkBx6CSdrN6mJXrD+N8BA0+q3ifUkBMD4/KATIwUsPEgH+UdhDDezwQqKUvsYRAD6h1E
         U7ck6AuV2G5z3+cEu26K76HYB99ZiAkwgFXz2qZeyYu8d9SoKsYqkt7TjtZrjuSeRTUG
         CBuJk21f6n9DSiC8jKXxY5IsK2XDmcwE0ogFQlOTuLtkgRosn+vXgY0AClPR9mz9BVe/
         sa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667221; x=1774272021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pbJPBsQP9F6kyoPC+2wB07LxBFNQb4kGKV2bLW+wM9w=;
        b=U3LxEvwTaMNtRvst6CNhoMpX9kCOCdmKsjn+xIRue60fK7S1S0taVadD0lxsoCGTGr
         4WjLhGACRy558sZvxZbagxfHNMZQGT46OzuY2/fwp8YaEoTfiS5HzNq3E1jv84/7NRsl
         21JFCLip/JNH+qqRCsUFS9Nf/uR3BmaMmZGpH0sROWvmTQLTXdywmeAZPEtMMViwfGzZ
         5C9PqjG1guGuPbPZQgszttdsjhTRCcYfdPdLW63+qMB43bXajDvBrXUIRUCDd7QAO7ZH
         mEkOQ53sBYeND9LEr6k1GXamciAOhjEegD85GpOhC8j5y0Ns7FaGMG0hoGLFkNWRepQA
         aq6w==
X-Forwarded-Encrypted: i=1; AJvYcCWy8GDdzfYxKaGUw4o8CMpZose8ACs2P2ETfYLKDPz+1bcG+bzLaodoAliDcEaBOkyXyL7BVtYH8s+thKW6@vger.kernel.org
X-Gm-Message-State: AOJu0YypDgl0881ggLlxB7SBJScGQvK+6foYjLJniG/G1mOgUCgSLnRr
	fLVGKa+vy4fo5VgpoUpHr6riJv9ImkK8mYvm30BobP6YbcfaxpDmFg3opREL2WB5067jB8bI97K
	R4k2V0u2FR7Ad8bR9z4Qg/Pe75N19nvoYIBniDxekAXuSV9tgzvYJ1OIwFtcVo/XmWiez
X-Gm-Gg: ATEYQzzFnc95ueXO8K0qqIepbN4px5RkB2KDChv9GuZnH3/gavqDutkbcxDUDWQ0TWI
	9Vtblkr1IxYFCr5bMyyNxbIey6ot7AADUwHMwtrRQs7YvZU5wIdWzfF1eD4Q+4QI2exR0C5Z6Jm
	E1w+1qLqdUm3tUriuuBI0QMKhscFot5s74d8FU78sXUn+ubK/QEZkF8G2+Nnrp9EjvXDbWQ7om4
	P5PrFOsro4APT8TQn4Ll2/ZUufpQBbjfF7l6QERvLrl1aN3ycMcQwBid2ejLoCYlnNhdjvKxCKj
	FEVeKs5CtfKm3FRtE4uzZfsI1jCKSBG/xMTKZeHWDL9SNXP2YlBneEu5HA5ooPk7HyySRGXVOSt
	QXqYsgfh00bS4fqsQg2RPjTyee/5mM2pOgLjIGP24W0tAYG8Au2EOSS79ag==
X-Received: by 2002:a17:90b:4a47:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-35a21f007ccmr11940411a91.2.1773667220604;
        Mon, 16 Mar 2026 06:20:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-35a21f007ccmr11940380a91.2.1773667220116;
        Mon, 16 Mar 2026 06:20:20 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm5209648a91.8.2026.03.16.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:20:19 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller
Date: Mon, 16 Mar 2026 18:49:50 +0530
Message-Id: <20260316131950.859748-4-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b80395 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2RAHEg2qjUOD6Jr5jaMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YcC204NNmYrMpzV9f1zID2XLuW3I1kFz
X-Proofpoint-ORIG-GUID: YcC204NNmYrMpzV9f1zID2XLuW3I1kFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMSBTYWx0ZWRfX9PJJJLCXHnFe
 mV+iidpMqd9jrha1aYe2aSFjAT65W7/2XFykvVjufWYBiDZ55pVr7UxO8q42OMN2AUyHIIie64G
 xkloqGapS9cqQHSsTnZOxtQVZG6Bjqlt03UPYMiNpQwb9+UpJ9YVsHp2Yd57vpcboHh5FPvc+Sl
 +IOi0cDiR7vFMW/I/NPpLxSgRZbFphxQEqP48o7p1tkHtQrdrjUk+RBmyV6BIVG55evwu2Zoc14
 8LSVYIk6+2ZnGDeY3UoTbBUTI//jhw5OCYdRnC4sFJaDshH+ZOxfwpU3EBA/AufcfozN9hCizl3
 0hYTd8p/wbii529H9opmn1zVBv3tKcH+uO6KsxQEp4QCWREW+hrKDe3HWuKyLfXK7nTAOLinZbS
 h5d1sIqklZ+WJJiRbp07wpa6xqF/TMIUl1QONEoPGVtHub9ygA5uplhlqiv2/JNilsUuUM5DpRP
 QXFdHrJuQkYBcw/56nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160101
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97958-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E06829A40E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
The controller is connected via SPI3 and uses a 40 MHz oscillator.

The setup was tested with CAN-FD loopback and actual data transfer
using an external PCAN-USB FD adapter.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v1 -> v2:

- Drop the gpio-hog property.
- Add the microchip,xstbyen property to enable transceiver standby control.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com/
---
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..245961722f84 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -44,6 +44,14 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		mcp2518fd_osc: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	dp-connector {
 		compatible = "dp-connector";
 		label = "DP";
@@ -1151,6 +1159,20 @@ platform {
 	};
 };
 
+&spi3 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <10000000>;
+		vdd-supply = <&vreg_l11c_2p8>;
+		microchip,xstbyen;
+	};
+};
+
 &swr2 {
 	status = "okay";
 
-- 
2.34.1


