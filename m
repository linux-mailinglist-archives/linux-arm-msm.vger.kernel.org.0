Return-Path: <linux-arm-msm+bounces-66375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F3B0FCC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6BEE17DD04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A83F272E45;
	Wed, 23 Jul 2025 22:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/OG39x5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BEC273D9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309681; cv=none; b=M903Sr7jMUCkLxWWRGT0rSC0NaP6Kh/2q8O78DACPOsuLNmPcHYr6oUnkMjH6Uor84e9mkoHtnD1TkG/wcXJZaoP8Ho7KaTtp/5LAyP9glq0Wclgef0HJihefWGgvqby291OSAGLycjnn2Pk45arTQKfMq4Z1zLgFzc0m8yL5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309681; c=relaxed/simple;
	bh=8sJ2i/TalucOlRVRq59ieDmM0h01/bZurJGh4IDevg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnVlcUa5QBndRqoKJkBsuMxwuUMcECBOeKW0AvNWsCp3ET7CYQ1UFrBdmY2WWbiPGNbnLyf2Sa5DgsKcQj5iLzxXnXWva8CSiLY/hR79hZ957aoXg4FEhu62RBJCevESxVQxm7NrXMQowHLsvhhYwsC2SS2f6zDSIhDY1wpHPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/OG39x5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHsEBG011562
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oV7AIIt1QyA
	o8wPjxuzZpCSCbMZcDPvWD/2IfvRI0Z8=; b=n/OG39x5A+gfLLtVc8AWV5IZyD3
	1v8dc5s3z+0JFWF+5nRq2uEyeZ2+l63vSVji6DBEkx+T9hG7/Ftn1qGiy5AmAC2f
	JmnEc6te/1F7V/qixBXEV1Y029XfK1aM730diud/IAZnzQCHtj5e8eu/cs9DBxAn
	+4A7f6tN6hQjagvxmIzzDYBBuz5J9R2SLiYtVSG8/Ycw7RI3h90nAxF5ungLkS35
	xGny8HZxTPxdFYTHcYlBDVKqi9j+2Q5wQd5fV1EYdIcjnOr8JRyOZ1YNfc3WsNuv
	Ttd0Owi/6fmRdAP0t5erp85U2hgdAkXrYK1T5n+377aC/j+iLOWsopgkm+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qeph3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so104947885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309677; x=1753914477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oV7AIIt1QyAo8wPjxuzZpCSCbMZcDPvWD/2IfvRI0Z8=;
        b=X1yx6xvSpDDtAQNwISgnFHBf7n59pl/NbNQYbq85KHC5fKdCzMWxwzU7yoYhQsCN2G
         xBKLFEYS1M0us7DPjMctAKV3Z2CEg39iNHbwSfc8mok1Lhw0mTlUXUKiFAJyNd4lYdbA
         /gGwpBc0d6DYI1lmljjPh2wRXLBUVtMbyxCTeQoCF6HEPOvIDwbNHLi74BAMBUu+B5gd
         AefqCwA6VoaEuTDRz914IwbWjRr7ee4ghABOk3i4gE1TFioTP1UZaYwuEZGrSnkBhzky
         6RGgxuw4+6igZy78q0GovtSFmdwzlSVnmMYirQJDVjdbybL3O2cDKIdD22rHztTuyrkZ
         9Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCXv0pZNUlkG9Q1Tj7lfgaTiA9bWfLNX1sIqVLuh+OBQD+vkL193agYb8BAMUJMncNZMMWn0AcvNWUYPOuXj@vger.kernel.org
X-Gm-Message-State: AOJu0YxBl+GR51dkOAheY/L0266dTiEJpEazsz9w3jsg6eSbILJP7MQm
	44Oa1BE5ZShD0zvSGfi34i91fAMQacQ4krQiL3cPQTkkaJbwOpkPZMUUWkIqkdC9H2wTtv4dfWZ
	6Afd/xtVRxKdrbY74LHytk1hjoXSAUPuQpQ1s8CCygPGvqhzLwvxg2KMBdbvStFEVZqDb
