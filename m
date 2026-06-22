Return-Path: <linux-arm-msm+bounces-113927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5KNFD7DNOGphiQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5576ACD81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZXEuMsn2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113927-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113927-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DAEE30011B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8017F355F5C;
	Mon, 22 Jun 2026 05:52:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D13126D6;
	Mon, 22 Jun 2026 05:52:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782107562; cv=none; b=CA0kRerit8ZIkvcjrN0AOuk4lBqtWtq6mmujjzCY1Q1eAD1BjAgF7BWDPpP8j9nQFoqEpY12VLImfnajNuLcMuWT5vnX6eUg/hvU3Wrzb2QSwF8siHW5DKa5I4QYe/UQPXr4dmZ6FOgc6Fe4NQvq+cpATvH+Iylc8ve+7RSos+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782107562; c=relaxed/simple;
	bh=UswUcCBuz6YkMAzX++Z5RK+C4hIKcHXCIeaToEoY4UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ha62CjOk15MOl2L3ajdOvSrb44iGUOq1EAgRrY5oUOL5zdE9Bxm5d4vuZJ6WMsj8nTeI9zlfpCozTSmRTmP+7cRZJseXwd2TnVBbpE3I0x+7atgTzz09/ZlcK24DvuNY7SEFeWxF2TuSINffy8jTh+2HcBuXimNVR0Nq+Exf8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXEuMsn2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BeQi4183639;
	Mon, 22 Jun 2026 05:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CVRc+Y0rwza
	6gSkxu04Fw7lTdNuCh4IdLTzrJCQVPtk=; b=ZXEuMsn27ssFHTG6fmr0TgDK7Xv
	QLbAmTekZVPt+WHUGtjPpPv2jwnfGfLxzxIAg5XAsmTcPcwOeeA8N4e6wy6I7Hzs
	EBbx7FSLPeggJqqJYhvdNHRvPbQoav0C/FJAeEXEl1069JQrxw4Kl7KIAO34QKvF
	OTb4bbzOv2Y//Fdm/ozTGCu4+jmnxLHPh/tekF1ereDo6FLEKv9iA5VUfOQ3wzYw
	KYw0KcNkVDXFnqj/JL8QEzNSI0ngKoPc/XOJHBoasc+mEifOCZl3hSr10NZ+K8pv
	EY3bLyJfJm535N2TFPlZEL+DVFRrpp0VuP/R/QQl7zk5uN3SuH5O45Vj2xQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h5111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 05:52:37 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65M5qa28031963;
	Mon, 22 Jun 2026 05:52:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4exx92rhku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 05:52:36 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65M5qa4W031952;
	Mon, 22 Jun 2026 05:52:36 GMT
Received: from las-colo41-d19-19.qualcomm.com (las-colo41-d19-19.qualcomm.com [10.37.19.116])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 65M5qaC2031936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 05:52:36 +0000 (GMT)
Received: by las-colo41-d19-19.qualcomm.com (Postfix, from userid 3978420)
	id 3286F5EA; Sun, 21 Jun 2026 22:52:36 -0700 (PDT)
From: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
To: andersson@kernel.org
Cc: vudupa@qti.qualcomm.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
        kbajaj@qti.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, snb@qti.qualcomm.com,
        lminier@qti.qualcomm.com,
        Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: install DT overlays via dtbs_install
