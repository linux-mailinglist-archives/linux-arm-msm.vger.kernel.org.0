Return-Path: <linux-arm-msm+bounces-83366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C00C8808A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93D1E4E8746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA44B3112D5;
	Wed, 26 Nov 2025 04:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oan4DMnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PklKeOyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B475311C24
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130591; cv=none; b=JfKCx+PVtTBsdgX+i/hGDVoPFN9jCynM6KxGGQHa+00wWP7MyQr0soHjCrKfRe7DfcLYkxOe99Y4ClNSjGPDShOh3QHYR9cGU5cblfuH9YSdtO/EYc4WkniPqAoPMnV3O3N6/tjp+0CkyRDMMkCy0iGXgPZ4C7o6htPEon0bdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130591; c=relaxed/simple;
	bh=Gd9DDqbdG7bMeapNP9bObd2qmR8pCtMzEvur9SG1oTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wsj2cZ6P/PyyuR9d0RDEoO77dtcWSMsqHokea/59FoSSNR58m0v9rQS8JuiWd+ztXSEm8dLQvrVBHGan6PSAKe0UnY/NKuszk+pXb3aqk3H0Q2aR7Pfk2JDTMG8DPZOXSZj1F14fvO2d84vNCpwo0nJvkj1WffDggeckbI4FpK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oan4DMnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PklKeOyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGqT3f2655373
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbN15rVn0YZRfafDVCeWQy1tJToiZA5rt2KKTjl/QzI=; b=Oan4DMnGVF8jfSUG
	1YMUDnrTUtfDHr+oKvRWZZ5KV4jgSNOVDVxz1KtJcUoQftpoa6/QvW7cD3lxfies
	C537s6Va9zdRDS9ibDViyoZc252JalDgzOEKIHY1BoIrkCrzuG+U7HvOC3rVERXz
	GrJ/Cen2+LU5ArO0cdFm0PTx+eEe8smz2MHBFwXW92jyo5meXulkrsfM0e1y195O
	89p2S8t3CcWFzNcxH6ZyyKFldoMPmzwxIbWm35wbmXnz5+FJXLJ/Gz4Ov272b/sm
	ISk5l9x51FH63nKcnUq1vKP412NK/XmXZFmm30cPFA460auZizV69Co2H/sgA9F/
	lgzTHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxu074-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29848363458so137231395ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130589; x=1764735389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbN15rVn0YZRfafDVCeWQy1tJToiZA5rt2KKTjl/QzI=;
        b=PklKeOyMKUW07j/xRdnMkiQjxPC9B2PPiMhK6gh2J0qbEHt/Y60rMesDc9El+G74bE
         F/cLrjk0DfVuzPVZWKi6uoeDMuc0nYklY9pVS4C00FqH/DNTVtedlcJUouYPHrXm6j8H
         8uiN2UzVAVAkeAoMNLkTfmY86ypLwzQmDfy5W3kSIh7yHgxwn4f5spRWwR0oVEak2pZ8
         GqzNLd/LZwPJpvsvb0jXIkhIH4v605tzbuFKUZIkm2fYHviYW+dqmUtPok2xahpDdOCF
         RMu/zcisqYAakxZHjbS1W5NviOEiVRj/NKW+5pAJD9nPZxp5kAAm6bPmjSBojJ3NfIlb
         VdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130589; x=1764735389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hbN15rVn0YZRfafDVCeWQy1tJToiZA5rt2KKTjl/QzI=;
        b=tpxSNtRi8sgBYPSXoHJ37c1MoID6mc3vnqHltHsCK9LB9Bc/z/gjYiCjBHX0Ztguqk
         ZNGeVjliwAX7UD5r71/oxwj6BWF47gXjP92MCOnWDTAW4o+a1oV8DqMZRXk15eP/uhe4
         GQD/OqRbz1wE/FLIkiBrvLx16EehKZ7fyozSj3BhH851heC2KZ/yYuoUFOLxwznFbleQ
         Z0Tmzw+6ACbDQ6ngS725Wf6u7xKBHURDM4X9+Z6gwTHFjL0saOFE48If2+Bwar6v3BEy
         EDZnFzBlKD4CmVN7Dore0qSGLpOi6pYZSr3SXRw8WaEUJpek5xtEnv9JlNpcqeVFsiyn
         /lrg==
