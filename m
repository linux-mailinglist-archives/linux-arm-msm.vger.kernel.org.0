Return-Path: <linux-arm-msm+bounces-86382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D48CDA0E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46CEE309AA67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389C7346AFD;
	Tue, 23 Dec 2025 17:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PA6Q+Mgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W102x9Y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF9346AE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509721; cv=none; b=QiaRlnXz+/QpZUSpio9yfLPj2KVLTddN8SqBh1rhdO4PFgfnz6NxpnzlAk8CWpzrUA5C/o6AJX2lYuMjpxlzJKcMRXr/Y5bB+3ojfYqOI1DA0zup7yhcWbeTjQnpLYp9mkunvKmZ7pLHKsyTNCN6cxPfNzqOQ5uKck98bpwdjPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509721; c=relaxed/simple;
	bh=Uo7klXz4CKVLIAFhyMsmgHyzo6vZoHcxyIjPIsWKeLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFoKQENwzesuWQwvcO53GW21V3jiwJDj/laT90yH44INsoCT3sVS85GNXUx/atwdlkBfMZlw52u2COJ+BFwR2g49dNwukJj86TAsItn31Tak98bRLyooIfe2WMbdvcjqL+QVTz3lnT72QSQXIMcWtx62TLUs0vcucCK6u73hUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PA6Q+Mgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W102x9Y/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFrgFG4044651
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=; b=PA6Q+Mgqq3E6f5TB
	m3GVbyTcNZEGixMWmuAM88Q+QEo7u7GXc8/1pYrpj1jfhwu9AEnOgLHpgkcYzt3Q
	k/QzCw/EhZzROCe41uAclvRqbSE2ZWwCgsMBLw9Qwidk4hN/uP1pi4sN8OucuPeI
	P27Jl7L2LVV3/Imgr41xmgyS2AoPJaoRFyRVwfawWZg5/grnSUeeyXXP4vHNzbgb
	6NahDkT6spxNz77gCKopEGPWvCoQ7r6KefQAqyrI5ZCAPqvhltSPZ1eYvMR1ZcSd
	j8T+a7V/0nJ81zjbFzQiG5Q3oI0+0Dj6EFZMDA15GB1r44x2CPNbWNF/dnOgTaIk
	Y+HDaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbebn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d481452732so10082282b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509718; x=1767114518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=W102x9Y/DVRPMjI/ErDYknAeyVlpZ7yIPRa4FkyuGvAZZJt1zOeAgJoNzTjiYG5dwk
         LVB8fPioCD6M/KQ2tR870DUkQNx8/1Pmi1b7cmSWgK7vAWOwYC1U8UyL0W+UOjf67C65
         sjyTgA7kb9VkK9s/izi0F+sLtaKw5/iSXa8l1yjJ10GrGBUwhei7g4NaenYxctyeiJq5
         z7AV3nQRGEmCiRu+xvA/I0uwM5APq2Jhmrfn+xegwTYIEJ4T5ZhZ+FtYMdxs/cHzDU1x
         HIAZi7HCPm0iY4Dfau23RIM/gjB/K8mCuvHiay+LNKaJeK/U6Zv5P93+AltV6ZgL+9jO
         RVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509718; x=1767114518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=TH2c+J3rMhBUVPmXmbSWjNSNQEdOBnZsoKzaAANcrVxeQ0IDJvcEIJCp6GsIYM5DF3
         paWc5WjcONRUu//b0LNgyNzoxTYIpQBxwELk+Yu+6LMt0rCW+bbrV8CHYbfVwl5hLdwM
         lYBX6O5qr1l6sTEXdgA7HezkvXAnoFnDP7/obG9sAz6dKj7OghIb2+Eo+8TdMQnXwKr7
         0lq12z+vgGWHmvu5mLnRpBoVdKltBkJPJa0vyyf7xizJZ4S8fLejFgSjQq6UZLhSJqbD
         TCxNb57ptFpsGZreGkBHSTzFgQlS8KmWrTpYSrN/n2GzWCN/yblziApozTVYt4w0r97x
         hs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU683EaXS6bHMkSqBq/zhm3YiTnAgjPhymMXUSYIQXVbBDMCu8NvjgXW4nQ/AZT2cdRnYvXzGq3+LVDDoyU@vger.kernel.org
