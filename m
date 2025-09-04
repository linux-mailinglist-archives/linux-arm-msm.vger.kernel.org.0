Return-Path: <linux-arm-msm+bounces-72101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0DCB44337
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D83AA41AFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B60C3164C8;
	Thu,  4 Sep 2025 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKG6ow57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0B3148DE
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003994; cv=none; b=TQPHB/AYKr3bZIGLOY5+Vuhk2mB+2EkJpErcms8MtrbgtYVDqmDmxFIfIj370X+rFok9PYU3jhLdfQj9pjqthV0C8VcapyV5seqt343Cort4ejjB4beCYbTExuyR/3ffjwP32+U2GOgKNRKUyLpDQ9U1W3jCqdgTuID2jLXVekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003994; c=relaxed/simple;
	bh=smFcX8ezCgxfaauQ11dA4JFPET3ZGgByEqRN3eXWKdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkguTl6jgdnlviBRWVqrLg3Uhw7GDfHDmrApBTvRXHqYQXoZXeUsUZuJSf6QSflx8eJ2niaIpaD7vUVHTfHwOGAal90yXfrEFyFCbCsgdMQJ1WE8qWjqNtytPUbFk6IRYjH8jvht29rB6p4JWDOlLtcsbiOJIW8KeHP38ExccD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKG6ow57; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X86H032210
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbq+DXdSP7cwBiqe8xvfggttCay/BKrNEnQjjAGNbvU=; b=XKG6ow57Au3OTTNb
	fNt5VvZsxQgDbMqrvnLKz1HdO8W7RUsKIU1mqQYe+7DoN3XmOL9NcAOOSvDcwb2j
	aJbQkluaShj25UAK8LaIcfLrqDNte1STSVf7MYWVIlE5TavBKtDgCAySIv130xiE
	iEdUAEpKqZ5zWJ9KmRvlg8F49nNd8GlHR2UK/YfXZ0pEPpdHW95Nv8Cl0+J8YMuH
	BCSr4ZwQ0hOYooHYiV2iIxKiRBzkBX6QO7wf3xvyTSWNZe6DmuIDDWp2MGLDvLFW
	67ldR8J42/K5DPsyMHy5sLgkrIs83ePZ9szy4CadIUOMazs9qHYatmjU9j7++sX5
	nqVL5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpgbxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:39:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77265551c77so2030769b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003990; x=1757608790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbq+DXdSP7cwBiqe8xvfggttCay/BKrNEnQjjAGNbvU=;
        b=PWShbexJma2bRaYtNR7nmvjS/uhLg8+AwVSluj49RO4ZEkBA5kkbVlPR8I4X45lJH1
         rsNEPLEjjmNpNghNktHvoyGjqBdPh5IlX7FguFcQZteXEdHRSM+P3A2ibeFHkZn2SElD
         3uvAI80DiizVfmx2AeN1D0IaWDrkDG9+GRtsd0erWoeRMxGvF1iutfL2HLGy2/Xqf9cu
         PYTKvIr2jhV+GvzaTbzZHFaChyEUfAshAC3KSnjAwod+aMGLpY/LHMiwHSNTQQrOLOuX
         aJMSFgTWJL24cx9UhS4dC5OIiPnSuoDNWfKkxuf9D5AfttpUQBMV7WtdVftu09HCX61X
         agDg==
X-Forwarded-Encrypted: i=1; AJvYcCVgiR684tYwIP1oFEjIb0dGgJA3Hn44cpQsj79jzhHBhDj+wbjXP5nBTXiwN71IyK+Mziwn4G2Aj6OxbqOc@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOiWvOWSTGduXZsV3h/ExPikMRsIoDSkWONOu1difY8Y87CwU
	zBe7ZbprmWQ1qREGAxdIHSr6aeVNaxZVz1K1NupaOTBA5xjwJAf+UnFonEoi9teHGcZLa3zZ+Si
	c6IJGpiUXE8hEMEN0/ooc7mpO+w2REq04gshhMB5E0Uf2bFd/D8deD9O3+x+wlTryzHtT
