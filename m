Return-Path: <linux-arm-msm+bounces-102705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKKxHmUo2WkPmwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4D3DA8E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2813A30075FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F353DCDA3;
	Fri, 10 Apr 2026 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pR5I7z9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs5/cAmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D53DC4DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838815; cv=none; b=Jrwdu/1++pTflu2gTHFwK7El5k3jYAqqfk3hzyJZrRGRVZh8jdpwJ4buKAW7GKhQ13GuqVuH70gto/0Ynhiw6RfPTKUKtT8QRuFfRnsXDxVPNFfd3C2pMMZmxLW3FTxmoVOxwGXhnNKRY4prIwmevvjFsNDsf89b9MmaKgwZ8O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838815; c=relaxed/simple;
	bh=TzUOmasvPOMM6OLooCKEI/dOAGex7b/pquhEI+XR0aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDAdL268e0bbsYqVVx9p2AEHCregL0KWYfUInZ/RaBSLlcKtBD817DMjsVdcD2v7xmV1GhZcH9Nurr2j62nPbFCEWgwN+7CadN3l9M7FJS2WF58n1Br7sVrsIViGsVzfIuKrfkw9tmlWVWl8x1nGBBwwuj11UXIn3ADlaarMeKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR5I7z9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs5/cAmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AADjNb2698258
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 16:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D+NXYzu1gj0gwTGsqn7k4GwpoqHtGh/2P7C
	+KXpS6Co=; b=pR5I7z9PDLedsrRpwQXflQzUHBOihnDpBCr8hw8+Z9wInqzrILE
	FTIihdJkAZXguQJuhNViZstkAKCy3rAjCXwlHhkSjVOoOZFZByYXvbmDu2rq8UJt
	LTQFnOucI+o9jY6jLk08jFwbS5TwOZtk5jxRYwSja+LvWW3q/4Xp8cB3EB+CXL5d
	vXenSFRihkl2KPWvUxDQbxVGb6j8gXXcNq13AC1hZHc8zUYVsv70B8QovNDrfKXF
	nhFfpGtMdlEEtdjogJKCadg+eM4kTNJLz2mAFk1Qoz09zgkvoUOAMdgjqH/mdNTM
	U1jlfb7kcMi92OAo94O0yzQmh4hKB8Hj4fQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9uw65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 16:33:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so44498501cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775838811; x=1776443611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+NXYzu1gj0gwTGsqn7k4GwpoqHtGh/2P7C+KXpS6Co=;
        b=Fs5/cAmrjwpNfvBkvvuarpNGzXN5VDqkeWhpFbB4ORXpJrbb/A9BYsG9ovHeocmlfP
         AI+8VBLYaXWbOzaWOVvZ5VP2DmckH9R+hiIRhE1HAuBQPHrWa26TuzPxf7/eAdF2P9Pb
         /+gWN/euplLgt9qkUesjtE/Ulu58DaYi3eaadhimgAL0jyl6+BAizQb0f4xvV3H3Pie/
         tOSkD/BbsQXTG32K/u7s5vjZqgtSuQ0ICGtOeIIS5wsNd9g+/dsPqELKuanSp2eLoaht
         fbXjxbpy/IDePfSbto/BTAqyPBzScrfJv0U+fS136VcurpjfHH6ifJmXoF4eVXENqHj4
         rbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838811; x=1776443611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+NXYzu1gj0gwTGsqn7k4GwpoqHtGh/2P7C+KXpS6Co=;
        b=HRAzbKlp5+i9LsfVCJ9y3YNLa0BpwmScONQ15ULTtfEDNqA1uHNhVJ4umm99NCFfiX
         gQ3RYKudEBJJFswC64jMxrKcH+WNDTFCQElCGKUXAfiegCOBNH3ZzjFb0s7yAremov4i
         NHZaaXWe0oMp9N7rFRgm7vQwWozlgkHf+GrzvOkGX3FM256xVfAmzaoqWVuyhwE6jrW4
         DVwz4Hp0v4FLWuxFQTvpPbTeo9tUp/jDcfcehpMeSBIqJhJ7thcgE06d2+D692StsHWG
         rxfY0X7xRO2mVQnV2eRoxNSfilW5VlwZRRKrFEJhPhno5doKwdIfokfWUkA3UpS79gAM
         5lyA==
