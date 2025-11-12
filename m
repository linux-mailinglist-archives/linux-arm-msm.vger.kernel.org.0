Return-Path: <linux-arm-msm+bounces-81452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE28C534D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B3A50554A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1502234B190;
	Wed, 12 Nov 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzFHZh/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Whe+yvmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6BE34A796
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958915; cv=none; b=fRv30IjYgRaxzR3BNdQA4LYvowijvKzjIFv/3IJApUzVNF3J3RfcKbw1NvICQMcpvpwxGA7sQaYWcKuhX8AQV/fEWwzylgk206QpcddFcloZQfcicCbU5HTM30v+sKszJhONsTXoSK9i8dPXS3reBQjm/yniVTClUwr+2MvG1zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958915; c=relaxed/simple;
	bh=DyoaA+sChPIv23chjFgTleQ1h6QpQxmkBY1evOLH4X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtIBLwhkL+jFs2xMwFkykOK19HOGQ/kPm6J1SfRJvGiYnRZF+G4LamLxd1zUgL1nTN/A8Cfm+i5WA1mJLzOiVPy2gtVL09rSHux8rKzLoPWyzfl/m7lxxlr/K/DHA6r3Nx3XDI8orBQgZ09/QB0EQ192VyH/cFM6rVX6hShmGO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzFHZh/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Whe+yvmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9hbCv908003
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeckgBCqYzzJWW3WF7l2yuaurdQXFJrxiMzuEqHoRqU=; b=EzFHZh/5e7IoOFWG
	+bqmheangMNJWdfAtHShvJoEfl+v4zq/oxNE/T1GAyS6w62hJzQjT8XbJeSXr7sC
	Y3SHpF6tkimv8mvVlGy7ct4gp4BpWNn7cpcQIzhKuTMUenJDQ1REFM+LkaqV//Nm
	iAwk1f0kGFBmyhovrYyLInTrMpM5lK6etLZKCMIXdEGyYWQ6ITU582ZLKy6yKv96
	PgHS3oywIGumxXWHy4onSRR7XtsSAi38dJUbIdYxrSCDpG87C/5PTWhXOGYYzQ0p
	LAYV7hCbBH33PZ216dHcA/ppGLYY7Fb0oybGR9rcMuzNWOByTrgesZHfZzeyCEyC
	xGgeUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur8ucr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:48:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9a72a43e42so877584a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762958911; x=1763563711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeckgBCqYzzJWW3WF7l2yuaurdQXFJrxiMzuEqHoRqU=;
        b=Whe+yvmbB9UhcYrIiUB9E29zKguXLSFH31o4JsKl801r6cyr18vdbk9vCWgGdbT7Qc
         qtFEhNfYZBJDwd9ptOCSmTtP5vm897tV1qgd4YeRWDgFxCpfyCYhy5O8cFqiVsyE78Tu
         4TQ+Yt7A1u0NePipMPunwm87cdZCLNDOTT/Rrbio+k1dS2PCR3h2fbY7ymD5TjrG/Bet
         KPJ5q5WqLI2UlHGtUj6htAKg1e/rtr3Dm+kli9X4s+XQS9hYhHV+CGEl987ktm/oZKRI
         WPDvTATfHsjkCnUseJqn5xOPIs0bT7nyBfXTYfxXxEmKIW7YRZZHaSDnxvoj8WjVxdSs
         CVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958911; x=1763563711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TeckgBCqYzzJWW3WF7l2yuaurdQXFJrxiMzuEqHoRqU=;
        b=Ha7W/mFwg+kJLsSmnG2MCqtRlBVFTnUmcMTYqXpSUBxPp0/kSdtSmg3MHGDs1EdNNs
         Q8Xrt2sZWmaGTgCeXs3+S3+l9dPxRLCIvSPngMyrFC6dKb0Qv1NmruYEIwdXveZlyPl9
         dxb89pOw+tArFS9G5+8XYMKNIn9JZCglHjokqX+skwxUgXYKqDwaFST1ly3IrIy4FRGA
         4YMTJ2M6fEZ7K8CpBCW2jkxWbn4xvcAAlany19JPq4e2rj8VYnxBnieAEoafgVN+f38a
         qR0EGDd9PR/bY3ELye1OoUID4P4Z9DKToFkP0Cb95s/m3o6xffsAFyXYi7VOm7fCZpda
         n58g==
X-Gm-Message-State: AOJu0YygjjYEo5G/jJml+p7skOowXsqq7NOR0MTNolsDJMRH5fHQw0L5
	X/u0LoMOt1SBjLy00kVUmVJtJkIcsKjtjaGloh36bu2lYfrc3jatQrxXMug24DxwcBJ2xMGYcRh
	1hWU7T0522fiB1cREpP5qxGIAPA/cLgj7BR3vFJv2Gi9HN5x7JzRiEavGHWEOkRO5M8zs
