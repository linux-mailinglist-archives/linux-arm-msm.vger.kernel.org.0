Return-Path: <linux-arm-msm+bounces-86344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C69CD94B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAA11307E4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1770332EA3;
	Tue, 23 Dec 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRYJy6Qp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOmGe4DO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A113385B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493253; cv=none; b=iWPQ4qnOvf6rSM2jFg4Tr1agFNt4p9iIy0LOwBr1WabmNfAujYlEhKPUJUnZ07UFcCrIwB5TPZobIOuLb1kptwvdKitq8hR8rsye19xwcBnRXBbrminB9Kus0iZ6bZhAHMLNIky2o4QXziPBcj19DItRIoD/tRaVWVylmwKHaBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493253; c=relaxed/simple;
	bh=VJnabV5NE9B8s8GjpntpzXqF/MDpr7dnVToPXUTxIm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9ThFAzEQ8VUO56XRD0duw2Dq65aotRe6J9df4cIWQnw8iT0gJBhO4SwB/sBdgpsHwgVMkFeWH9QjHKpavPVP6WxDBEk4m917HHaUi9Oag8rUYeQEmVtoAHaNr+CnftfA/X5HFF3QyPvrQ2+yCys1VljlUpv9dUVP6rTAuZkgPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRYJy6Qp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOmGe4DO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9wLp92040956
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6gWjZeGNdHf
	8e38PN2KZAbnK77L2YjO8Vi7vnEfr27Y=; b=jRYJy6QpeVZPYde54jClHSIQ3HP
	JKik7S/A+pnwqUqocGFAb9Pt7B2ETdbZrcXsW26s2B3Ixio/LFZMJy0aS8cjhYiW
	kfeeDfWJaf1mGSb3OE1S2IO23I5IdmW5LD+ceLCqLuSoc5QnPXu3ekBtO8tR5/Cr
	bCH75c1G+IDdrGPtxlEq8x3VWnlVb6GKktsBK+g2fSwumE4oWbEBsLfuvfpCgmKf
	xiskNq1QsFJb+mShtQv4akknxp1r31qjrLk1kRHeOnETMrjRsHyKqAmvZSeqJOEX
	xNdr4qJ4x09bsOH3/4zd1ysStuMva8bgeRD+fsnD6pShhihOBV+A9435PZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pks2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso7144029a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493250; x=1767098050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gWjZeGNdHf8e38PN2KZAbnK77L2YjO8Vi7vnEfr27Y=;
        b=XOmGe4DOe0KXot8eNRaQstGFrfOV+9FfRN6uZe/Lq2Bsa1hz1bNwPQ1Pzk0zjtR6yu
         VyjnoaRftCg28be3RPBEIdSN7X+a+AOB7iDqXfd4+XFebcSOKf+BEqm1wxsVHsA44PZt
         JrE/VnO2iTWK09rh/5qZmXpPndyNftrZtzP4LgNx6Fv6iOJhhO8J3Di4BE9sgHQwLDnw
         uzKBXzejfqpvL8jdRT6j21zzZN9ppsERJUQ1IAIO0kwIPkxRaJDebBRE94clJf/rkRyN
         HEVgVj7UVmqQqTsmsOrUwiFPQa68LHQCeb2SM6c2ZIgxwGUD6VW+nYmsA7FKSRMEm0bz
         VN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493250; x=1767098050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gWjZeGNdHf8e38PN2KZAbnK77L2YjO8Vi7vnEfr27Y=;
        b=MpJogSOdMW13zSpUW/lomwbeOwfjgMWjlCnf1G6489KIzXytkVPmj/CdDICQlaMDcv
         NEypbnh99D2f9Wr++jOAxuOLxI4xxPV+UBwhQMUBs9xHNrnEl/cJcaTpbAahDTD/sDLX
         hkUL0f8yyl1tm+E+fasc3CBE6ButTLH7DKycstvGumWDEVoYYgsbipQvAFvLxX/2B8cL
         BjwEuNJzxY19SOZK7+gf2h0tE7OhiL/28KMmChoSgncqkqrxrbmL6y2xJ5q3FIKMaW6R
         IUP9i0239zqdhr+tSqWya1EmVqSeWgroUU+82RpxORTFlL0f9SeQGYV/tl+sK2cqF3Ve
         4RCA==
X-Gm-Message-State: AOJu0YyNVULlUaGUflZ61cfapLoAmce6COM82ZobCJ7sxB4s+ZWV/62b
	cyNLLqXBOxmdahFMLMpzTpvKixxXqnOY+RCNzxQb38BALKZBP4+Qx6BEpc7YsoLjns2gl+1D8CG
	V9B2Lt3KagBg/P8JkPJZ6LXCuSWr0tl48KSQm/2zE9CxECYTvI4iODlazwAJBYmiHQUeB
