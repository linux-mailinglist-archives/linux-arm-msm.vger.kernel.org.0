Return-Path: <linux-arm-msm+bounces-84419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5FCA63CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 07:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10A831BC26D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 06:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437D52EC569;
	Fri,  5 Dec 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBZ3tJPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eS/lN2XK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0D22ECE86
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916315; cv=none; b=WsZkbSux6tjTjRry5Ytsr8PQmLSXcEAbNgy6C/PyT3NfpTHvG8mRkDt3qixfJGi4VDlzvl0SmfWjsTE86/PlNe1JgNgfvMFFspQeOshcf6Ilytrx0N8b91x27pYJD9m+J8InE8Kj3QF69kAAJS+smIPoTfRZF20PH3gTPfJ58b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916315; c=relaxed/simple;
	bh=Hsq4E4IWiDoqeOJT7w3Hbi8BUUO8MilwTO6vcCmA+Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeR/4IzNsVjKVZ5Mx1e06wriPrx9DmT8fSmPa3OyU1UjV0qpJuoilsZbeuko7jv7Qt9R/XXTYYhkmW9qFWYn7UuDNmGet+Ye2av8WwjVNGGuKqw5JYXCLvWC2b4FDPMcwW26VeI/6UDiqNP8X6SuMZgOGmzKhUfLdulL8TcNpsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBZ3tJPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eS/lN2XK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4LRclD2517091
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 06:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3IKbeo1S+3T42iTcf4PfA6A9ayDc4EEHHY1KHTbwX4=; b=GBZ3tJPTtT6/7keG
	NCP5+IiLnnN7PYHRCTUZKspgoMAHmHuc9+8MhgaiqMIU0gGrGLBa5fxMLuHcy31z
	gxjO+1hq1jScfkGoRYP+mGt0ZyuCM5u959S/VuP2mTGhmHYiAiAuAc1VHy2LWtVe
	Yt3ShCHI909/Fx0YpB9aB/mV+AIJVg6PpZJDNFm6GqFgATymPfzVfOQ9Dd7cT48i
	FiDTRavScBuzuOXKT6UkZ9RrjcUtuB/KkMGNCirVwaIeilyG/+RfvKN6IyfE5RgT
	mLRGFy2bBFCWphN+jrt+zwVhz2bGK5B7+Ge7n0BijCqO+CGMjKKQ1XR3r9RF4Ki4
	Iy1i0A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n14js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 06:31:52 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7c6d917f184so1671340a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 22:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764916311; x=1765521111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3IKbeo1S+3T42iTcf4PfA6A9ayDc4EEHHY1KHTbwX4=;
        b=eS/lN2XKtItSgIu+DAjSSY7dPKvfXYTkwR8jZXjfGGquF1J+B5OhFrFtrKbPrwJyHi
         V1ZJXGkWm+Y8nQqkK95J2htBi1azspZQwDb/ag7JfLj2qwACtbktwKUxWz5bzJM/7oWr
         N99iLsi3kJ+XjJX0iwG37kNzbT7iLpaHHUXcF1aWTnUhLus7RBtzudLrEP3SyUrJvIBV
         WWtd8lAhl63oADlbly54JBgA5EQ/3/pOX8XT3fiopmHXevPWRuiWLBmWwf6Qb78q8Tbk
         9SHr/b9saA7ch2BruN0OkS85Kjtg6ETzRA0i2xDIDY+EhVEP6tgTYKNombFh2Zlf1t3o
         4VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764916311; x=1765521111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B3IKbeo1S+3T42iTcf4PfA6A9ayDc4EEHHY1KHTbwX4=;
        b=fjq8l9r9Yz1h6YeJkS4mqemL90GUMcwXuarg5pIDTVlXNgMNr0oGTyD+pJcTccVvrW
         AP3bzJG46mgGftQ9iJpO6HgWeUKgfRTgW24IBmZ9DP3vzc2rMmQvHT7yAXttYaDKIGsw
         SY9iiby1bEkuWGm2wZfKVBkEns3N84eD8r0JMCYlbKBvWJQfYZHrsBreBZ2DHPFyboDm
         gd6DS4sjRUm6g+V6eJWVfqNvQv1nBGxZ1On7ysZN/5F1YZnaZun6MoiZqHo8uG6ylNIG
         rn/jsxstJebzirPXLVgmzMGGEc5v6yGDLT3+VGM4UWXrQut1bVdSzdKImlwOWdQNVmva
         7zag==
