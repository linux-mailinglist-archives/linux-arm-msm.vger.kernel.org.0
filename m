Return-Path: <linux-arm-msm+bounces-88424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB234D10519
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E6DC30590F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 02:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B92F546D;
	Mon, 12 Jan 2026 02:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHHyb/yx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APcSl5JI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDCB2F5328
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768183954; cv=none; b=Y+Mc/HrYkb02hD57jIgbzsd42CRcfT7sIJ211jbPlCqbMkUA4UZBXxYZzlDYUnGwyjvbxbWgt7ZHR6un8VOniDHhvMyAhHaC4NXv3T66ltUdqKnNo1oL4ZFmmgJIMoGQzERAC37vlvHPQd17GswtXqJNKq/LkVS+JjfWAqrqm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768183954; c=relaxed/simple;
	bh=K9EVk/dglclB84LB/Ri3oyYg397R2R+9FGSTDzpWrNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5xTjVK5HYEqkXebjbFo0/55SSdAK7bvvPubyIeyRRFm8YShjJkRWyOyiWY8hu1oznotkKwQaJV5syFiEwhZzG7I6CAGe1qpIMWpagQGUoT0H0M3sM3u0ddQM1pJtoXfSqKCz2K1rxUX82r883TbM+Kt4S4pPDJ7ek72wpgO/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHHyb/yx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APcSl5JI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMpHYD3130016
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9axYhNECR3YTPlfhmCtLvB0y073X1A5mukznqdRWqw=; b=AHHyb/yxmpheB0XQ
	3TYQrEZUNzCG94cJ8GghlvkNdUWcukDTazPxGiaYAGKzIJzruKXFJQXoMI/X/K5E
	nAiXjaweV1LVaeEHo1mGbZIxdznx/lZ58N+r6HZciRQ02A/lqhG75w5VD3xzbhnT
	SYie6KISMb+Fgise9GcGdxak6WdxNuOX42AqAk/gf1eFgctdklrPdphy6VnQu8eU
	79RWy2nt/BGk2HELc1Y+R03BDA/nkRjYvU8F0JfV75pO/xL/x6GC0jb73jPmw49y
	rGOstOjoeNugunUarHiUwHgTy8tgd45XzxILLYgMXFefok8Z/cFQKacClSTYffpr
	9Eieww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57b5nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:12:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso77770056d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 18:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768183951; x=1768788751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9axYhNECR3YTPlfhmCtLvB0y073X1A5mukznqdRWqw=;
        b=APcSl5JIbHD+V3WmUbENKGJ3y0fzXI+OZi915JY64iJZBo0Qzw+1zYnBNWsp3508GJ
         2Z2kx+Wngwb/9IRjhP3Yzwj8tAIO3mDh3PPyp2Ypz2RAZDKSedB2RiYuwheVafFrKKRn
         iyQb3K3urotJMlDt5KQY9CMBqvYZmvATISQ6Ye42Tvk85OE29kZK73EqUVZmt9EJOa6U
         i1oAGW9AxOJfJv/o8BrAiGGcNL9a6Ds1j002QKN7laSy6L639MHWaa98Gz4gAmDDxVuc
         899NRlQ1+7H7BVdIMeuoiAyUB4xjNzw7BBWau7x9+u6FbQLfiw3d12CS97fmM+q0Hmti
         7+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768183951; x=1768788751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9axYhNECR3YTPlfhmCtLvB0y073X1A5mukznqdRWqw=;
        b=vJirh4BEkn1rgBIaDMPB3hUsGIv/LBRlc4SdYEdDzht4mtCu1gE3E62Wiohz0qw6Uc
         ke0ipqg7ACoYyVm/kGzr/qbMETWFZsLjAPvZkqRCsd7pmx8YhQHbRaXYaMnl39Q1Y080
         ycd0Vy8ImaQH2NWbp7eIquCl7DVqeMeCTJ+fC8Ozi7he/R+5z/4TmWfY1G/KSL6Gf9W2
         sNl4PBXvXqfsc8bj5YCVMuv4y+lIhp7pZMv8kKquQ0Yvqn09mcCB5dtLo84xvKNe3oCa
         W4dutUVS7e8yxlPBAvAgxEHYi1Tv2LfpijfV3+65CglLNCR2BS7nOqH8uCaEy62v2R3g
         UcBg==
X-Gm-Message-State: AOJu0YwvPGSPrVK6sI0VH1Q1/xLe028S2lbLIBjku605kkj+onYXzAMo
	wF+r/HeiGbnlJMmIY3vYblAisLsKjmzVmHuXJGMZTkYZSZWgfEP95WHPovfBnk1nXl/TdLMmSqW
	42ruix4CyhQSIsLUJp6VvThjl/jkbKwov4xuJPRcXpehMbXIYSJENltM1CSrayPvqBMCO