X-Gm-Gg: AY/fxX7Fqa+VgNqDbHL08IatLhWSLcTfLvO9sXrZS4LdoUGiyxMTQ2KH8PFUAUuiJ9O
	gXYlhmhyFNPat91qXMYKUGt4Si1F4r75osXE1/B15enZWUPMkXIJNcCEnlLox6PgAExRmktz41F
	QV/wM9ty6KXr1XFBoDFdCCODh3Z5njDV/h5ifW8qCywNmixpyjN/CVo5EDHXBeaLiy5XU4ek2s9
	72O+sHzI+zkPpjB7YrF0b94iLo74ebaKI3iYoaABmeKL4FGthsbxKMDHF9nbeaDUumvMgJDPlSW
	NRBlk40OSvKfhuaHj4pD0EZXlulE0FLOA2kIGajvfSqKUAlOeO12QNvaB/nk8uAyC6sCzNqDG6z
	sTlRN2vsJ6xHOwaT1p0REQdGt8a8eU9Kf4CU8wQ8=
X-Received: by 2002:a17:90b:548c:b0:34c:37b8:db34 with SMTP id 98e67ed59e1d1-34e921e959dmr10243471a91.32.1766493250277;
        Tue, 23 Dec 2025 04:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/eEWLBnl2k0jZewfmrXJkfFQsP7K04TJpar3r+2nE2qnKZXVlmbrv8wh0IR6tnAgjj5rSxA==
X-Received: by 2002:a17:90b:548c:b0:34c:37b8:db34 with SMTP id 98e67ed59e1d1-34e921e959dmr10243443a91.32.1766493249767;
        Tue, 23 Dec 2025 04:34:09 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b39dfsm12936044a91.8.2025.12.23.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:34:09 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v1 8/8] arm64: dts: qcom: Enable cdsp qmi tmd devices for monaco
Date: Tue, 23 Dec 2025 18:02:27 +0530
Message-Id: <20251223123227.1317244-9-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX5FUbKaOo0/WF
 gjUR38ApbQUhCKLG7F5EE7Juyx2m1HD7clbzNEriRtcX0gNAew5lJfvy8xJwh62UKxm+ukrzBPF
 3BYLnpICAdGcIj+YkCPKDlqpEe7SM2x8EwxExK8cGB5Dsd73hc4Rwe3AavdeseFovuKFYj3VH5v
 7GALZI0wX7TIw289Y1Uke/hcjBgLi8K754Ao4GnR2xJbRmHR9xB2I/8ZplecOcYWF1c6wClhaJn
 zo79rsRjezu34a1haZ395uOWZE0ys2EPCb6qopsVpR8XTxt6aHT7LIir2hAbp7kcxGI2+M74cZT
 NiLpanHH8B6SVX4EBN+kEcZeI8Oc4m2ND3MVv2bTJmHtCxx3YxDmGbv9lKMG9Z7KDCQ/iq+M3Z0
 Snnnv5ztsVg4g9crxV1A35ISumnT3IFe14l5Ebm4dREORmT1RXAc6qWGi+ZXvRRedz7F4qH1tJt
 PPKi0FkjGjGjjrBEgLg==
X-Proofpoint-ORIG-GUID: FsPCCyrUfKOqtX9FZzDjdUDku_gRTO3e
X-Proofpoint-GUID: FsPCCyrUfKOqtX9FZzDjdUDku_gRTO3e
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a8c43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IQafhW1YQlm6yhshX2cA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230102

Enable cdsp cooling devices and thermal zone cooling map bindings
for cdsp.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 92 ++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 985e37bf4876..1fe148ec5cf7 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -6217,6 +6217,14 @@ compute-cb@4 {
 					};
 				};
 			};
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+					cdsp_sw: cdsp_sw {
+						label = "cdsp_sw";
+						#cooling-cells = <2>;
+					};
+			};
 		};
 
 		tsens2: thermal-sensor@c251000 {
@@ -6569,36 +6577,78 @@ nsp-0-0-0-thermal {
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
+					cooling-device = <&cdsp_sw
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
+					cooling-device = <&cdsp_sw
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
+					cooling-device = <&cdsp_sw
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -6689,36 +6739,78 @@ nsp-0-0-1-thermal {
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
+					cooling-device = <&cdsp_sw
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
+					cooling-device = <&cdsp_sw
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
+					cooling-device = <&cdsp_sw
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {
-- 
2.34.1


