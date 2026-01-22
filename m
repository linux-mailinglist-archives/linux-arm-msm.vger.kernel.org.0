Return-Path: <linux-arm-msm+bounces-90153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPjtIovwcWlKZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:40:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CE64A9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4DE9F52AD4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7583E8C5C;
	Thu, 22 Jan 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laf/QqBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ay0Vct1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885D63D669E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074177; cv=none; b=S9pwsQfntLgEWKCmCqHQJQWfT8ui56K2P3g5r1ZTtL2xjQsso/1oPrqFz9DsEqrDDIbuvIolE+JW+lbQuJm1xB0ktrDnRledWQRMuxQFe3ymmoH4E7a+QxBVYVbUPXLnluHDbRt0QDa30a4lR6zQp6uLWNA77D0knDobaCYRFWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074177; c=relaxed/simple;
	bh=oRKZqK1FP6N75hwnAoVdkW2YX4a2y1ykNd3us2G+tzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ERL+RkLXgR0/cJXghKnBBS/ekBVfmFNlzxUIm/Wtgb7FTm7bYEWgSyKktZqvt7otM78PHqhEJL8T0ziM2RkCGaJwoNvVvq0G8NPPsDaB8Gq5zlnY8NnVJWjKe+XCtS6MKG58AtzEjtBNFJCJk4BRPs49NebVjgKs2dRQUILkgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laf/QqBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ay0Vct1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6rcRA724829
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p5yf7jdT8vi
	mfZOvvscm/Z1IVEImEwdEsdOy6TjF2MI=; b=laf/QqBRpwoGrYtm1b6AfeYRp0A
	l3hH8Oq7RU7P+33e3oibrT7J0f7nebzrmM8BzfG2vixwUXeKqDwsR4nvJUYoQ8bi
	lNSinvPIq8/+qb5cdwSGJ8YuhzfAD2L6845vJ7ySsGAXrv2bbhK+z0xyUTOB7G+J
	ybyW7VtjhS9y/c1xgZluyF4irWvyirkjvkL3Wh2Ok1Y/d1Ig1gZqUjJU8ns8EJ1z
	UexnPB3YPhN1IPH3RhfayEJusn9mp7T29d9nVku1JEOiJy4rK1nGeUCWFoz+FOMf
	q0bb4sHQwHOy2bH3/3cisnhnrCfUllxQSmgzZbTZIDiYq+seQhlXgljioew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgfdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a75ed2f89dso7402355ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074173; x=1769678973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5yf7jdT8vimfZOvvscm/Z1IVEImEwdEsdOy6TjF2MI=;
        b=ay0Vct1RKIf+tfprFXvk+5TyrmxIgbByf+DEvG68G5TnOEDU4l1QMLhvM0RkzR3R6Q
         jhIcFdqGJ9tKHk1csb//ZX/2qKmCINQPLDiFbXwXb4aHRO2fbLRMNElgjss1ryPgPobi
         LxFsluZ3Fo6HU6q504JLseX4d/s2hnvF0QWEuLu2bs/k1ayeTI30bXPvQrbrn4KXMRCL
         C4SXqzTCz9zGavGLoEY1txXeNNosvJsZwkZ+jFPowsvMI3PQhHdEXrWviMi5809Jh+fK
         sV5MHBV/0qceulO2fEyfUzhoztUcHJALNtDjrzpVX56NaJVhkk/fKxoOaa1/i8sEQBtn
         orxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074173; x=1769678973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5yf7jdT8vimfZOvvscm/Z1IVEImEwdEsdOy6TjF2MI=;
        b=f8pi2+IWHC6ru+/6Sz/byh7HZdegkVEhiAWbwf8l+5DaOwdWnP4XOUI4l4MhY+gXT4
         nQliharJGpB17l70C5pPKwbvOy1EkVazXA5fLzRc20DbbGJ2dAJsNeiiMOi7lw4lyON4
         Jax/jTCTnLbihpA68h01WKHXhKdoozgX1aUFCG6KA/iB3Xb/GiotFroxzlfxileU50KP
         D4w4fGBorj9EbQYP6JjdFwZpGXHVTdtt02eOHGnUSAMstnEz4NX74xFYvkpXGxS2JaeI
         Je1BTaGM/225yTjYVQnWLgorwmYf4xr/sHuRmwwgLe+ikluD9dv0zbruWyGOt7cda/1z
         9iAw==
X-Forwarded-Encrypted: i=1; AJvYcCWiZvvCj5xrU3yDp5LXJDtkrq1l5ILNpJ9CDd7r6Ga4leXSCIJtfTmEm19oSBxMSlwPlXN0NYY/s2rRfSE0@vger.kernel.org
X-Gm-Message-State: AOJu0YzwOJ4C7DXwalaXEPK9H4tp9HjiGwtjCrEbgVRpDxw2ATCXGQny
	UpbMjkNO05m05o9AoLG3rSkY5fAvxCAFFdzYMI17f7iZBDNt40jtgZYi4jo2BWwASXRT6FHGsdW
	ieiJac08RrYUdClh/lmYQU5tVmQBjMZD5K5M6vF6C8dLtgg8I5uwy0W/i4awj5ekFm0BI
