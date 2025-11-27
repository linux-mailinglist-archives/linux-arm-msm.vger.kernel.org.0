Return-Path: <linux-arm-msm+bounces-83647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DCC8FD37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C963A9DF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62212F6569;
	Thu, 27 Nov 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naFx7+0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB3YDr0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED32F7443
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266312; cv=none; b=NPxPjaJp7BHEnH4ZdctHR0k/iQX6he6MCCUtAj3yLVdXCb340Plon52qvwfIJyOCo8ie8frVQ2OFq7k7xHZP1Cf3bpV1Iri+FoQdBF9ITJUkG1igB0OEAH6iAw4KP4J6bel6NMK/9nTaK4SFvCRVb2qijKbR2/mp1rtiX491DC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266312; c=relaxed/simple;
	bh=DIQlJVRfd+e4TkkBmFURCn/JONTvSrQjOJANRArRm9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9IltM7I9YWRglufgajAxx2IOpyf+d+5dVRaBy3mpJ7EXmiJY92iHZKkHT7Cphj/iwZvPBfSBZftBUPryt+3jzW4LxxdulmQOxCRqqmw3pr+4Qc7ky33IBeAcC9tqSS5KeN2nioIpy1QqPjFPu4e8kv2kGN3327F6/Nl/FC9uWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naFx7+0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB3YDr0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AREV4fr2855021
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FP4Sh8FpMJPfOzijVebxREuKDEiZoq5SGq3qRVckZ0s=; b=naFx7+0e8fTw2XpR
	lToHHgupCPr/84N7HtpAEXg3cNDKDE8U3b9ay72L3ePFR+E8kLunW86I3Bnncarr
	UqXyIzJuDwrh4Y4+/1q94ZbvT8rQaa4n7U7N/33kCsXHg5bPQMMDesTzVdBT4s1z
	m08rhZ+YucT48RqdZYQG0WEOqn1vTH9R5pzzur0DdITQC0h2vcjxNlpqVjyleP0A
	ArHCOhJPh6cBrVGICFlTdudxA0SMdBWIGgbBPpRH90k5tkpWyq1SXe5x6y6jhXDm
	9C1Gfjzzl9MPMgkgKsoEqIKgWOwchjLV263JrCCuTab5ff3AhZOIslRi0v30s6Gh
	eYq5Ew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhbnfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299d221b749so18752845ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266308; x=1764871108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP4Sh8FpMJPfOzijVebxREuKDEiZoq5SGq3qRVckZ0s=;
        b=jB3YDr0D1hu9gjK91V1FUJ7KsgjTA8k/7oTHWfdEHfW3UB5e6P/qzXS/NUJEISvOot
         uAaSEXBLj7RFCd3LlsptLcOMTspNLU4S5HQBGULwxrnha9hk472V782x6cvCjPTy+LWq
         6lMj52rLHHFvfKRDHl7VstKNWwt1GyNnLtftjHw0zf9meSbt5IRNbFt3ORAU4zlY0Rvw
         ivgxwrdYh62sUx0dffKcqMvs6z5CYOBn+ayIw+RLpKFGh4U8t5tzLjm+6oWqpJaCSJz8
         EyBEkCUV+m7nWLe/4uQL6HDcOjBgoCnRObUB46FCmWAeIP1jvVHVFS8sUWeVHXYZjT/4
         4wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266308; x=1764871108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FP4Sh8FpMJPfOzijVebxREuKDEiZoq5SGq3qRVckZ0s=;
        b=OBriEv9m1Phsji6NCZmeyqEgefAJ8GPYlMTE6X2iKYp32WE/Dt3BXNCtsLZY6FtQAx
         V3KG7IFPX9NgkxSHbgZx69s3G2q1lEsK/Ne7GFCkck7vcUj5v3muccYuLqnvpkEfZ1Jb
         bQwEtSooGR+L7tlepSfCwuNd+cmz+oNnjqYermRVt9VRupHHGllLWSfOZ3oSYAdkM5mY
         pGZRmK5tCvOnAg/Pag/7kPIt5QhfmRqpJumNBWTXR1SIgRftQt9BNBkdSbojHMUjotsf
         hW+CfI2rI8NXWLnTlJiMOvrVcFgc5rn5lrC4Sx22L2hKGKsnGASolu7t0wIFRmFzSeBx
         7WmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeQaktFuOZMXGwOLmBverxW0XT+2bg1MTMIum9FxCI5pJCqA3c9C892PmzHME5yhyA9/BhAj1l0IiocDQn@vger.kernel.org
