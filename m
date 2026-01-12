Return-Path: <linux-arm-msm+bounces-88561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6800D12889
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 622B330C36C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FE03570A7;
	Mon, 12 Jan 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exGr57N0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhOP11/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A51F34F494
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220623; cv=none; b=FybzjntepyScdg6g5edGwutODhyO+Vi9+0Ev8nzkG1kXnBVylQ3YFq5VGNdVN/Fy9A9OGHPTzwiutgPw5a+KUI71ykjv6mGUsaqfk9leDwDQgbqTtzSMhoOeCY0tbzFzHUZANWfUmEUxvSFlw4Iu3D5Bihu5Udo3wTXNB1O/vmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220623; c=relaxed/simple;
	bh=eoKoexpFeau1o3ktFqjEUKldFk1oyTp/UL4kxVHGhEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ka/eX7fH6dqVz6ZAUpyNpqg28nAWqQSqNhdcucjG5Qq2sprqZrAGonF02iXpP2axSRTObBiAhIDLyVagJ8dfHo2USlBoL+ZQL+bvoN3n9hNGg8JiO4GUNJsPnEDli86iFX+36Weue4SU0IT+mcfrhDppbPZghxuaqW9LFW2DU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exGr57N0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhOP11/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8ruPt675944
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5vy56J5RovTKKYXVVxWMW4+bSIPOFn3Ei/W3UmQA5M=; b=exGr57N0LNCwmuaF
	1ygg5q5iGKR8YqVlr8+e0ZSG/ZycV999UUFU7/h6y7FUV893QL67xGb3bF+WxJpi
	HoLVdqXHuStAg1mt1mqxUlEI8z3JoKqbL9ZvM3J0FzB/60ShYeve/5EJnmVx6iU9
	dlUSUFvZ8vIBbbjt9pqI5eWs51WTC2hEPkwqKpNF/8pCdtYn2AilIvAXBexRa8pT
	j1qf52aq3/fpshArTy5eTqFS3be59NsFqkRZ0oNfId9RQCCE1dNdtvUhaqL+cmYb
	mrLwWBlnjvFWzBUWHwxmMXSP8WcysBoEO+6J7Ulx2f2y66xcg1OSR/MR8LfX6KRE
	+Zco2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur8kxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:23:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so44630185ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 04:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768220616; x=1768825416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5vy56J5RovTKKYXVVxWMW4+bSIPOFn3Ei/W3UmQA5M=;
        b=UhOP11/j3bi/5EfxgP5uH2nD/pKmneNxxppSlkA0PGZJqH5zohTjoJ2/Di+QfqusEM
         PWRohEnBYd2jlk4KZSnEJ4/4wODj0SV9O4CVERKmi73liARXnINSntqvOa4fw3dFuQFU
         UVcOeDvR/1gT0Ic88ES1AvFsIN1rMvEX8XTdZDOLfKqUd5PWEGrgt4TBcjmGPvMASdie
         1eUuX5f5MbjagZPg7tEpIUVvMztprvZ2V33rbyPYhgNDCsQI05BvdZKdluq3RqICocr1
         VIvV5/uABaR2VPwRtmIRj8iy2yDMo4FhOxvMhXL3BpUrgFvB2BDCTpJZPKXORqndqp5E
         UI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220616; x=1768825416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+5vy56J5RovTKKYXVVxWMW4+bSIPOFn3Ei/W3UmQA5M=;
        b=dyXQVEXkw5PPwH92JGS14ws+bQpCcNh42lxBKbexJppieVdjoZi0ILNyRvoyq7DLz1
         Xs8xvbUK0pCUywWSKvllNPLGj2n4CGaSlsrBqT53j7B2XPxdzzjsCLH0lMnkahg5faF0
         FCAKtb43ouGmFziuYdR3Ti64GFVS424IIxFsQMo1e4twdrDc92zV2Pt/F/lv/eJfOv5c
         SeBOZLPzIzWa2+jbn914TIpIjVCYSTCOZ55Fw4tAYTNjlaV0+Rurh0VFuvfMVHqwYw5b
         th8ML+y2hJ7HZIrUG1Ua+AUPKILw63xKZo5OPbVoZiQ6A3m0HxQ4YFJ+4kkK5YVzLcE9
         q36Q==
X-Gm-Message-State: AOJu0YwhTnkOZpBomIt4VvP0R8J4OuqlUPnOVrKcovheTn2iXeimY7Bg
	W0zZFrMMYTmtv6J5xNb8fnnlDqgDGfgJEQCv9T6PRJOSpOhEAPoS3Ort4R83uU8d4KRuomxH8BH
	yZ8jdjiXSD2aNYeQ5dI6dq8Zyn57S49k0vJqAinqGItqCYCeTIAM9EGei4tUupHiy+ZJ8
