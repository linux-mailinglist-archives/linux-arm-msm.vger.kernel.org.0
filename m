Return-Path: <linux-arm-msm+bounces-83365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D3C8807A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702433B17CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB4B311952;
	Wed, 26 Nov 2025 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ3noMAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtCi2j8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E67D3101B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764130586; cv=none; b=i59st/8C6N6P/ESdQZBRu9pqyVyPl/l7oPHwvB5wSStWZejq0aS5GRItYTAk7ReAw/rfM0etTx5YoYtc9D0/RJhaxu4EcgCNEi24SaWu9ozlvUseoHDLsY85f9LL8+YtfVMpvorP57b7NNSGYiRcw5jvpthxm83Dw/PGxpyLKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764130586; c=relaxed/simple;
	bh=+hHXW7ymiZ4AT4HeS4VHKLWhEvA9ViFbwRYCzN5hqzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2jihY6Xiej0GpAN9XWntjuinUcwmj0mXWd11DXIGSsawIzmjdcYKa8KU2BEPMFEWiqKXf7bwNoIqmjon8ZFZmXScvlEuHyLONiBRQGXnVlA6KiErup1TA8Qgvejgdd39Y3QHKvWu83z+B3hvYweC/+MlMblqNEhvGGQGc74GK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ3noMAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtCi2j8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHKovN2650414
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWElTngZ8FNieXm1Kmq1PQypc84JhZpmwE4lQK4CBKA=; b=jZ3noMAESdU/setf
	JKWNAJewRf76x1P0cdwJg7mc4bLBmWrxG3xyopzHFSPIrHqr7rgIISqVpNvPHbYa
	A/lKrykKuIIuUnR4HvtOFgJ3swaseAl5rglUblmTw5rWmKeKFR+j9iB1KEMlC7FD
	+egdyqgcSY1pwL3hkb05BBhmO1kXxLSdWo3pdO8SWdw3fzu/08xUXYdsFWYsg0Dm
	0g7XLPo4knYxnhlrDMLTXPjQuuBX4QxKe/DTXwyFiXgXaW3oVXL23KySdOaPPdze
	jtdBQmhKmqgu/kAaBMGZpueY5GqG5H1Gkqu/v51Avx7T3mLwlED/7mkvZ5Iv8q4h
	DJIYcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabtr5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 04:16:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso214252545ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 20:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764130584; x=1764735384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWElTngZ8FNieXm1Kmq1PQypc84JhZpmwE4lQK4CBKA=;
        b=XtCi2j8mvXxbaNScMR98d/BLA4E09qzFZqfyVf19BgMQf+igCw8EXIQU9vDyNRQC9i
         wmpgwJyfqlsPzlonyy93dURX38pQ0Y4g0/aP+x8ubn5GpYqNvz+BwAgC1XLDIY/Zrpod
         ZwYlV5N+9kZZ5Fs+g7+/2PeG37c8yakHeo2XtUTd+4PZXK9Huk9RfWIEMy5dJ2X++Alk
         AsJATTfRej3Md0SDaL+p6Gw3D9XtejQ1rB9cipD2o5qfA4f7G8okffx93ycTZgz3jk12
         1zHcvpo1unb3W644Wy9p0QX92PfoKZzG7+sVJRAppZ/U88NRBGnI/UGyD0PO+P11hzmC
         tzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764130584; x=1764735384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWElTngZ8FNieXm1Kmq1PQypc84JhZpmwE4lQK4CBKA=;
        b=Uo+3fuWTQ/BQoxMYvsAh5U6C0H4WWa/d+yHytBiYBu6COvv/7qdQbG7Yp/uLexNi6b
         Oz9zzXRkNmVTOy6BwxSZq0jKCYBwIAxeTWZL2hlNiARi20McF7Xe2NjUnKpjp9/ZROd4
         nIVQ32aFOQ2WekPs+uviAlf3U21/P2pA66XzIa4Qii9ITGRWQowBia0cb8keMlLgxjxN
         WlOsC74IpWFlTqhWMwfEvTqFOKOSQn6crsR9INK+YOydBw95Yq3BZAmch5mqvFXUSboI
         2ShwUTOyFOi786LPV2hB5R5egNjEM8fp1BqC4SNPOQMTNE96Ck79dfeP/t3dZlzPvAhn
         Kb+A==
