Return-Path: <linux-arm-msm+bounces-107524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEKdIPZLBWoIUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:13:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2553D932
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEF8D302D1B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851C33A8724;
	Thu, 14 May 2026 04:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVO+ex5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNGau+Nq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AF3AC0D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732002; cv=none; b=AoxGc25WMmNL9KAp9DnEmmd6mPRil8D2wme92cxAMpDL+m5exdOHPl97RcK9vd8JZVO9qiIpPjfU+cyKqaC+AAxdsNn/J1s7EEFGRAigdgsb1rz5HJPz8XTFus5qj4wN1mwz2Lu1GQfXWyyxeE6k6Lqpki/hTaywTAueJWqJJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732002; c=relaxed/simple;
	bh=EZdQZIxDlFZqrv4hdcB+DHnhLKJkamJatT8pTwXJ4LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxnloyKRvx25eHERY5uRrwSJWFqohHvaCxZegkGYP9RzaJyTqjkD21L5YEkZiBA83e8gOGtEhlvkdplQ5DQsMmpNCWFMZPe4Ozve3m7wEult30Rjn3xbrFzAFfl+lFiW7Yser8FY3ttURVbUGibAjCnPIPrpHEQ1UYod6p1zDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVO+ex5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNGau+Nq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0t3WE1622258
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+24qlReIO49CXzcVPRFP++HqwH5zbI8hgVyfLdPoEgY=; b=nVO+ex5v4UQYr5F/
	Ydu1NsBfDoRbaI4U/IzGieXwIIN/b9pQaINk2Xwti3ToX8vr7oGPE77L4z37mEkL
	D+kElrF0bi4yUX0vS+9PdSWpY2GwUfRBq90igqvYcQ4Vcqs1FTG48bgM/nFR4sa8
	oG3H8iDK7wSt0ky6ZODDlOluS8B534+UO8kyEnAy9BCVjh8dPpzCyovIbRJ+CWQv
	HpzldYyD7nNIhP2IPDIsosuCiKb6gnlZSNlF/Y1X1kwhqWE9YhTuI0ghnwTovZpA
	IigLwfjMP7SiK9korCZyzpoQ/NEdkJkzpkdQ3wlbtl+8JLjDxuyEVYHIGg1Qwarq
	GUC56A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rgyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:13:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83836443305so4330260b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731999; x=1779336799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+24qlReIO49CXzcVPRFP++HqwH5zbI8hgVyfLdPoEgY=;
        b=ZNGau+Nq3rLAjuyZsaGwJXXZoOepljyYHkZy+a4nBPhwS8A4ALEZDUvPxfXziAN6Px
         ahDcc0iRnytBZxLHMN9hlRTd0Lfi0+6gAJARKm4lPenQpf2aAWLzNLXXh50RAJCsMQP0
         23hMXtsUls9Rx7o3SOIg0EJRYo3td8vY2Bd81j6PHWF5gX0A8XALI/fmzypSWDa5HSnQ
         PeszJIdFqOnolgRa40x9UOFXBR9pDF+GTCOxTIBGup4D3iXIBYvxEMZ8XpkuII8WG542
         zexvNMKhj6Q7cPHfomozVwa+jxHaLw8oyLzWoW31f0adCLl/eL8S1LedhFwTakQm5F83
         Pp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731999; x=1779336799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+24qlReIO49CXzcVPRFP++HqwH5zbI8hgVyfLdPoEgY=;
        b=UDjlclxAVSVhO/Gd7bo4ClXtqdFx+wziGU3daJPF241yHliYKZ2b0mUdSubDnNbTBl
         +VGJs5UDlHGL5yT8zKo+/S90aJYzHOXGciL7mqHylkHNz8tbwr9NEuuC0Ov6+ZKXmuKY
         epiNggl4CcL4zHZ7kqujCKp9/UFyF2JSdxNC2NgbCwrX6yZ73Zl+p90VGrg2QeMZ/EYg
         wK/DLSzkXmTjKritUPTSMV3tPN0s58iG4mvk94Kaah9FwEdCp1pOoHbgn6pkFRRU9+Qo
         YJy3rSBeJ89k12Dl2jIs0lCJuf8Fphc589uBnPlx9IuYo9/pijQ9jzJcZU8prJMt9X74
         do8w==