X-Gm-Gg: ASbGncu/fH4Z3+EHohdRGqC92UrNf/b8aQ09yjFTj+3CfjvM5e6ilMr8l72tlreyhcl
	PL1ebbUmw2JuV0+73idfsmgrkUH5jk2yQNgBm61GnnhHsRiUiEVEyb0FKlVXTgYbobPFU+KFZVr
	Lr0Uh+b+B8//fMb1deYxVtiOta6Nb3LlGWZITbIhO1CZOsPr29QUIVRwPggB3ZwthE2LY6unXDq
	n20AykrVngM89MGaSuhR3kRzxC+FbkDnqgeWUUFuhgLoPvP4WU2Xf3uwZBVglQSSgQGjzPAOUBV
	3nHVmmrVO1r3xu8Ma4zvJfWE56oY5+GDZs7w7fBy1vzR0UmzXNUD8zKK2AwJ9ZOvi9nMsdLwW/1
	3Asxs38f8rsBso9KCMgN1MDtdzzOnTu8+qhDgQic=
X-Received: by 2002:a05:6a21:999c:b0:2fb:62bb:e0e with SMTP id adf61e73a8af0-3590b513a62mr4416284637.32.1762958911138;
        Wed, 12 Nov 2025 06:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCO/GuLnsi4Po4tG8EuVF09ugrKq9j6jmQRvi3hAcSlVONOB+JU2dQFIy9GLH9AcBX5W+z3Q==
X-Received: by 2002:a05:6a21:999c:b0:2fb:62bb:e0e with SMTP id adf61e73a8af0-3590b513a62mr4416237637.32.1762958910625;
        Wed, 12 Nov 2025 06:48:30 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17b0c4sm19098234b3a.48.2025.11.12.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:48:30 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 20:18:11 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: Enable lvds panel-DV215FHM-R01 for
 rb3gen2 industrial mezzanine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-1-6eab844ec3ac@oss.qualcomm.com>
References: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
In-Reply-To: <20251112-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v1-0-6eab844ec3ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762958903; l=2971;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=DyoaA+sChPIv23chjFgTleQ1h6QpQxmkBY1evOLH4X4=;
 b=QAscv/Z2HDIyvVtJL3hME2M2GNIRDWiJZg7bpK0KfStsqvBQo+Cqjj/EBNFT3/gfPnhE7/xYh
 HCB5VI3rQvkBwqLZIQcNiMMeQLOwbagSZ0nXiYbv7H0mZpbbvaDPSgs
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExOSBTYWx0ZWRfX3BCuxMVCU3K2
 i4j7vQoPNu4LSfoDeRv5msLczurLkGoowhs+1Y6Agvnqtn45nl+JFDxZT7yIqlYNZuxa/fEOqgi
 WoVzanazAi98IlZoNPEDQLSnNXqZPgHvQD6XInv0mlMVvIX2NGtQv5YilidPDLcTFBRQ9y95rjt
 Ikb5s+p1/9qgpB6XmR4OogaPzSSLFUruF2AEC2e43BAuYgmKUDcUsFb7ET5GknxB91UGosqzFD0
 pbyaexAxqCNcw9lVZBSg2N72OjU96ftxHU/H3igs9neCTiFR0OryZRUS3u73i/BbY0Wa7ndBuw/
 cXg3EbpdlovmGhloKYdXJrGUP9pOBlajB3ZHxj8RViptrbn7Vcyg+oXwtzWiwwYZD/AmhgDbzd+
 s6ROdGO7HBh62lRB9n1JONu4rVpVWA==
X-Proofpoint-GUID: 6FLlYdR9JGkc29jektscoO63OVAo92Pq
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69149e40 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zQPtESjVaFao4fvCMtoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6FLlYdR9JGkc29jektscoO63OVAo92Pq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120119

Below is the routing diagram of dsi lanes from qcs6490 soc to
mezzanine.

DSI0 --> SW1403.4 --> LT9611uxc --> hdmi port
                 |
                  --> SW2700.1 --> dsi connector
                              |
                               --> LT9211c --> LVDS connector

Disable hdmi connector for industrial mezzanine and enable
LT9211c bridge and lvds panel node.
LT9211c is powered by default with reset gpio connected to 117.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 619a42b5ef48..cc8ee1643167 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -8,6 +8,112 @@
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+/ {
+
+	hdmi-connector {
+		status = "disabled";
+	};
+
+	panel_lvds: panel-lvds@0 {
+		compatible = "panel-lvds";
+		data-mapping = "vesa-24";
+		width-mm = <476>;
+		height-mm = <268>;
+
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+			de-active = <1>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dual-lvds-even-pixels;
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+
+			};
+		};
+	};
+
+};
+
+&i2c1 {
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 1>;
+
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211c_in: endpoint {
+					data-lanes = <0 1 2 3>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+
+
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9211c_in>;
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;

-- 
2.34.1


