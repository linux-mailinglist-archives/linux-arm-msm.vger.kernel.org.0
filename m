Return-Path: <linux-arm-msm+bounces-84376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D2CA3D68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97D8D30D1FD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE975342158;
	Thu,  4 Dec 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqrXyyGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UE9RO6TP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9658345CD0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854586; cv=none; b=p1SCRhW8Qb9qOXack2GkUzcrlaRKGdCJFNvvXgptk09BkaA+vl9XhGy6jcce+3anT49ZYhTp+rC+lrghEB38Iq0umyV0YSQU8WzRmCl51BflxGITPjYLsiaqjjla5I6Hm2d3RjVzmePUltANwrfjfuR1xDM+Yx/y4hAkr9xmWgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854586; c=relaxed/simple;
	bh=6qfXL/6d5QJsDYPIqney7syG5ciAf6tfNFKjzbNady4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIrCgwn1eDyIEHqkkgge4WlgnC8GXUr1iewy4f8VokejSitlp7zKgjpBE++4eX/ccNFf6h0ZBqFI7G/ToWpdjyuzs1LOVKYDcI6W35Ucj1R2oA2BXGIBYIEoXYaaQ/OtoTEFg3xmAjikmXSwiu8gh6AY5XMEYCExlSNpWeA2lWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqrXyyGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UE9RO6TP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEuPg1159654
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=; b=IqrXyyGqkxwzt4Ju
	N0ZndfMcfseKRzpl1K2/6RCNx6PIvF/J6kxfEahlF+yZUMDBgBPWgClFY54nPxkw
	Nr8QBBztYhsuZ62ETwcXMaM05Hzda7uj3gUAk/X5HHhyB5K2BH6w8p5m9STU5oKk
	bNtXWuuoztKgj/N9P9syemKiTxqoi1RKKb3CKSSiDoK4fY+lvStrJyJ9Rr1IsCoX
	MGBaw8WCwW1d4WSqIdqgT0TuUgcJaCQ6eOA8r+oPemX6IgYeEapz+ExakTBz4tVC
	nepZJIK4cX5f9LwcfGWBPHVECu8D7OhHNHMmihzvRXkuE7qovCpt9kOId9Qpr2fF
	KFyM1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h2vty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so652072a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854583; x=1765459383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=;
        b=UE9RO6TPDteaIkFaWeYwAgtvvemex7KhEeK849BBtaTfqMwnBaUxku6MVaycJsuuuC
         C9Kh/3pOrqIKxDHBF0Vw2+CzLDYJi10up0Cj7Elbj7DA7G7AGAptv/G0Ar3TAbRIHI1q
         ZiJaRCyjItBnUrryYzCGxuR58DKmyrQfCy9E8BNKRySoYC09Y9tPpKoa/wWoOQIkeatN
         4X2LHlUtv2mi1ggAjAGUIIlDcfA0lXVGdBAy0v7iSMUC5gX8HYtoiG98pv+evdo3Ovyg
         zxQ4cdOLvmMHgmFNe15gPEVs1sfW2jg4KrkeQp2MdQRPAtVi3Wf9lKyhRa1C0EmbGsgE
         PvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854583; x=1765459383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=;
        b=rz+KSAKNv6d0ac+z/eYE5HF/9L1jT9YSBZp8naod7RnErrkkO55zMTQbhZWdKzX8Kc
         o7N4h2FQ9OUI6poLZQH1YW8rzelayyu5A+p8vUmcndp6YkOghGJ5wP/kCetRsjdt7JLR
         w6to/iWyQNyX9qndLOT2M1QGkwu9UUpr/zK/5vmUQVw8Z1pMkE2kB6sqCv5mnYARFmnJ
         dP+Exn8RIM+4fsndjyQzfC0eByZYETbG1a7an29VgcNmdg6IE8UQ+eF3NwjkoJGOMKw3
         agAKbdcp0XG/h6BPDZwx6VlWoU7KsNCTwnbFiXVRMBGncy8U4hE7cxwDEaJ1rEocH9tL
         3Plg==
