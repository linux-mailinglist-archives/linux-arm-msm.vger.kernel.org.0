Return-Path: <linux-arm-msm+bounces-93709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DXpFD1qnGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:54:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D954C17849E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42C2307870D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6519826738B;
	Mon, 23 Feb 2026 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxBWEb5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXBNg1Dc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30B267B89
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858472; cv=none; b=BL43PywSdR3UT22LM7RcuU+uxAIFVOZYHngP3LWTulYPvUEbSVL08r6hKlM1dp2ThCk7cJ/+b5BBtqFaXX9fMnyAQEz2oyubbK6rgPvNZafMsfZKK6YGJGzlofqfkudbQtvqhYie6hDV3jZdySt1hhOtC6oDK2ueIuEoHfWkArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858472; c=relaxed/simple;
	bh=5IjJY41jrJn8WXxooVN6FciKbwsGy+4ZZ6/D+Zxslak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D06nGqZRHG9d5j9TK4V1dDykvioQTQygznve7n71eQL0VOAJ3xDmq8sqtxJ3QkmI7Hb54JKnAw7PQAFKFOBvcIq80dEmlDCCZwDSgchFJPmY5Mw9cC1PYAYmzPjs1GxhUUQOsGqgqKTjT16LHdChGWBuPbMtv1X8LhOaM9EtU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxBWEb5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXBNg1Dc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAX4v63698607
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNApJBa2znS9PTp2E9XpBWmk69Vl+yubH0GKVm/vM2A=; b=NxBWEb5jyt3r/Qag
	JkE2gmrfdbYATdSZ0TubQAOplwpt9T1W02iKc122ELOLAebuLBrzjnzj86BtyUIa
	A7pb3S9IN9xNhtFyTTysNdpkwI3bZ9nnqYbESG399DmGP1hsYCrjsTLphKIfBwCR
	GkvIqVoAfcZm02UM5iHStR8zklywM5fwlnZBzhayuXta9MiNDGam9b+rARPcaeWU
	5nXj6n3enpSY4VdsBVlRXO1Exxv3XDWlaT92DVizw9BY116oeQsa9k2R9u+Pk0RN
	Ndd4noykZ3iSvGtrYhaeGOwdS6uqOiJIWkZxo2rMXNSYRNvPSJI0qQPE7h/5XAFi
	azOhYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818q04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so3574793785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858468; x=1772463268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNApJBa2znS9PTp2E9XpBWmk69Vl+yubH0GKVm/vM2A=;
        b=dXBNg1DcEDdsIwLcoI1v2KXVns1K/4sElGxnJ2kcRf8x4Dtgx457Ai5NdxiNC1HCPb
         GJTzZfOSX21TohVdijxR7kx9UKSJRPHKIbmNGUDkSXI4pkVlnGPlUy2fnwxNPyKNJRE0
         b2b1suzFxJmiL3tBqfSqxWXRL3WSRHLrbx0fDygeLy7KStTs+WBc41mLCN9D0cIeR7WO
         mmQ0CgY9ZSRmwWj8oq5IYUGlYM64oUebQ2ZfkiKNVvBPyO2q/qXQocwTH5jL2AorvoXp
         dfs8O46I8jRFcmFum23ksQow0SgrLS3fVcl2HPI5BXIe8OomTU4KZA56r7htkTOSMuic
         v1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858468; x=1772463268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNApJBa2znS9PTp2E9XpBWmk69Vl+yubH0GKVm/vM2A=;
        b=n37Nz0re3IKqqxk6r0Asj64kAjXMYxLvICJzk7ZJgJgtjklfL60DTQviVJ6WEJCIcZ
         /2ej2bAcUToXA0umwsVXnUP9/eyMQz0rKhTqfheS1JBQgZPwkoZLGgG5NCuSlJrlBO4t
         fw/NCQG4GP4fTpGSbtjbDP9gkRQGGQyf5F3L5XJDv6dkmN0RSHDZVECCweLqbkL283NM
         rLN/szB7g6PLrwdF4qncUWJq+jI408EiLW6oC/sJt0223LXtxRwoFcxNWZ9dhcUDX6gs
         99QQBqC5rBV8kG46bytFDcl9LpnkkiXiyjnpv7xYyo/nG9G25QP9LWlR1v724b413ejK
         uSaA==
X-Gm-Message-State: AOJu0YxahM6WyTFCr2s1O5TbUZUsEmOqo2cDWPRgvNOQGqpB3sOBcvkS
	r/9NljPuhh8o6IL626iRCWmhfjTomYHoF87NG1DiaqtMdatOrYU2tLoJtwxWJo4Hn2HXDbw9zaW
	KGEMLxyfJniUygUOX4i0AP9tBNumfOz8EBFiMGjcpC/dL2sh3sBFSi1Av3MzUA4Kl4EbU
X-Gm-Gg: AZuq6aLeLxiFNid0eEOMLyjDB6VLOOMbe/E68DbG8UA8w8yJDhZorTzEsvgGR+fxWti
	x83hYMVfLZTLqXIAARnmx7+ILCll78VZkDzRtj1/HjbeoPIISCsCUu3+ZlI58lyFvL0OVjdcSVh
	H9zc6VLhvLdfOAaZa7I+gS1Ul+rfE9IX8jyfrd2lmDkXBeQ1/OazoZwpgz9HDFmIztUKqnX1Djz
	C45x+DrHrGwQI2dv3a9uVaCZKnbUwdV+4m1sTIDCa/NYAY+MAjUCko+x6lh755rLIZFFWuqkDxf
	4NbDWScOhpH1a9mMAEoj5lSDlkFRHYb6NEDkGUEaGe+GEUYSl/sZW1BdLoltQBWeoXRYxWJv96A
	RRveNijfJdOIxyx9GwOGCApnnaHWgN2QmJc5vU+/tNRarQA==