X-Forwarded-Encrypted: i=1; AJvYcCVkGveCOusLY1PAS5c/NHUvvitanUyB4Dc+4DPLkeVi3ynWUPmeXeOVj5/zqLyfeUcDdunJG8jDNWZ97Z0f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ztGqyrbi2RE09bHuqiy0b3TiIKstUKL3VM8UGD1kCIXMrhtA
	opWDDw0WYfnjqLjtMEVykhYELXtcoCBTpbjjxIlRTYNAUoVm0aTEt/1Wi2QRZ/FuEcd+8kZANpt
	26XSd9S85NzpaJjBh3bN2GqGHEv8PzofhPePd8ZJ86fzv5+KG7Rh7Kgm56vhgaHVGPY/Z
X-Gm-Gg: AeBDietCpmQC3z2mzvgOsbjWuo8JpZIaxiLVZPVSLe+d0SfOjl6KZbi0U/cA2L5uCmg
	+iWgAZ4loisR3LMkse6JgGnlfoBEoEse4NGOM+P41O3AIybYy5n8mtEfxCFbQPPttMcFZnE0l4R
	5pajiVBYwIme+G0rnUpbo7PlZY29OheukMv6c1QdFp0LI8ezK4ZuyyUzeggBD3G82SU/l3xqZ3H
	l9vRwJ0Gffm4pVxhcFs/1bItzzNEcPhj48QSlT7PEx3gvY+Ah2wg4c+GaXkE7jbCRUxHBVgZv9x
	DFtLZmnOjB76ysyOzVJg+Z3NrtxpRoja3t0E/eoYytvEjJAW6pikQkOizDjGWuoBCeWFDJ7lMS2
	wrgy4JQvJ5cR0w7yNYV5uJT7D1xi1/TGVWp4k
X-Received: by 2002:a05:622a:1344:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50dd5c3df8bmr56506791cf.29.1775838811527;
        Fri, 10 Apr 2026 09:33:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1344:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50dd5c3df8bmr56506141cf.29.1775838811010;
        Fri, 10 Apr 2026 09:33:31 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b128dsm40569745e9.2.2026.04.10.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:33:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Fri, 10 Apr 2026 18:33:27 +0200
Message-ID: <20260410163326.566093-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=TzUOmasvPOMM6OLooCKEI/dOAGex7b/pquhEI+XR0aw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2SZWER8JjoPEU/t3kOyUEefK5eDSCBot85mOD
 MwYnr3+i66JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadkmVgAKCRDBN2bmhouD
 1zX3EACZcWObD6gkcRPnJvDS3U+KbCn6ZHkljQdOT6WiRCIrm85EC7RGeDv5uJ70dRjc6/A8zkq
 ermha2285IJpfVE+O4S13uzVCBo9izcDeVfLYZdkqa0lh2UzV1XcehukBAVmrb8HYMi31/2/iKf
 cub2WL/ZQBHQ2aRSeTTWvbblVGdcCpVVXnaMpBw6bndZpMHbfVlyXHNgHYavYZF99WfIMgNONd+
 GVaXsMZD4PGXRQPpcI+arDXzwQgz7bkCVdvq3FS4Filsst2y5b1vSujB8MNPtnp7H0uB2bTn7ms
 twOnj4RHRriHUf3OZ9dKDiFm8rMnAdRBrM9ip08+q5JCoeCjQ4IiTGx898wWKylXwOhb1m1wqQx
 HNCFEmk+zR/puxOK7ZajMyawGxAcCXYr4+cgH99fpfNmv256jA47PsiKlRotJJOj+yX7uST7TnP
 hFIIqR8EC4OQXm3oyvSwz9+c12XwyRGblCJBaqbQ4ANrOJ6QaEQMyPzTOAkdcGcojQNi/1aSJR0
 2Cmy/Sp49FGliO7HIaLYRF9FFGvWEMPau1GcRptq0Ilc5NIe5kOdS2BySmatSN2KGR3Pi99E2gA
 FrwMiywEd/BvVfwcMonsc8HJq+bYA0MJDYnRhhDHETKlb0mQHlRrorUVZL5HnYmuE1BxpepVihD PmmW96sxcs/8HGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE1NSBTYWx0ZWRfXxlpBfeF4TfAF
 myMgkL3SVukN/IxKr9ymXe2gUoUy0kbNFVBwYoho6D61pknoZiF1YYCxwxoQtks0L0RjIQ2jqJg
 ofeuM8YFfN7fytadci2qhxI3+o+HQmAw7/kLHd1TqvIkVFkpcbj8918KollVkRz7Z0ntSOi0syl
 63OHdmcTxbFoF3DNwSw2H+Jh4HdNJ10xxuvBSYrVz+aA6+hrxPt03SkPOPxgoo8UF1aF7ofM4Y5
 0E4+jBLA0O80ccroHSCZIvV/HiAAKxtzBWOSwpkCSfBzjY6g0TkhRXVZAJ7F2eO9DkgRBXwkJ7f
 O746tWQjxZD8PWDxFQKTtMYF5EcJ/onObmsZ0Wf6YWVcPu2/CPCavx38hw+WS7xwo0dpKQjOsnT
 4pMFkPc0RE8L1OL0p9O1hjXohgNgsPAMJt7s4St9PdgzxJtUEvTFeJ0aPcyR0T/MXprOws4Bvvd
 jjNDAS0CQhzmoIgGg2Q==
