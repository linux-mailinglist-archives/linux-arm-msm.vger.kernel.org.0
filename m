Return-Path: <linux-arm-msm+bounces-101946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPWkJuWS02kDjQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0E3A2F96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 13:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A57E30342AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04369330676;
	Mon,  6 Apr 2026 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCdnb+ym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jmo2Gclp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7D2DC789
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775473294; cv=none; b=DSY6kFnxBBb00WSw5Z6UNJqZJ7MOCbhM7F61AMUu2lEwlwgqgDSa86JeXX9vuagsG+KA6lIJRkFoFhjX45265E9NddxO3Gf8rN0LOli8PTEem5EDz7oWJdAcj8AqKOYAFgGOsk8tFOHzybcc8Z8T748MJWVN2sioebf7nGFNfEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775473294; c=relaxed/simple;
	bh=3NRpE2ZTO4585+Hkk8YWr9b0uqLZAgk8rII+tj7rb24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cp4mv5Zbjd+k22UIizx/rRL9AKbBo26VxaKEn6J+eBkTy6/qUqIpVTGPwW8AqqeE3xNBa4lJ9Hdc15OphL/kV4ZscfSYnbmS0EhZ3t6IvujfwlPCguvIbnfx0HUKe0Tft1VSqOBkwBjl2SetFX0nynrA/jyKM5pN4z7zP8+bBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCdnb+ym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jmo2Gclp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636AmfEe015916
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 11:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3qsSloJn4EwnhjNA0sNUkm7nCERyoGh86KT+G38MqI=; b=bCdnb+ymACXpSUvy
	d1JSn9oJOyCh/SfIEr09VGgBwYDM5mgYgfGsj6w/g/zTSpZaLm8Ukzvu/ajkaBiX
	pr5UHX3BwSFqc1QKTmabfAQqynYsfNn5p9e4elZh81aAZLC5IGraamSa9ZIZzu1q
	41IW2OhoP1smveQ8ZjyCo8JUcHfJM6P2LOCUHe2ibfVa/6FYf4ZP0eOHNBjAiCOU
	Mn5fZ5s9T15kEQxvKaA0x3SSUlqtVdIbKYll+TwSJ2nzE/p/VJnoAJsdb1qYx/l8
	A/ZzFhMWWwohCIppHFKxLVmOuxt4OEdLZlM8j9tREJQxjCV+L7YLPpU6KVrKmYHE
	DkqLPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcbd6r0vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 11:01:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24af7ca99so50581515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775473292; x=1776078092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3qsSloJn4EwnhjNA0sNUkm7nCERyoGh86KT+G38MqI=;
        b=Jmo2GclpN/UY7Trk2BCDyE7KQnTQ1U61JwPh80LdghUMetXFKASVhNDUnPf05O6itc
         2tDokJyHjREx0mncI/M0Pl5d5DlR3pM43TkNhGaa6qGVgBykOJwfCq++4PrqwsxBH6yy
         lFErYVjrGKWpOKCWKANH0ESotknL48bMSmtgbNBGUOgVe8fwIPvmJt2IxsnPorO4bzzy
         VOP2sGFgO2QoTRjCE8EBu7BpHK7ygCFT+F+ggpCZXj1C1Yd8lm1sUMz5VH+8XQUEh9HE
         1PetFSI6ilEKY09KiYGZ3qDrKOPjknZLekjcABncRunr8PcK7GMBxBdrnmtbbNr8g2II
         yFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775473292; x=1776078092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3qsSloJn4EwnhjNA0sNUkm7nCERyoGh86KT+G38MqI=;
        b=bJKOS0j9+uh9EwvQDx7QkI/1+BAcD5raK7g9b6ggKOK/4RdaQykU/RX8pufrR56hN3
         LQflx3m+YCh3cyhgvuA6vNCWYdeqDL1RKRgdbxF1Q+o0/6OOB9+pWqSlq7R8cc4PXSXZ
         kHlUKsgOvB3wBkigyNRdihy/hJvGG5Bf4L7KVYbg7csh+P8EmmYOMsBuPSBW8q2Qlk5p
         OXLJr7Dk37przB/AbUHYe8coFaJcOvpJz6TDSJkX0aPq2F7h/IyF+SBYM2FqeDFEaYz9
         9PmdjYQ77D25nx6x38PQo2paAmO/4ET8ejag3DR3Lo6q1zF6V3mtx5MaLTMNTLsIRpCG
         wJHg==
X-Gm-Message-State: AOJu0YzWENijPYTwyRUUIYyjb+E8TreMyRIfA4Xx+pXrGey8WbcZl0p1
	bEj8flhOwsYjwaKM+7aIoef5XJhhogj9KLsGmMJ03JgJVcg54ROlnMXF7iimmHB/GFvLrbSwsPM
	keparExHvZ+ciDScyotk7ZjOCcovOBsLweS7lX8S//R14lUROoWw9oGaFcph/zQGbffcI
