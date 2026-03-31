Return-Path: <linux-arm-msm+bounces-100988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ42FaaMy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:58:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BC236690F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADEB23052BA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6863C3EBF3A;
	Tue, 31 Mar 2026 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2edLbMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0IA7dQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594733EBF0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947333; cv=none; b=jiGWrur515y3fCiJfgQfy6+k30d3sNSoJCxRJX6i8gbsRk7A78H85P4TRTYp5fjDjG6A+6R8+k6pSVP04Wh0+h1PcaZBWZFBLrAweg+sG8gNgTw9K5bihvlPgsNE6nBe7yzVOI6GjUFKn8tJezSO9aC/h7RkHJXetm8xtk46R+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947333; c=relaxed/simple;
	bh=VUFkyCsRpXcEf4IxHPGvbBOI/NeBAc7RjncVGxR4t8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iE8rMYF9exGIAEArM8cfRUO+sFLYT9DTXd5/gXYj5lN4MGjBPjpXm78FL1Cx7qHBnEHs5WWMogEIQ5rcqhxslv2vo/6jSUnaVam81mp7KRj/0NRYo4AEZUvXSwF5YaILtp7B4BNZ8GhOV+VL6dZVWBIIQ/ZsTf6nCK6ettVO2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2edLbMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0IA7dQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6js4I2391339
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QC/GGt/5GTW+J0JKwibaaq7WGcgfH7bSyzx
	NV4zifnA=; b=i2edLbMZdGaY0qPKCTxNfIzt+U+4suF7NOkP4giZuvzH0hC8dKm
	dpsXvNP0VrWqSUwNAkcFnEcYaBXQ+9KewYABs4hSZiRd9Pbf4Cy4TSEUZHlVLBmd
	v1APsEXxOkI+moW1Ac99stomunchPxYKfWtuF+HwHrlvyqv8//XMSJ4vu3KAlwwo
	ye251oVg+RUL9ulQf+fG4X2TLswc21zST6iHd33dReHwYTumxpbLU32pOwDHfqbd
	IBW3QjAOP/37HpAYIHnvuRjzritF+oVdKR23ltShIHlQVBntw/0bYFHyI+R15AnG
	FRpcTMldrDuFuDFfya0rt//ml0sdt9x7l0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kphn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:55:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so177832621cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774947330; x=1775552130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QC/GGt/5GTW+J0JKwibaaq7WGcgfH7bSyzxNV4zifnA=;
        b=C0IA7dQ3hVSN6qZHniDV2ObCX+GgAxtGTwo9zjliKn0fLjzk+bBEnyxLpIrSEzsF6o
         ZFwdrBDWnB7CoVIdRNtEBULdoTsi0jJCAzFDnD8AL/xgEke3gyVFB8szf0yGOli2Jt0/
         f9FFc0kkbZNeLUE8uqwFMm2klPmF6uIpIQkPDE1kSFuzn+2IQd9RMPhmsthmE2sj91cU
         n3HKVZGUtpDpekfQv3vBIktJz9rVtAq/r3UVfWGgyOHqLBaQdRWN7kMntE1YI24dmzwL
         +MGMzCn9O8QdRX62+NF31492LEv8GIMCkkO6GmkBYte8xzti0/NLUf2ayE0XExxL8VKA
         +RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947330; x=1775552130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC/GGt/5GTW+J0JKwibaaq7WGcgfH7bSyzxNV4zifnA=;
        b=YgeLlLQVHuQnFyPo+nq1iqoq7n+77JIWSAApOGBKRNJo/rtrL2JDrfogh0m9Zr6RX0
         mbfdxy9enr7VXNWwbpLrZhJrRsMRz05PmiaZsteLCoDc8rmVgIn0iX4Qyj1eMXN98vzH
         YMyCZpEWQXkiSTxjbkbSAnTbEXSTVXsrX4IPv9ioTsBgKPTnT4u1M7shRIFdrCImnmw/
         mjK5BUEHiEPCTibZdNSv9OBXqZbCNaY3MTkmv3WTwEgT8tYJrZ5WCJuN5EhFSHu1NO4X
         HrepUVQi/XqQJnyXImsygScXEmmRaRq8wk42XoFOftzuDcN5N1yAFYwS4B/DAw/dXJvd
         UCYg==
X-Forwarded-Encrypted: i=1; AJvYcCX7kKQ75t9NfoLQk4aeFqSwuYPY78jVbOkmy+HtsZP1gG+8a+Sdufr56uEz2biJzu7C8IoHW5oaFCdmaTi+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6z7TzSjppmy0pZSLbBBSboA5vdRrNH8Us2yLxBG3wbbth4gU1
	NMtJDFlvAXU2OTYM7hFMTcsxQ/JmWmnaV0iX9g8TE1H+Yg4YBRf18D0osMaYc9k0CJHVGsj6Ghw
	puyF3sTCnxocrt7InJWK6+czlTuymvEY+djZmmTlVPA4CZmjG1xWMLzaAa2HV3gACB90g