X-Received: by 2002:a05:620a:7086:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8cb8ca83840mr1039066685a.64.1771858468220;
        Mon, 23 Feb 2026 06:54:28 -0800 (PST)
X-Received: by 2002:a05:620a:7086:b0:8c5:391f:1db7 with SMTP id af79cd13be357-8cb8ca83840mr1039062985a.64.1771858467712;
        Mon, 23 Feb 2026 06:54:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b88esm1646629e87.8.2026.02.23.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:54:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:54:17 +0100
Subject: [PATCH 1/5] arm64: dts: qcom: lemans-ride: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-qcom-dts-supplies-v1-1-f90ac885b3fd@oss.qualcomm.com>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
In-Reply-To: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5IjJY41jrJn8WXxooVN6FciKbwsGy+4ZZ6/D+Zxslak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnGocqB1Qf6ws7i764U1gxloIEm68e4hh5/URb
 xsAnErKK1qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZxqHAAKCRDBN2bmhouD
 147wD/48jJRe3DSSCc7eh4muSgrsF382b33P7F6P9h/T6430v5aSTbaPs0JiLjS9iKSEAIUKo/B
 gH+srgO+YlSt9yOQIpElSjEFWaZBSipLwqfWGwrLeo05JaqgJq/qzOC6Nn1ZKNUAO6lEzJ7uCt/
 rPF9t7Ryn7XnSLXvJpHvtbkNanpNVYLakrQaNVbJErsVsrGBb0WFs5BETrlN/Ubm3rhQtcBXlUu
 b7T5Zr0HKmvrfabkvjC8U5QDfPt6oBv4Jf0IDq+HNdOtS+NiLPznflzwHlCWkYdn9gl0gvIigaa
 +ua4F083h+NdfLw1Jy8W/WBEuLX2L+DQjfkRlW9E2UeCosfob1KCeEYyb+uZOvqkVyQ6a2F+HX9
 B9u0fLd9RQWwzxxELbYMzA6j44atabxmEIx1S3uU78gNB7wProwoVCIjDNSDfqescFHGfz2iAD4
 6WJnsTZ61YDNgqqRIjWw+eSAuozSqGPvzDPRJJ2LAVEGyjdRTgjV6xKXYyfx6d9hYnL4L9HpR2k
 D0u3OBvK0GCsJfQMVvZEfHg56v86S3/4C1JUIiraJvkkNh2do5VEJIMQYBOueBUf7vvFgCuVilO
 touGFA6jA5YR+GVzMGPpLEdrYOTCMKKsLxNK03pOj1u+RFGWN1RyrL9GyOwgUouybW7jVyqbWx3
 o1ZYKFydvOJ2wDg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: rZeelpwAGpddLiXwFM09Ke2n2DNObtap
X-Proofpoint-ORIG-GUID: rZeelpwAGpddLiXwFM09Ke2n2DNObtap
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c6a24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-3cLnZj8YNrZoULhp2sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNyBTYWx0ZWRfX/dZqekq1OhAq
 ujAU4zFBUoGFI9jjwSeKE6rPFalTwZ3vrrRRwLzgnm79naTX4gL0ZNiKML9xCoM0MfimzKKhETo
 DjOSqcuCrZ/uIJMaPslVKs/5qQPaY7fYpiRwSSRoBvcsp0ceqPUb88b1lnXbhjtrzUgOrVlBY4N
 nLG3KE0NhXABaiv1J3o0/iknacRXQ1N/v2eM53jNbj8dOvKZ3M5v7ifj2tAa5PhpOVXx+3QCzQB
 cD7lKyzGhCnG/r+fDOhpjsj/IFjvN/ehv58jPvZT8bfbIrW+N8lyv5vKAQC4vaArCg38QCW9KGo
 QmKDjhnCwK8eXaBdTMMpMFNuCX7I01L+mN7ZEz4guzCmrhWUmmRf92gPToJztBVmzmyy5EB7Tot
 meiVCbCEapn2zl79b26uAI4CUc60CyTEzaSWCZHwuBQa0UR+n3nU4HloXhNvpgEuS0oxfoP4tfT
 Nw0jacrGZ9kypant+TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93709-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D954C17849E
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 26 ------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 8fb7d1fc6d56..31bd00546d55 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -21,28 +21,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	vreg_12p0: vreg-12p0-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_12P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-	};
-
-	vreg_5p0: vreg-5p0-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_5P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		vin-supply = <&vreg_12p0>;
-	};
-
 	vreg_1p8: vreg-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_1P8";
@@ -51,8 +29,6 @@ vreg_1p8: vreg-1p8-regulator {
 		regulator-boot-on;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-
-		vin-supply = <&vreg_5p0>;
 	};
 
 	vreg_1p0: vreg-1p0-regulator {
@@ -75,8 +51,6 @@ vreg_3p0: vreg-3p0-regulator {
 		regulator-boot-on;
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-
-		vin-supply = <&vreg_12p0>;
 	};
 
 	vreg_conn_1p8: vreg_conn_1p8 {

-- 
2.51.0


