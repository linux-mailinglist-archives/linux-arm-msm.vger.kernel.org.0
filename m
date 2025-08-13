Return-Path: <linux-arm-msm+bounces-69008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CAB24F73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0CA1C20AF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E3528C2BC;
	Wed, 13 Aug 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8N71Io9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99524290E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101367; cv=none; b=i62TY/ueYvIeF//uoee6nXL71Rjp8FsRE8ohNptCjm1cxS0mXjutvPfDMtv5Xtz455OKelRWt7Xax5AFU3CbHZOPBo5pHOJZqJiXK/zoptoyAoY9PBohf044MXxd2E1ltwEJ+07prtUkh2mRnRAtcXT+hJ2q8oOFYe+5ZmJ7Osk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101367; c=relaxed/simple;
	bh=Uy6A1KjToQeuPtCwKUZJZ4cLUf1rEWIY+Kkfeixj5H8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HkFbvnyLjOtLyZrPLrL+ir8+aDUedFNK3tvSmPIF06N6RD2BPiyUVkWeqsdbMgachraEAiY6/A4M5Agra2iqrVd5wPEMMkJpbLqIJGqICRLKvo/tu7ptr1ziIrAGfDUQ7TTcAsK6LkbS12kb18pDXPQhis705RsRgLGQMLHBcm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8N71Io9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBMZ3B002454
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RJnHt2WOt8A8a4LkxzStewQR/E1AD06cu3+
	bt2NvKB4=; b=P8N71Io90SZtmCHdnWsKLsIswT+xf2vzlJOu1VQCCFGgxwE2x+a
	gCY1XGEBt0HvE6MOoXqwysnM2OZVuzs17NC7LXoLgYbCuDFRcJNWWVACU9h2S0z/
	P67z+oyatxBcFjTQAeHQ4EutFYFZYCM8LPVJQYJ1bgeXSY5Bhh3xMNiSWlJsBJKg
	M6CALiIRxkLypd22ixuwnVY4xj6mW3U3hhXFXQrGOBmmZgaKdrPUgqsYRz2kVOMQ
	ZS4QUvBStVA2rxxLKfxXNn3/hE38sV+bx5yZjCp3lGQba2L9xXOhNDwSM+6/5HLu
	6ulQgAuyliYdYUzACZEd+SDMfsHWfwFDPnQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4gd5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:09:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b42a54b7812so4225966a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 09:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755101363; x=1755706163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJnHt2WOt8A8a4LkxzStewQR/E1AD06cu3+bt2NvKB4=;
        b=FxUYMEyK9fHn9TYNLE3T6H83GYPBkmf4LMBAVuI13weIakqnMqN3IUH7jMNdsFLcLF
         9wD6qMU4kSWgBCLLc04Cv9PIngIAvx5UjqFr/GQsUSalug9Va+riNgN+f+99AHX2LelE
         yafwkJCgipO8uYQqLzQEAR13hM/X0JiTl6RfI4zNSadP6wAMLXbmotaToypHdy6dSQ9Y
         nizxIN4L3NAz26jV2+CXZluUFinCbvXxKXoGJftLSTQWjFwRC062Cs45/QVamDAkYGXp
         40npKtCsT7053xibQ8oLnB7zf1tKGiwgYRWx8qSmNoqA/lsundIA7ghUXoe7p2hPmhdE
         vU0w==
X-Gm-Message-State: AOJu0Yzmiq9AhQbG+cZCc6JDuseMceXGJ09+BLU182Z9HvFyIXrCuHtB
	1khVXNHJgLJmPtlW3tNnT50AiLTi5SmmW1CaFyp0MPup63SQkY3K+OEUY7gCjgGyYiTSdZvaZLJ
	9eQxlCwVf3swl/fTLvao/3OmW58V6Z0CUn1Dsr/8XcTd4YmqBt2VOCwbkMfADozx0NwF9
