Return-Path: <linux-arm-msm+bounces-88425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597AD1051C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDCDD3010640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 02:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BCC2F5328;
	Mon, 12 Jan 2026 02:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/a+kDHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKoJowiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED1A2F5479
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768183957; cv=none; b=AZBGroDMGjDsUhxiSYN8d+fWgBD1iqE7piYxMcSdmyqY4nllv5bQJ4rTHvwTjpitmnTERnKrrYjd2zjJxi7P9C56a7MLEgxvfDpp7vaen8uFtBsjTYxR9oEDZUEunP1ReDgRRG61IDU2qaX1s4CPG3c+ZzLhKgtwrqftUx/S7Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768183957; c=relaxed/simple;
	bh=kkzRM94g4k0ZUibZ/TPkJtsCiTNnB4epqNQqw39rwvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5poyyvGgtlRbr/pRaMpfKlzpHTM/mRGq4475aD4JX2EAVKNPRBbbrR8F9/rlZXwlByUzlFW3Qg+4IPR/x/TlJamxPH449OytVWTEuETj+leH5UQRtqdFRR3jtT0HsoFT8cfYAhcLWzh94A0nT5YMC0SAQ5qSNgknQiLRiA2Ykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/a+kDHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKoJowiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMWUPx3844762
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+o7VhKxyMyH5H0Hj9YL8zu7muqrT5hD+9J3pKy8WzI=; b=O/a+kDHvWt4Pe8WP
	Eo/0WJLQQM4KjPCnhQrKg/lZhMEF6yRTRlxBs6oS9vOwp9aiCluD93I+NhgSc2Ti
	v+BlRWv/s8891O7hPpXaa1fqKF5ZWi6ZaKhqQAAZo0zdvo/OFWLymcUrmgo38CHy
	F+w3TdSrSJeneNV4s9m7KwYkwKsleGBADwjsUZiM1Sucz5eKVJSvAJx3hcBX5Pmy
	hIx94S0Pc31Gy/wXjOIb0PuCMoAJ6KEjYsuvmv6Bk/JJA043QUkkCAm+FO9IMb40
	eRyB1RuvvnFdRv+K0hB1SUWor+87Jd1+HLE9d1MjLCVgczTCPBZQkUiy5hg5E6eF
	2q4LeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqquaeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso2436899985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 18:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768183954; x=1768788754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+o7VhKxyMyH5H0Hj9YL8zu7muqrT5hD+9J3pKy8WzI=;
        b=cKoJowiT9beN5sO/6RX4XgAHAhdtxhkW/38tk9wgGiSX/u4IUPBgdt6oTH+LP0sYmn
         ZMKiTvbfmBWHGVivqIb/njFGizEBseKj3n8E1WwtUwfwgKdUJNzWYVJfVBZxlNHlSuW2
         90mj1DPXauVGST5+hbM6xOuq5dirSpZHD3hDOHG2bsn6MTv6A89u6yl/DWIPdToZdD1U
         TJuNQqJxyMZQNM7l6jSNfFuIroHGUujVkG5osr/Zl1Bi7gQr3E4168oGQbcz2I43Mp0o
         bX/W+6+XnYVDy8MgETHt/ihe1wq8lQJPcsssSambrGxCaaxUFky5JMZokvh/B5D18mmM
         LuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768183954; x=1768788754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+o7VhKxyMyH5H0Hj9YL8zu7muqrT5hD+9J3pKy8WzI=;
        b=t1OlIDCdCbUA9hoFvtqgbq0gKE+aBpQjSIBQKOGpAr53Rq1Yrxr/WuaNGd8KvfzB1v
         g4DYv8O0lFEwdvAX63vQGWH30itGqTtj277JFyLx/G0YGhSG7sGfPu+/679MJe1MixQR
         FGApP20xpvTgZnuv02M/eIvnU/OGxvB8LTDxLuMxGuCnBgC/mYPN17K7qwpqTzWgOqon
         bm3cOwv8YKRWoUedJ6rgK98MqdbrFMTVeE66E4VNDGX4MNrcnIz0NqN5WTmAK9KKyHKI
         AdwX8DTmJwmepxRWl6Vd4VWTCP+sw9t+aQ/nQRoF0gcw0PHElHZS88gt+MPMVVxeewcG
         04KA==
X-Gm-Message-State: AOJu0YzVGTBHaJHHEgNZZq4aNFJTscPHknJ5g4FEXsbMc7pLWmHni8ZL
	fhuV4Fnqv9gc9ba5neTRKv3oktr8dP6Uu5GR7LAxglPZIPmbPkjQkoZNZLmVeYy5MV6S4/DCNnP
	Ay+5Ey52ELa7Izkbotk/aFbSCXtKWMdoQ7V2GXMRhohC4lxDNYvnN1Oxm544i7sidpsP9