Date: Sun, 21 Jun 2026 22:52:26 -0700
Message-ID: <20260622055226.4085891-1-vishwas.udupa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428123725.3457865-1-vudupa@qti.qualcomm.com>
References: <20260428123725.3457865-1-vudupa@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA1NSBTYWx0ZWRfX8E50z1WIdE6Y
 0CIk//1HxJabmKe73pk7LHaHCysY21su+brpfa0u3CNRDskct0kLt1nQnrvzdLJO9T7nz9l1fPk
 8bySfWl2mq8a6P+fq0A3H/N3lyMuYBmbhgjWpzaFt9g2oHblRluR2qxD+VvukuJovrafTW/En+Z
 h7BBQ+3wUHVlOvZYu2nddEeOpLHy3ZH+OJvKqB1M8He3UP+faVBHOzkLGn5nYdtsBrdA0rQTguc
 kjGQ57T/gKQ21G0rfT6hnvkBdIpXwGT+uZw5i3isQc3WTLFTucPp/B3IHpyQcBodF8njfcH2SZf
 tkFKGIkamRyl802mGsVfSSPT/7im6+zQCf5nRTvoXcS0oNmUswTa1n2ghFLvyeaFGvQdG4rVLvS
 +S3+42JXs6uIwNL+tbN1KsBEN4t+e+ujV7/Fhg9vm2GMXGQPFVYr96NoXPqPBOmNujYxPA/R2XN
 zMrGzRX43yjK/lEBXFA==
X-Proofpoint-ORIG-GUID: 1nNc9zSh2ExbKmIr95hOgfOsT3e7jLaK
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38cda5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8fCnAp95bUwIBqsXEYIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA1NSBTYWx0ZWRfX3v85muh3GGlJ
 CpSYSGXR62E9M8swhdVzNrBmr91+wCECxx0P9q8dNJan+3Tk2yarXU/V9ddPGCkY/4mJ7omhjdT
 O+6+hoh8Tyx7E/tdYJsLFjnIQvyrGV8=
X-Proofpoint-GUID: 1nNc9zSh2ExbKmIr95hOgfOsT3e7jLaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-113927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vishwas.udupa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:vudupa@qti.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:kbajaj@qti.qualcomm.com,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:snb@qti.qualcomm.com,m:lminier@qti.qualcomm.com,m:vishwas.udupa@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishwas.udupa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B5576ACD81

Overlay binaries (.dtbo) are currently only built implicitly as
dependencies of composite firmware images and are therefore absent from the
kernel install output.

Even when final DTBs are produced at build time, some distributions rely on
standalone DTBOs for runtime selection and application by bootloaders or
firmware. Without explicit install targets, DTBOs are not picked up by the
standard dtbs_install flow and therefore cannot be packaged alongside DTBs.

Add explicit dtb-$(CONFIG_ARCH_QCOM) entries for DT overlays defined in
this Makefile so they are installed via dtbs_install, matching existing DTB
install behaviour, while excluding EL2 DTBOs as they are not intended for
independent use and are only meaningful in conjunction with their base DTBs.

Signed-off-by: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
---
Changes in v3:
- Address review feedback from sashiko on commit message
- Link to v2: https://lore.kernel.org/all/20260619180951.325272-1-vishwas.udupa@oss.qualcomm.com/
 
Changes in v2:
- Address review feedback from Krzysztof Kozlowski
- Drop inclusion of EL2 DTBOs
- Link to v1: https://lore.kernel.org/all/20260428123725.3457865-1-vudupa@qti.qualcomm.com/

 arch/arm64/boot/dts/qcom/Makefile | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..44ed2b591363 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -7,7 +7,9 @@ apq8016-sbc-usb-host-dtbs		:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += sar2130p-qar2130p.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3-camera-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3-camera-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-usb-host.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-usb-host.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-schneider-hmibsc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
@@ -47,13 +49,16 @@ lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx5
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtbo
 
 lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
@@ -61,12 +66,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtbo
 
 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
@@ -175,7 +182,9 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
@@ -199,6 +208,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
@@ -206,6 +216,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
@@ -308,6 +319,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
@@ -372,7 +384,9 @@ sm8550-hdk-rear-camera-card-dtbs	:= sm8550-hdk.dtb sm8550-hdk-rear-camera-card.d
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-display-card-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-display-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-display-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-rear-camera-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-rear-camera-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
@@ -386,7 +400,9 @@ sm8650-hdk-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-rear-camera-card.d
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
@@ -395,12 +411,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 talos-evk-usb1-peripheral-dtbs := talos-evk.dtb talos-evk-usb1-peripheral.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-evk-usb1-peripheral.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-usb1-peripheral.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
 talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
-- 
2.43.0


