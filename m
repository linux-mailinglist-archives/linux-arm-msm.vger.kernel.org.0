Return-Path: <linux-arm-msm+bounces-108764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFm7MnLFDWrg3AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CABBA58FA54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B0AA30BD18D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E659A3EA955;
	Wed, 20 May 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSHumoyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO6BaVdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE723E9F9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286514; cv=none; b=vEgoshxDiXtqOmuqq5lJYrqMJq+LMl4lKHDdnJYvYa9x7P2nr1ck5hPzUqdYaO0+9C7mcAPTYFkB2oBrPhKl9UzXvG++kpEaDkgCcdfMdWciiVVNjzCNx4lLBjeSyMX5fS4GeHQNkcQqeNUTfjpWG5S+iR5MVqYNaSlFXQFzeFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286514; c=relaxed/simple;
	bh=38REJZzZ6Gkdb7cbpjFbicsseIUrU9NKmuQG5Z/mc4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dO00pZCXVAapCx14Edd0xwcXcAcWxG6dG2wO5o8t4R5bzLf709576nWzRKKWcHeI3fXFRMrcQPJCDabHDt8Zn0UYaj7gd/Ptt7D58Gzcn7c/RS5uMSlSFj2NdUxzijECfzUjIgjM1oivkygTxi1I6gR3DzH0uwDlePBu0VYkRH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSHumoyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO6BaVdV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8udjZ4115189
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1dHudBN89V8earjzqk3Mx0Toeoyaw7SN5qC
	KeHJ90Lc=; b=fSHumoyv/a1D/Af3nEDLRCtwadpHfd+7mBmvPUDvwnITyhQ3MCr
	ZWpTW42r8csORwGG9nH2gTlPNeDtCkMzvuWzPB+H3/MVYFmZ02NtoHC/mTK6CsVn
	/OtDYA3En0QlWc7otwNNs2FApspNtdz50LgoWXsfE+YCAUgQjEiK97nRpuPaKD0B
	ePxQ8RU15V074W+59iqCPFD1GNmK+j3JWTjUyaYb9EeO3PUDMn1GFOnlI2Vbz8Dm
	ndSnoH2HX1rqbf+00O2i9hoLSE1GT0b4qyL1WWPkaziUYt5B66CT88jPzdvCcJzb
	GJAGXUCskyeftWTaxCkhAB0IDFxxe6T4sZQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0h5hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:15:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3041ab826ddso1000978eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286511; x=1779891311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dHudBN89V8earjzqk3Mx0Toeoyaw7SN5qCKeHJ90Lc=;
        b=kO6BaVdVKAe7/3O2ipT3K2bmJZcbyHJ58tWNUXBTEiJZvoKWcQXYYDXX1a/pzrVuaZ
         Aaj9i+pPMq2XwmxAEX5srI6Jd52iNXiosQBFwzDkX54vNJYLUj0PeCEUvJ1ITJ4KysbW
         Dtdw5pvK6+sigmGrWcjqW+QXh0pggQLRramKHY5/02Je2N/QAKuZ5mj+mY4Nfih81q12
         iWjG0q4NsbvJpgcWOQGkhMTnlDHmPXbJltRufvqjYTGZhbCrsA2ATlvMBqWaIfexfNmR
         I0dKWzQ5i2ieTik/UAHqkNoTz5nJ77tqA5za1RgIrbzfWJwUxylwV/lpYhmkizgCIekV
         5pLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286511; x=1779891311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dHudBN89V8earjzqk3Mx0Toeoyaw7SN5qCKeHJ90Lc=;
        b=NnTEm/zOPqO/6TiGHTK6DQkL0nkjA7qH0TJPj8pCxzr25zukKq5xxSRbi8Ycy8dSz+
         rxx2SyLYRpEBSnsmMoItnEKP5klM5gtZ9TfI1XnKjsDDgUzqJORDsehC3+eBecx4s7ZR
         35VCxEsyjygJVrVPDqkKaiYJWlGDS4c2rLByS20ouTrV3cTMok7Rl/DUD+a2XGzx8yFu
         VGsnACE4w24lZZQjAytby5ouqtVZ/5DHuX6p1KSoljxG81YxJpFbp8LuME024NJJ1aSG
         Qxvj76C4HDC6HE3AT2ztT2O6rV87lM0ZX3TPKJETyaapm2Y5ciO2622AZ+ykqMlqrdZP
         m0rg==
