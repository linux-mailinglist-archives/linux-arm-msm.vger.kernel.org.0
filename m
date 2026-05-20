Return-Path: <linux-arm-msm+bounces-108713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEk/LIuVDWoMzwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:05:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EA58C1A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B1430D15B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5E83D9DA2;
	Wed, 20 May 2026 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8WAP1M1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDqtNqRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB73DA5BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274928; cv=none; b=f5l1yJTVOnL7Sh1QkxEqAneylntCb2DFCQgIPm2I/rpePuUyB5nYnYPYehUfwgm43qpRyqQYF1xEZGwEPCdC9oRi1VRKWcv6dB/YfO1Pf1nU4nfVsZREW22vhlkGuF6Mn7aCyAobMq3f23lIzc8uXwdJguDGZLr5p3upDV4pZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274928; c=relaxed/simple;
	bh=EcsG3OcBHWatj218IEmU+YqnRsTeebclTu/zvz+F2/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Owwu9ZHccEBdsOl+IAqhQ3bKdCd341Hn917i6OVEbdlh7TAOc9LzQAboUe96GAtSvGfuKtm1cnXM6DA/dD72gRI7qcc8w+7SIiXQeIrchoH5lmrcI3Ek0370HmA2jsR9H/CVF7aZ8YFiI2Y4Ovp3hTIGpa07jUoddnIr3ZkEpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8WAP1M1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDqtNqRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7UAsL2064896
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lo5MkJYHpFxheGWji+TQIhnd3x4bpUJbquv575x5QgY=; b=B8WAP1M1TMjiWzKi
	x+De4qLwV0+bqyhb0ezjxxAWjTpfYNJsYA5p0A4QoEE8QtVJ4YYduaUuizLmkqPx
	av7CpLxMuMz4J9cMcSG/wS3Tm9eLhvxi1BsJ6jefrDTz4RqjBCqcf2/4Id7S07WV
	AIMYJlv7oijeTLqhmxEjf9aY+20bTW/7axyllnFK9/zXguAhf0D+YFpD1mBsNb7z
	9ZvCs1TOYjsdim+y3yXWQ/dv7PFvY1gnNoHmZ3iZMks6t85nSGDVEMY3n/wd6xDQ
	t7AoTb4hQRF497TReFYpeHYhKn24kLLz29R+yEweg/po+Ggnkd/deS9s5Qtle4ai
	7S5jaQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4ayt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:57 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6967fe3eeb1so6626748eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274917; x=1779879717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo5MkJYHpFxheGWji+TQIhnd3x4bpUJbquv575x5QgY=;
        b=BDqtNqRappXhaXOcg0XpupLIjjlFNKJBogPtWCO3hS2gNA1XhFSFMa6lQIPiZJ3HYO
         cR8v9PNS5HXCuInpVGcd8g347vUFf5tn9siK2bMoQHOL6esX+/E14AgKRA55zL2wBZDk
         FK+ONRU3Ei+VVGV+u3bPdJOXXgSKkuWuzvWfCRLrmLnEoLziJqosjs+Xp7CYW1QtSbVV
         8GoXVYQxLRDppAJ3EKkMZ21cUZWcQ/HRLOlUH81DsnBqOZYuGzandSHQP5YH5fgdeXHJ
         HLvRyFEuWaf3y/D5y6AIlU6BsNdGEkugLgi9YSVCPd3MbVWNEBIP8K/9tM9Ms5QBmRj4
         e3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274917; x=1779879717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lo5MkJYHpFxheGWji+TQIhnd3x4bpUJbquv575x5QgY=;
        b=RdoYgcDM9q4I0JBOWaqRF0ADmhZCel5/uVO+RQfy4L58bwNkla1M7xKFLlAHbHL+vp
         F8LO9LPiD7yMAzEvKjQNVC7cB8bOVo/DYcDOAvxJLpovMwjsV4GI/Haj0hL2fVeq/q89
         NS0VTs0EViofrMhebfg4cbWKh5Y69VAtMmasauf1UkYBPuSOVj5Z4BmUgSuMG0SZMnvJ
         KyHoE+xaU4Yiri8RuNEBBydGvx1X8BPZG2dY6ifiLJtN3lp360mP3LaVArBzIyShtJKU
         EIa0zRaM5bomAmVCQ1YH6H9+OmB/HJ2S5BLkR09NuZv3s6sj8IUkZGgPGy1oQf71cjhx
         yrog==
X-Forwarded-Encrypted: i=1; AFNElJ815YSxQdk/2aaGKS5lRl4NKtRsEfiSElmROi5ukxeINsDmBqDenc8s2anovnEdPJnrlMw6/vLBxz+H5r4I@vger.kernel.org
X-Gm-Message-State: AOJu0YwFmyNXMZecNoekvEAsXHwcjsjEnjC/r/gjTlgfW/aUvNK7EJaB
	LWu0A5BtnPDmAb5uWLeJm3c0PExwRGC+EcWusMUdeBwbzJjDYGfvWyUMOq0RN26KPwlW0LWgdkw
	6ikLHlkT+6M8ACbkbvAuPEXkheUYt+oytGIWQurwkBXjpE0ADFJGLVUj+hNlUgwgfnBka
