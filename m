Return-Path: <linux-arm-msm+bounces-74431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E6B917A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 819B52A4B0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE7C311593;
	Mon, 22 Sep 2025 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwYvpOg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F730FC0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548523; cv=none; b=ie8AfhJTMSwWHWP9AEjxDRVD3CxnzaNiBK5RzudWRAZoUkjXGH4oKEanXOZ9O1hemD0AauxjzSpjVhSaLnQ2cZFIqF6y79UttTp8pHVhNdsnu4rtQjVl8YaCGZjoZBm3BArCeQufaXlCBuYC2+YiTLB7WCSnpilc4vvuXJ5JPhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548523; c=relaxed/simple;
	bh=BQbA1PfTf4T3catTnFJyQPDRyKoNlBdFRYRrfUNeAx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qrIqt41JYUehJR5ZXl82JRS9cntc/7q8izTxTVVgW3VlW46KsBGghGT1NZm49r7AYaCqcG8mkqoEWULAADKh4Y83ds9O4JKdmM3C9OIZQtabV4eBpzGHkXFuISFT7l2a8pJB4qmoGDi9V9Viu3WpCrM40pClTO5pu3Gw1J7rVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwYvpOg+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M91bhk006834
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=; b=NwYvpOg+xZS7eHP0
	xDNER6FmPa5tBlNEMzLiHHu1qY+74UFzQbYQXWlr0JRsVQTkUi0v33MPdgcYFwix
	rz/0WJ2t380Rag2TMTjVmrBUe7pYiy3n63iSjuAoAeEMO9Gdp+gW4Iq9USX8XUk5
	edOKM4JrJn8KVY1Y7ZwwBfGvg8OBlvQolFgGaSq/aknrz0Ouqup571qn+SY6OwfQ
	s0PbBgH/koWZSlemX+W6Dqbg+ojVDk0H+jzSrMBRRHnADxLN7RHhjBTMEPqCFP4A
	1srZ3nofm5yzwt8td9ZGMIqLIMd16VP6bJCBMJB5XgIiJydcm7BiYENtMWBo12qP
	agglDg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhmy1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:42:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5509ed1854so2890814a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548519; x=1759153319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJQkYNJ2ptgfx/Tld3lEk18PrZsK416NnAJeaB5RM4o=;
        b=QOkgzzgsWuUbKKC2hpMAXeklvUSN9v1eN8qluvnyn6oOV9kTmQ90/6ojAQiuxkkBhi
         arMR8fybct01kI5jLNCH/MwT7/omDJkGwrvqAkOxwwsJyHexDvHuS3F4Ngzkxw/MZf3/
         EqyB4o0XH8OXEJaYkUuACmPEpTgRAsBwB17FXPJsKc2aoiHcIU47f2QIZsIIFyTKT1sj
         7ijVtxh0MdFJ7GBg68/UzTOvMg2SSNN23Dl7rQtOtUhpfW8F+V3NkqhQmFWMcNvBs+os
         FpCWioX8MqwrZ+9igaqSn9LcItrvwMpcbMBD3emYzCwvmWN8x+js3Yo7ZyPpqZpbD/yl
         WEWg==
X-Forwarded-Encrypted: i=1; AJvYcCWAPN0rtWrJqiYfZalFyl1Q6KuhK3S2DkIiP8vgfIJr2J6tHXKwWKyQHeQF+eVU6jPCX+C/s9d8kpAY5b27@vger.kernel.org
X-Gm-Message-State: AOJu0YxF5fzRjn0WucsumreNg2Q3QSayyQUO7or9kgV9sfxlEYKHEiTQ
	z1phc/v1W/4PysEL8RV0dkaHAZ+MY8Z/N1m05pq4P5T0UbiPgr4aVYvbB2JxkduP4BBXHHLBG7b
	rNtMlXHst1IhYbu/+An7pOSgtZ6Fxo4dKV260qwCYl/tHC6pexy/1eOArRjSxQZca8iWa
X-Gm-Gg: ASbGncstr4ErjnciROnWQsnpG4aq/uC9or078QeEKtcZypJyQuysZsl4lcFTE0cBb7u
	RVJb2NJtIoOWbehp0RJO4QxIL+Xws5ettyFlonZjp4+xqCAiY0L1f5GnH0azm9hwMWSvz3Dcedo
	JLAyiZes2dglzPhySYTXckYzx7/eMs88UxZJT2LkmtykcJZlQ+bj0BZzwiOvoiuVm713jfbThnK
	f+OoX5gA47IUZu1E7tESQ4RYORVqVuOfs/A2WpXQ4gVt2uQR3SmjNIJRGlXtLIYpEgCgu0lcOKF
	tWmpE2SVGJJ6HYx/HG8hB01PB3lKqLiywm48Q7rwCyz6VNuSlLK9iiroq50D1x/eFcFhkDwSi/N
	e
X-Received: by 2002:a17:902:e94e:b0:268:5892:6a2e with SMTP id d9443c01a7336-269ba59b78emr169070435ad.56.1758548518408;
        Mon, 22 Sep 2025 06:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GSFmhWYvpYF0EOoGE36KcGoA9Rhnhe/ZjWh/d/dlfb6rO08M9tGC4TLjf/3UCGfieqRxAA==
X-Received: by 2002:a17:902:e94e:b0:268:5892:6a2e with SMTP id d9443c01a7336-269ba59b78emr169069835ad.56.1758548517815;
        Mon, 22 Sep 2025 06:41:57 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:57 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:19 +0530
Subject: [PATCH v15 09/14] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-9-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fkRav5QA/W0o9Ycg3/xbut6S1Npfgr1jXzERBrOotDE=;
 b=nEF91WM16FRKVprlDcNfVQWq2bR49it9Jbo2EoH3aVuK0XkhCYHknxQNy4bTTsN+sz9xNq820
 k2On/w+tYoKBrQpRIp/RsOf/hNnMynZS+XFJDUOtM528sIVCEEvrJ9u
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: SrWfhFZekB5YIn4sFJ1RbZ90h8T2xF9R
X-Proofpoint-GUID: SrWfhFZekB5YIn4sFJ1RbZ90h8T2xF9R
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d15228 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX4Vr0Au36eLi1
 vsI/q8bDWCTi90ondqX3Qkrzk/bbr8rMZ0dgB1FITNM5mkTHFPFjxAQ+2khtBat0O4tSJA+V3EQ
 AKYB6UKJaf3ybnPVv/NUfZUBEPpOUG2BPOWSqSeesRiRL8dRLCJ1PgollJOoWe0g/j5s2p/iR/I
 eoRmW/LVH+68xTPxD63G5LP6f6yAUdZEYnK2PEdWryq8LEcEKzv4rNVrUd0+wr12QRnuDJxfYn+
 4ORVnSMoLEpir4yCr2847uhqUCDHVixDTLj3mc3892dFIXlvpFNcAkV7XseFh0angYO058rYJ1z
 dkV9FVkM0vJsOPAuUXkMgJivNfyJWvy7MwcbJacnTp21oPeNgjWWmhksRLKlyFdJI6mVrJTYuB7
 wxDOfUmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

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


