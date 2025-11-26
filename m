Return-Path: <linux-arm-msm+bounces-83362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8AC88062
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF9B734BDA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF88D30E0D6;
	Wed, 26 Nov 2025 04:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6Go5PJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoEtQRcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA08C1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130572; cv=none; b=IQcCreoCe5tGupTZqjaqdBcPZd7iDIr6doWZJOAVGAXq/V7XRTAeqVLKJzZQU8RuHUTfuuONKf6JqnGfphD4oYti4OagIKA48ULWcMB1GTB6sFsoFwBN07wV0/PsxFQm0/9qVWt9zxEmMKs0ayy0KvRQkzPvYMaw9jIrbfuQtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130572; c=relaxed/simple;
	bh=PSeSY7/jsiZchmSk5Huu4DJFasQrVPpsmR3MeyXINoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGUxiwTMpMZVu4xedMEBwywu8gLmowgMLBHKbpUR1W0apKn6jW6S9SSb0p0a4ODGQ9PCM8e5qn7wOztJf1bTi6W7KVVRh2VgcAwMGtWFuAlQ5kh3MMIBeCxihakd5A7JCfCPxdpxR5qpIj9TDvcxvYBIkGMhoKvxCtj+nT1/Pqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6Go5PJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoEtQRcT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ3Agd13707407
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Oznjn/lJICc44Km35+Ewed+SjhiqmOteL6HGdmMJQ8=; b=E6Go5PJQWXGNKQGf
	vb4MYOcCwphV37GRAhs3tEDI4ztxmlYOEmySNZkWQtDVfH4LmzxgB3LBNpLOXKLL
	yZqgepdebXiZLyTJ8BNXz2PA61nuc5iCU6dXVCmPQrIhy+L3JK4dnMzhNsEY95N8
	aedGHEsW1jlCJ+A2z28QT2xJcnwLWdptHU8/LDBN0+4OFzYcblmwcc56KC14VzDS
	OIUBmKN0sbtCV8NoemsLPX1tRCW4ZxSw0KPBrwHXSBGFFT9tqRvusz3bW7XoV574
	klp1BA8TmKTjDsQGxwfg3KKM/AIS/QCGbZuogGqkaERNhVI1rb1vO9XxY7c7Qo0Q
	P7lEWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduft2y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2980ef53fc5so177735245ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130568; x=1764735368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Oznjn/lJICc44Km35+Ewed+SjhiqmOteL6HGdmMJQ8=;
        b=aoEtQRcTmwHnHfyJ9WIA2+wlxTCKCjzoIR914VenyCIK4IT84Gd6uUqcMppQ3vTZuZ
         u037ZAr1gwZqA2fYDdBSaPeureJU0mToR+7Vyn4B3bqB1a4RVL1pS2+3d5iLK0i4ldfq
         juCx010udtid3WWdZSMRqoAWer2g7ZAR6KwAfq4h5WgIz8PL+ZAWVZVqHGspVPK2CQN1
         +c3u9acVobN+Ybby80KtMP7LYth/KBp0XeN1SqxioxnpWqqu+kKMX4PIyjn4w4SbL1gn
         CcxLne3/xcPpEdCJoSeTbrI9sNhvLzNrM028eCDksjZJfJNioT/ievpaIhKJPZCwCeuw
         uZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130568; x=1764735368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Oznjn/lJICc44Km35+Ewed+SjhiqmOteL6HGdmMJQ8=;
        b=uIp8oL2YqtCN4VjG/oYp2jFxrMoiDrM2lzpEPgnSyWzMDTiT2nVEIA/SO0mjKnAsjC
         ETzz4UKZt3IL1h8c9lju2EcG89HM+8mhGBgMW1bk6Nk6V1tq4wVMVP6L6JjLhhaXF+xc
         U6dWgXfrLU6T5sJ3SeTccHOHgRi8TLlH0d4+ZRWfEw+1CGXzawt7vSFl+Kcw/dUqGNxh
         xKJBpUt8grURzy3UbUv4XoEsn/5hRKx/SKJwpLvWYQuElPu4Tj1+I4e5r8EvAomgKvSG
         5+Gdog+ywcrni0GhOmbT94egtzPSVE0zL4C1KjcmM183CN/OrR6OnfzK3LchpZJTPhdr
         Bgtg==