X-Gm-Message-State: AOJu0YzPXZSU+v8YEJtBd4QX0RoK7t9lhhuikvUv73zo2psVG5XkGqze
	lnv1Jw5P97BANf5ifNSm+iJXPRPsHHh23eRkHL9Fh0DYfvEk0MHrJ55OfqGfQBK6Y5jzT1pfTpz
	UGVquHpS9fCQ2bslXG4Dra/8ywEOY/XXaNOLl09grSuDcQQZvevgPdjYi8AivmUJdHFba
X-Gm-Gg: Acq92OFpjHSXEralaSl8NM1xFdUudBnfvRnAL+ZvEG13zLHXX/zDPu3dPUEPylSxbbL
	W4f1RNAIV0TuPdTPyvdufUjoT23CA531vVlB1DwNYKIg4QzE3460hKkrobl9Cs5Yk1CckrWJ911
	r+UrYk/gfDa1pl/S6vyBIHKO11aHYIchjXm89TkMTf1hXYEKgXMzL0nXtmN83jC1uD//RYR5WvF
	eisfKjyLn3YzU7LStLpuLHoUpG9mPNF6M88+90rMQUArSUnGuF+sQVEbXwoWqtFhJ+GEs091Run
	/CMvaF7aRUiAMcgANyZ1uOa+g6ZUIp7UJehStZoX9rcGBx3vi1gldgUsLSu+iEMpeUZ21oUGMI5
	rvZCdcXHdEF9Cf7nEcs62MR5T1Eg+0ewj1sQEuiUX+9WUblqo0+wyhjtc32uEGxeVUTIsPYCOsO
	edTJ6Bl5qspDimqa2cJQwk4RBheqwkB7+myUvd1zlpBt+7FUEwRCY=
X-Received: by 2002:a05:6a00:f8f:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-83f0579be02mr6070356b3a.21.1778731998558;
        Wed, 13 May 2026 21:13:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8f:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-83f0579be02mr6070324b3a.21.1778731998036;
        Wed, 13 May 2026 21:13:18 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm1075432b3a.39.2026.05.13.21.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:13:17 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:43:02 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
In-Reply-To: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: rGB8Ts0kB0yECUSHt574uoLkfN29pTeG
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a054bdf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-SdU90OiLOdpC9A8V0EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: rGB8Ts0kB0yECUSHt574uoLkfN29pTeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzOCBTYWx0ZWRfX/R0WZb+N+YYj
 Mk0CrIKSYxmETMlsQRjo2EsSKL/6U1eNZSGPDnRR7W7I1jFKFO2H5J7XJwTiiTatGSt1OWjyyoL
 fP/vv3w05cr41t+dislRWdUFEthXeFsP++RMvKLayccrtk83H55Gb86K+B/QKoGtgqv2If0BooP
 tTddbJKcS6iXuUnrZO9hRN6ZmGUToxUZiFBocxGaTX5oqHfCWH0JCmryQPVkYt9KlAD0pNKkdq1
 C+yyVtiCZD7pGYzKjWPTjM9qIsykC3s6jRn/Agsscu5+JpSqin03SvElsHfWyAKUH42ZW5UUXer
 1dGljrf218gZhwwcxoY6xx5Vm6tRLKAJGqIZfhx4FWKjMMpmpmqOLtho2SykYm7T3vHENfaYSok
 8MfyemBOf4QFTswBepPssjsL9CNVJEnSfRtdvifIolWAPPgNucV96LV8tkXgvWpJcbtFuHjD4sb
 onGOEBZASr7HyDpTxDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140038