X-Gm-Gg: AZuq6aLzpLAwwZxa/6GHm3dLW5pJIVCJXEMolJobYSjFFZ+3EHR6lPiATb4zG3GuEWw
	n8XD1denZ+lxXzyjQgabP4vnb6b2EbFKWi5Y4YzsrSHRBS7QA271Rnrwo+YGyBmPVV/k0o2sbBp
	QPReCZEHv14CtnZvOh5Nrmf5cavQ/YcHvfiv996xnmKVVj9ZPQwu6bC05sGRUKkcE/4uqaKtXbh
	pcIEtlXWBS6MIrlkUwe07VDmBOzOicTns/WK+8GVsb99HMv5omhbkmeAmx+OK9VLjc7X3JVmq9O
	ij29fWYQWzD/dTJuWgZMDpHqZq35K1/635IKOQZEHPn/N+VDXXjPwTtxG46fK9UW0KoD9r5o9I1
	sLjkEoreNTjN49lRqgbwewdrsvuwF0s5Sc3aYBLavW5M=
X-Received: by 2002:a17:903:1105:b0:2a1:3ee7:cc7a with SMTP id d9443c01a7336-2a7188896ddmr194997405ad.17.1769074173344;
        Thu, 22 Jan 2026 01:29:33 -0800 (PST)
X-Received: by 2002:a17:903:1105:b0:2a1:3ee7:cc7a with SMTP id d9443c01a7336-2a7188896ddmr194997015ad.17.1769074172772;
        Thu, 22 Jan 2026 01:29:32 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm17395247a12.27.2026.01.22.01.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:29:32 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
Date: Thu, 22 Jan 2026 14:58:52 +0530
Message-Id: <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rTCfCOYoOiuSspNWmtw0TFlnpKei4N3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NCBTYWx0ZWRfX1rbnPPHevuTn
 uIWgrFOSA9Rw+OFpbIAEsl/86Z66sa2PtFJBX/wjuDI+skBE86XyM+Xw0LNCOJB0WSoDW1iE390
 i3woBH7ANPEVivnXZPIuPRxHXU50mfanvPekABEfODG4XeppmVOlwqTHKOBI2+DWT7fGVaLZ52J
 p7NFzdQoWzXkTaTHsV4rMjwX9fujQogAsx6EC0yjn4abYN/oiSsGsRSvLnoTKWTbJG352bNJLkB
 5r9wJ241rplo0+wYu8eMhAuozO6ef6QVbR+60Vz939YrQpZaTM0mqZY1FU1zu5KGe3rKI5VKjPL
 6YC8HW/73bYkDDQVMCb8JRjo+IUt0MPtpwy2C5MypDkMg9BusqLLUll24+CcyFO/7u6jqpiPfLw
 omUbziO0MXjM8RZdi89nL7Kau0ItMOP6jNzhs61pTtFNV+a2HhXzpx5u5Iu8hRBIb1XINS5pM1b
 eQn1zNvENRxrMCbKkuw==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=6971edfe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6A85_hAfsEMDmSNDHIoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: rTCfCOYoOiuSspNWmtw0TFlnpKei4N3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90153-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.4:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.2:email,0.0.0.0:email,0.0.0.3:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.47:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF8CE64A9E
X-Rspamd-Action: no action

Enable secondary USB controller in host mode on lemans EVK Platform.

Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
having 4 ports. The ports of hub that are present on lemans EVK standalone
board are used as follows:-
1) port-1 is connected to HD3SS3220 Type-C port controller.
2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
for Bluetooth. This port is to be used only if user optionally replaces the
WiFi card with the NFA765 chip which uses USB for Bluetooth.

Remaining 2 ports will become functional when the interface plus mezzanine
board is stacked on top of corekit:

3) port-2 is connected to another hub which is present on the mezz through
which 4 type-A ports are connected.
4) port-3 is used for the M.2 B key for a 5G card when the mezz is
connected.

Mark the second USB controller as host only capable and add the HD3SS3220
Type-C port controller along with Type-c connector for controlling vbus
supply.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 074a1edd0334..a549f7fe53a1 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "host";
+		power-role = "source";
+
+		vbus-supply = <&vbus_supply_regulator_1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_1_in_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_hs_in: endpoint {
+					remote-endpoint = <&usb_hub_2_1>;
+				};
+
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb1_ss_in: endpoint {
+					remote-endpoint = <&usb_hub_3_1>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_1: regulator-vbus-supply-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_1";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_1_in_ep: endpoint {
+					remote-endpoint = <&usb1_con_ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_1_out_ep: endpoint {
+				};
+			};
+		};
+	};
+
 };
 
 &i2c18 {
@@ -699,6 +781,14 @@ usb0_intr_state: usb0-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb1_intr: usb1-intr-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -868,6 +958,12 @@ usb_id: usb-id-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {
@@ -922,6 +1018,118 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	usb_hub_2_x: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+
+		peer-hub = <&usb_hub_3_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&usb1_hs_in>;
+				};
+			};
+
+			/*
+			 * Port-2 and port-3 are not connected to anything on corekit.
+			 */
+			port@2 {
+				reg = <2>;
+
+				usb_hub_2_2: endpoint {
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_2_3: endpoint {
+				};
+			};
+
+			/*
+			 * Port-4 is connected to M.2 E key connector on corekit.
+			 */
+			port@4 {
+				reg = <4>;
+
+				usb_hub_2_4: endpoint {
+				};
+			};
+		};
+	};
+
+	usb_hub_3_x: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+
+		peer-hub = <&usb_hub_2_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_3_1: endpoint {
+					remote-endpoint = <&usb1_ss_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_3_2: endpoint {
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_3_3: endpoint {
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_3_4: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
-- 
2.34.1


