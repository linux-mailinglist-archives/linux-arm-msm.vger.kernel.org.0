Return-Path: <linux-arm-msm+bounces-113468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hGkRCmCvMWqIpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:17:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB469523D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:17:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nDANkykV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zmy7CgYK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113468-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113468-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54205323B421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2295338756E;
	Tue, 16 Jun 2026 20:15:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA24386C1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640908; cv=none; b=qPLXBAkG2+iddqDDwqyqmkYmEfgnxulZI5/xyHUJdRZpRfGaf2tGu/EUB7qiifoiBSEMqFCtrVJ4Unson3zc0jFosC1pLqXR06bSCXvzIY89zsSSbX1DHHnhRniiVNITWucNX8NXPPEn6UDjnmSG6sIHOTfwyTZfdXxAhuSyhfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640908; c=relaxed/simple;
	bh=KBFBZwrujTG9inalXa4ycF5lm9sglzFWJLDvgKHDRUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RvI8A47QkPKlYLc84/1xahzgfdMxWqEnBSbT4YhhITRV9rOgfHDj3YPUZeW/3YvT/4t8vAJjHFJLVEguomI467xn472ypF+ORNGLWalVRTDlXb0p3XjLeXh6mtP52U2fHtCnPbAVUlvyoAaWJUPs2skEHPZxZ4xMgD56bqdLwCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDANkykV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmy7CgYK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOQtQ3913493
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z7KU4LEbOgB
	f/iaK3Hv7v/YJfdCIa62CS+r2d5DnE3A=; b=nDANkykVnMjbK1ugv25VyHIULev
	d+xhCQUNnVAuI46nE/11Yrv588tAfLGQDzcyI/9+Vwlbi6EDd/YnXSKphVN8wQ8K
	4fh+z/9qAjeE8fYULsXIA4FakCraI2gg6GNhWKrTmIxYKvYTca6HcVerZoifL2eK
	u0+XEofjD7CaS5uw5xjgWEj8+pZsYJrAyJt9qL/FG/CprtgtKsTfwkVSI5s7azc7
	Os5MDeuJxrXdqoTgVlhyKxGpuBK+YYsAUn+jKvZJ9n4+aq3qMCXn+LWrtRHDP3L4
	WrrvOsgWk8dY+f5Rq7DkYtJ+bCSQ6eKZtD5T4Mk6mK4+HS7069Z4UUxQmWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7v0mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c40358e114so57694475ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640905; x=1782245705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7KU4LEbOgBf/iaK3Hv7v/YJfdCIa62CS+r2d5DnE3A=;
        b=Zmy7CgYKn8jHJLCwn99u3F0dYPm6Mi0GHlo3clif5OH/Nwh9xYYhvy4uZBGvSHV+GA
         /spdGjChRDXjMSU3r71Lh39GccGqoPhrd0IFxC8MNuxGjeW9wWqbgyMOJkidIiJzKJz1
         w1ScWdNjrcq44/HC8ZB290kHzveU79US1rWN16ibKGK4TZSl6weJjPPGp2BtErZkSgRK
         To0zKIkMn6vtO8a8b43ByGhxtU3c2U1A4XEoPUMkk28dQ6YyG8b3J4JvUVqd8D9ytod6
         9ZYmY0anAaHN3t1sMAPh+8H6Abf/wi+dDlO8Tfnc6/ZfQY2u/G9W/By685DboAxbcLTk
         kYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640905; x=1782245705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7KU4LEbOgBf/iaK3Hv7v/YJfdCIa62CS+r2d5DnE3A=;
        b=NsWWNIm8M83/xk0T+c9uQzOwJRU52/ZSKOK6X5M40yAGQXovm3prl2vn+YqXc13ijB
         w9mP50teoqL3yTxmWZ4SeNkU9os6uXobOTlvMgW8mI+w5vMSS0Y3qztH/nu5iWqbFiYC
         d/nTzOw5YsIG8I2NY0qhtNouiQUviEhRMesv67KzZvU3UxKfbkjap6sDR08GD37PAZH0
         HWjA08+bGPL/J8aDLJITCvN82FxbkMy3me+T2/UuQ2xamhn9S+m0Zcxs/RKcfkOL3aEQ
         QpLjMASe8OAUmVfRJ4UQSXcBgOelYfrOn+U/DAdwyC+08UeYJ1Pdi8pw1RVDbNukfXG7
         DCVA==
X-Forwarded-Encrypted: i=1; AFNElJ/yQjVMs8nVWM765HfRUYG5GZf4HuoNGS3Cbt0+YDGtRyV88DTPfBJvZUsbykDEyF5uWT7X/wsnfRnF/6jv@vger.kernel.org
X-Gm-Message-State: AOJu0YysolymyLhuB51P9M/WVAb+s2c295CP7JvFKmVS+wtUbi/Ng6OB
	Z8tJD2gFiBHAM7F9y5xJr8WQWteDAg9KIyQTENkAzcJ+7WNMGbaePfOZffh/ujxP8xlDxXKb0v8
	fF5DFp4YyoxHLaUF2z2TEyBY8xYc3lUYqwIOpIK/C7mZOx9oG/f94mizXpZDMHdSSFSg/
