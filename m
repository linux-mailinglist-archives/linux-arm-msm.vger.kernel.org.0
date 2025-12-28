Return-Path: <linux-arm-msm+bounces-86754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F63CE549D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E26943026BF1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B212D5C86;
	Sun, 28 Dec 2025 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB0WcuIF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DuVhTC52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FDC2D3A9E
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942514; cv=none; b=WOolur7fQewLFpf/xJmexGTkimuzF+/wEyolfypa4GCC6WXCcOjG2gigD77h2FXy3N1M3gyWof6wVkA540AClGySjQlGOd4cS8DT13EClO7CJZ8Lttqci7k5W5lEDzTC4f7+YAtxtpuz2A4KzsSv3AquqOUOmd/dEnZhWDXHAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942514; c=relaxed/simple;
	bh=0rsUdCdVzH+igD6u68w9uIiPh6ggbgRgiwDr1wBAjm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItFiRsotGkK+DotEpJVZxIy0JQVotCdayPTZ49S3/wTXVJ7V9noa7wRThBxw4xs9WdpXKMsXj6/MuYoX+4LYPMjTU1sXe/+22TZ4c+aCQ8vrm+N3+r3rCfHPTGPooeo/Iw19OED5ZOfR5OCdzdzxG58bBoPGK1nxYy+QXbfy4x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB0WcuIF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuVhTC52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSDQWqr2130927
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=; b=nB0WcuIFz485+40d
	dE+ut6bdLLqNe3CQeSbbZjux4HSYxUTifHQuvKnngpSO7N+6O22NhZI6AsJnL7ts
	uDAPujtbFUZ3ePh3UsK4fV7P7yV49Nr+JiH2T0z+cOT+NH1Pw8uhTbKhPXMSPxLm
	Ing5gNZCWM2S+mIPOYlRJX36WtL7nhgnmWH//lwk8m0iorqPcfVoPYSTZzItMUAZ
	zlp4/C2M1etLPepflviO+u7z7KRGjCgmXoVmluodYwti/lzuxQa+U6c52zauCNHI
	iBzK7g6jnmKW3op30hArEZups2AxxGTlZMjCwFtGbKHSkEnakdfqjI5rc/kDs4Y+
	/WON6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6admd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2381ea85so183275385ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942510; x=1767547310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=DuVhTC52odpeKbYfm0dIJY7LJz1C+TYb/2H/1DnPXelUi6MEhVpqW+wA7HpJEAIgnY
         /ezA6Kk6S6jM+haXHoDW85y6qUeSmlhbgmIO/9F7pYSBEA2qxULpXEicuO1ywrwNq+OS
         XxuVc9Q4hE4OTk11qm2xjF46NP7oRmTBKBylLQnAPHRbkxSl15Iwofefr4wtqyQTkyvT
         8x1briOatYU4SwxfyKW4uIcr9sgzbrpHca0kpwf0sYepvyp/Lwyx1ylopWOJkv0ggTql
         s3koSLneAzGaR39k2qf6IdKxNURDUwPLQHKS0x5DwIj4KfYaD4EWKW/2bumeC+5Fw0hw
         g42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942510; x=1767547310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWKchhYmME2TIdgWLH1Giry57SQALMGVaYfhAJiBNzg=;
        b=X9lHDlLqfupqMo8GrNXXpnybDLVb0pZVBB1/vBolZd/r/QJuq7WS+BZmE+k1IZe7b7
         IPuACKS0f3l7/uBm5l0It4Jniyqu6HYhEqEOUnLcZ6vyrSSkk9pif1bJVEzU1a6te5oP
         lUi6aDwi1+Um3yVbfyzucGhYe3i/vJ3bGKBx5XVIHqP79jvKedP6ZerTZXkBm7Q9i0jZ
         nsgSkPQGwq3e7tcDx6RBXPA9ozgAAmV6ErVHX6QeMxcrGMsl8fsQQKKxBYYmVi7gnCFb
         G3Zv8hKqsdRpFhNo8spyi/5RvLjhxOTeU2DK9Mf5HTgOoXo7B96jhC22g6YncnDV5b3Q
         qZHw==
