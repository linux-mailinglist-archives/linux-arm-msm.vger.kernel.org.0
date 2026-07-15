Return-Path: <linux-arm-msm+bounces-119176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v/gpFjQ6V2rfHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E4275B8BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mkVOVTyh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="YVOC+mT/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE35C307085B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAA53C4161;
	Wed, 15 Jul 2026 07:43:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE333C4B79
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:43:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101381; cv=none; b=JZWAHAk2hzLSdgamjOyY0cUepzL33XBclLVl7AC5LIrGfkg2JWoojcnfUry8YpEfVT2Va9paJ4bhol2JNMSh0PfhcrCtCInx5ug3jXFuGdTH5wYH+QdxajBO1ZB3FBMz0PZE9UpMHrqPluY8ubiCG12MaAYgCfAXh7kzBe7kuf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101381; c=relaxed/simple;
	bh=KqYxumK5YGafOBVcgCJcjqQYCmEJidEVjvVUsCwQHtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aO4VkQ8km7LAStZReyKfLg+re2+tCdeFnbsIyudLIQw5XWLiEyxRjjFu4xwso5q1AtyEZZOSrHRfFgMfIMd9Kb3FH7HmOZWioaLzW3QLmy2zHrjiyXSgRFTTdYbTTpjgwU9UPoIG5jZv+v74cXP7WWJn/pnF0pD3MCCHwlsYTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkVOVTyh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVOC+mT/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l62E2596244
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vPRM+tj0riLEpO5hHtQtUWE2/gFMiCOYuNXlVTNR7tA=; b=mkVOVTyhKg/OuAqw
	ULG7EUSk0RP8dcUsycsjvvyRYx4Q0KBz+GzfPFXrRAF7BKkkP4yxmzd9mo8kEe7d
	dF6FHd8ZeDMDufeRQGT5eufOcM+LPpnqhE6zVrz4xFBLJHX6nGHUUicPaQTsMYrt
	Tp5gM1CZHIbulDPDqk3z3+O/f8yLu05zYAaRSSpq/GXZvfRUOTwCRAxwdM4P+xXP
	ey9kV3tdzxiRkQVdNVcRnVGFMP8ad15Dzav6aoMsG5uP0pXwHSaqveWX9DlhOKV4
	LqW7JWV3xOqvrlCu2vbsLB98I+ru5XFdhO4jYsXKRlsL6ZrkbbyDOoSMLDpfxSyg
	pL0fFQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq3vq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so5832368a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101379; x=1784706179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPRM+tj0riLEpO5hHtQtUWE2/gFMiCOYuNXlVTNR7tA=;
        b=YVOC+mT/PsabuNTC3tihwC0R0L4uG80uzbGEbZAnDwsx1GEuH2Zxg4yuL8xW5R4jN5
         2QVBaTafUAR+0dvFtf14FKhcp4FmRSyna3G2NPGkSQRaDEe9qCq/mna8DoA4O0un0uB7
         +FqPKe0S8kqfb87MxHe5O8HDtzbjgRL3HtCeEYvARWqYe2z4zyhLU4o5e42jwsYSylj6
         itQWKQNY+tkkqfnvh1jhhkGf6e9pWEYSYnLXxfftRbMrtkEczLpoR7z6o9c4e3uM2pX0
         b5pid+jYYHSo96umEIvyWoa5pcDcvOkdj7rbNiTfKiBgca8fFbntMjuwH23DBFB4ofhq
         qgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101379; x=1784706179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPRM+tj0riLEpO5hHtQtUWE2/gFMiCOYuNXlVTNR7tA=;
        b=CdOXdcZbTdXZ4sKU8Z8wOFyDd5RD1Zjp3jHhAZUDUork4AQ2e6BXJf6ZqPN8zGt5p9
         ffgkkwnQsCVqJuUjZkkvVFO4PwZkU/op2yeY/2VaIDQCAkfmvuLvC7upJHf7VyCv4wEe
         Xu7SPFEhu3VWQNcbvB4jW1qChQuuyAye6eUA+UDCvO65BTD+xrjFExp+dVqwjb8cAY6W
         MprIn1qf44i13CWtrbdLGoy1X1W0PrJg+vpQX0MAzKiwRiZ2bAUGSa1QFchwVDmijpuY
         YY1Ip13ntUCn+a+YLAYUnHjcRTJ1MUO11KhNM4J2PHO5umvBuXmH4SHH+tZWmK3W8D72
         VQ8A==