X-Gm-Gg: ASbGnctyA1ja+Qa0f+EeQFnvl5gwpQFCk+A7osZsVAyxdsqxu4H/b/FwchVFftBT6FQ
	B1AJzVMEFKW4oTrs7/p6uW8dCTXTyBTCh+LWTLLyCGjGfTl6QJuJiKrlMuHLtECIQPoIO7RE08L
	Om5vYCSrBgPCh1L0yENouZdtIGiguC0eNFxCm/bKj2uw5xL7fhRsk+h4U2pOEHnsOCvhFdsi21w
	Yx1Fl7waBG8TZf2E7I6Ns0TdRu5SwWi+utG+w20zjj5it4kM+AKQE8SS/kxzHskD8CkWIWvHKin
	vkw/pWmzI6MXubqd+Mv+bZ+tBLmljAlgTySC//J56jAaSqIbxY/mc1Q2SZcoTX3kRT2a
X-Received: by 2002:a05:6a20:918c:b0:243:c9e0:8b06 with SMTP id adf61e73a8af0-243d6dc8090mr27501108637.5.1757003990226;
        Thu, 04 Sep 2025 09:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzD1cTEmn46NSwuPKASFsNepjo9nil4ymDu/y3d+JRFqWGfDQaJarZ32y2Y0+rG6IDPPIl4g==
X-Received: by 2002:a05:6a20:918c:b0:243:c9e0:8b06 with SMTP id adf61e73a8af0-243d6dc8090mr27501054637.5.1757003989802;
        Thu, 04 Sep 2025 09:39:49 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:49 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:02 +0530
Subject: [PATCH v3 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1094;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=knYck7yyW6VH/Q+lPTq9YrCWE79eVzE8DYwVhqZMEi4=;
 b=KiUQmzDNRdHpUoNNOOZwRETiT45RXOL7r1Avo9JLIX/1LpA5Sp/Jj+CgPqyqoaxYKbexO/E08
 DO7S+I1Z0LEBfPOruprdSDNbvw4+O9N5yOMAIHLSc7r9qgpqb2rb0sj
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: neYn1FKG3wDAbY4cVGiiWV66EuH_916K
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9c0d7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=cq19zQBcvAJi0RM8MkQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: neYn1FKG3wDAbY4cVGiiWV66EuH_916K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4pl0IkHu9jBY
 m5j2hc5pejKIaxODCZB7OD/DYumEnHiPtE7Fx3v4FGbxvdQWxUVlOE5RJEaxI1PGxmiZ+RAi3GG
 XzhpACRkGF0JnPk6oAZ14WmLg33+TAb0vATeWa2wlxW9BuQt69SwVh18Th5NUOmaOeTPr4p7YZD
 ngOyJm+3dh7qXUZ/jP7M1Juh/iCq3KIeqbN1e1VBs31uuNTGZA0F1EYS/OScoWMYtJ0yKsK3Ob+
 /Eak/+SGLIGF28eaLaVnpODASoTbcwhmwGJXa29IpGzw59RqoftBtgbKVUXTfhhU5nMKIxHd2Vp
 V7QyuPYeTz0iNXtqXEt+gS3869or3Tk32V8g+zZNeuuuDy9R0sO5n1bMG1S7Of2MTq6zDg1wYgJ
 dSJvAqm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Monish Chunara <quic_mchunara@quicinc.com>

Integrate the GT24C256C EEPROM via I2C to enable access to
board-specific non-volatile data.

Also, define an nvmem-layout to expose structured regions within the
EEPROM, allowing consumers to retrieve configuration data such as
Ethernet MAC addresses via the nvmem subsystem.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c48cb4267b72..30c3e5bead07 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -319,6 +319,18 @@ expander3: gpio@3b {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
 };
 
 &mdss0 {

-- 
2.51.0


