Return-Path: <linux-arm-msm+bounces-83364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D0C8806E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA0733520B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458AF311950;
	Wed, 26 Nov 2025 04:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hv57MkFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ps/PM4OV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDAC30EF69
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130582; cv=none; b=cC/MpxLdHIbUa96wt4mnFEu7WV4eNUoHui50ixJTP63qitHlm1BgbJhdY4kCEV5WvzTzohjOr12WdpqVoZryFTACcy3b5lFFyGr5GYJUr0YfqS+ZCDtiyfXkc91skBlntneoBeVWLpH7IxU4O6g1ThSZYtYMdJM5+9Ch2aRxnz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130582; c=relaxed/simple;
	bh=sty5Cjr+72qT2DpYOiHClH1omHS5/FS1L3dtiPoU+HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/xsm+acQnhFQ6VebiWyUBzFnEut+grWy4qX8aFcXIdXlKxdDXsV+4bbon16aLHfCxrpIWkWw+OlDjCAkE6XE9is7OeDwrdEdsoEN7ufR9MTpNe2c/xxQh7PDQYvTvqKTLUYTlj9NaQblrakLc81z91wh9+oIQofSxBr8iLa82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hv57MkFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ps/PM4OV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APKDJbv3255891
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnCR3E8MswDMSeqxehEkzyJMHwYw54XGcZD7XCwLeus=; b=Hv57MkFt1/W6ye4C
	HoaKMxOSUn1yDDv/xXEL6XeaFqR253VcFDA7AV8RsEzWPFGhiPVmVkvUWdvXg3w2
	ILRmOdiMTdTgX+qAMcvv6PAc+sLKAaCGs2YKVZyM+k/Pm8jb4on6r269e+ujTydk
	NPwE8uBvKfOlxVHZkRtyEJT24dpcxgFCG6/ODFm90vs1iAF1nZKtKKQ1n1g+CDlW
	cyZzPLBlmLgeMh5C/iog14aZ2iZzL3dhjssxottcDYHk3s/9jP6JOtGBxZO1Ywx0
	1iGdKuK7UBmsHmtVVtpnhaKXLKg2R02GCZN1Rxm8QFFc7+ZpLUaMeouvQ/bzTzHH
	19160Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c2gj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-299d221b749so140913545ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130578; x=1764735378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnCR3E8MswDMSeqxehEkzyJMHwYw54XGcZD7XCwLeus=;
        b=Ps/PM4OV8dgtA7pi0wKgYmq9pF/b9DntGfKCVHs1yjYAPJa8tkJpDYRYoOKGZwfmWj
         bZa9AaO8+ry5Q8kv2jS59K+asiMcobp6hsD841+l6zrMUEhY9zPgbDZKI4sToEdt1F6z
         h6Q8V9Nz+mzoGr/CE5JiOGQcdxMPf2rR/8iPwKZDYkz4iSFY5hWGh8Zyx/C8ptft0ZHO
         /AfHIOpEHz/1i90Dx2ze3bsAh4pwhinOOJP6rATfzsjQ2ZbNUWFF/4PsH2+Vr5q/5Sr2
         kr7XdFOD1taQI0U7GXiQ2kZbP8LoRJ4Ag2HmIwfcxEeYaGprTlZYD7nA5PuPGyNv5Tgr
         khgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130578; x=1764735378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnCR3E8MswDMSeqxehEkzyJMHwYw54XGcZD7XCwLeus=;
        b=s+PnH9wO2y7HPXv+ue7eo20sAFTQpI61COHSygnAFub8iaBYjYd5gLyWIYz9zBKSW8
         Jg5pSrjTz2EVLW58ILjjY72NM/sOUJgWrX6HEullyhBsZXi/9dqSMavdW95SVwoEUFmp
         mNEsNqXWJwIQQlSXw6ga6uMJ0/51rJQLFSPxSa4Eq6inlQ7tMRvr9YpBYEvrnoIT/IDv
         b9avv+Kx7VIj0lIjzlXh15asX7boyJEDK1dZKJGYzKuS2Qim9Ax+kC1QQqm/ViYriDyZ
         gJplcBcDIA66ZtMXzY02gobWIr5mCqVtJV7Wv/TFp1UxnN2wKJYsUoG81WWf8ltNaUBy
         0oiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJVfEdzj8BJfkAKP8YqsNRlfMboKAGXJ9Wjx0HM0iBiN2XQrPldQF+jOOjh8bM2gxwpXoBS2t1dPHLi6NS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4QiQqdr9KIOdTsIn7ekJEMN33Y/UfgTj2ZVccgq0NLT7Azy4c
	/ltDhNpdx0RJrt+nuKweEw2/dyu5Jl3OOivd5moSsh5G688tb5uZWUT8hJkAusldcrJeaY7e9yo
	DsI0QnIaj4Hgh0m/R1Xd7kaBYM+SOaQCG9sMsoYrD4oidJbfK+pILR1tSd5EW6k+/JXeS