X-Gm-Message-State: AOJu0YycCBuYrV/gwjznLlFBrZyYYd4l8ukW8Bi05rVn7mJARKdKdFgg
	74LdgHjt3U1PswDAlR0d6X4YxthUntd2fvOCuQlugtXGqJ3HVkUNTllJyujxqSgavvmXdRudChm
	TFACzTHjB7sXo5wYegWBkOp9I9tyecc7vVoL80AQw/thBM+Ahi++Z+YPKtri3J00cdIqh
X-Gm-Gg: AY/fxX6fMjUU772tWJTU9UZafUoQzlxA/Jzn6QKLMqqDpfne4A24HaeVHxsgHhs87aF
	g6XzvtRIcZtg7EELfqNqexAdwMvPgmKww4wrODVx6SmH8W5VditXyF33+Pv+0iXm2IkyXdWDG0z
	XRFULlzTPCzeK481/VZhakebih7N5U7PZQzRX6S/r14dcD6iPP1lTb2v8eQzSJC5YCY95j4uz/w
	ttlyUhSmfOYOoiXIe5xSkqWnTFF5KEf4EZPlAiDsogD+Ox/LIqZRxRvd4Ge+5o9PFVMEKkAB69Y
	86h6VTaSSgBbZPReRWeTx8Wok+JinQndWOYOjjbCuZ7Wa879PytVn049cyD38yupUPOWQkbGGjB
	veBEegG5ENW9iigqyBikkXYu0hSxHWS/8/bUw2k0Gu10qNA==
X-Received: by 2002:a05:6a20:9392:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-376a9eda02emr14169107637.49.1766509717732;
        Tue, 23 Dec 2025 09:08:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDPsmvLjxgTLHJmtjhdUkmH9fNkZmVphr+AfeK0f30Iygo4+BHC2YUjESeFt6TJsQwor0DGQ==
X-Received: by 2002:a05:6a20:9392:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-376a9eda02emr14169076637.49.1766509717256;
        Tue, 23 Dec 2025 09:08:37 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:37 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:38 +0530
Subject: [PATCH v18 07/10] arm64: dts: qcom: qcm6490: Add psci reboot-modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-7-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=2238;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Uo7klXz4CKVLIAFhyMsmgHyzo6vZoHcxyIjPIsWKeLY=;
 b=UyCKsyR+zpqEekSnr5zk9LECTpKfqgJ2q0uGOYOICyyRGufhh9JWaPmDMoxP2tI3u/Pf5cG2o
 hK4Agq99Pi1AhS2aP3Nr7p9qo6s4YH4vVWalpNtExTQXArG5Yvl89zR
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: dg0JYVczDx1lqQaKfdFEW_skpSBO21fF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX6WwwLw37Gh4Q
 /NM8P0jyPjbis3riMsbj9uFUDlfR3FIHl3F1FnyVqoOlIyIIsrF5fBiMs2PCMVLDH3ycZ4X+Z+w
 PwFmoE0GjbMY0xRnFhO1Vpex7MCH8rRb2bVKXdAq3G82BTHxfL2BpupDL/FFXip7FmBry3S570P
 ssjlZFX+S/MwV38MXAolO+vJgnD9h+sRAyo92urqkmw/9SiQf5VG0wRyXUydl5DIvFSSxrdQwXF
 Jm+NkXZTEapi5Qa4skSLQqspOVyAbjT1uqKXBhb8SItIV9bkFVTXkGwFoePSyhXkyT5yAXddyas
 56rd+rbvnmaj4CubIX4cYaeCL+yDOtP3skJvzbv1LOTs3Wd4yqbm41WRrZubfi63IiBTZkUdNcq
 VzY9+lv+iq2EY7tU8JOi+EUa0uutvqsS+V9te75hqkS/l81kqdOIht8dLe/T+5sTZ7mgjlYQCjW
 FpHQ75j9Y+z0smHBEfg==
X-Proofpoint-GUID: dg0JYVczDx1lqQaKfdFEW_skpSBO21fF
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acc96 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci_reboot_mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all sc7280 based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800cb9927627f991e3d97174cc73c64..e319a1894901cc9c56a89cb8b8ad0acb7a18dc99 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 089a027c57d5caed103f41f20c01fe1294b4c950..5816cc1c033c396f49fddbbcd4b09e5a633bc804 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288e9ef554ecfff59820ba39bf2cdb1..6e836e476d595b7e1b69a0859cf2f697c529cbfa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -935,6 +935,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


