Return-Path: <linux-arm-msm+bounces-116637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hDvKHXNGS2ohOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:08:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF30A70CCB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:08:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UOiLV7y+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UKJAukkJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116637-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116637-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56F87303DD18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDD63C1095;
	Mon,  6 Jul 2026 06:05:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4B3BFE26
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:05:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317911; cv=none; b=KJQba9Q5wIe35CCUsXibrD+SGjs3A8yEl5k7R6G/DbnokDro5q3h985OKE66pjhPthHkX3RYv2HxxSuITQjqJPczOIGbvIwNcNRLXuc+qg3IY3c8ZsszQQpYTWk6tB+xUR68ANEMogo9Y3kZoviX3u9jfBI6WyJio5oWFzouHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317911; c=relaxed/simple;
	bh=Xpj1yw8/aGiDbI4/d4vhhyVvfZhmyFUQN65p3ZlhcNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BybBa4+xdpbhs+PVhY/E2OV6aEWH211beHAPZKMaMdSXuZNHbpHAmpfoAGNnGwWYeCOQu84aTxw8+sBk9+LqnxHRuk8VjtyWjwhkQPCvZOIELSq9yyDLGYCsM8b8RZ+R/F1+bluwJQxbBVQB/rAEzNat3CS1UNvska5NkpICQ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOiLV7y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKJAukkJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641ZOV3614034
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xKynfkdxy/RyPsAHpbTigDhGKqqVZ3Bc7JKIBWb450=; b=UOiLV7y+MUZ/EHa3
	zyfhGW12vHbh+xmYvJrSuxf7zp16GCRrgZNqAHQk1a6uR1R7LwUwklByhWgwGHuq
	8MDmpwhAZAUxcRN7eSLJNr7Sl1CdNTKEFBO/E56LOqTvLl4GBCFNonFrc2EwipE9
	bTk9r3LEQWatBjQxK4m7Fs9iih6zuo64cvRCWH2FZzPYn/z6Ds6lUQZYhW8CLb0p
	y1zImeNXMbRN18J9DSL9HUzsDYZ7/Urv4t+S+AKv+qfk+hv9KX9aPuoUmcEG5CgR
	+teV5ItAyEo4xGhkpwFtVl41O08kNXO4D2ikZ5SeuL6Iq8w5oXrxWXsfW4jD/W8w
	v36GOg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvmp31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:05:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo6602630b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317905; x=1783922705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xKynfkdxy/RyPsAHpbTigDhGKqqVZ3Bc7JKIBWb450=;
        b=UKJAukkJtcauOiDADAEweHDWFojkVmiC/vJ/DN0nXg9hjZhYOSAehIrc3zww1qWsWV
         EDEb5chSiLY8N7k9QFwTN0BWpQmHLnmnUNeZhnDM6tYiOiupjFHZyt9Z6IdikvVFBvaK
         JCknTC0mYkPTasLTfoFScZxOInW2ouRAX2W3QwGvQBf/1uJhQxwGLKDeknfaClARD5Jx
         6Lt7Xklvmus3M0Xcxpqi0JJU1F2+Cxa3+WcKDr7CuFNWicg8D4WCrNa5VYrOT9geCHhu
         JaKb9YW99BzE64eandyel0oGNEpoVZ8U0keDuBzEnCZMecN6aoCB0etJWZQsXFnkiLm1
         Qu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317905; x=1783922705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xKynfkdxy/RyPsAHpbTigDhGKqqVZ3Bc7JKIBWb450=;
        b=i/qHH1lwMFFlw8bhMTViZCPWCIJgm5jJtObB7tSK19xKZ4o3uvHiPhi7BzPX+77R4u
         Kp+Yq6eoNjAPfRnfzNybhrziWBINJOZauxnSM0dKsRJ997VZQrFzh+9Dam9d8y2adz4k
         1FS5aKCcIwdxBc77Vko0S23c7f7MQ1YL9c48HzT5ZrvhGa4cp5KkJtjKdicA8pwce3qw
         JKEoEyL8GVK4sIXlVlk8ZWFt2L8sPbVfZRlc9ywg+nG5UAEzgR3MonV+cy0WGaKJdNGy
         TdFFpqQUqMQ+jOAGOuXIzjgfjo9M0jOiXTRaQccwtZ7fh54OeJVNUHQY8BjuXwkJFuRi
         CBQw==
