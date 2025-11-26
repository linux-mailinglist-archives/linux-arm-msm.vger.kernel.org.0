Return-Path: <linux-arm-msm+bounces-83437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11293C8924D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BD363488DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F032FB96A;
	Wed, 26 Nov 2025 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr9/oc0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrQBCplb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66FD2F1FE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151054; cv=none; b=Hc7YyB7A7ljPAS+fhJrK38CGB+xKLHVougxn0KtctDg4aMo+iTIHPt5Eubh+iHxI1z4t3AUPqNQLejjlK9bkXeR5faUm0qsLaWd1jDUaAW5aUBk+BbibeBaFw/mVUN2m5JPrhlmkgECuO8PcX+/OLkCexEkpxrgo4o2Fv/uTLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151054; c=relaxed/simple;
	bh=J0B678eDVu9Z/duxSEgjxiQ12Tk8QvyJ/VlAMbBpPcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APH1AxHLsiguoaVjtuLYh01/1fgzOelTdhRpOfbbDJ0kNRLZ8H09fGZmjRd/ochqmyprNJgjQwJgZAw+8ohYoqnM9lIZ/4nhr6LHL9kYqTNnQopchTaTsN1n5o0m6i5Bexewcm+nZfLAU6MXidWtgVqXXcwCCjxaFYOujJ8ePug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr9/oc0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrQBCplb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ30DRU3706627
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oD7Bss/wt/d5pIxNED5lppCxDd7MsL8dbk9XzcwWCng=; b=fr9/oc0WWJLR09E+
	2YXlTQgjb4c+ewWEQpcNTlUyldTKbaGwQevN8C4gH164ozjTgHzMt3W4Eq5gGldr
	P5NkATj0Mc1xN9GZxegeE0eusa4nIglgMnV0EXCxEotE5R3JW5PRZhTTqM/dncIF
	fC6ldZ07pjVklJClG+Eso/T+9C3FwyTrpQ/cnUUcB/jZh6fBRSe8xUsf9kNjswpR
	bNhj7+L/hUuZamacHCSVMHdUdEj1gc//dqB/D+59mwWwB/P58pB+xPj5m1IUw2r4
	UcI8G5fHL6Y3RNZyBlV1VUXFQG07mufEJlCPurOps4xMpI5JoB2PRfelBoRr1F0e
	A9vfqQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufu0am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:57:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-342701608e2so6742916a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151051; x=1764755851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oD7Bss/wt/d5pIxNED5lppCxDd7MsL8dbk9XzcwWCng=;
        b=YrQBCplbBSU24ls3QXd07PdAhvLDhNVwPPK6xwtTBhFkrXnDF7vY8zpIMoXQwRBQQ3
         IC0/C62jJWCC5fD4J4elx8kXVytTygZgkH/JXCdUrRy08AziW/6okcOzQQDgXw63VLi+
         sDEu0Z60IPmeYFuHbEUfCroKudKEdIuLtpAVPcN1CIjsh8714w9EdSV6/UD7eXt4C/qk
         B9kmZYEZ6ovsxMCzdeqVKQhdu4n2/puj83GXelhxoey6qDaYzt8PRG9lAiWIOmWEOIMP
         j7z2mYyLprfYzVoQPRgj+EgN8bJ+oGmsZFuUbL9Mt0ulFoXYkfhBehJwEKTq4frOsPU9
         F1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151051; x=1764755851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oD7Bss/wt/d5pIxNED5lppCxDd7MsL8dbk9XzcwWCng=;
        b=F8bIyAwZKudlPCTQT3UVtYXmdJie11/IGqq5G5ZJO8f8Dqt5dO6xJjG3Kbf/kyG0fX
         EkDWD7qFle1qDtk+BdAEIAss1Z0aOJNI+5FPy4DowvVSz5DQuNeAar9oDcE0HKmMiEpn
         +fdVKpUIDIF5lh8kEXnrrWhyGHE3kX6zpFgfXiV9GKpdQUQn/Uj9qB0OIynFrfX1zBnC
         6LlOAY/8uRA6bh0ncqbrz4KF+kS/XvQFUQDhVHXaKI5bfk17CInMJPNjabIB60acz54+
         JbuQ5tR88TrzNxwktRYqzOHrdOaYqfMLnR8tfn4yWeSkMT5NwVkXus4jt2xxKnkyRyFN
         izlw==
