Return-Path: <linux-arm-msm+bounces-117875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X/s+BD1OT2r+dwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:31:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5272DB6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:31:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=btsOzL5j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EDyt7AT+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117875-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117875-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41C5530454C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6163DDDDD;
	Thu,  9 Jul 2026 07:29:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483993E022C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:29:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582195; cv=none; b=HFUupotUIHoUPCtfCF0PkdGk58YApGVYgcXLBYHXGyMYO/3dao1NkewHUkUOEU3HMYXQC+Qq7oZ4pGXLLAsXQ8Jqg+2mOz/5/lpazAiSrq/uKqemCwiKoHVmRW/fOAl3qRmC+CPQhxY8ACjLsv5GKuaxDOZjRvj5UE/7NbLeyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582195; c=relaxed/simple;
	bh=ti18E3whOjj3E/clAE26Ilsl5ydBCy/MZpD7NC2EUk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dA2TsFajbe88fYHl/0r5nVu3gkwz8AHIFSQESVFwlAN4kWpEdwEc3cipCUyx371gMuRM74GTWNPW7UrQVHuhC7nFiZ0MtXrMxG3FeKqje033onLiaS4yTyqpFn1bMSHnW6Lcfi/z4dPxEnGL4h4fL/4iLpqzq1apwFDOJk0LPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btsOzL5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDyt7AT+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960P5m784605
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vScidbHly171Kf0BpSO9ox3SUP4FemmOhWhhk06koyM=; b=btsOzL5j3LfvjMji
	9np+rj9bTGs6uDp/e4zKFJE+05qLgcNptS9W1STcFqAwdIWamzMdZSWR6IDLzt9T
	tPrsrvG7uYA3aOrsLVGy8LlggCGJoE6jZ97300rvTFwJmYFCs0j+0S6LCnwMi7Lc
	o4mFG6OeBf7EY/cInoM0e9MRFqEybw3zUQCTYse/ABDVW2bjLv2ekP8WLn/vSpZ8
	SM1FkeeDo4EFfB/fr7n93B/g2uXv7v2fQ8svShIvN9nzwPAM8Pzsvs+Ed4UHWo0O
	i9knQqzCSekiQH+xmoYNV1HcjzaEaqaZ3MTuQJDMv2kCSL9B1Ztjso8xh76IaaD6
	uRRMiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u2e6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:29:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-846bc8a0d12so442710b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582190; x=1784186990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vScidbHly171Kf0BpSO9ox3SUP4FemmOhWhhk06koyM=;
        b=EDyt7AT+PB0rNikDNFg5tcb3hFxWrEsSQmEQz3LLVHW5a9AuLVgyOhA2Qf3KilAlxB
         dKZ9rd4oaFlZEVSBl9yvByEkYm6P11DLHloBncBWMtH7WsPyF0EyutYZvVXRvmWdZ6je
         94WHTX96MQ5ONgHUB/m03xnECZtnSkEhrQRSMNcCVg4YeY/XVv6Qqizhexza2O9DTm7Q
         gw0q6yRrH48kOGlMi7RQzWjQtYo+kORdShdYiwzn4EQlaz2hbLR3Gk2Pd7lZGSGavT6a
         0693v4E21ElI6Z8m50mOCDHxC/3AyPOE1RdbgzeASh/CtEpg32n908OykRMWOtxaCMIS
         ulUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582190; x=1784186990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vScidbHly171Kf0BpSO9ox3SUP4FemmOhWhhk06koyM=;
        b=aghiWCcnBHXbuLyvt+0FfhCeFnHevanAccIQie+lvE4fURD+oA6uEbHCeYlEQgmG0F
         bVfNoWxJc5od03ViNgZ1/Kyj7lfRJhvvb4n+a185CtAFUP6sOg/ePfxZXvmxopou9v5C
         YQHis6RxQbcoQ03Dt++Qrwx6VhON128pZZM0j7NYEVzjGYlucyWgavB1edQ5Ci14Ts2E
         1/xyd5oih3z9hgKPp2Ko5CPP0XR0hlYFWz1gqX6sLU5L5nc8rldzVXbqj5qaZBfZWjdE
         r4hvi8t0R9mLorSLX3GvPb0w1lA78ucCyBhA/Hv4vvvJssOoqCglR1ycaQzDdRmOYj4D
         Cnng==
X-Gm-Message-State: AOJu0Yx6hoXcONLKysfw6IWjej9tA/uUWcJdRC2XZRZs7FMQTnnrUlXy
	y/vHmqokWnFusKEyHAsAzPqxPhnfnkX78W0KP/zlvcgN1rNLyvxanVz8c4fUaOQshW7NkQyjr17
	IGJ4+vUOksK2zweysdZW+CUoaZMpbk9AtDhMgI5c20WkyRAeQKOmlIopfqcGmgQoR0JE+dGSh7D
	Sa0XE=
