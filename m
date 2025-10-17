Return-Path: <linux-arm-msm+bounces-77676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61075BE65A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D79D420D4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A793719D065;
	Fri, 17 Oct 2025 05:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjOnHFId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F23FCC
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677385; cv=none; b=PbB0N/cqwrbIxzkRtN0gPxvP9fkDFFwnv5omssYwJqM78RHxFzxfHp3M49NqEMo56kbl0K5X9/m4xfOik0fR+0goQIfpgxYyoqki7d8ZA4tIfs6kD26iKjB2/Nes/0lS0NtRovNl4eEToDhlkFfkr5CPX/obNhdP4i06Tu6rokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677385; c=relaxed/simple;
	bh=fQ+8SkOvlcoyl3hn94wEpoeG3i9B3kxg+mTOn4oSv6k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GRpybAWrD1IZq0JicRUJ/9JgDTTRsjXXZCBo0gmsMh7kyHvF2Ggx9ZJoPshpv1/ExUP7xWkhu0/oJ/57d9kZ9vWHVYuy3vEPsPN88G0ot6317542jlPuNn73j5DrrOakWy2qVa+9OMyPBWpeMep6n3LqyxTnXqCrXTDO30lVf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjOnHFId; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLO32001728
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fUiCoy4q0GKnexrafIN6QKMtaP84SBwz3xh
	i+xbnZ+U=; b=kjOnHFIdfbib5/2VqTP7F6Q5RK48uSpeFF4zY8x8rub8AgWhh8L
	3IhAvMUlEytxitZDnWBe/96zrwUjDv7Xu7S6fs8ksACxcuDjJo1bsV8yVDEI0t0F
	iEZL2q7Y4PJBWzkyPx5JhMw5kvN6so8t43ma0+51utjsE4Wz0UpBTsmKw53DqSfk
	LrRGnXeFV9LMFcjk4Wapk4RftC4Sg+1uGL4yr4RvCFULCgifWLNOpnea7Wrqgwv2
	1ic05jbc05NMZbIXF/3BFAhMHpnJd07uolKu9vbYE9KsVanGSZOU0ILXf//J1I/E
	0YjeIsVbA0MyeQlnR2ly8rswvcMYz/8azwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9aykh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:03:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2909a67aed4so15829685ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677382; x=1761282182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUiCoy4q0GKnexrafIN6QKMtaP84SBwz3xhi+xbnZ+U=;
        b=GKTRhdq3xttC2kyfPt07zW0xq/8GXhqyVIA9LgwLt2oGOEUraTWg4bwqB16kgpv/CR
         ZxwQ8YgNKFDh7csufBQ9Yj+YBhs4qYE3LTgmBGQHMow+QBdCvuIwsCAgw01WVH6Ft/oD
         7Ekqdp0V97qYd7SBZjg8calIBtmmCm2l6uvk4kOUOYXf8pfSuPlvDdbdCvSFPfJN/R/v
         2K6EFbfLEiPp019OfD/eZCljCdq8TDMZRREeNUdlxHDjZ6iPWqgyZdJobeyW2qXg2iu5
         AcILagRi+a5pzsSMnv5b0N1YpjWYXJtx0WjsVsc0Tfq3BB9RZcblf9XHQ4os1+AYPNf7
         lxiw==
X-Gm-Message-State: AOJu0Ywh+JYgfw/YtFdzFyu4BpIbAj3omwsyudkC0b+wE3Yi6CtpnFNl
	Co0uKL1MON6i+yhI2QYfVQYNh6AAczsByKBGZamCAbAAUWZyF7N+3jzJg/7osOtLovuG1Xcl8HX
	F4hrASodozVuqSloZbT1ijq54pHj08lQgrwcV97r1gWbd7X4YHDE0xbEehpGSyzZXvvm4
X-Gm-Gg: ASbGncvxU2nIYxfKhrwRS7Fy9VAM6qSQvX4jS9Hdbop8+1FUdeLBW1YDZLSvP9RUST8
	YiK5foBnStwTp8bEzh7CooD0DE9MdClyuWxdw/q0SX9GxgAwQXrSjsTuSep9JHWwS5rYKOGxwIz
	5SmAW9+h30sPGI4nY7gSS690hTpIkn72EWlYzNB2YugTADO4Q4X5UU+PAA91/HFQqmS/v21JHsh
	sl8QoEF/FdB+QhtxA7hOZj1Mm05u6VffU1NmADCYGDKGvwGhK/aT+DYYxqbKaaY9GYncsnnncig
	uqkFj8TdncajOCIUL2CMD20cBtqNZlNzrPYYmIRscRqgCHj2T8bNYKzvMEJvXraqPL2E6zhNw6k
	Z8kRiWlSJQ6UFYfIg7i8Z+44qbh2T
X-Received: by 2002:a17:902:ce07:b0:24b:270e:56d4 with SMTP id d9443c01a7336-290c66da794mr34740485ad.4.1760677382189;
        Thu, 16 Oct 2025 22:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFETcirbfNHKtKmLD4YuAozg7cIfcNgDOVz+Tr5CELIua6KxwYN18BR8lnJRJggZ0jymK5Kiw==
X-Received: by 2002:a17:902:ce07:b0:24b:270e:56d4 with SMTP id d9443c01a7336-290c66da794mr34740055ad.4.1760677381719;
        Thu, 16 Oct 2025 22:03:01 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afde9dsm49089585ad.116.2025.10.16.22.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:03:01 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: lemans-evk: Enable AMC6821 fan controller
Date: Fri, 17 Oct 2025 10:32:56 +0530
Message-Id: <20251017050256.987660-1-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ik6jMVVB0o4T3yl4SUs2ArLXAKkKDvsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/5VhYf7bWlUI
 Ik/Gt34z7hTudDv4aS+gRlVdaGUhm7eiOUU0afjp3AbYn8q9idqlnfH/Me90aWkUZpHCHBTnaFv
 1lmjuwL+J0/OL+TLI2Fu++oWcSEvqUiMvoT/C3yOr9I3hIltj4Lems5YOn483et6EF43zRdy+Lr
 2GZzkRCTlVyaPJp84Gl2aukACp/kREXMmu8rM7gD2CX0nt/m2ahZTbks82mZXNBKyOY9Ba0G/Bg
 4/Gh1GYCQFizOd3CXy/3BQwW35qW96BOIiVagLnhghRez2uoait8SN+VgAqpMpN856uC36tgLeY
 nLeQ3EBv/eBf45a961f++xyhPo4JCXN7V9iFPgGzCiDwYRGMUd/AU+i6SzPW8jmus4hqbRbkDZ3
 kVTDiNWu5TeyrxXZ0bBoYsk9iPhHzg==
X-Proofpoint-GUID: ik6jMVVB0o4T3yl4SUs2ArLXAKkKDvsN
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f1ce07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=7r9TfH97x59IMh4ffdIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Enable AMC6821 fan controller for lemans-evk platform and
configure pwm polarity as inverted.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f4457..9bc3e6d4c9af 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -501,6 +502,20 @@ mac_addr0: mac-addr@0 {
 	};
 };
 
+&i2c19 {
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+};
+
 &iris {
 	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
 
@@ -587,6 +602,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&qup_i2c19_default {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.34.1


