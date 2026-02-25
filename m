Return-Path: <linux-arm-msm+bounces-94154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJu0DVASn2nVYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:16:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F61995FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DF993024439
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C1B3E8C70;
	Wed, 25 Feb 2026 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnWlSRGo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EA3E8C42
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032306; cv=none; b=U/9HrE0blNV663kth+rcnRqC1jcvpQ3rf68Ym761HXbeHxOsgRDpZzfNOHghs81jO/406IR9fIOlRa4nLNLDx9XGSLlkI7zJpivLbeS0995zhpE8aeTAUHB0dWalEFEis9kdpE8AHsHLHecgkTOYiyByiHFuarYQCKBBknqXxcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032306; c=relaxed/simple;
	bh=JroXwqsdd03273iY3I0FAgKY/sEgdngvDFJfFyhLp1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eg3fZuaASt2sMBhntWFV45axYEEHmzdhFINRYFFO7LHDttDk/54XvcY7ggzaB+000nWepNdr6OM9PFR5uGltxt0qIitHzgBj9ujWvMCo7O/10n17jc3ocSD2TH1HmbAIYjNrgBOuFx4OZsp0P/JEwhvp9ejDktbH66eAoFzE/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MnWlSRGo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837584120eso47399685e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032302; x=1772637102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foH4txHEALAU3mMg443JiOclx0ShfjeOi2oTBlBmPCs=;
        b=MnWlSRGoh94TlBYuSlLuyn8a+lZbi09ANJLzeHkeAXT+jeL4ctQKKQOSAU/Z/U36/w
         aEeRJYw6yp93F+VjzyhhEpSJGGTeDBNTQrqPMbn0AHtjIcQHep1ubUQCqS47X9rEFon4
         55/3p0arqsP5rcO+gezXs+ws8D8wonx6lGaFWS/OYQBuGpfRgB5FLAnVVRf1MZQi9Q4x
         5YHAYG68frqD9bTVRLuycPd0JJ/O+XS63mYRGaSBSc+dWm/MfHLFnD0vxAxcCb7bS6D/
         Lli+B8M/aVKbI/j9Sb63dVA+AJ1MaEA6KlPI5LpdyfhA76toIkSPRdTtGARa1tfo84ky
         SENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032302; x=1772637102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=foH4txHEALAU3mMg443JiOclx0ShfjeOi2oTBlBmPCs=;
        b=I6gMSFR2EK6jqw5yC6VY2WAkaProAuk9cpbccTb9wsmAHaHcY4xov85uFE2LVsg9nY
         4auiOM3fUSyPGNXaG4muvxm/J+nLON13Ret0H9JK2IHPk6zkq5sBKYgM9Ew64hu/ijrb
         9MoLeS89oQy/KI/9ub+83qguTuPcUb/NoR39Hl8yrarFE4pmWZDVI1e/Jpb40gsZSDMh
         GHAzh+l1XnJ/feYm6vIQRksd4YB+Irf+H+55ggXWixadgZW0Xtyew8/5q8UEE3E1BSa9
         T1Ksc+M2eibtEdpm5x5arzpEA/JJ6zFtCCcVGSH52UZKGFp7FeTrME1JSUkOWkhS0qfq
         1iAg==
X-Gm-Message-State: AOJu0YwpyQpk1aRz0mWIlxbYV+kwqnGgKObfDqm6610gTIpDy90QGOU4
	msa7jA4DKAxdyamYtwMWZ6Zk/wNKolZ8CTRdr/akrviVc4LScgDDeAp0sbBXh4Nx1KI=
