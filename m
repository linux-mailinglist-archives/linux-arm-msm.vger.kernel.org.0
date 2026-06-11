Return-Path: <linux-arm-msm+bounces-112607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EbqwOd1DKmq1lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3B66E6F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DuGfEhmQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SPX0ICYI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112607-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112607-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43AE7307D754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE4D393DDD;
	Thu, 11 Jun 2026 05:01:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3338D01E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154070; cv=none; b=EjfaB+J4horhjNgF5ou/qz1mPmrR0HVgrN334BBm5Tm16579WoF2aDZUAC5g82k6wZWl+vhIqjKwFiG1q69dPuUwreRzltTZn+0Cfd+RPAM3CdNTQm/OevC392MMCADyfi3ACOYnJ4fRtG67sL187IzOfnMXu6b7vY2WIft4saA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154070; c=relaxed/simple;
	bh=rO/iIGXGAzRV0bPN1Wdrf39uKj8hTElqX5Zi1YS8KEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDyDto2H48FDIv+wVtXyC5Y7mQSuzJJacXif5YarKre4byhTvo87E0Q/4NF20lqvKWLAzgWPoQAZ9bZD21+TIenSOMge9bec+EcWd3hQ5zKs0Hrng+xdNA7A7fH1mHu1UL6rTQoNyUsTxnl9v7qHBJEC1JWjtlntSm8O6hi8uYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuGfEhmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPX0ICYI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NXBL3212508
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2Lp9Ym6oc4mGbkXcB2SPNJ/kf5iosAK5AHCwoCZxJw=; b=DuGfEhmQoIobA1FW
	uO+3c2pe2sgocTLxi94aX67wZBwMkxxQzvpvhmv9y3vQHFkh9Rv8vj5Z2JZlfqEK
	BJc+gtntWji2/vmJF0SfIp+br/TTwL5wT29H+Q6HkmqvqXviRrozf60uKnLpDRPG
	eyfdZp49wAhBWWAD+XU+LSSM7BpnppU8dHzm6h2w5NAs36BSCX4yZDR0lKUKYPPo
	1w2MzdqXNLYr72EtT5dMEwgNoD0Ui/KcXANO8PRwDpomEz4gSdDaHQSHXLu+kXTL
	qBPTlm7Nt/7G3RObl2pGjE0rR1p21Vqt+TwbPiLAgiJFQs/C/oFAyab0CUR8YBH2
	4wHMAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701nef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf3636d6c0so79384135ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154054; x=1781758854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2Lp9Ym6oc4mGbkXcB2SPNJ/kf5iosAK5AHCwoCZxJw=;
        b=SPX0ICYInn/MVnBf15PVwHAiprFd8bFTvFXNAU7n87RdizLEkp7zCXq+EK3CdKrhua
         8xytaRewFW03c9RSh+/27OAlppo1A0E+bmVvLVsi141UXoedm6K/h+E/A0aBzRsJglj3
         f2C4/SqP3Gi4prrtIYyxwYoTLIm8+Il3I4IixSpHUr7LQrzi9YR7QouqJepKZcmwZS27
         I6V6AWbCzRPxiqrrsw5I5VvA9xUUJYu4ShAGMxE75xMW/1UnG7mnlcEuuBQ+W3lEvxjz
         aPX/dioTaI1Dys1hkNI10izu3qQ8vSUmmmUS94T6cutUZhLiXmm4fkviS1o54n5Kcgow
         Q8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154054; x=1781758854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2Lp9Ym6oc4mGbkXcB2SPNJ/kf5iosAK5AHCwoCZxJw=;
        b=N4wNOPQah5jU9FU3XmheWmvCNAUcXWwxvoIYsQwvStrZv90wirz3ra2YXGr5g5auoq
         5u0l5SUdF1byDMJqnVDkhZIjvLkJvBw65/1qmLZ54gBoCQtGx5fzpl2u8VMh1S8XHY82
         WBiFcKyFaByENw4IrKxSgcMLypa4NRyw3xxo3oU4GLEd5bY8mmtzKy/8tCHx58eZEXaa
         JfcVEXH3rZHzy82xjoXuUDsiGATfZcMmIVU7orYJByygDFPZsAjIwHYSfoJ+4wCC72+8
         Dud8MxjRbYS9p44dZcVG89E0VCzifgFQxy8TvyTrMkGzaRmdHmcWFI0jhVbS4GpmIQhk
         mPxw==