X-Forwarded-Encrypted: i=1; AJvYcCWb6rZ9kwSa/bGTHMqcgiQ3Qhigso9gF93WCqbD1Wuz4TRrMN4VawgXPGBipN3yRsoCi6/SWjDvDEhXEbwW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj4GhEy6D5zuW5wGD8XGOn28TTMHfcdhu8egy0Z34Ro0YHsXlm
	ZNbR1XcofmKo63utxD63Nm1iRgHK1xE9Pq4kIPdkrHRvirxQQDOmrNGbV1+EGp3Dw6TCzNacz1E
	97UZ480pMmWyVa3AJgG9G2WC61K21ZnaoePTrU+Lk8+eUBjAWrC0ujsXqrVAUHbKcZuvi
X-Gm-Gg: ASbGnctqx6R9206dS6vRELqDrITB9+kluEuMseiq/CJBbaYmeOod0vsEXMzN22X3kex
	l62QXPd7Oy+dISJitgckqp255Gl8Z5rqX7+3LeiaMys7TyDISKVCUclxMk01X8xIJ+SOnVvvdx/
	TRIf1GBOuwJbogLhQEOn9hFKd/5WgswuL8iYMaM4Z28qi+0oxGRa8WVb08tcbKrqmn4plic9XYu
	jVxciV9HUzpfKH/xfy1A4p8WXFCo1n40juepHlL9xM51nCdkJAXkISdOE/2xOptGT1YOPYD7gPZ
	8mjDAAftHAKbK88fBEpPvEElVkBq/UlKXfX+ZgXq/NYSowXwtEC90IirBBFvBL27jfsES1yJKcN
	+DYczoksN4oc/lIsZ8b13AddaibE2F4yTRw==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr6413848a91.31.1764151050680;
        Wed, 26 Nov 2025 01:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYLYjAb16u7lfLQLzEGUwap6QEXfCaHnDl2Kn1tydEBupv0aFqxHUA1v6206gT3q4BJ5XJaQ==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr6413829a91.31.1764151050178;
        Wed, 26 Nov 2025 01:57:30 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:27:15 +0530
Subject: [PATCH v4 1/4] clk: qcom: rpmh: Update the clock suffix for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926cf0b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ug__2KZuwjXutcTiuykA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfXyXWJ6E06zQK/
 uvpfATWU8UVtry28dmdvDwLXf1u2t9Z4MjbDIOM5UYoqUV2QGx2M+o4vNFu0Oe1hJrkfxBEj3YL
 g6dOg9QhJhqPAI1BgPEjygi50hrXDC15EYRBcdjnD9q05ijeBAyinQuAPyeVhf32oLYAC0DRhOo
 BMEkSiY8aZO2qg70ClNgWZquZO4MZQLTtZZwk/0CPYhwRlgfpnPbtwxz1gbY5DNg9/OO1/hi6kp
 b2JYsFX35mphCUnmaAPyAxAcdLQUXyMbv9h/co1VTdJaUVNdGqo9PNWl+2r5YlNhOog3VJay7Vc
 ICAGbZIJL2WIOaxj/vVAyX2kQyBkDjn5LFORpwEq3ci7UIH8IWO84QQ/1oj/4KAIh8ZhOTRZBp3
 3JCxzLkPxzH7tjbgkSeftYjYZFo13Q==
X-Proofpoint-ORIG-GUID: CQFCRJ8P4J5wm8qurzOWqQmaOiW0AfIR
X-Proofpoint-GUID: CQFCRJ8P4J5wm8qurzOWqQmaOiW0AfIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260081

Update the RPMh VRM clock definitions for Glymur to add the suffix to
indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
C8A_E0 clock resources.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a2185a6f321fb60ddc9272582ed67fa9ada6535e 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
-DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
@@ -888,12 +888,12 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
-	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
-	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
-	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a1_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1


