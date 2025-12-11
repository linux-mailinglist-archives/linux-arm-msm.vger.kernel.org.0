Return-Path: <linux-arm-msm+bounces-84968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13BCB498A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 04:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6B493002492
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 03:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F462D5920;
	Thu, 11 Dec 2025 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfGs8Vfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/coLfZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E722C0294
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422325; cv=none; b=CXwULkjrzy9TGw8Tr3IikFrTmMq4pWQBVzxPujcdKlZQN5MJBzdTXS2pbXLQt5BpHJCnVY7OxpqOMO1WUvb1fQj7If7DR9+C9GM14mK1m9e9s55htOcDf/Af7vAKVO3Aah5cJCf5zyizpzijXuj2j0/pPbJTR9Kr/kgS8u05fCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422325; c=relaxed/simple;
	bh=UWHB5htl9jv6shssApKC2deSdGSoERz1C+vMCFcMsx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORixvold/BHHA4hx4LPJVQpeJGX7CZEzLVUiqGS9NqdL0LIKsbIoTlR4eDvXrP0ZnaWl8CAfaVFeQY3AvrWPvL6J2BbTt+ZnpDyoK8BAYifsfyAmaE/3zTs9Evhsp6TveNZSmWmMw8/au3nGVHGp3XqNNtusEQYNCzKU+UyPOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfGs8Vfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/coLfZd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSZCN3563579
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vsxi4Md6dLh/p76joYcNk6xNwVGLH+Kjc/zkFpi9qTs=; b=WfGs8VfizUAMlYqD
	qBBU4qFitn3YHTnKqSFfwg6ZAxRaphunN+/NqZSG8y5kEZWE5v7aFuX1LmTUDAqY
	tjAnYEgMGrNLH5g2j2YMdmymBrFwW7rVYtbxeciQMx6qexDlY78xxgO+41ssL4RO
	PbOww83yrwUCx5RvfkZ61+uOTlNh/PP9HQgEpmPMEMiTDtCZ6iZ9GuGLRn63lbOu
	pZXVOPsFas+16e5lCI+V71i5Hv+5zx+6DnOFHU/b9wOdthjzdGJVNkzX9z+XaZ1t
	pE2pxxpNvu6LCZiM+5p3bcOFv7PzirrKC+fxAv6n5HHx/h5lK1IefHErjp4BQuCz
	U7eGzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfgs3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:05:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34943cc3221so1088757a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765422322; x=1766027122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsxi4Md6dLh/p76joYcNk6xNwVGLH+Kjc/zkFpi9qTs=;
        b=b/coLfZdnqNdOT689jBmtn/5G85+CIq0i1x0DXcmDc7Hd6DmOW0UCvlhCpN2c8m0hx
         DnFZlWXQSpZful3X75MjlLo4zA7BEbu1/Tjk/r4sySmVHJcTpb3w6KRtdXmJi09e2KJp
         lhvrDm+Kl9RpwC8Y3RSoAgcwRTajXEXlXV//rr+q0avUb2YQgGN/qeeD+F58jjcGPMiX
         rSCvMpMjfkZpCQmXvQSJ10eWwepNuufhOkSxiH0/CUr/pSjaof6cbsvalBnsmAtxnQXw
         ul8Fk4b8adTFHN0YppwXxvunchUj87qU8yJqS0SEXNM69CRxcSoBHURzUOABEVvzTs4d
         wf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422322; x=1766027122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsxi4Md6dLh/p76joYcNk6xNwVGLH+Kjc/zkFpi9qTs=;
        b=slCy44JV31f6eqsLC2jNlZsiOCRHOYYWhAMpgvR4mLhFujSBDkeHalUAzOwr4U8Ujw
         7qVcFEDKCapmEnch2diWz7VpHWOsYbNrX1XBqhsGYF00HHUxtAr0IJW0SD91n+B1dUHW
         TL0nhI86oyi/5IPwPn4y8VTSuMS3A4J6DHVwle7Lkvqm5cs1XfRo/EDPnBWSEY/oetfE
         3QIvb2a1JOi4RuyyVd6u5ZnR7bHZ6X2ZPiJGx+g2Ek3uqW9AnG8sRl44Hs8h5d8uXhl8
         idSW6MQHx0ARN4XSY55utb8EMNietiXowTTIyXRZAUtE4sjPp4p69Dnd67ve3h4UC9gd
         4Eog==
X-Forwarded-Encrypted: i=1; AJvYcCX6zUz09+f5J687M2l5loE+G4dlvGmBarnunmiaP/IpO2QkWcJjrXC3GoCbQ1HdaaB68RvTDPf+zrHf6yZ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18zMNAmOTEvtNJD0fFBzbA8c8alXakgRvK9PWjZ+1jVl4fzBg
	QgrQKVc3pUQjf2Vcn7NTqI1KPatI6E3rtrvzR2C0/FFfVftQXUGc1Tf2a29ThxnotmZXR1fieFh
	+6EQTxh8Z8UeNi3kwh4Hebd6cAkd/hDaUrmWVDT6ZxorJ/nU2DCwCkSwD1GhJBjqCSGySd9EPjQ
	GbS74=
