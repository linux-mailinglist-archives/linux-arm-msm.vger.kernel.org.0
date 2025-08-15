Return-Path: <linux-arm-msm+bounces-69381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F96B2820C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC235E2B7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 14:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166CC27FD7C;
	Fri, 15 Aug 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9Zqoocq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84178242D9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268657; cv=none; b=c1YGc3BfKBz6DMgihMlKBZm6sdvowuI/5R68lE0FFLxKlky5erg2INTluQV+6u0mvTmrjPnmhNZaXUXre6/DWMdiw3oQj3DIDaukbTW3Pi88h6VhyFo6mkG+JfquQkgG2dIB4PeBv0HYR7vaLIxfacVyiwrIvjolnV774NDsgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268657; c=relaxed/simple;
	bh=cDK0uRnpMgSKSIzk24D2d7W3Iv7lYhf3EwNLLYWok5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiM/Lp2cRMZHwvgMrlFJl/sm7eINIKZRYF/JGgI5ulAdDivKL8gaYEfdQlgQGcq/eOCzZFDaRiPDG8cS4pNhJN2DGiz94MRxkwnLod8DJs4uuro+pAiUfjfm11rGNPIMzh4UOvw+Kz7LI0ub6Fk8HmQuCoWDBv/zhja8jk6QJFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9Zqoocq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FELfjb026633
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZI1ulbnp33sSmZzOl/WukD84JC7rm/wreXUDUVjjRA=; b=H9ZqoocqVzOu22rQ
	KmYlkKXCct4rsXUqtMwuL99d67dAemPz3Z4ECLC+DfY1v4FUHx5W1dplPUt4mS3B
	k75VEJqDi7n8KsFPDfJuTBQEXS0IcDQeXwRPZYKmp5n6ZhXSKK0GJiXn4aFJnKzI
	tveMC5u+gh9HdfHrJPWADiDLcMMfrztP11sMbhkKm3OzoBCQQeIrvbzBqqRyc+Cp
	9rY+wQPz5YNHJ4Z3K5tLalxqQEb42qrTPOCGZzhQQAWQtionjqMaxQ3GtzTXBROR
	V7HDgtcgAelaQf9acbhrZx3IQ84kN0avR0bIUAqX9utq8ADIK27dP1qLambGa8Bi
	dfoiPg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmk7sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:37:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174c65b0so3324053a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 07:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268653; x=1755873453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZI1ulbnp33sSmZzOl/WukD84JC7rm/wreXUDUVjjRA=;
        b=diKLXz7B3PycWRb8R0tKfS56IKt4SRITNK1gIQGma8uGlRg+adT1PoxM4FElk3nJF2
         bVq9evpKrHEq5tTodxl0LGHTiO3vX+pvGIlI8LQb1NnV2JyTiQcCvdvCRzBxaXr+baM1
         +A7K4bj3vuXOIv035eVuAVv7CcWYywBa7AvQl/Zg5HHohiJmuTHyhorEVGk5rklSZsAV
         weCYGu8vzVj5ttQHj7MEFRgkbGwZhdjj4XlbJjFw4RdqJ4UXDFRQUMrhSQQPvlTL5ZrE
         n8NnVfenc+T5+HuNT5OU0NuhUpsgjoTK5WMGAyyBt6t8zRqAS8qfdat0bkD0qUFTCHBB
         BnQg==
X-Forwarded-Encrypted: i=1; AJvYcCW30uOruIddbTrXRyyNsJJ5lBGyjV7hi9MU60TXGfmGcNu88C89SbKgE3RiIr91+oNT8Niuqh6iGM3OyQ3I@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yK3EpbjEqXV0+Os3o8HIwwtrg9jGqEyacsbkTaKawP88scXg
	he4ms9ZeErQ1sVR8Le5NQ1zmqHCkUazwCk/XOqXJsWQ5A91zX+mqPGsLrfcveOF3bnB3zVRZJZM
	fE9m4eGE63Gk+9nvR9/+fVxlhEhJxFxns/vrctZupAPJa+vFDwi4sfarAs1WjP0RIWZwt
