Return-Path: <linux-arm-msm+bounces-94450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFcXBr6QoWlZuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:40:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BB31B73F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A863931190D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82C63F074C;
	Fri, 27 Feb 2026 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsWzQsQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFUYxXIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2213F0754
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195611; cv=none; b=f83tMApPHOKEjwuLjqZ/24mcuWExFrl7FRvqpgavztHGKh8Q2M3yPQJEDKHQFp3b8bgwux65XQkckBnmSJsL5veTivfAF4OKOjfnoOp3GlMaW2BwqayPWhRUdsmGTWNzj3QFpo12nGqyvYoY/ReOe0oJPGoW8e2E2NlPbeZftiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195611; c=relaxed/simple;
	bh=CTJy3RlJ+bx38AVPB5hZcXxYlA1syIFpKJ+v5bDaLL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bO/Ob5jB7amjCeHohRR5kSNjzjuR4UjYant58e4+JXCzlfEs4No+JCf4IcEFYW24QclpgIA7Ypk55wCFbLZXG5LVRFK7WWXwTlcSGDf6kuz5R2rvK/19FJLoAjdWecqPf4os1Mhy93I/5+wbqfa1EQ0BZiTUxd3iT+AVhkVAaeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsWzQsQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFUYxXIp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9wdCD2438571
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTSOuOrJUaXrnxieGy+yBOzsRc/kDXfvz8U/Nt+GJbI=; b=dsWzQsQ7o12zESaA
	mf3eZ0Q1nJHsSp5cWBCZkyBtwMZOHBvjmdrsg2sCYC1Uj0tLEmiefTdncHVIDEOz
	zEAy3/ykhyDfsgFaIxR0n8WCytnwy7CSbI1Wq68Mv7b1LHwQIUmx4BDKtJr0uMAD
	q+oUaUC3420OLZ8E1Fou0ZH2LEnHneuJ42oNyXvK5dkJzE2+cT7/ySKXqxGN1CvR
	aXvkerMvxiHmVhbq/EJYCWtTwxw5pMwSdQnmEO7qcvJaSk+0vmaEGebzV9povbYG
	jmQOoGcWTg1GqyMBVJCcdzW9jZjelwTwDMqaPnYnT9fU78SMtUByEnZxIDyOAdSj
	NQhHfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r3b7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:33:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso10230996a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772195609; x=1772800409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTSOuOrJUaXrnxieGy+yBOzsRc/kDXfvz8U/Nt+GJbI=;
        b=RFUYxXIpb3cU43yobIqIsQSDfOuY8AaStjBL5yssKyty1ynRZz2BM83HO355QKOJnr
         Jt1QxYJsTA6kTzb3ti4jPFTVdZlppdU3z43yoiAWMSUucy4clf4CI5Z9oBPHr185UDBi
         lBjSJQq/G9n72beHws5gwJw1p/ywl+z8BWezkETcC0In6H+2ZahSaDjM+DVKcWZA+03L
         PnKiDhwQp82Nt1/ZXFGyloTocYmBJTN7lAsE8thsDmgD19jiL4mhaBeYKBgz1AAamEIK
         2fTVN429nkTY2tBMdwy+O2YGMvnxqtFzxEiGvyB64mKEuUAGmoA1ljasF9mSkUrokL8R
         GHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772195609; x=1772800409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTSOuOrJUaXrnxieGy+yBOzsRc/kDXfvz8U/Nt+GJbI=;
        b=g/4zzaCW4cLW1+V5ff43C2if1TEcFxD1Ck0DoWDomMLRuaqbT/IDZkpx4HWFaGEgnG
         GRsNl/ZYyA2nEs8sP5RmeBD3wdB4oGKto5uD3Afba3eSXLLmJxCvQlWEMR8Up/3xI1mY
         kARb39AGBmc2ysW8qcUiXtyCaWyyA/20ivWRMhXkQIpNiJgFURmkVn7c1O02AZEZrR6R
         lUauS+HnaBWteqzx06ms+M5P8/l8esNE6xcWklAboeAuqpkMZB3rqtaNufrICt4N3SEs
         3fy6VcRTmPL1AB1eO0hV68HQfalxdwyGo4K0L9RH3U4OcnB/QK3Z7t4CicQWeTu+TbGt
         PBRw==