X-Gm-Gg: AY/fxX5m/Xns51DN0MxGR3Hq56iixVZiVLono2KUt9HDZd1SA9v+LoNGzKionVBXF9C
	u/4j7LGxmf6JVI7sMBQ6uA6Avzsy7IguhNe4uCEFUYxkSj3wnLtWDGoOumXZWVWVyJ3Ujz8Gvln
	DK0oCnwBHh6v608hXIkDUyISGYTswIdKlDMQCBcB2T5WxK0GYXQ1wB86H8Guq9A/JSJ4HDeUOKF
	pdoQQXmIsdLn0/gQLOcKtnlu+DaGuooftCp7VWT7fEqqMcj7m8KOPCxDFerWDd9uoGttmkRDHhG
	3x8Qdg6BUCpD5eqDRgnXGyJeABn14JzFcbT712RZ8rwNN43tl5V/GmS0Ansvm6YYKPjh8GZJz4l
	NOXSLIqtEHrM+4BByaa2/mIuG0VaoIeKfIJnVgpGa97vPig9LMPY092I+bHtc5om+dq16eCLnLt
	n84a5x3e/GlnwyjWvYldA4lNM=
X-Received: by 2002:a05:6214:4984:b0:890:e2d:a9d6 with SMTP id 6a1803df08f44-890842e637cmr259612526d6.68.1768183951244;
        Sun, 11 Jan 2026 18:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNPxj01vtzYt8GzUurkIzaq+6/AgX5W1Ba0N4t1Gn3E0KD6pmzy7OW/u1QfIKBsZgZomQx7g==
X-Received: by 2002:a05:6214:4984:b0:890:e2d:a9d6 with SMTP id 6a1803df08f44-890842e637cmr259612236d6.68.1768183950753;
        Sun, 11 Jan 2026 18:12:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d95dsm4499529e87.30.2026.01.11.18.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:12:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 04:12:22 +0200
Subject: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=K9EVk/dglclB84LB/Ri3oyYg397R2R+9FGSTDzpWrNE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZKREewG5edidHc+fEN3t8eHzf4ZH4xrzI+vvbr0c1JM
 5x5tsd1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiC5w4GNbODLkg/6rz1BbP
 ii8s7YJG73LqnnG/+37WJWDOjF+hrUf1uHl9XnJybHM8skLjBJeS59uDlm5n1AQjD7i/Man5lSs
 fnZQ927SVkTN808/ki98sjoS55E5+IfqpxZb1+5PeXHGJyun/WD/a+ZgdV+V4EOXifIk/rm/LT2
 YRu5OC+QoFujfjc7untJbm916afoHpQ2OHlJKN4wx5Hx6NabG3Z5fJms0ujBI/9LAsbOfCWNFnU
 Q2nXjFWL1C0sr21XnQ9v4DrqYATtzNDD0VnHXq34rKib9A3rgm9kfMuqm84eE6rttDK3rCu93R+
 Ql3EC7ZNLlMPS/NZuKaqL4x4waHvl/GCzXGq22J1LSYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964588f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7ahx9mval_N1o9DOsQwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAxNyBTYWx0ZWRfX+Rcco5+5J7br
 62r+5pDRhkMqbT84+gTJJvc5URwuq3ATGwFHtNy39mB8UtDMLw9THJKkRG+uRdRILuQrkfmpTSG
 J/V04x93nY9357W3Rk2Qsur3eVa2kVM74wkGxAEJgrEwr+E13pp0wdHUJ9y49yzyTf0ltVKg+4r
 HXND3K5QOhKJOkYbJSaJr4j6XzjWLCJsRUdcmJFYAKbM3pEFVDu+zoLI1ZzlaTU5jOUpqGz2lKv
 a3S/zi7rN5p1hAuj1t7FgHQGVpM1lHXaspDNXpQMSmeT5HVW2Xn4nLh6sFIGTze7x3lTDmG2y0P
 FKLi6hOGzety0gHgS6aexHs95tp+7Q2OTLWLwhhYVQKD6oVn9hkR2Wd1S9PgjBKFVDLHpzSk0LX
 xcGwKCAy7XraaHhQanxISpLx181J8hNw1X/Z8J0veQhI/MmjfgHPAokQ5PDBcfFEiRaeHc8xOuz
 7DTKFpIYBWTgVt2AJvg==
X-Proofpoint-GUID: UjMuEaV2tPxcs19chqazh6os3EP5gOr-
X-Proofpoint-ORIG-GUID: UjMuEaV2tPxcs19chqazh6os3EP5gOr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120017

The clk_dp_ops are supposed to be used for DP-related clocks with a
proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
as all other DPTX AUX clocks in this driver.

Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 5203fa6383f6..f352165bf56f 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -417,7 +417,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.47.3


