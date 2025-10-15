Return-Path: <linux-arm-msm+bounces-77297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1CBDC871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7939502A2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315C63009D9;
	Wed, 15 Oct 2025 04:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBW3ymbR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B62FE57F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503222; cv=none; b=DDfT3w/Pd5JTqciQ9FpoHCP7MLgWdmfU+S2+1t/LsD9XjvYf4EdAzwqLpRJqY2Z/zVdvZU7w+rt+N8gwtnTHpBTEPGSeLbOfGSlMsx4ERGs31ZxXXWGd5d7AS6mZskgdQ9U8eMpZMo3PJyiBpfF+PBJV6ovhWkwOmrgmRYEFbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503222; c=relaxed/simple;
	bh=1jBpq+iZuKpAQm2NP3JS82veq+AIv0X5C7ExNAj56cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4lVBCWAC1aDhf4YXxVYLcCTVfYrLo1IxDUbICKvQWv5RVpTMSfvcvvl/l/36IYXMlaADRMiQD2nuBzicWXEV9Wfw2gYRvqFKsQvXnFvl4kxzZGd5lkc3i6VQrqmvYr01qRulDxyFXVHdwBu/T1ZHE+uNC/7Vwo3CgEjF8LtDcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBW3ymbR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sPvK009987
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=; b=JBW3ymbRgEgRQwk4
	9rv7Ah2KbwTKe8OLqPy27Cp0xo0puRSYiInyXzZRHgaQXIwUp4kZuFgOmmXSNQDv
	fgrdEYUug1DjCytm+MVRhv7IRAOgU80iQqLoc3MBz1hXUAKWjUJMJyjhhUgL7oXa
	d/4s0t87gs0lKiXZoEDXfcpBOSiAhcEaiUII15KRlE24WuqqiDlvUevOOZ/KToVn
	/p7HV9w9OjURqZxkSF6D3F+E+6s9ciJeoxgBAbe9zfd9vdx1WH1Kv5vaw8mYjIhk
	HHEecjNtC4zd08X0okkke8BMqS2xNBo7hqW/+9732xCMhSjptXSiyh31LKY2waQv
	PWBZfg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c30x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:40:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-798920399a6so551579b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503218; x=1761108018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaEbjaznfRKEBXAo6DFolWZjwipbscJpuOwEOXljFb8=;
        b=X2E6EsvANbQQhyf72Y9qPKl8OXgZBFgbqeMeh689n5X9rX7+8cUqs/lym7xwI+kAtv
         ENVKdYrcUZ+/MkVnNvHCS3h1+W0P9mxfTZpz6ZQ8Y/YKPhN3owTWbs9gFJXPbkXluj5o
         iN2mJg4ZXm74SG3mBvpBJ5LZaTpQVFlTBEZdFTW/z+LCHbRO9FNhcqJw1rmYD6CtP28S
         NpqUNGK1RhqGcR/N4LyK+yalHXbzc0GA6bYQFk+YUQMwzpCyha/29J95oE9nArcxJESz
         noh70PuPaQ9TaNRXP4Oe4Nc7Ao3LkKJfVwdmJmPgzTwl1NykrAjwa/gDXoNX40ekc58N
         qrBw==
X-Forwarded-Encrypted: i=1; AJvYcCVIaKBom1ZYNUIeeZpHNnIgYag9FhEaTILraLQtm3G/MucArifevwuUdXr+8lTfunt8jSqFgQ5ZLwHGlAKh@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMWNzYjpc4akR6pMUTEpyt6kR0fzfmnDPzP4/ZD9OTJCIZkDj
	lbHADDbhc5m2LsmNj6mSTXsc7rkcWvZolcaZE7YB5KG1LPnsXo3N40c03o8uKTuadT757ksfs6C
	My4x1R0p7aWPzj7zywfXbiP+AYLyynMFD6pnCPpdXztFrus7bK8/2b/POcPpH0PpatT/s
X-Gm-Gg: ASbGnct/J0qKBtpBEXL5wuig0xUsuLax0af8WB8+pAMVI7aE5HCbVe38TivSK0amH+t
	5bd/Fz8g5kx4PSvlWjw7wGK3N22Kb0avLR8tXOp5lIZUK2bd5/t/nOPNIKlsoQvBnA6S4gU3I/C
	iH0tOJqcerpQDbQVcpyfp711qDA7cApn+TP8/4Qw+sYlAzmc2kc92tfNZVwcwIjhDzvw6nRVHGK
	oFHiT8eEKGM+u0G5LOd0aeKLUEH8ESiZDZTOgymWLRleJeOhzb7IysZDRnlNMk9U2ykB6IePvzk
	EL1mBKsF0zB4WENPU05C6+UnW7vQndgvO6ouZBQNOubJkBSPaPHgIDVA8fRKKYEn20r4fnzzHvI
	l
X-Received: by 2002:a05:6a21:33a8:b0:327:957:f915 with SMTP id adf61e73a8af0-32da8fcd0a3mr34162500637.24.1760503218179;
        Tue, 14 Oct 2025 21:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkvW707uWwbvXiG8keTQAlZReMI+HRsSwGyMxnWPsRVW43EYNt0vrSlWIfI3lMvZSsHDMDGw==
X-Received: by 2002:a05:6a21:33a8:b0:327:957:f915 with SMTP id adf61e73a8af0-32da8fcd0a3mr34162469637.24.1760503217682;
        Tue, 14 Oct 2025 21:40:17 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:40:17 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:26 +0530
Subject: [PATCH v16 11/14] arm64: dts: qcom: lemans-evk: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-11-b98aedaa23ee@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=994;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1jBpq+iZuKpAQm2NP3JS82veq+AIv0X5C7ExNAj56cU=;
 b=lQ4o1jBsBU47/mjmjh1XOZfhtlXeUXvjB+DysCkst3CeU5k7XwEFoJFmc2egI0sxXbtLJW/nZ
 PsyQu7Lt+Y3BbUreCtFgJMXmjQg5IohsDBovTYY2Fnxpf8sWNtEl+X8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: F_VGTNmHaig1wQOJZW0gq9od8CeDEmlZ
X-Proofpoint-ORIG-GUID: F_VGTNmHaig1wQOJZW0gq9od8CeDEmlZ
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef25b3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JGo1Z14By4IpQyqbhUIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXxygCr9D+aolq
 M+4TwEaNV6yKuwDEI54uMuMNOtmyD10zurJLNxMYUpV2WM8Z2S9csORG+0M8HkaSitwhRSnro6k
 svwOu7XyyvNldnwFrOqiHHYNOnPbdUka8e/EPvfnGfSYaPiCMlTapvh0unCRWZdICBX0YKWYhLN
 4/y+GqrlbGLMgwLKo+N6nsAn9CfYKDyyZrdpgqmo6s3ynWN0wyoGm19ptF9MlRGZK9Id21Xhw1Q
 L5FkvRCDLWMFkq5wScb96BVgWd7fnPinq530o050iL92CQAyugfSHMco76V6U1wSH0/OsSa5K1G
 fCC8KZRhnZ7+uIK3fNFJcXDkLVjjLCnlQkBzhy0ZOMkSlK/La9/KgO0oSDCbWGdm6sj98xc3aEZ
 uaOlcLJhZ9aDGxndTPPz7aSB0izS3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Add support for SYSTEM_RESET2 vendor-specific resets in
lemans-evk as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c7dc9b8f445787a87ba4869bb426f70f14c1dc9f..09460441888a7011ff613c4fe9fa4b6872e12172 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -587,6 +587,13 @@ &pcie1_phy {
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

-- 
2.34.1


