Return-Path: <linux-arm-msm+bounces-93711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDXJGltqnGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:55:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B921784BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8DA330BE2C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF38257827;
	Mon, 23 Feb 2026 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOwE7Oy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vs86JSaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB9263F5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858475; cv=none; b=CmvxA2bsvcgSYVVbhqjPTHCl2WpsgfjfNn2bdKUnroPWdnhiY33BwMlMIoF4b/mG4DSXqGRZTDoMm2QZPqwdVR5uAAH5G2a4vAjjd0c+a+BqhG3IKcRndTlFKuBKtM6tCdgVcTGijqvjJ6ThGNzV1gZvVAlsnA7Rf698hUKmRfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858475; c=relaxed/simple;
	bh=rL6kLKFytyN3xMFSZVPhYH19QdG8teuiU0enGiYIN7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEfrC3l+m89JeMYkJALaSuRfb42CzjNOoySYYX8UFhaR0mPRLefdKwqlcbaaxMRf8QXpUCMO+yM8IswxUlSBStu4LlAhxtaCvyh7LjFY6uEriMGvY0titBfV+Z2Atx6X+XPG15KBGy6d2xaz5yc9aavZtxz2TsLY5vTLlzqXxQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOwE7Oy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vs86JSaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9SsKT949633
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8FLPecBRAb/fYyOdq0KMWVzxtzjOLZd7mSDc0E2sA4=; b=jOwE7Oy/3N6+lY1x
	seyrPhDnZURh2aHzn30B4UN5CSwjIw62snqIUvbn82C0W8D6dlAxY5mRXkbusWbt
	I0sYTYcX4veam0DMxDitXgv2xn6BaceuRKn82yET1FmXRBiwbAb4XcIhvIOYr5DY
	8jy27OXgnj+pOsi09XP4e+0nAZ/nv+4x7Rpi+eAF0x1mQuW15cSqo9v2qS+VERwl
	8Toufz+RCuLgkhcL62sOQnJOHQNIqhrM98a2Kl45WJ0LU6nKr0gG9WXjggKQVHTF
	sAAliLq8/AHPDpGYO5pD+1XE5Ej9DqftflAiDZigHcsLowC9rgPlCBUCJgxUDYv4
	Ko9F/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603n556-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:54:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1813233085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858472; x=1772463272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8FLPecBRAb/fYyOdq0KMWVzxtzjOLZd7mSDc0E2sA4=;
        b=Vs86JSaAKbhFKtq64eE1UNp+j1cKsLixzni0uJyyQUL4RD6t3bYwJBbR0ihvZxwnTe
         KXgscaoggIrQi1Sv/27hUq4wm/NK1mhrnguwLedvUIkEdT6NQxr26mtmFgF1PODHGI39
         M0Qd4+NYaIqqvaRGoevkp1xAU/B3vnPcF0AkMmCBhV5WbcJazeu32tgiQet0tFRWxmD2
         ZGAoIR6WaMn2Drx4FFIdLtg2paRH2j2lKM0LAoj8obx5QOgKOcnleS+soskKlp1/2Rpm
         7CY0glC0fFDS2quguiojQUz3bqzAWGFnoTHmg23ZivnnVbCjyjeBmJiGosZQf6GyPEmR
         4MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858472; x=1772463272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8FLPecBRAb/fYyOdq0KMWVzxtzjOLZd7mSDc0E2sA4=;
        b=wSifBEOTPXZH7eA/buORH/zN8s35JwukBxMi8vc3NyxQE/Gsx3Gs1Czs7BgXd/2S+G
         h2b3dZoxLMY4RtEZjzIEyEmL2qA7FMQQ/MuLPtArZsCI30QpzQMmbP0IfgiqrJmpLYor
         GiPzQA2kfgbIfQLvnUl7HXoZu5+O61sUisszyOG5XRJjooWXR4W6B3Vs+tSCfk20wAAu
         cO3JpysojjAisPySYrdunsYzOtKDudUduagiH7+Z9GGtlYp0gIZoh3ZUU4ghbV9JtgM1
         1i9tK19zgVf6qz8UsSEx1FbnVU0p/Q9DyTTMJUJfviTspA4rMCo0eHNnwRg3kKm8kxX6
         15uA==
X-Gm-Message-State: AOJu0Yz9SLtoN0igNmlzkCa/eEPXGQkO1OeQKisRPzC5tI+ocUG3JKVL
	60xClUtIbO/nczdZUjQv+xPHJbgqBmippqq+q6xYN0k3rjJc+f4JZa4e3yiUjzpqQo53deRluLm
	v8UzbdTlyjf5/nGyIkq78efMb19mrioIrVamRi04ops9boRDdyjHQgmMJe5kShY4RSxIH
X-Gm-Gg: AZuq6aKLNPblwz9ldNbgj98MilZQdw5tfxMdR6PfPRX8as1r75UPHOfhW8/ieIuOcwg
	NlfgF9xGrkrUL4noGCJyfwkjYSi1wBg8357duvTK4IXq6ez0KbxNLXdjOo8GynD36tfXlZ0MhQk
	1XO1IzmM5Rea2Lre5lEjDJxHtundQMcojNSs9gUKOSFFXdsr1w+LJeBJMDjw9ffvZq3yG+q0g7z
	qMiGbRkZayLGqQ0I2CDv5Ef8UdvE5TOzAkQmJmqOjDMPjvBwfSknJJKCz6TvIQnZZPPa3Iklzqk
	v3Ki5pEZwL2bbNocYXxRvPCjq7BAbYb7vea2jCxbea29Yq4aTnf4XAft3dSmM/v1nBzF2hAQ8Cg
	9HfjkcQIo5mn0uwmYjb9sSZmwEHLRo6Q59rtxHWh3zaXX4g==
