Return-Path: <linux-arm-msm+bounces-80883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DDC440F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE40F3B3E74
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852992FF66C;
	Sun,  9 Nov 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LouQCAfv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVQ8bqgp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D382E2FF157
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699193; cv=none; b=PlImK6jLSRHUYbYmdoJ3oy7VcPb7tT6jbS+PfQdS78rxxINANuXImM1mf/nwx+1OpN2kttptNh6ysnsS8qZjeyhD6aLXdJwahlhl/GoAK52bZeSOtcMruT4EiQCbWImmHTf6AUricrF4RDe0C6eU3nNTNMR2mlqHRoiYKJdodJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699193; c=relaxed/simple;
	bh=0DTO16A80WGqaz3z0hmwtkj7NXigq+2LLdiQNk+Q8ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MP7zWQ2sFtWGvK/hFVMSMdB/EmUEbA8dZgdpJPMLFW1jfUfTWgco2gBWQyq7P4iGzQQtEEMOz77GN8XuONrzuwhf7N5mL0+m/Wy5hkau0Wb+m5PVPknqamOrMFfRpSQ5YZLJRHfadImqAiXxk0x4dBdkBYbJAhPnKEf1SxELmgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LouQCAfv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVQ8bqgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9ECDJ9819161
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=; b=LouQCAfvJVsviDRk
	e4CY4qK42rhnC0FvsyR2Cy/0F5qmsBpki4Fqpd6Ilw3/karaAt+lzYTtsXLMiboY
	mGuBD20b1cO+uOCgAHGusvJJrjG69B990iYgFvyDpMKUHe6a5FNkPzQaoR3YQkt5
	E8Ffsahc1ecGoxpaiRw5CeSIuKs0Gdc9lgbNmxMnxMw2reAGoHQd66xTG0qrQI/Z
	F2fG3D/j4eD7tt/NfXvMq1u677K6Wo6lfeTiNyC5f0Lnht90N9oMjp0w9kbMurth
	m3ojc9ApXLNT4xSsyoZE38iKk47TJ2O/HR7iwTLi8vlqtYG0KvhnKRAHtnw00VfK
	dagjPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuej7yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:39:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33da1f30fdfso5512677a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699190; x=1763303990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=;
        b=JVQ8bqgpSRlZ4k5zw1QUKvz9n+S3uGkAhfmMlpCAxhaFytUaT1T3dHAeF4ZCgXMo4l
         yWdnmvo+rx5PWU+f4kkLROG4LBzokJZLJX5lphv9pjBMBLvvNHD9ZpJVxxTkP/zRi7KA
         94IWDcbI+TiGBeuwobuahrmk2lhW5pVr3mVfDKG7IVi5REiN1900X5DKkPVvXa9Hmx9K
         yTL8kzkmv6h+JvPH9NiClrQni12a3UTqeIJUNGY2MPU/ssTsuLNHEOOeQ+AXlObMZx+Q
         e6dEZc6d48SfRPm2IEu9gL7FOouO8b+nvs0ec/fARj4ZNcYzt4Qy4AjDheCB1PL1ucpC
         0USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699190; x=1763303990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XptDc+YZFL8JqGr8hCEtPLAIPxbU2ERemzFyFeabLdI=;
        b=JsQ33RnyP3wBzXHD+x8dRKlGSm/SNz2HQwIsVgeeobkhUgE5Z24KkqyuhMxy1nwTSP
         cEEq9cEcv663ybe5Lky5VRl2Cf3xX/yvfIu+2PR4HlGhKucerjsJWCLnAiQxD/NqkDtj
         4+zLagQjo0Gz8041qW1drgaa7TY8V5sKB1+r2a++CN306nc6VpNG8njw75iYuXlu0SUC
         HuMV7fFFIjWQYqYzyBe0tQiLM1Rbsmjs8TFAzNxsA4HTK2Cwd6SN07/Me6rdWJg+xz/X
         a3kuRcSC+tUW9owdK9O4CFgryPiJVlsggsJ25R3fwtNcEICi2K5gFlSw3og7r9to5lId
         LIew==