X-Gm-Gg: AY/fxX50xTwHlFFQDffYZa1QwJ0ZzTHpcPXeVOkolcvysCD3EgL5AG/8MgT5ew6hCic
	s6XvZ6WDNzQLW1aVP+11fcytJ6VIY5asKCsaYgvf61QPvlFWp70tfN9VEI178MoswlJDJ2F5nA4
	C1RtLgoG4ADYjOXOfWES/X5rfBBK8r0kGupR6G0Dc77ykseH9qYkhlOfB+H0IR9e3oH/sIq0Tml
	eaOevBNF2jcd+eL9PoPKkhf7PAKfzQZk5LhTxFmieT19RfX7AF0g3DEL4XXHdzCh9yxG+DZtCtK
	oF1ZuO8N6eS/8gVwnsjmTGBr6syAZnbfqdYcbULVe0dJJr1Zb8a8JprMp7JowZae5NCijLBSGVL
	qL6cSi7KFnIwU6tFAZPvw55pxsJia6NG8Bpmj42YV8OHRLhaadhZov/L7YtTbMlWJBbjAwNCWnZ
	wXkFjOGK0Rf32GRx8v96RY1bY=
X-Received: by 2002:a05:620a:1904:b0:8b2:c2ba:7075 with SMTP id af79cd13be357-8c3894172d6mr2351999885a.75.1768183954595;
        Sun, 11 Jan 2026 18:12:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhJ27EgCum5Rw43tYYoEWj7C2F73gPQcKyM8KdN24TkPW2Xa/AISE6jNDbdZ4b4qE8YHjFmA==
X-Received: by 2002:a05:620a:1904:b0:8b2:c2ba:7075 with SMTP id af79cd13be357-8c3894172d6mr2351997885a.75.1768183954200;
        Sun, 11 Jan 2026 18:12:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d95dsm4499529e87.30.2026.01.11.18.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:12:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 04:12:23 +0200
Subject: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kkzRM94g4k0ZUibZ/TPkJtsCiTNnB4epqNQqw39rwvc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZFiIPmging7Ut/k+lfXrncdZ2E4eZz5AZgWeI
 e9KviZ63aqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRYiAAKCRCLPIo+Aiko
 1V2SB/9NTNKtZxs+lUj3JFCgKR3Nc9DOskqjHdTeVH70r0lJ5d0qsTkQe8SwZVsMKu4ZxpPpER0
 68yeHvU8Xirv0WT3YfkzZioxbGkDhB6B78ZT/Ha05Q4sTL0XJRJkIJe/Vr06NEEi6VQYNDjX+Wk
 7q2MtFeE8jHZ+2RFBK860jeUaGudYBY5Dt3rR87tUa3ZzpHV7nw6N4MQkkGsGFTnLvllF02eXQP
 Zjvs5DZCk0SPP9osFZFjEF5GimeVHm+8AFTdKzg5mX0icNYhl+fpAwMps72Yk+4tGl+0MgcFm23
 61tbvvZDPPyzu0lO2eP8nf2BNwL0U6t/a+v+dhnt5XdDax3b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: DXXl52bPnihceVv6NzElR_EkWPVA00Bp
X-Proofpoint-GUID: DXXl52bPnihceVv6NzElR_EkWPVA00Bp
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=69645893 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7ahx9mval_N1o9DOsQwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAxNyBTYWx0ZWRfX07QdHp4XDiAR
 cIcyhsWk62xlEJfLl/08rf+gsFSzQOyLlOd3VvW3PHsCvyeGpGy3glIJnK8iCSIVcB8+QMMgWoP
 wsu1N1Xb9pSdmjx3oyRgkvK952Pg7v/DGRTRmgcpqmYuwayuiK72kGNz6oU2wnf6KG4C7XgTIOM
 0J93sOVLH447Clu01wchmO+o4qxzMvBzbYQ2LRaGfP1uIPsUxXzkgtGejb7d+CMUu34A0PYnL3f
 nmJd+eEXQaTtyE0mZNqvyisDC3n8P467x21HosbxR5BZ4HP/A1jBi5PcilIe2HUcvg1oL0Wq5iC
 cM1LK/lpPrhH6nwAPtR+CQJjKd+xv0KR7NFlLyVJDic/fwj8Mf9vPF7A3b8sfcOrIUfhg/Asqli
 A2ZgzIEx7GcsVIl+EDsdJ7f2buhymYjJOPz4vPG5Ys0RjzJvGnGI8rtia+hlATglQKjBbvqorSv
 iKiAfJha0n90gco1IVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120017

The clk_dp_ops are supposed to be used for DP-related clocks with a
proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
as all other DPTX AUX clocks in this driver.

Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 9ce9fd28e55b..2e91332dd92a 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -409,7 +409,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 

-- 
2.47.3


