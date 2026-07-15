Return-Path: <linux-arm-msm+bounces-119175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id arhYDEo7V2oxHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:48:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197F75B96A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:48:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WSJqvioI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AGIO7mts;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119175-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119175-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89B6B3178CB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974563C4168;
	Wed, 15 Jul 2026 07:42:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C63C3C01
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101377; cv=none; b=F2zRAHft7P4LqYbwtQzckCS71RcvMKVC0PU6mxC9Dnk/Hr6sS2F8TRyI600eHKaFu88WzCoioyCD+wHt8u4LWKm1j8TJITCX4ourGWlrsYuxT4rlIE4zegnXAzXBoYSMyUX5Ie3aqkak46usADeVb20kEPzBit3CoZ6rrUINbS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101377; c=relaxed/simple;
	bh=01X4Vu3JsAxMAkM2zUPyBygNqVIzvXT+LhZN27hO47A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q30rjo+L211HVGI2sNuPRiqvWr40S3ueRCoO4/+lDFYjjG0n2tLSqw9uR3E88YmEQuNbv92O9yj2nQ8yWMvpG70FJeSpxG/9q9YPtxs11oCEuOZ8zrDMxKIQ0E/ulDn5NIZ+TXotCml71GiooNRcaddGIycj5Avs9azjJTnZRh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSJqvioI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGIO7mts; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l5r42679725
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd3OE8Pl/PRa/Zoo/BTqxuHeBlpTW6qB0mLEAk4Af4U=; b=WSJqvioIXxIpCnkr
	5Jtz5o7Yb2G0qXc+6N/AnSv4XKI6uE2SecKk2Fc+hnhtaVORs54EjR0TlULACb9n
	0uRjHndTd7wZPW/FNowqT6vDEH6vpzz06jn8LZQq3UFPLuE+tfb54JYwLNii2vfX
	Z6Bjz26RNdBmQaFjhQY5lD1zY48gVcg2KFlfkMLEZawgPlauqHSCUMw5mlIQrH2d
	HamN4qbj2t3XDWSWmBfvbJjLbEzx2JejAk0gtg0f1lxhArq5yYLbb1FWeBbuLRaz
	IcX4conRxQ1i+SzmcB57oMFPCu9qiEfjdF1YJvbxDRLff5SJLuTi2XHILEjZAKl4
	Qoj6mg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuum3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:42:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso4992886a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101375; x=1784706175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd3OE8Pl/PRa/Zoo/BTqxuHeBlpTW6qB0mLEAk4Af4U=;
        b=AGIO7mts1WHJPKJfFC1Ry2r+GIpwJE2TNnFWMbp88jYS7n2rTnVQJm19EWBKmAojc6
         rBwes8DXNyaTGgObZg88IDzooe0xGCmVaX7Gdvy1wTRaWIacXjuh1Lqdbk6uImx2ElEg
         4aem41N6Dp1qE2PMEQRkr/mMMCNNsAHcRp7qgSPLNfNyCW4LCzCtrHayf3JO9uI7R3oe
         TGd95s0yIB+MsBgYY3g1c10tOJzOHJQfJ+IUEwb/RVQGKWUHLnbo37FH/BmvIDJEKaek
         er89X6j1P57vv49x00UO4I/MIeGAGZLoqe/454LHw2QTMQqBKVteqjBKFhRbNpvT4Ve/
         eFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101375; x=1784706175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pd3OE8Pl/PRa/Zoo/BTqxuHeBlpTW6qB0mLEAk4Af4U=;
        b=KEykmPX7aEUediNyGccdIZ+ERa4WgDPdOVZlhSrQKcwsibJxPxYjyR/ZgomVwMkmWv
         u7qtLwf6lJ7mWRkg0DMbM5xY4nYsTtM0BUQ232PxkG+ZRGHjYJwJoQAeokaIq3mxkyCq
         fFAZSvnEM2QdIfzm8xCm3YMkcprYUKv82FNYRIeQ/bLSNX661UJRieHDZy8pad8Y3a4T
         ocsLI629W1CFzQD98QRPHaliht4lPj4gQcUxbV+dlup10H1HGxZ/PY/XPI697uic6vjG
         1W5M6XcT9NrfCKd/tMANWFopD0iKCJWt8PTifm7LBppsYbU1lEWXHzA/r40iTdsFcYgK
         Aljw==
