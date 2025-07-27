Return-Path: <linux-arm-msm+bounces-66801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE5B13096
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3569D3BB0B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFC621CA00;
	Sun, 27 Jul 2025 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCssGXc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9921FF24
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633576; cv=none; b=l6v1eIp6Wxc/HxUVHPW4mUK7wI2gHHnq+xj+1Ae+2xBzcrjUiSE+ZGxoD7L2WEJRjiOfjEN4o28U3K4VtM50gG3jsrGVFD1MigJ0TMFkS20H+mTTqJcOqCMWKTHRBn12H+M5X5XmH8aXkgxS2HYWiCuvzMeNk8nksNvLcb+sc2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633576; c=relaxed/simple;
	bh=wwP0wgs37G7SIgdBXKyajalMO8uencXdkJwBMyqMQK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4Ybz8c9JLSHqov8BwBrihfgMGH7ijzlsQ4KBQrHrQ5d5A1t0ChDhwJakmwIxTtHXgD6iN+9ejJlVUgHPkDYOGgfmN2+1zgMNW6X1wSuSPM+QKwleFEgOD9Gre1ixiEKUHzBSBydMXs6SdMG8oa2/Zg2aUHDgkPfRqE9n+6RGm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCssGXc/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REQKH9023553
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=YCssGXc/+PcbODIr
	BXsd8GOGDMLCWgs7k6oqWgd/Mt+EYW4PYdHwCAC51JM3WXsGly0s2Xl2SWEQlsD7
	m062UagyoNwxlvT8cnTgO6jhxwArBz5Asuazzpj2LFiV7e7jZ16mjdXVtwlyMAgO
	sHxoKGuNl6xKDsPftS0vRgRwrXBlNxRw8kh+8II88bxIpWrzYXZL2AhLGC7kQY4q
	zEaj9iFyW0FuFbmofdYOCoRruS7FpS2RQ4w3tSrXqAeWbI4rnS9eivL1F5DsHRn/
	UC9VyBKexA++NL1WOE+uRXRcZyxKDoKkIsb/TvWyeWIPDym9Ni7FCpygFHHQ4AfJ
	D/xjQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xjava-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:26:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff063d087so5623315ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633572; x=1754238372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=;
        b=vNR7DTNi6CXMJU6yjdwKUY2wbsAK6VGyCPF1gYqqP1+PlL2qL3P56ATJhtZl4sC+ap
         uumUU70zlE8svwK0Ue3vkgIoSbX2MDtIvIpk7NNJ1oZEljA2ddQHgjcpdgy/TVFOmL/X
         +B/xZxm4nW7NPdVPuPpqNBlXyhMZCW+xBcQuSrgCgHnthFqNqz1MRXW6bBPvyt3Dpk4f
         Pe8fwdB4ydGv3k7bGoZ7m4C+iWjOgfLNMbB7uOE4HFK0/Pl4UFDybz2x1WXvYS4Hn33y
         5MfwMsfRODbAj6zRNsENWq+mPdsN52ymu9a8mXPMbaP2f/GQLK9xPz0JmQ0UeHgqKLKI
         rFKg==
X-Forwarded-Encrypted: i=1; AJvYcCVhapF7Rsma0EIelCCd6GoLxuwGcfjDxDEtDBg7IZLHY+UJHiBQSugDc9R79KzjbGcYjYmpA7VFExkO/41B@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeZI/uVD1AnXLbcz7qUHnbPe3n2Ghh+hnWOvjetZmpt03fFxE
	YFxiCKu5ZFCgrfjs1CDe4uzkzcokNuJRkEH2lvuR/PXJN/pNgUfKPEu17hK4/5AXBsUtkdhyakh
	wfMsspoV/kBwiYwGEQckvoJ/Uqi/Pu7yEhxVW2ZoANPlp9lifFahI/6DlF/Dt+19uriIztlxdr1
	uY
X-Gm-Gg: ASbGncvpnQV5gB/ZajHfFVRqS8lGhuNYY86Toe7jIBnr73ERnEAYRY63DFGhdWD/8Ix
	Mb7BUAGTH4EQER/yN8HhrRbNE5G079ZLp4qAQMkjjn2Y3qZhWK2W2d++zH6OFq+GQYVw1x6YL5q
	60EPbGP/OHZPz+cIgyV4eJmxFKFFbKkPbAxWs3AhezakCHqrJnB+0WMxmDagRim6xRG8zfxEKJH
	T89CAskEqPhOpYgd3x8W77kkhgP0VLm0cInxoolXHok/Uix3FNp2A01uKWsktVrai8/zBmN5bv/
	aOniUGhUF4yzlPn6jmQrG3QIiyQEr1d0j/mNjtJWWfkPoT4EG4LEUVsNwKuzQfJiTXnZAWqAvMl
	5
X-Received: by 2002:a17:902:ca8d:b0:240:35ae:506d with SMTP id d9443c01a7336-24035ae51demr1133875ad.35.1753633572026;
        Sun, 27 Jul 2025 09:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkgKR95HfbF6oQwB+eiE+UGyj35NLc2nILT1f4/5kpa8bLrNcUqa3To0n7rXU9i9uwnvwD2w==
X-Received: by 2002:a17:902:ca8d:b0:240:35ae:506d with SMTP id d9443c01a7336-24035ae51demr1133435ad.35.1753633571483;
        Sun, 27 Jul 2025 09:26:11 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:26:11 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:52 +0530
Subject: [PATCH v13 09/10] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-9-6b8d23315898@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rmo18nL+UB7XAtgXRRqne0fPUU/Z0j3760cEPwsemB8=;
 b=Q7kRckRAJ/nnrtAocNnkqrdbMErSSbliIlAcnFlr5Am3UV00ZuO0f1aKxMH6JVpoxOHtlYRiG
 CXP4DUR/vLfCVMCZcSZwpLotxiQa0+gmmIkxpVhVAWNxL8A6eWqj+4o
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=68865325 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0hzxhWybWJACyyjAAsVdM8MvGZIAA2d1
X-Proofpoint-GUID: 0hzxhWybWJACyyjAAsVdM8MvGZIAA2d1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0MSBTYWx0ZWRfX6TsC+ZcLZFlx
 i5yE2hpppV3UM1gycHxNtw+xbINvt33PJjVv6Q+OfPZc89DtfF+T2Qq9NHGhUfWrspa/UhC458/
 dJirQjyIchccZ23Klrjr94ag9R7C5NohDWLyxyelJIliKThxsEAI/tWvrkcU1cq+NMwpVRzcGMH
 JEjWlblig87UAWSDqe9ZHKb7rDMu9O0u5ZsARwD/0Kqw75cgZe6Wn7bgEdmmbfWCC+mT0FQxO0g
 hIVDEqFwPIdFauFpF4ruQWcGlsRGNIXZDXnT102aJzMw9Ne7cS6Gy5bsu1pSfTbbosqCZc2P1DD
 7f3WB1AqYYuV2L7FM93ikPVpbyii2GvE4bHVvxxAIZ2m6DnAq/pmgCygL50o1DGsFGe1XqfyTNK
 Q0Bxzqyyy8FiYlomAsfZMVf2PryyI7ioxNGiV7MF4jb+8Nd+6d+U0+7XXV42cZfpc39VEjEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270141

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
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..8cf289a3cfc4ac7014885494c27fb003a7258519 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
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


