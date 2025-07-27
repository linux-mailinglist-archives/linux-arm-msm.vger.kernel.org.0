Return-Path: <linux-arm-msm+bounces-66800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCCB1308C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B39818981AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A19227563;
	Sun, 27 Jul 2025 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnRUUNJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0245226541
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633568; cv=none; b=reEiZtwjA/r9ZME2CPwDAo3rp+Odys80EmRD//3edecKtwU9ivlnR7dAseGq3mIrouydgtdizbStl5p+0hXvzg+atOEEVtFvKaovAESr2JJ6kQ3RpvhRBr6Vnw/yBO+XN3lr9/ydlF10HVfgw/TR0urd7wJQakRSnYOrr1iXJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633568; c=relaxed/simple;
	bh=n0wa4AEusSMKTJa2REb6Zm/CPFmojeqETl81QHufxBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxBnyAAY5AT98BEwKFuHQ1mCFIxvtbu3zCLCHiFcNdnK5d9mHu7tL0AMSD/DbHWt2pmyZhPb80CZJwS+u26J5/ruGuOiuoIyG6FOsbfK16w9QlN2Ymmbb29xQTNlhjnTmSZk+SW73CuobHiehSmlvq/Lpn7ym+A/yGSuVUrK890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnRUUNJG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFWAL9010847
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=; b=LnRUUNJGXUIhPCL1
	JnvGQKD2L6Lbi2jzEYnYkIfcAFZkQ8b4XBogLRdUTJgh7+AeZwmfupFsATieWcyC
	+4FLiCJJOrQlECVglxl32h2h3SlMtG2Uye2YMhDwWU0o1wuSQRjkNtPAh7ExSUAg
	huNpNknEJJ7U4FAeNWcO0Wakusb/uHCLl5XpFdKd30lL5V7dscr5baxdyQL2lELq
	N3EmJrem0eFuht6RRvJ/aL6sehCOvK7JECySyPfowe7EHRrbAte+SiVg/W76J5nn
	OYIMhmkUssp+Z6hlJF7czQPJQx7cqwDWurZc5IhV76VQnZxGbk5TPuiBP255VIAf
	IADivg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aackw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:26:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso60424035ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633564; x=1754238364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiMmHpQ1bB+met8QLJcdnw+SCuV4S6OJO6VsyYvdUS8=;
        b=o0WsB9biZNcEeMn4L5ZUvv5/5Ldk5tuqE7Dz5H+CKcdeNUqRtOhEeefVJIxvVgwdV5
         LMWVJw5HKCFw7fbcWMQREw4rRTo1bNFcWDpvgjZwCwc1l78DVZFVnjq8NG5Le7gptvMd
         5Vo/PKdG3PMzdJgRS5Jr+1IfjP3XltArVy1/CJqWKqlIASYP3ansTjmeaBlCfDlhl87L
         yNRL9jvtgCnNtZnhe28GBxBJtgREAey2FmEsVQJ0ESPQqnLw0HOba0tgixuml92+UROx
         y08A9rIiB+Z/h4QaY7U36PeqTSrsuzzWPtgCJLk4l7hczxuA6/NiLXr4jgramPILH3Tw
         AnnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOjPabjP08ObMyguBxbh0VZNh3bCj2UOXl4ox4Va7FHf/kc48KDD85rtb3kA7//WcP2w1GJPeaU0IxDa/E@vger.kernel.org
X-Gm-Message-State: AOJu0YyblONgxG0SZr6/QrbVdywtZgNmzRX51ScI0fJZ6/Wnx8g4XVu8
	1qz5AwtoQ/lf0YyBxqp9X6rsNS1VcpQLefMHE4OeRXnSLq9TA+S7j5ngo6PgX0neyIVCNGRxU1L
	vefSeguoasn8zUasgo8/JQeNOFVoQgXBFlev+e2llN9L+2Urd8lBeqrYIhe50V7CthoaxM9aNEs
	xp
X-Gm-Gg: ASbGnctrN5C010zw8H6P/6XQ0gv7q79vLPXfaKzcBIIBbzNj9oaIZRt21K7T7b67jaZ
	yrdlVm4dPH7UM4BoIRLljyWu83k66HB2Dvt+m21SWmdSm6zmex3zA1xhUCdXMemZAobEKNmJ3GE
	i6JqFKitrScCRUUVoDiP6pGaR/hKegVB1ueeDh4oauoOB8cqqUOe1zrk51fWQtU8N+2/qr9R+45
	rcW5+owgCghHsB10CQhyChpsJsQx4iMmQ1tFNGMPEg+aUQIBYOaaR9tFo0IsdCuNIJpMokIcd6c
	YkjGDHBFd7qF+GbJl1fL4tJYcMnLIPP0sSkWXRZKeZh/aUK3JDnUqj9xE2wg05YlAA+5o6VdcJc
	s
X-Received: by 2002:a17:902:ceca:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2402bb6de62mr9628065ad.30.1753633564177;
        Sun, 27 Jul 2025 09:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcv2kVK/ZF8/3NjRyqdhDR2HpvnWClMUSrwh0p1UvaDUQJSXqzTIkgTv+rF7qNzXfsSV+sgw==
X-Received: by 2002:a17:902:ceca:b0:240:2bb6:d4ae with SMTP id d9443c01a7336-2402bb6de62mr9627755ad.30.1753633563720;
        Sun, 27 Jul 2025 09:26:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:26:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:51 +0530
Subject: [PATCH v13 08/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-8-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/OISjQAhUBAIE37ASE5b1kssDpdL8gfQSFob68FR4qs=;
 b=/j9LuLfgeFti1wex62JLiS+dW57tWBQjp0c2zfR2CnLi8HYpUl4wkARBVtzMP3Jg2HbR5Td81
 AGDjWH7b1EqBbUwIaroGDhq9zWeYEc/3o7sejilFBpLNay/t6KxhLuP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: ORZguEYQGLJBH5e1q1aFYVoQrCmomfBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX3wZzcFtDkr9g
 7aClQWkR/++tds1HKZiSccinK8qLzFNOkLaMJqM+gf/QXrlMc4aDlbL0DMf83c8+376CZp2wrum
 bFK7H/MFXUPYFADdHuC1b4+caXJ7R1BJKo2oXAV7bNdwDyX+3dgL53GoXcyfsNov4cAEQAfy8jU
 O075saPlTmdW/3V5bBn0F2WbEKLwROKuq/ZieBDV472cDNgALhSyFZoRYD6eb+H1E+3kBYJVXkH
 OyQZEIyyrVsTQkNmRjNjgINXV5Y0pG+2Lufvso2JsCqSzw4QsabOmZQPdIRlVaVCz16Imo3uyhk
 E3x80BUsuNUCozqa1Ad0UZkoF9W3gGzF0eYkbvZxIK6JYprGE/zG/rEFBz1x20jLEfzuhkju1Is
 9UKIp1UO0GryZPjgBGEX2Uaxl9/iVgBTZ3skCrC1pCDAnvww/00QXbh02l3dIlFD1qyp1P7j
X-Proofpoint-GUID: ORZguEYQGLJBH5e1q1aFYVoQrCmomfBJ
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6886531d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=958 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..d25dbdde7dcee9fa3f1bd48a38baeae0f063023c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..e6a99ef50b9b9ade9d2a71a14fcde429f8076dd5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -857,7 +857,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


