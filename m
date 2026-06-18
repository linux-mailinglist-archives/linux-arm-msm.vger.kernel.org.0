Return-Path: <linux-arm-msm+bounces-113766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PHP9J73eM2oYHgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:04:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1569FE63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gReaOszg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kU94MMX2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2BEE3032E6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EE03F44E0;
	Thu, 18 Jun 2026 12:04:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA44C3EFFAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784250; cv=none; b=Y/iWDvIz0KbwGAuCe/ihRHU8DmQQHhxehrt7JG8DR+ubx7MoW0iwf1bgqn/HxfrkX0E5m/e6cYYSp1skT89j2I4SIFnKKqhju6RzGh23ihr+ecTLk9zs0nqBUc7c7HIqRdbaX+dnVY21hcZYPTEwQT/FJ9O8oSClblhqg/eqn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784250; c=relaxed/simple;
	bh=00FOeZwcOWo8orogma5CHcMkmqsjukdxheBUupv/Bg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWlWofbiH/UV0vmm2GKweQYAqoltiwlpL8+F2tWD1wON/NJWHKqiqLOv9+ViuH8/epHwzrqmZDFzmcD9r8Uq0z5qDee5W9bYcW3YV970vddsGeAdrjgjYAEDvo1ScsRTTBj48liQXNFMgBAehAdcDX+WgK3kijC53/lC1a8mBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gReaOszg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kU94MMX2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArgQm1054960
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBt4T5ztL+37XoZG4IqKuKFLXZvdRDr6EzRefwCHBo4=; b=gReaOszge1ayGzZo
	YaMH5+M5DJoslZ0Ud5nixq1WaVQcttIuc3NXt7uqnefODZbaEaUkM1E8g8yEGTZT
	VMDCG7q+DhHL+o216OnVacsYKs9gCcEY0gnDYM7KSI7UabC12JNHdYezb93IHeVN
	4yVPwgRu4NSvPmJGsYLHjMy2/6Tq5gWv4emXJIs2C5KUE8u6isXG9RN3A8tDXLmW
	KfFUQgRzzRuWENCBVjscVAwgDGb9PqdF64eWUsob5upxvWYXKfnphf/bKvta91xD
	QGid+Ly1L/N1BBjp89RAuJUVH8lEKD/5qynSsySkwy0EbnZx82sCJDCnYHP7Fyju
	EqJSWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2ccct7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:04:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30be90a72e2so2724376eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784247; x=1782389047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBt4T5ztL+37XoZG4IqKuKFLXZvdRDr6EzRefwCHBo4=;
        b=kU94MMX288RVToT9a3MQKYIyRYow61xckoY57WGPF5KepEQyQo9Tq+sQO1ffvVCbev
         B1evXU24SIWgtawfoWU3cXoT46e1ZWWlj1qWSVMOySIg0PWqzmOLtu5hHwUBb7J4ExXO
         UhyNrIj6wFrYY83EqiNl9qcuLPuDPR2UJF+68NcSHJudEaMqWHbJcl1E7diu79xiO/Bw
         VWZ3ZHY/TRjJ6pDkaoq8JZKlfX/QagxloKlNFy0SAV89OSuMIBH9QSjeLjubRPdZqC3Q
         mRQx1RV5Mbhe5YDnvujxCvSGvPiXk/OzaTdCvFOH9LyR6pi8PRYLDTF7DKF/jFcLlVX8
         bxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784247; x=1782389047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBt4T5ztL+37XoZG4IqKuKFLXZvdRDr6EzRefwCHBo4=;
        b=AslbrlWJ6ZmLIab+adziD6Fu2ZxzAp9R/Oyvd8cUobT8ZIx/mE/YZ/wdnxZl84gTVr
         JioK5GIfWQCOwOebR0asi9hSJXnvc83KVsQVRzXlb7BqdLGM7ve2pSjpVWJFmDDG1VSb
         ZJzzHCo6iQ52aKRPVFP270tfp61mTocfRAalb6e1LgJQuo4hLVg4G10QbB+SD9gmVQno
         dLVaZWdnvD4vDtGRKx0646PZ6KO0AASYP1h0BTQhvjn911xnAdXqncQ5ysEVLH/pZKoZ
         kkttPpBO3O304qE4DfhNPhwxtvnkx+QyDW9GXtGroBIT+8hL6qxjlrhI5KrTYUkeIko2
         oKrA==
