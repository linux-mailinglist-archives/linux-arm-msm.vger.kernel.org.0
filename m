Return-Path: <linux-arm-msm+bounces-86570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B80C8CDC1E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CDD5300F958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B474432695D;
	Wed, 24 Dec 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eceo8x04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNhSRy/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E432825B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575396; cv=none; b=p2ksyKIBBbr9YWdui5U1NMfwy/AqyjBBMX56aFZOT3DA5R8FGqC4/g6hHZs4yUeQiSEqf++g28+MV7yfvLyIZlhX7i8LpE55hN5Qf5Rl+Fvd77t6mXTisxVf3SYkteUiq2C9UILyXX5kYCdwUg5VB5NcxKVL1D/Gn9opL4PW05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575396; c=relaxed/simple;
	bh=Zm/akP2QMYfOMOAkSkGQtyJ/nfOBKsn+htnYZWu96fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJSpdZUhDM4CsP8+na+u4MiPibZ2CDBayI8ymrmsMj5BQtPK0kXuEXzP9ZZfnINFklITNmJ6gqFI1ckPBArTLQGdydv7ROSDo7ZSDHP922zGp0nzRvNsarHmSalvRLJ+X56MG7MFJI6ceZRajFtFr0hbiOPQbm8XOMXQqU8/4V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eceo8x04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNhSRy/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2cBdh913432
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xp2tokjBR5/
	Ds73KOGXAHseytVAv33DVwCazGSdH11g=; b=Eceo8x04+wEgqH14ZRRiu6jCEZq
	e/kFcvBE51KJ2cHtOcavlYtkqWmNbPVmI3SPZfH/IvxU6HFH00tYmJCvLmqobqGI
	bXWQ4E+lGRq19rqK7jXfp/3CP8E/QFZNXf2gTp6O4RWjEcnaPMoYFn5zkQ5O+HRf
	Z2GKpQJc2GLlHHT1kDljyUBxJa3Q4G9fjHqFd0yWi+ZIMDAW9JTE5lLb40DPDSOi
	9wR2zBBetxO/T4tDY4u5qlNIzHv3FuWUuxUfXbdykkWsMl56nMNlmXQek3AwDLbf
	sKheU1aE3N9pWRXF4JJrr7d1in4H6n78awW3STV/qSoZB/QX5LU5ofQVf+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k23t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:23:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d2aa793fso149146231cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575388; x=1767180188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp2tokjBR5/Ds73KOGXAHseytVAv33DVwCazGSdH11g=;
        b=BNhSRy/vZ5K3RcbMtEvw6k+/6Mcoekdx+wA8/YVuVqNN4JTpJ9GeXjZzkSbcCYCGd1
         ZvJ6ovyC1B/2gJ4rlGmmxyW0xb7Pz9TGnxYJyvkRstSZ5+TfplJBwy+j1ghgvL04mDRF
         zvbhWjWO/u922eHgcoSGkFastr5MLMZp7CmU7umpzgM7Mgexpk/H7EeMwWfHg1M+04Ig
         4EryapGF8Vva5aO40b4srnyM8siSXNEoZNdwU1Unob4NcJAAxCrk3pbeMXnnUz03MxAm
         qxVF5FFwheh0VLFM7VSkaCevmsaK8IKQPPSWy5W/NSw2xg4DSEp8lxlA0MpL8U9HWicp
         sDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575388; x=1767180188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xp2tokjBR5/Ds73KOGXAHseytVAv33DVwCazGSdH11g=;
        b=eYDPAVjNrHWQRFNySMNUOULSjtfBhZkl8rg6Cmths5ZB9bB2cEw6A9t8M8pr7jLHQ0
         1SHfYgf1QUK8uGE1FUSzO0vkA6h3DygSir+2hQqPDAKGFqufzPozgf3gWcexV/Leq0RL
         urOdr0dXr+05FTeT47O+qeF4rpsXEuVYc9X2XzDYkLPdfmiHcnS3wHa9jiIdwWQro9XN
         KytB82NwW2NeBgKOMMx/H07sflM21TeL7kdpu/6JcLsGB9zUV4VewFO9qH4NwuXuaI4W
         HZFZc4lOfNwCDj2GpFFuLllx2Mm4ECJ4zuPjnQ5EoAVRri/Yk4x7CZlllMPdNLD+KhVt
         aWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT/b9+EMkvAh5kQNep8OBGEYQYcud+VFMJerpm0wu42AvBjvOCH2sp/uAKnUyQFB79RUbJXGSnwEdZ/CQn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9VJBxiK2p/OhFKnVVYe3+QeYdSY1bAueFG925PEYk33O/4MrT
	pMMJKeEL4ee2Gx+zVOaR5lkV+XyEcj+16dMTwBXsyzkn2aqduNvjOcF6tSz5mUr3Z5cv+py6XqW
	5LBvDQv88q6dm+kFiYrPEDZL7AYfRN+XRg7B/FeGnvtH0v1dmBb5YQBnkClGDu6sGt4Su
