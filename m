Return-Path: <linux-arm-msm+bounces-82195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C513FC67E30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4A064F22D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 07:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F405B2FFF88;
	Tue, 18 Nov 2025 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNbxMaRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9Edgyt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F682FD1A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450250; cv=none; b=FxqBR//8UVy6dI1vkPzwxZw//sTEkihF39RkGEZWyTmM+hz+0id5yJs8G+wtgglSc3EjhCaC89RZJt7CNWFRFWy4u25aIxgdmcpmTfJmNR5aaIg5wwAcdBFsJPBeVLpnUgBEIo4nVpr1Hm3QeVE4SK3f1QQI3kZKJldIsPy79HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450250; c=relaxed/simple;
	bh=eT7xHlsM9wuGcfi+H1zM3Mtip3i/71EBzEOCLv7v6ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3fuUt7nNlsQUYNzQIDh/git9EeroPh9lxxfz4RftbET8gaWGQaLRng5NlMJtvO+HCSnru2QTDQck27qm0t6sn05oiVzyC37hKcogQ7gZ/3lUl+xjv8FUKRU5P2ZN3H0bQ6e+om6zfJr0sq6qghGpht0hLjaiYhjnDQQRdmSsk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNbxMaRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9Edgyt8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1IxuK4166719
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4uXf27pC+4LLf5eBc3TJTYwCnSfAyOM85/RxuPTdDs=; b=GNbxMaRoCEx63HMU
	9GOTCC/v+xVSnWO4BERud4MoHXwZfpcvb17yjHAkTVBlpvZ3JvSn7DVdvKsZbVUq
	NS/b+diyJK+Hz7bsdIk5QK15+73cWYeSeMD6C4WNedscSFAVLCd3luAZFYr+uVBe
	Sa93VBSGgViKJvOXmerKsUrNinX+g6xB53kSKoINz1wM0c8hrFHHTKro4JiHWBEZ
	C31/SRQd6EB4CJ4Fd7GovggNLjcI279PcqiqP8mmwH13ME8J+zanYXljM1lTSG0+
	3DHTF1MfgBMSLLR+Ty+Cmiw9gjUAztxhskhr8yURTSkqVyam6w18W8HbHlkILfJh
	p2oUZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593tkjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:17:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299ddb0269eso25980165ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 23:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450248; x=1764055048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4uXf27pC+4LLf5eBc3TJTYwCnSfAyOM85/RxuPTdDs=;
        b=O9Edgyt8CZ3IUyEBtcU/QQp4ovIbchvuPWo9CGz2NhO5qWj72/7vrlk2kj7ulZB+ui
         TS1QCEvAXfVZkAWv7heVCqcwtWLdFW0BAO95mONFsH3e+OxYl+C2zefVJClgWvmFsYLj
         UyN7OhxGU/UijZciU3zCTbE32iQSKKze1rpgdiHQediwkVNngWGT8+WzqC9yCYeO1U9n
         KCDgXbEGC59/qOHqA1BM3SuG2tKmbxEFjqsW69IY8tMxDct5bePi51Tpu5GZcqTXJPcD
         z4CQTmnZjsEO9CMNPyT9hrCE6UxMJ4tMH54cqKxYOxXExTL/m7mlOhiTpT4Yfy+uM2oQ
         kOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450248; x=1764055048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4uXf27pC+4LLf5eBc3TJTYwCnSfAyOM85/RxuPTdDs=;
        b=Dfqm09pc6V83G4pweeq6GjXu7rC6mamNjQVKcNqVmPEZxHXSmYkYZcuhESuSlhLsNZ
         X+mmo9khkjO5VVqJbKkjl5NDNU6v0HT1tdMK1AJgMtJ/VNppTGBmKNfmz4H7op6p/IK/
         1HHBwC/QaWSPnJ1KJyH0FBJNoHDplzWfWzHTRPgIlup3GJIs/MGUKVomn396CIQRTJbh
         Jx4kyE7RasvqxgoukQEejSThOeCBM1xfCFzsNH5PDXCSpd8fqSW6BXWAh5P5zTSlVczx
         vg+6F0cJOPOnirGDgq9E9Xh2uTDPx40YkUpApRDMtvGRoALNCVZylskP6b+zXgcDy9Om
         NgBw==
