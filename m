Return-Path: <linux-arm-msm+bounces-80881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC6C440D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24034188CA23
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0DA2FE59E;
	Sun,  9 Nov 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgiUOEvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRCzDD2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63672FB0A1
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699175; cv=none; b=dBL+/ufiVN1yh86oFMqhW1/g6c2r/+Q++n+c9bjiJnpJFYVseDiwqQCiFGy2C+CGc0dlEkj1NmJkMGLtU0J34lNgU04WyRZ6kLD/Y3KnGeW6Q37mhnVqXXiRRQP6ydql3T9v0bDMD8fbnRO78nTfdVCOpyG9WH22mllZzPvxGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699175; c=relaxed/simple;
	bh=c0sDk7nE0BsMGILV6gAFYqW71r5wB3+58FpK7/a/qxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jRYBuCL0GQevhXOteRGLHI++EPe888n7jq5pJ2ep7JCB0bJ93xyZnglh7MMzOVCoN1tsAegGXUn3tG6rJTbC3vkW+/ZkxeLil7ftXIywHf1oXgkQfL4i401Sgj45ySn8pr1WKdHCQltxHNwXVTB3xjG+6J6aYB/9ezwVGFRXA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgiUOEvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRCzDD2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9CL01R415848
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=; b=VgiUOEvVyDsP0oiU
	6O6pBDoPcx6kQ/cDcQH5U4M5hCfoGn/3vBSxJGIIidIdGAuoomIaeCnJMoGBPhNc
	NIrZmhFwcW0JtpWHxQ44+Go/aCrrpxLbEJIFy22SRlqxllY9/cAGmuycF8KSYWMD
	1s8aL3nlivCdOcg227EsfW52qrCfsMHuHa5b6ZbZSfUpurDl7opwxemavruSykVb
	X40FH6Ov+Rg6c3/XWu47aU1VBpv3Ic/9ra6oVRyQNnXTVqxFRUR1QmXW6gzmbkfP
	yeSmvtl+uXIvhYii/2gu5Q+LD0GkC3au7aJCUrvM3BFQxvSN3Vr4TxhYCl0XcHmq
	TRz2wA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu9t7fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:39:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso2482536a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699172; x=1763303972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=;
        b=RRCzDD2r61YkYdFAERCKNj+xiaMA7yOC1NfJbNHgtCi2Oa1NLNCTXnCM5Pv6i7yyka
         2gXdlPCHb3kHUyFNMHBiKLjVje/H3KBJuHEHG/C7Az7C0udoxtHbcDdOQ4okodKYCg6h
         VBUF6i6XArahiXPZ6VFAWH0Yb3n6aDCXoEFEKGvrKMughDtZR/tiQCcXmo4Zqaspu/jf
         sF1v7Q99mfbMPcRBQDrgwPsiBSgoIl0Ia0rJsG1bOJq8FVJ5OCiceO1aUL0IHKzDmd5h
         6Sh1kLFLx637xOIrvssUjr8vOsr9SxBsmU30GRVKbwhdyJOYyojiMfz3iHu+KyypBjsP
         75Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699172; x=1763303972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AukN+b68F1iRj8szvnom43KeenMjLq1Gdzm80qeFQxk=;
        b=SUEp/PbM/3qPRHnWHxFlK/mpTCelO8jXt3pMGOetSRppSI5UUMQUqbs/DyqCH82vuE
         M81Uet/BaKu2jtmIKA1hTry6iWtJR8vq0OoK//YAI1TwLnJIJgspWCy/sNIs8kuZzR+u
         K54B0u5bS15vQOBKQmxFQBbz2uDsHIN9Ts0e5ePk3odAj+GVr5yVburyk8i06KnXGW5g
         tOLpzfaA8INHI450av4o3mxehHCHA9HgpbujT250zqmPL9LODx2xnWgnG+cNgwimSxE2
         l1h16DYYCFaxzNQcROhomLSZLv/DNo9+LRbyT+nZ6yMdBsJ8D18G2HIic5rHkli8HHFV
         U8JA==