X-Forwarded-Encrypted: i=1; AHgh+Rpxty/hrzhN2tH3D5zIxHlCMUPR/z4/Pt5VkcpJ+GBU3kPxkitRWJ7LZ6USWHo3i9zDAdkXi+gmCXeSEyFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKqoQIiYmQYZ+H/NrF1Lsk6fDEBmKWc+gVwoICtXFuWI3OSxu
	U05Kr4O771HPSP4oDZbljGvMdO257DGVnzLG1x1K8mUm7SwBlA/pcWgIu+CNu7skB6VOJ+Q5/kZ
	QktdyDS3uOGXRlHr0pxm55xKH4WR7fPa17Ox0HFUwzpiS1hQKbsvSrlmtk2UrpGWQnkEj
X-Gm-Gg: AfdE7ckTtrXhYW71lSBf0IZgDhE6qdOrDbJ7uxNQtnpgmjcwjx+d6qEURSwMHn3N7bJ
	q7OJ2FODgO8NvankUlyfaNDT8QB77f9inikzD9f9XV7tDLgrwCRfD+hbBmiVraeaYhrhauNySST
	cXNWjzQqKeHeQdZlKhAzutJ44jjj/0x6mdFFO0Enfwn7orMSaYBnP6Q8XyRSSJVmU/sgo6I5VLT
	goB+8E0j13g0Ecrj+2I3CbjMwRB9zErJSr/M/H3uMusoHaGQBhQTE5KQ3xW+k7teEleXlGH5R6V
	1GWNpzv71jw9Vz/E/Zxp6IBxAAyH9gcnj34qX01sUWYOWHL0lKwpT/6wn1DAT5w7g8qan1Qij48
	6M/F6CcIXZKjCCWZRuyXNxmbGNqrvF86rDpxmQA==
X-Received: by 2002:a05:6a00:950c:b0:847:9178:f396 with SMTP id d2e1a72fcca58-847f6d9a72emr8208411b3a.16.1783317905162;
        Sun, 05 Jul 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:950c:b0:847:9178:f396 with SMTP id d2e1a72fcca58-847f6d9a72emr8208368b3a.16.1783317904760;
        Sun, 05 Jul 2026 23:05:04 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:05:04 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:34:44 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-shikra-dt-changes-v2-4-56fcd1659ea4@oss.qualcomm.com>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=3718;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7FOPOnj4TOqoiDbQOvjd9KpwJsRfuzHcUQATGqsDflg=;
 b=jALF8zRuzSf1oeAmDACMnDV7Kyr1t4YQBKy2dAsB3cj0RFfVVxQ9T86LrrKzXJK7Pyzy7bWcQ
 /cJCdXk0ng0ACWELY0Y9AgqWlLjS8w0O2VoC2v30MnyYx5gNkiLUOal
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b4592 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: IQgVe2UsQUtnqoYp4X8uDFBBcpXpbOxt
X-Proofpoint-GUID: IQgVe2UsQUtnqoYp4X8uDFBBcpXpbOxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfXysVyaCHeHC1h
 y7bDhTZ/IVBV+3+P2FZv+cbd774zsDsBDUmNA1LQW4ltoYxEbAq3VhHWlXUAn2hfU03xdAGOPW/
 DepHIbJ1Jd9afG7WbhyIz1rM/532bgT+eSifwVznrqUj6L+gXiBsxR9lkdOr4vzpFL3K+v4gra8
 JcjejpmJfW/mOMXiTIqtacDPHPCeEDIeFEq7oCTlJggYoYnOVuHDALS1iUhFCsU4C2VoGz4yjgD
 p26ZnmKHcK9Nez17pTzuNDRiAM4cjczjqOiizxIYu2BWIK5fSuzV9vM7U4M7yZVMGls7LAG37Yd
 ya169LQoSQovSgc29V6KOHbdCo3QPdJYGwuFB4W0/ipKz5YcY6n3l4xhe5Av/3Im6P5RM251qPO
 v2PZe+57xGqbIUx08nrMkaBSre7W5BTaKM+SlmF9xOEHPqThrqQTChIfKUwCE1QCpp4v0J8xVkQ
 Fb4ilN/IjFGsatxEveg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX9QJN1kTAiaGI
 aOFNF3Wijsu24Q6a4ZrD7CZdiz8GXgbztiPpaFAb88a8loUmtTyu+Tt9kM+47TmVBTvVKp/vyFu
 jof78n1BhxkTkePLNjuHl2sDlyi9tbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116637-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF30A70CCB4

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Qualcomm Shikra MDSS display subsystem on the Qualcomm Shikra
CQS EVK board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 126 ++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..8c4a8bc01595 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,39 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		vin-supply = <&vph_pwr>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +93,53 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +175,52 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


