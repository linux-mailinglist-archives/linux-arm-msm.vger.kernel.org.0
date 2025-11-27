Return-Path: <linux-arm-msm+bounces-83648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5FC8FD44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED953ADA8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF702F6187;
	Thu, 27 Nov 2025 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sj3RDTTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LL5+OK3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306E2F5A29
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266318; cv=none; b=dXeLsgq5Kw2mgQF/o7z1iE1n9LtffHOpLH21OovI2QzNOOm3/KcnE5ecpCR0QbeufdJqgWfm2PETRexqKHfPwwle8Me7Tym0OmH6W0DrBK1esGxsKFsNMOZJwQpuVL/Ljtu6+micRZ4NrC0WNGCC8z7CyGw0aEItog5cPGLc4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266318; c=relaxed/simple;
	bh=BN8/AvQhJwGgdXul8ZSOIBroeozorlxiOxwARwgN1sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipiLClJoILqn+zpUZCiukyHIbQ/1tyyDAfIhZAJGoHQX2mOU9ka5uY3yKvXXkybBlpbusfedDWTodYZXQCwmlO9n7f2bVUN1Ysujxsq4TW6l3wEv8TBB+OfqHyDAkLJX14CWz1G8ipXb05V93d+qN4e+OgsmRJuYn9MbcyaQ5L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sj3RDTTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LL5+OK3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9dtbP3769669
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqgGoUXIrgOftwZtLFLIGyQe1n58mtSeR9+1yVxuBHY=; b=Sj3RDTTux4DAyfPN
	QcNp3LV66DgnCvv5sz3msRRasjbIJnCG1uyTjYx0lo5m8AcbmIRyH+uTnynRV0g/
	1l4Ru+tmirx7wmm9xFFyITyEFOC8mjM2KySWIDLbjAROgRi2CaTm/SMbRuD+WWuW
	fZB7CNpKBMc0OZMm8jkgC8rkmLMqPwoLBaLLQg0YOcMe/sdAsyR5l6QbJSEQszF4
	H59EVUJz7Am7S1AJGpJDD0CIo8f1cecxUX0tmZNGix0B2038tQwtOBGNT0kqiPOb
	4qHqBfDGkJDvMwHK3lTdcllZflZYGe2MedWVQX/r5OxLHpNzWrJy86tfHBYrKuqY
	bKHwKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhbnfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so14306185ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266314; x=1764871114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqgGoUXIrgOftwZtLFLIGyQe1n58mtSeR9+1yVxuBHY=;
        b=LL5+OK3jcwUWG4kNI7gnm59bhHJvuB92UpiN1rXkU4MsKDVXI6408O81q2YoZIML31
         9Ct9K/GXLVg3IMWG+IcZdqkA+YLI+dBEOVNKsqU0l69QVB+9pEzs/5kmCQUO8eMgaehw
         A4wC79nbTRRLGV4irOUraUSJKr8fm4B07Io6NMGD3d7aPwlmTaAeD1e4nj0EHvLVMITd
         2y/qVHHL1sSG9BzfrDHanKl6y4l3cHVvMIdguNr0ZWxC9en+ivjiPgNW/0zsj/m0WPwl
         Vdcc2b1Ge3NeSOYPPPTaPGqRHhpdXbHmLpw8FZ6kCmpdw+QKfMQDVuszAP8iKh+xyAQv
         a96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266314; x=1764871114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqgGoUXIrgOftwZtLFLIGyQe1n58mtSeR9+1yVxuBHY=;
        b=dndED7wQSrVd+p1lU3HOlLccvn7uzVj6laz0PA3ivp+UmKKu+JqSeLEBlaeO0Jm7GO
         /RCQfeeYN4S2MsHU0jNjDRG8ikMXZPhdIG39XCZRLPpLhJb9Vu19MwBGz7EQTQ8KyD5T
         BGGdEAJRyf0ARLRHFYhGTaZY+HQWrRcFgfxd84TXns5NaxpmoDvyCm4cpeLGlAqjWLZo
         Y5NmDcSquLPBrHUM/iZt/fN0hrAfmHyPKNXqsveffrF8e+yD9Df2fDkIkJ+yXXb1H2Ci
         VKM0QWOJXHaBchMVLJz+P8iz+sHjpvJ6rGpKwDHWDutEMeda6PNUIEf9iVn4jzZv4iMo
         fVIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuoWkN9UoyQgao5o50SAkTb0utEr3jYpYpdBSK5kfi1iWakzVbZGqWtoAz7R+Zv5j5GtEm1F6fobHbF8Bx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LVpCLyVfOuImvFvjd8R4Of/+gw2cwDh2olNVjnpe9w6KoyAh
	iKb0AcXBKw80L5D+OdMCiklsc/1lxZymN4FUREfbQxo1xCJ0K27roYFUTCYJ57ZRhs6xBeznWja
	LGmoLAC5DkiA/g1l9CH6whrSlLCPDX7OlBwLJreiy++t+MYyPvgoL7wpZ0vdvXr2n8o4t
