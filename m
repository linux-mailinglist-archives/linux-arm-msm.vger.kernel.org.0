Return-Path: <linux-arm-msm+bounces-70719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD88B343BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324245E4D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B03B2FE580;
	Mon, 25 Aug 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmyMyYsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E8308F2F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131593; cv=none; b=Uy0ddGdz4KByygqm7x94kofUYP2ufKmwtUXa3LU6cVxER5+HXDTywpuCrJGEkrF3iSRaAbvdN1aU66pKTqPXW0aTFbja8qooIoIKd82VORYP/V/T4pWLn9xtVzCUutN4MIiTcb33rqvFXEXsRsNzKapsaOCAqK4yVykGi35nen8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131593; c=relaxed/simple;
	bh=EPPzpsOe3GMV6W9LzMO4nrdD0eyL/NlLhoDKFXKKq2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPwRU6bI9kg3L9UcYBGLgLJIpv1tkITMaBIOVVh6G1ix6CSRFeCeGoWwYZebhO42ambuoMAm3AoPYEzgpd852XDea1/rs9jWkyWdaFmWzInlw2R7YLINw8sPoNr3x9Fpr/kRzjBBagV3m1oNxa8wVUoTx5OMipXOoS4LPexKRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmyMyYsx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8SijF019144
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ir1+DJRNcXJ/AcbzwsCokOtnTywkuEGXedxgqKP739U=; b=OmyMyYsxaNVhE307
	VKRUCTs+csDQ0SSOZ7TiMeH2g0q1DNmMWjWWeB3sflyPqHQMnkiWlCnryiouQAeZ
	HETpXNyIiIiHXCWumHNX3jPBZSfKk/9QNzz2xV9SloZBaZSXRtBsNZ/fl+rHtgJt
	UYe4Hx//SNXvC0T6ViYrLbsmlI2wwWzF01QeOSyWNBJ7+7glXjcyh6e9D+o0XjAE
	aG+956jmL1lBGp/XwH/O4VzSpNdJm0MiCBH+baLumtlKVO7KAQe9pLWX2MF6nrYO
	rSxPxxIIPQ+wnnTaR0AryxvUkLs8CQzBID06KSV30tbZ1cmHY/DBX9DugQ9re/iB
	E/f7tA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e7ef21d52so9024372b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131588; x=1756736388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir1+DJRNcXJ/AcbzwsCokOtnTywkuEGXedxgqKP739U=;
        b=gIlhTqB8EUiFk63z47cA18AUt6uTyvRVwXmF5LSE7RJkZitcoMTq9WQOTqS4C0r7jm
         g30crOjgFOIRs/msQ72I9ekKyz8PuaoPChyXJKSMUHppfOmwCkriqWUisEpkbxxgZzFX
         Su/hUNbK6xzQz17tGVcIckMGp9gflucaVZsE3ohZTkJIQVHZUBJbFJHRwBWFiMAc3vDT
         85wsvn3cZJR7W3MD3NN9VLq7GkIFhbLMkSQXlZrIbdcpyELtAUjlCv5LD6EaR1xDOv/f
         qBXacHmd0yEtR5PavmUyz4qfExU6lKnBRFVAhbCP3JsCxOuaPNwi5beBnsAtDIhfUEmA
         V05w==
X-Gm-Message-State: AOJu0YxV+f19XZePgf7IWN6bPCCidELI3+Mm8lt6TySB2wurUIYKJ2EZ
	0A1OjYMcFxePw9R7ANgweHgoh/58fzGFZ8yFZ/5IYDEr+qBMHUgNUvmMBofRwicChoUUCAg8vKq
	e7VvJublgwF82p0Axm6zXguFZu4W7jT9JBE8H6RQII4/USESBLeH40N2b5rmmEwRzr77i
X-Gm-Gg: ASbGncvGEodM05W6HeMUCh8cQJo5yATyUmfwxeM7VlB+pmxNNgZXkIc0quRXvS20hS8
	G1x8eEc7vJpOAOaRWaI0ld4y3QRzXhJ33SqpyAZ1NvJ6U2nV6lxWbWg+NjbgtQEgIqp+C4C1zf8
	Jty6QWGUP/VfF943HLlGCQ6klqhiLunaSDmi+W7y6OGLQi88OVK9tUXsGwwfMEBri5OdHGuAIog
	T0EOG02QA8FC4CQ2Fu6sgc3JcLyOeetHnRzsgOJquQmqXdqlxTA1kOO+FUitNf+rLjGjm2jiW7i
	lOCF8PvQH1O9DWfAsiwEXoThr8Wzf8ZSc+qrPaKtzCZnc2S485ne8d8CiDIcmNrFEi64W08=
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id d2e1a72fcca58-771e4c6143bmr4641821b3a.6.1756131587883;
        Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYxL9Zri7v/saIwgivMP5c3D/nLe00nBqbIJBm10dVOoGEqQhvu2/5xZ+AWaA4jkPkIzp30w==
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id d2e1a72fcca58-771e4c6143bmr4641792b3a.6.1756131587467;
        Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:24 +0800
Subject: [PATCH v3 38/38] drm/msm/dp: Add MST stream support for SA8775P DP
 controller 0 and 1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131425; l=1377;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=EPPzpsOe3GMV6W9LzMO4nrdD0eyL/NlLhoDKFXKKq2Y=;
 b=2glrjFiAbHnVAab9xXUirWQWDuGwWCuaCdROVriPR5omW4VgCxP0xsBuM18ARg6ihHRK37Aek
 lpHHx5bpe0MDUSf1vG4PwfFZhJlTArs1xWVTxpTCadMkOIgUKiwlJDv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: 9BR_8_B8Xe9W3prgzynDSjG7NSAP3wXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX25vOmyfmzn4K
 B07yTJSaHBGyUm5RmE5eySGTP/EBK8tXfJjL6UG4S6RQ6++pBxAl9ACSr2JfCb0azMOuUGa5TNo
 1WyFZwzCihhIxXAGaKXnn+IEbnkuRjCypEWAERnxGnlpHxkRkOdd9BLZOhhn97wz2bmh50+aJrh
 wsq3sjqW9sn8YSx15RHtOplCxI+ebeJR5/2LtP8+YsaCJtuV090OL/gnlEFC4AO5tkURLCOZdPw
 yJ3naHrbgzVreWWQk5JcHfJ8PpxCEZZnru9Pmz/QIcuAaP3nW+TFG23D8nI8N+p9yDKuo1JmYHn
 ZuDSgiPCO7oBgCvdkhIyG8wKcE7QiJ++RZIdJI7RnPjOQqOUErXVwjybP9IkpR/clLdG75vqgfI
 PzW0KnlC
X-Proofpoint-GUID: 9BR_8_B8Xe9W3prgzynDSjG7NSAP3wXe
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac7104 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cZ6T0uJ2ZX2uJOstinUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

This change enables SA8775P support for Multi-Stream Transport (MST),
allowing each controller to handle up to two or four DisplayPort streams.
As all necessary code for MST support was already implemented in the
previous series of patches.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 897ef653b3cea08904bb3595e8ac10fd7fcf811f..4a94f37513c21f9a273080b572a1e50a186a45ce 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,8 +108,10 @@ struct msm_dp_desc {
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 4},
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}

-- 
2.34.1


