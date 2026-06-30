Return-Path: <linux-arm-msm+bounces-115518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RacWCRj3Q2rvmAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:04:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7C6E6BB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:04:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E3fGs32G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y0gRl0wQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115518-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115518-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B5DC3162EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772533D88F6;
	Tue, 30 Jun 2026 16:57:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626026FA7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838643; cv=none; b=dKI1cPy6IeoeBoQcu48oeL2qrdPw3ONfR2GiCdSG/3Xci2t/p1DwmP1dqvU5l5ktL6DNE3wSitArKAA3k+/xNF5L9X7Unt3KYjq1zkU5jypKGVdzOmtsOligB+Y5OEOeJcZ9gwZmY8IXPPpgIBdbkRX3KAHULptHjkCoyVmZ0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838643; c=relaxed/simple;
	bh=7dZnfERlDQb7BhudKK2Sq6SR1qLriZjh5wi8+K13iEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOZNZ6PMJJy8pVqoV9sEmr2aJ/9/D0Hujze0BtoTp3/F3yZuZAjZtqI4VXtrtVB3RTqjtrI0PeW/sbk9a9V2bODCSgr4eRIDL6dMRUrZHjwJPDqMCZt9j9tOYIPc8vd8VcAv2ZE5nuVmo9hQPRtplr170ZLdVDy0KeRNjo5cZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3fGs32G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0gRl0wQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UG3usw2481525
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=StVoceAKTdq
	K+qw8Y2JzYWOdg/02lGruQodIjHI1xpo=; b=E3fGs32G4FiVGENax5vkCZA70nd
	daTpi7K4rcA1biUAKGRI5Zv46UQbwidc6WefUQ57r2kqOVcSE6V9sKK0TrZV+aCC
	qYgPsjBe21ir3msx/aX0e1vy+apo6TjxROHF3Iy/s180DVaKPupRBGxoGKvPOCyO
	0xTansJL8Z/tzpMW5SAKUk64I+h+qGfkiFXoEla/f23LoOrKIp22wMH4f3H0oT1J
	uz6fJQA9oUbyixiflWpknvgugRTdfRY+f8ALdetkzam75Tv6ljH+yjKpdyEDWQtv
	1XLXnbvXcxi6mLBnlK8D4UnlZS4YHcoaYrKwAs2iIkm+TM0es7ec7XjtSng==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0ar8y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 16:57:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137fc6f8e9fso8587564c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782838640; x=1783443440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StVoceAKTdqK+qw8Y2JzYWOdg/02lGruQodIjHI1xpo=;
        b=Y0gRl0wQQma9fpeLyMPD9AfHVzu7ALpKgWql4v9zi8p4qe3VHWU/Rv1ykwvEd7sjWl
         wff12isFt9xYzkkE7pqbnOd1ExuqG61ES74Vj895VgCJCf2DhHuddgIW6uV5kak6FUdt
         /6F6t31/raAxTN9csQesHSmnLKTprfF/xNcZannytgYEcHqlnu+1IgrHsxdfzEVv4Tue
         9YwP6n77/vNlMNfjDcfT2jNPc1uQ/kRjKfM8UClbJK4LboM+VYfKMLA8JsTgv/XgehIS
         ZycRFw4SqM3p3uwYFnhudG9VQMeRK5GQTEGAF+QoSYPLRF5l88XMzGAoQzSnYLvsaypJ
         ETVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838640; x=1783443440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StVoceAKTdqK+qw8Y2JzYWOdg/02lGruQodIjHI1xpo=;
        b=M5Nx7IRPdhjdsawus4VYE3pBWFqEIk+UNP84CwArnhaVnzcfpXjECWglkWDDHEFLpR
         qd9JxqmPfCM5TbOf9Sd4kW7fcF5nXKecYNkNAXCAmwIon7YolZt3jnSVYt2aYYQyq2kj
         MjDmi9wkguhzEfKIUlzTFxQC2aOe/yiU3QA/q4TAxFZNWr2vzWy4x9ELuo0k9LSC7Inb
         cbTF4veEEE5b7pb6uesnoT3MUbIsZo+W+pTg1LdRe06QbbIIuRo7FNDyQikTgPoa/vXT
         qDFIE3wfNT0bCL139OPJsU/VYhip1WIRZPec5UzhKZqpeA4DpqUryU5b6dKqEUMGR7C9
         A1fw==