X-Forwarded-Encrypted: i=1; AFNElJ8zfjZEp3y7DPl95uHasExSoNn0/3Y3Jt/Iva3BTHTatf3i0KdVMaYrNewLZ4fNog+0tD5OwBovkLFFB52K@vger.kernel.org
X-Gm-Message-State: AOJu0YwHGJEx1/rd7IoefbMleT/kQRjhbUIFyBAtWGmjz1g4CvjzT49V
	fjjkynE23ehpHmSESy1Ld89brwk+gx0yjQk9Kd6FjplVcR+ZYl5N7Ms5mocDvmbxDRdV1X5Wfes
	LuAy441Atv9j684e4aN6kpBBuKoZbhWVxUdCAdhB7z7F180FUNjs83LeUHaS6BklAksZw
X-Gm-Gg: Acq92OEoHElLf1TCogc30DNgMg4VshwclLo3SuUUI35dKAEjAJQGVt1m8sEdRtVuTjU
	i0avKJi33hoeI+CT9ekitQYvsy0CSPwl2kfLH7a5r07Z8mZmVF2vUSrmpJlCoFl88wWc2FPtytV
	7qLpFU/4bDP6VEzdilerZ9DP8ZXMDmCW7dm8QRW/FJF1hM0Q2luWrp3DN2ATzGE5CaA1ix9c60k
	zQUwebMWFIjZ0I1yBtfnlJklMSS0KxJUdN/r4FQjtJ7dCgrrob3KMnEoLSPsJfm02xQUy6m0nYU
	7XiXEJnh2aKJXwXpRTNXuMEK9GZyeocRRcnafHAj/OuZ5xwFU/WZZYFh/iNYNn8YTVIwNaAUGdP
	neaYcKDhctTTlSqp5oun6KoycXNjD6UiVgX8ueWU7s54q0+5BHW7TJzUu6wGT2FC5kP/8PBiFxX
	KDSmSb8A==
X-Received: by 2002:a05:7300:fd16:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-3039868c86cmr12429730eec.22.1779286510904;
        Wed, 20 May 2026 07:15:10 -0700 (PDT)
X-Received: by 2002:a05:7300:fd16:b0:2f2:6dde:df66 with SMTP id 5a478bee46e88-3039868c86cmr12429694eec.22.1779286510153;
        Wed, 20 May 2026 07:15:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm24052943eec.17.2026.05.20.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:15:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Remove sa8775p-ride board
Date: Wed, 20 May 2026 22:14:57 +0800
Message-ID: <20260520141457.988130-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ikfwsOilLSI-0JzOVkA51DEsTBBwViOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOCBTYWx0ZWRfX7/S4jlKKthLO
 udWFwJDQwu+iD9FefUkf6lMeMkDGmbihhJNFOuazlqeEbLe/7UkF/dHa80X+qEWmhs4Lx+Kp1kl
 HwraUOctCFf5H+LHccjz7beR6/WT64Sh1qBNAFiZhGjUcd45oiaJ9/VLeG69d5eOuRHOCDfPFUV
 eDh4IJnqjUOmPvjZMO6UUxsB37OUGkqUtpnfOS/fomOrS/Kj45beOX/PUFIjyxJF0tPS4Jmr0gV
 mo8xhQ75kkDWxhCzITjAZ5nYV3obC32P8mMBNPRlJ57LWOdTDtfkSDtkcRpkWb4iR5vENZeYJnS
 IwWxV2n7sMAi95VXP16nYeYzc9nm9FXWiUH9anZq4jmh9hcIYaujpdX3Vra7fNZRQN+J36ZN0Wn
 04abNT9pLfobsCr7Epf+pm8UnxtrtJfX2mWOkZ1suBFM7UeeotiXTDwJ19y31k+wJ2ufHLNx8b7
 KjmTAdjyDv5bcomcQWQ==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0dc1f0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jldscSqegy-hU8fF55UA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ikfwsOilLSI-0JzOVkA51DEsTBBwViOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200138
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108764-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CABBA58FA54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sa8775p-ride board development mostly happened back to year 2023,
and it hadn't got any major update since then, except Wasim's refactor[1]
last year which had no functional change for the board.

Propose to stop maintaining the board for reasons below.

- The Lemans development had moved to QCS9100/9075 EVK and Ride board
  for a long time.

- Qualcomm stopped maintaining Meta Build (NHLOS firmware) for this target
  years ago. There is not too much point to continuing maintaining the DT,
  as DT usually depends on NHLOS firmware.