X-Forwarded-Encrypted: i=1; AJvYcCVe1dTLnlUtqkD+gpXRb767wgyNh34fvLyIDNRonm7W508b7HBxd0Ehj9uAm7oUeLOukrFfXi7d4ZbjChAG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg6/VIoF7ppBVBnrxc8+Jft4hyfVGx4UtANGBwMCjF58CDFOoP
	ZcmT5eHiF4NLxu/AljlW2G/l4tf/C+dV9lOywPyKJxai0HkNlRA5ZSsZo09qNR+hVeEYdeeDlwW
	Ge9JqDRgGhZK1ZTSy42dOKbS3AcPPNPSHz/Yg4wK1LjSTAMJt2UmCRE0NGCduAW98EgrR
X-Gm-Gg: ASbGncs6O5+uWJoduSu2lVXNswJhjtX97XoJNln7JCdhlOv8EYH0iJ7OSp8ryg/AA/z
	LaOnXySsucHZavfRB5WjkBhJr5+WD7flG2ff4UUFjzeYiuXSCch+u2INI2ZJe/UDaCbwKxIH7vy
	uwrVT/c54a5c5LdpdJ/APdhr5hDTY344EuB4kiAFNDUmDjJhvd9Hmn8y6ODi7qvwrW+FxYxUD7a
	hyF5da2K1YvYXRVeC/ebsgn1dIwA9a91sWvMW08CW9i1gfbuwA0YwXMNL0RXLK1dOur+uACNVfm
	pwJfp48/C1ssAUcswChVVC0PhET8UaX+BW8pvKcQ75VYDbpY0nz/tR5uBNG569ATcGLcVa2cFgw
	+XZORQCAehESSAKjAGhcRHRsnrTwPI4Tc+1M=
X-Received: by 2002:a17:90b:254b:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-3436cbb3db9mr5858506a91.18.1762699189613;
        Sun, 09 Nov 2025 06:39:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOq2jGoZdaGTg/RuLpVGRCaTMc0nO8pbXIWYTS2/MK7JSUVoJbW0TcdZDyaG0BSL/En7Uqvg==
X-Received: by 2002:a17:90b:254b:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-3436cbb3db9mr5858477a91.18.1762699189136;
        Sun, 09 Nov 2025 06:39:49 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:48 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:25 +0530
Subject: [PATCH v17 12/12] arm64: dts: qcom: talos: Add PSCI SYSTEM_RESET2
 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-12-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1067;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0DTO16A80WGqaz3z0hmwtkj7NXigq+2LLdiQNk+Q8ls=;
 b=tP463FsuDoN9+kJtN2MV9dK0Lk1uV0U1Hzq/yfzIbjg8ificPJU+/kUUPfp6nFtHl03InJtGh
 9VS6Mie4djKAilbj5ymty9l4y4D5eBAcfYCHZhg23+5Kh3vudrPO9iG
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX4hsYiU9xyKD2
 8UJaHJBuksJuAH/ZXktQbYaxCgMww/sDZXWRYZcXE/2H1cl7NAfaYeJ6ZwLEiERSmZpJKKFYfVP
 gXwKrEzHlY54dTg1dV7HCWTz3yaKJ+nTagz2UrV5OPWiE/m7LSj+3WrjHswilHcheSXD6oX1K+i
 qQte7hNLGRtCbiNVU6jro+mD7S+Ap7KucG39z9iKXxttd7avdrNTNjIwu37S5tjv+wWlpuq7Y5l
 j9YRlljsl0vRDU8xAjenrBXhEFSZDzqrqpI0s2ZtBhuUrIEpKOCHjvUimCyOAHBF6hmdP2yPU8+
 ZO0rjdkAiJFsxD0BAw19NgAugZJ7LpGEVDqJFYA2vNerVB+0KeHEvIeDPvc8DwxnZ3AktEjVB6l
 f3Uc4jg4U5pENpqt61uZmm9vRaGo5g==
X-Proofpoint-GUID: 1Pdw36z56uy2MCC11jMGCFPrt4f8SGPJ
X-Proofpoint-ORIG-GUID: 1Pdw36z56uy2MCC11jMGCFPrt4f8SGPJ
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=6910a7b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eb6f69be4a82ea47486f5c8e39519d0952b146cb..c946d07c540f5ae40f147ccb06539ecf0de18df5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -612,6 +612,11 @@ cluster_pd: power-domain-cluster {
 					      &cluster_sleep_1
 					      &cluster_sleep_2>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x10001 0x2>;
+			mode-edl = <0 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


