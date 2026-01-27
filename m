Return-Path: <linux-arm-msm+bounces-90665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHaxJKp4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:34:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0EE9119C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C3A304ADA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071E928A1E6;
	Tue, 27 Jan 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAuuBUzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icpKIvuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487202BE03D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502856; cv=none; b=r8FuBEZkDyC0tg1YAf2wof/4OsKNRKubHquAMsFZ16LExnyoMj+ZpVOmYb3vIl0dYAJpxAIzgmaol3Gb49HlSFbo+qutf48oimt/ZFLiKrZoY0YeQmvwKw4UKzDAUtakeFU8mk9HhgaHO+mEszIk8xDOXLzZHuNfwSxkIolmlek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502856; c=relaxed/simple;
	bh=C1QFjiV0R+97oZMZ6vvsl2pfMFb3grnFJa40TT6C7LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzhLzVPFJk0DfHF2d8sfIX3t8gl3p4PWqkD0XALFR9HSVgZeNmYBhsztCy2eBS+Nw06oRM7MKx9RyM3J18pvLAKOPlz+EvGP0kUo+NP7nHiAJJZFZkHqrCtvGgdF56tZW/aTHu/fChO9v5irNnmBio+Pi/TmQQj27vKpl5BDIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAuuBUzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icpKIvuT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87K5p2379285
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnHtAG7oBETQqKq8fsb/TORxz9VbPf68s7/wZzpZrrs=; b=kAuuBUzPTwRPYc+0
	Y2qROYaracFqlh52e8F1iVyeS8CMcRUKLK3yfd9778IdOxerwJtjV4zzQwdSyBFq
	+wte1pU6cIlHWYqMKD4Ek6Fm356cHXBTfjRkq8CxiyCOYngGDjsmrUoYVoxaKXFU
	/UgmqeHx8WPDclrv3y/8YVOsHkWWSX1SnMfWv4RnUc6wswwENmNlcuUcoTMJYusg
	0LuGnTgeZuNx4Bhg/VF4FGqFEv0KOeWSu/ghiLyZtQu/j3RzOMzD38/lp67HIKhI
	qKtExSAuUUF9Mv1foyqTdJIJknnHKaizMxdUnlUs6Zdeyc1VLJSLlmfum4BOg9Zo
	99BE+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr82wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b72dc38111so3282705eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502853; x=1770107653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnHtAG7oBETQqKq8fsb/TORxz9VbPf68s7/wZzpZrrs=;
        b=icpKIvuT1idF30aMjbIFBs5N3ZvTZ1Yxy2NxLA4WvUO0j3NlRLrvorqBJkuy5DTKCY
         OuJYDjPsikwFmAHUAXKPEHuMqJEQni8iEhbIHuzv6vX9mc6XGGfdz5NZFpjHfWI3v0JB
         gA2qbzma2hmCj+aY0oyIkx92WMmSR+xxuPllyFy4vOj/LH1TVF4XpwgFcC1Ki4gvb9Uw
         PMigjwWCkvT9n9qVSKEEfHzVBs0G6y8QKs9ytwvpBL3gngUsyFih+3Ep/V2I42YgiRk7
         PI8DVRTgyksUkRlffr4XvDhWbNNzqj8W1TWbciMJRWfg+KOHtUTGsiDdLyBdbDME9l6w
         VDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502853; x=1770107653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xnHtAG7oBETQqKq8fsb/TORxz9VbPf68s7/wZzpZrrs=;
        b=TUBsE2twG9jcOx8wmGWgUO6YKsn9bYR/1y5AYjNAIiTbGw/G4zxgM2lfkKVQhY5eEz
         3idkyVTeu7mm99GZwRbnZlGODn9KdIhcMB1PRHO98PlFxxWZlGXg1DTJuQhQrbgAfN6E
         Epq/OOhgrTqknmw/pCVc3KvqxU1kjIWklr3fMWpdqKoqj4w8QTOkltCRzfBv36EOnhTW
         AYj2gmylnPLGeiGvcY6c+sSsxr4FUAhW42/lGS7TGBDdT98x2Wrfqrc8EWWGv2IceQi2
         T9mIspQFYp5zk78YDbxL+OLTN2OHdBhL2YTp9GGpFzLYLOSmtdrerN57cfvuidu4cXaS
         O2/A==
