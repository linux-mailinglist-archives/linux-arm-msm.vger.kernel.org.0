Return-Path: <linux-arm-msm+bounces-95062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKlWLM6YpmltRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:16:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C65E1EAAAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B5123069DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D34A388390;
	Tue,  3 Mar 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMUjOLPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVGgNYj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFC387351
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525281; cv=none; b=M6j4HRMrhJU1fOxbxiuOU07IYQtd3z2LQCpvWxMx3BickDkyQHq+8G1tzArj1uRjFfdwVimB4+Hyz95WLFw1q6pb3Cr2qXRd7r77UQvTFUS/cwii/mq5dO94hqFayAK9pf0pTzfOVLuW1qvcrxHEnrYRlTnz2Jvhr5EWn8VpXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525281; c=relaxed/simple;
	bh=BnCAui6Ioo2mipHq/n6w9/7hXXUXw5JsFLTTwkZj89o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UGQASrlABC51UscD10fj3iRk1GAmdO7xT64ZayyXmfmcrq7Dc/4Q2yGXIN7+4Y7bVvg2OsIOeDy4DkAEZWoPy9Cp31+tj28El6Pvo0veSymA6ZhlsxPuKXyilVvRjSVa3gZZFq0Kc7xut2TQI90XuoyYx/I585eLdOnn6eijoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMUjOLPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVGgNYj6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236uWJC2048909
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uDb8jY1w54z
	dMrAJYkowRoqpBXmh+IfOvP7lxQOzp9E=; b=ZMUjOLPHUWAylxy6RuqJouSW/kG
	jXe8asCojzvMZzVjTZny2Dy+hAX/9BYpkqiUWCi2Z8/0IH6WBkTwU8LmOc00ZiHB
	cKDxJrK7ZpFXA6OdRzwXHa+S/z7hV6DtlppjkTgXT2LXHe3vo6GkvosavI+x9e+x
	nC/igOq4qJPqBAHq8C8Mzvip/PDTovK7lvGEN85Al4xS0H6wh1ahIoG4bITbaGiw
	9RbcgHPPRUhaHNZdS12tHG3BxR6idcfl6v0rwBGb41EhiX++iy33wsBfWyKIvjfK
	SK+APIJ5oNPVhiwmGin928PfX5TTEecZgQ1MQHVLvOzVIVDyS47a/ZKhx3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfu6fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:07:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso4745550a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772525278; x=1773130078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDb8jY1w54zdMrAJYkowRoqpBXmh+IfOvP7lxQOzp9E=;
        b=gVGgNYj66kcJeltzpG5XyzIiatMwMfDDi480pwkAmS/YctlbbZ04J3g/xJ0Vij/Yk5
         lCAvnoovASEk/bDZrJR8xgyMgdq306y4hDRZL3x+ZhKuK6qMq5jsT8eLckSzSY0/Kvlo
         SPYAPmy8mXCJnVdB+RihvR2YqtFWfec3SbZFlnzDBir+xB/f+/TmUiWKDzNkTlih8kqi
         SgVvlQrH4La5clBLqdKTkSF5HMoayfooZjaiiRoEd7zb/lNRvGPPFK+1DXo1wKBPqNm4
         mj2HK8LpjYCzdHNE2VGmbnnu4Q3jsQWPwHwYo1/9L+iFDkt8m56s4PtfCuxF7eUfpGy3
         kuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525278; x=1773130078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uDb8jY1w54zdMrAJYkowRoqpBXmh+IfOvP7lxQOzp9E=;
        b=oT9EaMK5kc4mKBWDnnvaEaZr2I3gOTqdOiQi5yy9t56kerk0h1hKAuWRdhsB7w0YIi
         jWbd1QmfOUNKn0SfxEVmcTUkWMWq5vcdmunOyp5cByOCYhlblIZ2Yez0Zsqyz2Cloimm
         EZBs/OQ9ZoytjShET+zXTW78EWMfPrBzQqMMJn69in26UTkkCrktZe4WllfRbcQiBmMI
         029hAHsSx/KqozQNPfVfXhqSCTBwzCQ8RybJV4dQkuqSU7frDR7+SHG4KuhmJ/y8pMkL
         K01bee//Bl45A/BpE3fXPvxV+phpCgTnvj/98CwKX89rkQAib+dlOHcLIdfskpiLGBAJ
         i3/A==
X-Gm-Message-State: AOJu0YyCDKBLNrY28nDbDToN9pjftWcWBlfQIUlZufNTLYUJ9P/8adBk
	k97IpOvpPcVvxt5RVdad4BKGSjVc8MU9BaNwHVY28rdnNQ8txL3BnQu67rZaFVZQDnL+QlJDFVC
	2WSvjWlUnYqOfAbsqc2kb9k0c4sMD0jcSHqftGTzP9Jtj51uu7Qr5a1tpPt1S+h0XboCe
