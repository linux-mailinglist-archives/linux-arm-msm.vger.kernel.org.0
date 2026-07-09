Return-Path: <linux-arm-msm+bounces-117903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i2ocLYhYT2p6ewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE972E1FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EQJpSQ6r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hg2f5APw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B23C301345D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D318F3EEAFE;
	Thu,  9 Jul 2026 08:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EB3D5647
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:14:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584891; cv=none; b=lfBJxkgsldBJzZkY4vzgJJvzeHbM4FygiM59IlSmg6Ktx9joP0WNWeT6CZAU1gSdv6PRnt9Vp4OKHIINyhcE/zI+VcD1zYEIf7DN2WYnYIU0X12qApywVUuBPW8Vb9lyec1HByaC1+u4J6hsWWxhkvxOw1WidJMNJRlP3neUmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584891; c=relaxed/simple;
	bh=iAyUCdNWaXnAKuA8rgTe47CRvWtrwdezN/415NDCKxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2Pu1BI+szc5B/XjbsC5uAfBq95Zfembb9D7Ss1ol8kTs+4Y93nRuNak0eMzuyhWXGl8aBp2iPma9NwWjNN8iPkPSeRL48x7lhfLSNhI5B5LwOW/ynRKTYmQBtSIKbby+o52JsH953wcy5/Sbwm+zNL9T38eyac9D/73Bv6/cC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQJpSQ6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg2f5APw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66961JIH892630
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	joNEaelkajH+iuUF1ilTWr0pEfxT9XUi7l965s0DVuA=; b=EQJpSQ6rYTbrFkbw
	Ro2bW7BYxF0nxAbQmBSaN5IoHwVN4WVrVAE3c7wECTo6FbMhetMy4KaiLUywmSgS
	90hOr4w+h8x+2ZcyI4vG4rr2wqgcSUmE2DtFzkPMLPrGZz5d5IZQRQ0TvB6QVt4r
	1GnFInXmEFA72LYzSBNYq7YRQWpQQyTmULRymJC1BtBoYitzAaXB0CeKFkTt8NFs
	Iradr2qZBdsdDkhfowpIbt5NyeyvM80sO7Jf7LP8/8ueEw0AQBeZ19Tl1vLyXDP1
	JOFTKCPwv5btm4iFOixXcrriWDlAncFEVQSSaXsgV27vXjqD79a1v7DyEdvJvzpq
	g4rNTA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvtja5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:14:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9667280edeso1182816a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584882; x=1784189682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joNEaelkajH+iuUF1ilTWr0pEfxT9XUi7l965s0DVuA=;
        b=Hg2f5APwKvJ5fNZHJ/+fYh8doyvL3rGqUOevl45NfWlqgsk+O/6Tey0c36ruJs2Dxd
         j4uc+C0WkX2EwSCFWaGt58KVwmtBFmtOcOkslkSEyjiPwdWu2JqpU8oRDXyk2+5p4aa8
         QWXMujn9cuIERIHLGX6layvUqXyF7iotl+/NKHqYr9OP6qfbJ9YQLBweqY2Nv/r1Xv9n
         T0g3lvY8UmKQU8fAUjnY23p9CWXefCYVf+ZvejjGGmaXkaNb8PQ8XuHCyE7na5L9RUSh
         ApT8dHRMIh8sVApvwRo27PiI0YP72eGqRpjfVqPlj9bXbj2t5xI66L4tjKalWbWpIKNc
         1/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584882; x=1784189682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joNEaelkajH+iuUF1ilTWr0pEfxT9XUi7l965s0DVuA=;
        b=BUvCqMtDOTjdJRniIPM6qw1APCxX6hM7XpM8hnyiUmtRyGaGdnZUtmR4fctVWrpTN6
         rUx2s6ZKFKhcdbu0ReaR4Frq4aVcVvHWPweTqnSOmAUp6xzCyqkAR4TD3LStz9iIgMYv
         tOBby27yWmu/9VeU1RnnLZ2E2DSYnY1PIgj/2UV14NtAeeYdlTqk7NSN4m85vFlBFn4v
         y2OzZH25lH2Q58YjHQUren5pG8jqil3lgzR91jG1965Y59oaN1VtNhxVdc3z6N7zRz9w
         xhHHMTMHGsTZALg2QS8YwJokNn03E0bYWF+T4rkFWcr3WZffXgamYqI9CwwfcnktFHaP
         hH8A==