X-Gm-Gg: ASbGncsEtZQBZ7ZalJ4R4qev+186YDwc+QPXZYJf6C9COj49Ks/HMUDLpwBDpkM3BNN
	3dCoJvrUznSZjihbna4ivjY9QoOr2Q4sy/va/cmMpkOQYmoLV149MCZy2CfYTTuV3BnyH6LK8Jd
	YKhl9pQtBUshM/bInvBTuTsUCyEFVXBBjIddTo7fDET5y4voKR5hkoL1GALBUBneT1n2TVQ9p5F
	OQCVeJ1oOyN4PmiAytPpiF/c/KJj9KntQLu56Whjxh08DcOC1o6I+nnaCgh7t4ZmUmk9eVIAZiq
	yg2YiJjHS7oUTxq3OoVcu6cLYyozfFV6xmzHekoim5bnHGJWjRNCnzhgQ/iVnvKxQoGT4Gq+pvr
	etg==
X-Received: by 2002:a17:90b:1a85:b0:321:c27f:32c with SMTP id 98e67ed59e1d1-321d0d7aa41mr4832991a91.13.1755101363288;
        Wed, 13 Aug 2025 09:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUhAHu45JXTTza9oZ9jQJjuAHePnoX7/+XsDAfE0WLyU3zlaWDR2Rp//MhJ0Zzde0tPKs/Sg==
X-Received: by 2002:a17:90b:1a85:b0:321:c27f:32c with SMTP id 98e67ed59e1d1-321d0d7aa41mr4832918a91.13.1755101362717;
        Wed, 13 Aug 2025 09:09:22 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323257a85c4sm529456a91.22.2025.08.13.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:09:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v2] arm64: dts: qcom: sm8450: Fix address for usb controller node
Date: Wed, 13 Aug 2025 21:39:14 +0530
Message-Id: <20250813160914.2258033-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AIJv3sbRBgkLsgD2rREi37-BLcyprwFO
X-Proofpoint-ORIG-GUID: AIJv3sbRBgkLsgD2rREi37-BLcyprwFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX8mt0twPiCLTk
 CHw/7oiZ9eQ+jQAgtKWFbxxYM0Red+xAx4RA17XR1C4Y0tVP/bSpKTM8juvLTqINCH87+PCyHNL
 ZffTs3tpTQuyxl1kKT+G2h7VtyCeRfs9F7CI9VPYqjSia/bv4pH/BKn8eLqXQwweF8sV1uW0Pcs
 pUYm2dGfVImzNpxSJUo8/dxfu+cPV06a0v/prLBDayh8nz0NHP/zQ07+kHlmNo+P/qHb8zPHUYr
 72/JewqRhcZ6Yr0ihQuJHutlUsCj6Jyg1uLTTFSJRF272l55FDTLT5hcxQqePlATz0RiUl6j+5v
 NEkWSk7dFM+1wu8dXCS/0osX5g7vmuj3/L5Zi3eAJxUaVyZMFC20GOXUpryVN0/9PwEAuRe0CTM
 fbGNTxCN
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689cb8b4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=6BaAAJH1LYH1urCC52kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Correct the address in usb controller node to fix the following warning:

Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address
format error, expected "a600000"

Fixes: c5a87e3a6b3e ("arm64: dts: qcom: sm8450: Flatten usb controller node")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508121834.953Mvah2-lkp@intel.com/
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This change was tested with W=1 and the reported issue is not seen.
Also didn't add RB Tag received from Neil Armstrong since there is a
change in commit text. This change is based on top of latest linux next.

Changes in v2:
Fixed the fixes tag.

Link to v1:
https://lore.kernel.org/all/20250813063840.2158792-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2baef6869ed7..38c91c3ec787 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5417,7 +5417,7 @@ opp-202000000 {
 			};
 		};
 
-		usb_1: usb@a6f8800 {
+		usb_1: usb@a600000 {
 			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
 			reg = <0 0x0a600000 0 0xfc100>;
 			status = "disabled";
-- 
2.34.1


