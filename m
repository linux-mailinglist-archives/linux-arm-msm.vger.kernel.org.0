Return-Path: <linux-arm-msm+bounces-64328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B7AFFDC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCC91C286BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D50A292B5B;
	Thu, 10 Jul 2025 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhOfv43e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D788228E604
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139058; cv=none; b=X9BO4mhlR4X2y4IfCG7JjGUxSI7ypTqp9J1K4j6ZhcdOHhNcwWrSV1lL2pjaOZ77AY8yRTLmkFOaT25d5NbcAEYnW5Xv2d3o8yHwDz4/GR7labW4DZNI70yHwp+W1m4OypzAsPibG8jsq8CaNLLmivM9aY8rqJ4YT5wClaa7Lhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139058; c=relaxed/simple;
	bh=WRPvBg2xZwSvVeD0jkJE2F2CXCNgW24WQEv0gSZ4OPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3qa3T696qq0ZU8xIZ4IJY099R6zR8k9Rb6gMdvL3U2SAzVvap8dee66Kibac3/iUvPXNi/ETXRy0GQ3Z5GMHhVjFhgFmXOjVzZavMU1B2T/AfFaaUvC+XpPZNEFwvnj4Atooj1bWvbDPNF7+LN8K+7CwLcfeic1sl5BOZ39nAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhOfv43e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A933Y1031183
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=; b=LhOfv43e1mI+3rdy
	MtydXTK8trGflHcht5g6SX78LUPNwCXfdtA298j+BxH/JPAD9RvXS80ZufPUoHAH
	Rx+KtMNwiNLV2XoVcZyQT4MRrK7zmmoW+sggNLGpPSCyjFxfULRd2nThxkaqzWAg
	+U9UvWbcN5kAt9zbo143R1POcWIUvsCwUWNhPbbjgIyq/o0kc68husWRTIzUEPqG
	/4xAHa1uFkYz2RnMyGSEhSb57YdSKgOfEpsyAfoOgJF71wMfYazlTB6N9GC/dxdN
	IiQ14FVJS9bJlCtQ9JhS1Ii4RLDjJ9O54+W2XapvtazbIbGXzOozVR1dfTKMJ3sZ
	ODBNwA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg4b42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:17:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so1049929a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 02:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139055; x=1752743855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjnERpSzmYvkUrDgRq9M98U0DkVLcbK7HnoX1+rdKUQ=;
        b=G6U9udBDCy/v/5Y8jNT1WQXiX7Un7SLvQMR4Z+WVS/zVzMV1xYHS0H3RRiV9ldoANu
         wmTFnU9Qo26E5526p3j5wM3ggeEq3jMI8BWOettujLbm06XIabX09FVzn7CUti9srDnw
         KGlgYYyprA04sgx2ZUhtfLZbgptJomBF6CLrAk/mDStro9dU+utndINOvoJZ/S4xCti0
         jlk6hrUXWhuTE9P+pNUPc6ZyR0taAdmhsnspeatHY2unF9nCohbCYh2Yzf6MeAKryPPk
         Ad8oYkaZK3bALpizl/zF3WOQmNC/Bh1OvLUtFPi77d/EzqibZKwdfyuZenK8t1d9mknc
         Eeng==
X-Forwarded-Encrypted: i=1; AJvYcCX1xGU2Ofdr0FQxcfSAagQWy5ux7Ho99PtOUjSXlxLf8R/hbX2xt8m3OO5RzbdiDB9kHq78Ys79Ca1tK/Ec@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFj2j481BUtE8+b1rT1O4rUydeQ/XdCgSrDrlQv1DjcLD3aW1
	6ft1gBLyw6rWuZOqW/xZlOL9ahuzmZF/j22XSkBcwbUn2VLIy16/R/2RT4rjv8YHZZFkGbiChuw
	JbnQLGc7tqp1nCRHXNXePA/5i1zOQf2VuMsUNHcSt7uxMFjeA7RDCJFwbz7o4r3dj74TY
