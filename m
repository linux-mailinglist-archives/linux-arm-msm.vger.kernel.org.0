Return-Path: <linux-arm-msm+bounces-103296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFQwA6yT32kiWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:33:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026D404D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 143AF3036EA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAA73B27C4;
	Wed, 15 Apr 2026 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2zFFI3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlQvfBqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297043AEF5F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260008; cv=none; b=TYh/jDggAgfgezRxMMOKv+Vc1Rjt8dlZeEJXpQzmldBmHOFc7E2Byu7fgmQ1o6x9pnQT0HiHv5kdj84xNMQzkeCOJ38Lh5CYooEYnG2VncMI/g5Tz1r52L/vfCtJDNdUxz38P12UF4xHas57gNiAmWrHvdbfLwaaGlgvo/kBvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260008; c=relaxed/simple;
	bh=j4RQSX4jl5tgcvA7X7wtjdziWOCRMMs7pw/KnDPtK00=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RytlXFNrvSMtM5Vh4mDQKzDwOVGzlApvaYyydXRLUoRTKG1o3huc8D2DNo1JkQX1vQJPhV7tM+TUMmnfeu+t7rJpBkUU4+JfpJXTSyn+hkHc5SwmmpHrg7tE0recgJrCuxds0WTjlFvQewMlHg9iAGA2IZP31omN5pxNRyx7ucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2zFFI3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlQvfBqv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9ghlA1778923
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p3SZZI41zCDljAg1pMfpBt
	kuAqKKIYM1Vlgmt4zsMHY=; b=j2zFFI3xoxFWSZEbNA/ZqfDwxhTXRFz7YhdADu
	KTS4dSpRTvDmsG2pJv5UaeVI2KQLskg/3cde/QQVtZCbu+EdERiX91iyz0TP2Jn+
	HVJWFq7Oc2I1lXPWPGB17gi4iGcOBLFtO3j+CLoaJ4r1O60o9tlUA9PYSp+o/tAq
	zOP/ApH8z1dKtdcNC90NuhU+3aM4EnyiP5IwS47Gehb0qmJu7p7r/evTy9LceQSY
	/70hCncal9tTHA3B9DhmnK4xCUKuqBA7jW5OylD4v9uFBfS7aZFuuTiiRDpApRNK
	Ge3dvnZWUhOHDe5DqlS3p3EscnlqMg6zGAGtH3GgsUM8lcXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw03r7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f308d385bso1895221b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260006; x=1776864806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3SZZI41zCDljAg1pMfpBtkuAqKKIYM1Vlgmt4zsMHY=;
        b=hlQvfBqvaoCmZvf95grFstWCTdCRcG/ETCQj8/6u7ZSo1yyBSR+87Nd3bP8WqxlrAM
         xn0g1TUal66GlnFhjHaRJI0joC/tBkjirgv+bDcTMdUfOXbFTaRkqhzNvTa3gxIkQUcL
         pFfejjpPQ6GtcvkAwBxSea0VQ8oycCw7iOoYZy2ask1M3/Ae40BROplBjEatSKIsdCdS
         FsKEwDE5CoR3//WjXpAU7YJr2gb5krgM0ZbsZjkeHq2ofb4oWWiCwe2TC2uJPQwJDAYJ
         slDXWr9NasPRP7Pe3w7SHA6jFbH8cchpsxstZS9wXTCAjBopmgSdqEDdd0J2I+0BYkln
         Fb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260006; x=1776864806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3SZZI41zCDljAg1pMfpBtkuAqKKIYM1Vlgmt4zsMHY=;
        b=gFyQC8ThobaEiGAdOsYBNTs+Y7XLg1VLOi5GPYwr19W5anERB2a7de8jrtPtwI/mUu
         rc8vvU8fD1zioMKNOXk0wYfGVFsgf+KQEWyVpuskealLIv14WCEcQk/kKx2z4HKIR2NZ
         /rFyZy78bp4SfxgR5BejfJ/+mZqf64s61V/bDQRdf11+j0+9eakHKlj87MNWegBa5n+5
         U9FAhKR7sil0LatNe4wljLNUwPdkTUoooSlo+iRYPQmGs+PjnRkdua+ZXbH8vYjOOKgx
         Hkx53PHGP0ajhfkG1So7+JX5DX9PLQLldqD6k9ET6+yv1YjoFSndrFhjCLSrE661pZNc
         +wLA==
X-Gm-Message-State: AOJu0YyrZR+2W/zYtdYfsIgui6ZaFEJB0IjN5PDF0AqlFfAw65SLnR2r
	NaqaDrlUQx7U2Kiru2VvFxcKYY6+frLNYIrnAGheF7LclxXu6vS97wNW5t59XJ2UqJRWp0mPgne
	PvroirX9k0bjcnUqSOWWigbOvhPbcRJmbtV5SePjtPTOIJj2PfSo4ArnygKeDUI1huBmv
