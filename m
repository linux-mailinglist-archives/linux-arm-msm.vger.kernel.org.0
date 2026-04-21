Return-Path: <linux-arm-msm+bounces-103916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBDwJmZQ52lW6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:24:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D4439746
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C19C301843A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FAF3B6363;
	Tue, 21 Apr 2026 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPLsFql9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTX3vbYE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457637E2F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776766573; cv=none; b=gTzqbNtezQLb34rpqQZ0pOD9TwZWEaqhz1LVPa8Unz4N99A9d/VidPdsumZ/Uf886UZBVC4cZRbO+w9/mLMmetfrqyE8oeVVZjLno7RVwAUYnp2nZq8a5AtipQt/7maOqN6sG3UY7YyaoTHPz3ukwJ++nrF2fvaT060TculnLXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776766573; c=relaxed/simple;
	bh=kbJcICYnHAbrzJj1wFp8jBdoXwYl/PBQjV7QQx+CG9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OdRV//Kbxvk0wE+dp6CS3NUrUbCqOmLiuOA/69R8/aBKGdpDTuQABjc0fwd9jn0NzR+TuS5BtuFF6+d4WdR7EGdIVmZW1O63QiSwEM6jNwnpN0n7ZIzv6SZE1Azt3znpIOF2xI4yS8EW8ppnpyfvz1RAR97lgQfMdilctWZ4OQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPLsFql9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTX3vbYE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9W3s84168281
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NNGVZJ0YxY25OvVufSMfmjNRi1xkCkZAU6j
	wz6YoSPo=; b=EPLsFql97R4fvImj9rj7vei/uA4pC8ukNr+4D2IgkZShOo61FWf
	mE7UHtai7ef488iK2tRjc1YxsTuu7eTt+IbkplQXU+w2d8cvMAgG/ct2QGosln9k
	ioRgx0GqCvw4d5QzAPS9VpHrsFfDzq60YBhPPaQd5ob5z9ZiYCKEgnC+XKxZiDH6
	0rI82wNF3pWzpwGS/Mlx6FWJDZrSSqOJR+5yPY0FckbJKbZb2yyXBo3GG4QMspFu
	feXbPOjwIOGzvCK3Tn3p1lkIAcdFtV8sp6G7muJqwIDmY7NMekT34pJcZ40NLixT
	+xPhJzQueUMSSL8sUw0Wddgwc9KAUHMXkxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au1gja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:16:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e4c29caso91928761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776766570; x=1777371370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNGVZJ0YxY25OvVufSMfmjNRi1xkCkZAU6jwz6YoSPo=;
        b=DTX3vbYEFtX8JlKPI6SMqwsTYlngB424Qtv6rqSBFBhVkP32ZToDbJcUXMtBk0QHZ7
         JteJ4ESSjDBYC7qTrrQA5DT3nN44dkbpII4z0Xash5dA5RF2KcaVC/vH7bdXQZD09/hJ
         ZJMrMOatPlHbFjyxYazWW24F3LSmXgwED8Uez36ZA8tNcOV0jeBWDJgcwQJPOd7Q/MvR
         QZ9thqLbguwOUIt8bu6+G8Knq3x2xoiJoOiX0b3zpIPBFNE0x5jxi6NmvTo/d+QWs+rX
         ySVI+ox5Whg4zL0r9fPHFak47zW8qWwatyjBJ36ZuTrzyZx3LkZjt7q45Xxz3UCxYF55
         Gq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776766570; x=1777371370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNGVZJ0YxY25OvVufSMfmjNRi1xkCkZAU6jwz6YoSPo=;
        b=SvrC0myPyPD5AyVtyMEB0g/MQmu6wv86WcZxT3jnzz7eC2Og2tUZ89ZA++AxVEx2Q2
         M4SPcmZ1i//aEgRqkg5cfwFs8D9n/diAp00CUw6U5ajO7KFYE8dcvhZl5iHI9I2fMK3U
         cchCrxUqoWKuslQvogM3+FkgFXVlx/KlwSz5vakKHN3YNwW90x1ffUcdpzn0Ogg1y+1M
         ZKcNHaSHIiNziDYv6cniC+zEtUhG9ShsX5ydzrQyuIABesemTZ1AmZ1v0bChwfm+vVwc
         4160qoZqI7KUP19hYtqMgeCKUl5CsAf5T+lFUv1SfWBHLUmzU4lEsxEXAWMTv3dnw6gN
         cv0w==
X-Forwarded-Encrypted: i=1; AFNElJ9XSuAV8qwmxnyzWOSu69CLztC3mkQL50KZk9rHrGWxK+RWN0RYPP7fe6MB3qSqiHlEeg7UyvVc5FozQuPL@vger.kernel.org
X-Gm-Message-State: AOJu0YyYz07OVL7oJo9N8y8JjIQ4aDSXpGbbhjyLrdsLCBTFb4ssk+Qy
	6dS7uDbXAEUBlA5RKAqlXKFnBdbMmAzr6hMIexkeOvjzextFqzgyorjYbBonAAs27vu4pe6CHUN
	Az8FrSLXCqVeODR3VaIdXnI/2uCsMhonwOLqIrITOItTm3P9Rg9E7jgLCI5mcoDmkl74t