X-Forwarded-Encrypted: i=1; AJvYcCVGTkUQriXQbaXEhEoy1t+/E5zXrOW7jDWCDtOzPt5nG3TacIA+1/lpm1X+yHfJ8xtWamAqkflXL7HK71Z0@vger.kernel.org
X-Gm-Message-State: AOJu0YzeG/A2CJc9rdq2d6Isbk0t/WOSROc8rHnIgLKoI2+Re9duNaKm
	MkcDFZ6geM7nSMK3juYC2vnw0+t6U9n4eubqNmCPWi/cegztu4wgtYIi2DJvfVF7Wpqc2WM4SmM
	sRHafzrihZowiCp1b4/k0hF8MadbSgGLyqZJfctoU+nQrWTjQv62ZY09tOMWJHhJk7u0=
X-Gm-Gg: ATEYQzzNdECeFscsgYLTFjMBoBfx1+inBczBK5QiP+cDAPvvj9dpg0FQTsWbRGH1sOg
	10jWaGEi44g7H+MHVSqA1tcCzM91EideVd9cJncNGR/GJ/gruh102CaavvIp/RvAUd8W9RrBZJt
	vcIRbhijXOnLvSyq8CKDieY+0WPhk/Q6i55JzgBcqmtbBz3mLJS6Ge8PCe/UyLJIvbQbpJXrCkW
	9Sqe3V1H4vEX3pmMz3TD7VPJYjFk3/uOb3JRd1nl37UZgo+BUL4sTqYuNPQSKs1deS2vefP1zvV
	kHazvIO9k7q3woT0wapkEr+Ms+T+fPfn62WoVO+5oTOISE7XRhhJ+Du08le03CxEa8eZp0pOZbF
	XDlPDjbTeRQpIJgeo5WFOMDxIQx2DoFikO4+OLCORL86riarnTro=
X-Received: by 2002:a05:6a21:6e48:b0:334:a11e:6bed with SMTP id adf61e73a8af0-395c3a6f89fmr2951701637.29.1772195609023;
        Fri, 27 Feb 2026 04:33:29 -0800 (PST)
X-Received: by 2002:a05:6a21:6e48:b0:334:a11e:6bed with SMTP id adf61e73a8af0-395c3a6f89fmr2951671637.29.1772195608504;
        Fri, 27 Feb 2026 04:33:28 -0800 (PST)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593ddd103asm5005008a91.14.2026.02.27.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:33:28 -0800 (PST)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 18:02:29 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-b4-add_pwrkey_and_resin-v3-2-61c5bb2cdda9@oss.qualcomm.com>
References: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
In-Reply-To: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772195595; l=1609;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=CTJy3RlJ+bx38AVPB5hZcXxYlA1syIFpKJ+v5bDaLL4=;
 b=OohIToc55J0y5pItmIFY9kYiuCP31ZhDelRwzfDyNk1INsdsnc4Gq9aQ+LpxOsyIh0KFklkR3
 jexaZCJhhx/BggkLnW+Ov9Pu2FsBkRRwK4UvY9LtyIlcLPsgUvZPr12
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExMCBTYWx0ZWRfXx6a3VSFff4CG
 Ef7tk/eKzdueZvteJjSWe3Mo87Kt105pOXVUMH++IDvDoQO9GWddeGqpmywic6An2HHCsYqElbE
 RV5wzjZxRrb5RmHBer3vKhlA9h6C5dIjWYI5G0jVPYpZnSgVluPcpAzNHmSUokE5GjMEzZKt3pA
 g4St6mMZ8gMwqpXz0J6PMS9Wj3uDxZb4KgoBl/e33nCRWTzfV8ojJbALbka6UfdocWxkd28tnAj
 wsDeCmpM4yv/bt5Qhm2xnFWwvVIM+sdOlWbsJlwTVF02F68juSx5KEFScccGqTrsJYSG++EYUXn
 b8cXRqTeZ1ICxwV6R+N2r8Rw0iqcsvGDLCO9Ydii6IVfPJr4f2khN53mxofCitN+P4zDDvSzX+V
 F3MxLRJxlUQXNqDP4mS4tpFj3yvQViJoAaVxoxvws0AYAiHzCJLtdr5YYe+IITONPly6RxWRxbw
 IjoWeKL7PvtBEMpR9wQ==
X-Proofpoint-GUID: fKSALvpiE8V44rxsFEL7e-mDjmfoII7g
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a18f19 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=waYKtz62x7MdsOGo3IQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: fKSALvpiE8V44rxsFEL7e-mDjmfoII7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270110
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94450-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.23.212:email,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.4.176:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64BB31B73F2
X-Rspamd-Action: no action

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Disable the resin as suggested by the Konrad.

Changes in v2:
 - Add new PMM8654AU compatible strings as suggested by the Konrad.
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..af4c38309efae89479f9a11fcb970a4c18f03a91 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