X-Received: by 2002:a05:620a:3197:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cb8c9fd14dmr1050065785a.22.1771858472200;
        Mon, 23 Feb 2026 06:54:32 -0800 (PST)
X-Received: by 2002:a05:620a:3197:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cb8c9fd14dmr1050062085a.22.1771858471710;
        Mon, 23 Feb 2026 06:54:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b88esm1646629e87.8.2026.02.23.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:54:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:54:19 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: qrb2210-rb1: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-qcom-dts-supplies-v1-3-f90ac885b3fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2988;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rL6kLKFytyN3xMFSZVPhYH19QdG8teuiU0enGiYIN7U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnGod6WTTAbwep9UiFSlS2j9ikYhuyckstbko+
 E1MFAzU256JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZxqHQAKCRDBN2bmhouD
 17KQD/0TIqeL11fadZ6azaNAiVJGyEp8IxRmZBdKrwsDv5QRgYQwQiim8qFvg5u0szpjPJC+fVJ
 IXXA/6wlbOVUv1NQsa/GBnUoEVBbF9iJV/RZ6XnIPHmqnibEHCuCA3NbzfnVAHfd1BH9DvZIFQ2
 wetQVjVPjSjyMyAECGan30eoK1uuRFBIX11NF74r4F2YwdeS9lipYSHsPqqXFlO0x+vNwQdIrSo
 3wg2GBNTUNF940Bug79FVOBzXvaJZzhfiOfrDR3SQzkUaq5K1DTQyiZbJw8uP+mtFfrvNbxVyLO
 9Pnc7wtMMFSTwFRfTE/+SGU+9fOz8iyAS5PrvGNOWy1Sk5g1DHrQ3H1Isq4+J2p9hcILNFkHq6Q
 8PWwHe41Lyciw7MuHX7QBknHq7821SwhJJnlfx5MDYx5gSg6/K2qDNYlzzIVZ0nENdbvZ0wPBeE
 o5TsPD3wNi4cKqmWVw7Ipe0AFb08ifqAzvMDOSSlL9hVGLQ8eaJY/sfTk+PEOCc5bneWt2zVlTk
 j/m3uHEjiHb69UWy7UPr62V5eyR8B45/NeAkkEQbDpJ/BDxtZHebcw1vF0N/TjSe5gqKUjE845J
 Jw0GjIeauq81oFH1wYE3BkcQpYC2VLQjqHt+oxGGypQSlvQt0DXRDbn4EMT2i0waCtDZNaD1hhM
 P73t773X63u3OmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c6a29 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_9iiUgdG0rMA4LjK8P8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNyBTYWx0ZWRfX2Ek8xwLjAURy
 XwhsS2omJ6P7AtNr0v9psOajXphHw6MTuhd/rJh0VdkBSV7BEXdeoRP93quwbXgqe27JRmuWu3l
 GO/oTmXBjxCdPetcFUxdoTBfVGOuBaB3eXa3fAwdKcPNWiRdr41Ap8py0kR5+xdPZ6Nriy67PNk
 /A5DoPspCdjTv+fexoj2AKf7OmsdeZ66gip3ayIJ+ggwQIDTbG+p7JD4Fm9uPkjKgCH3HSM9W9Z
 AhOf2RDtx8eI/FSpbBuCRtNyiq74ve/rW4xg4yzFhlle7m9fD7+Imsu15s6zRjo0uYIa30NJXPv
 t41hMMDwGtCGY7Z7WnqZuLRTSFALUqJuqnNyOkaQY1hvRzzFVgnYi6QN5SAAINsj56jB7GXJ8rA
 kE28PBg2Rd7Dk8qylm3eo68duUaahtUvlRxlI7K1cljM1RArghIAb4umNgi6IMoDjqDJqWLB5W7
 Jk8Q9I2mHbaonLPcunw==
X-Proofpoint-ORIG-GUID: OUn7IDpht42wG56qNG-yEglWeKgiZeFF
X-Proofpoint-GUID: OUn7IDpht42wG56qNG-yEglWeKgiZeFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93711-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 16B921784BD
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 45 --------------------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 9814ac4896c5..6ac7fe461f4f 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -109,7 +109,6 @@ vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		regulator-name = "VREG_HDMI_OUT_1P2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_1v2>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -119,39 +118,6 @@ lt9611_3v3: regulator-lt9611-3v3 {
 		regulator-name = "LT9611_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_3v3>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* Main barrel jack input */
-	vdc_12v: regulator-vdc-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "DC_12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 1.2V supply stepped down from the barrel jack input */
-	vdc_1v2: regulator-vdc-1v2 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_1V2";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_12v>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 3.3V supply stepped down from the barrel jack input */
-	vdc_3v3: regulator-vdc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_12v>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -167,23 +133,12 @@ vdc_5v: regulator-vdc-5v {
 		regulator-boot-on;
 	};
 
-	/* "Battery" voltage for the SoM, stepped down from the barrel jack input */
-	vdc_vbat_som: regulator-vdc-vbat {
-		compatible = "regulator-fixed";
-		regulator-name = "VBAT_SOM";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	/* PM2250 charger out, supplied by VBAT */
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
-		vin-supply = <&vdc_vbat_som>;
 
 		regulator-always-on;
 		regulator-boot-on;

-- 
2.51.0