X-Gm-Message-State: AOJu0Yy8/u8rGDD0x3pg7s7Da/OfXVDQpH6Nhoe0NRxpYPU5i3Yl1D8X
	4p/q2Qi8xIn9O71zMQZaPK5jTVd+Y/C8sydxnIt/+SXZJIeLcqRwPExVekwiXm9z91cDubP+v18
	O6E37Q5onSck0rItmOoO+YcvqXICePM2vRWab+E++hKt4w/byEvf+O5MgiwufXl1HKxu+
X-Gm-Gg: AfdE7cnWp8YScBI4CdfRYs3tJJDcrchgMcwK2W41PdAbPjViAEPKYo8BMRLnL7WoWT/
	kvZZmtTzR6qBFCOWwiwNmkJ9FMECujcmA6Db3HkgyN45sMf5GHyTiIAX0QqWHMTEWzNHDiJGpB9
	0qX46w1KLC9g79qyxRYpTHW7QnOxqEeL1PWZCFJUDEtJxLUJqa0g/Zt0knWgdwyVt1+EzcDlBhZ
	XSGCtVFiXTB2S9VAEvyG72Y4/Znx8Ga77kWQiY/JN2rCFppzjgub+WeZUw5XWzfKyT8uj6m93pn
	IeHm6uJXHdFn6xTkQyVFeF9Y/8hI9Dr435ryCG9gB9rNdfqJ2VuoUnEX9QZiP2vKyBQ/Gomlkjk
	ajYdHdokqlg0Tqxn9UTuOmCb39oniSg==
X-Received: by 2002:a05:6a21:6817:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c36c0f869amr1986803637.9.1784101374827;
        Wed, 15 Jul 2026 00:42:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:6817:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c36c0f869amr1986781637.9.1784101374380;
        Wed, 15 Jul 2026 00:42:54 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:54 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:23 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-3-5e07b6d21429@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=3847;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=01X4Vu3JsAxMAkM2zUPyBygNqVIzvXT+LhZN27hO47A=;
 b=GPulIx2QfScKK0dGTY0iQPEbHlawYEDcnSenyEBVRu+fKk03yY2FGj5wEANQnxTZSLUO48/hy
 DdBMb2tvdawCrDKJSTqWIHyeqdH/KGXtCujH0RQaDfFUxyKWCwDYdEL
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: MeTQMd0UwTrAUsOTN0btHd-nAyYj9RYV
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a5739ff cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfXxLPyzjdQ7JZG
 q6ZcABmvoipgNiVzp2TonAQo5I9sq/vy52VXqjjAmNjwwhmpFEGLVZIq32OjDHKrjMRU14d8AbU
 RVeLdtbCYqLcsXi4jD91UGz1Fsnanu5yiLUvOO55cD4OJVpvcUdkBAtG5H9mGEmS0CmpTdwtHvh
 n+OxZLiHg5FGBsMeBFyet4PcnIBshU2dixGGm5sM0bVeLZytB9rW05bXUBKMzfgezSVYETpIBE0
 lBFrAUJOCKQtxPAB3/YDkhUNIfffhBPVCy2Y1NEhtW8GQHLgcG7lNhchQMRb8Kwzj5YBVAptOEb
 dQDzZX8dh2eci3jwYdFRvO1rzVdfyeV1kkPsqpZqHFbT/jPA4MzuJuZfBJKjl7i5+xEB/fuktsn
 DPVlV/cHDl+sU/yei+PRJiVLfyeJGA0rI+8iNUG2DodwCkwvdt7kD8EJYplBt5BG9xgLDT1N70f
 y1+ciAhWFBx7f7sTJxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX1xoot6cIcF/I
 PNS+bTEHIUdVzibiPr7hsPsi6iNUVqj44Z4x3BX6N4TRLl9llCojWotU1LIIc+CoQ2LG5PnzwtV
 EeMO5RgOg0sEM4hZZpSdkRNaWdTf3bA=
X-Proofpoint-GUID: MeTQMd0UwTrAUsOTN0btHd-nAyYj9RYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119175-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9197F75B96A

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..139d0ad0b1ab 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,128 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pa_therm_bridge: pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&pa_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
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
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