X-Forwarded-Encrypted: i=1; AJvYcCU9hg/mZDV/1MaoPD/m0bTC7qEj3fFdF/WvPmlD+h4SIMYj/S3gcHkw7Yb2zkEHzXXRvdY0tLRl64lsP3sY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XxRYERUY4HB9Z6siEMGrD7mpFRr0uAUCvUyvrU0a5N1iUAyF
	8O44cV2B+w8/biGROR4GMztQtMrfGIKl8jqp2AUc4lsGwrLSl9q6Hb4lZvCWeJKLqkyUrQRxDKL
	Zp/zI9aP0i80oYBbK8q48cwV+VSvJWXobGcEC3qrIrV09CgDCWKpuI07fTnX+qSZbJ5mM
X-Gm-Gg: ASbGncuIJPInzXxKg9gI8pR412K+2Cz/op8ZXxQTJHrMkHvJYNczZmxtVuHEXCeZqu9
	iaTv0rosUs2NVQ0R4hMknUmyBgegET57G+MHsXF1CrN97s+zFi0q23kpy4DkkgFlglK47tAF6K3
	laKvfGxUUGryGJkBQdrnEsB6isPIyQY7W0+Qupt3rPzTeeI0QrjHoDw0cllUO6SIMYQo409+PSd
	hRygT7OvMEOdsu2VbuJc4IEnaBFssPzGW1zzVrx8lJROfgMsBAUClu4hizB6ERJB13EGKiB8tvU
	TyHGE0k0AvLdogZ9T0147WTHxxMqVzzN9gDhUizyVNmxyZeQjZnoTsBSWG8CXK3hn/Sju26CtWw
	BwNpVA9AhE2QpCZGYDWGBwJNsf4h/mBiwYdY3FNr/
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr58623245ad.20.1764130583798;
        Tue, 25 Nov 2025 20:16:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvjVOQsrwagFNc1RaHhK52IuFu/vUs8Xn2z7R8kSLbAhGDNYJCWXoS0Hr4ISnA/ZNs+p7gWA==
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr58622905ad.20.1764130583326;
        Tue, 25 Nov 2025 20:16:23 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075basm179300125ad.21.2025.11.25.20.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 20:16:22 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 09:45:53 +0530
Subject: [PATCH 4/5] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=69267f18 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kvM8kYmktHDfMbmwzrwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: vqnrMQDvtEwQW2l9CqzNR3PPCudL5Ktp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzMiBTYWx0ZWRfX1bVVgLeI9cFl
 JmuVjKWJW/5WxQ/b/OmJUHoB3eBIDZbLXvfM4eamk0T1ZycpNxizEa3epqKAndXVBULY38DpvWy
 HS5PEwoQ/1lUPrBoinrKBWw/ZoDQhsYGXLR2JxXCenqk3DmSdu9ac3iOJ40hRp2OUEBZr4ansIc
 I5+BgpKOEUyk3CnMMSzknaiGZuH8VtNBZWAKlun4kq5MdoqhNLfFS+bDZHHv2D5zaOUbB2Gujmp
 NhHTkOIb/qZR1Xeox948mEOQ0yAiph0rnMlsmnzDDeRWXFgno9DxGVHyfFYIaJOyY8x9UKQRvFb
 7IxLiWQyWVS3Ew+c3g8Df8sWoOjbZKkFN/A+/XTIp2xuNEICvhG8QI6igv0qyUUNWlPw53hq5ih
 nbE5RyzMO9LW+vlUZsC8TVPKnZgz3g==
X-Proofpoint-GUID: vqnrMQDvtEwQW2l9CqzNR3PPCudL5Ktp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260032

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
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