X-Gm-Gg: AfdE7clblMHpfu/MdTk9nG4qgvBStXjwwMcCt7KfObpYJnM1KKuug0XWQwbbQ80Hinj
	Y0+qtuXTWmoFUf1lSFdM6Pig9SgdePvVUXs3Uq6MUpeShYjeXP65gTYLTbAfu59DZV4sjikeDiE
	cw0GqhiDJGiSWYpvh2YL2UDgQv4tNEZdh0R7p5mWY9DIg6KWZIXxSwCSc5KmyHSwYSt34IBLLb8
	L5cbcTj8ANKA1wTRMtXlv5oAyCnSDLobK2oi4pO23fHHv34sboy9tuwNsd1LYVcBc0mXDfFpCg4
	RfR0lPQpI7YqRiu76ua52JJawk+5x9FBewU9EYUPKkedWKc+Cw1xFGGFIh57bSiXYqk9BaP488L
	GwkyuBzSZ8JOsO9zBq68EkFKo9jDTlSP0rdmFNz2osK5XGLTwhWYjahDd2Pqr7A==
X-Received: by 2002:a05:6a00:a0c:b0:842:3932:71cb with SMTP id d2e1a72fcca58-84855fe8b89mr1634940b3a.4.1783582189785;
        Thu, 09 Jul 2026 00:29:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0c:b0:842:3932:71cb with SMTP id d2e1a72fcca58-84855fe8b89mr1634921b3a.4.1783582189335;
        Thu, 09 Jul 2026 00:29:49 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm8167222b3a.38.2026.07.09.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:29:48 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:59:40 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        mengshi.wu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX8239LQOJ+TWL
 4AEwwIPGm5v/mYcwT3yUlN+KLop1J4z4DnS+2Ut3CmBdFhZKX4c0FhQbdfBXmsnFui3FRb8NBvT
 HOaBLAosNT8/OJHgpLdHFJ5Bau9c30U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX2BlUC5TY9DcF
 jgfAei1CVGl+tBAf1/kvbeILlfqX9P1oAGc0HSZbgoZ08M+m8SmwM+ey1FbXXapFL0dTryoL0g1
 LlGes6de8HUp7wP49pfj4FOqMykFVJLBRE/sPn2bOYXmYIy6fUuDMrFPlR6eLjS9KUeH2PRdcjv
 fsQzwOolRxKesOfUYcTnDqtfNoNQwcQog+7x90duO9ACSqha9mzwlxNNKu8wx2F3f0anmTd0THn
 wuRDLOFQzWizX/5g3C0xfwLudKhUvVoEq1zKR02KGbYR7JXTtc9esSFGeR2Np5up78ACIn/XBYC
 5xe/cZRPJl/AcSFBO2t8rkntq4M1jmTu0T1aqYDWqtAi/hBOP1gLW3VdWvRHrGJLhvOh/YucO6Y
 U+HdJpSZeLg/NKEQEMyVS0WJMIfRPrZgNYb572/ZwL95G6yNfiRPKdB767Yk2pJ1OHH0TrJjaz+
 Ur5RC5w9ht2TEau2zvw==
X-Proofpoint-GUID: rd2I-lUEr-Ajs2xRG4x6Ufv6TWZXjwCf
X-Proofpoint-ORIG-GUID: rd2I-lUEr-Ajs2xRG4x6Ufv6TWZXjwCf
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f4dee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6xwnDyfGkisnSeZ8xU8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117875-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wei.deng@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40E5272DB6A

The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
connect wireless connectivity cards over PCIe and UART interfaces.
Hence, describe the connector node, link it with the PCIe 4 Root Port
node and replace the static BT serdev under UART14 and the
chip-specific wifi@0 child node with graph port/endpoints, allowing
the pwrseq-pcie-m2 driver to power the card and dynamically create
the BT serdev device.

The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
(GPIO116), both described as active-low GPIOs on the connector node.

Remove the chip-specific wcn7850-pmu node as the M.2 connector
approach replaces the WCN7850-specific power sequencing with a
chip-agnostic one managed by the pwrseq-pcie-m2 driver.

Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the
PCI-to-PCI bridge device.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
 2 files changed, 47 insertions(+), 83 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..41c2004f0ef6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -68,6 +68,44 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+
 	connector3 {
 		compatible = "usb-a-connector";
 		label = "USB-3-Type-A";
@@ -676,65 +714,6 @@ usb_1_ss0_sbu_mux: endpoint {
 			};
 		};
 	};
-
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vdddig-supply = <&vreg_wcn_0p95>;
-		vddrfa1p2-supply = <&vreg_wcn_1p9>;
-		vddrfa1p8-supply = <&vreg_wcn_1p9>;
-
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
 };
 
 &i2c1 {
@@ -1025,19 +1004,10 @@ &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
 
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	port {
+		pcie4port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
 	};
 };
 
@@ -1531,17 +1501,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 &uart14 {
 	status = "okay";
 
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 60f485a4892e..566a6b4c6208 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3776,6 +3776,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 

-- 
2.34.1


