Return-Path: <linux-arm-msm+bounces-91439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF5aOgFUgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFDC9376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52F773006477
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAA629E0E5;
	Mon,  2 Feb 2026 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4Bp0BVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jf+2TPjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165FD2BE7C0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017772; cv=none; b=JtBLFILHI5gXk9Tgsdsi2x1/wbdBiUDMjwurJKU3iYxYq2+egsonFY2x/D8rhmOQXUTJAqvlrQK6WRDBrLOMusCNAWz6PtivPAc5w2sPVCI5gXvW1PMlF9wzAyUbzV6wcs5+lzCoW0R2ve6PYFJYgghb2RylqKYHZXAhU2yw9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017772; c=relaxed/simple;
	bh=9Rm0m18E5xAEeHE9qXcnw/RRHt2PiaL4mJ6UXJNw45w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ubODaYDTA7ZJOCubMFgZLy7EsOFJWBiVRCkGyNPda/kXvJdRJsjLwCUHh+3h7FsqYjJRO1l2+rQrpJkWG0QbanAyIM0SoaX0PQfOuRn4Rct/MqrZVfxIsAuPFLya60nsQyc5cs+cT8nlb/uiaRUVJcgry1ZnzJd3GkdqZ11M5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4Bp0BVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jf+2TPjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MdXTi1243169
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pjBSSLK8Fm6
	snI4OTehhSrkX5XInHl4x6dBvMEu7zzk=; b=A4Bp0BVuYBqzwxGFG8HfCRBQe3E
	FBa3OL9mpSTeACMsMnw1Z5aq619wzVi3M5OQSyewfTOIrDKtP5hGQIYurBNDSTmn
	rjDVzXXzECk7vi7SVYlLwPdJV2k4PmB54+ZoScWS6SaHwH1MKR9Qe0DJhf4JEXlA
	RBfOIchbDvwMePONUr1Bl2rPl2jwxRWNPy36GJCU6E/7JXHAxWh0i1bAy8eRWeEf
	cn8kEqpnSNPLpJEFmRJqRYSZSTCBRkNGloVIhPhccY2g40P+k6n6vL+OrVNoA0vA
	5jBjrx9QxMgc1RSl0cdvEaQ6+benegc8icPgR5yxLXUY6p+vhhW4TSe0TpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0vf43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:36:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76f2d7744so39623435ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017769; x=1770622569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjBSSLK8Fm6snI4OTehhSrkX5XInHl4x6dBvMEu7zzk=;
        b=Jf+2TPjNSFKQU0toM0HTw6cciahv9A/VKhOuU7x2E4521VkZDMagONyQsqdohX3c5P
         PRhIBYpRzv0CBp4OooFvUAceCmdmSVZ7fcm38pp3+Z1sOwbVbXfNXB40NBZlIo63DBQf
         1XyMiTYUEf7DpNxF149EqZtWxRyyDFgK+BoRp0LVSZb02ZCwkp9+czPW7Tii+KAnzkg3
         Nwi/lD6gUWBRydMnZdVQOcbP1G2MMKYiCcNqQJOQw9Vi7rSwDHXXLHqpfYW+jgD6FV+h
         3vpyoWuPxlOJVh/qQTW4BFq/nRiU42p/6y1dVI3BxJZ5O/rLhk5f67xt18+uupRIxYpS
         Ki3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017769; x=1770622569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjBSSLK8Fm6snI4OTehhSrkX5XInHl4x6dBvMEu7zzk=;
        b=WvhW6oTnNUpCLdVsuTtUmrXiyA+hr4VzypNkKVxXgzAnh8xMClMGAvOC6z5K3uSLL+
         00CzZx1BbrwsLa4lYyi5mI7mcnQQTqXDIslKGE6f2QgsDT3SqHGyPs44FgMLfFrbujTr
         NgozEVa6yVrIrZu29klzUvglXIyszygcRDtEHePnxXfS0k82XyQA8Xs1oCRPm5W0Lw5u
         7HobBILOe4OR59ZyP+k4yB2Okx2QHf8Pz2vrTn4EW2CD/vQYDMQDAjs8oNne3Rg6K5az
         UUsuCVEbyJpwaxjDC9blvAJFqFhA/41It02U45fqkQjva6FUsK4o1QFBh11nKJYxLUp/
         I2GA==
X-Gm-Message-State: AOJu0Yx4GTCqJnjgg5AuMIMM5X21B1adjtSeuJa5j7XpMHS+jA3uimMu
	BvxtgkG2aVa2/9SPKxKwWzWeWr5koojDd/7m3jRerAuCAL7fOSrPk4wq3j+qb4DeJDeK97QfdXM
	SARSM6nX/acQANXUZmTLJO3PJl1YPUrf1uu0mFYDJo5BUT+FjJMb2GZc/b1WrZUxj51Tm
