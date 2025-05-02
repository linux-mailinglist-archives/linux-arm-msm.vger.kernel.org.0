Return-Path: <linux-arm-msm+bounces-56505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9B1AA7338
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 722B34E12B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594262550B6;
	Fri,  2 May 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnXJzSlf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D7225419
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191900; cv=none; b=iv/Mwjb9F0+Eitk5etdU9MLhxHSZyRup+/l6ITMM32ccJaiIlSaBEKUWZiBRhXHBCoZ5ycrbiDm+gQ4C3SBscoSrZGoWVNS26l05qJETDS6sM+H+tE/49lnZn8yg3UbsxfJMaV/f0CM/6wbzit6VwSlAPbOaBJdAHkIE5B9uJbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191900; c=relaxed/simple;
	bh=QSvt6ky/pJ8+VntHnwTRnuK5ob78/so6X2MfYNDfB8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+UwaNYLQ463rbVUatK2ZN1Z7A6Ais1joy+PBnbvQ8TzJJw2seM12M+HP3J+qI7mBaKpxuCxNFNxzeoCgPX4Gi9prW4/x8L63zc7Yr1dCiprToxLZZvpkUZ+ofRt4CN9sEF7MSha3xO9DpXWao2okdVYVFSdTv3tFdicnr4oX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnXJzSlf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421ND5h002503
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 13:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6s4iQJFnCYwc8Njw/Q7Od3/r3Tk3o0yQdVDAkClWD0=; b=FnXJzSlfLY34wiIg
	dQGkI/aUCoZ4pYufIcjFEsEM+NhNNkZKfhkRI6Z0YClsupcsRKUAwiAgbF7d1V1r
	HcmTO77h/IGBz2BMChQzt1ixMFGz+QWUzjOxbgsNRLWM7BceLyPezxF/m9rtvmLG
	MglEZRJ99jvCYTdjoBqDcHsI+1nq2syzstgEAxRAUB0ALn5K92pIQV7R8tVVDIHU
	Psd7f8PT8AV/hw26LgYhooBfGHU/Sfli0IPVxRWQdcZaI6CEZd9y/xhmzP6eU2qC
	Xv6rRSKHmeZOj5I/1gCa9M1VG+N/Ino1F4MgKp46spdS9Gzi1qCyG6BxNRmxBn9R
	oBcaXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78g6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:18:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739764217ecso1989057b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191897; x=1746796697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6s4iQJFnCYwc8Njw/Q7Od3/r3Tk3o0yQdVDAkClWD0=;
        b=dRKgvaXVTjx13jlZND2FJIhMNaCLYwrBZyatx8jZOh0EA+AqVTN4SqoXuuiB75RXUh
         +OvSMWoAQA96XoNmmkzgTJNemuOJiI7FuMwKK3PIrGbsFGJGP7pAd0RptK5ABysIdGNt
         aLi4vGhbZe+gefKH81iTZrc4Cg4JUbjCNtTSZylYQ9a5WL3NRd4jbx424XEXijEu37Hr
         5et1KYv+o5a16dO6Bd46IUpyvDomr0A4DMNV3+6k0G8RvE70sIUJnTlSUiZRvt2gUUs3
         T4xpIu/B+wIHoUIuy+tVe4uuyX87QRF749EkSa8tws+DjiLI4AWUms5JTw0foXDtXDMy
         5o6A==
X-Gm-Message-State: AOJu0YyobIvvujJuOkcigJNFOKchAAwzKLFuilBXaMmZRrCObWxWrik5
	u/79jAnVNDeVpKn4waivQ7GlUV02X38PgrKpz9hPR+DpELKazC24/PBKOB6WdLGlbe9K0L++gle
	3Uxe1TBEkm6ZHrEQ4zXgQBghputGlChGuOWBkj/z4AQYseInQ5iRAzGYZOBM+33YY
X-Gm-Gg: ASbGncvK4brMONOE6IZLi0SJZL5BQVog/2WT5INWJ60MaD7b5YY/mWE+FM7S+ejLWLM
	hjzGIhy/bOAKRU+EhRELHQMnX755HXVeBxNlVduHm/AC1Mm/6UI4eSseti6VljA+ATfs/obPYlW
	wP2Jz6i2apaxfyoNR7OAP/GmEAVaQrBwDt88+Vb5nIjZzUKZUc56UMveaLcw4ALHtygY1T2TVWG
	fxoCrKN4IZCNzv8Q97W/gs2MgjwOECiJ5ov4HisLKq/AH415YVkB21jBEQKmrC5cGUWZfj4ZFT5
	4NNgW/EyhUEmXpO3FSPU3H5LGYGKlnTB8J7WKyE0wjS/KlfPRg5rHsJ6PuI0v8PsznEK8/K13Ee
	j2HetoPjhdyffn+B9AFN8PsNU8Qv+ifmqZ4RSRB3Np2S/MvY=
X-Received: by 2002:a05:6a21:3a4a:b0:20a:942:47e9 with SMTP id adf61e73a8af0-20ccbf32889mr4746735637.6.1746191897073;
        Fri, 02 May 2025 06:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHykiWgu6P5RWv+jpbrr8/w1EyzW13LNrNIfl/vAhCwU7yGp6LARSRGjcAThyA0Tgaw5qEwyQ==
X-Received: by 2002:a05:6a21:3a4a:b0:20a:942:47e9 with SMTP id adf61e73a8af0-20ccbf32889mr4746681637.6.1746191896626;
        Fri, 02 May 2025 06:18:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:15 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:50 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-2-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=1449;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=QSvt6ky/pJ8+VntHnwTRnuK5ob78/so6X2MfYNDfB8g=;
 b=d3E799PB6j36wxzktWjKR4doHuuJ6ScVx0OfTufOffofpFC5S7yVcCULFdN6gsES1++Dc9cHO
 1XP9nlVvbcEB74cREnucq8d8i1rxwvoZDAJdtjIbt2gKxvMNw0I8rpU
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX02SVWRd92X9S pmVpIjd94f81h+qrhHR3+5SdeIeVMX7UkIWaJtluEPu/S5DM75BG9v10BAasVNgLD5oclzLLcyl 7MLWZmiUIJUDUD0an9aDlTL6Xt2ZGhvS7UrYspzzpbKHVcbf0md7HgNO+pFQBuwhguTeNlFWTT+
 xU9C92vJMQiTYJB8ooo/cflqgdjrD5ej0cAo4ZaihkaD3Whl13cFJz93x9jDSwO10vr7nq08G1G WTfHKpeoIelOtaqjEeNTTK3WIq6U49jN583bsbFib2ACYVzup3AUfloPxpDu8YiAcbiAKgFDknq FTqFHMNgxBI4pgAtTI/NWkE82x7CmckcbDTubPdPi3fo8g5GxQVVMw6eGYlEMtr97nXz6sXj6xo
 e+nNF1+n2dx3nHpbO0XcN3ePUEBjuPV6FZQVTGA/09vxyPaOJGWLGlqMSAG+AzqOE2h+yyiy
X-Proofpoint-GUID: pkjeol2AWfqv7iSpEsKSIQAS5ABrjxJs
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814c619 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: pkjeol2AWfqv7iSpEsKSIQAS5ABrjxJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=923 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