X-Forwarded-Encrypted: i=1; AJvYcCVix3z2PxlluvLRH/Qb8D7+2J5h2U7aC7t6zHGcXpTam1CGkWifg/G/ft5Jzn1623US0kS1h+A4JajfEb8S@vger.kernel.org
X-Gm-Message-State: AOJu0YwjiU79zltyOMEX6Tqz+QBEWOCLhHMfe/wRdWwBVXIU1cF8R4CY
	iFDfmzuWz+ECqme9dkiIqhS9BLGWnhVmwvfYVjTqNkixOiPR4wyPZyA9vqCHgBkxTQKfmHG2krU
	FJjHRuFWrCoXRnqhRfEBVupz7of8ZelKLJswx7+022VCm1k17x4iAtGL6EF4kgqtjwz3w
X-Gm-Gg: ASbGnctxPSb1QJ2shY7ZlYXayP/EEyySRgvtWARjASolK2GoZBkQ0wC6r1u7/GlGxQN
	avII2e03f1dWzx8918dEmazaNzb4kiav7DqeWhoGFAvqSh/Roi4MRcrhXw+UiHidq+WZmWHKdUj
	jhKA3nKd+wAvKa4/KB1P3g4JLL3JOKUpV8jE29qCHkupgJvzIbNcvZEESF2f8laMLGQ4sU8fJfe
	WeDEqzC+GSetSE82tto0NBb9jgOYzaOAHZpyz0brN1sKvSNKODF65qZDbK0JVDWt4EUbgQGxHos
	Je4hh+LnV61QvOCfDStwaKHKf1ZjZL1w9ilYo1Pv44GApWuFnR9xrMl1DrXlNEnOazHpKhUsI1g
	Xy6j6R8RQBaw3WwewSgIsm0GFJJA5Y7Mh9ao=
X-Received: by 2002:a17:90b:2d48:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-3436ca9af80mr7084201a91.0.1762699172294;
        Sun, 09 Nov 2025 06:39:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKmUKmAO/5YNNJQCK9WyTgSA7HEo4zvTBWQQYM60M955N7ymLGX8tiEKVtC08gIxpgP+mmzw==
X-Received: by 2002:a17:90b:2d48:b0:33b:cbb2:31ed with SMTP id 98e67ed59e1d1-3436ca9af80mr7084148a91.0.1762699171725;
        Sun, 09 Nov 2025 06:39:31 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:31 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:23 +0530
Subject: [PATCH v17 10/12] arm64: dts: qcom: lemans: Add PSCI SYSTEM_RESET2
 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-10-46e085bca4cc@oss.qualcomm.com>
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
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1108;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c0sDk7nE0BsMGILV6gAFYqW71r5wB3+58FpK7/a/qxY=;
 b=Mz+dwUU5jjgSzD6eifvT7KiJQzAbIaiZ/S841YqDDe6M8lFmUBSh7CQIbRvQr1GkfZsQfHygp
 2lejprqAIqqDTRobgFBQ8CGm51ZyS/hsWggwRnLthv1chZL9MjYDNJJ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: Xg6AwKxDqM5ZncY0LVjWrKD-HS982L3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX7pR3JFu2MB0Y
 8N9UNiCwPDu1qiz0o1jEQLAYIqmtyv4nbbxTAxCOSr3kSk2zh+amAGny9ly/KrulXqpresrdSEB
 3sSBaoSkNsHs5++8KYcJvpztcS3rO6xZL6SOY13MEenyv6j+TwmnTDXwexo7dfGy1oHBS0IIzj0
 nAci+st3UEZsSFoLawf81Z1XD43IjRPdbm8jl5AwS4EK2e32XGplbK56+xhtQEiuhuVXPn8fw98
 CgyblzvpD9s1CajP8a/9z2+PbyuS494nP15sMmm1Gu4BK0pRRPZX9PrFTItjHFh13SMLfg0Y4Vn
 dy5sT/b/Nl4FjEDd+eB1BBr2In7mQ2eGMc9Tb8BIr8MoNZlKMOpm1i/1tDQ8IgKDPCSA29oSB4G
 J6ux+N3cOMyh4nToVknKiMf9pWO2eg==
X-Authority-Analysis: v=2.4 cv=ZPXaWH7b c=1 sm=1 tr=0 ts=6910a7a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ld_RF3OM1xByVwKNVVYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Xg6AwKxDqM5ZncY0LVjWrKD-HS982L3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129

Add support for SYSTEM_RESET2 vendor-specific resets
as reboot-modes in the psci node.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..8b594a6535199b38ab6ca432673c4a9432c0df39 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -698,6 +698,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
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


