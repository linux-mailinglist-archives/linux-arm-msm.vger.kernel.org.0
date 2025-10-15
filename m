Return-Path: <linux-arm-msm+bounces-77295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEFDBDC862
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BD885020E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C202FE057;
	Wed, 15 Oct 2025 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msPOCJZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57BF2FC025
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503203; cv=none; b=do3Z7V5YtQSrdiBUEvRqeS+BgpBswkqcUMbVoQ7y2Vjmn2RMBdChdx7zkL/LLVExM3zjeg8kHmPa4f5qQhQRJFw4F4BhFANfACXjm5b09Px0qF5s5CUx3Rl47uwU0l9omsSn6LXS6nea6z6TEFBNLBTO313xAykxU8Ov1pO2IJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503203; c=relaxed/simple;
	bh=BQbA1PfTf4T3catTnFJyQPDRyKoNlBdFRYRrfUNeAx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ba/GpeEiRJPy5OrHMs/2XezGh3HSDWVTYzVRSxX/jA1ZXuRAaxh6nGYgKKXqaQxI0uDCiaFL/nCEzBRMXemSd3cpoDV9nmMDjAg2K1G3zfvqbWSt2irApLlOkklrMP8/rgl0ZSYfMRYDKrJudYJmXmPBbiC9MR50fXouPAERv/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msPOCJZx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sEBk004155
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=; b=msPOCJZxEE3uULcc
	MC+h/g08u9WGbFghGMnkBDqCEUVs7YqwOkQPLyeX/JOhMaQmAAmdMrnJbudQyrDf
	hat7XaOi5Q99fxRLeYhocHYd70hVqeyC2UOTpCVI+X1NYHE69htytLFg0/BNYgkn
	RgLcHWeFUckj2+MDusmTrcIpxkj7EvX8/psHeTh/8Wrg1uTUUwuZ+kPDDCq90jfX
	uH3u6/1Bf+QXk8K4iWtvZqlVnDbtsEV08qzAhuay9tuQVdPrS378lCT7yWgNy/bN
	PHOXTDP6hZ2BDIqHNOs+Phvbvu7qpY8ak/HPhrLIpT1XCI5V7i7HrIIPbe5C4d6k
	Zjg+Dw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwnbv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso9844543a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503200; x=1761108000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=;
        b=u7ZWtTLRkY89dwxfZdN5fpvJi12v/yMLYgQCYstkQxFGpJUR0mCyn/SBCpZ8J/sWld
         l7MDKQkoaVsqcaqxNJ6crJ1A2uNH14qDdSVCln3Gd2r4G2Q9YvYOk1p1C+2xzDLWiGAE
         MHhpX/R9W5vazk45UrwKkcpt/Yu5fNtJflBJlVVISgfeBRHxStkCobKLaGrkavuQnFx1
         13N2+lvrj0Nwjb5jtAUWabhotnSossyghh4WpKVIG625PXIV2X8niAnyMgh1xkopcLgX
         w8GmSW0ZqU8Io0kFalg9bR3dwvFTsOsq4g3UEQAvR2Vb77EiAxL49Y4Z5s8z9U+MN7OA
         Epxg==
X-Forwarded-Encrypted: i=1; AJvYcCXGRUldep3BmOKEtAZqZFu0e9SuoG5ISM6doSaPZ/AE+G6DdKnRnaDmBbpSkol/Qt2boT+Hmo4SMSJowzhl@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6X+6RczKqAZMq07e4Daot3+R4f18515Qt4iCe6irVH9DaOHb
	9LU+AEU7QAtcrxZ9PuDECU5B8l/QBAIYf/Bggonq8/uk6I9Ke44mivdztgyRPCN/k4Llf4mw58Q
	40wGPWoco2R6gd3dfKTf3hKTmKmbqha/qwS+1vxpn5AXMtFSBolsqvQWDe8X3w+8EYEZt
X-Gm-Gg: ASbGncvjGI7vFiGdXCAiMSnMWc8BBnrjQsgbzQvnl0XwYu4mLEgoZHK0l1nHIpZyOBP
	uhBaQPnFW53/jVnlc06zQvhdDy0keVCCRbVvJto8osYlKTs/Ksk1WCj8vffW1p0ZnBy9HuTa/bQ
	Ttuv+AemfxdKun02APfb63/npfnMQktD4vlHDYMkd45GGmnatj5C3XC4bTxu/ZMn8FdqT2QMw8w
	c1E1fTYuTj8vcDRCbnisKlsgviir3eTA7t8XU2TOihMIjBrB92XlugbSNirM2xgsZb85BXnRfRC
	sgQH4ocdKYhvvDFdVTUOsOaVZ7XaZq44O7uJiBMbV94sHJgNfMqimMw8WGR/X/pddxjIiaNQC1u
	K
X-Received: by 2002:a17:90b:33d1:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-33b51149957mr40663625a91.12.1760503200047;
        Tue, 14 Oct 2025 21:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhSUdPcBNtpuWSbeLJvXggYqhWYI2i+smtNsSh5TePFlbEjw8lNbvl3tdNRydAZ2+8EAKWg==
X-Received: by 2002:a17:90b:33d1:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-33b51149957mr40663569a91.12.1760503199250;
        Tue, 14 Oct 2025 21:39:59 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:24 +0530
Subject: [PATCH v16 09/14] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-9-b98aedaa23ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fkRav5QA/W0o9Ycg3/xbut6S1Npfgr1jXzERBrOotDE=;
 b=skcrZstdabB94QPMmNvmUBmgXo2iDP/K2PrViGd7XleSuwoAEkPT9UvVVi5uAiw0VXmzxWXoP
 MuzJD13LH3EBKpAvsTX2o9knFlhccW9FSl09RtowPFeXjC+ycWwLPRj
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX6YcsvtfxRIno
 yI9Iglm5GetZxrPKeW8QXhK/vXUcJvWjGITtsVo1RSiBjYmvw7o+2+RPULfQtuXVj3mMTcx+JpV
 NCeRLjN1j5iDzbTWZ36a1I2jmJtE4TIPpZ6xwNDXcTAqeADEI1Na9k14ObS+Chm/B66hrOKJKhF
 ajpcDOwfGTNnaYzy+4ZkhTPdJnA4FztPjPR3WWzp1kaJpOAqz7YmpIYwZ4aMGgS4EjnRS7CzZQ8
 aT/HsFc0Zqd70DyDOwt216/sDrmGfJowObvnBUC8EBfRbpkpW3B7G4IHEbwsCbsuBV/aaLAVWJm
 K0annnACzWNx5JyVxuVuUuXdJvxthTMpFeWb+BuiNBeibH7Rm5yfAmGt11lSSMorloA9UgYc/RO
 GltpbTdqawBxEfjR7rPL85SYkBaOgg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef25a1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fam2_ewT0rYcLGv9MBgCeDij_ShCpQpn
X-Proofpoint-ORIG-GUID: fam2_ewT0rYcLGv9MBgCeDij_ShCpQpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001421456dc85547c3c711e2c42182a..f38fa2e52a635100a7505c615c0e96f1111d0b5a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -975,6 +975,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


