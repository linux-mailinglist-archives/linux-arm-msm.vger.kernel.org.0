Return-Path: <linux-arm-msm+bounces-74432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B20FDB91798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A67CA4E239B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5A930FF01;
	Mon, 22 Sep 2025 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ab8DZ3qS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481A30FC03
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548533; cv=none; b=BtVZsHBESZccX2t4NbQi75SKMZzzAbvx3Qhdkl2/Y4FplmXWVK5iGnPOSMnRAQgf+cshXR4r27WtJJr1qyJW+FonpYj5zDUm0ZVIDbTjFidXn19zFZ6DtU5CPgAUhOIyGlgd7AIRqxCD6F6PSKBgSDhvQ7HewyY0VjBXCPbOeZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548533; c=relaxed/simple;
	bh=QB4xC2r8HSjzjCt03b+mFUm7g8ywQrhMCL5u9OFpXPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+XbqAMLYxsaCuXD0kEe/T7V1+goc1xMUzClPwAiD2m+2I+nkxu8wnoT+8sRqvHILw94XQfZnPBVOJlgu3w1kTiTqbCkNmD46uVCAFxp6/9W7HpVmQI//pmqmYVxu3wLb/RHD5Fv0Q/p+G44k9do3OduRhDfus54bM6SDmP4HL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ab8DZ3qS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7pE6V006016
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wh/7I9nc7TXv1Vm06bJQFYN7WbWsJIBlNpOLoUHm6eE=; b=ab8DZ3qSguQFoTGW
	kFTO66q2di3b8ZOp1YaEo7vrzMv+514XYEISEu8tFMORASuaVhlVvXIDM7jYv0Y8
	jRI0zqXWNLQMjZWRib7HajrSWUS+11KEKzPO4xoQ4k8K4abCG1iq/IAKsGTmd2bT
	Pvat4Qzba6YaCfSu59iqqO7bblemphQ1CJWgetvHzlwx16aog4ynQUXJ5HhY0QVV
	wmvtcau9tXo0FqDTtk+D/hTEJktJ4EYA5Vm+vwGpoO1fmKJWnOSLwcL8mK00S16w
	YZpidBU51waE2iwIJFhQkBKIFSwNVaH4lSSLegMeRuvdouGAP0ackfSuJc6v7Yay
	GK8jSw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e112vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so7727615a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548530; x=1759153330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wh/7I9nc7TXv1Vm06bJQFYN7WbWsJIBlNpOLoUHm6eE=;
        b=XYhrvMz2shH8xFnrEnpj8wBc2CCoqQegaYVV8H9OZj9KVb5Lpy4S3P4amDQN7Ad6KA
         6iMLSt78VKZdIcp0lVWMFQibAW119UGofE2yh3wP75gqgxGZ86gXGfO2XTJchowxKZF0
         XJ4m9ZSNUHw490693wUo3tQ24rkG3i/bpBpVp0Y4FmJWFxzT0YCP4f5I663k9Iy0/coA
         zpVKzm+T2WddFz4fEX+i2OyZ/ICB5Vgnv7mZZC2h8ZwAQxb22yKJNfUos2kTbhlJrLRV
         FMS3qFvPgBvvGhFBbKMFyk3PAVOeREoaXGkb8ndlmAVOu1zwDC3JSlu5PhE+v6DpUprH
         1RjA==
X-Forwarded-Encrypted: i=1; AJvYcCXz62TLbYu2g56rgpMShCcHcOBn9V+imsOYuy0w5KhbKqxMq92+5gaHuhGs5mlId3zX7qBK0zWZ0O1HVPew@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MPCAk9HafvEwfoAaEjXU2dhYeMSV+OkCHd34HX9T6uvYuo6+
	b+LGJ87q2SZqyJ+FQE3I76CeANl57VT8nXXxaDnQ7O2qB/4+lVTSisYvcU60EEuJYg8sc7CzHtV
	KEQllt8J7Jgidi2ckXAkcRZzAk8pYOk1yK3AOspE/lK+r0ZT283CbYVOGmfrnjQdSDZhy
X-Gm-Gg: ASbGncsgQoTcyXYEC+2MLqBV2ePviguZatFtznY4K9+CUzfQTz6nIPuCkGljqDGRcAQ
	mPzzauUtJoNCXD6u9wo3FURpC+UJ/zdr7XaThRbYMtcp/z7nMOBhLQ2QBvlRI4LHvz4HlCmL15w
	epJgbLB8zsdZpNYOSss5YTI01qFefnMxxI65Zc7J87f06wskBCbe13sJYOko+z/m1+8Q7YfWYSG
	kYxpheXRHtkw5b144M+Wu6a75lYym/5x8lbncKqVLwF+N8SMWuZHPlaomCBsTtJKuJjls2FX3Nc
	OjB1MIZuROBiWgC36rg6oWgW0JfmAiOYONWTZJMYxFLWYN8IBkw1dK87lq1i85Vu6LxDAygyGGu
	D
X-Received: by 2002:a17:903:f86:b0:267:a230:c657 with SMTP id d9443c01a7336-269ba447e6amr190098975ad.24.1758548529910;
        Mon, 22 Sep 2025 06:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpliuhHBSE5mQTDz2xt7nLTi+MDrburaFwR8LKRa9AbeTGPcx5opIE8WzGuUVQXBbgbn8g4g==
X-Received: by 2002:a17:903:f86:b0:267:a230:c657 with SMTP id d9443c01a7336-269ba447e6amr190098175ad.24.1758548529471;
        Mon, 22 Sep 2025 06:42:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:42:09 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:20 +0530
Subject: [PATCH v15 10/14] arm64: dts: qcom: lemans-ride: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-10-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1694;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=F40UDJXOJIO5Y2uSSmyA/SwLwR5DxDqZFVD3o9nJtHE=;
 b=rvw3vrmSYr76Z78QZ7Ue0WKvVeCRs7jqZ3VeZ9VGFJkwFAAlLXQ4vd/k5os2ng/2rMWfZ/L1S
 +4jrGqxkOyDDsDg1MwLjnE2Ml+VRwxJrecPL7wUifnKqeiOCbgiaoK3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfX98OA5OS6QSjY
 Cur5IMNdQCfBLcqDCx/ulCkAZoIZJSZb+7FED9IJBkUpHq50f8TaYm2lv/2MRYePSMdbtHlaYoB
 doBvdbUKpUWn2f1i2EOL903qk2iBvFQKyvAkb5LdveXFrgpqoWCqcwkZ2+Nad5xw9ICEmaujklX
 PZK3gFIaHCM93INkr3sfRcDl0UEOP4d2DE/iEhLyaYcDtlwMNWA1J8PKuip2NXFLsDshdNEAjTy
 QswZs/bQR8ONhhbwM1NX/C0wQqJ63mMrsie+bO3BCk9mCJ9CvMZGBWwU8sGdxqcABDLzBrV3plH
 L1sFmrsFe7Mbg6yjK0+Pum9OAIs31T6xIrSBfYZESD7ZUQMHMjFDd3SXty9Zjtquw5fzn8/6ZlZ
 VhoEJRKi
X-Proofpoint-ORIG-GUID: FURQGGwleiRHIGaxTrcvFBGXuZ5Ik8qB
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d15233 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: FURQGGwleiRHIGaxTrcvFBGXuZ5Ik8qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076

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
index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..586ce54a374d5b3aa9d87a673471a5a25410a9f6 100644
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