X-Proofpoint-ORIG-GUID: vGV5bn0VNxZTqaFk75pFZu8ERcqu90Re
X-Proofpoint-GUID: vGV5bn0VNxZTqaFk75pFZu8ERcqu90Re
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d9265c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FGFQUtXPFg5wjx8ao70A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100155
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102705-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7C4D3DA8E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
are already treated by common.c code as pointers to const, so constify
few remaining pieces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Drivers introduced after my previous series was merged.
---
 drivers/clk/qcom/gcc-nord.c     | 2 +-
 drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
 drivers/clk/qcom/negcc-nord.c   | 2 +-
 drivers/clk/qcom/nwgcc-nord.c   | 2 +-
 drivers/clk/qcom/segcc-nord.c   | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 3098d8fac0fb..8a6e429f2640 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1850,7 +1850,7 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
 };
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
index 5d52c6d8b5e5..1466bd36403f 100644
--- a/drivers/clk/qcom/gpucc-sm8750.c
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -421,7 +421,7 @@ static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
 	&gpu_cc_pll0,
 };
 
-static u32 gpu_cc_sm8750_critical_cbcrs[] = {
+static const u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
 	0x9008, /* GPU_CC_CXO_AON_CLK */
 	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
@@ -430,7 +430,7 @@ static u32 gpu_cc_sm8750_critical_cbcrs[] = {
 	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
 };
 
-static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
+static const struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
 	.alpha_plls = gpu_cc_alpha_plls,
 	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
 	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e5..2cb66b0691a6 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1945,7 +1945,7 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
-static struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index 163ab63c872b..31c7fa06ca92 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -641,7 +641,7 @@ static u32 nw_gcc_nord_critical_cbcrs[] = {
 	0x1a044, /* NW_GCC_VIDEO_XO_CLK */
 };
 
-static struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data nw_gcc_nord_driver_data = {
 	.clk_cbcrs = nw_gcc_nord_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(nw_gcc_nord_critical_cbcrs),
 };
diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
index 1aab0999de4d..c82a56d97154 100644
--- a/drivers/clk/qcom/segcc-nord.c
+++ b/drivers/clk/qcom/segcc-nord.c
@@ -1568,7 +1568,7 @@ static const struct regmap_config se_gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data se_gcc_nord_driver_data = {
+static const struct qcom_cc_driver_data se_gcc_nord_driver_data = {
 	.dfs_rcgs = se_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(se_gcc_nord_dfs_clocks),
 };
-- 
2.51.0


