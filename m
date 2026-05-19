Return-Path: <linux-arm-msm+bounces-108534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBdRKDB0DGqihwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:31:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8735808E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F95A304E33C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C55E4028EB;
	Tue, 19 May 2026 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdzvfiMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuV5rd6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7934028CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200716; cv=none; b=vGn0ThZzj/L/jzuQfi3iU0N7tIrrFXBHvBJCUPFzssUN/jDc0Hx7TqIHJwNBIkXqwDDQKjPij4hjKuO1QEaBcvMoBhoJUBM3vS5qnlut0+pqQZeQ+bp0qfoiXQSXL3sv6/pxKo2ITGiQzHM9v+HbJAKdgbCtTaNGIdoKTcx6QqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200716; c=relaxed/simple;
	bh=1JgAE+H2TYQZ0hn1cQ+7hGp3mtswKFmNa7SuysiHgbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q5jrH29ncCan1smRNikKfCAX7ky1uTcXkjNMQ76d6nFmNu6mgGQ/eBRHMFuN26XNkW9LOkVshUpfevKIE8nOsX3YZhFbu3IVaUepx4msM9q3uTfPqd84y6zSNOSHIcX4dlcg9Ij1qVgGu/yhnpcatTBD7yNsM6DL1lRXErtCJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdzvfiMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuV5rd6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCDhZB1737092
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C7Equ0yxlu0MdQOY/PqtdW
	6bHRt3KS2U3fNAjGqperA=; b=OdzvfiMPNLUc44+M5HNAAM1oM3E8W7rY3L+mHD
	cNTPcza3k+aflRlsWekDY9Uw9DyOYi6+Ucw2HVPGFYFsCDJB9dqHztMXfjwlV5PB
	nbAjgpDZqpJbDvp+bnW1djPqWVP0lL/S+tH0zlKEP1U+/L/EExNLvUd4SqjQVfAz
	loT6SmjPnIRg9u2S1pPGshhwz33x8bUqJL8HmKrN7l7R449WxG87HhGuXTEJPjLa
	oB4OXijaFNkpnRnARARo9PMTE1auon6WkHrtQCKWJO4FzJabiTwE3xPAhc5ORfVf
	PQVqUBMiWKbpIUjPmokqFBq4l7Poal9847FuMJ1ON9/Xff3A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91vbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:25:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-135916eefa0so16774600c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779200712; x=1779805512; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7Equ0yxlu0MdQOY/PqtdW6bHRt3KS2U3fNAjGqperA=;
        b=YuV5rd6PZciftYGB/4oq3bqVwt2UMwoOIumNXJJoSJjDiSyt9rmYlG1+gUYkYGXtXY
         hWigXDyHkDnHXGXigbz48ypWc4w0vy/50t7ErFY4DaZ4ISc8GxSa2TsaRpERFbV6zJlU
         48A4GXhpDj6Fsh5YY6CRW+1oslyyY/McQdPSxKO6sf3wWlpIxv0trb5RHxVZs5UJkb6J
         7RAqhEf1w+I9XAu2+sWHB4hXj4U6aFXX9h55Iq7l5byECkDo9uTqHakS9fZHcOfl5UpP
         cOh40TW7toA0Ng97rupZHiDAc+nG6fAP17k0cSqOkzBlxgaHBZr4mHv5Nd9bupvYvX/V
         rU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200712; x=1779805512;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Equ0yxlu0MdQOY/PqtdW6bHRt3KS2U3fNAjGqperA=;
        b=T9wN+ZmmMg6EetOx7uwFdTjzL0sprkOWxqRqnubX0dGvGVLPR0T5uqBHFoR4BoRfmA
         KH50cRN6aaeUoKrYOVaAI60D2n4l2ZhBnyjB6/9BZ3KMkyoJepO9m8BdZFeSYyj9JGis
         hGiIOE0VtZjDnFBeWW21sw7MnD2pvBCQIYSY4SvRLqJZW21q5udseS9lxAJq7aanzo+L
         izghgGUupgKLYTmlR6TGzKh5oUwDTHFSuDyVglQY7w1Ol7sIJddUI9J9Yb/Q9RKzv7Ik
         kbLueaGEEHCh4zehEDulSEhIJY6FmvTkVWBv4f6CF19V0hEDrvkeE77Mpb/1m2Xwus6F
         0Yhg==
X-Gm-Message-State: AOJu0YwtxNeC1HAjJuZ8hI1uWUb1Zr7d3UD7/tu4tohuFGmDT53Y3TKg
	aNvrcPzIRSnqC6QhYWW4q0KOmgcNExEiQeEpMu7NytymGvSJ/SqXZb5Zgy1es9LeL6FzqS707qx
	rfaZ2A0kEIEFCIMKAu2z2nq6UZf7NfkNYMblZFD70xO0IafQfmB5rqOb+okqRv+4bRt0E