X-Gm-Gg: AY/fxX4c1E6NUuoZnbBCzLXAc/cCop7/LLaYUFsKDV1gzREPuuke4nq9jtZ0EA4Ex7t
	ApvNq+dnfD2Gkz7ZN2Djz4dLMrOvNQiHZ26BtFGGk+6OTCW9rRrF4nPkvyVESWwSIqAio9AdHWZ
	j7epUCAV5FfIO8+RkBPVYGmYs1+PpmaO9IoIWJ6OnvdQz0J1/7I15gm8zValte7lZr38Z2Dhcrz
	yyXQUP3jpmJ4pcW6M5AE3VjpS5GsSQwGTS4CtxyCdNUZo+LjaaJxoZCVBTrkLRStrzhrQAxZuuE
	lVFvl+EEUHYcjBFBWn0ph3g2J9WAON5Oez4qE8a3Np6XsNifmJvK1vctPg11bg5y2NyAnzaXrrV
	7Yrc3WLN4/jcw5up2mx6Zqhj1Vkx8Vj5W1jYOB1FT5JvbI1H7Q1FN5APFRuFdlobG5DVIxltxZa
	OhZBKmFTFzW7hPPLBLhYMnUQlkP6eV1A==
X-Received: by 2002:a17:902:e545:b0:298:639b:a64f with SMTP id d9443c01a7336-2a3edb0de06mr195250075ad.6.1768220615864;
        Mon, 12 Jan 2026 04:23:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4wVoW1Q51lumbKTx/mzFfJQBdhLaaaVxhPv2rslcKMQMEOldQJyVxmdIRjln1rDvJRwz3tQ==
X-Received: by 2002:a17:902:e545:b0:298:639b:a64f with SMTP id d9443c01a7336-2a3edb0de06mr195249865ad.6.1768220615383;
        Mon, 12 Jan 2026 04:23:35 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47147sm170875665ad.22.2026.01.12.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:23:35 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 17:52:35 +0530
Subject: [PATCH v4 2/4] arm64: defconfig: Enable Glymur configs for boot to
 shell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-upstream_v3_glymur_introduction-v4-2-8a0366210e02@oss.qualcomm.com>
References: <20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com>
In-Reply-To: <20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768220604; l=1542;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=eoKoexpFeau1o3ktFqjEUKldFk1oyTp/UL4kxVHGhEw=;
 b=0h/xAvW04+fCqIvU19E+VISCbqHa4xX2Kgs+RKlz67b3i8VkNx/IuzdBWT4U+blo/FsDsnECd
 L1TTx2EGlkWAmBYybcI9Bx/V2lC2F0fl3JH7aovth/XAuPyfuTMMHpv
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5OSBTYWx0ZWRfXxm4l3Ji+LZQS
 fOqnWx1YfP7e3pmAQec+rg/VLtuCMMs2yhJQ2plgVDLalu0+rPFpghLR1Mf+J4sz0ShqoWCiRlf
 nRbQZdNbfoN72f0d5ZzAUR8I4GC92xClo/SvjJ4/hlfm+2q4UNZ1xnetxb9ZwmMUSocXq9p3P8A
 MpXdInWxhVVbd1wIHsMugiuEF0a7rLveBzu5G0QjH5696zvMt06aYf6Lu4ioluDhSATC4MRhZrN
 gdrLaKWBgALkurgS4E2i+eqbuR2M7ckbjWnYs3V4OfzbzZzxQEyS6aIfvpN03CLlFYPY+yfqEP/
 /4/9DfSPd/96ZfgvcVIzWiztTOR0Yn3H2scx0+tAYzuwVBd8tUb68se+54i3aTCpM3uzhGIYj9Q
 MF/qHShDXkn288VlIP1cVeZjxXRBS+80gN4LRdTuw/gmo38t0Je3Iew30ynxcpXtW47PBMiJ9k8
 YxJFe8ePkTzHcrn0AmA==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964e7c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G4s3PgB1coGp2Q1p4bUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: kmj4uwkJ8S_BLe59LomVul_wT0qMQlFP
X-Proofpoint-ORIG-GUID: kmj4uwkJ8S_BLe59LomVul_wT0qMQlFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120099

The serial engine must be properly setup before kernel reaches
"init", so UART driver and its dependencies needs to be built in.
Enable its dependency clocks,interconnect and pinctrl as built-in
to boot Qualcomm's dev platform - Glymur CRD board to UART console with
rootfs on nvme storage.
DISPCC enabled as module, used for display.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c43dcadabec4..807881932132 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -645,6 +645,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1452,6 +1453,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=m
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
@@ -1844,6 +1848,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y

-- 
2.34.1