X-Gm-Gg: ATEYQzw+nLB8Pgml2VVDfAausg/Fv8SrEWRLmy/AsulB8DMq1pDVBYJMNkHXtrjYfzl
	IOGKjnrOVV9GBwKI4FJ/1gctcQSPEo9m2FOqgTFusyNDbnZWSkZy1D9yoWYTQ0CYvlKCKt2LNJs
	iNHoXeS3R4OxnI78JuBEyOI6vwf4f2MJWBuwSnXTW96o9QehJ9sbHD6kV8t6ciEk+UmU2GTlc3u
	kSGElbVHmnsqzG8kZgxi8qaBDSgKRnnFSx726wrlscGPDUyv5uem5ITvT1MNqJygJ44jCpLa2t3
	mjZ3H7DJNJ8nocEulR0v8sFM3pBTMazQaj1QnxRaUnyMGFqTOeFqc1r1lrVda15HVVZOOqtt+q/
	1EpLfr28dgJDbNGnpo38wSTq+tSrk6LDclIN8
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr228817701cf.18.1774947329565;
        Tue, 31 Mar 2026 01:55:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr228817471cf.18.1774947329053;
        Tue, 31 Mar 2026 01:55:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a630922sm37511085e9.0.2026.03.31.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:55:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
Date: Tue, 31 Mar 2026 10:55:22 +0200
Message-ID: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VUFkyCsRpXcEf4IxHPGvbBOI/NeBAc7RjncVGxR4t8I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy4v5hxDYWXsSeN/r4xpfmHNyBA9Q0+4xtfiD/
 6aKBTEbwk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacuL+QAKCRDBN2bmhouD
 16HbD/9weaLMUdsIasvqFSAY/JQXP7HJ+FqpKZkOaKB/IeH96lnkY02JdZt8+23SFbQirjkz+fE
 dd4De8pFDaqm38Ie2NJEPaQa3YXKd7RjirVzMS1UAbARcoe28YCSBZexTxAuC4knYCHuZR60Z35
 K21DhHZMnSDZNkGqtCk1I3JaKAf6tqS12aRbrmWkgeBOv6zdNI1+2Copb7F5XyknnMHhaXe5O9G
 +BtqHhK7zPXbb4uFWAnSx0FquNhLl/4oP/vfADUUYW8Sk4XmD3MM6K1A6R1a5ULbuhzesFfAQQn
 S0OobIN9Juj4ln5dVyu1atIdRXC7IIhgWt0cEbx3CI9m7ejgCBeTohrK2d0Lk2ywtANy4Mu4rLw
 BB8aXoNcH5Ns3kLm9J6x8DeNFUApJ2oocODI/xdSJfB77aZ1wXymZMb46AmPsCt0yEtbkoCyr68
 yxMOYgfsca4VEnPeCWI5poW1CyOB7PUhkkpc4TF+fKwSPFqxtLQMAI6yrz3gJ2cGA6bvji5HIPq
 2c0tOQAPQq/oGUuKWy4toemauz5hCug4lNgHkg0wZ9LLcpU2Psgke/aaLAEdJuRzfIPMAIxGfKJ
 pUsv7N9So6feK5XJpGjuStR2LHd0abhYcPMg+O0cvK0/iUA3Hx2kwsQz7aUuGQpLdW7oyawSpmo FOjSRD5RK9kZJOw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NCBTYWx0ZWRfXzts5bR1gzmIU
 oZlz9sbEm3dBRCSQoRpYSCxIN3TWOA3Yzg+Vj/BrCKGu5S4GkFMzrDgEw4a/+7daWjR3zq7kXzF
 WR/q7hYqtuy/1elPDCCZu0c4AUYwsHGO9+hmnWijKdKwC9fUekAnYHuDZJqsK3jcOrpYCxZyk+e
 0qb8wm04cPl9zDDS4JZUHh632vwD6TPX7srxLSUj98mABMIVomdyZlUg7X3D15EWLu9U9OcWr7y
 ksGL8dQ4RX+KKhzda+dOpYfaLI/UXhG3At4ttCIrQMOVjscyJQ6wHG5mii1Yx42pzFsR+EyvDQQ
 vP3NoFEWOQ+F6Yuozt+esOhCMbzmIwtxb86KSfC/R+AiLUj2NU9K09fWgxcd/9xEVNH5xZlBk4g
 Z/dTnabLsnKm8xkc+vmvxXgziOSdSttQI3kjIw/DZ0t8058PAnsJFQHGOGOzheQH2ty6s/nj2CB
 kWkcxXahtwi1s69Pn/Q==
X-Proofpoint-GUID: j-ViajcNRR8PuXTctCPZzMJIkQt9LdEt
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb8c02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0UI9pEyUeAJalpk3AhwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: j-ViajcNRR8PuXTctCPZzMJIkQt9LdEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310084
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1BC236690F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Static 'struct qcom_cc_desc' is not modified by drivers and can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Drivers for SM8750 video cc had the same issue. It would be nice if new
code is being built on top of UPSTREAM code, not downstream.
---
 drivers/clk/qcom/videocc-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index bb3aae6b8396..ea20605dd1e5 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -495,7 +495,7 @@ static struct qcom_cc_driver_data video_cc_glymur_driver_data = {
 	.clk_regs_configure = clk_glymur_regs_configure,
 };
 
-static struct qcom_cc_desc video_cc_glymur_desc = {
+static const struct qcom_cc_desc video_cc_glymur_desc = {
 	.config = &video_cc_glymur_regmap_config,
 	.clks = video_cc_glymur_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_glymur_clocks),
-- 
2.51.0


