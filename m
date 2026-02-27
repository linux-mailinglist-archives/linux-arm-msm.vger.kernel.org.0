Return-Path: <linux-arm-msm+bounces-94380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJEiAxAsoWk/qwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:30:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D71B2DD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A25DE3115ADA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43D236C0AA;
	Fri, 27 Feb 2026 05:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGuh+4E0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyjPFcoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46339281B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170228; cv=none; b=g3zoHWRgHspW35o7cuvxiFGW0RcIdkd0qrrA4C/dew+FGtIE/lb6A7fGPQyqTkzPTieUjBzePEecLXDSVM6/N7HfOu9ScpfnA4j2ma1g7q1x2KqgXaADxiHDNUYYK9jVRXayCaQ3r6FzHxurC/XFL9tGnRx7IAjmSv8gac+l2h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170228; c=relaxed/simple;
	bh=aQgfcz1YjB/i3xUfDXtNpad593tmxbzP8ow++UtlM5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEAu8UjSu5ikfqiLf7+LGCVsP5G09LIGfrGhj9n3wPt0E0I67fdnFMOxAXXZJ6gEn78UIydH6SzUpR8MG5naLvIxIwayYgMYxDBi3aoYgbuIinfWxuPfmEsk4NZwQSATrmf8Iw5MNRx8NDyNx6j8kjn/kYwtNXExsEAk6wByCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGuh+4E0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyjPFcoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K9v41620333
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=; b=KGuh+4E02b29G3iK
	uei2w9gFmGEF9kqf7+If44Tr0n9m5Jo7rlWrQwo5DXYlpxJ9nHmOoEG3V0n1Qk2F
	+N0aFzEj9FfuzOxFs+VkOzUwyWCDuargARpERKWuU+0uatLrF5ERzUR1WPFEqvrL
	R641gQlvVZHYgw1cX7BLf/Ezetm9wWCU8dDPOJ5ytjMesEILTtgcDfj6T/PLQ99Z
	Jxh3Afgk5W60Y8Y5UXy7MvZUMH0j+4YYJclKaA3WD1gpGMOWxeO8MPQ2WsUuqX1y
	k4xT66/kP+FTMZ+uxIyOWX1O38GkCqbSpzxexyCwupwjlxxkMEFAt/+kWm4Pqn43
	8lnaLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjn0x3agh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:30:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506afabb8d3so250113701cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170224; x=1772775024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=NyjPFcoHwi5j/NUMODq/i2H94GCSdvN7Nn7YbKuH66R9Pq/7K/M+GB+sI10BMr/67u
         K4b4NhH4HD5Zm1V/WONPgmLnKpbylmqfLPlhoU9JHXtw1BW4ZqS8SrQUOEWTRiRsVOLE
         C2MZafhnLgzZJqBBnJhL4oNeK/AE4xhkCOgOQ0/ouoLpNmiAb2pdw5AdMRfNk/GSDVpy
         YlEOdCUFn+fDFa679Et5Hc2MOJfORq7ZRk+vBWLOkl+Tj9BKDxec0RHCkOaWmx6CLFWa
         u8fzeUkOq3K51nu1Laxs7wrhiuFIfnRehX8y8PKqvE31hqCy+5bDg01iONn8G2vozICG
         dEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170224; x=1772775024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=TgH9B/Usucmx/zDdL2ZkgUjCFuD+f2ua/8Hr99+rkDU6MmPJqMLumgVGAz4ABqDQcj
         sutN30eE+5F1YOr/eMw2UFPiGs0MhFMkPkgEjEqpM70Bg4YXetn8wZuYxJwNtmWx3aOj
         C74vNEsgFlK15Atu+VMjPecOwqH0l+iZr0m9xDwHvCaCpvidZsoLUdhpic4/tsCMGfQ4
         KgK2VMEFrnzqMWczCfi4phidSy5hL3QnDeEy+C3JzZ9Y2MKWs6N8MNoF6OsuphhXDn/d
         j/6RwAOBKDM8UhB42c91FYS6HJR61DptNYcRK4Rg38DuaCHjyPkwfPFXKghlp+NWe/Me
         zLng==
