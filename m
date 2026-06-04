Return-Path: <linux-arm-msm+bounces-111193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yw9QNcZuIWpfGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:25:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA64963FD52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:25:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iahYC2Ms;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WqTl0RIf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111193-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111193-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 888BF30C784E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965D443E497;
	Thu,  4 Jun 2026 12:21:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B17143D500
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:21:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575667; cv=none; b=SJJUOAAjD4fbQ/SJGJcTdaRYpGTcJo6a19EFPSGCLlIwLLHB0mcBblOQ1TXMU1tSdK6YNuZK+zig6OCxw0Bd8E+yV4UisF55VM0nyEEEyoxlDvLiIrprzdQ+Rg20Vcz41v+CA7tQgBWhbkf/pZceIu+vuKoXn4FhUa08HL4SuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575667; c=relaxed/simple;
	bh=/jpOAGpGfTpX3U5q0Rg09EQwnkxidnwLRgPO4ZCcQ1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KfPKtMMsjW91FkP6WTj2xtbT+KoBtLmHlo3QMKFieJmoC8+wbktqHnngM2Fx6alhavsW/mR7KfCdzLctcei0M/6CIaR5iDKEbXuJaYc3CE5rahmj1gYZ82sdpZOxsbUUnZNJkO9eB2nS0QXIVDIburxt4Y7yOhZB4SGW/UnmVyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iahYC2Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqTl0RIf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654A0TXf1993518
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6WyR98AIgg4
	IUe1Wpqy4axQJ9fuq1PIaHO7fO2PnnMY=; b=iahYC2Msy4MbQl8aC6ALRod3a0X
	6xYoi+Ihk8ED6bkRBYlA96APRHB6av9TDKGBmuC049PrGdp54AJ+oHis+X7Th0Lj
	HGzWZccJIv946Wk25blqUV6dCx04/Tz/0YdQjXI6rt4ylcloxE6qVKBH4DRInA6x
	gcroqcxl7dZVHzz2w078pA8jDu/Lee/lpMW5wMIs9dbCPI23iiuZBflYWkzKNtcx
	w79umLZIwx3nnt86VFe5US8PqS+EqVE7DO6f41Y0CHY8DI4ytWKcSKuvgRxGAFUK
	IswYASeWnKykycgBPP8uEhvLTEfBHQMThe1zPPsK6VWaWSy/eP7b4NoIzww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8pukdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:21:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2f1d1e5so403716a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780575664; x=1781180464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WyR98AIgg4IUe1Wpqy4axQJ9fuq1PIaHO7fO2PnnMY=;
        b=WqTl0RIffRiBZTc9bYclpa1oOirpRyoLD0lfgVASBd33hLeB+um8fw8w3K64lLhpe4
         30jyDNtAyOL0GisD7W/EZoUqJxXeNsG3VR50088ni19diGqyxEZyQ47gbGU3a6DcwtCD
         8oDGfFXgO7gy+Bxb/GGZ94L5rsNAcWPb8pcuARXb8vagbStP8SqmeO1cNfR3itsrkyWn
         faskdXlfnBlj9rOsZ5EiTlJOZyb+k7/w41ongguScAFdbe3KwqkBwKMCwxbeuWNIVQZe
         FPRNpODcAF2Ts2vwy7/Vi6Yp5DBWmrBSbzHuvoImncJPQ4hwotR1UH+CqsB4NLVqmnDr
         9vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575664; x=1781180464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6WyR98AIgg4IUe1Wpqy4axQJ9fuq1PIaHO7fO2PnnMY=;
        b=a0fzp7PwsgY/OJZQ3vS8dioF1+98wdaZhXjjWpu5hiJa0opK8KuMIF9WC+CGD4EKKl
         VsoJ2PDm7pFHlNWrKTaLULRreBasHMCw11alX3MwvtI53S14YnSag3D/aro32dEpU71N
         oM0deK0dBZhGOaZmBpqoPohby1EUVYrz/e4FZvC/Bo5fJ5FQj5H25XrltU5st5nIfhIW
         YHvOWy6ec2dEcu+M8TUch+dTbE1zL9XKQXIoHv4GDkx7CL1vpq8mjfyf2HbU4jl/ln3e
         OwKQwothM1T5oKLps4yFW25uiUZU45dynK/ZAxL5tGZLD1HbU31m3FRdNHv/9qZbR/b/
         daog==
