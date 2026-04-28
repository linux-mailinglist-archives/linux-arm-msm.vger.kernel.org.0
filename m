Return-Path: <linux-arm-msm+bounces-104989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJO4EW+68GmFXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:47:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884948635A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B50D43013C7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F2742B72C;
	Tue, 28 Apr 2026 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcsY10rA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D90410D02;
	Tue, 28 Apr 2026 12:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379876; cv=none; b=lHbtap+K2xWmlLKVeEyhSzM24aHGxaeI4+DKAlsNa7zXlHTCaa9qtSsUuCVXG1ZHbBrPYY7EWLcIPh/nY0dgstZfOfBE4+GOsPU7ZztOcOGY77qk0zo4tVo7LNshukg2CtnO40RaSM208qrGKTQVWIOALwLpdX60RELxBvUkfhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379876; c=relaxed/simple;
	bh=1p9A1fIx9ElEnQ5vCnCCM5Cb2MTZWe1BhSX2FBph1AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjh687E9pCPaZDh3UJvbdkybOkUYe3cHpuUUwnvxwyyMMqMkq/lJqEgilNVREiGDBN8hokllKi7bjxpvIB4vSkkFNGC5AFcmS0UnxeDWCq7EU8s6c6dIgQvFy+mAksDkv43+0BQCk7kY/PY7aJqN+OB2WxRRShOxJL0DMHbvI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcsY10rA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAGRVf1329658;
	Tue, 28 Apr 2026 12:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9ODpN8IaOUX9S8pwrsprrhzEdMdQz7E3Iuf
	GcmRGfB8=; b=ZcsY10rAr/euJ1iQfQ64WcoHcP72VAB635Uw4uPXISb3IRmA7gM
	mEIFW15ZsoXmQsJkTpiu8jYKvQVqMmTiz3IIef9JAcjgD/DbphSxZ2HMuk7M0joQ
	JsgZH4rQzJVN8mq0IvujDJ23tbcr7Sv2Qok37KDwqoqp0QdCfppRxvvYwynqsbnS
	zPi1zRbpO3sUSdiIdg0RGuzsL0lho/0Y/h4hQTKG6mR9pwFGt3+Z2x4ceNh5YTS9
	H4JvPbi854F/oCOrmRFZLrHVpLFSJSxvc8NZjDkb6y9ER0kHjQLFTXC5hY/Hz/1h
	/EyDNFGWHcWPPpk56FVIzINgrlMvujdmJcQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahua5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 12:37:39 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63SCbctH020313;
	Tue, 28 Apr 2026 12:37:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4dtr8v2ft9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 12:37:38 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63SCbbsF020307;
	Tue, 28 Apr 2026 12:37:37 GMT
Received: from las-colo41-d19-19.qualcomm.com (las-colo41-d19-19.qualcomm.com [10.37.19.116])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 63SCbbND020306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 12:37:37 +0000 (GMT)
Received: by las-colo41-d19-19.qualcomm.com (Postfix, from userid 3978420)
	id 164B75C4; Tue, 28 Apr 2026 05:37:37 -0700 (PDT)
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, vudupa@qti.qualcomm.com,
        snb@qti.qualcomm.com, kbajaj@qti.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: install DT overlays via dtbs_install
Date: Tue, 28 Apr 2026 05:37:25 -0700
Message-ID: <20260428123725.3457865-1-vudupa@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfXxmJ3ukrBTWUg
 GHQVqvfECUndH2vidgRKFWaEiKBI4t7mXtmTjdjMbk29PvmOl7Rvz8GRlxOATWwgoXu/Y1d6Rvt
 8tSzPKp+NQIgQ35VXj+QJ3kaNaupd9N5WfJ9Ug8S7M3lZ7Uf/IFx1M0bjM52iDgXDPW/s0Lj/F4
 4oGAGBqv52CuNjGmBRhjLqOQLe/b1NfYC7MPxK/cC5eUcnYklBdBAe2rLMlFICoka7fcW95fHps
 vIdXC8K2yyuN0T2ssVusyiPLVCISBUIPbcwdGQRcVnjhql1AfZ9e3v9toKESiWGVHIx7Soro82u
 FfOpIbKrkvpw/C0xrmv8KCLSvOLtjxsy0b+IU2jc8rdHelYHucc1nWRVeLAfrd+Kkm2V+47ptkH
 g3STsHV+hA2PrhoVAUXjNlBdAxwTDjU1C3aGsaVVGkggsPGjHir/FWMHwD7nfRo7TPCuHJuVyQS
 WfZwcsrFJRHxPTa/Wqw==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0aa13 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=VCHxzhp6LglknUd09YgA:9
X-Proofpoint-GUID: EmuqOSW8PEFcqdTQaAzNIfw-2cYPW7Q-
X-Proofpoint-ORIG-GUID: EmuqOSW8PEFcqdTQaAzNIfw-2cYPW7Q-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280117
X-Rspamd-Queue-Id: 3884948635A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104989-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vudupa@qti.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

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

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..19f0a29bf299 100644
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
@@ -168,6 +175,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
 qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
@@ -175,7 +183,9 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
@@ -183,6 +193,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
@@ -192,6 +203,7 @@ qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
@@ -199,6 +211,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
@@ -206,6 +219,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
@@ -216,6 +230,7 @@ sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-ecs-liva-qc710.dtb sc7180-ecs-liva-qc710-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
@@ -291,6 +306,7 @@ sc8280xp-microsoft-arcata-el2-dtbs	:= sc8280xp-microsoft-arcata.dtb sc8280xp-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-arcata.dtb sc8280xp-microsoft-arcata-el2.dtb
 sc8280xp-microsoft-blackrock-el2-dtbs	:= sc8280xp-microsoft-blackrock.dtb sc8280xp-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb sc8280xp-microsoft-blackrock-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
@@ -308,6 +324,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
@@ -372,7 +389,9 @@ sm8550-hdk-rear-camera-card-dtbs	:= sm8550-hdk.dtb sm8550-hdk-rear-camera-card.d
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-display-card-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-display-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-display-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-rear-camera-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk-rear-camera-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
@@ -386,7 +405,9 @@ sm8650-hdk-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-rear-camera-card.d
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
@@ -395,12 +416,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
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
@@ -449,3 +472,4 @@ x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
 x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1-el2.dtbo
-- 
2.43.0


