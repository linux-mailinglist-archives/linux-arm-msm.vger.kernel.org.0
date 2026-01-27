Return-Path: <linux-arm-msm+bounces-90831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC9QElnieGkztwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:05:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0E975FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D5073116C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F3936166D;
	Tue, 27 Jan 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7QtjTqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqH3vOlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F436075A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529504; cv=none; b=t6xQkmNMF55jFKKEoTXy6g+ycT51aBEmmGaUbwo+j1Nt6lpb4hvSeiRdH184M9wVR6GnfgA282ZVZ0WsYj+FyMpUoQvxoe5zCdNsJ/yXOsp3Vpci83wb7oXdZR5Ct6kd/H3OBroJ/XlYdFBwlWVpTZQ3r9G0O9cBEjbYQxxSOsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529504; c=relaxed/simple;
	bh=F/WRCepjFcpZUUlC6qKcNtIckwG89xuifemDPktE66M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQXJRyFsUy0Tfx0BHLIbq8Cj/uRv5yFuzusNQLseMWG0sOv33pk4owZYCKu6D8i9/aFyDdtg7bxbCn4G6nYXa16uLgiJlckiEzNFsyLaevAjhapUE6aKqBUSHQMvHw7m0uGQHtrJJD54jsSJ9e7PvmjSBFbPsL547ocvy9vyHpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7QtjTqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqH3vOlb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAKb9r700199
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXzCklFu+psMk/IKlNTq5oAZ736zPPobE3f7vWSqzaU=; b=H7QtjTqXAuw4k9a4
	occA8r8M3E+Detbe8qIyRppt19qKFtMzZ0M/jgg7SFUYmUppEdtv/iWZzL6ArC2y
	m7VTpWEHYmoqalkwunzqygE7IXaZASNdWVB1eO/Vh0Q7g5IEQwsFTvpzNdHnA+Eg
	4lhbsn5PysOrUyZUP4rGoMVmh2kNNCYX6PYfv8IN4SjeMGfBNVeLDd/4kTnKyrKj
	7iG4DEynQb5evfIYFPAWKCFPliexrQpLWww6+9E4wNhhaZmdCG/T9SZYBQig5NGu
	1AEOMQCEOoUwBcgXUz4iNMYVjWpm+v32CpJzeZtq4N0cV4VdTccDk25x75H0HrAh
	FUlSvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3uevk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f79d6afso59647435ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769529501; x=1770134301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXzCklFu+psMk/IKlNTq5oAZ736zPPobE3f7vWSqzaU=;
        b=kqH3vOlbRpnfhwXkKleZ+mquHbR/O8ceIvnyCg+4VLRUVcFlZ5m1wSMsIyaKnlj2yM
         vhB3ec59dIn2939I6PiJh0D5AovN+HFSaDUz4ZUezAbXdelv/7CNaGfpH0hNVjVcsH8w
         6U2kPSstG/gEcL6w3D5ITJyqXOnGowfD0xb0Y/6M5f/oVnfOJKV8tdeA8IejOj7/6NxT
         Hw4RoNMZQcp3FsPEUq3HyqXbywpkW1nsm9ZtET4gmyI/fLW4o1/Jj78w7h4TktcAtxOH
         G3ttdtVhBWkW/WzsSX6y7cNabNQJN+RzzYgNtaBmyXXZVtXowmfBhNVfALiEWh1u0e2Z
         7LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529501; x=1770134301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXzCklFu+psMk/IKlNTq5oAZ736zPPobE3f7vWSqzaU=;
        b=e0iRQzr0Qzbs+SycLQSRoiVmFlRDjnIIKGuRoQArVwg33kD1Nc+1xbvKX9E8e1qE6X
         NOx6e5f2oitnKkonyayJMADkqM8sVXhsXYnYz4g1QqH+WuwB2kjOdmNcYIseSGH83zEA
         jTJDYVFXoqXBiffvMAybepGCzytFp4CuRWXRiW/+V0WjqUvG62JiqvkDZjeyJDXcB6s4
         Ab6mJNpZ1ff9nHXnC4wJay897lFqH8jUTUmxjyXZdL+2K351AlNaGH7GmY7sFblhUq7w
         ghpcRFecbER+03N8VXsBu9Wb4LGOf2Rq9ABA/x0gDThy17+pBlszrXnaeQAUioDTDUSA
         Ukrw==