X-Gm-Gg: AeBDieuXMBLFESYVX4Bu+CL3k9qlDZU0GOX9L9hxY14bv6X+E5LeNrurP9RplgWorrF
	biffmWXUzgb3NIcUUcmCu85/GZ1q6OrNiD+7Hr+vSNKCUxzY1KInRWNebHKMHxb8GzEMJKJ1k7A
	Pow8lIDg/xYkaY2UQ1qwxUju2r1/4qzCEIJMdmxVY1o5B+aKUwAe9kD3LIT0EBTneDpGzhMvFQB
	RPaCv5EGrdjnk1+J1ETsuZjXFO8b3brJwjVGsUrQfV41U+VyjSBAfk03UxPIRi1ViXEJ03ioPzj
	M48KowaYFjrshX0sqci/qWnRgC0oFZ/Kqg4inB7UoNj1YRq5DC6M8KJdZpN7/gQiNDU9+j+oZN3
	VMRdXbrTN3z1lcSv8JV+hDM9vwzlrZnHkhFDmAXqArO3gjXRd7hH88Mg=
X-Received: by 2002:a17:903:1109:b0:2b2:51ed:4524 with SMTP id d9443c01a7336-2b2817e4d3cmr113579625ad.43.1775473291754;
        Mon, 06 Apr 2026 04:01:31 -0700 (PDT)
X-Received: by 2002:a17:903:1109:b0:2b2:51ed:4524 with SMTP id d9443c01a7336-2b2817e4d3cmr113579055ad.43.1775473290903;
        Mon, 06 Apr 2026 04:01:30 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475bc2asm141696075ad.19.2026.04.06.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 04:01:30 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v8 2/2] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
Date: Mon,  6 Apr 2026 16:31:13 +0530
Message-Id: <20260406110113.1709886-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ap2/yCZV c=1 sm=1 tr=0 ts=69d3928c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6A85_hAfsEMDmSNDHIoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ja7lErHkFpa2KpgNLoOVk8yc1wYE_Nyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEwOCBTYWx0ZWRfX9UQiMoFxgOPA
 0X8jz9ZsJK7heGeMUe94Dix+1gumeI2SY86Vhq4Ealqygnqoxd2XSrhy+O2SWNdTawlUBhmx7Cl
 /Umu4p7dfwZzZU4kujsM+aUQOVoutKSGNdd3xq/boGgW42+R2TC3nzFR1jdpOmgtHdBwFe83os1
 164l/j/F6tFH3QHtDNYXipwQtyv2ghIAcBgt+A9lLuwD4kHoN3sY/lAk/yWFQpHlLoO/PUy9ZMi
 d4yw8sQOtQk+2MDa3qDIoKyoFFweRksPsTL46f8Mak5RmeV7QjRilHLuFR+6McaZAIzWS2Y0kzW
 LnB//u8CT0VxolYfbx3OtHnbphFljjEms7hNqy0utnoN25LFTW9yNAiqK7h8IM0KmIh9XkE7xOv
 Tm5iEE436Dz7Xz7jN+TJhQ+57MGB4VJLijbmMAwPBqb/TfXhtyq07cPrgtgLFKCf1mU/WFGIGmF
 xY9uzqkwajq/gKJsdrg==
X-Proofpoint-ORIG-GUID: ja7lErHkFpa2KpgNLoOVk8yc1wYE_Nyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060108
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,0.0.0.47:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.4:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101946-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10A0E3A2F96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Secondary USB Controller
          ↓
GL3590 USB Hub (4 ports)
    |
    |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
    |
    |-- Port 2 → Mezzanine USB Hub (when mezz attached)
    |
    |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
    |
    |-- Port 4 → M.2 E‑Key Slot
                         (Default: BT via UART;
                          USB only if NFA765 module is installed)

Mark the second USB controller as host only capable and add the HD3SS3220
Type-C port controller along with Type-C connector for controlling vbus
supply.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 168 ++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 522d407c9925..1e9a7a6ea001 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -69,6 +69,37 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "host";
+		power-role = "source";
+
+		vbus-supply = <&usb1_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_hs_ep: endpoint {
+					remote-endpoint = <&usb_hub_2_1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_1_in_ep>;
+				};
+
+			};
+		};
+	};
+
 	connector-2 {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		label = "micro-USB";
@@ -161,6 +192,15 @@ usb0_vbus: regulator-usb0-vbus {
 		enable-active-high;
 	};
 
+	usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	usb2_vbus: regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb2_vbus";
@@ -565,6 +605,39 @@ hd3ss3220_0_out_ep: endpoint {
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
+					remote-endpoint = <&usb_hub_3_1>;
+				};
+			};
+		};
+	};
 };
 
 &i2c18 {
@@ -749,6 +822,14 @@ usb0_intr_state: usb0-intr-state {
 		power-source = <0>;
 	};
 
+	usb1_intr: usb1-intr-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
 	usb2_id: usb2-id-state {
 		pins = "gpio11";
 		function = "normal";
@@ -949,6 +1030,12 @@ usb_id: usb-id-state {
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
 
 &uart0 {
@@ -1007,6 +1094,87 @@ &usb_0_qmpphy {
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
+					remote-endpoint = <&usb1_con_hs_ep>;
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
+					remote-endpoint = <&hd3ss3220_1_out_ep>;
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
 &usb_2 {
 	status = "okay";
 };
-- 
2.34.1