X-Gm-Message-State: AOJu0Yzw4LpB8E+sxabRp64uBbyl5yOJjZFua3Qur+DtWUd+ewVOpLar
	Hl8s+fWL5S5ZMWK2FG+nchQzv62U7EznNl9AlslOFJW/8FTs7RKUV+O8ZqWeMBpjZN4UYxc1FUT
	GHhplRCV+vt2gj4uHQtVoYdxwyM8X4GLUbXE+wad3sgmmXO5Yu5EsfBMu/aYRB9qPLNEZ
X-Gm-Gg: AfdE7clfpzImpsCtSL48RkjrTCj7rrctzNu5ow4mrEG4jNyEuNJtmA+hWCQlBzHYboQ
	69md33Cw8QyOvluuZYbDas17Cq1jlnMsFyLiL74ezNs1jrIMzU2CtJhGnotLZfp958gUEAHi0Eg
	CbB9Rxgv590oLALIVEEexxGOPp749HXNQPlw7JFi3rr9ut7dhNDfINJmUucftmxwgKZwgTC4Skl
	TJ4bcu1QRLmwQtemaCN3t/6KoHc58i+iPOIeWye3y+OikT3K5MlBstfsYHynvBAasSYjETCNijD
	FBwL9wuhw5H0tqHJqtY7LL8zfuPQzj5PgRX217HzDuMPnLRfa6pixJITnP0ob1YPSkh5QUWtk7L
	JZRSdhxIpMiVy+FAtbjWDHaVMI7uqZFejf3g1pKmnPwUQg2kZ6JA27dVwLZNXJrU2qA==
X-Received: by 2002:a05:7300:e68b:b0:30b:e540:4260 with SMTP id 5a478bee46e88-30bf0948038mr2457613eec.19.1781784247127;
        Thu, 18 Jun 2026 05:04:07 -0700 (PDT)
X-Received: by 2002:a05:7300:e68b:b0:30b:e540:4260 with SMTP id 5a478bee46e88-30bf0948038mr2457565eec.19.1781784246488;
        Thu, 18 Jun 2026 05:04:06 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:04:03 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 05:03:51 -0700
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8750: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-pakala-camera-v2-2-9fbb729fd242@oss.qualcomm.com>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
In-Reply-To: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX1/RtPZmbd9tt
 U3hoApk2udQbzyZJRxLVhlprwgzkX1BzL6BZDQSM9bRnqmr2LTkcRAg0HhsU7USJkn9slXFwS8p
 Y5krTVe3GAb4dh89f0pZMf/Itfgf7V8qi8bI3K9brHd2cQNenTbAanisaZE3v/Y5pvdDyYg9F2q
 vzK+rM3wx4lT9h3mK5VXSuDXL599epzC7SUX7CsSWPRW64kjGNA+Wn6n0T416rqNcnQd5X/lR70
 AXztuNfrbCwbptgBFjrYCxLWWSDwitiaAZ97MOouvR8KDcCpAy6UsZNmG10jeD2qx2bdYqmez4U
 FpgNu2On3SBEgdeKtsjK0nfnnhBTNWlQYMvOcQuYPECJMTRg43JjXgs1JTjmOB+NmS8+E1U75k1
 EVZKubr0R+jz/yhMRrFKsqzgzaRiee9HgXwzL0zY6S+eN8/2jPgA8vS65tdjzzWR7b7eHGzfPGR
 5s68iMiOAcfv2YYJ2zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfXw3C5mUo9xAG9
 n2gBo4TUO/crvoWYd6wGgZcG3RVn+e2rANWfkrsqBCr46wUcD6f9vEQI9AJ4mlPcsJYyzsWpVrD
 dnYSlvUbLLoZMnvofQpuiiy6969cNEo=
X-Proofpoint-GUID: bwqbE45K7Yp27SefREBuxGngIijQegk3
X-Proofpoint-ORIG-GUID: bwqbE45K7Yp27SefREBuxGngIijQegk3
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33deb7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=--cV21oE9J2x1QxDxCAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:hangxiang.ma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37C1569FE63

Qualcomm SM8750 SoC has three Camera Control Interface (CCI). Each
controller contains two I2C hosts.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 282 +++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 15eb588acafb..7dda8408c6d1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3037,6 +3037,96 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@ac7d000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@ad27000 {
 			compatible = "qcom,sm8750-camss";
 
@@ -3809,6 +3899,198 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1


