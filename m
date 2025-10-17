Return-Path: <linux-arm-msm+bounces-77704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E207BE70E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC20B4E07E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475DB26A08C;
	Fri, 17 Oct 2025 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiVptCSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F63247DE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688441; cv=none; b=kJQsDa20EHuJLKF4j7hBOLVPbRYmhJobS54SQSxzN8/8uTrkCrx1VdyzbeDFJMW2El7z9ocJg8tTmyrlTOSRgUHXrYAeBrkDngsWxdGj5EaGoxmtIztBJ9o8fBPIsoDu1eMUPDlH9BAdcK18St/4A1nU3mjNsAS9pL4PXhsuy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688441; c=relaxed/simple;
	bh=MwtE5OhcY+XRVcD5CunNobuCvBq3rntMOCnaYglJxSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y+NbHAnJ8HRn2Zb0VqC2CcJ3zcbFWC5sqI8Hiido489gX8XbXh89mkLp74gX9YM+qfBq0mh2QtEYyLi69S3ecCYx1O3DkPAQLY/cVYD3DOoZedZXfH8yt8dOUFZwfY/XJggU3DhKMDgpENnpXlZb9cC/tabShTrRl9wukCLv0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiVptCSg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7ql85022235
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eqisdpW2ay/zMVI4Nuk53R
	ksQ9jjAr1yeLHAqtlIyFw=; b=ZiVptCSgd6oS14RgADwjuVLZ7kWKh8o0V+zMIv
	+9lmHVnpirak1BOLOrAxCi9FwomKwkNl4rlqMq/iqgtFH2tYkaHu6/m9PmSisFAJ
	zwTDNkUozJvBlHZNOBIQ+VY4V+rgJzCa+HHHmV5uJhBNQm8TUfuO8Cru4TlnoayI
	tOrRuTE3LrUrNUGgK8ysmzbpySeIfgNyZDsFdYwkIjQ2sGorp0RG4j6sYWXfql99
	6S1eNF/TfPexIJS7WbDXd00vST/tvpKXO0g0+1lLgeH4uQuu5PSt/nJYd4mqvn+X
	KvMvYAP0KL7uCCeP1xAu4p84WCb5rhWpZZ0XGakOtCPtpewA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtgchm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:07:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f82484faso1311306b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688437; x=1761293237;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqisdpW2ay/zMVI4Nuk53RksQ9jjAr1yeLHAqtlIyFw=;
        b=IzrlrAnF6Qs1FVjtHuPCIFFybbgx6XWRithkUNbXplTCsYNvrj7fvuGEaCOIWWXuBk
         1OHHgRtBnNKxmwDJbji2SxImgYJ6AqEAv3A8Ee+lOig0LuVK9GI10YlBSDdx/spBH4FH
         SDpfrW/H3Pg8PCvFZ32GCmLYhOQG1MzX9oIwLU3ObQF6tmEcfcloPj6QMcZSZ2rQMEX3
         N3HLMUSbW8ZrzbyecKff8HU9dxiOxwYuMzQEzmyjW4QivbNiCI3LDWciBpq5iVHlloN2
         ZlA8zCE/1qcXbkpQNg7GqiX4GXGAKUq85iNxr0OS6nlIFG8kwVefHBXemfUny1QQiuBa
         lIOw==
X-Forwarded-Encrypted: i=1; AJvYcCXJESs3fjgRYndLf7w/PJV5DktiVrifowkqBHajkDRcugY/xkhybECEVsdQIzp3aKwgWm6AxZCkTxH1e6nk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7XwbVpQuzQyyAb7DbDMBRGgClTe75sS3xnt+vWvoLOokvwFL
	97uBd7ROshsGg4OOLZvdKqg/0YIopSZ6/crfqYZWm25ID2f4s84dgUCb2tE+akv0/v8hjAvQiqQ
	voAuWdUoxnrmSJpkanxPBdCkS0gDBzO1CbKHRrAIKoDTxA9OdG+qAg9+LE3GYrIBQDBkv
