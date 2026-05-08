Return-Path: <linux-arm-msm+bounces-106564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCDcCOtL/WmUaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 04:35:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA54F0DA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 04:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 591F7301DBA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 02:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877D5261B92;
	Fri,  8 May 2026 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEZ090BI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/UJX7ft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05810238D54
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 02:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778207365; cv=none; b=l1iiQ8ZjbRy2EmIOOfA2ofM/w2k7E6763DrquUkHqnTHEezxBonZ2LwBJtHWuEUVQxdtNXOsC+lomPZtFe+8WaDqX0ZTJT/fDk1wZBAkeM6OF6Xpzg233vzRLk5BNtWcaXwj+c3GrPPx+spZThw2PuYxb9rGlW8igdfjfUGcI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778207365; c=relaxed/simple;
	bh=A/zzfq0P4bMFMqxrrokvvAVDteQXn/euLd0B7qdZuuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZUhgu04pIpJ5e/EMQI+kW+l/mGHnxMNpve/RSDecyj+o/YTsKTmcPjwtTfeCf/wD5QkMeMv9pjtldyGcVvOuiOS7SxwQQ7Df2WtFkBwW2Bypw9YcrPpwOxdhHUY8klumPC6VDzYoPFIWFixUAJzjZMwl+ygv6rl8dZiv1aZopXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEZ090BI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/UJX7ft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JDJ6I2183388
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 02:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IemAIHEw7fWxd79i+a1tYMpR/2ovwqCdCYt
	xG3yhxsU=; b=SEZ090BIvjLb7R4oiXJ4IV/YE++7LPXmp+THufK6krJIdFYX5by
	Lrg33JpzWGw4xIVNZ4qkRRNiJqg0ngPRq93/VLqiOvqndxFCd455JP/Bqj4dSJOV
	j+OX6I3b1LN20UBcMtP2rvUk6L1znubsi7UK3zztx0i5T8RWAPWVSI9pZG1gR7jp
	OaCfzZiB5myHky91dZLUOKfOtxhW4PUmefusgOK7BZTCb2DATzcHAim4Oe/70RLE
	sl0zv8N+0y4s5n67+FF12v9a+LUzUBRMzJtH3H8nVJAdYHFWrm4i651AVCvw07/C
	ZdIjTfgCYqpQk57LnNLjTUAfe+AaE/xSnOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10py9748-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:29:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso2205994eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 19:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778207362; x=1778812162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IemAIHEw7fWxd79i+a1tYMpR/2ovwqCdCYtxG3yhxsU=;
        b=B/UJX7ftK3mr0HlZImSXWeTE9LwaQCx1DOr/eE/KzshGg3xxwpmeJoTAFMwJTw5Lea
         Z8GD8CPh6RvZhoDHXaHhvhyRVCBOoNI8MGkevWW3c9+N86+aBpGE4aPu1Of5d0tkrjtC
         BdzGtRZymSRxhkrJQ8+7c8wyg2iSHIsNJQlMi5N/JMHnBpPBHYuBq1wD71ib97LgUyvK
         tWWxDjCYr7Spm8j45N0+T80XeIRtFxpeHRVWpmEdSmygCvyrfaK7+/aDxCmkJbKHb09j
         ABfdCwF1vEvbaRKmhudrOmfD6oh17xAxT5oWOStv2dPrarF+WipPzOMfpWmZe6+YiiY4
         9X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778207362; x=1778812162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IemAIHEw7fWxd79i+a1tYMpR/2ovwqCdCYtxG3yhxsU=;
        b=ZwAkYDeGB3Mzhcf9fogMCUQHiTuBoIqS5Xb8yN9TZqEiQQQzOVUF8P7O8gJTztw64p
         iOMU4lHhhKGfw8xjefsbpDxMp2wpWOjuG2gYxczee53U8kzlZ5EOYicN/eTJNNPiBoXk
         YmAs1z/V1AVE6K/LnYsZ+3ku6O89qRCTCasDBUXi+yVdklAOVuY/5JBrPiROxLFM6Ysd
         B/BcCk6ujEgBZxWZZ/pOsDCPIM5j+NZB2sXYk3cWXOYRB1bsKWi6tdqXOFupx0GIehtw
         EH27TzyBaG+Df+mHcMTp/jQjy4P2HFm14Y7lz9TNw0Q159/t1yW+f5EtaunGEtccTcgv
         fEZw==