X-Forwarded-Encrypted: i=1; AJvYcCXIuCCro1/xaFrpqPLHMPcYp5Z3aPh8KBc435aaPRa8oUg+hQc2T/pEZNeXXOUiq007sWu58naGyl/koRdg@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEUFISZKzPRIJkgW7lUvsHXSJlxTm8LWqvEQ5YEIFOVOlVq9y
	Fb2oQ950AaGCxLDbDSA2p49tJva+xFkIkMCQ6FbrV5NZVvzGb/o6CaaNXVzxgsHbAA9UvMX12/e
	cg04QeDBv/7hb5qLssdTKK+yaEDBOfUrNjsCPl8QGN/jTLtoP1qnSi1ZzofmK/fSjQDui
X-Gm-Gg: ASbGncsligMgCt0Oh7gCrjI8FroqTxQ9Kh7+xMXbrc56y5xIZ6BGAWiQyapG4USpuGO
	hr8pKwYEpkUwn+po0vmOhMyqkn+gP5xoVfkVBEO5kh4tsC0fg0/hoqVmoU+FCghkuOJk81EOjfS
	6LKwUAcjqaDAicFylvlbn3aSqOHFXAw58lXrYe2YDVALbN9laIC8rNeY6ou2NtRF9AwPRS5fixp
	Q2cDuxEpiQTK1JTL/XHmBetD9u16zHq9vW8oRYOS1DSd5Gbxo/97eqO1Z01GiRBGbLisPqc5f0z
	gg+TkurrQCweTm1MvTcBemEO9KvtbjTj73THbyifb1VPWMXvhb+mXa/S6RxjDuELqtnyKvhPGQD
	OhdfP92ss4k720lHNo/JPaVLaswmATHD5mA==
X-Received: by 2002:a17:90b:4b8e:b0:32e:3592:581a with SMTP id 98e67ed59e1d1-349438bdb29mr3230120a91.17.1764854583358;
        Thu, 04 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn4JZgnbcDINjtOA7+dnAJ8EBm0g3g2oNvPSaAR4vbKS8svkkxZZyc6KCVwyRlizMUdZaVMA==
X-Received: by 2002:a17:90b:4b8e:b0:32e:3592:581a with SMTP id 98e67ed59e1d1-349438bdb29mr3230093a91.17.1764854582867;
        Thu, 04 Dec 2025 05:23:02 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:23:02 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:59 +0530
Subject: [PATCH v4 7/8] arm64: dts: qcom: talos: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1441;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IH4I7WgYz+SJJ76MCxNVByrZLxMvwBXKq41j5sQdwN4=;
 b=d27ZngPAgX4XvtvRb01eTZZlP1aPV4sfV6opmYoqiirXrpN2hXPSTpqcGHopZAK/DSlAOuSWJ
 e3FMup4mnZUDI4x8bpQUOsw5I8blQeGBrzOxvSB3fhjkr2wsSnStFQi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX3HeizZ0Dk6BH
 JXdfNWDkh4y3/T+fywz7Jwx2FVLGKXVP5NzFqStf72xoeK5ohMD3Ulfl9hlmktABRwn8PiRfK+p
 8CigRhUiVQahAPPyjB9jcuLCcW9II2zLYu94NaiR2yVTsTKifdZEylRVB9FHeQ9L+1Req67dJvL
 oAFCf8+CKLtIg2P8oFjQUKlJ+/8+F2Dwv9i/AFDzaarYCBuTgwwRqFlBqNdYBfOE6t5FKl92bfZ
 gsiAqfW/nP6NA1cTlzeXDcMoRR3hI6UqLj0Ueq6RyjhVgPmoQlFkoxfHdiEvwZr5kDf4WuLDBaW
 UMIXHzaPFzMjhMEMw8BTj7UKoq6hfUgbSWQhnsRpj2GJ/af9k6m8n2NZwsqWWXvCWR2Sk+UyNw7
 pGSJB9mhbGqVhP1UQZGa7pAPagMutQ==
X-Proofpoint-GUID: IrsdmPYwxNan5wJyq7TDrBlpU2RzfQGY
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69318b38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: IrsdmPYwxNan5wJyq7TDrBlpU2RzfQGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index effaff88df83d5e6a0aab45a2732a00cae11e83e..7c2866122f9a13b8572fd9e6fa9d336176765000 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0


