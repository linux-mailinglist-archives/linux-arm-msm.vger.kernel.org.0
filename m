Return-Path: <linux-arm-msm+bounces-70542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C4B334BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DDC1B24AF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E03527CB0A;
	Mon, 25 Aug 2025 03:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJXT9R5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4827B51C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092966; cv=none; b=npAxA210+b3YXSYrSNZMRc8/u5UfTq2/qM+XNbRw2OgdGqiFINwsAHXXvHnWH+4N6E3QfFo4zwGSXkSZ3HDdCDsNQkIjcSpJtPbYkpTK1+AgK6O6jQcQu5wrGBeP36Kx2KoQDLlwKSSVnMIHZcFJyEz4JEpK39PFBwG648pKW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092966; c=relaxed/simple;
	bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8jiz/kYDUb8rfndMcICS2c1kn7m6Jn1YNCDztoZuGeZMKDdhIgyqTiYl+8XjRpw1d+VL6QgA+lQv6lNWv5cAgW4DuOjFzLU/ozGr74iT3lEzJLQDbLUwnvyUooO7igaGuCFHPHNSpbFL8nrGgQ17yGhxH0qyUDyh1f6vkEuitk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJXT9R5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONoKaR023627
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=DJXT9R5KHnbXlOR9
	HvLpkfiLTlqx8SyiCyhbicplyJ8lpIudXTWHaJBZ9uW4SV9xTIuhi4h6Oo4HfjBl
	7Qmxxp7v4GyUHylQb4KgJQk+pt72Z15Hjx2KhzDXyFdH+MNus1hPdPyurrNoGHTj
	u5+cxAb+qIorSGCG8rJwg+ctPjbsXtqGnDPT2QPT2ZOy4S7FR8MZiCIaxNeIFqm2
	fC1D9TuhP9jg4ERqYxiptJ2KxRKCIyR52Zw7/xkniz2rLDyOKaUhTcTxdRGc6pKj
	XlDIdKf89MZ9UpXPGtRX21HqL7VblckPtDLNRh/Davv7BsSTA1vn2tQxxpLYHu7+
	QcEmRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um3kf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246a8d8a091so23357815ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 20:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092963; x=1756697763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
        b=SqA5DP08jptzzYf+KmXdqwI7pgsN8HMAVtDdP0EcgO0UvB5g07noV3RXU5GEgsrGaK
         nZ123hoHVI5so3jWAGNdRx5YZr7T44SSRIqz/obleAgNFdJEylpEWu43nwMC/feN8/cn
         XkEBCWEMmm0NkkLbtvqr61UfabGZIPEee2mGuHRjEGT4WBfOgVXf7zwYxakS36UOdpj4
         vvafTkcrHcL3zP6jIEy/O+GmmkdgzjJfTAIzKSTp6Uk7366wqg5+XKYGIUJLsi+iwzqb
         TtjPqqzvF5fRuPYpB3f2Lpg4RGzM3f6U4bEg9Ti/BXBm4yFgaobBxlhFw1hRjlkQYY8Y
         O3eQ==
X-Gm-Message-State: AOJu0YzS9O7uI/tJ3kvz13+0QEJflV9IZbZsCOBBmt5zrShOarf8vc+h
	EUE9HRjLXCGp3Yw5D4JXC4XqI7wecgkNRpZXpZIkP1tszY3TaYJdVWQAmGU+qHYPnuYxf3uCIG3
	fkqZJ8n+3syKiLmv7cRoa44zpIG6+uyMQKHEKgmieVhy2jP8ZP2ntbtou0khELtMKbwFf
X-Gm-Gg: ASbGncsq2tthEPg6UP/n4+qVWswkhSewQfeKH1PYShTgaNtltwGGQjiLE7fFfD+koc+
	Ce4MjR5zUC5SxoDm05L+ucxCHyMKrz9hik1tD8Sf8d+wV6Zq4OpHg4QX8fOuMwL/Ri2FxebzTtd
	Oky12olnJgTWV02G9sZ/mb0gNhLYc44FOQ3Z29ixu8kt+dkybo977wuvE6fwshkrdtNue2hYaxu
	u6nt/RMgAJ0LyODZzHvxX8Cz4YMg6maVb8/rgmWTQ45rK1EQLycnxjsmvtBBzgt5T9nZuVR8pLL
	boJYY+i7L1nxvdpUFmSZwrCoiFlnCf6orNB0NTuPCX60RtgSkInlu7oyBREYubevAa9X45I=
X-Received: by 2002:a17:903:3c4e:b0:246:24d:2394 with SMTP id d9443c01a7336-2462edee975mr127358455ad.8.1756092963177;
        Sun, 24 Aug 2025 20:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMK+ADbj8IibkXMvQhzNxRNUL8Vw+7sUqexRIIq/HnlxR/jdalo1CFv7QorQ1UzxMgNEWZDA==
X-Received: by 2002:a17:903:3c4e:b0:246:24d:2394 with SMTP id d9443c01a7336-2462edee975mr127358095ad.8.1756092962709;
        Sun, 24 Aug 2025 20:36:02 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:36:02 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:23 +0800
Subject: [PATCH v9 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-4-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=RZoweSQA8ut2a4sjQc8joqF1yqfWGozxepRs7xCi8mrDj9AMGr2R2uBJ5UsTZWqRa+fFcOCcT
 Lq3oefRbg3FCtvWOFYMAZT5M5XY5q/qLGJepIPBPhY7rdaiGdTA418a
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68abda24 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX8p33QFxBVJaV
 NoPjleM+ePn3QhZLTVV9eKH/aEHiI0Fbuimy4eZhN5c/vZQqP24+GkgfYt1mwjLZInpXH3JYUoX
 us4kedjEcxpopdpRL6AjTOFwKqXJtGBCJR7ALSJR0B74WaOEOMtGnLBaCXIwlCIgfhZIQsjI328
 bduFdZnJI2DQoFfG018pWKQ1HnqrAJDcED6NVCxP48Ei6EMJ59KTxw3rjycZjkodi/OC5NtJJKm
 Q9+gCY2k2Umkn492mT9qjFNwAQunyJ6T2iHvqlF4Gdf92UPqpjoVycKsJ+JcBPg0fwTxbEKu6u+
 gGLCulsZcskkGtKcWUVcL9EXDJt09l8PqmCFVuSm+HqKPTVsANA0vwt0aqEMJC0dkbwYxyBT33p
 u/NJffao
X-Proofpoint-GUID: gXWD8FzcwtmxfPc0pO0bWtVqhcboELTD
X-Proofpoint-ORIG-GUID: gXWD8FzcwtmxfPc0pO0bWtVqhcboELTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.34.1


