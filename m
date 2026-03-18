Return-Path: <linux-arm-msm+bounces-98318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDwyA4wlumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:09:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED242B5B64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A700F3047BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3548233B97A;
	Wed, 18 Mar 2026 04:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AS2tGkR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQuniVkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5B333442
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806859; cv=none; b=ISMJ10Q22D10nEp9+AYfLrziPrpkzEOL+qaF4AXtjA4/XG8dkf2yOSoXl7MtqTcdPRVPW4Fb10ak9QTM3Rw/QJtAGcQa9Bqf7IbcGbNWD+Ra+U/bU+fiLcuH9Ka71Wa2fZBgY9R9U5ipy+DFgwYPRHkNyhLPQ4tHepl3bGhppDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806859; c=relaxed/simple;
	bh=6DU4UQ9ScKhARkBm50wkN+b9dooeJgsguNKbBpvWJKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVCN81ubWfrv5OGjNLnVCR0T5AaTEhwbpxQXNdMuJMesJaubEo9YKTOZ/tm+Kxar8GihElkc39GJ+HFgnkUEXtb0qMxU8CnP8plooAJxBk7ocr5zBEzaZ4OnGHIja01n3lsbOCJrOMAdytFyBYcx+UevrlLAnvYrZbG+/QwkXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AS2tGkR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQuniVkj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3P4O01370756
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDx6sQmbBnt8wMQUZL8tdA9fS+H2euRnThvVHJhlQZE=; b=AS2tGkR1G5tgKOaj
	7YkfhhK/ihsop2/TmG8C5P0uwszdlvqYqfENHKXAC1pUmtKas5ugsuPuJdvuKVJR
	49v+TQ+Um3VlQKaUzu/3rMmRA2cSgUJK6bSuYdMYsRV4WD/XTXgM0L/tfU9X3Wby
	hdcdCXqR96k7Ni/OBegm1dQAA4GYh2uUHng6pg6GqqXBCM98SZ1LAESlzCxJQw0O
	XGUkHi3XBA98pPLhYkNCwApDlmWAjSKcePcCHtJ7boS5Pp4fakqNIa6QA0dZvoHe
	ssU7V+/8CuWmCuuQ9T3q3gJnl3E6Wp9WhjL2+al8CSKw7JZMyR1bqpvFQJaZDI73
	NTBdPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he35kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aed1beaa73so57996665ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806856; x=1774411656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDx6sQmbBnt8wMQUZL8tdA9fS+H2euRnThvVHJhlQZE=;
        b=YQuniVkjuKJ5YYQWBBspVlKJaoikZA9Uw+UWOcChZQC67v2WKF9WL3IoYf60sKzQKn
         1nrS/OLcQj/24H5usbI/tN+LTkzE6QwrSQoBJmlb8Ss5jR3IeeSWjPaBPTxzFV1a+T6M
         3Zl6PGqHt7iPF3SYT5K855CcHRqJLebQbXsEtYixhDvjrmmP6simcY9G6XoR11ooNXUp
         zSXvC4L9wQlI9sNoXklZ+AlIhES/ZPSbAh9jYqxU4hyKvO6OzJ5jVD9R0Uce9nwbadTN
         n5vN+fdndG2EQTgob6qhyr53Y292198Os5eno4dH9QN3y/Bfbpiv8TNPGfHQ63p3Y/C4
         8mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806856; x=1774411656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDx6sQmbBnt8wMQUZL8tdA9fS+H2euRnThvVHJhlQZE=;
        b=m2HAxob06jEo5dxBCXFoA2Og9cJvMLe2LJzumgrEAD8u4/5gH6D2l8AhJD8RfH/nNo
         RBWhUcFFnobHRGemRefXVsJx8vonpeqyMiw8pxCOpwYx8M2+OBH8XxbY4sJY8qX4nTQo
         RJT7NtZa8LlTjERQLYzGYqSD6EJRL7wEa9zRWD76a7xfYnhZrn5FvtoMRbds6gkBFzCK
         58ATdw6EAeY2QEYD0XpafYI6g94Yk8cT1rbrdIY12fiJBfngjHMtvq+PHouGjA1GhCYW
         KS32pxAE8626ADCnuJ0zB4Bc2UAfBvOoaujnn85mfyQbf8+ZB2gOJKcLndfNUMU517JQ
         fkYw==