X-Gm-Gg: AeBDievcBbnJAGXaFh48Pky2uIvdG+4ppJoFVr0/8OSZPI3dcejNWGjHG+NW/24vmrc
	b4Zut2dA3NDo6Zb8l91Pz8aS/gJ00ceG4pVbDo1HvPwO2pA7pvRobtUHjtJNyQrWP35dGfUfpdP
	0Dgjs804ogY7GXEOfjEgHbcKprba5xwCKi265gpukhmiv5YIxhHMTIuephoUWzd/qu2EYjDo/6x
	XU3BMd32knWviXDTUF+UETmWifNdu+FO8mkRnPY8TY34+F+ut8oShfW2oV/Ovpm3Oe8PRVCYIRO
	fZq+L97Sq5jPUTKXylfS9RVzsKpi9zgNGukqKX6l0AI8IHePsq01eH1et5viD5dob6bteuv2obL
	FStVQFWRVcQAgSXJj27krcasJWtHoYq2Z7hjHjtEkTiCCr9qpIWVSognLsEp/YLahMATJob49SA
	IRe1y/RS1aaNm3+U0AW/VJjYoHpWILLrPqYOPZhOXW26HI4CmjSmz1jzVm
X-Received: by 2002:a05:6a00:4218:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f1f4378dbmr13170915b3a.3.1776260005727;
        Wed, 15 Apr 2026 06:33:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4218:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-82f1f4378dbmr13170887b3a.3.1776260005252;
        Wed, 15 Apr 2026 06:33:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/5] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Wed, 15 Apr 2026 19:03:15 +0530
Message-Id: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJuT32kC/0WNXQrCMBAGr1LybCA/TbS9ikjZbDcaaU1togjFu
 xut6NsOfDuzsERzoMTaamEz3UMK8VJAbiqGJ7gciYe+MFNCWaG14GG6NtaIzsWYuxy7dKJh4NI
 0Qm17U+8QWfmdZvLh8fHuDyunmzsT5rfsu5jpeivBvM7+vbZaa8r+ankYR65AIkFtPTayvcu3x
 UEijnEcQ24rsuTBoQCPIFS5ldXgwGjttekbIeUWnNppdng+X3RBUEH5AAAA
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=2207;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=j4RQSX4jl5tgcvA7X7wtjdziWOCRMMs7pw/KnDPtK00=;
 b=fE+pC5Svf7xG9In9cOGtvvMwqNJxK51fGOldCl0LSj5QHf0GHix1jmS2/k1cob8UmYjtmjy8s
 H+Hl6FXJd9iAVkU+/bMbVs5hXClkf4VbUaKhQzHdbr/2CJCiVNUR9Q+
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: CL_WCL9M8iqyDL9akDN4s-lAGsg8WT_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX/BSCqxB6LEQY
 4L5+C5CvnRQkjJM8Q/PsMYCp1kwVTWUlZPm/vZSXB3GM9gg6841HzPh28w6Bnie9n0ysdjdMnqb
 5/AK9v+EGxZbO/ww090fqU6OzbCFQay0nKpWZOqHoRqPaXJj4wvmNTXFXY7knSQNxAIf4vQi8TG
 D2nccdV0KTQuP3+d9rB0UoUf5FPmnz8pgwzktjA3reNLRYfEZiJO5oTW1JhSU2Cwz7je6Cl1leR
 szp/Ly1oZMEGJkivP9udDLUQzC60RlzgdiOlDAugSrsoTaFW7nVGbyv4e3bn19FEoYVZinvQWYR
 xo1irILwLIHSznEdJ1ceeK7q8VZi5Sspv6DkHWgkv78ivIOBh4BLVXmA+c4BbvNvqyFyoUuRLml
 lbEatbj4IUsfaLInXUI833d2rDMygz3+hcRGGS75UJ/phwhlmRs/I/SiBaNdx5/0WHtw64IdxeA
 Gbx0UeUis2xKP0BcrEQ==
X-Proofpoint-ORIG-GUID: CL_WCL9M8iqyDL9akDN4s-lAGsg8WT_I
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df93a6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103296-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7026D404D5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm IPQ9650 is a networking SoC targeted at routers, gateways, and
access points. This change adds minimal support required to boot the
IPQ9650 RDP488 board.

Compared to earlier IPQ SoCs, IPQ9650 features a heterogeneous CPU
configuration with four Cortex-A55 cores and one Cortex-A78 core, a
2 MB shared L3 cache, SMMU support, IPCC, five PCIe Gen3 controllers,
an integrated CDSP for task offloading, enhanced PPE capabilities,
and DDR5 memory support.

More information can be found at the product page:
https://docs.qualcomm.com/doc/87-96766-1/87-96766-1_REV_AA_Qualcomm_Dragonwing_NPro_A8_Elite_Platform_Product_Brief.pdf

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (5):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support
      arm64: defconfig: enable IPQ9650 RDP488 base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  366 ++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3794 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  190 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  228 ++
 11 files changed, 4742 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc
prerequisite-change-id: 20260326-ipq9650_tlmm-2a1cea46fc91:v1
prerequisite-patch-id: 13d4c96c03378602b50fa7a976e57f97f960b018
prerequisite-patch-id: fcc2de8f1b615b06fe2e509bdcb1ffd719274dc6

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


