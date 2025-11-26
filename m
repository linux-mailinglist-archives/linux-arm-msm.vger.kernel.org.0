Return-Path: <linux-arm-msm+bounces-83436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B5C89241
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 62CBD4E2B0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F5121D3EA;
	Wed, 26 Nov 2025 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC2UKr3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYxNAu4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2950B2BEC31
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151050; cv=none; b=RDApozS4Y2IXujioTyWF3bGBVboBWFJad0lGPju4LK9WbdTSsKsGKUBDh9RROv8oPnR6Zr+npEnWTlgBu2bDe5e5kRQj5K9gDrJnUzFKLR/doVQ6/0NQwmIv2osCdFjxX7ReCtQHSiJtP4pJJXq6PDhN4Y0cDhlrajS5c1Txky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151050; c=relaxed/simple;
	bh=NEGFMy0nRQAe6Jss43gE/3cXqLJXeeTmmy93lkDuVe0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ptmNszvVQgR6mPUw+mWP5vfXEoTRliPknWeaeQ1BJ5+N9NtvMkjcWOIfiijh68MFZwzvfOI0yK/s4NQVegB6XHiybD92vzpozx24WNu8tYp09GaKo3O/z3N10QTKNbRVjEIaxHffteEUIJ/fQ0HWgXhiziNGP/G+VLwbCQFijAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC2UKr3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYxNAu4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9Dvf74048885
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JlZx7jsn0ohvWBRiqsd7s9
	WjNFmN8h/Y+O/HH3sJma4=; b=iC2UKr3mpVwlXO7YfNY76GInGXTNyDPdVVZDE6
	NinedKU/zUWAs+M3UpMD9LEehhhHEl72sVQOJRwMnX9oquBATwCNx2yw7VRTx05h
	aLM1zHqrM4WrIqpYK04ijZ4UansPV/Kl06vOlpTcm+r1gXsMqy5LYdzz0KEHoCyI
	uDspkQ3BPL9Av6tZeu6xo4KMXJVnQhdhqpODgtd3dtzrhX5ysHNZW/mvX6VeEqaJ
	WR8Ek0bN9MZ6xBzfTmeInixRFxP+eLNufvbB9yT+GnhAQPvm0Tf2vm+NDHisYDer
	SS4m7DYiWWKIbxp3MpNgYWXq2FWYnmiiU/2hsm1gkU1t2wRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nhhj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso613930a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151048; x=1764755848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlZx7jsn0ohvWBRiqsd7s9WjNFmN8h/Y+O/HH3sJma4=;
        b=eYxNAu4W+DwhftqM3psG32HlNEppUIPND+KQvXma+oz5S0BEJXVTjREK8pNABhpes1
         ABOmIZWPg/Vz+R2JcKuTE8awmZ9qkBaP+wTieQoADS4Blhdv68waK8DXVcvroyNBXJQx
         CHsn3AvtFGW5B8XfyylryBfVSMHn9en3ZfROU4nd3+wSqv7kCj2F5X+QUFHR2bwkcMLC
         01PR98OwBDV9qzOpr1nH2iCT/+QvYYO+zW2WggE9jsd6GhN8WNhX3R6/xmpu13vuFDr/
         bT7GEauem+kHPmh1HfU2Ek9X0lBZM3FA4Mbevh5VqS/nEQjx4X1Db6zD3a6OTqlbWFPZ
         LLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151048; x=1764755848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlZx7jsn0ohvWBRiqsd7s9WjNFmN8h/Y+O/HH3sJma4=;
        b=ottLr+La6xuMprf3fqHmjtQ65F1NtJP1meo94xPa00BA5UdDS2Uf5ZrFOSMKHULGuH
         3UUHeSPA1m8R6ggY8WDtrURM3un7EPOnqecZGXGx0AMZeeqB0cN4P0zpF+Hukd3dO1I4
         kKoomBSbJ4SmOdCx5CnNW6TcDmjfc0o08lolCxRNi+/5nGariXTg00P6e6GCq3MH1ivL
         iEd9UyiHDePXrUgLvwk8wMduclonGHP31mjRXX+Ne9ZpMBKKvabHzlCw1GoKLOTEUYO4
         iUH8BuxBX9IS269MZc+B+2enxi9c4uRexjSdUVle8Y1U/U5xy/0NtGS7h5j53MVRB70P
         GHGw==
X-Forwarded-Encrypted: i=1; AJvYcCWoQwLVxIgAVkOQCCODsIYFKZta3Q1zal6fHofdAPdpojs/NCYy4ok9haOBWjMq0BocT2k+lKYvXKKxx39M@vger.kernel.org
X-Gm-Message-State: AOJu0YzbB1M+4cCGfHmoX+ksT1UctP0GexoUT8G4SspwvjoTWxgYqoun
	Y2ki9TNoPhPslH4GjPeqW7jfxcvwjRnmPjpGuXsfesGL6ZHicLXuIwd4jn6a9vc4GbuqlGyajYe
	CZaXGFQtF2zse/atHGRcW/LbjhAzV9ht81k0oUEfmUuHLWwmtJtgJtdRHxHJxcIgm+Pc8
