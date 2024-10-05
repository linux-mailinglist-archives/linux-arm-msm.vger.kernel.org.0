Return-Path: <linux-arm-msm+bounces-33168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C0991412
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 05:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7942852CF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 03:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C15252F88;
	Sat,  5 Oct 2024 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNFwOhtx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CFF49620
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728099056; cv=none; b=pHNTuUrO7C0a30diYhOMNcVOrJBqGLbeYrjVBrHo97vxnV/A2sKizDghZWVXj9BTBGPQ24dSReuPUfSIg7xGNTOwPip6TqRh2y+SfHi4Uf1PDfr1jz852joYtlOKSGmC9Ev9d55ehoe2aN8yc2FDN4UFD5U5vWSCfJfmapgNR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728099056; c=relaxed/simple;
	bh=EENcGIg6LoPuWUH9UNAjaTUBcwnoSZtjXy7KPkaIKbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6uMOUVZsNxa6TD2EjA/TkqgDxM5bbBqYrHJsqvkbPqNybylqds4SxwukRW9bjX0L2/y5KmAlEuztMXZ9npM52BxBiCn3ESezYZcEk5H+FNSLxqvsTrLr0pyoEe9xPIjODfpR63CQ0K3IcaQKd7I5nu4npsVme/YaCZycFSIWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNFwOhtx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4952ZMH8007843
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Oct 2024 03:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25jadHoLQe/wB9Yr+PSvxFqnvt/vkfNMhDrWT8D52Qg=; b=mNFwOhtx/zBGV0fx
	ixfznQzCOBvmbAaUCgO2CXFWGX+pbBldICcJf6YOA5YmDyOK10QymPbMDDd47mFE
	76G0qZm/mKQy/kL2XSb9PPK8bnNvpKAjJPisC4W8qPwB9V2YmA5F3+j+JtGT8jiw
	wZvbuVExAggNCtlTeoO58BKLSsT76P9gEAwIx9055N2INVelsFf0n5DH1yFA57Qx
	8blu7+PaddWUB/VtrieEHx5jPVg89leOjpf174/Jq8s2+f1GyRUJTLXT/tgiFiTs
	oK+Wz60+kbIntMD5o+AJmg8mxZPJiFt8RYsf8kzlHA5xQrooCCl7jYPLBsB2pinY
	VItfNw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422vsgr1wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 03:30:53 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5e1ee2185bdso1221593eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 20:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728099052; x=1728703852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25jadHoLQe/wB9Yr+PSvxFqnvt/vkfNMhDrWT8D52Qg=;
        b=O8gAZyH3Kyrwk/pyVOoD7IGYiSSue13LKrQGmB5lHfAX79HLURT6PFbJO4bBOKJkij
         qz5U3Who8lB3roaq2CRj6KlT7HiiQxyRD5+gryKzxK8viJYo9RikjKvfPh1LPNkLTTpt
         5hnyonhTcK/9O0ctB/Ce0qAJtqVGozMizz+O1Wtui3EFWTNW5NIXKVYva8fy7qrWNd+Q
         FW9mbfcauzzTLo5qNuE9JNcZqeQ5bbl1p7keLzhmc3CIauinmUidzTa4JTULGNnuuUaw
         O0quIK7dJBYN4ZciN0Gaer+0tBL3dOqi3kWuhnNpCi+9KHlf0Vs8NmmJB6MJObODu8/1
         cJYg==
X-Gm-Message-State: AOJu0Yyp0RNy3Lc9S+5Ri3OV0mEiinkLgXwYwPiRd4sN5wdWKwtf8FsJ
	s9e5EumHQdc/KFZca2EuUgdNZfue7aurflMzkL4zJDe2DTYdpO3kt3aMe7iG6thSVpZZucFGBEo
	9y4DfEifPtFDnXZPaIBMm1ws9CKxT10uzIAGzBsMVbh0PQOGIAfKELwjnIHg3OTSo3Jw+phM0R8
	I=