X-Gm-Gg: ASbGncv5vs+/7sr1cZ3sJHkyMHench+ytF9V7aMBJ0hdUtEqpvdTJeRkvInoNknMUJC
	tVKyoGh3wNdEdCL4KGmjWsLxRlOwmDHPdkPoiL+99KysvtR+2mvr559fcpFQ20J6oRHJ7s99ioq
	ABxgVQ7w5spZko/Kx/vR5UrhnPVO5M/ull1pv1YM2Cknsco/6spPsRFxYZCNnQIMnhl0bqkXMBE
	dMRVJ+nvb6bwm9rBewUunv6pzOUqQjKFDY95PPCjPYok5xH9JrC5KYsmQKYWk4CtSloUKHa0HhZ
	+Gf9pNyCE3FX+Sgs7zKaxKqwGw3cSQMsc60Op7O8mhAPTAKhvKLlz394ab13Qb6qFHonz+H6Sxc
	eSUfdYV1gBUSiP4CL2kGh/6sUOUX5G4a8
X-Received: by 2002:a05:6a20:244f:b0:2f0:91c0:1886 with SMTP id adf61e73a8af0-334a86444bbmr3749203637.59.1760688437243;
        Fri, 17 Oct 2025 01:07:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESiDW+VmUsc+tWkm6q2EUnLZFk9iWKP0hEG9qJkRKh/EsJJ7DiL8XFcq1oa/TlOr8g1PcyRg==
X-Received: by 2002:a05:6a20:244f:b0:2f0:91c0:1886 with SMTP id adf61e73a8af0-334a86444bbmr3749128637.59.1760688436744;
        Fri, 17 Oct 2025 01:07:16 -0700 (PDT)
Received: from cbsp-sz01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0607e3sm25380073b3a.11.2025.10.17.01.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:07:16 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 16:06:39 +0800
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: enable pwm rgb leds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA/58WgC/y2NQQqDMBAAvxL23AWjVcGvFA+rWXVpk7RJFEH8e
 0PtceYwc0DkIByhUwcE3iSKdxn0TcG4kJsZxWSGsihrXegWyRgM84AvNjj5gAtZTyg+IW9PvFd
 smsFQW1ENufEOPMn+6z/6iwN/1rxJl4SBIuPorZXUKcd7wv+qgf48v5RFYHGgAAAA
X-Change-ID: 20251017-add-rgb-led-for-hamoa-iot-evk-43ed6bda73a5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760688432; l=1466;
 i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=MwtE5OhcY+XRVcD5CunNobuCvBq3rntMOCnaYglJxSg=;
 b=3CAHN5nGnGmGNpQP+INGP5T2oPXBkPBGcZ4GNUSjpLkfQ1mZAJ00v+vRLrED/9uQQPn9NO1o2
 y707DKgjLbdAyL37yXnqGz2Op7HbqPNv/l4wRlD5HgzN2cirlofzxY8
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-Proofpoint-ORIG-GUID: QJeacqrLpey0EJPwenNyvLHVtv4KEr6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX1dMxoesOJNKv
 wAS0FRexA9u3GWgzNkyxHnSlT+sSg8AcFclmIumwyO/FGas8Gm5wVU/47OwluXjHjaKZsU35kGN
 CvWBa6KQYF2ZPCZtOXgX0002Amw8VlnR/6vxaT/faVIPFW0g1gXnPCag5dJs3crrMgbsWW6B7Mz
 P/59qxeOzP9vcWgfwB7FWqQZfRxfafds372N4sVUp5vOl67YtdVp/qn36FDKR9WiuUWn+Ydj7Wx
 bnEsSj8EOhps39i6UGh6WDhR4bMfXpyjf+whsQMggPnuazsBzeZPYBnonxdoZFYQkrZ0jXQhyVJ
 GKCytG0JfUM3x1NIs9Jml464tQ7qiWX7rMQHO9f+gzd3N2GiBgK2FvH/nRWvukOcdCZFlSgf/dV
 5C95hyRnU0N9F6yo3y3MB0wbQmLA3w==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f1f936 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ehhsx6O6cmvpowC7fCYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QJeacqrLpey0EJPwenNyvLHVtv4KEr6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

Add red, green and blue LED channels for the RGB device connected to
PMC8380C PWM-LED pins.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index df8d6e5c1f45e04a9f225b1df2ac6d4c4930e83f..a0b392984f43b6f525d6e82c6f31416b93795b9b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "hamoa-iot-som.dtsi"
 
 / {
@@ -867,6 +868,33 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 	};
 };
 
+&pm8550_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";

---
base-commit: 18ffc9eacb541fa128e9e529f8fd6c6e795624f0
change-id: 20251017-add-rgb-led-for-hamoa-iot-evk-43ed6bda73a5

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>