X-Gm-Gg: ASbGnct3n+dx2xRyjj1dJ3GjDk5dUt+r0y1aqeL+D51jk1CXnIszfxJuP5DhlwrtGmQ
	jcwlKZn1jzwRBIQf82olOdBa6BXbGsvg8P1LZ/98J+1TJ7ir9BKBMIDXyWi5QB0rgUsYe802jZJ
	AGN4spJ3n2L5C0b7DoRwSVtfAL8QF3IKSfrPdydPl61rFC/s81+ZGlebIH/WVZ2Pw7IatnM7oxI
	NGai72HyfD5uNCV4rtW7FOXt9wyVsdDKOY/MZ83MkKkhCS641DP46okJ4+aUuFMPLTrHZx6WFMl
	fBYxKxosrH9725mvgZr6xkmryWOqO/srYKB9ruOQx0z+Q9Ano2A20Q==
X-Received: by 2002:a05:620a:1792:b0:7e3:4416:1032 with SMTP id af79cd13be357-7e62a19b95dmr520875185a.59.1753309677313;
        Wed, 23 Jul 2025 15:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEztatUjuAJg5viKWoocKG4lic29O+zmUfZlMzk9L/lrtIJeODRaPJGCnGZme9YcIro3nirAA==
X-Received: by 2002:a05:620a:1792:b0:7e3:4416:1032 with SMTP id af79cd13be357-7e62a19b95dmr520872685a.59.1753309676900;
        Wed, 23 Jul 2025 15:27:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:27:56 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 05/23] arm64: dts: qcom: sm8450: use dedicated audioreach dtsi
Date: Wed, 23 Jul 2025 23:27:19 +0100
Message-ID: <20250723222737.35561-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX62P8fjaUy/XB
 l81qLCO0LZU8EPagnRxsjWfQc5XqWc41ii4AQ9VB5uVrug9lI7CiL35yxafYGaC41P6RDC/uD3w
 Efc6euDndhQdp9U8uwMNjhbFTpZVNF1X7csKu4HWQNH9RrO8l6s/cGpUtCsEXBf60Kc1FcnkY/E
 P5gOkgmJ1SzU0pROvHNNAvwM4bQIX2Yp5F9c96d1HLa9bSVkz7BiqQUJcEv4vih6Gwvm0AICdCC
 GefZuNUe7RF5BpNRQ+U2W5ozqyO4WQYFQ/8/irkWWPCSMcCjIX21VXY/aGFbfoqKI0mbJkQN8Y8
 6SfJ7vTiqbfc0DWlZMkcLv+4/HvPGg2VYQWG1mu/SLilpy/2XAm/WHyVvJhbMMmT6fFap6/yoKO
 Mstsp6+u5H7tkNA+cwlJzS1pkykoJjZIcNYMxZFxbgJxBBteFEaVX2YYkgoo9B9EFxoRB3SV
X-Proofpoint-ORIG-GUID: g4rl132fZW615pyrhQmDoyTRFG7UDi8_
X-Proofpoint-GUID: g4rl132fZW615pyrhQmDoyTRFG7UDi8_
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=688161ee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=aONcyR_MLncd44ar4gMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=712 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of audioreach-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-audio.dtsi    |  5 +++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       |  1 +
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 39 +------------------
 5 files changed, 9 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm8450-audio.dtsi b/arch/arm64/boot/dts/qcom/sm8450-audio.dtsi
new file mode 100644
index 000000000000..1478326594ca
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8450-audio.dtsi
@@ -0,0 +1,5 @@
+#include "audioreach-audio.dtsi"
+
+&q6apmdai{
+	iommus = <&apps_smmu 0x1801 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 2ff40a120aad..d528df226eea 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sm8450.dtsi"
+#include "sm8450-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 8c39fbcaad80..8b13b09d3b08 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8450.dtsi"
+#include "sm8450-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index cc1335a07a35..fbb2d6292163 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8450.dtsi"
+#include "sm8450-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 33574ad706b9..fa0822c37854 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -21,7 +21,6 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
 #include <dt-bindings/reset/qcom,sm8450-gpucc.h>
-#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -2783,43 +2782,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
-				gpr {
-					compatible = "qcom,gpr";
-					qcom,glink-channels = "adsp_apps";
-					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-					qcom,intents = <512 20>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6apm: service@1 {
-						compatible = "qcom,q6apm";
-						reg = <GPR_APM_MODULE_IID>;
-						#sound-dai-cells = <0>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1801 0x0>;
-						};
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
-						};
-					};
-
-					q6prm: service@2 {
-						compatible = "qcom,q6prm";
-						reg = <GPR_PRM_MODULE_IID>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6prmcc: clock-controller {
-							compatible = "qcom,q6prm-lpass-clocks";
-							#clock-cells = <2>;
-						};
-					};
+				gpr: gpr {
 				};
 
 				fastrpc {
-- 
2.50.0


