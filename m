Return-Path: <linux-arm-msm+bounces-113870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PmLuLRSGNWpZygYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:10:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EF6A7578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:10:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T3g3BzIs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113870-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113870-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB42B302BCD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80903B7B84;
	Fri, 19 Jun 2026 18:10:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D139F160;
	Fri, 19 Jun 2026 18:10:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781892625; cv=none; b=sFKhbXSLoR/dpOfLHBEB7dlku4ouaiT63Fqr7z1Pf5qRRbmDXBgMloONfYOTACZT3Mla1r+An9J3cc6wnG0ZwvV5poIjHFX4H2+U9E7W7yXwtG7EaLb0jAB0KzaQaFG15IzLLo6Qx8TYN1612DZxQ0rrC07V5AQVZHp5c9dTf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781892625; c=relaxed/simple;
	bh=PFyKBNDWBYjB8zWNDrsT7rKZVdoLKZOHw4AYe4w64Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dW0TLASdtqf1Qg3X/AYC4SmQziuyIxDst+xN97M7N/2tE19vCzGMMcOUF2cQ5WAeDFMlbQyrl018VhFBebZ2FQnXlHNlCRHVBQLBI87oDlgh43lijZAXMMmTpQ9io43nOp6Hi5nP0xpQuorCrW071uhWtf9ZncSmc0ErzM01J2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3g3BzIs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHSibI3569211;
	Fri, 19 Jun 2026 18:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oADIH0atf+C
	hHud3oTfXN4f4TjJebhfNtjQi0SMfK78=; b=T3g3BzIs8y8VMpOVSm0MKD4I/d2
	zp+XzUncqNO0RS+8nVSQ2fGTbj82iCbtsXybpjWMCizkHTAz4gLrnz/81ORiYZiu
	ZYAS9ITBMTMbfeLwLnxMxDUe58WyEzpmEsd0R3diL+JPi2ehWipLcSsL/KqToKRx
	2suNUal4Gck7oidErCoBVLebB4JHqKN51Us+EOuB1Kub1gBCa530OeLj8A9RKFVG
	UME1r+Qr1r3NSi6eGer/kpGJSSqoHHFTu1bcK/i83aLEivwQ6ty3MyT2fpbRtLvR
	t1rMRywBIxM0sONWiMIQA6Pb/Rn2sWQeSzoSngpQVLWRogjo2luvKvl+q9w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrcq8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 18:10:22 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65JIALPf021249;
	Fri, 19 Jun 2026 18:10:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4ew7x11c17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 18:10:21 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65JIALo7021232;
	Fri, 19 Jun 2026 18:10:21 GMT
Received: from las-colo41-d19-19.qualcomm.com (las-colo41-d19-19.qualcomm.com [10.37.19.116])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 65JIALPD021217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 18:10:21 +0000 (GMT)
Received: by las-colo41-d19-19.qualcomm.com (Postfix, from userid 3978420)
	id DFFC35ED; Fri, 19 Jun 2026 11:10:20 -0700 (PDT)
From: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
To: andersson@kernel.org
Cc: vudupa@qti.qualcomm.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
        kbajaj@qti.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, snb@qti.qualcomm.com,
        lminier@qti.qualcomm.com,
        Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: install DT overlays via dtbs_install
Date: Fri, 19 Jun 2026 11:09:51 -0700
Message-ID: <20260619180951.325272-1-vishwas.udupa@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a35860e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8fCnAp95bUwIBqsXEYIA:9
X-Proofpoint-ORIG-GUID: wS6E8d1tp6538ReCVajNPKN8ZOyyII0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE3MyBTYWx0ZWRfX6wjxvPbYlNGX
 /OD1sLKi8GP1KWkCY/ecF2FSbofLOYDugIC4eHcUElnWyTFpbsNNZra4Zmf04D4LdY4qnJIYYB3
 +2oN4Fbd3P1KbBS/gBZadKRlyxNjUWvBsPlwuEbj9Pa89JqbybN3vrZErfc1IEPd4fDnsdtk0Cr
 5gM1vPhVfbTW0GqCU2cUX5HqCsr7dRdI5IOSOyV+mW2wYdLdNTE8/EO5SS4vPQs8hVw6WcBKitn
 OqvStoEuGoRrIH0r6Z2NFY5k6TIrVcwHaRb1uI4Av/hB39MEFq4oPpyjEkLbVzzBN5JvvugwJ0o
 ahpnHmYyU4yY8EAP/UvVMHGMJ9MXqYf29I+apgOFyg3qotFsaKuVC/Gkbqkcy1YBWGDXOvjEHda
 2Ej4VVadO6zPkb4hlqmh/X1BOQQdfQcaMGxndeY0SiGDN5pAgkgG5rZQAZb/f97L3EwTbvLu7YB
 k8uKPaai/80ns4zv5XQ==
X-Proofpoint-GUID: wS6E8d1tp6538ReCVajNPKN8ZOyyII0s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE3MyBTYWx0ZWRfX/ivMty88t2bA
 f7domQIByKWm5oZhEAzr+CZxSR75fAi3/iyXVaSz+wi9WlggTwkBuqXBgAnz8N38wrH5swBQLBf
 967t8ZW2hRqe9oR9/Bucj4e5lDhxn4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-113870-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[vishwas.udupa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:vudupa@qti.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:kbajaj@qti.qualcomm.com,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:snb@qti.qualcomm.com,m:lminier@qti.qualcomm.com,m:vishwas.udupa@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishwas.udupa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D49EF6A7578

Overlay binaries (.dtbo) are currently only built implicitly as
dependencies of composite firmware images and are therefore absent from the
kernel install output.

Even when final DTBs are produced at build time, some distributions rely on
standalone DTBOs for runtime selection and application by bootloaders or
firmware. Without explicit install targets, DTBOs are not picked up by the
standard dtbs_install flow and therefore cannot be packaged alongside DTBs.

Add explicit dtb-$(CONFIG_ARCH_QCOM) entries for all DT overlays defined in
this Makefile so they are installed via dtbs_install, matching existing
DTB install behaviour.

Signed-off-by: Vishwas Udupa <vishwas.udupa@oss.qualcomm.com>
---
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


