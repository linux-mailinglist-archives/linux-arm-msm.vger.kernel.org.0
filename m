Return-Path: <linux-arm-msm+bounces-112597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ud3xD/9CKmp4lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35F66E66D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:09:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="UbtOSf/9";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kxMkP6p3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112597-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112597-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F348F30498E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68221382380;
	Thu, 11 Jun 2026 05:00:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83D382F1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154033; cv=none; b=HVF0TGHEyFRNOrNYewd3uvWOXa52t8w67Rb6FNHOBw67mjxZuI3iUbPeXSreGLdyzeoWbAhlfUFzwlvgKYi4xf73HFxd1DWS+Vn0xRFF+qjREsQXGh8UXjzCTTbdvnWLiOr0JkyYKyjg+bDdCekaky1za4wdFo3jUX++rrcbKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154033; c=relaxed/simple;
	bh=Nn4WNBnk+vDZYN/P/46/5feE9LPbfWmC4+LCo670D9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIiVFB8eHFQnnMafSxgldK5NHuQnLsNFBiiZxU+MzKfsrKBnigkzzMoclwxDqlW2Jd5eNm12I9P7fxq7p8F42GvXOni8J5DICzHI/6cW8NfGEGIiy5jDt2YoH4N6ZWrYM6hS14JYNCI1FLc+Uloeb2wbV7lxGD6Tem7G4rDjGfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbtOSf/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxMkP6p3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nm543092284
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClUx0JBqZpjolPUszVz/OxlB+sov65lgjVdTEbslsrg=; b=UbtOSf/9qYVSQmct
	ZDKvlt7l1IyWXcS6t9tIUKs6f5apS0a7ywOp+ItIglr9Hv+Mhh3yqizgqAzdl2jH
	8NQGnRE7fqExI9JElC8ZjTL0u2gEwlTEfvnkQR7EMgwsjyVS0+nTmeBaZf1QYePF
	WXNG2hDO925fk1dOi9xcRiGV2FMDtNymSZUa0gAoB+exZDLJdU8SOfr+eltGPyss
	BnOjSPBD4sdqt1OEB3uF3pF1Is9y4AmUZ2RpFI/l/I6XRcf7VTwOiwCCwyZIBJv3
	87YjJtZp5ivr4FMA8IU3VwSrMqfTp1Kn+IqbJgzhuCNEOOK2adqJVblRBQ5sR3kq
	jI2XnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1dece2ecso76394355ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154019; x=1781758819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClUx0JBqZpjolPUszVz/OxlB+sov65lgjVdTEbslsrg=;
        b=kxMkP6p3xiGsBagIk1weSY4zS63wdxuzE+vJQfDTIJgSErKRM5U+MM0fIzLnYuLcZF
         RUTT9gfEJngdTtO+/iBv84ZQJiBMKlaL0ybW5sW1iMuFjrKRUD0byz7GEABOv/+f1ZX8
         rTPK9vBEPlWqv10KFFpoA7dsPwY0G4UW8zlrtvOUdSoyUeljM/nidxYjsLCrcil9Cfal
         HNI4yMgwSNcYe5xZLQdQul6XPY9O/CtsXy6A+wfo7svHxa2EBMjnAgjdkzj2MMeIFjVY
         7zxGU33tHs3cSsRO8FRleXZSnurk5aLWA83pGGlLKOudJhOU7XxPiVYAork6aTfRhA1k
         VLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154019; x=1781758819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ClUx0JBqZpjolPUszVz/OxlB+sov65lgjVdTEbslsrg=;
        b=iQcI1qjLYBELkOaCNcBpkuGNo4/PkdHenl8r33Z3v8xCbjjn+ODS0MEdlbnQhFC57P
         WWHRRaw347/c1xnPYc4aJoChe6Veb7BGqvBHCM0VnXbq8d/CkeqVza29OVwmGJI41NwD
         vDdAOKM+21glPQM5cQWIsmyKTyG/64mkYCA0ibIla9IPOML6LX/SRTDPfQTwHE3OuP+o
         tAmzSKFkfvEJ7MQdWXZfDTNgpRRt6eMxjEMeU2SWYwF4c8PzmBy7MVPtqWCmBdWGCgeR
         PBjEVq4izZz2Qt1ViJB8EkVMyNCoK6nhB4ymyzcXQvNVa+q4masaGAVqXRWvPHyYBEIe
         suyg==
