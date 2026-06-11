Return-Path: <linux-arm-msm+bounces-112608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mu5UNjBDKmqHlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:10:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D766E689
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:10:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kmveskAa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DPxcaQBy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA2C13014813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD92D36B04E;
	Thu, 11 Jun 2026 05:01:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C721D00A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154073; cv=none; b=MAJTWgZpvDoi3eAnHiCBukfvfxD7cZFVndPodRjljNOtukDsCqAEZGkwS0yovKwcGYHfaBwshzodzxSVSTlW1HbkDsFpXIvglHkc1Eic/Po8oYuPjH7n2flLkdBAS+lyjy7JGzy5Xc5U6gF+IA6liqRHf6xkXUWhJp5ni1wjDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154073; c=relaxed/simple;
	bh=gECQ1F+ZNXfD3+/6l7MNHIXwYTpjLIQATbfLDWsUKDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSvCFTDgT0kXB+uyt3yoEMk8m8xyQvN+NvVZFffefPT/a91imCeb/bx/a2sIHK0gwGynzGgZZ5C4ljGNsKuIWp/TzFPSITKGmvFh2jvKlby/NYuZlVoXHEPqWoUikeFV11eopeU3zW21bpf3vmAfmul1rrSzxSnD4WKlmSHW0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmveskAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPxcaQBy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NcYd3215243
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDOIaZzQfqv4LwUZWfzSNmDzpohRCevXH1ufeQUqdNk=; b=kmveskAa1LeOHSbm
	4RO9fiPqrIUxJ+QoBNzPYEnZ+ehvnKbjqjygeMR2iKt3C9jHh1OYcq4+0AB5ZHb7
	Gj8JWjeK4LfjnsUgAuRu00ilrIJDrI1djeP/1ZiQ2nubeBtevpqNLIE/8soO19tV
	fHCP38IbENZnxbOo+vr2xKu/Za5iBOSvxQy4cbIOqw2nkgxu0qCZykDBAz77HJHQ
	s05+zQ/fArzEOLJPRHkCHOTR1s1sKkdWxK9QYjTLeb7BKD5pGx6Ebp2dbHgIOjMP
	slW5nX7KbanOAwzQUwTcVC1DcgIa9ldWgFw9DSD3nlKpHKuU0Bbqt3REUqORLKGl
	PFSEJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1n9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso8880462a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154057; x=1781758857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDOIaZzQfqv4LwUZWfzSNmDzpohRCevXH1ufeQUqdNk=;
        b=DPxcaQByQBLfwpq2vU2cgVPyh3GRYS+pwX6izNbYdOA7LNGLIEK6aB++KqFCoz+FNk
         hKCA/ncX8xcfP4NR1MdukdTNWNshOjdHfdUcqKeDHiETXmDkdJNpMJUuPuwAv3ZeGleg
         UIbuIeQZGdktbkCGCyTQGQZIie/Qy1cWinPgVkHHPMadRK1e1eVLyhu1qUAnJo5tFq4W
         Zewy9hpeRK9TCXaN3Jkn1N99WouDV3CNZpaClIrv6CgQ1/ZgDy1MEy64+xk9DI515byj
         JMVzZVGKXeMAxpn64lFJMFkg5T2Es9UiNPnN64g6ANVkwVBRiWDW+ZQ7XKoPuPyhaGgG
         Ic2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154057; x=1781758857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDOIaZzQfqv4LwUZWfzSNmDzpohRCevXH1ufeQUqdNk=;
        b=X16k9CZrvzhjLyOi3p6WMSWywNKaoDVrMETOWJx7RqS0reNAepmHJgFwnRbiB3AWUP
         LUizuIizJGso1GfHzEI+nO90jBRympNvVsH+SLcLDLAkjd6F40EsJD7TOC60jbYq3gnk
         0Ko5U1Ggi3mYztu04IAoxnP/ZUcU4bpHForo3MS6tcb+NNOJe5qcCdUwyAsm1XP/Eoja
         o6BGOhn14++ceL4+NAsdJ1TwmMVSTBgwrZ427GyYHZ6LVrbDWhcE1lJQpKKqnPZejbne
         DiJRgWD22yHsR0ksW60hS2SMx1oeBla6VxM0jrb9kisG1n2HdTty3vplQAqlhbQRmIeG
         jWeA==