X-Gm-Gg: AZuq6aK6LMoBvXEhDdUWjSU1Pb4WdpHMOWE0negBblrA40az99H4pKZpfN2Z7tALe4S
	zT4JCEfxVw8UbX2qQWe55ecIdIdzfZvEM4T3S1hYgdvdebHoorN2ga0F2uRXSye4jxfY4FwLbLz
	2kL/6TqyX12B/4Dh0SBOMyvOXRorwc5+6rgStsx+8kDa0wuxXv26TC6N5FvdZF3wJggY/WvGuLZ
	PRDJJ6W3agYyOCLdfv2MHANEVwwtnfQ8lFJt2kVHjaVLVEeI9xdgFSJgIDxtGYG3yt/3Tb/zjh2
	WPoa0zADrFwu0v2SDZ7f/2K4/FsIzMxnWe6XDGPqdkXQbl+KGcS2LqH9Cuhud4zKxn4LUxvszB3
	uAn24y0fqcgA3KDhMGEwZ9ec06jM4g7P6jX+JI/m+mWYdBA575wChKMueb8NxoGlYmqROZgmC5X
	Y=
X-Received: by 2002:a17:90b:582e:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-3543b3ad39bmr9702843a91.22.1770017769436;
        Sun, 01 Feb 2026 23:36:09 -0800 (PST)
X-Received: by 2002:a17:90b:582e:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-3543b3ad39bmr9702828a91.22.1770017768935;
        Sun, 01 Feb 2026 23:36:08 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc71bsm14129847a91.11.2026.02.01.23.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:36:08 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com
Subject: [PATCH v5 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Date: Mon,  2 Feb 2026 15:35:48 +0800
Message-Id: <20260202073555.1345260-4-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2NCBTYWx0ZWRfX+xzDk+jiWy9N
 Zne6Y5ANfCpqQfu7NoKZGL6GogtVrE2c1bLQFd+SCjhbzyGTidLUN7qsRf9bjvBQoAJhaAM/TAj
 Og/D44sJ+ZIEPoFyyauIKujcDDK/s4nJyIeTlibP27ivkt3Y+euy5ulaY3OJwpbCqhKvCbQLrXD
 rexjZjuIOnnr9zNeAFxy9CgFgr4d4IXJ/H70vqClqPkRLqpyh32rifA/EGF3I+xnP5pC1LOCL6J
 BV8Efn23CwVGR8YbpQj0s0tYZA7HuAWNDktishcSUbaWdD3bC1wnXMh+Xh4nL4VsKqHoH9k3V7E
 pqL5gSZsgSSVdJYKKeaD/9iZUDYo5pKmVeHXnoYehY2O6kLfGvv48KZTCSnjXLLhQpXDFu+O6sv
 GZQZpuZaNGbdzofx0c/mBIVil1ShgFj4ZI9OVAWxrW099gRvMDxqx6gYD6+2GRk/4jS9NP9b8OK
 wx6wWmDj9yG/RO5QQYA==
X-Proofpoint-ORIG-GUID: _WkLnbIiSVGGdar7dnPBeVrN_IRHHFxV
X-Proofpoint-GUID: _WkLnbIiSVGGdar7dnPBeVrN_IRHHFxV
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=698053ea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZmrNZMXfqHY4OuZ4eF4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91439-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.8:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89BFDC9376
X-Rspamd-Action: no action

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
the Purwa IoT SoM and a carrier board. Together, they form a complete
embedded system capable of booting to UART.

PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
Meanwhile, USB0 bypasses the SBU selector FSUSB42.

Make the following peripherals on the carrier board enabled:
- UART
- On-board regulators
- USB Type-C mux
- Pinctrl
- Embedded USB (EUSB) repeaters
- NVMe
- pmic-glink
- USB DisplayPorts
- Bluetooth
- WLAN
- Audio
- PCIe ports for PCIe3 through PCIe6a
- TPM

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 92 +++++++++++++------
 2 files changed, 65 insertions(+), 28 deletions(-)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => purwa-iot-evk.dts} (95%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..d42296ed302e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -130,6 +130,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
similarity index 95%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
copy to arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 2390648a248f..fe539b1f4567 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -6,12 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
-#include "hamoa-iot-som.dtsi"
+#include "purwa-iot-som.dtsi"
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
-	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
-	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
+	model = "Qualcomm Technologies, Inc. Purwa IoT EVK";
+	compatible = "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";
 	chassis-type = "embedded";
 
 	aliases {
@@ -118,15 +118,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -618,25 +618,6 @@ platform {
 		};
 	};
 
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -753,6 +734,63 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1102,9 +1140,7 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 		pins = "gpio10";
 		function = "normal";
 	};
-};
 
-&pmc8380_3_gpios {
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1470,7 +1506,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.34.1