X-Forwarded-Encrypted: i=1; AJvYcCU3FO+0GO4zp948Pq4ytmMd8Ho7OMqT6j/r15LSBAMsw7bMN+1kP7n3n0cSaNFWGbC/BfdiklugBAeOVU5U@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2JZOtd1odZjCDA+rg2BdwA6dBFouh3m78pa3k4USBmuAueGW
	M79pZ+wYjdMJB9MCuUB5AjsCyX0kVyts5szKITL+xESQEo4MWx9g94yKeoFuBAASj3ZcjMhTnzd
	w/fpjanDUzqO4oyNo6EIajMdyIaDlElckyLATCzdMK7/z5/kgHynEirbo/39H7RNOPmAJ
X-Gm-Gg: ATEYQzyou+WwsHpNcIlzJRKYDJECausv4NLNR9nJED4/Ap3vobY8UEEcV3E71ArZAbH
	ciPzuKSYDW4GDRUTT2xrE+jSHW5nFJCmZpEnANqJXsB1vcDpTmtVofO2Co7BD+uNNzfPbv/wb0g
	MX7yfko2VayE8YFexgeo/6ZW7Hl2U3SLS4IoaeBhYDi1AqeEdkqP5AHywoBzz7oSIxYreyH0lK8
	eQTS0eS7tqyMnfvGW4DZNaGIUoTQNvgreFEDTiTZtuoG0LwJqS4HhLc+J0VbvwtI4T+2BZhjUYO
	PMI7eYsEDQsN5pDUJ5czPKKQPfzt5wnuJfYfWJFn9jO25Wf40sJiOHzM8MsTAzwdt4wye7utvEL
	VwlAnsxIJRgd28znJie22VhtDy0LQqkBbZHDHl95QzBTRDfe8iLnXGgo=
X-Received: by 2002:a17:903:2445:b0:2b0:51f6:d468 with SMTP id d9443c01a7336-2b06e35f408mr19809245ad.17.1773806855425;
        Tue, 17 Mar 2026 21:07:35 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2b0:51f6:d468 with SMTP id d9443c01a7336-2b06e35f408mr19808685ad.17.1773806854848;
        Tue, 17 Mar 2026 21:07:34 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:07:34 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v6 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
Date: Wed, 18 Mar 2026 09:36:44 +0530
Message-Id: <20260318040644.3591478-5-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uv96E_0MH51l2inYxkz39lA19pjMkEa1
X-Proofpoint-ORIG-GUID: uv96E_0MH51l2inYxkz39lA19pjMkEa1
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69ba2508 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6A85_hAfsEMDmSNDHIoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfXzj+X8n8jpfP0
 JOcX0O36WN9dy6Nzg7eGUqjqWAOl7IQXDdN2gKP+s0XxU8VnXcWb1s7U+z3f+Tx1SztX+smiRPF
 NQ/JTRzIdfoyAV3VpwBjudpQGNV0tG45vzTZB08YJxSmMB/PrrFJLhXjnjw5xLYWKhLrcft4H7o
 rsIUDa8ckSRToGamU8Bn/M+ZPhavsXCBBQvOaaUpwb9m0JvWajWZ7vQrus9Meb+iuiucOpCr0oC
 XhbcPjH/8xAvQ3JMqj/5RLB2PVy8zbSV+RHYUd/kg59Jd+hm15y+HdGqtxGFEeXfQAmRE6DtL02
 CAjeSQVBE6GDMO4GBvjDIyp4dl53fxkTtoyFRPLgjkaVSfBvrtR1erzoB7qmaNpHfsI+ncwUAVB
 DRBITaZixFLayCmXKZlmf77KkkSTpCQNFdaxkJDOVQPLSvMKxkMpw3MDNca3h0MPbpmlPaEp9kf
 BHRLjJEb8+RA6RJgaGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98318-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.47:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.3:email,0.0.0.2:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5ED242B5B64
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
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 2d7eace9d7ac..7c2dcf97bdcf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -87,6 +87,44 @@ usb2_con_hs_ep: endpoint {
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
+
+			port@2 {
+				reg = <2>;
+
+				usb1_con_sbu_ep: endpoint {
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -169,6 +207,16 @@ usb2_vbus: regulator-usb2-vbus {
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
 
@@ -564,6 +612,40 @@ hd3ss3220_0_out_ep: endpoint {
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
+
 };
 
 &i2c18 {
@@ -755,6 +837,14 @@ usb2_id: usb2-id-state {
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
@@ -948,6 +1038,12 @@ usb_id: usb-id-state {
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
@@ -1018,6 +1114,118 @@ &usb_2_hsphy {
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
+					remote-endpoint = <&hd3ss3220_1_out_ep>;
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