X-Gm-Message-State: AOJu0YwUaheL9tlgNa0AcLKalviDRYLWaNeltUSxS/VlNXPnau+nnX7D
	mGXMvyjOSaTmITS0k6PGf4mJLRZd+/kz+faoecESCMrLM5urOskW7c6M+IjIH5n2PlJ8P9XO2zo
	xdkk+3D1AjihtZwJF1brleP2LiCnjVb4o2yqEkdDUE6N6slRUu4WElTbyr5+FzeJKk01L
X-Gm-Gg: ASbGncvwOt11qhlZXVagyuM83MtSxJEazpbu38RHqYl1cLDGSjXsfCRg0W0Whvz0PxI
	APtMIL7OiepQwKPX6J/aNwc4Es3L0Rpfen8bgTAWUXoyP9BtBEUYsVJo9pavv8FxnYUmgcUJrzR
	FLShOnbSDVeuU9GIOKwFawdcCVOdnFjTB5XOLad1+Jpaxsx3Bxj+g75RquxsPxd1t6WL+BBTeHp
	qQdI6i4IZbhdZPywSGad6OkOE3g8gQuCmfu/sCNush7QsM7+pCdvPNtA0/zq137voMkCdhfHYbB
	xQmcK9XcxywhPFPUODTZ3wy31VqtpPxcsreF6FyGxAHZQEncVhyezaJ/TK71M3Qy2stMCg8env7
	SVdYef35tkKiLhBQZ3Iny+8ulSN0/jw+0uA==
X-Received: by 2002:a17:903:1aed:b0:297:d764:9874 with SMTP id d9443c01a7336-2986a6cbe5cmr182018345ad.21.1763450247935;
        Mon, 17 Nov 2025 23:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaOtZnE2/hTYAHZo2o8wpuSAmpDDoFcmssIY2qY5SUjHvOIzGerd35k+ZRtwkElWXoyxN65w==
X-Received: by 2002:a17:903:1aed:b0:297:d764:9874 with SMTP id d9443c01a7336-2986a6cbe5cmr182017985ad.21.1763450247417;
        Mon, 17 Nov 2025 23:17:27 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm129955285ad.79.2025.11.17.23.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:27 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:47:07 +0530
Subject: [PATCH v4 3/5] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c1d88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LN2Fm2LJRdSXdv45HSkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1NiBTYWx0ZWRfXyoXtlmeLjA9O
 CQhb2Jx1XFO1K2C/dni2/ecZN0Hnpv0wYDXA7+qWBXX+4Wc1NkanDp6gqucQ+FYeP2TRvlOePQU
 DArMI1yLsD0OJLikVmgIR6pVa2KwPjUDG1so3Fe/wPgceeDDscJBS3nxwRbQsD9aVT3sNzM5e90
 YHJmXUpmyV3QCWR5saP2YTJZQdVBe9Znkmq9YoEHRBWM8ANzv/TgG4vBdaeh1QxaW/9U6g8FN5Y
 LDtFM4eu+3BdnNuaC9tJILTexgPOzcQrFR44iiKdHu1y6mjreQYqEJqQ6/loEDz/gH+G0EWTx8I
 lqRd8XzD8Rjv4+fnCex5a0OyMHr09OW/5Lzo+VWQihBHZhmlGZNdortybUHwri8CZAHmsD8XuWe
 Q1BjZ09ibQNl66QC7tz1WSvVjdpngw==
X-Proofpoint-ORIG-GUID: WomA1P-KyW_ZH8rFLzfoYIbNgkgy-ORh
X-Proofpoint-GUID: WomA1P-KyW_ZH8rFLzfoYIbNgkgy-ORh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180056

Some clock branches require inverted logic for memory gating, where
disabling the memory involves setting a bit and enabling it involves
clearing the same bit. This behavior differs from the standard approach
memory branch clocks ops where enabling typically sets the bit.

The mem_enable_invert to allow conditional handling of these sequences
of the inverted control logic for memory operations required on those
memory clock branches.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-branch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..16d85b2fe1d39be2b0c14ea1bfc305c42c685f58 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -142,8 +142,8 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 
-	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
-			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
+	regmap_assign_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+			mem_br->mem_enable_mask, !mem_br->mem_enable_invert);
 
 	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
 				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
@@ -159,8 +159,8 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
 {
 	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
 
-	regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
-			   mem_br->mem_enable_ack_mask, 0);
+	regmap_assign_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+			mem_br->mem_enable_mask, mem_br->mem_enable_invert);
 
 	return clk_branch2_disable(hw);
 }

-- 
2.34.1