X-Gm-Message-State: AOJu0Yx7+5Be446r0hzSS1waQjsyboLOPOdYYu5HzO1Aqnuo/4O16shZ
	2t0OQxwsLIYVJ2/0+PDfZ1+Vj4FjoYlizoBlVpLQbiNfDyMpFocuoQH8M6tju7ZKPL4u2fCdJud
	KUSJC6z2PfKuVE78tbGKFRjOhtxoqGz7NvpqF4Y6fi9RwKl7F7Juz54BYI18gAej+OXrVumjE3R
	gDIF4=
X-Gm-Gg: ATEYQzy5P47+60Y7FR9iSdHDQlMhfgR2+zMd6Tnrv0vwl+HANWYShz1dMRKnCS+7UCf
	UIksosSTiuks1LWCYziH+QVbIb2hCM5jhoVFo0Cx+RYmjj0KAF47YbXbkwILGw6aiNrpESGG92o
	SEFliStm+iPLMOxq05q5d+8E32FcuB0+umN6IR0DMN2W4iKeBQ5RyOYQmizAOGoUUPM8xUGUBCQ
	oEBDCFNSl4EelY5Ks0egOK5Gv6vE6Joaw6zcjNhCfRLniQgbg3QBtOZRzqMCtog+d9YLUtA5kLH
	2rccx68MHRgI51u4u356AyjXK+2bqTUgo8cqSioawuqsuGJBIXo3eQu3D/VB0KPOvMxRkRNxwn6
	+OoqaGFKhcaQivAsXdb1Gqn3m1UETftFFeNUEhAcn9cAvexzOah2vd9qJqq29PPPfVYmHroQW25
	tVE+Cw6ln3X10/
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358756d6.4.1772170224352;
        Thu, 26 Feb 2026 21:30:24 -0800 (PST)
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358556d6.4.1772170223962;
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:39 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IYed/TsJ48NYi3YoYbst6rSy78cyZz0ZOFAmgBTc1rY=;
 b=wcDlf/QkDAgruk00v1eTPzarMz1jhDFufYxGfhLpm+N+2tOKBdGxcP8oE/vadjS6BrYi5JBJb
 aNQq5XBz2O6CeNBibWUQdjQeMjYGsWsx9DQ9sEo3CsF2XkVn/zjQChr
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: IVJE4Rz0rFUmtYwkIP1iASLwRsHXcfWC
X-Authority-Analysis: v=2.4 cv=I9Johdgg c=1 sm=1 tr=0 ts=69a12bf1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX0Ev8FdXcGSsX
 513tEdpzN0iUqlLnwkZtn2adyYehQXk4q4duSR1YIN4UmdImbHRXyQ9lQNnECNMOQeMEoHMpuCA
 CNwm/iQ5JKNDyUeZnjN6/ROovrQjAknPtfZEqA285JqaSOla3tc7jRlQ1KciGmmxmw0PRDMOSeH
 1zUGucXAz5y3xCAEpGUTLAzPFRZi05IEWQHwdD1LQTIXHc/RR3/WJdymwJifTGCEsrTdK3ROsC8
 TEnb7tlQ36Dw6FoXmZrKgDp4seFvcwE3V9gAHUVtYVfjDZ4gIublhMCghQaEDUwWqv6LY3WKHeA
 SWbo9mRWfiuzxd815TaiRjNuuUcBVYb85xbpzFbR5w04fRl1BNrJdF3fgAsHM/SXogt9JKF790S
 257ONzxZBgO6mhJmwomdKr/CRDhExukU9jCbVcBSYG0uQrucDZrL0YX5ELMv33bl9yg/Twf/Zo2
 MjeNss97dos1nyqhMrg==
X-Proofpoint-ORIG-GUID: IVJE4Rz0rFUmtYwkIP1iASLwRsHXcfWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94380-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 705D71B2DD7
X-Rspamd-Action: no action

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1