X-Gm-Message-State: AOJu0YxuJGSV8lisrswDkI2m4A09PrtqCi2YTXxOl3G83QsY6n3xQ/Mc
	BcMY0ZgKNECrQFrxpsKm4dUZIulIfoV3f62m5RdfmyecSgOpxd8XTYHprRWHJqC5H3Hvy5ztbSk
	lA2ab0fnYxm1Au2hib/4L/DBJCspUVlqwliNyaUttT4fILkq+/kfqUCimT+5enZfF+kxV
X-Gm-Gg: AZuq6aLtFkkPX3PgHB/qOpEaoM4m5L0E4SQSyMbO6x5mmsgmYYz0joOI6VauSJ6iDuN
	4IFgH3l0MWhM+Aqjg6p0QuO3gfZEK7zITYYRrxWMlaDA6FE77FhSr3bbmpqr1V1J1366elVtTgZ
	brHj62+OKEauy89Uk5N+S06oBtL7nxlt2zZ1/aGSimoW2PrRyKn0JSVEEA/rN38Jue1UZ+HAguq
	E28is93cGogFlVWeH+loPKcWc7O0Cnjn6Gyh+GgKyASgghM//jnGxqoG8f6m+0p8CIxsZImMT9V
	Vt2G70ZcTPcbBFubzVF+bNNblE9BC1GdPyd/oJtq0OcUKGSwR/iTD2TeWDioH6GqI1heYGhVD+E
	gIh0ZVPAah4k//ldlx2P22Ecvg6WOuwpJZWz7TWE=
X-Received: by 2002:a17:902:ec87:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a870d79392mr22357185ad.24.1769529500366;
        Tue, 27 Jan 2026 07:58:20 -0800 (PST)
X-Received: by 2002:a17:902:ec87:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a870d79392mr22356865ad.24.1769529499779;
        Tue, 27 Jan 2026 07:58:19 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802ede745sm120577465ad.44.2026.01.27.07.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:58:19 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 8/8] arm64: dts: qcom: monaco: Enable CDSP cooling
Date: Tue, 27 Jan 2026 21:27:22 +0530
Message-Id: <20260127155722.2797783-9-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wFivA5qUu68RTBM0FADFGsVHmA5TQ4TX
X-Proofpoint-GUID: wFivA5qUu68RTBM0FADFGsVHmA5TQ4TX
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978e09d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=L7ffWoggXZAuNz6kUr0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMCBTYWx0ZWRfX9uwqEI3E0108
 kuXkohzAcE/NBn0pegZ/1fOdnVYlmk5iBVADDYgucM4+U2777VKModHQgvr+MWvhUAmyjJGJw8v
 nuVKEwS9O2xAp1BQR5fdM1PrkYBRZMLJ/ODlWrcBENaWu9VUevZ6yf7pySBozMVpjuI0AYHMSSt
 58Wk1rvmd7QVfdV3pVyzjH1ysr5gm9gujPTKm0SktEHDDi6n/Hke0UFFDIkbk+OFMtVlA575k9M
 p82/4vgaee5pbX9HxvrSo1vJYSa3cjHP5hoDrdDqdA9Ig/jpi61nCx/2nPcx/NsELmL/3b4p43o
 9Z0w7FJec+d+2ReatNvuk8S3pXOekKkHvdODcTeoThTYy/HhlkQHxQCTwZ9C9k37ByEP7Lgp1du
 dc0/4Eq8DTzxk/8KWit7yiAXxs1edku4gvAcjCwz+2l1AQgA6qvLETRjIdY3YVajjPspXjiW38A
 iWVqR+RFnJ3T2jlsROQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90831-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AB0E975FE
X-Rspamd-Action: no action

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling by throttling the cdsp when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 93 ++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..6d7a269cd98e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7194,6 +7194,15 @@ compute-cb@4 {
 					};
 				};
 			};
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+
+				cdsp_tmd0: cdsp-tmd0 {
+					label = "cdsp_sw";
+					#cooling-cells = <2>;
+				};
+			};
 		};
 	};
 
@@ -7528,36 +7537,78 @@ nsp-0-0-0-thermal {
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -7648,36 +7699,78 @@ nsp-0-0-1-thermal {
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {
-- 
2.34.1