X-Gm-Gg: ASbGnctCe+WJXZ9tCiUQnsFFXtSB/Sce9hjwVDjP/tgqQ87ECNdigWusXQcPX9jw8RU
	o3wmY0uVhG/B5MP2tYdCtDk8VFngD2DtLNtVaKANFHfSMztj+cn7pz4PofucaakZPL9p8gvB7+Y
	r9SN9Cr+B3KgzFpip6RZpMcyfsmXYoRE7UUTiDNS/FNuSGTTklFkd5ANyWk0Iq1A5WuZSk/pcC6
	DIbrlLBFQRJfTIdd4navqgzOafs6jcEYq4b65GwNABZQWutiXAUJancdnBLp4RQzOOzHE/7j/Vz
	iTaPeshKrMIyCGEmaIKtFk9aGs36sFGlZshDoEyieCIHOrNiA+1qFqVLn0c=
X-Received: by 2002:a17:903:40ce:b0:234:bef7:e227 with SMTP id d9443c01a7336-23de480b01emr22477405ad.18.1752139055200;
        Thu, 10 Jul 2025 02:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOJVHab5T9iz/Q1OPBfJ6QDcI7he8gMDHrdEtDIQENvV9ux+bR1aR59bdZF7+Pu5JDOhCy3g==
X-Received: by 2002:a17:903:40ce:b0:234:bef7:e227 with SMTP id d9443c01a7336-23de480b01emr22476875ad.18.1752139054755;
        Thu, 10 Jul 2025 02:17:34 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:48 +0530
Subject: [PATCH v10 06/10] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-6-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1684;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=C/j1pRyxrqegE9+HlfozjQfjDAmabEKYItoLHtiCbfY=;
 b=oe8WmAtH5g0NNJLno0zytsw/dFU5witrI2BFN5XbefWtdYq5E2r0zaV+zXXXQr+UPw9ahC1h0
 tBeRlLEJRy9AsD9sm0fL0JabkRyYC2H18E+hF15CP1nzH43tmkUZ5Im
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f8530 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rzkh05IFTCqOtWkwyAIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cpWw4urvoJmEacYfypcukcNWM4LYCSNQ
X-Proofpoint-GUID: cpWw4urvoJmEacYfypcukcNWM4LYCSNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX+tRZkiq8uy5/
 aUNbFq1BHxlJA5gfKIcQYUYa1TFMB2wpikH+J8vfCugDilO6UeOBe7XLyWtqV+PRcbT8JmgipMj
 ESc9JDca9bqAFyuEYIS+C4eA5IEHw9xtFBPrzisgs4U0EHVviOihS/voZtsflVhueFUduSvN6Qp
 r/NXR0rI+Td90RMuLjDzhRobmpr8gB0iasZK0zWF+ch2BmvZrSttRLkzYfcQAgQvymeDvIRyGyh
 0GqfHqc0uOWGQrr4h/aaaCYwrV3NyEepS3erpeLJQJKhatwfKtjLeVEPv2OsxtcFFoaclivMoaL
 Q+DceHArIf5uuiOBlPcSEWmFImcYFukXiJ1Vw+GHEJZFqLPFeICI+XhBNyrEA6FMaRWf6df2yrZ
 l3hydR8A4E+yswudWfQFd9F9i324VZSX35HDigDTlh9Jx76+vfSfZ2PeC4xfHsOHB4MihsJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=862 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

qcm6490-idp firmware supports vendor-defined SYSTEM_RESET2 types.
Describe the reset types: "bootloader" will cause device to reboot and
stop in the bootloader's fastboot mode. "edl" will cause device to
reboot into "emergency download mode", which permits loading images via
the Firehose protocol.

Co-developed-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e176390faa3f2dbe419f5cfa62f0d..6de4b140ed10b0da72f3bffae524f65406d8f571 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -654,6 +654,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reset-types {
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


