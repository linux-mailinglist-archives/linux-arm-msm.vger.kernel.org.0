Return-Path: <linux-arm-msm+bounces-85182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072DCBC02D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 21:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E0430255A7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 20:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136E8314A84;
	Sun, 14 Dec 2025 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVWePrjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CY9YD2nq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A62C0276
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745418; cv=none; b=agt1p8yHEHMysVqn+5VT3QJullbOMH9AynYVdwsfpH3k0rfxz0HqaQ04bj+sQmWq5r+La1MbYwUQd5A4Gqd4hTdpKMikTSS2DmQ0ta5Z9SJjfr+Sfq/QPR1JzE3fHn7EQs5jEw7Ew4IIFJKcwXKMVjEiA6dIfAVn1bMPAR4X4q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745418; c=relaxed/simple;
	bh=8E5rE3b0DA0tlgjhr5pcLqtDXLjj5c08TEwe5c8od4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQsA5sRSUwdLfaoJ/jr5adPuPatSTPtDa4s+7Ly6z5QT1ND5iSHRomvlQmKJlcSEeJ90sMPQ92Y4OuvzuuPjr5ZEbnS1NuiG5zTVUbCng/8UWZq3pssxU8WCBlTKJZpRiOL23fhD/TWv8kD+QI5+oCV71OHTh/g2WF6w3XeM5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVWePrjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY9YD2nq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEIlBQE2516913
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ox6d5oY6cx3j6QafollmbAb50dpT8Ah0lMPBK6LWR/Q=; b=bVWePrjEXbIBxdFB
	KJct33RkLBFByosknabH9U/QwOSHXOj08ho66+gA5akDIze1Nu2s6rYZjLL2lcVu
	vHIqxybKj7GVqzy3Wn3CVb+Q1azWiXx/5HRTmM0XTZZMjbt9Z2jqGSZA8w+OFcZB
	aAT9TKZ7ku8ECwNSGy0/bSPAT1BR6zw32U4xHEEGwBIPby0gL2LLs3SVGravpwfJ
	+LZcLcL09v+Hqtv8pVhRvKWOrn/twPum+gjc4PM9McdPXVGMeTg99lpWoDR1hQwv
	JPyQDwnm2TUNeJg5J90GahKYwOPFIaMBWxBPzU9nE9N9HaIKZYdpCmQ/rNFuVN2g
	tU1OWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119u2g9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:50:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so750894885a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 12:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765745414; x=1766350214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox6d5oY6cx3j6QafollmbAb50dpT8Ah0lMPBK6LWR/Q=;
        b=CY9YD2nq9gbnzKdE5d0ER6aUoPNKDWlEkmdW2V1i8OE4+R/dMn6C1cVTzpMJDMC4le
         3Sae8l3JtflMk+OOZD3PZbeoOA6+LFrHsSMkhlRbU1ZNgdx80mCOZ5RsD35AjkuMotXf
         v/HaxUxpsBgkSOEFj8X765SLPx2gbU0WtxJP2R5LJvho3R3kKpH40wljn6u8bVzKGmv2
         vHINCFNSbGfXkhjYgFHJOt/66l0hyZOwXsVfvBfnib5yMaP+lm93G/rF6ehXrGKORUZk
         TUSbTHmfJeZEtxuoq7mIHHcCOyWr1Awk14mEIGuTe2ojWmPJH5BGd4NytLkvpA9Mool0
         A/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745414; x=1766350214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ox6d5oY6cx3j6QafollmbAb50dpT8Ah0lMPBK6LWR/Q=;
        b=p8mdWbdO2jw8afIhOQSQNz6lJJjFclcB03Uo+SYDqzCQZIHUPg17Qk1/9dlmjQTL9Q
         j2uAkG2YkQkKfUPp7iJ+2bkPNifd/eFhp5J7tsSsKJVIGsX7UVd2XoSC19NSrmhO6DA9
         qpg27rbRT8Ptl3l1jI2WkIIkGomm8pQGlS8dRMXvNUHSA9Kj4EKs/J3C3FK0WzOIIHvS
         8CB+YXmaPqwCM4vNT2I784zxD/wF/uj6KnPHYKU8W5IRdsQsXdbVqiSCZqNfuO8uBB65
         7vakJuPmxnuCby6RGkaD/CE9EbUkxsZxQEiFpCAsycTmKE51W3QCcn9skX3S24NxE8ax
         hAog==
X-Gm-Message-State: AOJu0Yzt8E+8fu8xno0u3avbBWhmsIwkhY7ufBXliFI0kGRVGXyi3HYU
	zk6NH+C4JeLvlhzg/anJu9ApZtlZhEI6UuWyER7ZIvKtG3PGQtd07A0W5L84HS3qEPPU48Zr4tW
	PN853y5eRqJby8g66JVKGa9rQsrudamWhAOOVgGAyZFpSJtcTmqg3XVjJAjPzytsocti5
