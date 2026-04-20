Return-Path: <linux-arm-msm+bounces-103683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH9BNYrZ5WlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:45:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B3C427E04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D632305A5D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1811C384228;
	Mon, 20 Apr 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHqnoqjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwX5jEpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B483859D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670982; cv=none; b=DrvJdkhXaX0jrESQeURzjbNvf/6GzhyIkj93vNG3F5z+NyU1RzNP7UDbyRnyaeusLxF4YCpnnnpH0a5wCymUSP3fh+QdSsFLbIScP2maIor6IzxH7G2PbgV9/JVgufhrGJHWa7T3aZttNUk5Xs2iWLMn4LCozmo/eS4UaB4kxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670982; c=relaxed/simple;
	bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOy0H3DATKgbYGbpvd3uXqGVZADfYWOWMe6TXUv7mwjETi4qKCyDmw0GnqT2AAuGtWzXu9pGEbrROTXlFWYSIx5kzYZdFnxgRcFGJn5LBoku+tO5xGSi9PvWE8uZ5g9OQGY6W7QQy2DzDB2sRqsQcj6paPVawiwi7s4xwUJagA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHqnoqjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwX5jEpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K2pT1n3978145
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=; b=LHqnoqjDEwiKpuvP
	hVpI6dnRvdPA929YB8cYxZfNMJ/sPa2fMXPQCBVyGC/ROMFALcnCOre4kF1xj3RN
	Ir7JhSBm9tS+6IRZzOsrbQPTkZ+ep8NDzjkMJYBG6OwC0MvTeEGpbV5SiKLhqOvy
	OqrZbkXVF7Sn4pSVf4E34eCglHD0WtucdFCsxmHDYuyjhNRdjtrpJRvLdf76eHAo
	dd47p5RCOplDE8W72/fLKtEpZbWAOiSGa6ja+t/18fCllumeYg5BU13ffMMPnxCH
	oHb3OF+O2wbaDORSdVAie6uE50nWsQz8nfn0jCH6iZL4j64P/5fDa97f8Kf593v7
	3rC0EQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qamqmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:42:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c91ef7009so301087c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670979; x=1777275779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=UwX5jEpepmXk1GNBKHxas8/3N/mjSpYzdpGyEwYgql7vsKs1bqHItkey4qdWUm1Iex
         gut8DOrC+kfbVoXMAFPl1fCYHgBH58olHDWme7bZI40qt9WZczJfl27YT+VSw6qyTcqL
         FJCn7bIWfL/IxUTC1huYoly9ikzoXeKziX+D1AkafOTSnSlNrLRlaaKKCcNWFS7d5ay/
         thSATAJT+p07Bz8r/SQX8iAFpayr94HDGBN6CBX0jXXRCR3ceN8NJ+7G3DTioP8lADfb
         VHNqY2aNnvsQfiwX2GUEHINNIoC01oKqeOkFYmBLU4BPSCtsr5qaWOjAzRdP/0R/UHMA
         JfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670979; x=1777275779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aax74Xsy1hxYCxPdadlpSBnofeDzZn5V1X3zjKrLfVg=;
        b=aF7AXrMO5fvDGglBpJW/Ymi+DO5jHz6CtDHrbuuvzxT6zfKlFWhTEosrpjOapBwn0m
         S/4WLUYl055GjeQ7ZjdJSgvhNGI/r5s9igOZohh0W10Iid6HwwPqEHf0cy4SauF4Zrzb
         oir3no7QDDbyUByfMB2wi9vwIdyVBV6m0KOwLzU1qYaRiergnRt+d6F6LOOs0I9vsNFC
         O5FoqV6sRMu+AF+SBi+tiKEfx40Yyuv2greVpZcXJYIxqZcKm5ck0p1B1Tlw81ei9KgN
         1keBFQb1oLVh1Ch6w6Y7TbK4Uy37lyhRkvM5RB68EPAkUy74zvOYx6XS1x7EqKxikuaz
         tMUg==