X-Gm-Gg: AY/fxX52d9jbdx7iR7zJx0H6M6Avb3IUirGwKk3ZTw/fB3UsLe/xYzVhMXAQryj3ZDF
	nDDmKwH5VkqN68kCFOqzFSnmZJ19BR6soCKuz3rVcElrqE/0qnckyG696WejkzqwI4YPrJE1nKq
	0nEdagw22IEqrqzB0b55NRx/qEP4cPhDZOoSPGa5bip0u5n7B5mJltk99xjyhsAFZ9JN9ReschY
	dLxGiSV+qtrP6/rm03UIlbVx4ndD+nrfUMIDWpGIgDG2MNOqMiDxS1aihipA6Vx9kF1ssRlq98d
	4oZCmuPHp2T+MlfEShCqV3+WqaKeUMbayXarVNUIdaw4DYun0E86DvlLYMcILhI8nYgGFF/mOF7
	KltG1tVP/mNuUQp7a0CDOd0ACIIw+pc9EtvGZqehBW3weyjYNEdhr1Htzh14aoW7hGEwFpg==
X-Received: by 2002:a05:622a:38a:b0:4ef:c655:2ff8 with SMTP id d75a77b69052e-4f4abdc8e86mr271359391cf.84.1766575388598;
        Wed, 24 Dec 2025 03:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAZhNzCPpbfuRHFo8kCt1dyLtfpeiUSe0nyZim0y1do2RmBCdzbKh+s0OebDSicTEYJhzrLA==
X-Received: by 2002:a05:622a:38a:b0:4ef:c655:2ff8 with SMTP id d75a77b69052e-4f4abdc8e86mr271359151cf.84.1766575388241;
        Wed, 24 Dec 2025 03:23:08 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm16864955a12.34.2025.12.24.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:23:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] clk: qcom: rpmh: Fix double array initializer on Kaanapali
Date: Wed, 24 Dec 2025 12:22:59 +0100
Message-ID: <20251224112257.83874-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112257.83874-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zm/akP2QMYfOMOAkSkGQtyJ/nfOBKsn+htnYZWu96fM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80SjPg4tj6o/bu7kxY0Wdlcf5Id919mddZAi
 Yi+Ks2FtnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNEgAKCRDBN2bmhouD
 1zkJD/9H9e/tL4UTdew5TkS4zbc6mRFbtc/gFv+HjerfcoOGnfSn/std6VPIK/I6zytjYljsgrM
 aCH5ACGCrVGh9qNNyO+7sEVVcf66xocoPmh1yKYz0RIdahhyPO9eNuUVUyxYfFuuh2dbd8jpheR
 BoqAe1iIzFWo7Jh9b2G61O86crk0jBilJSEfx3xHRYht7mvr/O9RT7R2Uo0AHllMELX4Ldy9m/Y
 RuQ5xv0sC0WIwC5uiOlt9I287Ti6tBzUrDTYiEVzLrbpQc77jF65FkDlfzLE5NnzeoOeJDDpjlS
 ZsD6S9drUG3tMBTBRbzFzGEIOo9VF77TTdspkNDlksfrWXmWhQknTAZxF2gusRiJ/00tkTsloga
 R+VO0VXYTPWNvJcrm7EornfMkUGAgAchWfRIuCkrBQbApC5MbJ3wHiFtTkUiqijl5rw+t0fB8vF
 0/gC63vhsroBya4KV24npR/KFngcdLVNnGTrCcTAD9ZszTUnZugk5oi9WWS7lHUJX7N7jLKr818
 97obrW6pmyNYIMQ18rZMwPEzcWtahHFiscdgZ3prDiK+rf4nE8MYkMtMzjtasgJjEoVQz8qt+Mb
 m71pwUsp7KfCf1unXWS0/7n7VyHJkVtRTB340LG+hpPALnIq15grVBhvZMDwNNelzbnztmY1ti6 TyTwgUlMZ6VZycw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX7LlgrbocrW3Z
 dmnGPUD9AVJCu3nlymA5bQtAOEn+Ko7DxcGfgIowvNRFIH8ySQycy0gcfNpFvOIsJxOS77npDhk
 wWft1henwk1u5a/sZoYCebbGfgl/1/hMjpb0p6NwVgGlEophuyERQrss+ozqzF4rR+/NDqmIaV4
 CV1JhdsVIvOqAApgzMVoVF7HxLVrGuadza8UxpuXRbAwwkGGgWqzY0YbpGqOk2x51yV/Rn7ayZS
 C4/k170yRGHjawQ3e+Lxdakzfoje6DnfP3zcKX/MolSnk8ETQbfgG5sH1kpzWd23LHHTbFgUSAh
 K/ezSs/2ua3gw/v3bQGjW4Hi45DowEV6tweq52+l/8IVI7LEpAUotbyYoFWdHJ28RjJTsxKxXNg
 H/AM8CAR+0URFAks/V7i1Ro5tn5qkaPO4NTTQJaAJFlrwW+ZG6A+C90FXQVpvoR5ow8tclOrH6P
 BGxmWAzihtPUiRLQljQ==
X-Proofpoint-GUID: 3fXqPneDutGOgSHYk4Oo1SCfBAKB8TDp
X-Proofpoint-ORIG-GUID: 3fXqPneDutGOgSHYk4Oo1SCfBAKB8TDp
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bcd1d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JRV-5dCbPcj-iadUDKQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240098

[RPMH_RF_CLK4] and [RPMH_RF_CLK5_A] elements in clk_hw array are already
initialized, as reported by W=1 clang warning:

  clk-rpmh.c:932:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
  clk-rpmh.c:934:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]

Fixes: acabfd13859d ("clk: qcom: rpmh: Add support for Kaanapali rpmh clocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 10e84ada48ee..547729b1a8ee 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -929,8 +929,8 @@ static struct clk_hw *kaanapali_rpmh_clocks[] = {
 	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
 	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
-	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0_ao.hw,
-	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
-- 
2.51.0


