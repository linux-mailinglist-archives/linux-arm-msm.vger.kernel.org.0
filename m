Return-Path: <linux-arm-msm+bounces-71243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE4B3B877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 12:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26E01A053A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D630AAD3;
	Fri, 29 Aug 2025 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5DMs3Wp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D12285CAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462533; cv=none; b=RG3+M7vIeTBL+p1Nyx8OLNH6H2QkGLK3Q2UvcOsd7ioPpPkSKIsMxXnlKtNRoWSZPk8P06EJIl1JgZ3nJ2WHn9pvie+dHPhntMHw/T+VpEoHC2pKNYRBsp/58Q6XK7hl68sD0MTE5wqXDtAFgUGEOXJ9i6vCURv1DSP+R6ZfqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462533; c=relaxed/simple;
	bh=O6Mny0d3NcWye/pa17Z21QvQoVkQuVKY8Az2O2Pwlvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLix6c+nftjB6Ifnz+kUSE5teGfLqPkeVIxOyZK8KyuN4RGLsNMNOHNns+VApBjFsntX7LN7uOPM4XyZk+wJ3a7A0+WJ1AoQPOHhptKCth/jB4tiYLvImDJkuZktGhdtyE1ExCyDMh+qe0E0U2SBrlMP97l9Yi7jig0NRsSYfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5DMs3Wp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85MR5008810
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0FPq/lTS4AeYWLkTBpagiaokL1Hd/X/PEFyY1CbPsh0=; b=a5DMs3WpubgufhGF
	ZBQ16Oj28MjGnNdoI3GOwBDvQg5tytBf8Vh/N7m6a7rLFh9t+WfjLaFzPHXNdnGc
	J3tZnqkwiVjPdzNFRT4U9NEGIwVp16B6L6y+OKxI1nnSE2cDFXwnWTdiLEWp0TOA
	/W7UDwure3Fhg2nBCKGDoN1NcqK0x18puzOCSkTFucS6mF74BcBBXTdJTFJV1vvs
	gpXbN6WfwmAnWhAqbFvZsNH+fJ9KCf3recVEPddVBo44Npx3f5Qlkb4VeOtyewwd
	ba01Om9khDCgrckOs2euMsnlYhlCVRw1bMCu2pzyoTRL/zlB8fA6tiTujMw/aVLk
	Qs5s+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up3e05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-248d9301475so24945555ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 03:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462529; x=1757067329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FPq/lTS4AeYWLkTBpagiaokL1Hd/X/PEFyY1CbPsh0=;
        b=cV4Zfx1y8BGIaiucMOYzniROQHvbJkPQ9TLwzgrkwXo0js2j0xBIbwn9d/bN5h8fsq
         8XICdN5fSWDsiZEirbyZQwOh9ssqScUF3g35OafWKJlLJXss596f6Ok2YqsDexBXPG2y
         fJmtpWjcFTV6LsvqKSqYL8b+G9yh3UUSTBXCxcZtFO9PAjc33ReVZJvjrQz2TyaP1jMK
         Qwc9Tt/sFIygVYbRwf+jUBvmK5Lubs5Eu7uXDFRp4OTN6olROUO9DYIII+2HitvmHKj7
         4k5y3cB9mF4l3aF6lV3lV4Q5OkshVFEDDZM63W/IHD76Mdq2UEg0+xyJVgsZwNJjoLlR
         8Opg==
X-Forwarded-Encrypted: i=1; AJvYcCW95QtkzBWYCfnlH0hcQjNa0MupkLAHHTBwforD/DMpbCyZMgQ0TLxVfP8knx5mlXV+8PkNdfol+sZVmMKh@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHVF/pecFBZnzOk2mMYHhFToQSZRuh+htkNPmg5RgrzMunJEH
	rr8u2q5qK80irTW5KMjH91G3Ahlmn7nSsTDdrUAWvSCpbym7zJ11J8bDZx7vEHgy/rQWv351oXk
	hUIjEBA1HSJcA/2Q0sWn9ofZrRs4Pt1Qozn8oAt8Di3pY3HVJaH4Za8bFhN6MzltBajlX