X-Rspamd-Queue-Id: 2EE2553D932
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107524-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.15.66.64:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,f4000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[4.44.29.128:email,2.250.240.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add DT entries to enable the PCIe controllers found in ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  43 +++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 261 +++++++++++++++++++++++++++-
 2 files changed, 302 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..5e599a1cea3f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -20,6 +21,32 @@ chosen {
 	};
 };
 
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_rp {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_rp {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	status = "okay";
+};
+
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -36,6 +63,22 @@ &sleep_clk {
 };
 
 &tlmm {
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+		output-low;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+		output-low;
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..ec1c9a8c08e0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 / {
@@ -13,6 +14,18 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		pcie30_phy0_pipe_clk: pcie30_phy0_pipe_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <250000000>;
+			#clock-cells = <0>;
+		};
+
+		pcie30_phy1_pipe_clk: pcie30_phy1_pipe_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <250000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -130,6 +143,54 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		pcie0_phy: phy@84000 {
+			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
+				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
+			reg = <0x0 0x00084000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE0_PHY_BCR>,
+				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "gcc_pcie0_pipe_clk_src";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@f4000 {
+			compatible = "qcom,ipq5210-qmp-gen3x2-pcie-phy",
+				     "qcom,ipq9574-qmp-gen3x2-pcie-phy";
+			reg = <0x0 0x000f4000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>, <&gcc GCC_PCIE1_AHB_CLK>;
+			assigned-clock-rates = <20000000>, <100000000>;
+
+			resets = <&gcc GCC_PCIE1_PHY_BCR>,
+				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "gcc_pcie1_pipe_clk_src";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;
@@ -146,8 +207,8 @@ gcc: clock-controller@1800000 {
 			reg = <0x0 0x01800000 0x0 0x40000>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&pcie30_phy0_pipe_clk>,
+				 <&pcie30_phy1_pipe_clk>,
 				 <0>,
 				 <0>;
 			#clock-cells = <1>;
@@ -299,6 +360,202 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		pcie1: pcie@50000000 {
+			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
+			reg = <0x0 0x50000000 0x0 0xf1c>,
+			      <0x0 0x50000f20 0x0 0xa8>,
+			      <0x0 0x50001000 0x0 0x1000>,
+			      <0x0 0x000f0000 0x0 0x3000>,
+			      <0x0 0x50100000 0x0 0x1000>,
+			      <0x0 0x000f6000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0x0 0x50200000 0x0 0x50200000 0x0 0x00100000>,
+				 <0x82000000 0x0 0x50300000 0x0 0x50300000 0x0 0x0fd00000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE1_RCHNG_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_AUX_CLK>;
+
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
+				 <&gcc GCC_PCIE1_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_ARES>,
+				 <&gcc GCC_PCIE1_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_M_ARES>,
+				 <&gcc GCC_PCIE1_AUX_ARES>,
+				 <&gcc GCC_PCIE1_AHB_ARES>;
+
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
+					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie1_rp: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				phys = <&pcie1_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0: pcie@70000000 {
+			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
+			reg = <0x0 0x70000000 0x0 0xf1c>,
+			      <0x0 0x70000f20 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x1000>,
+			      <0x0 0x00080000 0x0 0x3000>,
+			      <0x0 0x70100000 0x0 0x1000>,
+			      <0x0 0x00086000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0x0 0x70200000 0x0 0x70200000 0x0 0x00100000>,
+				 <0x82000000 0x0 0x70300000 0x0 0x70300000 0x0 0x0fd00000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE0_RCHNG_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_AUX_CLK>;
+
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE0_PIPE_ARES>,
+				 <&gcc GCC_PCIE0_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_ARES>,
+				 <&gcc GCC_PCIE0_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_M_ARES>,
+				 <&gcc GCC_PCIE0_AUX_ARES>,
+				 <&gcc GCC_PCIE0_AHB_ARES>;
+
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>,
+					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie0_rp: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				phys = <&pcie0_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
 	};
 
 	timer {

-- 
2.34.1