X-Gm-Message-State: AOJu0YzMM7r6p6hiCW9WDJO5DKfKr4kUTSjoG0gZR6P5au/S4yVlpvcy
	tDiXXTtF9uqwRkRDWFCxhAOQZiRV3OMk8DngPihAYx72n2KhAuQwGtKg1xX24tyOeq/kx42Lk1o
	v/vABLu/JSuIF+w9pyvn1tThEDMBrY4ns8aaQrySzquo6HVhVWzgNeOMYR2jHb6OjZ6pO73ss7Y
	FO
X-Gm-Gg: AfdE7cmcVNTRne9xns7MHgUbcJ0wfTANLsxbPURL9z9LAJavEfDgZSwN3ofvtP9Hg4b
	Q7qfWm7TOWkUVtNi4xSIxb1nKmJfpiiwqQ36NXsapqzPZPx0BdeuXjtmRdkJnFIEKYvt0Qv+6Il
	Tm+arKg8hlm6cTRSPSfIFGDCNkjwv65OrMBuA4LOstKazzowft2AorcdjyIN1EUQcM8CZ4O23ob
	xUrzOz2XqUJnCQWeGMhf3/aXJqnRt5VXFurMaI93Jf/sXf95OZMZF22ZCaaxJqQaXtxshU1Ey8E
	YdhdsvS+H3RElVx7BH/hDUmF5VOD5M6b2MVvaB5opnfA90l8zS/WyikD87En9E0mRVsOW+F0kWQ
	hUnpojmxfQjPTWbPnsTO17FFuHNQRzw==
X-Received: by 2002:a05:6a20:da1a:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c35731bc6emr6411186637.6.1784101378980;
        Wed, 15 Jul 2026 00:42:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:da1a:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c35731bc6emr6411167637.6.1784101378573;
        Wed, 15 Jul 2026 00:42:58 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:58 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:24 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-4-5e07b6d21429@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=3435;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KqYxumK5YGafOBVcgCJcjqQYCmEJidEVjvVUsCwQHtA=;
 b=qaHqhhl0kXendzT0/9Pq0w+J9nYhhy9k0dGcGsyKSsqWl8szEasmledeqGiHqf5WGykVVunhx
 nAbLXcCPH6VDgjwkbfD2rEnRK90K56N1KP9gIkNUUgsdhtjoasSl+Gv
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a573a03 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 9_FBPonw4Qncvd5u8TtvKy91ge0HyI_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX95MgrPLgr4gz
 OsJ2w5Qlkr0/bPhkE9OfGxTWLS0HtP6t28Q1ZXMm/MLXlc7aFGzMRifGWiADdAP/IjWHJu9guIj
 LcX7fA+0KeAGjwG8wG9+vctRYwUk6tpMNrJpELg91HpEL8No0Js4evxbFqaaGJadYWHRv1hDEwt
 oKEznUaElGAmcxBG5yCQDpG4PRw39H3dpL9t90qEtlX8Lt5YCDQmgx/CQpl5uOPNU90Y6eQ/R7J
 wjodE9wPQB+3A+/2i0g2fe2Mx8cfIqQjFcM4yUklKrRJbuKrQXqjEEjvdSNl9lQLwJimhtBC5vz
 TVr81axpLEiqQxm+fkp8FHFRsLvt1k/69B6jAQhy/bVEg74w1mAm0x/LhVxdhu/IeltmpvBvaIm
 gaDFdKhw5Epda3jPoYOeFZNSsWQlbaCuR1rlXnCsCglvAbzxtMfSNRbYLQxl9O+d2PX5XPi3pX4
 aDtMOK757Krnw9YmQWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX7zvCUMmthvQx
 KKJzOh4EpgL41jQt2WRRpdIPn9K8Qol0WC1sBgmyNR5F4852zGDK3rwpFlymVVnTj1RIH1lZn6z
 B7X1zJaue5RYq3YKJ/gaM1KM4FDteKI=
X-Proofpoint-ORIG-GUID: 9_FBPonw4Qncvd5u8TtvKy91ge0HyI_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06E4275B8BD

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..9ab0b44b00be 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -26,9 +27,121 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	thermal-zones {
+		sys-1-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
+
+&pm8150_adc {
+	pinctrl-0 = <&pm8150_adc_gpio2_default>, <&pm8150_adc_gpio3_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@52 {
+		reg = <ADC5_GPIO1_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	pa-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_GPIO4_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-therm@2 {
+		reg = <2>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
 };
 
 &pm8150_gpios {
+	pm8150_adc_gpio2_default: pm8150-adc-gpio2-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm8150_adc_gpio3_default: pm8150-adc-gpio3-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