X-Gm-Gg: AeBDieuQv4RYpDKBZar05wsNBDz851A9aCUuASI+yZRRxMCIJY7xX6VXNPb7AHnrWON
	XtcMvARwSATWtw5KKYFQIgNKxkjbGbCqOTKVP0mvsgdglUZqjoKnoKKd4hd6tU2p1WRLRnG68wo
	bwbTsTEG/JpQqn8YG7uP3cr0frZhqLRRmghtRWQf8Ug5fSzJLjOly/Xv4e80F6e7IDHHOtzRiKn
	2UV7328KUD9euQor4FH/Pn6MRid0uFUX67iBFyk5+Y74TTnXOe2BIs8yboM6n70imUvxORxGdO2
	Wz4BF8beYPVuBR0tneo6TykeM7qI8IoGunhSGCogLSvZhhwgTGss52t964LclpSBcaUDCdqvr7D
	zmvxlv84BugVZxUihgj5J2KLrmQ3+3FVD0NCQkddP6da0TsR6YyBydYJmCApRCjvZwsOa1OV1LJ
	S/rXGcCtqkZQ4iXplQhEU=
X-Received: by 2002:a05:622a:82:b0:50d:91e3:b668 with SMTP id d75a77b69052e-50e36bf6b6cmr246921281cf.20.1776766570465;
        Tue, 21 Apr 2026 03:16:10 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:50d:91e3:b668 with SMTP id d75a77b69052e-50e36bf6b6cmr246921011cf.20.1776766570056;
        Tue, 21 Apr 2026 03:16:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:34a4:17b9:744:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1c38csm424875066b.41.2026.04.21.03.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:16:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: add USB-C controller and connector
Date: Tue, 21 Apr 2026 12:16:06 +0200
Message-Id: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMSBTYWx0ZWRfX0xD+z7CVXzBA
 +Bz3EiLeo3LfMgwQjBqTfSxATgQbrWRdYFW4+imesVuul2VrTTrwMrikQuyRUTnBI2GKBJ+FJB3
 LDNtBCXHH300fy7gKnYFF3IvAL97wcw4EK247kK0O3Ygb9rZ1POUDBo6dzeWhqq/CX56U7IlgNz
 qDXSzFOEi14J8hhmzCRIvlJ0TG0r2Yuswrw/GIxRBgcSjV2vqsjPCFiIKCykR3Psz88WE+TiqwN
 9tcO5r8HIDrNWVIMIRJdOOkjA9CDRlC4mLs/UdRb0DA1UY4nT6bDq0b+tzvAfQ8e1UEHrLElipq
 vl0f69RdkjRp5BWdeff9c13ie7dZ96LgIhEMuZ99aJtJd/zsQ4DJ4sE2tK1Z6KtkOX0lTpu+vMS
 uVyhgPphQra08YO4uZO+Mub+3DTF/0xmxYHZLe2acygEI2t7l/EOpqa6E6LtLBqc1ZAoju1hxZM
 1ngRrH6TrysusehXwVQ==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e74e6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=CL9vroWOvsCo93LnfqYA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: G2n5Ti5iKYDcO_QqWgX__xGrRRy9u_YE
X-Proofpoint-ORIG-GUID: G2n5Ti5iKYDcO_QqWgX__xGrRRy9u_YE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210101
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	TAGGED_FROM(0.00)[bounces-103916-lists,linux-arm-msm=lfdr.de];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.403];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.8:email];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 060D4439746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Cypress USB Type-C controller and associated connector.
The controller is connected over I2C12 and wired to the USB1 DWC3.
The USB-C connector routes both high-speed and super-speed signals.

Enable dual-role data and power over the USB-C connector.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..cac081516844 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -245,6 +245,46 @@ &i2c12 {
 
 	status = "okay";
 
+	typec@8 {
+		compatible = "cypress,cypd4226";
+		reg = <0x08>;
+		pinctrl-0 = <&typec_default_state>;
+		pinctrl-names = "default";
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_hs_ccg_p0: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ss_ccg_p0: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	max98091: audio-codec@10 {
 		compatible = "maxim,max98091";
 		reg = <0x10>;
@@ -392,6 +432,12 @@ perst-pins {
 		};
 	};
 
+	typec_default_state: typec-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";
@@ -458,6 +504,14 @@ &usb_1 {
 	status = "okay";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_hs_ccg_p0>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&ucsi_ss_ccg_p0>;
+};
+
 /* Internally connected to the MCU (e.g. for DFU). */
 &usb_2 {
 	dr_mode = "host";
-- 
2.34.1