X-Gm-Message-State: AOJu0Yzjy8TV54Us3UZA9dsAC/iCYBkSxlC4y5z7nUSERMmw7mQKEAA2
	UkA1HQycaOgtqi89BjxP6lNKD930efIh7ZyayH0dDxlOrKUYR6xfW+D9dCmle1vq8A1OrUnuXSx
	T/hkQ5wQgzf6mpJs5RyDbD7YNB90sRjhYiJQ7bQJwlAH80pUqh/0MjgKZNKhVhOrK7suu
X-Gm-Gg: Acq92OGs/vh0cmq/WwaiNCQZqs4stVgJiRx2o9t+pTTvBaVmEI6eprLVuLkpHcNLuCz
	7Xn7N76ouwyeV9kbBIg3asFEMXeheGwbaGgCjATGk4SRU/hd1QpaLd39R0odD1D4dpVLIxoIeIP
	xLUgThDQ9sDL3zkoDvONTQNFPnSHGKOsen5qCyi8k9vtbeNepKu49n7DqldnYmop18o0C4/t7le
	Ui/5WjSUB/FQxjrKOf1sHCUMtnbIy+7t1tfne5N1Km+KbBmhyyiJjTnDIFaB/nhVafJ4rH1jVm+
	9Zp8y6dAOB/MCmAJnwI/1L58x09bX3ilTeN3ZR2kiRsfqjxqXLqwuQCdrruKRfTPuRPAES4l/8l
	u9jmq8HNUz9AoqKiho6P9t/tS/iyODpKI7iFLYKXNPWTJfOjFzG05XUqMsqIVRYPuLlA=
X-Received: by 2002:a05:6a21:3b89:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3b4979e9b64mr8576165637.37.1780575664075;
        Thu, 04 Jun 2026 05:21:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b89:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3b4979e9b64mr8576110637.37.1780575663548;
        Thu, 04 Jun 2026 05:21:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm4796903a12.12.2026.06.04.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:21:03 -0700 (PDT)
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
Subject: [PATCH V1 1/2] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Thu,  4 Jun 2026 17:50:44 +0530
Message-Id: <20260604122045.494712-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6NM_Y7gRBEr-HCMAlWkJpBfzKY8s44u4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExOSBTYWx0ZWRfX1TvKQ4mzM5U5
 YieahxyCnEIYijXjsaRwKB6TAbGhXAywMc8wKkzK4YE8vP6TQbVtg+qsGrgcOdBNPGizUvlNxvG
 MUIPzQriVQlkUpPtLhYM0g2dzHBOWZZAMsa+OPArTr1x9t5D2H7sVxTLMdu2gJG2rqkAVGvwZZD
 u+FMPfbQtZ6tk7lBYuvEG5rVC7r5hSsn2EruJOaSSg7LXpMC741AE7OipbVK9DO2wIuerdxP9+0
 gh9Bh0OhdxHyd54VB8bAbHsZ2odx7Raj1e0bi7HHZkw+PosGvJv14qd0Bi5KXsinGM5q/YDFuxk
 OEbA9pRo4IEcTLxSqTtdByDeMsQa7VrCtsWEcKBedaPcnWi/d3uEbevYVWWRQVBAW2Xc/LbkdFP
 9P3LxGfHFqG94h5V4nKlszC19iDfdcVkzPTekxjGCgnN1AYDX3/syue+SJYAgF+fDxgzCbwUTVR
 ZJM01Mec1lsrhsOixRA==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a216db1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LDB5gES_c2OzCmg7MN4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 6NM_Y7gRBEr-HCMAlWkJpBfzKY8s44u4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-111193-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA64963FD52

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6bac6ebac8da..6733f2efe60a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -827,6 +827,53 @@ rclk-pins {
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
@@ -1079,6 +1126,52 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x4784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+					 <&gcc GCC_SDCC2_APPS_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "core", "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					&config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
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


