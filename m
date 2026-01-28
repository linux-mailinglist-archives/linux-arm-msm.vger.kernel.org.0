Return-Path: <linux-arm-msm+bounces-90904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8McuCsiseWm3yQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:29:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C189D6E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 300B0304B02D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5666302176;
	Wed, 28 Jan 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHhFxyr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTo87Qis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700DB337688
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769581656; cv=none; b=ZC3bGTDCR8rUed2WjX9nBfH10FedrpLDHKTpGzRdHNwC1qjkGHqYLx46zK/wTscDO5kKSJ5y37hb+QygRcww80TaJ7GpfEf4cHajar745n7A6ZyzqRcUndua1N4yb5X6XvQkZuYc9pRP4fN8hXw2Ny7ydXZ8xV7tJo1AAGT85hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769581656; c=relaxed/simple;
	bh=LFPwg7/vPCow+QKXGYs9660k4P9i31SipM+JvtCwOXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rC6uPUL54cmyAJOSaUai+I/daMmG+jiVtzabUB+VLQod3rdUSlWr7B+5QOkZRjJzmlBsKn0P9sIl7THexcku8tZ1hf8mm7Z2Kb8a3EXYFxE3lLeVWcn814coHO+uqUTm4h8S/g7F0kj6btdvxKOJryDw4HwjhgZtN1kYwxOIBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHhFxyr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTo87Qis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RKRmfY4002605
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=snsgP40u92z
	Mn7yyB/L0xAMwEBdE3Q52U/UuK2JtavQ=; b=UHhFxyr9VueNfYM9TksMq0vvaCf
	P4egJG1sY7YI5FQ+JhS9XJ88HlJ69FdV/P344IXi6q8HcW8QyxDd2wQukWNc5Wp1
	K2hxF19Yme58Kh4KIAw3meoPo3hfTak+Pmcgoz2YmoPA02pf1lFJMcLF5fzfNiUv
	e5lBn2vCXoHd9ZzFGfpTfkyaVWt3AFLC8s1WVKc/7+DJs5nvDWVZWrCK7N+ZbOvP
	r8wnnHqKDN1sCFmOe6R2McZqz2fz1sMELidv5YWHzIVExUPPZdivT1hZ4lSJEpI0
	ghhZMNKGF5hmhX+SWYvsLicL4jH30VJnoqhkHd3dRvc0J+Z8DVx7J7pqw3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dysjq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:27:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso733164a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 22:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769581654; x=1770186454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snsgP40u92zMn7yyB/L0xAMwEBdE3Q52U/UuK2JtavQ=;
        b=jTo87QisxlXpF8M5OVeOEX/w7nd8PxVwe3ZQOUfJkEA+1J6Jx3xPADxnsfcwq+mU6Z
         YGclKjPXyksrEi9ugFDtC04sShAjkPIjLZ+1GcTTGUdzdlpHdPx3ca03zwQ37NaKMkmG
         kprd4mDYU4e28OeM6o2ni+F1syDwQvgZp33o9BePA+HZlnEUCecliiCVJ3aE3uDM+SSX
         b2PRPORQEibyqzsPCuLc9+f9djuYNg3Ai0eRCULk2l1om9QEp084kcNGzoTphHyU3Uf+
         zkzTcAjgZ3l+U5B6cBV9QhIE/inRfYhsnSzMDDqViRUjjqPIQMy+MhyyOL8ezMyJC4ZA
         UEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769581654; x=1770186454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snsgP40u92zMn7yyB/L0xAMwEBdE3Q52U/UuK2JtavQ=;
        b=HRE8NkL7ro82EV79h1ZaPR/Rt3AEgpKsZei5PS4/HOcCEAmeYZhB4F79KBb0gABauu
         zZKO4yS467dSWM9VYfTUB/GI9a/Vzb0uBlvi7OmxRqknpl/1ZAOCtPIdSdj9cFkamjV7
         8oG6pWaYEcxTb0vEMuJXvy7iO9KvakC4KGrNYd1gJRFds9DTNBsw5KiNOTGwyhQ10DET
         nIF5bzTYXaSFm2EE7L8H45doZgaHrt5UycrwaS17MNLYbTHb8SaeQM1RqxDcsMw1VrrV
         rDs3bm7byXqblAwBdJk/mR4IwZ7kP4p1F4SNLMVQp/zuRs7rcDjGprVFDcfNomYQAdOj
         Bt5w==
X-Gm-Message-State: AOJu0YyXPPkzuHAw+Aj+24o2DwnCvI/Sa1ysdo0GGZszWT70I3+C9W3I
	FvCugOggm1GZVl6DpktYaaA2Snx2U+3E8kZHwMADJpZXxIQujisVXkF7SbCgzMNuYruyY5FNM6J
	pVVzz0eF3EVZZI8LvTZ3sCSq0zo+KeTBE2cFv27/pqQ++A0TewCaOwxAZBOKNq1z2GTUw
X-Gm-Gg: AZuq6aJJp2h/q7QSTLbLUUpQwK7ejoBtJFT/t+gCTKCPRQUsSwVm2wBj26SZFNkibXQ
	riGzCpHD3aY7sqmL2of6CgBnZIzsma/YfvcIPWbiYmEeMzOiInBYPvP1cADrDfJqYRfoJoJiFBi
	LGK0Wi5gn6ppJJoK8IJ4Vnzbk3L8Z1rUTOzTwntqZ4ejH/jWqx40Ri0iVeyrsREL3IGOCNSPX5M
	qXc+ssHAapecvl13vrtnNbwOwf9EpwqqA7f5oUfGWO/37TWnxTdfOn71iVk8aJurvyiGDij7+BQ
	YU7V7PL3sM6zO1UXDL52VPr1CxUydq4r+s7svT1Ql1NLz717Vftbw4pVZ8jbTv6YhEo4BU+aI+w
	yfN2EeOPoSQJvBBbn/m5kzy4qp9oAtklKrRhHwaeVY3q9PpI=
