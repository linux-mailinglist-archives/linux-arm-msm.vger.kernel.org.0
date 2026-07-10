Return-Path: <linux-arm-msm+bounces-118174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z8yiDsqWUGo42AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:52:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7F737D5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:52:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Z9mcN8rq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ElWgexZn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79DA030078B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8353B440E;
	Fri, 10 Jul 2026 06:52:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB43B42D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666355; cv=none; b=hQqOqPt4hK93QrFEYu6dsF8+iyxuJ/R1ZUrDBvgJ4b0KUCJmb/NGu+uVGROKJ+BJklp0qRe5EKBelbGpR+gi0HeBKuczGXj1QD4XL1FbKeNpeGG0XQMlmZBeUwlw8/nejtx6wEiDIWRY+hnP7JzN5tsjpVdcnlvynRlzmVFCulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666355; c=relaxed/simple;
	bh=D4WOQCoEyd7LTFef25pROJebQUO6pijrkTnstcA5ejk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Neobg0h9ts1A8tuyb+LAyjyAcgoLKsiMME7aoLYv0YOgJFwHtLWPeTBuQD7YS4JChlOOqgkfhzF1zJEKaCCqNi4ev3lwesstTbsxCETafugYBzgF6zE/st3NYjNFBS1CTRvl5GYiAk94HHk6+IVsW+e0t4YJmBFVQvJOV141yLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9mcN8rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElWgexZn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3nDEh3752782
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oymSMDKTgbNw3vzJQeL1JNY59Ar/ZsjequuNwFdKzWg=; b=Z9mcN8rq+j2CaKT4
	iDSklf9DVygY+2S/Rth3jGlNDnv4rsJnJEdo8bf4EOiqftBMQIPVV8x1ZKE/wZtQ
	yOxzv3MHCReBCSJ7omUS5E/ifRr/EENMSqojbSlQg7DbsscyGSIUtxLSTyJzUmCY
	TvyrT1bD+/n1Mwl8WBDMuRZ2hLIAzWKvdKAVUpV5L9EA+SwV/Mo7ZeDf7tLOn7UM
	q0iS1T8pK3mw0WZUrrD9jNTLvEjqMQm7m8CU64m3ny5s6rrLsGwyuW8qgotZERnj
	xZrRpRmUSxJ4Y4yoK6i9K7WRO0/GV3BFmGNJwf4plgf34TTel4IB3lL6EVvWOt9F
	clBklg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjbdk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1223064a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666352; x=1784271152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oymSMDKTgbNw3vzJQeL1JNY59Ar/ZsjequuNwFdKzWg=;
        b=ElWgexZnhGOX1z4bcboIlfnJ62okevp5cbWU8L/xywgVNRI2Zl5YhC1Ss5zAal3UV2
         XaHvYC38BX4iDwcyJ+d23xedzjg3ch2pbbMte1nbqEGQWZLbjzUIZph2I1QQASdCqqTO
         wxjehl4SK8r/dq/3jfUG4DV2s8Dnx3geL5naHOFnkPZC9WogBbKZJZMPRKtJdRJTb96H
         1qyGqe80547AsnPKuz8MDocKOoPkd6Blh4vyWSeFm7s2IVvdsZmUBGRfrcT5sMsc0NDS
         xlOi/Tq0EjghabFeWvFLZSEYEoj4ELtWx7kLmM4XabwIvC0MFijwXQS2hOAhjYaHzmOS
         pBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666352; x=1784271152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oymSMDKTgbNw3vzJQeL1JNY59Ar/ZsjequuNwFdKzWg=;
        b=EuxhbremBgITNjiA4XclZKvQWWlxGf7+193yi5DG+MlgtbCOnu6p8tASZNOGG3r/lm
         P+ap1uERmomvEi6AQ7C+w9M1N5x8seskpDfBaHDaRM9ep8CysB4B5Q3SMuRsEKWpEPtA
         H8XHRK6tuoC8oPf+6b8LvLE/nHPl/OSR7BXjgvHeGWRrL300AkySG6C22PW82bFemOSg
         wI8i3L48lnqOboR7lgLKqUZEHRkMo2UifeFJiBCU8BjeTgsjqW+I3WirNu6fFPBq7Zqd
         Hu1biAU6vopV2NTMtIGcaDRVtPCjZZaIDOGyb3IqWCZHPC1YoW1fgHvqn++ehxS+YPTb
         VJLw==