X-Forwarded-Encrypted: i=1; AJvYcCVFS7GXA4qJ8j/LwNrgFLumPE6GQlhKTjn6YfUy2dt9zz0WTgyp3VlxkCZ7mRTkJxa4yjMmWt//mVuC2yQD@vger.kernel.org
X-Gm-Message-State: AOJu0YxTojHKNw/DoVrGkma5ccluZZ5fD6vtxSc34K0u3FQroVDuTqv6
	A0MkIv1j+V12moDnBPkj6hfr4kDC4gpufUR0JvUIY4lxSNDz3uU5dpqvDcjtqBMENrF23SE0ACt
	hbiLmlxmjUX+pfs6+RS9sM+Gp3B3qm023yXZs8U0zL5qDbUD9Vu8swoixby+EHSitlhsI
X-Gm-Gg: ASbGncsHDr528Gj8nCx+Z+tijuqaz4FA8pxRLWhIxkxbbEhcvJxW7dFZJUCVqcUmJ9l
	8WSrWKw66hkUXJYofjRV5GqM8CRHSJJeNm1SGxa3NrpmrLBoUw/tpV/977+SrDNCxOdiJyvR896
	GhWTv8JGP1WOm+VK9VpFWtnIfMSkD2LLxeu0C9QJgkMvUXm6gliK6rBqJYe1XmXQUo4nnGvNlOw
	Qn7U5t2Avb+pJPoHTfH/cxL82oCvRgq9MM4XBLb8YOkhgUOSP42aEWG40T0PTEZbnKE2XrG46pO
	ftXyhHFRx/ayv7jCmRp52P0YfOXZzARXeMM6xWYRRGya4Uyj3XBouN8bCCLDuKoNdXvK0Uh+MfJ
	BuUh6i4EnFX/wdpzqvF4ho6aXbPiaWlQy2Qk5mhq0EyH7zpsnt0G94Oyq0/1a
X-Received: by 2002:a05:6830:828e:b0:7c9:599d:c538 with SMTP id 46e09a7af769-7c9599dc8f8mr4203413a34.16.1764916311559;
        Thu, 04 Dec 2025 22:31:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkS50obyg+QWu8jBRujpBJATUGpcqovaMXKrG9zrO8j7aNO16NPJEhp5cUt6CnzaRkogyE5A==
X-Received: by 2002:a05:6830:828e:b0:7c9:599d:c538 with SMTP id 46e09a7af769-7c9599dc8f8mr4203400a34.16.1764916311269;
        Thu, 04 Dec 2025 22:31:51 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95a8f85e7sm3223326a34.4.2025.12.04.22.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 22:31:50 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 22:31:20 -0800
Subject: [PATCH v2 2/5] arm64: defconfig: enable clocks, interconnect and
 pinctrl for Qualcomm Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-knp-dts-v2-2-596d8398c6d3@oss.qualcomm.com>
References: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
In-Reply-To: <20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916306; l=1491;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Hsq4E4IWiDoqeOJT7w3Hbi8BUUO8MilwTO6vcCmA+Oo=;
 b=5iO/VSBQuzf2vOgC79H+vfnvDpNboIISCKJadFfnxTrcLD3pfJ3qb1oP09uVU33rKuNuKQlzw
 hmRKFwdhBXNC5yPO6+zyqXG43C4x4NGitYJgS0KaePCSMLbhbE5lJhY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=69327c58 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=agaryqCksHM5hhZjhYUA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: goHfEd1kxy79eAEcTS3hXKzcL3mvc796
X-Proofpoint-GUID: goHfEd1kxy79eAEcTS3hXKzcL3mvc796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA0MyBTYWx0ZWRfX5+8lZok9uznr
 YYxCS5nYRAQ/HNaPEfwCLXa+DlBpXx26m7bxMntbepGg3AplS4SNVAzSquYgAapq/JIRJDQYnU+
 /YTD/LJRgENALZRkC0QSlmPH6KWGfhqJ0w7NCsHoajZHpkq7TRDYgIYTPZ/HGAzII4RmjXhBLr0
 WRD7LWfbx8R2u8WxeAPFpiIRQnEGVTaEEG2RrTYAaSAfzxz9ZOIGt5g9d+jLjjnvWRBb3jd0+4X
 TAiwk8iXLQBM6kJnqroje1+a56Sy/fSL+cQ8LcxEg+Kn6pjV6MPMm33fH2rZOUd6d/O9QJnEff8
 sfior/5PlYv3LkAKm8KWRxZ+44gWEK3vka/A0v3TTC5LT5QB/uqii2xLxQXefMX0LWtDGUk5Vz/
 5/ymLcER4CHn6fM4V9p2NVC0Fb1/MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050043

Enable necessary drivers for booting Qualcomm Kaanapali QRD and MTP
boards. The serial engine must be properly setup before kernel reach
"init", so UART driver and its dependencies needs to be built in, enable
its dependency GCC, interconnect and pinctrl as built-in meanwhile enable
TCSRCC as module.

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


