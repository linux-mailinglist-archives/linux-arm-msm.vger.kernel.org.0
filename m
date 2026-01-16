Return-Path: <linux-arm-msm+bounces-89481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E4D389D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64C2930AB4BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF8832B999;
	Fri, 16 Jan 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgIyl2HZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9VfDtcg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836031B110
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=GbEbgyaZ7FLfgdEo77VjSIoGmMm+VIlipo2l779fE2ll43BSDeH/1ouDUneO5LiMMJB3kkWVBIZ8UWqsZoHcsNgGyotzAj4+3IPXKWQ9h5hsdPgJq8bjRXE+dRsIGBV+COychTLRiTukGLIVzhqbfNdd742qKVOYmb4e0qUJyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=v0VM1AbyGegd/JoyrZJcZY3z0tITTBhEtE8yYszRho0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WoRF6J0uRa/df/VsAFHrbG5H/KAqCAZaswjfQNe1BIETMr965h6BEDvn9LoyBbdGBN6217V6WDPcrZiultCjoKOpsGN41yepk/fzWPPvssZLomXC5Byh5ACJeOfBliXwPG+DVvcFqF2lZkpp6Bqq9DIqUa90Xkb6FOtmr33SNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgIyl2HZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9VfDtcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDX6i2959452
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LXiIQXFkT2b
	H+u++kC00u044e73Da6D4+783FXlcB7Q=; b=QgIyl2HZwu9EHWDw5czg9yRsxmm
	lufX/DGKoG7BNEyv6Rrb8cCgziMlfw3qSSD/yKIO+1PvrNQInKOeLlwmpwT+Ygon
	L7JBj1zT2e/KZ+FK3vC5xPvoKMGzUU5PDEirBpV7+RHAReaxnDdZ7zCsxCRv0TOA
	wzc11R/DTUv1X8st12KzWwL1NLT7tSCGg8vUxGaLXTgqUSprwQPSAvjR71rDmtn1
	UyduFWWrXhDEdjmL8hGH0kRUyxvdXJfFdDVNjKfFu/qmzUGyd/CIKe42hV+WztIB
	HntzwPspaykjZ2lgQzRZshe34Mz3O7fUJrCKbJYItDWuBrx13ZmPffQe+bA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvhh8aj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11b9786fb51so15704693c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605674; x=1769210474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXiIQXFkT2bH+u++kC00u044e73Da6D4+783FXlcB7Q=;
        b=F9VfDtcgwqaeTcMPdgKTvNw20Jh3dsSwGPhiVDn65rKW5OrSvTLWaMGlCoh8oklHqE
         wKo8j8QdACMeGPVT4ryCOV1Idf6lWLVt/zedOOg/+w5WiHlSLQUm4r2RhEd9ySHixAwn
         hkg941QM5H7LDuhhOb34H01FGAy8110N1zuLwYFdSS1VlgMFi0SZ+SG3lzf9Qa2Lcfjc
         /pns3+dIPHOwaxx+o3bf/OteTVTuNEr0dDkVORuY+XAbB4jmDAVL7006m/qVBvkhEaI4
         hkTAOhfNumIVG0MNaqcBKAHPKOP7tUFIwfg4oQYSZpZk4DC2ldHQFTN4oQ9sBBLEh/oY
         bImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605674; x=1769210474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXiIQXFkT2bH+u++kC00u044e73Da6D4+783FXlcB7Q=;
        b=AWP0D0MA+kcaW4x2gC/YGXnHy8A/VdSyfFepxpkbniwECGIGthGpsJK5PrWP8gtcQy
         L7qsf171xgp1HLP+3pD2D7lbLI/kw48Stf4zRvB9E/3awOlUrDNlZmT7d+u3Hi8SgoXv
         K6Y/qwrJb6srFPVfxGr98xysvQT8QAS7GBKr6W1/DBOqcxOEgzHdfz+8cRvE+XDnQ8bb
         5v7wis3pY2SYfFmZwX78exo2THWgGZKzAS9MZbb3Z7uwLSOM6+JuT7lxZL5IRL55rQLR
         fgr8ZtgMXnRF5XQs4uOb37jgmy0kebByXC0KGXC3I/58f/DzCVh7I83jyv9cbjrirrCf
         kI3g==