X-Gm-Message-State: AOJu0YzGe+XObHpfMTIxH6o3jhRjS8M3DMNDBj5AWnZfEoBrK5lLT1fO
	n2Xyg/YhQBalJUxWdJejuBDxcXa99pFei/Px+l2ltlvoGEN3/CqZ/9VZtBrLUr59q/NsppuBBO8
	3YeFkf9HBov/v7i2HHRXTvxJSJoN/jLYuV5O/uBqGKao6hvrEuIeuhr9D4Gb17Rs3hb/X
X-Gm-Gg: AeBDiesg+od34mRzGsXcwadGZAm+KbtnpEowr/zVYkRk6lZ/G7TevMVlEjSxSc1gfSN
	KkZd3pXSccD+TQ+oXQk1PsIeo1dJHhaafDjIU4I+St4bep/iSqnrX0GGUzROhAw/h3HLMvvhTns
	6sYsXVm/hIjUM0It0p7A9VVGAtbdJd1Oh7oAYaGD5V5xNSj48MQoDLoeI67bD6bc4k4mx1njy6T
	tiUaUYNOIXFOSNh6csYqmvBGFv8IXBSUQ5rkJ6bMowad03EJEXa/KTNqBk3gdSUY0neXwvwOBMx
	W3WA30yFnim936/D5lo+TrpUXd9Udnwn2o24hgyDyMJctdRk53tBiYe7h1Pn37RSLzg+vJGjjgm
	eyVyryIW6zq+nrhL0I8uxENynIU1m9GkGLtRcHCz7CmPv+tG1UOwxYm+Znhad0rl+hiC0taRaq3
	FYyFI=
X-Received: by 2002:a05:7022:384:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c73fb16c5mr6848832c88.33.1776670978905;
        Mon, 20 Apr 2026 00:42:58 -0700 (PDT)
X-Received: by 2002:a05:7022:384:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c73fb16c5mr6848814c88.33.1776670978294;
        Mon, 20 Apr 2026 00:42:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:55 -0700
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-4-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=1676;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yyksNRbGKOAS3rMbPtNPWOGGGB0beDwIaP5hEkpK2Zw=;
 b=UjbA4bhllGno/fFkdCg/oALlowFVUfHEJ8HcU/WnxT545RvQkiHf5PCftELeaYbzb4OhkHYLD
 ipzY2gsIbw3DYoxY/N9Hunvs+4RwTaq/bbbOb2AX9zeHpvJP8SV1TJ/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 9JraxBFzagtysCVz-JTUqeUhl9-uOdUT
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5d903 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 9JraxBFzagtysCVz-JTUqeUhl9-uOdUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MyBTYWx0ZWRfX67u0ytmDJTpv
 7L8U+DM76JJ1Io9gMq5QeblSRaRfPyv4gudrYPbLpjukc9NzwSzxFv/hznm6tnJF1UXk3m+QZgp
 vtkvqWZD6+e/8u6MZ+3pT4QsiwaBErwjh+RmnMZdPKYjsk6rs/RPRhuqiXvFBK1/qFBoOdxr1+z
 KF0y+fMoifwrzClBeSVoqRXRvcsdZq8n6vF4hSLbnclUiypFhzAvarqTA3WIpSzbHrBCHH8wThq
 wEKNsF040VFZBxlmgbOvGB3Q70rvilXJfPih9ISwwh0maGFJDlrg+rXe6/q1Zw4n1MtTWoB+GVe
 X+m2hn1ayMntqPIodJPsPyJGamRK7ce7d/To7afKMvU7dVbNlIpTwAX0I2+EgEIS8tuMHBwdXh1
 P/UT2R176d6ZbGJWRFuxQoy9wFbAgewypheayA8K0270ro1d4pbLX5RSRnBcZc7aTkt+8AQlJp1
 HWCQjHUpnWP0M07OoPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103683-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78B3C427E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..382398e44296 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -358,6 +358,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1


