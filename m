Return-Path: <linux-arm-msm+bounces-119174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JaLlFA86V2rTHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:43:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE175B896
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:43:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=amcVyqUO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GBX8p1HC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0497D302419D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943833C3C14;
	Wed, 15 Jul 2026 07:42:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3533A3C3791
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101373; cv=none; b=iXwBF2sX3v2NHOSEA9NRby+ubpOoUk+gTw9fk5oDE1eV/dPm941aVqau9J6MtU3S6QMyBhb+U9ocDopoK6t4AUBvgTC+MUeMGXfpJRJ5ap7IRlMqwetDSwpo8weV4JuPqH/Sv7ARp+tS9GhDWE9iqoRYP+gdEgTTMQZTSqYOodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101373; c=relaxed/simple;
	bh=i9gyaCSGcZOLMFzpkX9pMEGs5t8BqZLpmvcfMVigjg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBcZqCMx/MJ/1i/OY2Q8MTDPaeGgsdV3T6uNWj1NPEUqMecLu7TmJ9963eFMeU0Q+7e/IClETI2hHkqJBiDQn0iwdcDClYFYwx79Va1TWstlr8okKJbPCw0hKHl8NcbS9l5arWeh+/PbCF6td9sKLIN7twDR+kDG15R68Y+WjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amcVyqUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBX8p1HC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l4Ds2269538
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOr7lTwFEygp+BaB9Chwl6H+KHehijdYFWbNkSZj7CQ=; b=amcVyqUOPUfa4hQL
	P6+jQjYgf1M8u8JxUpu7+FcMJGeOm6y5Gk54QelWApI8+Y+8LAxEAJuQ2aM4Ye7a
	cIEruMpZmuM5bGqr+T+yn/WHAHAEwV4nBsMgKrOwqd5iCy4I25khZ/YBdRZlJ0OV
	XxHV47IILSE+2hiCFLmEkgur2t6dZFJP6f1XyezD22gud1Jkn/MzVe+tlEAgxL2y
	RY+zuHCxJ9kXcHLjZex+9i2HamOuEfzGq56wuzSf57VEt1dFs7u7jyAFpxRVGK7+
	L2YLflKs5GXRYf44iaMJa+fzrmaz5VXz9D+HD5ni/oX8V48XKV7Op0OlBfRfNXCx
	wUdttg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mjj0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so7697261a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101371; x=1784706171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOr7lTwFEygp+BaB9Chwl6H+KHehijdYFWbNkSZj7CQ=;
        b=GBX8p1HChZyJwqi78ocIc/1Gng6Ioch+Q+1kGSUQtuxM1VeeJtJPklbYgVXVMNKJGG
         M8rout0sTXS/xvIerw89QspmCZLpt5ziyPta1lV57ejDAXxfKIHiTJrcPss47Usc1AT8
         EzApT/a3VP3HpCakpamga+SzCco1twW3tkGAFYUs5KqyUnz3N6ynnjAr8P/IdFKqh3Jh
         U1ajijefVL9Vtm5P5dE8l9yZZe0qrZRh1cM4qeSNYdxBva158gFox76mt1G/rqntQwIz
         s1FIEDpx+u6P8uI/654j42loYpzF/yBlEtjUbFoHad82wWGEwVppk64k0AYp2jzzidK2
         f8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101371; x=1784706171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOr7lTwFEygp+BaB9Chwl6H+KHehijdYFWbNkSZj7CQ=;
        b=DDfFjtYMrvDQvJBlprvrweG8HP38UT2R3B50dZvRig/uVAr3PdxIZBymj0uIx9iuSr
         kee0R4TWJZect0kf+UgaLhJ9N+N2ApGHfBah9XNM2pa0VVzHWXKDj0X6VF1+KgEjDYuu
         jt5u49NQJMMoq8KZJxr0IIdzCBYa7GbRMjBWvhmYdYhKu1EIKqDjMrlWuyHRp7xRreok
         6S2ly/uUZLzJ/hIyXjMvkgRNEEDL4pz1IKk51ZjDw2cTNufD+YN0nFSxH41xuq6X73WX
         DmnDIPnCv3XPa5i9ebhVjwGkUjf2TJw+M2TeeIDhnAmEsurfQeLmKg57TjU1znT9R/MC
         GPIQ==
