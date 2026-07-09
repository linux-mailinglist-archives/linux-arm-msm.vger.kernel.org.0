Return-Path: <linux-arm-msm+bounces-117939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ry8rMd5tT2pNggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3972F1A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:46:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AMFEpaCA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Gzyb7clA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117939-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117939-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A018B306621B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223893C2782;
	Thu,  9 Jul 2026 09:44:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8273AFB14
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:44:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590288; cv=none; b=eyjwJifXpik4JxxR1lKS8jQIgN5e43cQKoEhcDP+3RGQCcqdN6OtLXV1+P9RgJi/X9S20vI9K5H3PLnixeQPRd457zAP3PtKjcq/1W8J91hloh68lRP+Sm4UHFGNDYz+Z+kcqdVuGTVw+0CoFYNBG5Pxk8pq+DIfN5yEqX3MJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590288; c=relaxed/simple;
	bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AO5yJl4EG3Fywq2hXddeco5HfMf+nEPtvv86zvg41Kr8frx4h7kMXY4QOBVUUY2/EEdx8qbZ4O3BP1okQnMj5phn4eZIauYQxR8Hq9Xym2fIb2l18/0eQLJOV7TcrxTg41niWgDsEHraBcWlrlQpT0RSCzyBZjr02eVwDNnEico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMFEpaCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gzyb7clA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960FFL749619
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=; b=AMFEpaCAHh++yUUf
	reRRZ2kGg2FLu0GjC3zzGBXKoxRT5zTuGlNFSNxvhqLNNYy3pa9g17KHRThE/jXV
	U1Zgy6ygAIe8Exi1eGsZsdzV6jLmqP3r1OY7Uiw90Ko/PQQYtC903sQdcg6lO5Nc
	WTAZS9I4PLiofOisw+xEwH0fvdTUhDWb1v5e7UK3wty4m26yyMrXQ7u87aeWBfU6
	DZE7rJ3CDc0j2FHWvz8N4tDPs/u6Hn7DplfY1sCj6622OYR/o9gaSwx/9VzEj2Z/
	TIBH2+/jqQori9bhOvbI1OywgCfRW2K9zpkfDFQAxQx/TOOSVVccjlfeOc1cRvKK
	tHm34Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwftfqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:44:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so1380807a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590284; x=1784195084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=Gzyb7clAGWZLSIyaN7TDRaWCOGHCVTERPleZ0gpYlPuVA6Su7iPpE3MfEXTc7q0pPy
         yRMXUmmedy3bH/bQ+jU3CKEuL9h4AtqSU7WbUz04gyLd6MHWeoRseiacx/z8nTiRN5OJ
         EV+EzIfsXOc+F8nprCSSnKe6WeWkO7S9d4F8bSbSQceRLRo0/+bCfv4honqA0KWVUbig
         K2spfMyNLWCvoFBAHjtlQwk2JeKhgh8UDo1RILtlXGg6QobPc2IDSWk4VNEXM8QU7qhc
         QViuSsNRoUpzlJXTjt1gzMugGBcRD8+QpXX/NaWzvUUGviZHY8k3ad85QThWDCrceU5O
         VVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590284; x=1784195084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojbU85U1GoN1gyrRvs6pqpnlSRI0JRvbIqx1Yv3QQ1g=;
        b=dEBosQZg7fbh4DS5CE53mwZcRZrgVdwLpqdqA4k7I5dhas+nZKeSpMaWC8cR8f9THo
         fTsm4ZHzXa6wESLveVjtac6eJG38U+D4WuBO/sCOLaX97aE1A6MS8zFseIn9WRHWYEPm
         QR7U1x3I7H6nqGpYk3B8RLhTbeIJb/Dsnhxr6ar9Bd2UOlVO5kff6n4yU8oSngcHcmq4
         dn9RH3xXRtI67uwv7Md+Gq6Xdtd5DbXgCPYewDfGAroBvOowrQUr3WG7hOC5UPQvj4bb
         pykmJq01yv0R7m7idEmLX3MosYqBs9QDuYeh+v+HR7PapWiuo+kh1297OWV4FvLda9JR
         Nkkw==