X-Forwarded-Encrypted: i=1; AFNElJ9n6vKZjx6vrEt91Oqe5IqjBJSO1CMzKRkCp8Ar+08hVQVZdy/yAgCmr52v4ekxkOzQRtn2huSGcDlihg/r@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6e7pQmtosFz+XSq9P288Zc0n2AshKyQ3WyyYSReSYK5sGc5q
	4WNibaUSHSets3r8hy0QLHVn2IMRwNZun4R72qK3sAlYcW/6oL/dF8xAjnKwxD9beP1AUSVj780
	qWuHQe4DANY0J7ZE2vHTOvzSkgBVgLrS2bNxqso4e6rpfYY9yPYQqFn/sLxePYmbh8shg
X-Gm-Gg: AeBDiespRbbcr8DEHBdrH3lWFxg9VYmIwoZUq/BShMi04FWFVTMG/7E2EC4+xP7g46B
	zo5aCgORr8CwTDnZsOp9n2mvScZwe8Pitv4x+ZO9trc23J0cSUbDL+bcwWQJ2pwGZNswtXECLTk
	vUaeiN9O565KbGVNwxgszAJalVWQtrNOZGg1nKs4ZhCCM+w7N34UT/t03JLxcZz/BXPQi49AWSE
	+1xrPKdbtNMwHJbu/4QAIpdCy4zPaIn+cIbo0Y6XCPBitNbmpr7z/S0olbf4nzVcW91davYDoH1
	ooa697bN6tbqPJ/t75J5QuA0hLLriRmVsUPsgjDpIs1boy82kGfS2vPrjERPycVAMOMdHZCQfv5
	2QsRR2EQtniwTWOD6Hvc0mHWjCa/sXHXI0etPyenIjW5P64OMyUCJ/FWq+zvpMzBxvKrVNk/IZa
	uSgCaFig==
X-Received: by 2002:a05:7022:672c:b0:12d:de3f:f3e7 with SMTP id a92af1059eb24-131a69f32d3mr5231080c88.39.1778207361628;
        Thu, 07 May 2026 19:29:21 -0700 (PDT)
X-Received: by 2002:a05:7022:672c:b0:12d:de3f:f3e7 with SMTP id a92af1059eb24-131a69f32d3mr5231059c88.39.1778207360868;
        Thu, 07 May 2026 19:29:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88914523csm369019eec.29.2026.05.07.19.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:29:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Remove lemans-auto.dtsi
Date: Fri,  8 May 2026 10:29:12 +0800
Message-ID: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fd4a82 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PmaFrIVgk-5aEmUqFrMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DuYMTz_cTjtKJ0knXj-93refUUrtqUU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAyMiBTYWx0ZWRfX/ZAutQe48OgE
 nbYiml3Ayv+VKI31otiQ8MSFWCaSyg4y8rY47N3qtTTrQHAF3xXYUs9BE/USwT1/54LbpG2GAiU
 wUo2kxC168GlDEWZpcOjT7VBF0N1oOFyeQHAva6g939hBPvft61dxH1bpEF2Lcv1HSI8XKVLEW2
 fcQqZJptmkldOGDL2Z5TKVkAwjJZ7oI4CBBxxi10N77nFSa4lkbm3/dpcXqn8V6WezG4CtJsNbu
 zJHuCKYCxVEQAjv55snQvQwcQoiLuICyHnhdb6oQeYZXHY0oJ5UKjyZgbhGeHoHTDbz7OL4gvgM
 aax7K/dwdA3jc4lViBth6Jwm7o13edHVt0Ce6qlGMvk3EoI1cHOZjMjSYZh93bxoXq7Qczv/3UB
 2+BKJez8WDcfeIgglU5ppVSl7MY/jn6APjy2mowxV2sJxjG4UCEKo1kNjHxN7GhZPDyWDfnCDmy
 Ukv9pfGJqPZtXMxnc/Q==
X-Proofpoint-ORIG-GUID: DuYMTz_cTjtKJ0knXj-93refUUrtqUU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080022
X-Rspamd-Queue-Id: 83EA54F0DA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

lemans-auto.dtsi maintains an old "automotive" memory map to support
legacy use cases, which stopped being supported by Qualcomm META build
2 years ago. So there is very unlikely anyone still running it. Remove
the file and update sa8775p-ride boards to include lemans.dtsi directly.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |   2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |   2 +-
 3 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi

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
index b25f0b2c9410..b33b9c8f0e08 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 2d9028cd60be..a29be5139554 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans-auto.dtsi"
+#include "lemans.dtsi"
 
 #include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
-- 
2.43.0