X-Forwarded-Encrypted: i=1; AHgh+Rou/mGUzUiWrw1sX6evym0S0j3idtPiNm3m8QEjidsXGq+UJOfp6XOa1Q0nGCo4tA73AYIHtzJrIy7UmfNB@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOp4j+55eNfkQxw9hdHYEt66BVIRqTo1jhTq2y2pA025zsGRi
	shwQ8cjwL900zjKILTlnCXCpzfc81oJLcD+FRISp4IABsFsBoSeL8I9+2P4bd4rFOSTr6F7yptu
	CrSM9n6Ux3Gd03zgngIJ5o2paztKBXnFYYkNLRf5LMxmpVHfdOLghoN5/adXXvcg6ruIal9AL66
	Fi
X-Gm-Gg: AfdE7cnE/rk65sti32VYvol0N9t2tg0MMJSXo/U3E7WHjjTL7rgg6A9GG1pN5QEc9sQ
	OMqBNOgojkFU+yRIkQJlSbPjgXITEcqz6UXyYyQbHydbZcdnRTcJDh1HWfc30jiNVk7vQLj1UxU
	5kezv4/B9TI/xfrrfflFhFHQAw+JkU81KOXjcGKdRRXZDHKPTI90a/ZxuLEdZsWFpc6sGJAp7An
	7aRxv0Ihxg3HtC+W/FMkMvWDURX+lRFy9b0oZQL5X9UHTMl1tebVV4S4jQaYjqDdU3u6BotiBoZ
	tpumZdG3oZgReQtSJF5UDst/wWz03Etzh2vzxrI3B/qr5XbMyeM5/58d8sP9gI5iZdpQlzUdqq8
	33cg+SAl51xnZ0LfVcl9hhPFEjf+Fkz9Z9RyC2EnmNLqCYzYL4X9PVVahAFMA0A==
X-Received: by 2002:a05:6a21:a345:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c0bd0fa266mr6481173637.37.1783584882313;
        Thu, 09 Jul 2026 01:14:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a345:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c0bd0fa266mr6481139637.37.1783584881773;
        Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm3392290a12.18.2026.07.09.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 01:14:23 -0700
Subject: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for
 Kaanapali SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584879; l=2747;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=iAyUCdNWaXnAKuA8rgTe47CRvWtrwdezN/415NDCKxY=;
 b=kHHnBLlbqPNSSmrsTF4ZfRxW8ZVhv7tZ0xv5L3ccmZE49d3CffvHu6b+4CeGoUqsH84sySuWj
 he1ei332Jx6CUYqCIPXbWdqu0uQO99HdUDABiHo8avlSbDRKHw8e/M4
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX9RQFqHrBITmY
 hzrWhrsS7ztpwMQVI62krZGaAONie1v2cVar6iQeddA62IF7zUi8OxixV9pPl5Pa3ifzbycTJ4M
 cveriqCuLNeMixbDICI2Tkdu6aLcMk4=
X-Proofpoint-GUID: lAzxuEaTkF2jaF9fT0cZMEK1dvS2v_B9
X-Proofpoint-ORIG-GUID: lAzxuEaTkF2jaF9fT0cZMEK1dvS2v_B9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX6s0deWaYMdsl
 Ngd1eLXRlyy39q2qSFuSLNqZ3KWaNf78jJSTyxaHeT2/i/ciBkmuhBVs8U6gKxV0Vf0bjcU6Tbx
 wbcJ7ciwx1tAZ8Ku3ICTP2g/oTJcsB4ebvTVubdAxw49SST+HMSOz8WNGFDepoV6KIRQ73l/UDO
 DwFddbcqvDgN0dfz7enQ4tUU5r2p00YMOK9G92yZ/06ZlAk/zecpw2D+1gj7CtI6J4M5q4ak8vo
 kAfJ10/aRKyG8Ul+xP2Mahe5kLhlVRMmQ1J5qQFbVt37QBp0lMNxAeVNq4cEnfZlzQMv+vop+xx
 oTBdArTQ5Kp16gqaDTz1Bt1U8qxRja+otE1cPzG4TG4oCyTulkMrXPR91KtD5/6e6UOEdEx+6fX
 1qczanXzKDfCG3jpsiOrp+5TzSRrWG0WWm+tQNjrpONlJI1cdUWy3PAiY1nNBbIpbcvZ0LMgc6s
 3kwCGI3l5VaxkBkorcQ==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f5874 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KmcovkxPpf8MbW1-iJgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96CE972E1FD

Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it is
brought up by bootloader.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0518488f358b..ec5330297c7e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -512,6 +512,32 @@ smp2p_cdsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_SOCCP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		soccp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		soccp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -1521,6 +1547,50 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,kaanapali-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccp_dtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,kaanapali-trng", "qcom,trng";
 			reg = <0x0 0x010c3000 0x0 0x1000>;

-- 
2.34.1