X-Received: by 2002:a05:6830:6216:b0:710:f926:709c with SMTP id 46e09a7af769-7154e97a156mr3736828a34.25.1728099052301;
        Fri, 04 Oct 2024 20:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhe1TrMtIYAJYgeA12sbIFtb1OwoFmPkr+cS+LDVV6PKsohR4oY1N9xwYamsNI8VfPh6dBgg==
X-Received: by 2002:a05:6830:6216:b0:710:f926:709c with SMTP id 46e09a7af769-7154e97a156mr3736812a34.25.1728099051833;
        Fri, 04 Oct 2024 20:30:51 -0700 (PDT)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e7d72bdbb3sm366390eaf.38.2024.10.04.20.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 20:30:50 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 04 Oct 2024 20:33:43 -0700
Subject: [PATCH 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Configure onboard
 LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-rb3gen2-leds-v1-2-437cdbb4f6c0@oss.qualcomm.com>
References: <20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com>
In-Reply-To: <20241004-rb3gen2-leds-v1-0-437cdbb4f6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=bRQxJNC6tp3HmXjAopibTIsXTQc8M8UgrM0RAzUJQ9Y=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnALOht5/HU5PlcBl9zOU6OQOdiOmAYbkw65CBN
 l6t56NNcCKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZwCzoRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWt8w//aI2iyBFd6rhLKHHfwdfmVnUy+y7wfoNK64sk2eA
 /rEFdcbAPKFBizfEHHqnEEpG/eCOn7mewGPGcUaJB/P3rYdh6ZaIrpz9IstcbaGpXdZs9eJ01iM
 7ss63XKpMY6ElPjEBGxWBdQ5hkbN4B8MyzXn4upkq5PV1YwleAyqPjuYRfghKOCWDCJXXENNJtw
 BSbJb6bcG3z+VTXNa+5HEcnLhyojXZ1r8O6i1cMKREvN5vanZaevHpgcWuG/S5na16omkfw4iyO
 9NnFsjVCX52oSUBMBE4zaVmZVNCSCevhIfF0uqJYy95Wcmer2Z1AzfNXb/TkU0r9Y4rdoj2bIUd
 k9fstf94DO8ZwttpYLN+K8iv/0NTrvPCtodFyzz0McsZMWeMhIsSuoWuxOGzWS6LEEqTqKIie7J
 70r9r9imqz7H4b+aub8rX1t8DPiIcXhs3cWo3JHK60VvD01hXqmff0gOciGxa2/Af65FSYI3nN2
 RKJ0KTEYuf4z6VC3/Wxel4dmIFWPSqv1250gPCsWhcbBoj8EJIkzZONZYv6TduJyicJzeF3mBJ2
 aLVfENLCgqk3CUESG7yAQZLQEu1z242BD9HFnHYnklgfAxuelpRCLrGzdDYK3DA1lWhHMm9KW2K
 AUjIHMMJFDImrk3xbwu+/gv93VaSjFi5a4pgHCtdqxdc=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: UQMaX0QnEoHtSd9kAmnR8Fy65_md-a5X
X-Proofpoint-ORIG-GUID: UQMaX0QnEoHtSd9kAmnR8Fy65_md-a5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=851 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050024

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

RB3 Gen2 has a trio of LEDs connected to the PM8350C's Light Pulse
Generator. Describe them.

Use the "red channel" as a panic indicator by default.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
[bjorn: Corrected colors]
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..78f116ca5f45 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -9,6 +9,7 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
@@ -684,6 +685,46 @@ &mdss_edp_phy {
 	status = "okay";
 };
 
+&pm8350c_pwm {
+	nvmem = <&pmk8350_sdam_21>,
+		<&pmk8350_sdam_22>;
+	nvmem-names = "lpg_chan_sdam",
+		      "lut_sdam";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <3>;
+		linux,default-trigger = "none";
+		default-state = "off";
+		panic-indicator;
+	};
+
+	led@2 {
+		reg = <2>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <2>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+
+	led@3 {
+		reg = <3>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+		linux,default-trigger = "none";
+		default-state = "off";
+	};
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };

-- 
2.45.2


