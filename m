Return-Path: <linux-arm-msm+bounces-71390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6FB3DF4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F390189F5FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834E630F533;
	Mon,  1 Sep 2025 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQS/xVmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1820B30EF98
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720726; cv=none; b=Sc2AEO2pbo68ezaT1ESzjlQ28XcswQTkOvnFrhGA7b/oP/e49REjmeAQGTdK3CdZ9a/EcByikyh3qJ9JRlMFE303ikxYVAfLj6gq/jsp7iRDyVD6CZ4B896RuEZ7o8xKpXc3QfL45OkrWnJhmLLh8OrqcZ5Ue0ULBjiUX7+bBzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720726; c=relaxed/simple;
	bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aANpJvtRreAgHx+mJMcJqiaDTOQPyj5YkVSp3tM2+krcG3WFKtkoErfPXFmzTHcdrGTqWu3qzxCP2YsFo40uplG4WYgHdoV+LSnrgczOAI0TjMmfXISX5+a1zD9adB9HVJtyruzAQDOEizw/0Nr+zvEPNdthltkUvKFHNh6BAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQS/xVmv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819ePEF005043
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 09:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=lQS/xVmvG6A+GYPB
	iOPwO35lO+3st8M1q3ObbX8yFPXMvvWu6Y6KJChPWmEC/1ICyfJDxbhY2K3CibQE
	zng83HD8CZrgwQdt80DM3VHNjtR6m/rBjPJWgJsBujrmqn/Zj6kPbjIONIj1AuSQ
	5kM0tpCuaDyqqabWyBIhvoN69ca0yDwfN+/T9SWkjOMuKSYRXErMpuU4OsHgr4K3
	4PtCpBg2kadVsc5Sn0iyyb4lW/M/hwWMRw48cJIzvbO6jJZu1bdQF4t3aIRFjXzB
	Nu0eTON0Kyg2KkLQ5kHUmrAWI11a7Ut97G2S8/FizAe7l3Sepy3Ogr2WtZgmA3uw
	CP143w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ecg5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 09:58:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so3920387b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720724; x=1757325524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
        b=shdNUfBLbcvmsY6uedbXffloNqfwA1zDSjwEIwHvYSCzzXJ8NgPCqv+EdyPaLza7Y+
         VCpGzmXzKPB75FDVZ5ECjpZeNOZ5da6bJ1IoMlwy+9TgnUC0gVoB/7IabvYerAZZuyWN
         4BW6uBqejWNrOUB9PSsnNsfrtd3IShA8tg20u4lZJ9th/6of9SoKBN8hxNxZlJV7yNp5
         jKU45ckFPmS4rVheMik2jbOZNSE+lau2yy1xHy1G6Rgk01LUcPcEL5dRvG1qYwhcZZLV
         MK2cebgnAvJlggA78W4/ZAS+zn7kGSL+Pnb62CqwRSAjdsn5HVe9mKHhBr0oRZtl6XqC
         UkEw==
X-Gm-Message-State: AOJu0Yz+pAjZMRXqKi6PShP+ewZ7tV1y+tY6JZ8Kn2JIKJ8iiE9X8pxa
	3wTB8VLqqS96Y4zhK00V1lfYUG+7JdE3CdgmyJzg1Clw1/VRevu01tO8FKrwjLYZV/9q6cnQMgD
	wEykB4vTIY5m/ZB7wnIwRP2Of2NzmagPIVaOqi2oNOFFdK6IkAGKV8tTdtYkd4mrJS2YJ
X-Gm-Gg: ASbGncvb5Sn3ZQ6PBlXgN/99FY0NXUl6SgWbePjxK6AQWaogypDqd0HlRygIrY8ov+C
	rhEpqVc9IlLva1YOfWrUZQyht5tK/AMNeVsWEmqgjKjX5H+QtrDH9xHhz7urOMQj2NaBAghKTIX
	mbD0p20adKgac1Z7PxSlwjg/Bw1SekO/oC7G24Hk7UK02c/fRJQtzXTQ0VThoEZ7SSlHKZFjpnz
	S/YgEwL8IBSTrZ7esiYJMpEM2cG+WOrL6VQNwBWhjewCR0LekqxCVCF5ZPjxZwEE7rqp3QxSk/T
	+BSLor9qYoapm51bFbe4Mm6xsOne5PdfdUxRNjuF4XaIc3zvfrHS+PClqnP5NmoA/Hytd7w=
X-Received: by 2002:a05:6a20:72a8:b0:243:755:58b5 with SMTP id adf61e73a8af0-243d6f7e021mr10260542637.54.1756720723644;
        Mon, 01 Sep 2025 02:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcT6Sy3B9OTw9HVUyb8xsdhYrAB9UJyNu8eiRPjBXTTgcVrCt/D/vmbND6zyw2UIQqSmNAag==
X-Received: by 2002:a05:6a20:72a8:b0:243:755:58b5 with SMTP id adf61e73a8af0-243d6f7e021mr10260470637.54.1756720722682;
        Mon, 01 Sep 2025 02:58:42 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:58:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:34 +0800
Subject: [PATCH v10 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-6-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720668; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=f9d+cJvkz4X1o3ygAyE4yDQLdFavOoV2A1iTB2IP2/9bGSNAus9L+k4CJMzrFYJlYnWv5JD2C
 6XtJKflv/acCfCPt93e5e8IU+9EdYW6yJHxMMWdV5lAkSkxssNGg5TB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: hleF7LbNp_3nzsOrg6hyx4rNdGe_1LLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXywod81sI3kVf
 47sq5Bv6pdZqUp1ogy9FbxFMAtcxuG/JKKIDmqwxx4HP+7bwa/cK0HA3ocf5lzRPodorOg63fc1
 qGdrHGjIoZTGq2+CbdULCuScYyzOuFKxhx2N3x0wrsiu+XHC/kIws07dmN9g4qscCK8F6phcpoQ
 n1BMqKylt+cXm9KrphaeLImlUEkbD3X9j0AMIc8lWQ1xkknTZeDmkE6ctkjsipoqnIPluDX1kah
 7E04PcCM62dwyX7ZewYZfsfzs60dTOfFydaRZPInpnlNZW/MM+dkx1IeX8+oKTgdEpkWJPOX1pa
 GBkK2mLxdjlcimA1Qn3cyyzbtYJc8bEua28Pu9dZzdkuBbxtGqm1fxMMrbd52cky6C+CIo4eDpH
 A4JqmNRV
X-Proofpoint-ORIG-GUID: hleF7LbNp_3nzsOrg6hyx4rNdGe_1LLQ
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b56e54 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1