X-Forwarded-Encrypted: i=1; AJvYcCX3xeZO7hlELQ12KY8JBrGr0CdaqdBKUiuIRVuYheQG8iXD1VvJvZu4RuiQMw9YiwsxgVJzpmoN3+BO1VmX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0AT5Cb3AtgQV4Ru3dpDicmSl8nFdOaqAa9Dpdy1ZkQOuq366
	LpNNDcy/EEP4jJlBKCFT+OAeDjLwZSTe5Sj8yLLOCo0QR4DLV0WCvZFGQlhVLGR3pIuSZbuEcGK
	Ak1nmSsZIl250Il/SqlZ7Dnb8Xc4RMmolH5F8UThMAVnRMLpgucar7/ZOoZV9iVhgaUaI
X-Gm-Gg: AY/fxX4sesjbl0bYh6iMvvf6s4CtbInE/uFWtoijajvt2Srcxj8LC1p0UcUjTDGJhgR
	Xj67JcLyMjWi1YbRE+YXda+xwFqG7Xju3V8taP+N+mIp0xkbEDXZvXQAYMXD7r4DP2W/LYmbIXh
	X8I+vwL/m+sLVN1jKNVnJFxu2ewFEXyrxL2dxbv1uknpJGRYcBaNhcR822fRoEFmv+4l0KyIobg
	zVPOSAHybIoyqAJt/qO1ZJokRJlljAXI1hp2HqB4ZkSk/0hhyPHXQ4jXXzLybwkBvV+CtlHjzND
	3Ro7HGdHr1WAv/hOvto+m2E6AbiJ57nnWjE0XoZQJA4l+8RMgCF0PCvPrylF7OaWdURul4zV+0q
	eqkfz+0SKIup3jbmbDBzC+YI28ITfjJCVHCIncwK++vTG8w==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr297817955ad.19.1766942509909;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmBJ+0QhDD76t2QO5vv0elZpbdJjQleOtnh1ZWFEZMsqZX25brOC642q/L2SSYN5VG2XWLTA==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a2f222b5d3mr297817775ad.19.1766942509415;
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:49 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:28 +0530
Subject: [PATCH v19 10/10] arm64: dts: qcom: talos: Add psci reboot-modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-10-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=1101;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0rsUdCdVzH+igD6u68w9uIiPh6ggbgRgiwDr1wBAjm4=;
 b=9blsmilZ46hLAnaGdTYSnuMNJ45gLWc0rN3wPvJFD9fSMGaWSE1FfJ7iGFzgLHy9rOIioHi1x
 yjslxJDIaGvDyPWOUvESfbSZkSJJaGvjZuAQsxDcSEPdEI1CNqvTSYX
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6951672e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4cuBwC7xTQKafrdxVH8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CcsS76_tdV_eZhb5rJS83Ha8d27rDNGQ
X-Proofpoint-GUID: CcsS76_tdV_eZhb5rJS83Ha8d27rDNGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX6uYl8/FpsEJK
 oihEd/Cyvx+xh89IRafHGYF3vcmAhG/hiNrm30YFC8M7fhy+/BmOXsT6Aed5weZjdyDNVrhULNB
 XxQlSksJ7z9ZyJaz7V6abYQ6/WkKyx03kjeI3d8BfJJfZ2L0ivNQE9yR4xFnToa27LkpLSzrrZ3
 2LitOgWjrSQCpUSHTRWn4p6TZsvblDcHrjo6+mVgejN3F+XGYix7LIoNsUYdBHr2fDxpSlyiM2y
 V+dQ7pU8RElg/wrxtxuvPDta3RO75f5JPkUl7NkxJtMUI1vKFi7tDQ0+blfTF6w57CiK1XR4ZL6
 wdSp9IEmXLACIl/LCrPaQ2BepRc2FOSHQ+oMA/E+1ezHdAREE6geUa/ScXNAmbxU9/vOt9BV/Yn
 isL8Uk2YYfV9WtifreM4X+rgNt6TCXjp5yE53BMgpO5vBtB9aXMXQDtZFnWcUampbYI/jP3G0QH
 cC6QCoPFlFcK4ZvP8rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

Add PSCI SYSTEM_RESET2 reboot-modes for talos based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e3136229f9015d49e2be22f6b28f1e842f4..11a2cfa209065776a8ae61c6e661c09bb871c400 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -613,6 +613,11 @@ cluster_pd: power-domain-cluster {
 					      &cluster_sleep_1
 					      &cluster_sleep_2>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


