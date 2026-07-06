Return-Path: <linux-arm-msm+bounces-116648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ov9pBQdiS2r9QQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A770DE66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j7xdpuU4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZgGg5rLf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116648-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116648-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AE6232BAE16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B9A3C98B9;
	Mon,  6 Jul 2026 06:42:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D444412277
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:42:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320171; cv=none; b=sc58hwcVIdLx/n70l4A3Iz5oi+gQLEbonV/NXbZv8py1F8mLiKiUuZYh6KK7vBd2/MBaZLXiZ8+NjebkKFQctqPG4Wz8bRR1JrctshrDA74BJy3pINf7mT59Tkhf3iqxGTaogNDDpJdDZJW7kYYymS24/he+IjbvCXxVKLOV2NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320171; c=relaxed/simple;
	bh=s04XVAEVnG9KkqB53E1WQicRpE+CeuICR5c9XprgAfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InOuxHzOGXaXQRv5K0OWQhLZ3K46syq+TCWbZ5Vi2jdQzaCkDdqgsu31BRITWv27eTcoDbUlZx11pLbZG+n1Gz8ayDi2+BHnW9RqUMlFXWH/GojnAOPBQK+p5U7fUNvSIShbX03LHB7z6TdGFm+lxpqZF/FgJa1E8Pm4JvqaemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7xdpuU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgGg5rLf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SO43470425
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CHahF2AuIFC
	nyRgrN9VERad5zx57UjOdarWckgEUsKY=; b=j7xdpuU4VlMVIVfm3JJfshGTRua
	hjt0QzVapROi9bDbbH0X0/bAdDYS2fBgMfhzOkwsubQdRzpTnBWs7m1oAN3ABgGD
	wAKDz2SCqaCppQby60ZY8bGLczsX921wrvSYeZXJjj2hYCZwPsEhsISD6aYH1Qi+
	wFW5evNpCe5n73JlMohXyPnxDC+lCaVnBpjUtaMaLmfoYLZHUzLuajW270gcLHGU
	wBSMxDW58ES8pRBmkbY6UtbOXyBdSG8JZm3nPXfuTxEN2MPZwqrLSU4gC5GR513j
	wAvV5jtb53j0C5a9MXtgZMFe52CvEUHQYM2ns3XzKS5dgxVy1haiwjDfnFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemr3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:42:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cb7a3eso503450485a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320158; x=1783924958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHahF2AuIFCnyRgrN9VERad5zx57UjOdarWckgEUsKY=;
        b=ZgGg5rLf+PoRER3Sx2xxyyB7ZmI2TilCfeCycnWsUyksgQb1Wi4Q2jzce/XFFhD+oy
         +5G+oG61DU4agguyFOFjJa4zNN9XrAbgTW6pnYL9g6kDOjiFv1ijwI8x5aQhHXYRHy0f
         SajiFCwBZk3v2/I5Eexub9ALi918Ys/CThniomgYH0legR8Z0afh4UIc+AH8Z3dxZgX2
         yjOHy7UiP7P5tFfj1dZF9jlMEXQQoOun99QsFNSyuob8CMClsPRI9XOv4amreqg/IaY5
         39lZM5WNeyGnpvlOwsUvHDHDE/eyoy96/HH2aw8yzOMb/4muLQxsbvBcu2/M3liOsKcu
         Hcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320158; x=1783924958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHahF2AuIFCnyRgrN9VERad5zx57UjOdarWckgEUsKY=;
        b=PLXKpE0h3B8Nroc8LDQaImrczban+/me4VNDLEAuWOkNmvy/F2OQQob9bUt3CjXNv5
         F1dwP9+6hbZU5NUSarepsIyoJO4MPmO5SC8UChLsKcAneEPKP40lnjEkunOnUzUSPiWu
         LTS5B6C3khva6gG5lSvEnbX+wjwE16F6PbwjhwbVjCIqjvY4NQHK+hFOBvkQ16cmTh4/
         ZnO9HO+fKta5r2MDrT5y99cJfqGMIW4bMm8hJtuywLjr7sf+riimYBToz/0VxDajYKl+
         bHEKB9AmNfaM3iyetsn2PNnKuTJ74Fd7xtu7Bw5wVZi8U1vahAcCTO/tE4pH69AVOjOH
         BNMw==
