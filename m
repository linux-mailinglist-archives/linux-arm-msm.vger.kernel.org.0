Return-Path: <linux-arm-msm+bounces-72498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C277CB48692
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF88E189E2AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2069A2EE5FE;
	Mon,  8 Sep 2025 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="See+D8Ax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C702EA481
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319634; cv=none; b=rtuZO6V94DHrDv2aMCS9uIqBSDDKjEaY9OdYanJuzYd4mpDTKUVFf2QWVfwNtuw34Ka8LJC26ZYH1bi2m73cJytsz583dJCCpQ9OIXZ0yYxWt+mRbyVTYR91IHDxIMoXKEzJehxjM8mppYfAzKRBfsAfOauKv27PT9QLn7WqXhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319634; c=relaxed/simple;
	bh=ud3TuPggLahDGChDQ1o7XXbj4HVsLOYi90l9y4PcyNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3Hf3PjTrOUT6eOmTqlMT2G4IThyAQLvaqIWQA6kTz8UOn9K5vXLeFAF6ukU5myCfRl9Hw2ON2Unbq61/EUWUfn/jrOOKbfKkgkffq+ms+4yuJMEXopD6TjOQwDa4HgdxCGjTsFD/p2JL7BSvv5mSTFDqD2fFaCYiKvJJkHYQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=See+D8Ax; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MN6XE032063
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7cNk6IecMVebr618FdTJPAEvTMA8XqQdB5/864dCQc=; b=See+D8AxF84ZaO7f
	VjLUDEfJwHPDwXoWn7kbdFH6yNWdgY7uBKAYMRKR/5giDJ7Hh02DnxtR0AFadNH7
	mz5og+gmKz/p0xruK63mZ+yhzZOmT7OCOuOzwODv7xxUHPgbcjuv6z7Df1cyApQ/
	njq5sUJP8tC+aY8K/oT1DYmXPZyrJyItgMF72IPzM/N9K2+guC65Q85+T2V+uIC2
	omzJZpL96xJaruQfltqUT2zX0bPhK8r0rJP1UyMRGSOaNYjl+BR1WVXc7U8IQZEn
	pt66e7ySgCaYUB6fLMvF9hPKhWkNpCUqFUYb3k2ujmjK3nBmQpeKSwnf1loA16L/
	vQSpmg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ktc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:20:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b2336e513so64541845ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319630; x=1757924430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7cNk6IecMVebr618FdTJPAEvTMA8XqQdB5/864dCQc=;
        b=DgYDyQerWACA0C9zaSYwVsJEwoSFcLqaQynMXtDoAMGO3QgxnifFYllSahM4h0zSoa
         QTg7+bp29wLWPChb7D5nQELuoYj3M2u3uIwcIfKX0DbjFQ9plUT4an/Q/yWuxlbhR3BI
         x3lCbBlcP5c+I6WL9bLRTRo4wkuzzs8m7Frvn8NQ/xHOZTS31HzaxQkHGMjJtGNJ/a3g
         vvLBc0d+DXXDSt+0b8bCiyaJOYVo8VFVINQ2L7NIzgVKqiyc7CraC4z4c23Ny0ZE/9x3
         wPp+xSd/NBR8qLzCG/fn8/wJpwvP//NkaRWoNBGysi2g7SyxDnr9sNw0UtKA/tCTcmuD
         gvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/ju0ECPaXh+HhXu0JAsfi+YstdW+YvJn2a3eKGICFb3AtndZh6F29O8AtlilyzTmkcJ/FvNTXGLyhzLwF@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFrxtpYRWrTWvsWBIyhmBhNialihe8n4Jc5sLsL/bOtEDRXIR
	lMolmyyGgBcw/5paVe/f6ipTDS5k/j10Iyt0Q/hVxg9xmXErDtPzgURWjHMTTjtE/GAu2Ujel7y
	pki608ACCFr+F4n9hwZtWFzx1mwsVvDaFKwDyppy3C3TobIGsRivZananxJjKwqG4M8aa
X-Gm-Gg: ASbGncuzB4pWSrstMdPb5DjnteeutAChiQzgS5ytQeA5/CMGxuv8/WsH+P7yN2gWewO
	8AXLiDUokK6QPFlPaKJvqD1vaWsjomht1AP+mUyl2dygMP7ECynXJpMc8mDzanjcaYfwOAIjO/9
	FwN83X7amYo9q4iPGy6yhKOimXJubK4X+65TJ9mWlZR1m+MtDNnt3wurTnpUUdVkmR0JNayOwpS
	mobyMEpppVS2/Zw+BC8zpjzglvaTe3wowhJHevoGNK4mFEPiHgdHJ0sx6Y/y5TS/rm15lHrww02
	7DtL1cFDklbGvniywKslNEdaMd7ocCYttGbFr+e7naGbFrMUTll9zMynPu+6QZIt21R1
X-Received: by 2002:a17:902:ce8b:b0:24a:d582:fbaa with SMTP id d9443c01a7336-2516f04ee0cmr106344105ad.12.1757319630233;
        Mon, 08 Sep 2025 01:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU2+Pn3pFEGWPMZXwcqWfe38DfVXT0Rgjw4TxXRkh6HKMpHekVGqpZgUJunuzabHm2j/OvPg==
X-Received: by 2002:a17:902:ce8b:b0:24a:d582:fbaa with SMTP id d9443c01a7336-2516f04ee0cmr106343655ad.12.1757319629581;
        Mon, 08 Sep 2025 01:20:29 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:29 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:54 +0530
Subject: [PATCH v4 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-4-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1307;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=jewA1ZuLrE/ryGMwa1gffJep1WWzoOZkukzHH7TucfM=;
 b=i9UWS6iq/NvrnGVeENKuHD5pzIRUYthJoB6yM1Eyw7sVIHrJwjlTu8pkSBmTCXd9ZbMx/WCOa
 JV0jF+D6AGnDzZ94UZQCW6n+UQmZrlDbSo4PlLz3htX5eUNiirnba07
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: uzbHHyLge8TPv2fc3k2aqnykslU-0NfX
X-Proofpoint-GUID: uzbHHyLge8TPv2fc3k2aqnykslU-0NfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX8++fQU1sHPTl
 /npfKhrASz9STVHrJQUtdCUg4v6i/AFkHmuw8HO5oBBMFxop5pcBUBvEkgSACgEGLCC66uh0Y1K
 6JaMV74qggsWW5tzFeYpzgMCw3pVmQpn8LGovz6h7PgQfax+3JCISn4fIfq6mJXHMmzxFbgrXq6
 Wjw2AejqILc4CmujdGUZeVepXUta5RVteo8FygWiLitJuTnhqeaEaldCtFDyyBLckPS5jwNZKnV
 0yI/jImk8Hp6fckA9A9OTPqv2cgiFXmkCmF88DThgnwFoUCTyuwNleG+I+5YzgMNQyhwLx2lV0C
 ohHyWmW9yaiHcYYFiePIlJrNaYN5NgGFdxYdL98yf75focHD5g+Vee70GYa2p9YfaprilCE/ZsO
 eueLCN6N
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be91cf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=itmwO_cg3X_j9a1xKB8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 56aaad39bb59..c48cb4267b72 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -289,6 +289,38 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c18 {
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