X-Gm-Gg: ASbGncvw5VLuWsN65K8mqm6AR8WJqYuhi6Z/nr7jCKojeP+W/c1ZgyPZSdCbmbVTAL/
	ADpnaGO1i9ZBMZNXC4Igkeom74fK3zfjdMLDDdeON2n+drGiuutgoheOOICraxv/iWebD2trG/q
	hOZqMxkAxMAdWG9HlHCr0xNqy4zu2CN3H01VdJpjiyZpTSbQ0WJho1iAZG4XvxGW0hO8Kr25oy3
	mP+N5z9LI1Fqd5iWSXlJ3f33nqjfbvfw9UaGxiVjXNNIli9T8shU7PnwMIgSGXKTHY6jJZOuH3y
	CHtN1hP4LZ0BwVx6bYSdgT/5yBZ+6fxXFClX9+joP7S/l3YXGYWj9rbN5IPlxEHK/xR9dFDvDYe
	XUFlzZJUsi2kxsCFlH+1GyhmyOqNgZn5hbBALWzIu
X-Received: by 2002:a17:903:2b07:b0:295:fac:7b72 with SMTP id d9443c01a7336-29b6c6b6cc5mr198388165ad.52.1764130578518;
        Tue, 25 Nov 2025 20:16:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+g0gfNOwsgKq9WQ1PvGES8nv+WEow5ODmYhawaoaR9loiDan2SUxRkZcP7Iuv74k3QWdgIA==
X-Received: by 2002:a17:903:2b07:b0:295:fac:7b72 with SMTP id d9443c01a7336-29b6c6b6cc5mr198387855ad.52.1764130578025;
        Tue, 25 Nov 2025 20:16:18 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:17 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:52 +0530
Subject: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Yu99eEDEAVW2quJAYk5LcQ8CrN6vPU0g
X-Proofpoint-ORIG-GUID: Yu99eEDEAVW2quJAYk5LcQ8CrN6vPU0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX8FqsmNWdmccj
 ie6wWLRryDWfBsvtKL68aQYkU78OtONur3HcMFik494B5c6y4X8mAU+JJOxb3RVSJ+6Vbia4Blv
 A0ctzs4p0JnrM6YsOxXNjWmnxKswkBHjJrOR3F3SZTMSRLc7kk5iukqIiHQCZj/ap47IFLZWbTT
 jRv1WPCcUNJyt3+CfHkgCUGT6wrgH5hmtO+urkmDtWUkidJFx3PEzQ6srzKcn8jrnhXVLk5GzZ+
 KsWuWmE+UPp/mtin/RhaVwZwhiIXaUEJKmiJzTWqG0ZNU8HHqVMaNyofl1IFcjMH2gzO9NgNoZf
 3HT0EeTwGwG5stFKoQKg1EEEF1AXb38aeUismENlgNOOmfyY1OFIp0BLgOgvd21ACjXk51GpA74
 6Eu1ErM1sz9Yq5nfg6Xe8epDKTpTBA==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=69267f13 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tVXKSGAZSJt5irGpn-QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index e2d9e4691c5b719adfa86b904394ba85d086c12c..023d840e9f4ef0d6e9e7f16372cb9eb493f623d3 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -769,7 +769,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -791,7 +791,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.parent_data = gcc_parent_data_4,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -815,7 +815,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_6,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