X-Forwarded-Encrypted: i=1; AJvYcCXqLhC8L0OzkGcgLGE7n5p2oC/5DP8MlqRgAl2/tBFWalFfC0nTd8SwKPHWjREbew8DqrvcBrpiL1xK/5wW@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSaTw1CmUZvcretddvCzHYghq+V9QPghYs7cBuXhoE6jCyTOn
	CHItHF7Qas4HW1LmLJlqIgU9gcuc8iZGlyRmKICZ/avcrNkhzi6VIkZNRjpBSRNtcyMSufAHdU/
	dP9XWaekbcT8lcAa0RL1dpj4AcV9ZJQX/m232uJGI4vwPnYOcgEE1m0hpVTO8Zpl2MAt6vuWkVu
	Kx
X-Gm-Gg: AZuq6aI5VRbyVKIWQpiclY0180uYv/DDL3gc246fyYPT9IQVhf0JMMZE+Jjg250r+F/
	g6/HE2inLnY65/6AJDEogZ/3RwMQeClNjBcMRO5b60D9yU5w0HY9f+MrckgjzJM/aV+c5EWD+sq
	FGGkrgLTyuqx7fL+tpqoPprCsW55c52sygtcUayZ2GjVjOnU4SaWrpcBf1m8poX7+RZIfBC4DOW
	Wvc7yF9STGHXbZeVT7H0J7FdSchY6HQBnxe7tIhTQD4jgAkFFhetpnFSFAwkM/oc8is4qK69wIP
	OjDsRALXOsMQabcUjJQffDo1FFMq25rzE4phGCIIJMMSEmWRiYFTSbAAes7cZskyLfg6YUUGJbQ
	UNxUVJJfpc+7/+LePSj9D5JMmpS5/Gl9pqzk4yVmEGvJ/tPl3f1frYTA70PHM
X-Received: by 2002:a05:7022:90e:b0:11b:f271:835a with SMTP id a92af1059eb24-124a05796c7mr525741c88.3.1769502852445;
        Tue, 27 Jan 2026 00:34:12 -0800 (PST)
X-Received: by 2002:a05:7022:90e:b0:11b:f271:835a with SMTP id a92af1059eb24-124a05796c7mr525727c88.3.1769502851773;
        Tue, 27 Jan 2026 00:34:11 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:11 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:00 -0800