X-Gm-Gg: ASbGncsn3IdGDeuk1b0cXISwLm49eb06hPlS17BZWdZkMt36yWvE0hiEf9HMJh9cTJx
	RsOtb+4TTRc+0ktMaIsMX3a5NKQtzUr3g8FG/LnMW7dx7snGlSMvOUOJyVLudF9tI13AkKP4h88
	8KQKOhfb9nbY+XIQFX+omY/U/jKcxxd0INB5Ih2R2ZoQsZt92syrE/SgKL49YHsPa947kqSazI5
	KOW+v+yNeZa5RgqsyO8i6/elEhfUGhoSQBlLN6h4NuP657YhcoaXeb9JvkSUZl1R1GxL9zay9h9
	agW7Ch/mOdw7kqWWT1pFDG33dFhfttnUM9bwrbMWQr5VYCiMrOBCXARz5DkFhHmg8GiaPTeX02s
	2fdehlaSQCFPB90JWHRcSpVOc4Vr8RWeKyg==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr19630622a91.11.1764151047408;
        Wed, 26 Nov 2025 01:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCrMYM0wgYWYSQNLsr3qbYaJHoOphTVLZmoKNMM8i8wLTKMMOKT4/vqqy2PeNCWWtxYLYUiA==
X-Received: by 2002:a17:90b:3bc4:b0:343:7410:5b66 with SMTP id 98e67ed59e1d1-347298a9f91mr19630596a91.11.1764151046882;
        Wed, 26 Nov 2025 01:57:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add support for Clock controllers for Kaanapali
Date: Wed, 26 Nov 2025 15:27:14 +0530
Message-Id: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrOJmkC/32NUQqDMBBEryL73YiJiZh+eY8iZY2pLlVjk1ZaJ
 Hdv6gEKw8AbmJkdgvVkA5yzHbzdKJBbEshTBmbEZbCM+sQgCqE4F5wNxlzviAuuOBHbSoad5pY
 Xlep6Cam2enuj9zF5aROPFJ7Of46Hrfylf8aSClZrVFrqWqGsGhdC/njhZNw858mgjTF+AZwjm
 By3AAAA
X-Change-ID: 20251121-gcc_kaanapali-v3-ab91e1065bd4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926cf08 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pU5keNj5C49EkLXuPzUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NFFfEpyV_cjIaop2wlmYszEvF9BtKMqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfX3i4Y7jMcW/nX
 osE5hvRd5QY6K209rpdX3pNTEZDlDbckFuZP62mlGHVoCq2a45Lrc0MJAoN/3Yx7vUONGzL23wo
 e0etXqfnbHlo96NodE4If5V8LXL/08srdy1ZPcecrZOBvGNNT1p36/NlMPhvesrpDWMADcJ9zKG
 LVtn5NRC1KjHgLeeBxWKRc3CewPPd83GwB8w0ZObwDq4biqEmAqROXlRR97q/hPntEQpZWhdc4o
 FIaMUginSu9PspJboQSDcqjWNArrOmp1JSbkJRozFvVcv92OZNCjZmDuYUPibuHs8K17pat1gvS
 +uHfvYlGKAN2+qJd1NqHIbOAGqB5raT6epstt8mLjLKmjSa3/QQ+zx/NYa/EhIxjS3WbQzeFe3Z
 JHxiK4zvlnuTxalko6uiEE+Y9oahBw==
X-Proofpoint-ORIG-GUID: NFFfEpyV_cjIaop2wlmYszEvF9BtKMqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260081

Add support for Global clock controller(GCC), TCSR and the RPMH clock
controller for the Qualcomm Kaanapali SoC.

Kaanapali(Snapdragon SoC from Qualcomm):
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Changes in v4:
 - Add the patchset from https://lore.kernel.org/lkml/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com
   to this series.
	- Remove the 'fixes' tag comment [Dmitry]
	- update the clock names in the glymur desc.
 - Update 'max_register' for tcsrcc to 0x3d000.
 - Add RB-by tag from [Konrad, Dmitry, Abel] for TCSRCC
 - Link to v3: https://lore.kernel.org/r/20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com

Changes in v3:
 - Update the new RPMH clocks to use 'clkN' convention which was not
   moved completely in v2 patchset [Dmitry].
 - Use lower case of the target name in Kconfig and Driver code [Dmitry]
 - Update the TCSRCC clock offsets as per the latest discussion for
   mapping the TCSR base to '0x1fc0000'.
 - Add RB tag from [Konrad] for GCC
 - Link to v2: https://lore.kernel.org/r/20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com

Changes in v2:
  - Update the commit message for all dt-bindings to incorporate
    "SoC/platform" inplace of drivers [Krzysztof]
  - Add RB tag from [Krzysztof] for dt-bindings
  - Split the TCSRCC to a new driver instead of reusing the SM8750
    driver with offset updates [Dmitry]
  - Update the new RPMH clocks to use 'clkN' convention [Dmitry]
  - Add RB tag from [Dmitry] for GCC
  - This series does not have any strict PLL code dependencies [Bjorn], thus
    drop them and will be added in the Multimedia clock controller
    series. Drop the following patches.
	- Update the PLL support for cal_l
	- Add support for controlling Pongo EKO_T PLL
	- Add support for controlling Rivian PLL
  - Link to v1: https://lore.kernel.org/lkml/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: rpmh: Update the clock suffix for Glymur
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali

 drivers/clk/qcom/Kconfig            |   17 +
 drivers/clk/qcom/Makefile           |    2 +
 drivers/clk/qcom/clk-rpmh.c         |   61 +-
 drivers/clk/qcom/gcc-kaanapali.c    | 3541 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-kaanapali.c |  141 ++
 5 files changed, 3752 insertions(+), 10 deletions(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