X-Gm-Message-State: AOJu0YyzR3Y0ex4oVYoXn5FAB164E7gkzJTn9RhY9nkKugiuyYyAw4Md
	ft2DvYhHqkqEU8BfpSvsUoObTFQQf7qZwUF0A3x2Iamxes2+3hIlUqwKwfIRAWFkyTfSejU7LQV
	nMQp/6MbjBnSYVPRgAWwzuPyQBXOhN1NJTnInaWGt7wkoSdPE85cMdWbD0qznk7NBR0fu
X-Gm-Gg: ASbGncsrxAA8q/5axFbfNEVjSqPgQBzFHEL2w/x7E8yhNRZ7gkXbqL+g0haDLkdzvgI
	FVjPilCp9Bog1mi/BG36z3wDNa8kkbJ3yW8xLLtK9d+bkWHas32oNmMq00wLEZWV6RjVd/BGdJT
	+nGsHdCcSlO+EsC6xiJXuJJ+J+g53Rwx3U1WEgm2e+a1o7InENDgetcclRqSGgmIz8+iDhRqtx4
	5CKSsK2mz77GzaOUz3e2baxZg+Vhp9xXvyQAAE6gt6K2NuNTeklKL+OT5qWbNCTVLj0grjSMPHK
	Z6daWaCZWIuNWWNk+ZrDgyOX6YsDj1XZed4o8a6FE1Ibw1HiJILHqp7o/+5FHi0mmUHlT/FdDzd
	i4gBQiR3Feo1ULn8K/WUpunji/vscHWEkM8BckwkS
X-Received: by 2002:a17:903:38cc:b0:27e:e55f:c6c3 with SMTP id d9443c01a7336-29b6c6b9708mr272822625ad.55.1764266307802;
        Thu, 27 Nov 2025 09:58:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi199t1imrhw+sjLQWTiJ4lZmLUuE0c5rkM571HneVQKg29OlsUD/LPeNdKmy33hQg1H5XUA==
X-Received: by 2002:a17:903:38cc:b0:27e:e55f:c6c3 with SMTP id d9443c01a7336-29b6c6b9708mr272822215ad.55.1764266307259;
        Thu, 27 Nov 2025 09:58:27 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:26 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:38 +0530
Subject: [PATCH v2 3/8] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-3-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX1zt42sUqfwe6
 HVb49VbqaV+z+TNJ616IztMlej/cxRazvUIxAqQVSt6q4uK2AGOax+Nt9+ce/xCtTogsqIH3fP+
 /Wt4gUMSKOr6L8x5CjE52HGOGH61OcZrITqE5jcGslt+HV1ccgTd10IS3PtlobieZFLDWSbn0/+
 9BFA13VLIl8jlomzF07uHJk5OyrhWWj12VPVpupb2AyIv8J/AjGFqAaybAhgwphQ4h24AadulMJ
 oxm7MHyLuXUl/Jkn6xCF8f/9qQBXq5zfUE/V1qtuDq50PJxMoc5NpEU/Cub5fTgGOAIiGo/t7w4
 euSPLSlw5pRflEadRGxOPStpT1QHFM3GZodInopgw9PxEHaiWfK3XNpVMPY21l25Gu6C3ZFcME0
 aH0K89LWQgFUPOy34qoyt4N2iUyYmQ==
X-Proofpoint-ORIG-GUID: m9lObBtwA-M-MJzKxAUUm4iCGGRluEP8
X-Proofpoint-GUID: m9lObBtwA-M-MJzKxAUUm4iCGGRluEP8
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69289144 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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