Subject: [PATCH v4 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-knp-dts-misc-v4-3-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=21759;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=esnjdExscBYEam+EMC/GJBr8t3FN148trNHogl+l5F4=;
 b=E+a39GBO2A+rnLnp6hGWI6w+mn28mjqb4CebTdCoxHrrgh5OCls4EefVGARNSyZIA45goaH/4
 lROgT5ztHmoCUCxkBZ74l6CCVxnmyV8nJ8m7dVktlsgURp3sjq/PO8n
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: AcgG268vwEM9XqiMYTa6S4uHZTzOUm3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfXxXCLR5FT2FSV
 2V2f5kB7xtoA8pfrdC9CdMw2s5j4g3sfVYu/9lLlI5sm+dtLzZ6N/YYGSaNx0HCgDI77XSb3A3n
 q03FBB2ZtxEzAQK6PKk0+32WtBfT8LilHkxzcKI1BB8xtpyCOFq/I5D0WjBlZSOIlBx5ZqOd29a
 UKpMNeDn9gUYEn4KjobJA6o5aoGZMq+06ZuWAxNf3jqqNmDjSUosRfeOp6TvBA23Rf0Kkti4Sdi
 Q2jELj/Mis2o7mw4+8ifUOO9JVWxg6E6jwKKJiIqEL6sEnDkigZQs38+IpDo9DXw1fE3dwvHLHz
 1gACZs69IAc/KpEY3mB5TjDEsKo3C3VtNQfdWCLjiiAP2UAB9huUCCmJRtKwJTXoCi8b/nQVomM
 pzFLiDC0jYpOakrQRQ5KY0szOBK5k7ULUPMGYsC0YZhx9syOwWlcwPCG4XinLk7s9U3ti+YY2cO
 gaRyL3q7qntvXo4WcWw==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=69787885 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gpPq06xVYaF9EkK19g8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: AcgG268vwEM9XqiMYTa6S4uHZTzOUm3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90665-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,c22d000:email,0.0.0.100:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,c22b000:email,c22a000:email,c229000:email,c22c000:email,c22e000:email,b220000:email,c22f000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF0EE9119C
X-Rspamd-Action: no action

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The Kaanapali includes seven TSENS instances, with a total of 55 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 130°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 120°C and critical trip at 125°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1075 +++++++++++++++++++++++++++++++
 1 file changed, 1075 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index df05d204ed41..251e36cf7477 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2583,6 +2583,90 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c229000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <5>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c22a000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22b000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22b000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22c000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22c000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <4>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens4: thermal-sensor@c22d000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22d000 0x0 0x1000>,
+			      <0x0 0x0c226000 0x0 0x1000>;
+			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <8>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens5: thermal-sensor@c22e000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22e000 0x0 0x1000>,
+			      <0x0 0x0c227000 0x0 0x1000>;
+			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens6: thermal-sensor@c22f000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22f000 0x0 0x1000>,
+			      <0x0 0x0c228000 0x0 0x1000>;
+			interrupts = <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,kaanapali-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
@@ -4795,6 +4879,997 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	thermal-zones {
+		cpullc-0-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				cpullc-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-1-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpullc-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-0-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				qmx-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-1-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				qmx-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-2-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				qmx-0-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				cpu-0-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-0-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-0-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-0-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-0-2-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu-0-2-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu-0-3-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu-0-3-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu-0-4-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpu-0-4-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				cpu-0-5-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				cpu-0-5-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-0-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				cpullc-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-1-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				cpullc-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-0-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				qmx-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-1-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				qmx-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-2-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				qmx-1-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-3-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				qmx-1-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-4-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				qmx-1-4-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				cpu-1-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				cpu-1-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				cpu-1-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				cpu-1-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-0-thermal {
+			thermal-sensors = <&tsens4 0>;
+
+			trips {
+				nsphvx-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-1-thermal {
+			thermal-sensors = <&tsens4 1>;
+
+			trips {
+				nsphvx-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-2-thermal {
+			thermal-sensors = <&tsens4 2>;
+
+			trips {
+				nsphvx-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-3-thermal {
+			thermal-sensors = <&tsens4 3>;
+
+			trips {
+				nsphvx-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-0-thermal {
+			thermal-sensors = <&tsens4 4>;
+
+			trips {
+				nsphmx-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-1-thermal {
+			thermal-sensors = <&tsens4 5>;
+
+			trips {
+				nsphmx-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-2-thermal {
+			thermal-sensors = <&tsens4 6>;
+
+			trips {
+				nsphmx-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-3-thermal {
+			thermal-sensors = <&tsens4 7>;
+
+			trips {
+				nsphmx-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens5 0>;
+
+			trips {
+				gpuss-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens5 1>;
+
+			trips {
+				gpuss-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			thermal-sensors = <&tsens5 2>;
+
+			trips {
+				gpuss-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			thermal-sensors = <&tsens5 3>;
+
+			trips {
+				gpuss-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			thermal-sensors = <&tsens5 4>;
+
+			trips {
+				gpuss-4-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			thermal-sensors = <&tsens5 5>;
+
+			trips {
+				gpuss-5-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-5-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			thermal-sensors = <&tsens5 6>;
+
+			trips {
+				gpuss-6-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-6-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			thermal-sensors = <&tsens5 7>;
+
+			trips {
+				gpuss-7-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-7-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-8-thermal {
+			thermal-sensors = <&tsens5 8>;
+
+			trips {
+				gpuss-8-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-8-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-9-thermal {
+			thermal-sensors = <&tsens5 9>;
+
+			trips {
+				gpuss-9-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-9-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-10-thermal {
+			thermal-sensors = <&tsens5 10>;
+
+			trips {
+				gpuss-10-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-10-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens5 11>;
+
+			trips {
+				ddr-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				ddr-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-0-thermal {
+			thermal-sensors = <&tsens6 0>;
+
+			trips {
+				mdmss-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-1-thermal {
+			thermal-sensors = <&tsens6 1>;
+			trips {
+				mdmss-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-2-thermal {
+			thermal-sensors = <&tsens6 2>;
+
+			trips {
+				mdmss-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-3-thermal {
+			thermal-sensors = <&tsens6 3>;
+
+			trips {
+				mdmss-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-0-thermal {
+			thermal-sensors = <&tsens6 4>;
+
+			trips {
+				camera-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-1-thermal {
+			thermal-sensors = <&tsens6 5>;
+
+			trips {
+				camera-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens6 6>;
+
+			trips {
+				video-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.25.1