X-Gm-Message-State: AOJu0YyZ9nuHl+rJJsAl/s/HOrbLq5E9dlDI75h3RX2vnQacEzJUAUjw
	iCdyRfT2bifMmXixooHBBXpYo8N8WvsiGZpqTqxvuIFzKcOTraCVxfa2nxwQPRa/snMS8Uy1Tc+
	KntSoI83OTJGdZi2vLA8cxi5NOnJ0QeQRd1SQ1CzLBWQLmlObCHZdmI5tGrrID2lrYat0
X-Gm-Gg: AfdE7ckK4zLxxohw+vdGsUwrYSIeXMjFbldogUzxm+BX+4TE4Y7xMPXZiJ1gWDc4Yf2
	IJLWr0YjTqyg9V/xf3Hd7z4w1k5F2o5U+/g6hg+EdykCnjw8aoxPwfgtVwio+1VFJap5HK2RD6V
	rEl09DsPUEx/UXhiaujs32Zpo4RBKu0WUsL2OLeEuP0V1CwVh5uI6/2B+96QQLJW4dF4FjA4DH7
	wpl14Nz+z3wQd78WVJfFsaWmQ+mj97JSebJSL+xpH7FYQsdPSDZXMeF7rxMcWX854fSfOL8stst
	JLUPN9p2E/imrniqNh35ec14N5uM1YIWdjWPGpaDmjJfK8/CIo4Kfr5yGcULHGNVYHLEzN/nQV5
	OW5Ntc6qWx5GCP/l3cjO3wRqrqApNig==
X-Received: by 2002:a05:6a20:3d1d:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c357314336mr6411729637.11.1784101370720;
        Wed, 15 Jul 2026 00:42:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1d:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c357314336mr6411710637.11.1784101370304;
        Wed, 15 Jul 2026 00:42:50 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:50 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:22 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-2-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=1710;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=i9gyaCSGcZOLMFzpkX9pMEGs5t8BqZLpmvcfMVigjg8=;
 b=0fyoYofErkURLnaZ8n+sUr8k4DItYHGG4jF/4JxX/F8C7UbMul3/jnTdF9mhbzMIz02C9vOLh
 S6d3Xml6ywwDnVE9zQZiv+StQADUf+UnZQ+6GwDSN3CetK+9XHMPzLP
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX2jMO2NFXMf0u
 08pPtGUXJT5/U5NZwNY3/4pBFl+iByOcBaYAzmKBJIj7vyCidz3/GJEfQAjJTCzOu6lyKHJ6iOB
 USPlCRwlXngff9eSn9d7QU1gfc125Wb5m0eAuGIL98bkX/zvBNRSZJkfmIY8RvnrAJpxVXBRS5q
 6lZlQO2lTqiAyDBgOuFuoUlmW2oKYOQ3PzAAYhEZReICYR5ZENKeyMoUkTja8FNuU7mfZnoQeaq
 jdolw6IRUMVUlSDpfr3reGHMJcstYdVUG+z/QH8cGlwBQxdaqsmTsCHpWOtaTq437vMitZ19l5N
 1G2AAvbQZwxrbN+c076aE17jXoGBJvGnHoovoQODvL+k+7QswJ8UNa2SBsZj/hj8HxLdscuf2rh
 4hDVr6skY8OedXIAHffHZugHCZ9kDim+TJPLoyp5BPVe9pGV3VPtiH1+5IW7mqs+3uEuoaKiN1W
 elq429G1HYL3zgOyz0g==
X-Proofpoint-ORIG-GUID: FKCs_uqH06IR8U1NotoOZmJfXeVPn-Gn
X-Proofpoint-GUID: FKCs_uqH06IR8U1NotoOZmJfXeVPn-Gn
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a5739fb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MiBTYWx0ZWRfX314V3DcLL1VC
 0DvmgUkIl2QJxyZN+by5I15pv74vxNhU+PQ04x6HPQH3SiyKbdOyYvkTD0t1+4PsejTHb7UTA89
 G2wkYBkAbdvUnID4Kn1lu/8SFDGq4sQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34DE175B896

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..ce31a8545020 100644
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
+					type = "hot";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
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


