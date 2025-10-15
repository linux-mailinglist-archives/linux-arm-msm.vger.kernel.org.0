Return-Path: <linux-arm-msm+bounces-77296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80399BDC835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8DD618A7EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F87B2FFDD5;
	Wed, 15 Oct 2025 04:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJ2lVrDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA62FE587
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503219; cv=none; b=dnAVX3zNwBG2RVrBDvSl3b4NRx5lswPWefGFx/wpxZiSxo9GdWxg+PDU5Df6IboPHTE/qb9Eqd2LTTxxlG542nfqrUPu3iIOCgE0Zp6TAj0pAzmQhLrC9g2ltX7nECsQQK/TJCp+4zz7FJVuWPqnqV0A/YjDto6oWWaxAWLfXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503219; c=relaxed/simple;
	bh=8y1cbYiQTm0ZvzWyKT9/o2jMFMOXux3SijiU2Wa3LJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMK5iqJ3yN8hqk440FeT1DsiCA2bKK3frsoaBblkNvOozqJhDOSpcgkAn7cSlxYyp1yt7uUbkgffhfC2tkA8WvtJnG/QayISXTkoxAITTmpfebgKLZ6RwqtUMTVnT7J9jmI/EXhNwrK9AXgZ4+mSOE7B7NDBfj1rc4bP+z9u0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJ2lVrDK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sDg3004070
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCB9nRmhWTH8UllODqI36LPvufsugmltxoeJ4FWith4=; b=UJ2lVrDKFv2mdGz/
	3tE6xJu17u2hUzwgWtYLuS8SgdIWLjUltTlQ7lc7hYSb4GzAkAt89zbcSIWRZYWI
	MstWr+K8ZerCcuvzToMDrInagM+61z7eGbdk5xiO9IMJcsY3ZuehTYC6wklOy3vR
	maoyzkh6juFzoLxZBcXnL00WQVTmEfhHXqgfB/+LuLl43zEGXyXVUQEvorTx/Ame
	fnL+qaVeQeXjbzGVcSlKRj+H8t74IYWCflb8FQHRpzq1vki+PND/UIh7RHujzmRJ
	z1kbjZe9kJn9CCE+ZWvZ8EV8TSY25CJYapBZFuMmCzFroinDTjsUUdtx3iCGIApY
	LmlLAg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg2wjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so12450441a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503209; x=1761108009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCB9nRmhWTH8UllODqI36LPvufsugmltxoeJ4FWith4=;
        b=fC0OTlgcYAqF0ktNiuFb/y0+wi90B6S7OagFtyU0OxzSbhccv/ZtGL8Sat2d7+G9cO
         lIFgacBPhYtWa8QdbXLue0kaaT+OgytHhsaougqMcrjQy2cCbAuKMKT7fAOu+HIyxtiK
         r27w00103Wo4mq1rhVzzq3+lpmTmBKjX0FkrgIPv1MlHLk/HgvOdqlLoUuuPxnVFN4Do
         pX6QyjbWwIx8Ahk2iF0ffrsEsVtxZp8zFlSfQFdmY/7x5ShF9d6Xz08ZNzG98OQmwa+C
         gakB3AdUNosicv9LipMtQ+j9AQISWC487+EiI8Rnkt++miWrpgm8Unnhy59lvLfvpYrr
         c51Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxm82IQishxzYZZVEsVNCuxrO467n/XSyIzLc2Is9b03fVZ11cdtIE0q5bqMyh8di+49hmHowz5D7xM/rF@vger.kernel.org
X-Gm-Message-State: AOJu0YzouRRye0w+uTY3WeFv+S5Uoq41HCNavWMNcJTwVaYMW4o+rSQS
	Yww8zfDInOOH1kEW+QZbz4xoWEt+B9tGoX9s/DDTsldStlLKY5pRSRcF3/Ix+herGk33f7DCyMC
	S8PoBTs6ScGmlBx63UuEZ1UOb57/BlSMc9nLAZeHNJ1QC3KOvYPhVrF0eAIUSw7f2UgfE