X-Gm-Message-State: AOJu0Yz86nHUNe4YQn74hwnXPVSJXxyeigyNDlFsOVDrWhJo4JRK6OSe
	XT7VZIgppnqY47uUUsuCWxphjQ92ZMmYnu8LIh3EmP2Ks+sqH+YXKlSSgIa0T3PTpPmlAIjTE0U
	/kgjnPffWYlKkodnXY9fXXhmYPeTYFiyj1wBEd0A32vA3mYYB9QaeppL/R43hnZEgrZ2kVP6zKu
	yn
X-Gm-Gg: Acq92OEpxMfKrjxDsMniOedPM5/Bqug0AWbt23t24kfvr3lZtLn7bI36gnwLu7g+6AI
	ExmjjjBgTidAwtaNGw/kMqzGy1bqXjvwPMoT1Hsd3MPmbHT87K/tpmYuMf6Nluch01qMMtOk+sJ
	kolZMia/uxdTExmnSbwUnP1YntSerooqROccDAruGap+7no3JYciI7qEWVzTwOmL5JpDxTZ9ylR
	oBYff/f89dYAnUTiWus2AImOFKXXDiYjEclXNgQa+1LmvktcV5gwYQ0mr0TD7Q4+5CfV839RP+3
	+mqAEtOo/oehM/VH4/mCtkIetG4vZwBkgWbBQUk7R0pIi7aijmNkPXhR8Z4OQVafbaBSzCke1Yg
	H7xZWt65J3FPdjWgXKlSfXXA4Dz/HZPPqSkaLytdRjbSsilX8WJmZiQDO5JOdf0YVPQI=
X-Received: by 2002:a17:903:1a6f:b0:2c2:2a8a:af74 with SMTP id d9443c01a7336-2c2f0c19fe9mr14030365ad.15.1781154057473;
        Wed, 10 Jun 2026 22:00:57 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2c2:2a8a:af74 with SMTP id d9443c01a7336-2c2f0c19fe9mr14029915ad.15.1781154057013;
        Wed, 10 Jun 2026 22:00:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:07 +0530
Subject: [PATCH v2 31/37] arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-31-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=3014;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gECQ1F+ZNXfD3+/6l7MNHIXwYTpjLIQATbfLDWsUKDc=;
 b=zvjHN9hiLaOSsnf9OaFeQygjeoIm/0Q34GiTX1MdT7OlKRJOY6ZKwX04jA5D6Y8caQXBCZijH
 XvKK8jmK3QBAMqSW3ZmiGTWYyAQaZxNsd/qR6LYIXyFBu/KUzi5G58g
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a410a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: X3cpMEzqvD5n3XiCCKL_8NxyrQgHMsIg
X-Proofpoint-GUID: X3cpMEzqvD5n3XiCCKL_8NxyrQgHMsIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9WsNE2jWa/Ut
 59REL8H77Mg7SiZXvsKwcn3cDxxVQMISXN/Q4AJMfovc4y1Tj7FGfsa6zlCb6o6BnkYzElpQuiQ
 km3v0gKHkGaCuTXTXyzLppbU3cZyhU6k9T7DRzPy+BoainChF2vHNEJR8mkuIWOkx976ATxa/J4
 nyHfy8i+zKbImK5OP4WGMw0/iuQeXqHv1cgkc5bDnhs4Y/p6Wo+6Y2s0C0rWf3Ii/m6gBv62ssl
 Q5d2C2dY7fnUbmjQfRUDUxncAo0W/vM4UO3DvdbZp+wB4FKfjY0uqnQIkR6xy521Z2ntCfSRIeH
 z/Vq5qfqU5ELpkT4VkCNo2fZ9KyoCDhaVPPjVg7j0s4hYrNiZlogFExI2HLeCP6WiTlDqh44H1o
 D+YOgffDT4rI4acakHuFeeVlNppUTAdICWwZMut+PQwLxyO0Io6vFX1U7NDmx5s28af5A4imb5E
 V9KdbgwteLz3bnuYD8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxYQ2mX1FizGQ
 2qeuBJqBcUGOgm9YEoLpwjufzQCQ2a0AlKVHyqETFFomp8yEOXgz8tLFhYCjgDT7SYXNyWlboKD
 ic9bXa6tiTnQPbAcqOoL7F8NUNmmuy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112608-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C0D766E689

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board file,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 0897ed1bbc6f..9a14973fd972 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -493,12 +493,14 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -507,15 +509,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..4515a1ccb930 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1596,6 +1593,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1692,12 +1691,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1705,6 +1701,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