X-Forwarded-Encrypted: i=1; AHgh+RrUJZuYI6wX3uW76aiWEAudtCwRYqH4PrIEzmjz4s4z0aWnBizdvuLzmw3PxHcQUANZuW9hM5R/Occe4PSy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx42mAiY0O1OsgQfTWvBrR1snSQpH2JX6HAULOYzbL45OuGMd2f
	zjqaYKvmhPuKnxFfyOK/Pq/PiaNqw9p/1KjaWo5z3iyWux4nk4stbI+omIv5ZYIu12ybiSOvFaG
	4NSINJeE9mxSBxU0RBdSoHiIQYzYnB28XXnJzX5N08dAOISLMwZoDd9Z+2vXC/t1fiFNR
X-Gm-Gg: AfdE7cnMzjvZvj/avi8P0mb/BnnnGCPtspK0LFYe2hcXoSBPfV0t3+C8EMwsx0wrOXs
	+dqp1IkXED97ozZPNaHpwjjT7sw0b3xXueHqCoer9KQdIbsyjETRLjjOjzoGlRWv3iADOiWZ68U
	hQcu050qp3h1L6atoCg6zgkYFvW1F112meyWotSf0zsq6joNqJJnjaEa4gczIRw6Gs8T7QIIaoj
	Svo7aUgdalGdhwpfEkYPNn8UU0l4GQeiJfjuKkw/8BXnK9UcDjhzSNmr2dwDzcTt7KnNnjARcpm
	g0hyOF5xZWkFE8ME1vWGwKK9A+14sgX0mT4jwrAHp6kSOmA90kBA8Hax/t1ACjIiXoAU4+dpWpV
	7A1bCQ8RnRAyC06GI64S6y8RO
X-Received: by 2002:a05:620a:1a1a:b0:92b:6805:91b5 with SMTP id af79cd13be357-92e9a48d9f2mr1308594085a.61.1783320158358;
        Sun, 05 Jul 2026 23:42:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:92b:6805:91b5 with SMTP id af79cd13be357-92e9a48d9f2mr1308590785a.61.1783320157715;
        Sun, 05 Jul 2026 23:42:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm401457155e9.8.2026.07.05.23.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:42:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: [PATCH v11 2/2] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Mon,  6 Jul 2026 07:42:24 +0100
Message-ID: <20260706064224.1328576-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfXz+21q1WVZcXk
 3xeMtbRXNZwzntj+A+NYHY6BjlxbXfGVSsbOxLkZ2w6sTIWFxFaXmMCfjsH8n0qH/G/UcFe71ch
 z+0sZEPWoy1w32fztrQTsrU5gZarZsU=
X-Proofpoint-GUID: seN_lOUC0eX6RfyTcEhVymaV8JxjCP5J
X-Proofpoint-ORIG-GUID: seN_lOUC0eX6RfyTcEhVymaV8JxjCP5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfXy6mVn7gID8zP
 PNpNtQEXwIwNK8kFhIL/X9bCwIrukaoYXGlN4vFnx3h6QwvWAbDpH//hEHf4zoN0CVjbDCxMF5/
 JY8YBfhgofPJW62T1y16GVrVhc//2dPgBulkohsvQkC9wtTPN2i2U9JJSlPK71/oq2u6q3DAdhE
 bL8ilVlqWj3uCIcHHXEGftKOGPbeijdBQ527gznUZDP2Td3+RairsXQiN9nn+tupEF77PuGeb+S
 B4/OMPGJtSZcZtjZy+f+qeXKnXjwIz6cfk2pVzQf956y62aRqanZCZY2vXhIIvzQMX5REAghdmv
 iEQOKbk/8Rsy/rfH1vn/OI6NIoAPagifSPGFKVVOj6xFrye5W9NHlT/DPE0MrfG7g4PqU7nDQp8
 vHsqqXR2j5AORv2wT+NS24qVSdALYgm0kNbZ636oYEJLM1ZrCgddG5hOPAKxGFDbCfFN6rzYrCl
 koyNYqqLmI5SngBkeIQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b4e5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 656A770DE66

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index f7478b59624e..2ffae61a4dbe 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -69,6 +69,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -461,6 +509,13 @@ embedded-controller@76 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -588,6 +643,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.53.0