X-Gm-Message-State: AOJu0Yw1oK/M+T+hKqJZxFsx+uK8xB06nWzeMhpzindskKYGJJGvBzAh
	Quk3rGzny0CcJgHPXQ+2Opq2KYAZN2g7OF2WqS5EbcgbTs9wACmO2b2tlPl8T9BQ8/+aDQaYZmu
	nqMswAGA65lJ/Xcgf63RA9RyPyjMUwnjs+/2GiUqZjkd56QIfXlxlVpdA7PC9KXEhwOE6
X-Gm-Gg: AY/fxX50trx7z4Tdu9hG09JdrJ9xBMtTbVCLLTS9Dld1UOZLq32TM95UDq4/htousGW
	q9JtSuojJsCXfKh4tayXHjilf1dxOx9UVDPvB7rIDZKu+k5kxO8uOI0tPsY5H6dq3C9Chsx8ET2
	dJD9EQ3Mb+mugGaRfF1VPwnk0Xwi3W12wwTbYoTQxaI9si2Rux3v5zC3hQWfGtmVuttglXZeS43
	1oE7/dVp4AXYw8Q+t5mk+XfKSpuW8+QcH/VkK5bldE7ZpnV06ZI/i7edJoxx+tQQEAXY0XKaaZ/
	Mx6NuaB8PJV/+Gt70XBoYsLIpqPAsRrM86BOyAawWXhb8CTAJm+x1MCu/0xxU+bg+X15xXOps7E
	kaEH9RyKqXNmPGWicHV3BaG4AU3f/o6Yxp5qCy2yIMV+psggam3rWjopVD+WfJK4=
X-Received: by 2002:a05:7022:418c:b0:11d:e2a3:2070 with SMTP id a92af1059eb24-1244a7a208emr3987800c88.44.1768605674366;
        Fri, 16 Jan 2026 15:21:14 -0800 (PST)
X-Received: by 2002:a05:7022:418c:b0:11d:e2a3:2070 with SMTP id a92af1059eb24-1244a7a208emr3987785c88.44.1768605673885;
        Fri, 16 Jan 2026 15:21:13 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:13 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: qcom: kodiak: Align EUD node with binding
Date: Fri, 16 Jan 2026 15:21:05 -0800
Message-Id: <20260116232106.2234978-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uFI_R2Pin3C1dYi76eSKnivus9giTho4
X-Proofpoint-ORIG-GUID: uFI_R2Pin3C1dYi76eSKnivus9giTho4
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=696ac7eb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OcAoOLw2Dr_w_q-oR68A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX2im8cS/DkxgY
 CY9J15qAkzcuDbR9gEEkZ/6RpA/bPVwtkLS56h3W5Ywp1D3ITLsMNLduZE6Rl9ZQm9VNxy+Fay6
 2uxMMTeE/HTq5BZTnPAU1SVRgPv1WEjbCOz4+EiWrRoD3FDg8wlTruxVfI89NY0gwUQi7ZFEysw
 chTrdeNZO5SM6AScXsOvnyArHDPla/XtdisVHXHnbHH/8ozKrdnU1K/9RQLE8ENjcGAWINAkHqJ
 ZpZ5q09/4fc7YNwlY+4NvObF2ZHWHOWq0+2efZv3deGiIZVmBWrwkpxFnuXCb1Boaqkp9aEK2CE
 +HrKkbdvqGTe866g+ZKX3p1dgPEOpm5k5TiBrY9L9YeqGNXYd5GdEJ7vFpEAooRv7TfPhYLSv/q
 yVZIXakJCbKpCrNZHqQeDGtZO4sTmb5DQ74Lw3vSo184sIYvrTsArpNVaAIU5jx+ekbDp26a+Nh
 JcYvR52xcAV1oh0ojFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The EUD node does not match the current binding and maps USB endpoints
to the secondary controller. This SoC supports EUD only on the primary
High-Speed USB path. The binding also requires a per-path PHY reference.

Model the primary UTMI path as a child node with the required PHY and an
empty ports graph. Leave endpoint mapping to board DTS files, and remove
the secondary mapping and associated ports so the description conforms
to the binding.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 33 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800..35c47a6b03f7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4284,12 +4284,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4610,16 +4604,29 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				phys = <&usb_1_hsphy>;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb0: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con0: endpoint {
+						};
 					};
 				};
 			};
-- 
2.34.1