X-Gm-Gg: ASbGncvGGiBczEKjWz0kJ9kyrCcQYeviu7S8JgdQE/rwkNhu/r2Yosyz1uE9/oNo7g1
	tGgYKnDZHj2zQ8BibGwqp8mz100BgonV62+k3aRm/Tezh/r7G04CkBDJcF4CjNXkWNC1P3wwStA
	zgwi177SJ6wrPxKa2eOLU7LdiHdxhMv8uUrYCmqophZIgO3a3kW+jzlVfR1YImoEKQ+cBN6ShsS
	EkVTEe50Cz6O+22DPxBjHUicg+egAlJpQUd539jXoph4pYxcbN2RsMo0PQgD19/kj945KytjPId
	dTtryusybIYqWgxo6gs5JsjOvLCkEBhbyNm3gpD8KENgqcijQbgmlmVDQWZ3g8KzM18URxF3HbJ
	E
X-Received: by 2002:a05:6a21:3393:b0:240:1c56:6495 with SMTP id adf61e73a8af0-240d2da1ab2mr3983862637.14.1755268653310;
        Fri, 15 Aug 2025 07:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGICSeKOM3amu5cDfHsCt6tTSoS71zRuUcFNv7sC0jlLIlPMtqsbosekt2XumDOgR42afsnSg==
X-Received: by 2002:a05:6a21:3393:b0:240:1c56:6495 with SMTP id adf61e73a8af0-240d2da1ab2mr3983814637.14.1755268652889;
        Fri, 15 Aug 2025 07:37:32 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:37:32 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:13 +0530
Subject: [PATCH v14 08/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-8-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Dajt+SLbZYuP9ZjHPqwB/7XOdBkGsUiHd4YnzMvhaQQ=;
 b=MEXYaGDuDuUFhmah2GQbSrJ4wEfwuNgDwr1BX5PcCzsPjhFaX/Ovj9lBCsR/tOhqe0QLmR7rY
 mE1K9DazWzSC7lUWsHUgB371f3yxxZgg08tvl3sOq0dw32CLkCKQbcp
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX/4dtisZg9+Rj
 UK2ibhmTCjqmZn55qsw34qgbNEFw5XbliSNKf8oChM/W7zdCMelKSmbLU8RKCQ/iieuNHTzC9rM
 mAXFP8ZdeAVnxJG2O2KW/a103Cu6tqTeYXeq29Qig5xfR9kTQY+O3zMAcHi4iaqO9QJlKPaI7ND
 dOMv+lhoN2DCF4tu5pBWxlVz0Rz8Av4lrU7ymVzTu2XiC7503IJOwQWY/m3Ug4NLHKw+VWOFnn6
 eBmZGedm16GZ4x7GSSVAWu1/WpJgiYKS3kJW0lrj/wKP9e4PJvKKOwESPYmXkXK1Po93lRyPeP9
 oBFYx1lG2tLMKvYQJJIr62hi3XIWAYzfO5lbmFv6GQcqQAT+dWxZlxIRk+P7HEXnadLhE+Cgqyy
 0EH+k9zR
X-Proofpoint-GUID: MVhTjWXmMg4S-Lw6QuCocrhdUL0y3Dgi
X-Proofpoint-ORIG-GUID: MVhTjWXmMg4S-Lw6QuCocrhdUL0y3Dgi
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f462e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

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
index 8ed6e28b0c2977b831a1f156014eb9d6f70d0243..51d5991a5c392d2b7afcb5dd7726a01ededc199c 100644
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
index 0dd6a5c91d109c78333f6b90104fa51fcf3bd64c..0db3fab9915b247d3c30d7484625fbd89a3514d1 100644
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