X-Received: by 2002:a17:90b:1dc3:b0:34c:7212:7a67 with SMTP id 98e67ed59e1d1-353ffa7d01amr3531066a91.12.1769581654087;
        Tue, 27 Jan 2026 22:27:34 -0800 (PST)
X-Received: by 2002:a17:90b:1dc3:b0:34c:7212:7a67 with SMTP id 98e67ed59e1d1-353ffa7d01amr3531053a91.12.1769581653594;
        Tue, 27 Jan 2026 22:27:33 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f17955asm1276381a91.0.2026.01.27.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:27:33 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: talos: Flatten usb controller nodes
Date: Wed, 28 Jan 2026 11:57:19 +0530
Message-Id: <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=6979ac56 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MVXNlyxglV1A9M5-WWwA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8yxiHxelgOcK6_Afqao6GXE4Hzmwrq-x
X-Proofpoint-ORIG-GUID: 8yxiHxelgOcK6_Afqao6GXE4Hzmwrq-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA1MCBTYWx0ZWRfXz1HD0n8YGyGh
 sK8DSEh9azP/54dur8p9xP/9RD50F9LCkCPQae+wE0TfwnGd0812hCMRcWUtq/GJw0OpxiFiLAx
 I7WkRrcqHJHCnRG9ahxszVdm90bDFiiw1Hjy7omhwr4HpnCo3EMLBzW9FO+tE9qZDQOGKjCsp/j
 2fI8dbHvH3bM2URUUql2Bjs7bVcSqt4B1S80hnKjSCLGh8qXGsdItXF/+t5aDC9QWf+HgkNuvI9
 bvKf+hakY9jxKo4cf3IMJJhjUYBtu2XubYfnBDqc4w7OGHe/YlWp2bpi8LvHfrTh6Z/aW9u1Sb1
 A3djXzopDbolFzFa/H3FtYMPSWyDI8yU3e59udFGCZ1UxNcmV5KiF0ejKh/iT4TQ60XQJUKEjhl
 f1reGLGgjvQM7riT5nwaGuKseOBILB8xHzZzXZQEZVl9sqI9TEOiGPvmYlElzfXvOqEMfiSRZjR
 14ciKaPT3kWpAKwN29g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280050
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
	TAGGED_FROM(0.00)[bounces-90904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,a800000:email,a8f8800:email,a6f8800:email,c263000:email,88e8000:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70C189D6E6
X-Rspamd-Action: no action

Flatten usb controller nodes and update to using latest bindings
and flattened driver approach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +--
 arch/arm64/boot/dts/qcom/talos.dtsi      | 94 ++++++++++--------------
 2 files changed, 43 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..4f5dca49e15a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -655,11 +655,9 @@ &usb_qmpphy_2 {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_hsphy_2 {
@@ -671,11 +669,9 @@ &usb_hsphy_2 {
 };
 
 &usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..8b2e8d335d80 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4486,9 +4486,9 @@ usb_qmpphy_2: phy@88e8000 {
 			status = "disabled";
 		};
 
-		usb_1: usb@a6f8800 {
-			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
-			reg = <0x0 0x0a6f8800 0x0 0x400>;
+		usb_1: usb@a600000 {
+			compatible = "qcom,qcs615-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -4507,52 +4507,44 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x140 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+			phy-names = "usb2-phy", "usb3-phy";
+
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
 
 			status = "disabled";
-
-			usb_1_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x0a600000 0x0 0xcd00>;
-
-				iommus = <&apps_smmu 0x140 0x0>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
-
-				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,has-lpm-erratum;
-				snps,hird-threshold = /bits/ 8 <0x10>;
-				snps,usb3_lpm_capable;
-			};
 		};
 
-		usb_2: usb@a8f8800 {
-			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
-			reg = <0x0 0x0a8f8800 0x0 0x400>;
+		usb_2: usb@a800000 {
+			compatible = "qcom,qcs615-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a800000 0x0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB2_SEC_AXI_CLK>,
 				 <&gcc GCC_USB20_SEC_MASTER_CLK>,
@@ -4571,15 +4563,22 @@ usb_2: usb@a8f8800 {
 					  <&gcc GCC_USB20_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH 0>,
+			interrupts-extended = <&intc GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&intc GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH 0>,
 					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
 
+			iommus = <&apps_smmu 0xe0 0x0>;
+
+			phys = <&usb_hsphy_2>;
+			phy-names = "usb2-phy";
+
 			power-domains = <&gcc USB20_SEC_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -4587,30 +4586,15 @@ usb_2: usb@a8f8800 {
 
 			qcom,select-utmi-as-pipe-clk;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			status = "disabled";
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
 
-			usb_2_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x0a800000 0x0 0xcd00>;
+			maximum-speed = "high-speed";
 
-				iommus = <&apps_smmu 0xe0 0x0>;
-				interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>;
-
-				phys = <&usb_hsphy_2>;
-				phy-names = "usb2-phy";
-
-				snps,dis_u2_susphy_quirk;
-				snps,dis_u3_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,has-lpm-erratum;
-				snps,hird-threshold = /bits/ 8 <0x10>;
-
-				maximum-speed = "high-speed";
-			};
+			status = "disabled";
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.34.1