X-Gm-Message-State: AOJu0Yx+pj2eTGL36e/lZFicIuf0GBsUAlEKKGpw+tqLBnplIA6COc0v
	81yEnMEODyfT40ttfEYWNMVVNQlxb/oRHAWA0WH7xs1LVszV1GR7KOJvskPovQmy5PiB6e0wSPq
	tBMNsE57QuoCXHhLAWcg4vu7A4uRLguW9fW/sg9dEeoFgNDUpmb58LjGCBzHSy859b1nze9Py0w
	VW
X-Gm-Gg: AfdE7clsfnaq+s3Ts/XAeJWUuUsogmn8uEL2iQf0ZE/BxBwqQBtQqCQJCK1r2em24QJ
	coadN/ZXWJ5G+LK0jc/82GqJp4p11Hp/JtwFcdlrDGcDuzLXqd3wkDGzPE4YCrMoW+6QFkMEPD5
	Nx9wvqJGe1UobMpGmXVUv2vjMtXQ1kZPPI0r3/7YLK2kcxMpRRTjiU2ti3D6nJkyssKo0r9rVe7
	zBWvGhjSW/GDQXF+KTVASJxoAGB81u6yAknBHbwA4wDw4yqdPubFhj1CJ2wpqWATeIrT4L7pnG4
	kDPG22/EjjrCiVP1yuJbHNRGU0m2wPKjOZJApSNVJo0whmA869PkCX9jNVcUqnTgxrDSF+gWh+B
	zDWk1lOyAx0sY2eOByva5mTFP4wkQXA==
X-Received: by 2002:a05:6a20:7287:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c0bce9cc2emr11870652637.40.1783666352343;
        Thu, 09 Jul 2026 23:52:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:7287:b0:3bf:9fe1:c27 with SMTP id adf61e73a8af0-3c0bce9cc2emr11870615637.40.1783666351803;
        Thu, 09 Jul 2026 23:52:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm31618301eec.21.2026.07.09.23.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:52:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:09 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_adc_support-v3-2-ddc840fca0a0@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783666340; l=1713;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=D4WOQCoEyd7LTFef25pROJebQUO6pijrkTnstcA5ejk=;
 b=FWxUOrNGe7oGApVeQDN5EUolSmmAbL7rsQH5kywA3+GqcIhmrYyZ3czHlgnd+A4vAVruheisZ
 UUsHk+RnujtCB0CTXHHK7efSFU4+XBZNEmfx/IpHKVuWswREM9dXc85
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXzwrFG9hc5Tbh
 gxtPjhQ4HDKhtbHH4yaB/3+oUJUZxzuV99FvCO/h3x5HyGnjE06NBdtO48Ma9LnjgeWRTsz91Oj
 d5lxIb4hG54YKtwQ4Su3/q1YngunjYmY/cXHWQQ595DHoGRW/7s1BAf1JPjteV8jrHTkgIGm/pc
 WEiwdSWHWNzt1LIp6dlqwkMYoiZvMyn1sf4kkmcSVEwm2HO11ZlQZkiBFOnGqHGypg3R95EA9l5
 0+UoqA5iOyR03zoQKZmh/PsN50Em0vRxYXkLE/I3GEBQPvnNNdqRgj+5692NkOmTQ20RBoWXnJU
 LuvyS3d1GvaUjXHvgYwVNfSd2CuE+QJpHYiqwMi/x8xubJktutO7p7BWl7fFmSyRp3QOw35rY47
 olwl98PgaUYuqyIpqvYVCIKG5UU0STtqVUOyW1KALJflboJKZNIqGPcN87lUlIWWMU+Uab1HnOR
 2eMqfQp67VoEoqxMGbg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a5096b1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: gdYGaSbBPKPqSQcgRtWoLq1VAMZlPdy4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXzNWp0T1MF1Tc
 5qH8/oVzbuxQcqmHfIluofQxTpoJyk5s4KL7xkJSONJU32zwFQh0E/77ySNe9Sf5ZmlnbtgR3mi
 UM0ajt9eW0MlWM1SFpTCkX2gI4QujQQ=
X-Proofpoint-ORIG-GUID: gdYGaSbBPKPqSQcgRtWoLq1VAMZlPdy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100063
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
	TAGGED_FROM(0.00)[bounces-118174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0D7F737D5A

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..e6f188cefffe 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,34 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0