X-Gm-Message-State: AOJu0YwkMPDcXaPCZdcx5cE1b5Snw8ALeZk0UyBxOz3iNLAzJP4IdF11
	z9JjHN26utiJbx/Aenh0fwwSpE5I63ktOOn+IqH6q5+glRmKs01vZOPn5z0xFopmNoUTQTxNzqn
	VNVbOf8kEU6KLPzGjidXptDXMIKrERXZmbRtXvo8ZOjuRg9BF2AeMU3ZvOras9/QLJZjQQPBYu3
	PO
X-Gm-Gg: Acq92OHF6y0pMtrS2yCx1sauo77l+b5ewXMdpySXTguT6nc5jsmjhHy71A/86p/J3PV
	eXBAMwJ3n/Od8CUCDWM2F/1E8WjOIIc2qjzBNYejTnB+5xwnxOSSFZd+w8ybHDLK9sYLdl/BU51
	tH0x1AWs/Vscnp2UqhC6Fu89RLnsRLID9m0LmTCVLpAPi9j0nO1a7AT7OiGYxDnykTbJCrQJS6a
	+qEDL4qECfC9f4lpfG1n4KSV0NhBakQx4di8j26TOcWdNPDaT15bPcvEryfecrmZSkG9CO90xfq
	bPg22d1HG7CErBPAqtu/jjRyq3GAm3pKnFsbVM44h8UkrDOpv+9AtgHGSejsf2q3P7aW6xKrOQG
	ZOYvaLABTnvUOZ8mClASOPG+UBoxSLR8KM8ZtyO6XXYZJ5+ztsqN5iU0LY+GH7xyTEA0=
X-Received: by 2002:a17:902:cec1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c2f14f7c14mr14242925ad.12.1781154053671;
        Wed, 10 Jun 2026 22:00:53 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c2f14f7c14mr14242545ad.12.1781154053095;
        Wed, 10 Jun 2026 22:00:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:06 +0530
Subject: [PATCH v2 30/37] arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-30-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2967;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rO/iIGXGAzRV0bPN1Wdrf39uKj8hTElqX5Zi1YS8KEw=;
 b=8FOwzy40OiaaIr6qQt/4U/rPGV1MXPBh1cPWkhGpkqTdFfams5oOh87uK4U26MHebYFqh28xA
 gFjqb4UWW9nDEKorKyXMSxGv9SOigs6YoUoy5B5nm8UnetsuQFLquP2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 8tO3mR5dwbNGqr5jeMFLl5tUAUkNAcJM
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a4107 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3P9gA7pnNHio
 662iAmLXIkVx+C0/yayrFHld8U77qfX/tKskvdYFPthkS0XMug8YtdSPE8twuxkKbTzu6d2Zq+k
 7nEMDPFG2aiqNbG6cxDoRnzzIiEc21VoOyjs2D9URFziU5BJDVhJvv4TU5bqicIhQ09UyCEvUl+
 uInVt9d+Cu6FgSLJ/FapZdZmdKRqsoB89aufnAcKtmnLQE+zv+5mzuOlr6hakXOclSX346o1ZRv
 BoBWGmZZ+4Fb/qJZCAgEbHgiTyxW/ltXBbb/UX5F1Tj/elG852OqEZW9LdMszrrJ/x7pwdo5Wp8
 gfs/enUJ6Y33FH3syanvbuYTHz5V07dS2qQE1sC0EQ6YRh3hsetPTpAfzqdTDDdX4AXMZiUHuu6
 ErzWLeOAEAYroikSztnX6+dvzedWNsIa/Gv1U6r/pTnhoO2Nmzokgt3nwgGkWn03FmJ6dJMxGek
 eBmTa04pCqn8OGYJtQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX31JS1vujSWUR
 6JIsQSeMe4VOBhxH1uuBzYouTPhN11aSXu3D1kivzPFYW6wGG6Nw3M9BvckcbVf4XXqYs2DGeTs
 6dvYwaNjUymYk9Y5gXOsyDDgFZ2kieA=
X-Proofpoint-ORIG-GUID: 8tO3mR5dwbNGqr5jeMFLl5tUAUkNAcJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112607-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61B3B66E6F5

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index eca66d1c1c5b..a5e2a16f6213 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2198,12 +2198,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 			dma-coherent;
@@ -2218,6 +2212,10 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2325,19 +2323,13 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2345,6 +2337,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2452,19 +2448,13 @@ pcie2: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_2_GDSC>;
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2472,6 +2462,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2_phy>;
+				reset-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.34.1