X-Gm-Gg: AfdE7ck3KEXJtsI8Pav7RJLhBEGlDrbwvohF7cexScTRgw+OIWaTKKP24XDPnXi3sQh
	rjNGoWTAXdKLLb8mFljaoMsFf1qhbPhmYxC0fEmRxBwmRtnt/8lhC12t30VcU+G58VQQMwiLUVg
	lxFS6tlCqKiwfowsbNnXjxD60qUZO0KKW0TlbVfdVAPkseJy9vZp0M+NP9TOYh7L5y4n6+P2iqf
	Qi4z/8qFs7/JwKDyHcYvUtMXstGwoY+AESlkRr8z+6H+CZfp0rIFKsHBN6KGTQdjERwcCedVadP
	yYd5qsXsPbuqohZGnT3mnBiPuhcKi7+i59JWwU8W7q5qypd4K/6/2rpJDwFiezyRBrGOR2IorPm
	EgLM8IXmZjgPcGJRVbaNfQqpoY+C5YaaBdHICWpHc/7CdKjKlnCp/9oZHrg==
X-Received: by 2002:a17:902:e892:b0:2c2:f675:32c5 with SMTP id d9443c01a7336-2c6bc256394mr5575745ad.29.1781640905215;
        Tue, 16 Jun 2026 13:15:05 -0700 (PDT)
X-Received: by 2002:a17:902:e892:b0:2c2:f675:32c5 with SMTP id d9443c01a7336-2c6bc256394mr5575455ad.29.1781640904764;
        Tue, 16 Jun 2026 13:15:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro nodes
Date: Wed, 17 Jun 2026 01:43:11 +0530
Message-Id: <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX7HjYmEe/PyyM
 LPZUMIuPn6ZNMCJJQ0677GtwEHCGHSEGMJVe0SAlfNYxyTAD8hpONfyp27BSjoIgEdQH2D/JGnz
 DDz1S28h61fuEc70Y+/xqqS/TlnY/4xwMPWT3YjrqzEBRUzV2NZosJfJZwchAoDhfRnlxVsBFiD
 GaZmPXDkcVaIXSA6cLvwqolZ5KADaS0beuE5N5fADMn+eip/E+fBZZokvH9gRiSm3fR4qUX2OE4
 gH/HD2ROOCiksOE01pQ7M5B2QMy2tTik74Goe079VlcxXXYxBY7CrPS2GrYLC5x+5j2RyF00r56
 SjD3D955B0fp7yPYcDsQn0A74jArqVnsNVZg7DkeVBR0u77Wt43xQ+ijdnknfyUZgIhLyVZqQBb
 FIhQ0aWzfEvADCOaHzf1OOFojEChrJms9SjyRYm2st8Z3Mlhh/Fv2RjYQcAYJXhvtUHI6eEZwOf
 sFhzbpF02LoxqQY1t9A==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a31aec9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QvYcBxd3YisHp5ETNPQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Q0lMWa6EnaAE745g3ex3AG58gvqKO6Uv
X-Proofpoint-GUID: Q0lMWa6EnaAE745g3ex3AG58gvqKO6Uv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX3u43xrdBeOyj
 Tx/CVXeRH74Y1IQ/D/sYz06G/roVYrp2I7YBGscLlHM8l+qSVDVQN+wpgWuQLuM2Ip/NbTHmsf8
 gpS2yIwPot/g4UsWYelzC2NeVSvDvUU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113468-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75FB469523D

Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
DMIC and SWR pinctrl states required by the audio data path.

Keep these nodes disabled in shikra.dtsi so board dts files can selectively
enable and configure them.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 171 +++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 3df09cfd17a4..0ed73b948588 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -833,6 +833,70 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio96";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio97";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio98";
+					function = "dmic";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio99";
+					function = "dmic";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio105";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio106";
+					function = "swr0_tx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio107";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio108", "gpio109";
+					function = "swr0_rx";
+					drive-strength = <8>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		pmu@c91000 {
@@ -2114,6 +2178,113 @@ audiocorecc: clock-controller@a0a0000 {
 			status = "disabled";
 		};
 
+		rxmacro: codec@a040000 {
+			compatible = "qcom,shikra-lpass-rx-macro";
+			reg = <0x0 0x0a040000 0x0 0x1000>;
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		swr0: soundwire@a060000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x0a060000 0x0 0x10000>;
+			qcom,swr-master-ee-val = <0>;
+
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			resets = <&audiocorecc AUDIO_CORE_CSR_RX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		vamacro: codec@a078000 {
+			compatible = "qcom,shikra-lpass-va-macro";
+			reg = <0x0 0x0a078000 0x0 0x2000>;
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			clocks = <&audiocorecc AUDIO_CORE_CC_TX_MCLK_CLK>,
+				 <&audiocorecc AUDIO_CORE_CC_TX_MCLK_2X_CLK>;
+			clock-names = "mclk",
+				      "npl";
+
+			#clock-cells = <0>;
+			#sound-dai-cells = <1>;
+			clock-output-names = "fsgen";
+			status = "disabled";
+		};
+
+		swr1: soundwire@a080000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x0a080000 0x0 0x10000>;
+			qcom,swr-master-ee-val = <0>;
+
+			interrupts = <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "core", "wakeup";
+
+			clocks = <&vamacro>;
+			clock-names = "iface";
+
+			label = "VA_TX";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			resets = <&audiocorecc AUDIO_CORE_CSR_TX_SWR_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;
-- 
2.34.1