X-Gm-Gg: AY/fxX4jIWe+JNqr9rvVHNcDEIk9f8MEy4e3qLgyyT0p9meCtky4zVC1EjKg35XBISy
	Vm2XFyczGNCL1K25y397+P6aVkP7h7yCAjU4r8QbzqOLraX1TpZdNwy0VegK3aEQUB9Rruk/dST
	daVDEBLDoyi3vtJacTpJ/saw4tgZtb+yA/Th3x1Rb1haLqDbiE10J6DfjAkwcY/Z4gDSMYdDAV+
	yFJvNGBWoXLpCxRXeGqsLNgOGYadLnf24srvqn7tulEB9bLh1qqY/92Sh+T7rqQexLi4u7z3pWw
	yt9qnatX25LWYIogY+0J6wihyf8rQeYWYwQ2M0CG1JToxnxWA7e5JwiB08KPUXSUFvBokzyE6aj
	bnp5JRkKC9BsxPfArGzsO4TRUyHojxvh/6fpSCqIZY/n/S9AzYwKQeVrCkzuB
X-Received: by 2002:a05:7022:504:b0:119:e56b:957d with SMTP id a92af1059eb24-11f2966cbbemr3579840c88.2.1765422322373;
        Wed, 10 Dec 2025 19:05:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEp8l5B17T/XxlV5ErD58upVmQdZBH35a3gH85LFMY1O/eHFgr8kvW7dS+Wb107bzZXdp00CQ==
X-Received: by 2002:a05:7022:504:b0:119:e56b:957d with SMTP id a92af1059eb24-11f2966cbbemr3579806c88.2.1765422321758;
        Wed, 10 Dec 2025 19:05:21 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm3935642c88.12.2025.12.10.19.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 19:05:20 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 19:05:03 -0800
Subject: [PATCH v3 2/5] arm64: defconfig: enable clocks, interconnect and
 pinctrl for Qualcomm Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp-dts-v3-2-8dcd52f055c2@oss.qualcomm.com>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
In-Reply-To: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765422317; l=1564;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UWHB5htl9jv6shssApKC2deSdGSoERz1C+vMCFcMsx8=;
 b=Auyt8sUulyIe7O8aWOHXNo/RqiPMfhhoI9Vi3hdMHJMYFNdqP7KvDWiku7nJcwQAume2sK8p2
 oKiR1iIHlyKAOaZWoKHTjuPuOECPN2gCiNbh6PcT6Zbc7x3JITuH5be
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a34f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=agaryqCksHM5hhZjhYUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: AdabLNxc1d6wfii65rVl-GXP0FoOw7ZQ
X-Proofpoint-GUID: AdabLNxc1d6wfii65rVl-GXP0FoOw7ZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxNiBTYWx0ZWRfXxx1sLEanm57r
 /D/LPf+XnlDlxqk7xwjCMEGUn8neei7rHWiAz8FWZJh1Wuga93LDPQYes5dzybTQOaJ/Lkh8FWS
 IMybu7JwBBEdGsO3329+/3kOBkJmpvJrFpGSL23uZcaL0eLaytNOafeCDidwBZ+sSonvnX72GVb
 aJZDrZEIfbCuQz66xjx26puP6T413vg+IbJ4utb0U7HiLR9oi8YAHBoHwwjQqtXmZiJkYThrM/7
 ijy/MUJAkpNYGLql+piNiPNXHlZWHS2/6qLdXcQUJNCq9J3wQ8QKhZnaGUjf3SzWy0cZWJzs1o9
 mYmgi65GFFwmGLffDeI3f/WM55vfqkYApGyIJ/W6jThhxVSclFf9LhY3BTGoJWRUKDwchaLw4lY
 bkVGEJzQgMpYGPcX7Z0DeyRVteN3Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110016

Enable necessary drivers for booting Qualcomm Kaanapali QRD and MTP
boards. The serial engine must be properly setup before kernel reach
"init", so UART driver and its dependencies needs to be built in, enable
its dependency GCC, interconnect and pinctrl as built-in meanwhile enable
TCSRCC as module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cdb7d69e3b24..5aac8878f676 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -642,6 +642,7 @@ CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_IPQ9574=y
+CONFIG_PINCTRL_KAANAPALI=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8953=y
 CONFIG_PINCTRL_MSM8976=y
@@ -1425,6 +1426,8 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_KAANAPALI_GCC=y
+CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
@@ -1801,6 +1804,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y

-- 
2.25.1