X-Gm-Message-State: AOJu0YzHqD4bi5vvezLzTrXkFKgE3ym09T2RVZYWsO8W5aoagcdO00ps
	C4iueUvth8fu28oSy+xgfd383EWN6hZYCH5x1KQ92D9uCYr5xbx/tYQAzwDhkIzqMnc0aTmLUDL
	lt2AjQeRvYAPQzyUFwMz44kM2Tg6LAg5FSOy43SlCl5fw9mDdpdF/UcKtoiyXqJptUX9/RpQ3o1
	M7
X-Gm-Gg: Acq92OHgO51gqAWAjNb42nMIwqF9TJH3lJa760+/mRpzYo3QVwNehlm6BHEPxiji/2x
	cAiVtyZWnSChnWqPEVLRV0ar+8hrSXR830O0RbygvrRpdpPVYQUptYoynRi8JwjPIqTkHA6iLcz
	rDHD3ysg8I8V+xB8RS5/QTtYeK9asJxG6jGMJIHVcWqWMWzYhQoQfGpho0aLmt7XZyx60qUjzey
	aLz7kj3sTE1D1SY9mIu587PRkR08eiMne480y4adn2F4vG9ceF5sVk2gSjOICwTFdxilm8lKTyO
	SoSPfcoFu1eequQFCvXduQEeHRgxsqLilMqa8/yOvSvtjustrSBvIGgJnAFKP8bxCf8PFbWovcJ
	hcuoNoODBaq7LygJObj62av9p8uGLNAErPqakPZ/v875qohNIP5NF6Xt0HkTYBZaGZqw=
X-Received: by 2002:a17:902:ccc9:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c2f092e387mr13778395ad.12.1781154018935;
        Wed, 10 Jun 2026 22:00:18 -0700 (PDT)
X-Received: by 2002:a17:902:ccc9:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c2f092e387mr13778035ad.12.1781154018525;
        Wed, 10 Jun 2026 22:00:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:57 +0530
Subject: [PATCH v2 21/37] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-21-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1921;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Nn4WNBnk+vDZYN/P/46/5feE9LPbfWmC4+LCo670D9k=;
 b=ZpYUS0kfPDClmsRkaV6GPGIpJJ3dt+TohuuCxLUlzTWLtMR+JFf1DPfXmz1+ELOn/jzOmjpwm
 D9tJcoTo2NDBcAt5lmT3vQfZjLsFfN7qBNPYi9uMK6hUKkUSb8PIJ0o
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 6akVaty2eVrsAfHUbwp7r1Nnyh0zGe6a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyYBmz1MuN58J
 w0pIJjCABXrYTowewIcpN9o1WtHW0rHKHfsc6a9n1wrFIA6YXdn46ugnF5M8ITYR1+nqo2cLFwB
 GRduGh7dUQ/+AcWGWBR1MBaCW0ms+RA=
X-Proofpoint-GUID: 6akVaty2eVrsAfHUbwp7r1Nnyh0zGe6a
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=w5YLtpWUZy_VJOv5-54A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX6aR5u1d7wXbO
 XRq6HMmDQaLh6wnLnV4jUsIYQjvo3f3LjDZOFHU5pyV8ZKpbPxKIKOe5JdLLnF4DYKMZ7qCpJ49
 uWoAtqJShDgepVXCEpRZm6HLt0GoCuAoaoIf7bCcAGTON775JFofugD/3BStY54IKtONgPkIq8S
 sU2bOT4Bm9CEh22shKGejmRZREcSjmSRoI1Z9LkA/vZMaeLpb+COM5v+voBw0gmBEicB5MCpClC
 a8mIpjVk3uahUQQHSQgAWA6ripCa78by2iXD38pb6ccCYvsvpI8BjlkyhkA6+E3lYpGcdUy1OJf
 PSXTrH+fS00DG6hTyNg8+i3v7LR1qqjMn7/UGDDc4RNWCbiy4fcWh++1zzKN6zJX/GYmuKAWWvR
 ZLPPa0UsYZhWbH1xmjPmOLo459zuhFQryBh9DHy5K6LTpOmN9mBc5IS1O8Jaxfrw+E9a4GzgRk0
 usHsKv6KrUzI/HXucBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112597-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED35F66E66D

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys and phy-names from the controller to pcie0_port0,
adding a label to this node to allow board-level overrides. Move
perst-gpios from the &pcie controller override to &pcie0_port0 in
the board file, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 7 +++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a22b4501ce1e..a035546a1b97 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -101,12 +101,14 @@ pms405_s3: s3 {
 &pcie {
 	status = "okay";
 
-	perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&perst_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4328c1dda898..8166ab4bf01c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1517,12 +1517,9 @@ pcie: pcie@10000000 {
 				      "pwr",
 				      "ahb";
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1530,6 +1527,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie_phy>;
 			};
 		};
 	};

-- 
2.34.1