X-Gm-Gg: ASbGncuiN41FeaG+XABo6cPdd5xbPSZwuYfP//Nas6lSTHpsgy56POyWUTs/MvcMb/r
	K8L9VBwaAdJqc1zx5gcRo4WgRBKNopqKiaN+WXEHMo1eu528vwKR6RPgiD0OdbDyEjOynTUyyzV
	PFJew+Bt0mU3cYQ0hvoE0/IL0DMgBEKnfohwNWiKMHyW6k6T5vddtfmbpU6FP+wsyC7byK5x88Y
	bQ8OdKjQZBpTKKnoWq78tZ0Pv22mKwegqBYkVPnxK/INAVUb61qO+oeRcE6L/fhuxwmKM/5Rx7O
	OEh0lWEdfjDS9s1IrEtHokpCsjWPeau6HK7baiNYUMMqRpy/vYkw+/3SoMdtq7kpaOoFkT8Wofi
	R
X-Received: by 2002:a17:90b:4b87:b0:32e:e5:a90a with SMTP id 98e67ed59e1d1-33b511497f3mr39789323a91.8.1760503209222;
        Tue, 14 Oct 2025 21:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHORSza0VEh/h2tJOvCDq92nr7cNJeRD3CAUWw1vY0j7DXcuVHyWT86lYWW3ht2Z998Hh50Ow==
X-Received: by 2002:a17:90b:4b87:b0:32e:e5:a90a with SMTP id 98e67ed59e1d1-33b511497f3mr39789278a91.8.1760503208625;
        Tue, 14 Oct 2025 21:40:08 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:08 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:25 +0530
Subject: [PATCH v16 10/14] arm64: dts: qcom: lemans-ride: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-10-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1694;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zMGGltlmXa3IlmXLTQs7IvClVW6N3DVlsizb5HTNzk4=;
 b=mnbE1fUg3oN/AAG5P/p1NKe8wGnyvNaD6robxPZDx8SEJQg4ue2rPIE879MZJ/pNuKAMwNfVm
 Jp5i+BW8zQ1AQWR3vnH1QUsGiq9jzLsTbBy8Pw4GI6Yzjxzkmmz6g/U
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXy5uYjlemHEHA
 ijRXYs7rFaf6I8eUvltNycqW5t6VJs0RuJfnqCg4a1KWMnvyvWrE/w65pid5mON+uaON9aYIK7T
 6GVhowXcLTWzmybspBiZM2YWqclVA8SLqdYEoTFPdVyixQIsu2bjjETk6jyb2RaSVuZcTNfCsvH
 DXvRYJ9Z4K0jRJ12Uz/kjXsU8/mplga+hRD7KUog3UlVZHBpR6zuMVfKCjO5qj+34rFUXz6mPZe
 cK9j7eXlC6gK4Kcn5YpkZdoEdw2IZuzJ7tD7G0nWxHr0hAkXQnDs7sRZPSrHlz/8/XWghE3U7Oe
 Fulp8QOIzgan0+BokRES3yZ62/yxHWq73kSjACC57Xoks9l3qlwCnAwlL1rIdLz+OaRBNWZ//a+
 SsLuEgYVJCZQuhZCfcfk5QrvWr0PpA==
X-Proofpoint-GUID: vdGIdrZQmsDb7Wr3dchXIajWz_ENEqjh
X-Proofpoint-ORIG-GUID: vdGIdrZQmsDb7Wr3dchXIajWz_ENEqjh
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ef25b1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
lemans-ride as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..41ba0f4d437727cfe0c51e3d355427f37dce7f46 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -722,6 +722,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186edcade643790ba22f6a900beb85679..5bb27665cfa95954543f7a66ec424452ddeb24c5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