X-Gm-Gg: ASbGncutejyt8RufMUPH40s00QpuMiRC6PH6rIz81iMrSRe6GlprgG4jp00UENoO4oP
	aUnUEaJhcnpXbzeeQW+hGG+dtn2RuHyXKvMbN1uO22JpK/FfVOjxUwGJinS5m0CPUbdxXVLfJPQ
	D5GYBAib4wWPUverKcfb3sKnV31xknBNGTGumN1bzayrrslUSmrwDxKTThm7jatQbGPtaIPdoQJ
	KFj3kJTl46+h6BHQiX52bXJF8Os/JGLX5onAVRa7H383tJRW0ZSk9Q+cC/lvxsnJ1Uu+L0Fi7S4
	xdEn2yqXAUnz47hwKixx4TeKectOaPPW70VOpFCKEKxNcS6QTGYKqgzWy2K/30a7
X-Received: by 2002:a17:903:124c:b0:234:d292:be7a with SMTP id d9443c01a7336-2462ee0b991mr357449215ad.1.1756462529036;
        Fri, 29 Aug 2025 03:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEld9WAS7PefNHcO4cwh1kQXSdou68Xzfiyst5T+t0EqwcyyL4eKB2damNsES8FC82eDU/lYQ==
X-Received: by 2002:a17:903:124c:b0:234:d292:be7a with SMTP id d9443c01a7336-2462ee0b991mr357448305ad.1.1756462528115;
        Fri, 29 Aug 2025 03:15:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065d1b19sm20102775ad.131.2025.08.29.03.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 03:15:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 15:45:17 +0530
Subject: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
In-Reply-To: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: DoSc5Z3EtWUuQwR3kH35G3VGfDkp5jfb
X-Proofpoint-ORIG-GUID: DoSc5Z3EtWUuQwR3kH35G3VGfDkp5jfb
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b17dc2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TPL9fEiPDwMg0gBHboQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX6Rmuvv6SrxTq
 bfGjVNIaC956d81t520KaaH+qH/eD4fOAC4SsRTd18QruUVrn7hdOapoCGUoBk0I9Jomco7exdQ
 MkWxbhAFDMCdMh5AyCpmerx1VnJrjbrLND1DFKKSZdCPy3QwztDAIFIBJxvfnP+I7IZsK5QVwcz
 tu0eW1DZT8cE6fzJghh2IGQTs22EQyUKu4QU3OFZRn6V07TPMknQAyQz7U69h23odIcAI4TEIkt
 J3p2vbonFsAy5iTksqKZwdHTD32CDPxqo2gfw6YA+9LQnewZYBwKbpc/GM0y2X0LfauzI8QXIt/
 m70S5GVK2QgYLoAYuX9aFvRxJuNdAtcWUEBZNIMm9BdIVOcUjnC28eU3RwyVTxwL/R3cOKhdJFQ
 ea3wz7H/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

Some clock branches require inverted logic for memory gating, where
disabling the memory involves setting a bit and enabling it involves
clearing the same bit. This behavior differs from the standard approach
memory branch clocks ops where enabling typically sets the bit.

Introducing the mem_enable_invert to allow conditional handling of
these sequences of the inverted control logic for memory operations
required on those memory clock branches.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
 drivers/clk/qcom/clk-branch.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 
-	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
-			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
+	if (mem_br->mem_enable_invert)
+		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+				  mem_br->mem_enable_mask, 0);
+	else
+		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
 
 	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
 				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
@@ -159,7 +163,11 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
 {
 	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
 
-	regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+	if (mem_br->mem_enable_invert)
+		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+			   mem_br->mem_enable_mask, mem_br->mem_enable_mask);
+	else
+		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
 			   mem_br->mem_enable_ack_mask, 0);
 
 	return clk_branch2_disable(hw);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -44,6 +44,8 @@ struct clk_branch {
  * @mem_enable_reg: branch clock memory gating register
  * @mem_ack_reg: branch clock memory ack register
  * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
+ * @mem_enable_mask: branch clock memory enable mask
+ * @mem_enable_invert: branch clock memory enable and disable has invert logic
  * @branch: branch clock gating handle
  *
  * Clock which can gate its memories.
@@ -52,6 +54,8 @@ struct clk_mem_branch {
 	u32	mem_enable_reg;
 	u32	mem_ack_reg;
 	u32	mem_enable_ack_mask;
+	u32	mem_enable_mask;
+	bool	mem_enable_invert;
 	struct clk_branch branch;
 };
 

-- 
2.34.1