X-Gm-Gg: AY/fxX7BSbPfHDuM/FCNozJ++RIdRuyU7Qxp7fpQMFnseqzXR0/mY6XCBeHuSY5olGd
	HoIMkdybliD7sRkOEY8Lyx++L2r6y0LmYFyEovQPZVCW+O/pD2fe1jX1Eit4L/Yvk9a4C/d6owV
	XF5D3tYMu7W3S0MQQmOYWsGUyVsEuDhxAOsuVDVJ6HS8+BuRzTnzW3hfwAw5Q/oFiBsOACSk2Wd
	ulP1P6m94vB23b3jXW29BzbcMPK3J01G+rsX+ImwWMsJePL7BYDLGZqOomxbr6KXHF4C5+4syhy
	j1uQulv60QoKSg4jLqL4r/0sQOog+d3jp5JIk/Y12IK+qXvE+sXDMeGKzcBzTMevDY+KgmZhELT
	lr77C53FPva8nl8Q=
X-Received: by 2002:a05:620a:3711:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8bb3b33417dmr1229964385a.47.1765745413921;
        Sun, 14 Dec 2025 12:50:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKPrK1ylrv5UHGL7Z5p6urp71n8fWr50ON1eeAGrV+W7jIuiT0u23MK9CuVN1b0rnGlQtSNQ==
X-Received: by 2002:a05:620a:3711:b0:8ad:32ae:b6c1 with SMTP id af79cd13be357-8bb3b33417dmr1229961685a.47.1765745413414;
        Sun, 14 Dec 2025 12:50:13 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1206316366b.16.2025.12.14.12.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:50:12 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 14 Dec 2025 22:49:59 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1-el2: Add the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-2-94ee80b8cbe7@oss.qualcomm.com>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8E5rE3b0DA0tlgjhr5pcLqtDXLjj5c08TEwe5c8od4Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpPyL/xBLDMiCuFKgzGQwI0suYSu3gOPEefwBiS
 Z2JQO7ByWKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaT8i/wAKCRAbX0TJAJUV
 VsE1EACQQTSgdcyzM7RafKL0dClPui3wALYss71jURRwnV+DM6cAb2TtnM6oJiPvR9Fv3g5TZhI
 N6NxcEWvb/xinJVXYm5KpZapxjJbu9Rn9eC8MRvNvCjJvoOsbc+m/ogEHJ/gl5rmnSHkYtbKha+
 vcqVdrOU6kwt3jCANXlXWc0VO1QEYVFpHCpl4fX0AZzOr39BZLeQC4dTXBfeSRIM4zy/N/arop5
 OKglkIKL4RGmOz1XUlrXPi1qY+CYnxRnLIxdMRJ6QFj2/dpBq2w3Ain0d37TfaMnf2JDcT4yliJ
 zX9ley5HuVGHtTm+P9Dr8B/U0RjLHUsG/RlkGiCOGO7P2r/f8XnnaWx3Oh7XKUm9EfbHPc59rDF
 D3f4R/WG/nYwkXX+jUUgoqDr6nawCCC+MVT85QbFJhocUihPp1nr107P0/Jjxw5hbjr90rDeYbN
 dE8MPGgHHI395aiOudHz5NWcps6kIgXZbi2vVPmK0UpeLpP6pmlzpSgmJEfXQwbQZTIN6KTQLmO
 5x6fKCDTicJx6Bmm1VypYJhLs9J+CGf7yjFPeOTvbB5EalddQ5+5SwsPN5LRlIQbY94UtGEt+Wd
 Up2H72VjKVKGNe7yVoEOgfskHZftaR1vyuDC2R1OCUevmu2FXtn6tQPBy/L8x9qFcEyDQSO14wo
 teHT1IBhFJL083A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: -IR98cdqDXQjOb8C72WneE1rXviUpiIV
X-Proofpoint-ORIG-GUID: -IR98cdqDXQjOb8C72WneE1rXviUpiIV
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=693f2307 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uqBh7opF-ep0G11Q42QA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDE5NCBTYWx0ZWRfX43qAFHynwMfK
 odHBCErbCsI2/qGI++g8wO0/ad+kG5K9uGZa3KOp5IOYpZ7tACNXooqGm060Lwk1aKiy3rj2yOp
 nGoYCZ0GcaOEKMesEt5Yfd/5m392Z+9jpJW0NuUSiquFYUskHXKhqtmxdRBtr3GnWvPgrUGBQz9
 rByiK6B8nE52LDA11REgOYzCTSBoeNwGI8awnLti44snHJERMwtbArSZRZ1A3Iouaa5aDstt/DJ
 OEyCn1YnJgd6Gp6paZ9DpRpKn2caM/RPYPwyiIBPad8h83eGU1Qu6Q7X3KBDMvjw/l1mFs1U9BW
 aZbD6pwV61YFLUQ5YG/nteJO9/X5eJ90QD6YXkBhTrNcD2v9RoeuB6XxbT9f379dElrvUVyd9pa
 jcr1BE+iXCol/i0CzZyHIDj+02PzZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_06,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140194

The watchdog support in EL1 is SBSA compliant, handled by Gunyah
hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
block, same as older platforms. So describe the APSS WDT node in the EL2
overlay.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-el2.dtso | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 2d1c9151cf1b..404174a15659 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -7,6 +7,8 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
 &gpu_zap_shader {
 	status = "disabled";
@@ -55,3 +57,17 @@ &pcie_smmu {
 &sbsa_watchdog {
 	status = "disabled";
 };
+
+&soc {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/* The APSS watchdog is only accessible in EL2 */
+	watchdog@17410000 {
+		compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
+		reg = <0x0 0x17410000 0x0 0x1000>;
+		clocks = <&sleep_clk>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&intc>;
+	};
+};

-- 
2.48.1