X-Gm-Gg: Acq92OFgsB8NwY9opmrHEs5cKQ7EPehs1yhzow5LPYFXdKQMx1PRwYcVeLg7a55LVSh
	PluxV6E24PcA7zipcbQjK/SR6sfHn0YckxNItd8PJyyW3fDfVaqeFSpp0EbYkvqP4Askwg+4rLk
	sX8kzIdLNB0LSFq8S050iNrU5qJGQ/9dOcNk/8EVXpen8MFk+RBoEz1b7/vFm1lWpeDG4HpQO/+
	Lno+BUWepejQACHj5MvRrUNWE/yeiqpc26jy667aNfuipZ0+h8a4eOriPzl9M5/VXB+GMj1FHz7
	aOtxrYsRu7zfx9XUdVVQik37acMb3k8biRLmvuGbAUGMdc9yqgI42Tt14VCCyWKCku9GSTjLl5L
	+DAvWAMPMBIG2TK3kiRRS9UlWAi5PbyQoKeCzd/CmX9/7C26btekKXK2dCbUwvOp/W4L5YlgOyf
	SycLxzu/GSO/5D9e3H
X-Received: by 2002:a05:6820:6ae5:b0:694:96ff:d4b with SMTP id 006d021491bc7-69c9437169fmr13536840eaf.26.1779274916674;
        Wed, 20 May 2026 04:01:56 -0700 (PDT)
X-Received: by 2002:a05:6820:6ae5:b0:694:96ff:d4b with SMTP id 006d021491bc7-69c9437169fmr13536729eaf.26.1779274915807;
        Wed, 20 May 2026 04:01:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:54 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:01:44 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
In-Reply-To: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: tn8yo27z4Mtmj9UnD0Vb6I6qe1qtM5xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNiBTYWx0ZWRfXwDZ+xfTpZgRR
 KY2S6u41v5mIyBJXXCeOdcbYAYL9sx6wO3CPVTeCqdWmNkHaXwtnMcJIpbZsByT7IZdfCdNfbR6
 +RmFECFrNcKWrtuSWpQlw59rKn+WrKJSatsDDPkoRKQnZb31pkvU7xPsGvsvGh6EJ/YA3FTCFCT
 pfGbWbk4bKZi1c14IqhJ6khhOv8N7i4V1ezNGl2DB2ES9pwMWvpbZjfihwnfU6R5dQkC+GK7c6T
 UCIzs8KUxRgEQ62RSWtMQJaVzRH/+l2Sai4yFrL1IhJo9J7AfwTdUn3IOraA7MjPW2iFB1peIe+
 yZqonhdqp+4WsHcfnmhpBXNucBNAjpBMeh0U+LzbeeLGWf6h98AmcEYIM69SPZMAkukHOVXkFm6
 4LdJxmdg0cxHqTiv3Ud23rCws9PlLEdurK7D9UHp1acgUNHgpC6IH7DJSRklfqun5RMH2CLEAEv
 H4+HFyIjV6qKXHKSAuw==
X-Proofpoint-ORIG-GUID: tn8yo27z4Mtmj9UnD0Vb6I6qe1qtM5xg
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d94a5 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108713-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.2:email,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.1:email];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 181EA58C1A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
Arduino VENTUNO Q board. The module is interfaced via LGA and is
compatible with the M.2 Key E.

Add wireless-lga-connector node using pcie-m2-e-connector binding,
connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
the Bluetooth interface.

Add pcie@1,0 downstream port node with pciclass,0604 compatible so
the pci-pwrctrl driver can acquire the power sequencer and enable
the M.2 slot before PCIe enumeration.

Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
(gpio56/gpio55) used by the power sequencer.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb6f07244d185abfb1976d9 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wireless-lga-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vdc_3v3>;
+		vpcie1v8-supply = <&vdc_1v8>;
+		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&nfa725b_default_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* WiFi/PCIe */
+			port@0 {
+				reg = <0>;
+
+				lga_pcie_ep: endpoint {
+					remote-endpoint = <&pcie_bridge_ep>;
+				};
+			};
+
+			/* Bluetooth/UART */
+			port@3 {
+				reg = <3>;
+
+				lga_uart_ep: endpoint {
+					remote-endpoint = <&uart10_ep>;
+				};
+			};
+		};
+	};
 };
 
 &cci1 {
@@ -408,6 +441,22 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pcie@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			compatible = "pciclass,0604";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x020800 0x00 0x00 0x00 0x00>;
+
+			port {
+				pcie_bridge_ep: endpoint {
+					remote-endpoint = <&lga_pcie_ep>;
+				};
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -500,6 +549,12 @@ max98091_default: max98091-default-state {
 		bias-pull-up;
 	};
 
+	nfa725b_default_state: nfa725b-default-state {
+		pins = "gpio55", "gpio56";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		wake-pins {
 			pins = "gpio21";
@@ -540,6 +595,16 @@ &uart7 {
 	status = "okay";
 };
 
+&uart10 {
+	status = "okay";
+
+	port {
+		uart10_ep: endpoint {
+			remote-endpoint = <&lga_uart_ep>;
+		};
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.34.1