X-Gm-Gg: ATEYQzyWMxM8X826GYHqfla6quc9RJKCeGwQHCGJXCL0f5of44hEbeWDA9K8O+SQx+b
	Hff8B6EWh5k87RAZ0bFhHz/bjRH11Y7COqj2pRIvS3mjy1SpgzzLFRkwPIX7h6hKPix66esZElo
	pEX24WL2SAP0dT5F3xZc7CuMGvqiNRUV1dIvlxOmWvhhySIgC+xvoj2z13M5dYvqJloDNe8Zinx
	4c15WHLrvYYYjjDuiCyBpoHSfpMElW3T8wwGAPSMxoE2FuyTrRj3gPMjiQVWgxNi4/ogLffJmhq
	+8qXteYb4NNtCkJ0Y20E+7I54TS797YzrnghVY916nOK7ydnM5fHzy98yfmkdn0zbBjQhESXwMA
	98gvyaRxedImRU+RAczMaybGPhWcXV9dXH9FOnbwtH3rm/tbpvAXOzc4=
X-Received: by 2002:a17:90b:35c1:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-35965d1d6ebmr12388768a91.35.1772525278551;
        Tue, 03 Mar 2026 00:07:58 -0800 (PST)
X-Received: by 2002:a17:90b:35c1:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-35965d1d6ebmr12388747a91.35.1772525278049;
        Tue, 03 Mar 2026 00:07:58 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm1445883a91.16.2026.03.03.00.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:07:57 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary USB controller
Date: Tue,  3 Mar 2026 13:37:28 +0530
Message-Id: <20260303080728.479557-5-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
References: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a696df cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3B0ugXEi2WB0otU2hYkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: EARcPLmCHdn_Vjkdk0jbNagdVaM3pl3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OCBTYWx0ZWRfX8ULEXMdWoFVL
 axJVTmoi88fr8ZC8a+4iBbHNhrw2ykWpDaBW+jBIbicqw+PZW1aV+r/VZxTJ+9AYVD6T+LUzitz
 ncgw1DjL7snjSMOrwVjcUGrgQ3ohwMtb9B4jsnm903RjIwPdhbt//LyIlMnWDH7aI9hZV9e1MUv
 VvfB7e7YDKgu8OI+0pTHqAGORYj9EL6k/cTvpnaHDKwzsItrmV8KMGO+sj3oo5n4oYSTD8qdo9Q
 0+fw1qbSRjQvehxR3QJGBBjjVrU2msHSZedK8dX2VXeofLl04g8fPnO5LUp6naX0tA3JfJ0BfLl
 5tFsNx4DsSzcoDbciECstCE5hqwjwleOPg/ap6g/TOtjvG+fd0kEXnbWWg1jwCKkQHdh1EEeGT5
 i6hb+e1K8L2+s93O4DYdR7Uf7BQ7NlOp4VpBEaoWlyP1T1pUj49byUTa/R99MAEB+wrxxgLS1TG
 gy1Zj7xwVOFUOHJm6aQ==
X-Proofpoint-GUID: EARcPLmCHdn_Vjkdk0jbNagdVaM3pl3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030058
X-Rspamd-Queue-Id: 2C65E1EAAAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95062-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Rename vbus regulator for Primary USB controller as per Lemans EVK
schematics and in sync with tertiary USB controller vbus regulator name.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 2203967c7d51..a1ef4eba2a20 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -44,7 +44,7 @@ connector-0 {
 		data-role = "dual";
 		power-role = "dual";
 
-		vbus-supply = <&vbus_supply_regulator_0>;
+		vbus-supply = <&usb0_vbus>;
 
 		ports {
 			#address-cells = <1>;
@@ -151,19 +151,19 @@ platform {
 		};
 	};
 
-	usb2_vbus: regulator-usb2-vbus {
+	usb0_vbus: regulator-usb0-vbus {
 		compatible = "regulator-fixed";
-		regulator-name = "usb2_vbus";
-		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		regulator-name = "usb0_vbus";
+		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 	};
 
-	vbus_supply_regulator_0: regulator-vbus-supply-0 {
+	usb2_vbus: regulator-usb2-vbus {
 		compatible = "regulator-fixed";
-		regulator-name = "vbus_supply_0";
-		gpio = <&expander1 2 GPIO_ACTIVE_HIGH>;
+		regulator-name = "usb2_vbus";
+		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-- 
2.34.1