X-Gm-Gg: Acq92OFkNVmJ98hZ3eCuHG7IAnJ7o1WkfkqxbKfofzwFUfQZw+MMIB9WXanvYz9zqvk
	+dZg13dmp1BwyK6hWlucmXCS3qjcGyUbr4O/Ca6QsiHZzDFnA4oaYLRe9xGPmIuYDHooR3of/YK
	/PlMouqlnr4g4Xif///gT5vQInJSxp8X8bdLgRhl60nf8/K6m3ckWoc7Vg7/196I3S5FUC3kYH8
	wymNn8+AXieXuh0nTMTLi7mqbunMoaV4z39od25BLqWPZFKwqhw8LiWg4asTWQOIZdGy1sBSr0r
	Z75Kgn5lQyVffdhCnZ0SxHowaIrImT/uFs271IEDZRZpy7HwVVvRFL5Tqm4Xy1nWA4/uSUSXHPv
	rWcYdERSCEjyVyWR5Z2E8rBQfPl4ltcFyS+XuTo+fY3J3w+4lrDOyL6ojHV0HuBYAudiFAS067A
	2yH5bIkViikg==
X-Received: by 2002:a05:7301:608a:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-303982ac591mr9357994eec.9.1779200712055;
        Tue, 19 May 2026 07:25:12 -0700 (PDT)
X-Received: by 2002:a05:7301:608a:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-303982ac591mr9357965eec.9.1779200711490;
        Tue, 19 May 2026 07:25:11 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm20765333eec.17.2026.05.19.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:25:11 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 19 May 2026 07:25:07 -0700
Subject: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMJyDGoC/42NUQqDMBBEryL73ZW4FtF+9R7Fj6hRAyap2SoV8
 e5dPUEZGHjD7OwObKI1DI9kh2hWyzZ4Abol0I7aDwZtJwykqFA5FThMm1siOj0uGtvgXPDoQ2c
 Yyyrvu1KJ2gbk/h1Nb7/X9qsWHi1/QtyuV2t2pv+srhmKqGmoqEgZfX8G5nRe9HTWUjGoj+P4A
 cfU0v/JAAAA
X-Change-ID: 20260326-glymur-mahua-common-nodes-893fd80808cb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779200710; l=18517;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=1JgAE+H2TYQZ0hn1cQ+7hGp3mtswKFmNa7SuysiHgbM=;
 b=6PzxtXrdoyIZVcK1orF4tphhvNDO3u3zs1WIUL8rB7mPeF1jgh674iDDhlKrKdrFxD8/J9DFg
 T+SOY3WklzECjnFUxWnb0PV4lobChm6xs83Vp63G2D/jpkDfj/BpFYS
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: CNXNIzvuk7-59cFHAje3TcR_2sDm552r
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c72c9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGdizXfL7dkd5kc_kBAA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MiBTYWx0ZWRfXwjPqnzMUYOj7
 Jb2z04bBy/cpQfOESeq4hg0KvnwNa2i2fDbDihLQ3XG/sndWV/udjRzZwswSgjMACupvMxn9ICV
 4JmZT85O2rURq7yTyEFDErmf1Z/muO1LShPCjXOn2x7lKDLeokaMBUMqDxE/ex1GEQjoFdc1EX4
 l312F8cZQk12p/9fGJZQ7rRf7LABTl6F3gy3ke/BxDJQKQqunX6UhZaxu3pOsE2Qvf/4Ob7HpKT
 NIeVgfiBC9TXzM2g8W5wwAdl924/vGRM2Kgi8i1DetEQaJkmZ2PdVfZGtvKO3r8u64bNafXmMY2
 WBfvcH6GmV7NVAeBhGDawmh9SJqAya0Cno3DYce2YULo9Yq5D8S+23Me/yop5qjEav/YVkKLMTI
 JRrkH4rDKgfdLHpe79iBuiqvCHlGGgmV1gXlvOobt2icBWFVV2+OnksYHdE6MGxl2VTaPTs4Q+L
 zctZUv4gIXsKXelGmTg==
X-Proofpoint-ORIG-GUID: CNXNIzvuk7-59cFHAje3TcR_2sDm552r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108534-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.38:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED8735808E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Glymur and Mahua CRDs use the same board-level hardware for the
eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
HID peripherals (touchpad, keyboard, touchscreen) and their dependent
regulators and pin control states. This has been verified against
both CRD schematics.

Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
reuse with the Mahua CRD.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of next-20260518
- Updated subject to include glymur-crd scope prefix
- Rewrote commit message to describe the actual shared physical hardware
  rather than the code-sharing intent; the commonality was verified
  against Glymur CRD and Mahua CRD schematics
- Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
 2 files changed, 396 insertions(+), 399 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..6125617de82a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -8,198 +8,9 @@
 #include "glymur.dtsi"
 #include "glymur-crd.dtsi"
 
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
-
-	pmic-glink {
-		compatible = "qcom,glymur-pmic-glink",
-			     "qcom,pmic-glink";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss_in: endpoint {
-						remote-endpoint = <&usb_0_qmpphy_out>;
-					};
-				};
-			};
-		};
-
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_hs_in1: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss_in1: endpoint {
-						remote-endpoint = <&usb_1_qmpphy_out>;
-					};
-				};
-			};
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_misc_3p3: regulator-misc-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_MISC_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&misc_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-};
-
-&i2c0 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchpad@2c {
-		compatible = "hid-over-i2c";
-		reg = <0x2c>;
-
-		hid-descr-addr = <0x20>;
-		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-
-	keyboard@3a {
-		compatible = "hid-over-i2c";
-		reg = <0x3a>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
-		wakeup-source;
-	};
-};
-
-&i2c8 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "hid-over-i2c";
-		reg = <0x38>;
-
-		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-
-		vdd-supply = <&vreg_misc_3p3>;
-		vddl-supply = <&vreg_l15b_e0_1p8>;
-
-		pinctrl-0 = <&ts0_default>;
-		pinctrl-names = "default";
-	};
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	ptn3222_0: redriver@43 {
-		compatible = "nxp,ptn3222";
-		reg = <0x43>;
-
-		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
-
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
-
-		#phy-cells = <0>;
-	};
-
-	ptn3222_1: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-
-		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
-		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
-
-		#phy-cells = <0>;
-	};
-};
-
-&mdss {
-	status = "okay";
 };
 
 &mdss_dp0 {
@@ -217,213 +28,3 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
-
-&mdss_dp3 {
-	/delete-property/ #sound-dai-cells;
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
-			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pmh0110_f_e0_gpios {
-	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio6";
-		function = "normal";
-		bias-disable;
-		input-disable;
-		output-enable;
-		drive-push-pull;
-		power-source = <1>; /* 1.8 V */
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-	};
-};
-
-&smb2370_j_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
-};
-
-&smb2370_k_e2_eusb2_repeater {
-	vdd18-supply = <&vreg_l15b_e0_1p8>;
-	vdd3-supply = <&vreg_l7b_e0_2p79>;
-};
-
-&tlmm {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	kybd_default: kybd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		bias-disable;
-	};
-
-	tpad_default: tpad-default-state {
-		pins = "gpio3";
-		function = "gpio";
-		bias-disable;
-	};
-
-	ts0_default: ts0-default-state {
-		int-n-pins {
-			pins = "gpio51";
-			function = "gpio";
-			bias-disable;
-		};
-
-		reset-n-pins {
-			pins = "gpio48";
-			function = "gpio";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-};
-
-&usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
-&usb_0_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&smb2370_j_e2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
-
-	status = "okay";
-};
-
-&usb_0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in>;
-};
-
-&usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in1>;
-};
-
-&usb_1_hsphy {
-	vdd-supply = <&vreg_l3f_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&smb2370_k_e2_eusb2_repeater>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
-	refgen-supply = <&vreg_l2f_e0_0p82>;
-
-	status = "okay";
-};
-
-&usb_1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss_in1>;
-};
-
-&usb_hs {
-	status = "okay";
-};
-
-&usb_hs_phy {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&ptn3222_1>;
-
-	status = "okay";
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	phys = <&ptn3222_0>;
-
-	status = "okay";
-};
-
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2h_e0_0p72>;
-	vdda12-supply = <&vreg_l4h_e0_1p2>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
-	refgen-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..1de3a49f49e4 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -11,6 +11,7 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
@@ -68,6 +69,101 @@ switch-lid {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -444,6 +540,135 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_0: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_1: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna60cl08", "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p83>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -562,6 +787,19 @@ key_vol_up_default: key-vol-up-default-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
@@ -585,17 +823,47 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
 		bias-disable;
 	};
 
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -688,6 +956,27 @@ wake-n-pins {
 		};
 	};
 
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";
@@ -726,3 +1015,110 @@ bluetooth {
 		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_hs {
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
+	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	refgen-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};

---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260326-glymur-mahua-common-nodes-893fd80808cb

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