X-Gm-Gg: ATEYQzxefiMVRrBiL2fw6IkTYuWKSZS0GM28yDrtCs/iKBdK+bIRpxOZbPhQTtkegid
	fG7ZamrXU7FKKcbqtBBXH4LYPHenvOlPFF9tF+NRrkEyWsvgpDgaLaoTGOcQVlp/rAXMeoytH+5
	is0yzZj6iw+wBbFqTFF+GIjd+qytjaktNl5BU9BHONkQ0mV3keRaeGQpEY1J/XwwB+ALk+QF2Nv
	mJ/PMWYN+ioSceUQ6CgyUEs73OQd0O5JEHxwY1Z94WmX6b5qiV0McUPqMcYl4FA5YUea6E+qKx1
	VzIPVNLmb7hGY8mIu0S9cWzzlYSW0gH5wHxHAe6db2lqEXGEA8UqTYtYbYcozAVOQjd2bg/SI9H
	nOiLfIbbAsl6sLeCduoJwsxvHZpVb4eoR05Ejtob+f+ZAbu8RuRJ8m6hyWb67cDwGpg/PAaSJ8w
	lyslWGZjVdDCOZDS8VInIjGzjpMog52AkRcXT7JabODI7H6bLJ9BaPGUiuJJM4uJC+LvFSXv7vV
	vI=
X-Received: by 2002:a05:600c:5253:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-483c21691e0mr11420395e9.6.1772032302484;
        Wed, 25 Feb 2026 07:11:42 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:27 +0000
Subject: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3982;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JroXwqsdd03273iY3I0FAgKY/sEgdngvDFJfFyhLp1g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEbPEwyxMvvCsMnuCGcpN7mYct85R012PVie
 SuYMEcjqrmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OtLkEACm2VPBCXpq58fhwYV5aLMEaDvts5TS88xFELE/QC5Hdb973kDPeJg8evMFxBJRYsRCv/h
 lFQRCvAIaNHV+oD0rlXSLwLeYp0AZxQqCPd00uF6e251gM8qVNTrsn9l7olXFG3RJhs4uw2oAx9
 aq/lK35GJp9rjvvTSojh1c/be3/B+kqgEP3RyETrofGMOCorX4GjlPwdwEfsCCupz8YOUglW+Iw
 on6reCys0UujGKoMufx0xlH2x/NtcikStQg2lSskwerDtk0OrnpgctCLZ5M6LI5cXOQMyOUH/7d
 is4tjf66OjZkPC3tA5qDnTI7Bk5DTOQiZCAtS7RhDYZjIgujcz6U7CEKu7lVKhtdHSxC53KgoVz
 hB0Fne+63teFuSK0PO08c6NSjM3vORikhMQP8rDzA60w/zZDNIhQI8staFliW9UNJU75XhW6dLn
 e3aaB+fio9wpCDbcGGSBJ/KZkjUY75I9Ukvlk4SrRNYXcK+RFnv4M0vZGijMZOKef4iy548WGEH
 Skv4KfTMjqziWY+mptv4FV3KXiE4IfirnE2E+sv8FtiCzK9ZTMNitsPtb1LNL/aAfSg7cuzmurW
 GrscyOK42scuQBEHsBLdrHwacMG/4C1int0eVccvuoozrKOIfrjyhdzdO7vxF7TX78W817apFpJ
 Cf8tcC5/HRaS5xA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94154-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ace4000:email,ade0000:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,ace8000:email,ffe00000:email,0.0.0.1:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E9F61995FE
X-Rspamd-Action: no action

Add csiphy nodes for

- csiphy0
- csiphy1
- csiphy2
- csiphy4

The irregular naming of the PHYs comes directly from the hardware which for
whatever reason skipped csiphy3.

Separating the nodes from CAMSS as we have done with the sensor I2C bus aka
the CCI interface is justified since the CSIPHYs have their own pinouts and
voltage rails.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 115 ++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 38f9da6ad9ca5..9c5ebe1b48ecd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -707,6 +707,25 @@ smem_mem: smem@ffe00000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	qup_opp_table_100mhz: opp-table-qup100mhz {
 		compatible = "operating-points-v2";
 
@@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: csiphy@ace4000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy1: csiphy@ace6000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy2: csiphy@ace8000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy4: csiphy@acec000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.52.0