X-Gm-Message-State: AOJu0YyOZCGNsJMpNDdRJ/xN9ySFBNQIX1BigAMPCiOvYUfqBV7MVSia
	mrMlAlw9kXfxHCZY2IudAUg+F5MRu8AgO7fHemUl7tHZHQQjMF31PjE0r3CuhSW99HU1NxJOxKi
	uVZ3CfTDfRZa5ijTZfIVAGcdsLxyjgIGC4lpPrqpHYI0MrR5QdAFEfr4+ZFErvUr4Pp6f
X-Gm-Gg: AfdE7clrdWCha52hboHV8aYKM7jZLZ2DSqr5tpEvzogMjF8ZSED1qpAc1CnAqMlX4sU
	GQ8xq/7Ej8vnBFjDMsBJoLVqrAeHi2LvVqqRyZp3RuTuy7NbaPR8EoZhBN/HvM36zeBoRNFITRb
	gidKhYLYLGpcjluEiG7bE0IaySHuy0mWUq7Vsd0nSTceyTSyN2ngNTV2pBp75fVW2A/t2fnkX/a
	NCreI7FTJf93qdDe84dzGNb7txFmKXR+6GzEQDbiRyg2JxXpQDu+FbGpfz8RS5Y3yKoD+lUUzaV
	sGfUxPXIpCw2cM86TdX+vAuefKIiPNmIZV7dUUS+tsGhqzI6fys19kCkQTVGOzLXW0ndWZG9TZW
	m9XbXbksKO9tFlB3e2UAVpZcuwt98HGhLn2Dx3iPOVf/gvQ==
X-Received: by 2002:a05:7022:672a:b0:138:6ef:45c6 with SMTP id a92af1059eb24-13b2a1572d6mr2901692c88.11.1782838640100;
        Tue, 30 Jun 2026 09:57:20 -0700 (PDT)
X-Received: by 2002:a05:7022:672a:b0:138:6ef:45c6 with SMTP id a92af1059eb24-13b2a1572d6mr2901665c88.11.1782838639548;
        Tue, 30 Jun 2026 09:57:19 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm12690272c88.0.2026.06.30.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:57:19 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Tue, 30 Jun 2026 22:26:59 +0530
Message-Id: <20260630165700.1886608-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a43f571 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LDB5gES_c2OzCmg7MN4A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: r_5zeoBjIshwGbErYFBF8RHAPMXYbOBj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX5TWm8AbMim0p
 8I1f6Rck3NRmzHh6kO6FwjE1U/7cFfymci82KdGuJs59U0plB3i35v8dqo4Td3v7Cm0BxsWV2yR
 JVciyju/090FNUTulDheVxsQGDUssvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfXxp12sbuYio8o
 Ayy2jD5PSytNI4gnsb6i932gaFBGgTKus/iLZRnbj1/QvcXU/Au6f9mep6RVoOFO6bO3VLGqSFm
 CUwUfK/mlYnPzil8mo/ToEDSb/2S70GHpUVsjpIXNI/YYfcC3jYolhBgGi896bTjiuWNXFX99uE
 qRWDwSqIDa0/OMsONutkyCpTi6XuN30mmZ9HTfekPrf0TSSiCJ/Pc5nQkFLo6yauRkMhiGN5f+/
 jYjrcQK6q0Y4FnvpF5uFPOKn+A9oB3fKOFaglQZlpf2Mrq6W12krVSV2hIXEcdHR+9JYo4AfNiT
 v7I6nnTJn71xK3copVRxRfHvm3QPnpvyv4nT4dlfT9lpHX5GhU7q0X8/rKEBosAPkbr+jRWuG9P
 V4RmQGcnxkz8eTHrXKF4TLYhQR95UTDoM74VPO+Bxcq1UdZJWMFotK4MVrJxgFdYRRSPhDnKqKa
 t6U2H2o6kaq9j8Mooag==
X-Proofpoint-GUID: r_5zeoBjIshwGbErYFBF8RHAPMXYbOBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CA7C6E6BB5

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..cfdee8a2526e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -829,6 +829,53 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <14>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_card_det_n: sd-card-det-n-state {
+				pins = "gpio89";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		pmu@c91000 {
@@ -1081,6 +1128,56 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x4784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-2 {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;
-- 
2.34.1