X-Forwarded-Encrypted: i=1; AJvYcCXccZUPKfnb14NrxoC42ynRu3O90yt7VK26gxeNsCuKbWLjOiPdbQrDz/rK192Zhfej6V3XfDvgLj1+kA0e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+2QZrbFm/vWtRMcLqjJJFEJ5xdxtEV7C3FJJm4jop4xYmSAjg
	Xgf0htsuGMXzHMU+e1QvVF0NPkj4vBFVZfdTRA26S3vVCZCLTgXsXadDmAFSiqS6aZph2WC1hLA
	4xLtqZQHUeC28udStgIwDmZ3i7NBASKmUdXxW9B1GswB0wy4zP6zXTUDPeboiCUYoHTNl
X-Gm-Gg: ASbGncstkmqi/Wm/isXnB9icLTqViwBCFFIxabxGUN4R/gbOVtKhFAtsCANSy0HclOB
	enlkgkmCmryg3ucgIBmSPXaIrC2bWZsQdkpmULftTgPE/GtemU7p6JOuSGIOBtXSevICkREs3la
	QZzu0EAaZxhoGj9/UXVMWC6IfMc3Ugp88w6CirVrjLruFH+5Fel1qO8ODdDUw8sM02GXjohBARp
	y9nPncAWdgdKOpA+h2LX89ABU9ARkpBDn6sjhuEbx56aGTn5VOIUJxFUdVAHTeMDZHOP74zKvOx
	frfbxgqJueFrPEbTg+FqmjyqKiPzv4Wn9GOcHzS8bBX6H5cCwfPDhlK6uFp2mSh+yGAKPVaxct2
	5svMur2XG4Cv17G3EnscNL7Hrw+/6ADbT8YbaPhr/
X-Received: by 2002:a17:902:d541:b0:295:20b8:e0ef with SMTP id d9443c01a7336-29b6bf8165amr195705225ad.57.1764130589069;
        Tue, 25 Nov 2025 20:16:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+8vioPCSNogy1e8vV38+UzH238JRex1pqVuDom8uvuU/axu7qUlLwbhLuahnkr3Wd15iQdQ==
X-Received: by 2002:a17:902:d541:b0:295:20b8:e0ef with SMTP id d9443c01a7336-29b6bf8165amr195704895ad.57.1764130588599;
        Tue, 25 Nov 2025 20:16:28 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:28 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:54 +0530
Subject: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=69267f1d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LYfvaOWUJrKu5F9ctIQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX8hA8rW/M/cmj
 QqQcplLeFk1hzLLIPSDHZwSKmCyc6/B0ZouNi8FZQIZ5l3vxqLnWmiDARdQ4Y2dmwkP8+5QJIck
 wVqhJpdwnG7gBicMZbMC5YX78MLRvaXQYrVStwedkyzEDHT9czuxFDfqCzGick5k3Fc6CNJag4P
 acmPgFJGGXVUPScDY3VOffmQiU6+f6ZYmQX0P/pnchGQN8HJig3szEEhMlkMImcXTeUqCZGXJkb
 VMvugM0LCowT4EZ9KFrd9STJzTCl5A48YDDTF4d8MqvL8lmxiEUvxnUMXAmPq6Df6T2eJBrRz+B
 vUZv+MXckMZL8KNYRVWIn0AtXW/RA/Dz5kI0EoZOw==
X-Proofpoint-ORIG-GUID: Qfp6z7GXtuWWCOQT_taJq1m06lKyyn0z
X-Proofpoint-GUID: Qfp6z7GXtuWWCOQT_taJq1m06lKyyn0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
issues in SDCC usecases.

Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-milos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index c9d61b05bafa1618274cd87c83df6fd14131efcf..81fa09ec55d7f6d6cb761affd3b93301a102f61f 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -917,7 +917,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_9,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -938,7 +938,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_10,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -962,7 +962,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_11,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


