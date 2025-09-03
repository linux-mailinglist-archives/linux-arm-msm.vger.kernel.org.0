Return-Path: <linux-arm-msm+bounces-71729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36309B4164A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A601C1BA1933
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CFE2D9EE8;
	Wed,  3 Sep 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1CvYymg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCE42DAFA5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884041; cv=none; b=qoSgVgG5ASifiwcZphTWj3nGmld4GXOcFNm6/0VqjqfumMhGrNlu1x7birsSGzOmqCNeaKNEFKa0TTTJbnfGxUIQSZyZFgC0vvcDlVVT2w5E5v4Kl4TqdOpT6mFtTVNl9S3KGnFNZj/arERzjajhsPLU/X5RFdKCKUM4rvlioZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884041; c=relaxed/simple;
	bh=fFP3LqhWTuVccKncTpXmtlgNDY+GqNHMRYAffl99C/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iy0MYDs181lZjpaaX8YaJgo81/BJqqiqv+JJnE2U0w/1jBJVOUy5k4B3r+Q+RKHFQ1UPjr6eAw7nXhyLaBLVZVy4TqdiaXn/lX0vNWQ3zM2gyKWmRwBJ2hNtIW42NsZ26nqddGtOroWwDa+1BBKzJ4JJrLbAz2CsccUsvsrXPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1CvYymg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832J4gZ023436
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 07:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	783y78yXmBJY5xRlP2M6Gp15FylMnhfNQmsntisnv7g=; b=k1CvYymgnAKcb2Mt
	qjO95wf0KQz6bNKOVJ/pPT6zeeRQ6XWYgfVEHCZ2B7cbyVQL9pmMhusZ1XVDG0JI
	gyO4pYx6rKXwmTSlunTcauykFhNQPOTwNYJQ5OxNJCBSQmz3mKKEPvbDh89HPrh7
	2ZXowxKtmqUfP3EVBTSY+lGOP9jLBuOyyUetOtKYUqvxiIHe8h+LimS6NWA217Rc
	B1C+q0TYkm93BTs++ULYi9B3MLCafMHdFqHFWRWQulPhVWwPWp/M3XK7C7ngleKE
	unsB7WBRWwt4L9sBuepUtWIF+qXnmkxZmZRiSUP+kJ3Y7AtKcpYhETs0Al7fdaZV
	Ac2yjg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpas1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:20:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4d7b23ad44so2969234a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884037; x=1757488837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=783y78yXmBJY5xRlP2M6Gp15FylMnhfNQmsntisnv7g=;
        b=o3tJCCig86Sd5ZfWInisTGMI3wfG/C7nbVpHtbO/3jVEyYAuLr9ri/9wTy+h7bf42N
         91wyGJBe2/duFK5gyRnve3DxXowtKDG4NJA35ueQpyPEts9ypOswr3xKbhgVT0YuSh3s
         LPZq0tOsaIRE+4pL+SjMEXrcPhbVQk1Zg+ZXVbl7ip/ohKHi2AYHzwMqiCRjE6GcLZ5p
         cKzR3grTcoB0/Jg/cThDiVgx7HBfZNgZ3rrgf4bmzGJRuZPy3xNY18EN+Nr3OHF4Crz8
         JvmaFywYUajb3i8/9qf3jmmUdmQCShLaUVaNQXfHudMV6FtQvLwo/mhUNkcSzt/Wz/RS
         VxBA==
X-Gm-Message-State: AOJu0YxCwWlYns77CEiy8szZ6HzG4OyxjfFOURE3QfthICqTiLzo/YCg
	J7neLii+loZ2hNqT9wWoTuiRIWa24h8/1nz8t+7f4QKIVNUnW/SxpdLy3Xf+wLOiKVMHKt9eJvL
	rUHXYc6vaAfuDsRdpoZNw0x3XdmkW2m9dwzX9Z0YtGekku3y7Mn1K6abIjR7ReYAK31M1
X-Gm-Gg: ASbGncvl55Z1OKN6SuwgKM7L19cpp1UWokE65U5aGjNlKhPcxyAOaHJsWEUpGt+fM1O
	5BWuLGfIhNHoyvE8JVVRrntKSfzOIHe38UyfRAjXxBAa7mYPfXpNtBlR9FItdjDRSQVUu27LZvQ
	UBDCZvEpULsypJaIox1DA1LtCOY16e760h+A9FzIr72s5haLUgU+tBmA1r8URkq7TGvt+4iE2A9
	RMX13PUsO/RbetUnV2XY4ecoxoeieZtDMrYWj7PBVqFuh9WlCCyXFtNaClbUYKyhFbMp2lOfnql
	Pm7cPUaxRai8T/IeBnKylRp7At85CStu6L/Sp0d0YgNVK5cMKHvVNg5dinldO765
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id adf61e73a8af0-246d449839amr2736689637.22.1756884037362;
        Wed, 03 Sep 2025 00:20:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0ffvTpbw9jwjShL+IZyl85/Z8YDW9Xu3u0FzQcQbXXtMwKarzlqKyNTe2+dQNLNFvdlmQaQ==
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id adf61e73a8af0-246d449839amr2736633637.22.1756884036835;
        Wed, 03 Sep 2025 00:20:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:20:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:55 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-a623-gpu-support-v5-4-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=2002;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UGkqh+jUsBw9mlPVt984D/vluR2NHRDxt6PvxoK841A=;
 b=NDEzUe2YZLbW04zC7rx7sOBjGheYbp3vZkta1FEKZ4HGbqBSid2Hgn6oXufkMZhSIhcl0n6wu
 IcawBTpY5wAANJYwEG1Iqja1oZ25m7RDZbr3a7ucqz1yPUkHx7KBJg0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: n8-XOj30KoyJtRHoMges-qIYaNf4ZDBo
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b7ec46 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=deFBR-s-QiaC76FCe2MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n8-XOj30KoyJtRHoMges-qIYaNf4ZDBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX3925N+I1YVlk
 1muxgtKfgB7w/DH9AFKPG2y1DhQiO62DwaHgMvfK0I3yrTuKEfvHVX8fdCPkA8DTWfAQQ04Sowc
 teZN3Li2j1uUxAsAU67C55cfuxAedrpN7EOwW/rVClBynZwYJTz232aWaznUGJKxM0/srU5OCCT
 8PKHxXXPUmd9zYSkwfzbxhw136EQYC9l5t/RuNLJd1ub/8YafiidZMFsrgo6NpsoSpg/JWIfQto
 rRxecncqPU2FxIMqdo7ac+QLSOBNtXZ1PulxwtYC+Wtw/5eV+1GcpN1nzRwN20oKXbXzNq9fpCX
 5mboz9EC/i1GwseYL3+yaWbTqKpFlEENYmg6Yostnd56J/odNXUknjwNKzxTnL9/vcvk1x5JFWn
 d6HLoanj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Gaurav Kohli <quic_gkohli@quicinc.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 00e6131e6b24def4ff9566c14398aaa86efe557c..57b8bd6a089ce8b9a1a63be3fa778a633b4025a6 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -5846,12 +5847,25 @@ gpuss-0-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
+				gpuss0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss0-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		audio-thermal {
@@ -5966,12 +5980,25 @@ gpuss-1-thermal {
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
+				gpuss1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss1-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {

-- 
2.50.1