X-Forwarded-Encrypted: i=1; AJvYcCX94fcFXLRs0Ff6eE5UQRkoVeHBBGYdJEwnZyh7kbxXNiS9RYHGWlb2+O/AWBKawXhOgEfk4EC5K5Y+YId/@vger.kernel.org
X-Gm-Message-State: AOJu0YyRltMTd3BgtLUCHlUUre2OmL+MGxK6zoqTGu6HWT6JYZE1tcSn
	SnccFwsppjVpVJS88sT3ISN8GMmQdLDzJtylx2Rza5DxwmPBbKuu1nLLe7qw54H8M/JVPd38uYz
	X93YbQs/l8aqp8b8yuyDCosoQ1GCxkcdvS35yBaJj8aVFh1ZS1LHfJ3Kz4mC2sfOiSS14
X-Gm-Gg: ASbGncsrjBrmCp/21AHnWrK9KgTcBp5TmBR6TqhLojwoqeZLj+DoUQr3038vZiumnKh
	udUtEeM37yda6Ri0m4D5oatRa9s6wQo7toM6BrhMUwhdvsXzM0+5nph/X49VJLMRg5COICv92PU
	7dnujN/8HcekDWP17GdG2XAeoaJiHe8SM7UQuaxE3uFSdygCR7scoyUFD8zGE3W6fS/wjfrFo0/
	Acz8D1VgfRFbCDtliNKNl+SU6E8FAkQbZaKwcMoh4wlV+ZvMtii5WHLJCcctAhfBB36B42ZLGsF
	FgcleUwpAtyBKvL6UJuBKsgmjai6VJWEYirPku89DcUQPband6Obj+mGlt7c9Axj//pdEbJd6cJ
	ccuxYhCv1EuxpxtfkssUNiYDNAR7qQ8AlrrMsSov4
X-Received: by 2002:a17:902:cf4a:b0:295:596f:850a with SMTP id d9443c01a7336-29b6c3da11fmr193804885ad.5.1764130567871;
        Tue, 25 Nov 2025 20:16:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExSHlPyLvZ5FuLuqVyizbUYG/FPtFeStCPdljHhYVdeav3ocZUeHBiReiqUE36C898Oezg7Q==
X-Received: by 2002:a17:902:cf4a:b0:295:596f:850a with SMTP id d9443c01a7336-29b6c3da11fmr193804495ad.5.1764130567389;
        Tue, 25 Nov 2025 20:16:07 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:06 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:50 +0530
Subject: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=69267f09 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FOTRiHr0QPuqn3MmG-gA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfXzLGiPW5yPKkK
 GQ0z2UunKoSPIRokwBjZHpN6VMhlVAmInlayBmaAcJ+IGZgl42aymnI9tLLvXu3tISBBL80Akuc
 7H2+lGvZQXzUbCWYEEB71Cj1PmmxWmlj5kvUyDu4xtK5KWUc1MS1wu+VUBCLQerWbmDNXF68NlJ
 t9AIrGDuWaNPn8zfGY1X7vn9RSADcxt9KapDS5ZwXZIkj7uVYHMvASpchOqHf81bGopzFa9o/0k
 LHsFdBmdoPZjHvoIXSqV1DGWq+8SFlfAknuMcCILPrn+kpgWjCbXNAik9YoDmI9BRSCA27+e6uJ
 cCzW8KJDC4QQ4RQtnjjTjlac5d29lqlL0DI4Q9Axq+tKwAXzEzhDn0z2NK66baPhSXbTvJztkKe
 tDu5EZcp3jBVQRQ/VLKR0IXqwHkZvQ==
X-Proofpoint-ORIG-GUID: smFWT1Y-w6Ul52F9jNO-mN68Tk5eC-wK
X-Proofpoint-GUID: smFWT1Y-w6Ul52F9jNO-mN68Tk5eC-wK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 65d7d52bce034335707014797fe9002429212a14..b18bb34889ab28fba13cbf2ca8cf83101e4e0484 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1034,7 +1034,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_7,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