Link: https://lore.kernel.org/all/20250803110113.401927-1-wasim.nazir@oss.qualcomm.com/ [1]
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Cc: Andrew Halaney <ahalaney@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
It supersedes patch "arm64: dts: qcom: Remove lemans-auto.dtsi":
https://lore.kernel.org/all/20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/Makefile            |   2 -
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |  17 ---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |  17 ---
 4 files changed, 140 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 795cee4757ab..d383e98842cf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -216,8 +216,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi b/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
deleted file mode 100644
index 8db958d60fd1..000000000000
--- a/arch/arm64/boot/dts/qcom/lemans-auto.dtsi
+++ /dev/null
@@ -1,104 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-/dts-v1/;
-
-#include "lemans.dtsi"
-
-/delete-node/ &pil_camera_mem;
-/delete-node/ &pil_adsp_mem;
-/delete-node/ &q6_adsp_dtb_mem;
-/delete-node/ &q6_gdsp0_dtb_mem;
-/delete-node/ &pil_gdsp0_mem;
-/delete-node/ &pil_gdsp1_mem;
-/delete-node/ &q6_gdsp1_dtb_mem;
-/delete-node/ &q6_cdsp0_dtb_mem;
-/delete-node/ &pil_cdsp0_mem;
-/delete-node/ &pil_gpu_mem;
-/delete-node/ &pil_cdsp1_mem;
-/delete-node/ &q6_cdsp1_dtb_mem;
-/delete-node/ &pil_cvp_mem;
-/delete-node/ &pil_video_mem;
-/delete-node/ &gunyah_md_mem;
-
-/ {
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		tz_ffi_mem: tz-ffi@91c00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x0 0x91c00000 0x0 0x1400000>;
-			no-map;
-		};
-
-		pil_camera_mem: pil-camera@95200000 {
-			reg = <0x0 0x95200000 0x0 0x500000>;
-			no-map;
-		};
-
-		pil_adsp_mem: pil-adsp@95c00000 {
-			reg = <0x0 0x95c00000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_gdsp0_mem: pil-gdsp0@97b00000 {
-			reg = <0x0 0x97b00000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_gdsp1_mem: pil-gdsp1@99900000 {
-			reg = <0x0 0x99900000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_cdsp0_mem: pil-cdsp0@9b800000 {
-			reg = <0x0 0x9b800000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_gpu_mem: pil-gpu@9d600000 {
-			reg = <0x0 0x9d600000 0x0 0x2000>;
-			no-map;
-		};
-
-		pil_cdsp1_mem: pil-cdsp1@9d700000 {
-			reg = <0x0 0x9d700000 0x0 0x1e00000>;
-			no-map;
-		};
-
-		pil_cvp_mem: pil-cvp@9f500000 {
-			reg = <0x0 0x9f500000 0x0 0x700000>;
-			no-map;
-		};
-
-		pil_video_mem: pil-video@9fc00000 {
-			reg = <0x0 0x9fc00000 0x0 0x700000>;
-			no-map;
-		};
-
-		audio_mdf_mem: audio-mdf-region@ae000000 {
-			reg = <0x0 0xae000000 0x0 0x1000000>;
-			no-map;
-		};
-
-		hyptz_reserved_mem: hyptz-reserved@beb00000 {
-			reg = <0x0 0xbeb00000 0x0 0x11500000>;
-			no-map;
-		};
-
-		trusted_apps_mem: trusted-apps@d1900000 {
-			reg = <0x0 0xd1900000 0x0 0x3800000>;
-			no-map;
-		};
-	};
-
-	firmware {
-		scm {
-			memory-region = <&tz_ffi_mem>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
deleted file mode 100644
index b25f0b2c9410..000000000000
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-/dts-v1/;
-
-#include "lemans-auto.dtsi"
-
-#include "lemans-pmics.dtsi"
-#include "lemans-ride-common.dtsi"
-#include "lemans-ride-ethernet-aqr115c.dtsi"
-
-/ {
-	model = "Qualcomm SA8775P Ride Rev3";
-	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
deleted file mode 100644
index 2d9028cd60be..000000000000
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-/dts-v1/;
-
-#include "lemans-auto.dtsi"
-
-#include "lemans-pmics.dtsi"
-#include "lemans-ride-common.dtsi"
-#include "lemans-ride-ethernet-88ea1512.dtsi"
-
-/ {
-	model = "Qualcomm SA8775P Ride";
-	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
-};
-- 
2.43.0