X-Gm-Gg: ASbGncvb4oTAfIZze2+YZRhl1e3d7U+zWTFLErTh5Ung8kySSlQkhL/RX4L4bOD3ULz
	ZG6zYogPXrlliID51/9ob8/KYJ5t8E7JPwKfCZ9lLy4GRTsIk8spbuOrakaXwCl8Dh+774rjdD4
	PNkcGWkxTl2Xrh5lSVYbnYhF2WqeWjzWl15mm+LFVpjfACLoQDBHJzuEhZ0WLmMhRMlCtNvj8PA
	oQbraFlcXs2gi7+I/IhIyxTYP4nweOjVHbpsHy3K7sQPh1k7lEgCD4En6MTNPkOjAoaoj/Wc6CO
	8pmUISrUOW9arDxsGQ5zudWysNwDO4ZNUb/NbR/QVQRgnX+1Q2JaFw5YQQdC/t/jh2Vfxmk4plD
	RMYUah40NKxGb7Vj1n9jgsmIvlejWZiDXqHZqIszT
X-Received: by 2002:a17:902:cf4b:b0:298:3a2f:2333 with SMTP id d9443c01a7336-29bab160a66mr123400875ad.31.1764266314408;
        Thu, 27 Nov 2025 09:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcSrG07gzVMbM3LWgrJC29YGiUdxOZYQ2nHzMa6NXcRIgSVlA3tcoDaN3zMBs/NMsLU7fYUQ==
X-Received: by 2002:a17:902:cf4b:b0:298:3a2f:2333 with SMTP id d9443c01a7336-29bab160a66mr123400665ad.31.1764266313904;
        Thu, 27 Nov 2025 09:58:33 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:33 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:39 +0530
Subject: [PATCH v2 4/8] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-4-473afc86589c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX3EDzE6uXqpBl
 d+Avm2JPLODvVUhkYEUpDos8Tj5sV8LnWpZ5fts/u3HOG9C2sVo1Ay6oinFEfBSdktj/kcQYGZN
 4r8YNyaL4mGnucnpC0N56mjT7XE1rWtq1fvqEFgaH5f/ulEJi2osSE0hrKzyYkNHzwNr5buvwHr
 XYD5tP6+anP90YwK94/Zkg4IjNjOPwulb0ntZHl20fz4eVAxOJ6geDPe6mxUanyo1JaECIbBAR3
 PjJh5AJIn5grtcSyjuR04Xn12HGouXLtNIDL+c7XomvgVru0R7QirAhnwlMlHLOhDiMjD2DFvH6
 YDOEdNgU85KqDQRyti/krlVU8VbydcGC8Z+k+0MdZyfaOpXAnZA+TvXqlaOEKL6fnXWUyDuCz1l
 YwvKwgg+gSwcddRmd+BNvF79t6mZ1g==
X-Proofpoint-ORIG-GUID: Y5kd0c-eoGLEKgkvWjk7V9KCu85hRjSf
X-Proofpoint-GUID: Y5kd0c-eoGLEKgkvWjk7V9KCu85hRjSf
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=6928914b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
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

Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 453a6bf8e8786308ef785799f71b6cff8a5a9727..1f3cd58483a2d6ef18b43fc2c4ea38a6f8750c5b 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -1033,7 +1033,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_17,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_17),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_18,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_18),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