X-Gm-Message-State: AOJu0Yzeks+CFYqeTtSGNlVQVR1XDWOAFrTEliixKQg48Egufy+tqxS/
	WSTEWcic6mlyJp6nzwo6CLIYJA/Yy3o31Z53s18cD+qVhV9/fMPEGgGohf26Ctqnx93ObUJS0BM
	xhoxCcQBu8nyp1RGiXHofhF1I5ehxqzUk3kHelBnltm3VNNMnIIxSTIa6cCAGCe3t5lbj
X-Gm-Gg: AfdE7cnz1ccsCEJ0Q3UzqKvpOO++0M1zUgNwNAREdY156Y+xK/w1bmFE+VWSLelRya8
	fS8yAsWk+2BW0vAMR0D4WLi8tp0PZ/6EBigjtEEF/Ka3x53QpF8etXY2nHcdJFEOA30wmX5Rh1R
	ZebLWaEgruKxgkVvzAit7MrzMk5IW12pdxFcWitbxYGs5Ld4f0voO7qZZCUVTY8x5VUAmO6iJXQ
	CycQHQIbVZLQmZz+l6iJVmmT9fP5FvUD8ts3TzCu+0Qm49iCLew4upYKHMj84hzbUgPYAdajhtD
	3Qgh+Eh4ykVfJSf71Moc4+AGT3wX/NLPb8JrIvpOYGs6zyXEqqlgVHHb0Wsm+6na4bXjqxUt5/6
	XtHyn4JTnoKFlsI2qhhGg4vMsxcDylQ==
X-Received: by 2002:a05:6a20:5483:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c0bce1c053mr8808035637.6.1783590284432;
        Thu, 09 Jul 2026 02:44:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:5483:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c0bce1c053mr8808008637.6.1783590284007;
        Thu, 09 Jul 2026 02:44:44 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm3493075a12.14.2026.07.09.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:44:43 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 15:14:05 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-shikra_adc_support-v2-4-8dda38f7bf3d@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783590264; l=3374;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=bp5L5N4e5uX9KDVnsGLbH09fAwvEF/nOE8lPJ6RWh2Q=;
 b=QVtnk2j5CEKjTHIOr5npu+92k0IlICiO5rQGOuwKPH0SdIcB/QUysWo0lx5DpKXxMr7y+egYU
 mRDzyWFvWkyDIdvEKL5NSo7wfaa52LAiCbcY8Tm7ChHfNthF9o2gIEq
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfXxWOMGiitveKy
 2hbwv/rv4XxZq5px8ULcckniukUB5YJHmw/vE8URefVWxAjykUdtkagWQpsitKPFOXasWNqKw81
 C4yT+ZDHcN3S9uOw+GPvTEuSF2iLyV7Z6dkEEq/DJQ6q7D/DLp+jaGsPEy2MZCjMUkjiYGN9J/P
 TlTjhxJAo5peJCGquhh0fIecalEGeiZGIE/N3bGTg+9vgjcupiEZ9QlSI4BbjhQynjOZXiOeOIC
 r8/CJBVsbsFBudzPR07VMDLU0pyISt1Hjoqs4e6YBkQ4kVA3KVL456fodz7mzCO8mCdXpUTGHnR
 jVzzTqQYKu9fkMbs57Xsuuj6xM3/tkdShIKZTRJLjowcoeIYqXUHQgu9i5RXYaJ7268+kMi/8I/
 Z3mR9m5d6X1je6uAzMqG4qviU2AalsGh0bSeabZK1KZzJCqUxbc/rZevVVZ7jlZ2/Tz/3ftscAj
 JY3c+ALAqprgXMHHqvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MyBTYWx0ZWRfX0IvaKFJ3zDE9
 zxIZWNdybkjUrCSvXoACLO3UPZgkArsHuZ91L61M5i5ITiAHoCa8FyhQOhq+l0n8uYvdqNns4Nh
 E6TaVcVD9NIaTq/13iZyd4WmfYrANd8=
X-Proofpoint-ORIG-GUID: 02zupEOyuyFeJp_0wFm2r4lLZsNQoA2R
X-Proofpoint-GUID: 02zupEOyuyFeJp_0wFm2r4lLZsNQoA2R
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f6d8d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eSwfGQiZR0SxMorl76cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117939-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45C3972F1A5

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
for them.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
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


