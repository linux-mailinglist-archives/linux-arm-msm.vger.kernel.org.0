Return-Path: <linux-arm-msm+bounces-72172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB7B44C66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 05:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9781A1B231AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9076214801;
	Fri,  5 Sep 2025 03:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEbGDZtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DE17A2EB
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 03:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757043710; cv=none; b=G/k7cOZZmDuiP1RwnMPmwWT/AqGCE4TlYZt5pszknDbcCQ8O6Rz2JqlmNov6Tzo1J6grxSbAIwz8d41FHvWAYrdpA/0LqfEYH5bSUL6cz5Fi1JmKGAfVOCHPSGRcgDSIkrqkmi9RCL15vKeaor0Ha+VfIitx3mr48XAF/0xxLDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757043710; c=relaxed/simple;
	bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PeXk0tQkHOFQR55+sXkQZt16kQLmAnMXPxhkdg/veOrZL/pK/owg9oCapIZuDcG2H6+UbV9QIW9ddCly2X7EWFxEYRb55a5JFfPSu2si0fK/TAg+hfyXC5xLET3L02+QjAtzKVh/de2iA9gwfSz0ORVm/h2sTIkFOVWRt4qw9QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEbGDZtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584M0NPh012061
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 03:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=XEbGDZtImuOhkztn
	NA+oNtbKbJYIGX60BiWd5G0nAbAd8pp6+KS9FPAKQWB10IGsEIGWbbEB7LwfKpBQ
	0A5CiO8xVsUUvITNdWFfzji+1SjmCURXUIKeRRWdk3cxfpIv6kObJ/+4BRh6+WJY
	7hiottyza2XXW2mUBfAth518jRCEuBmo8RdBFhRLss+kgXmvQm7hLycAjaDQwFhe
	H3RBzqSP9d+iv60j7WrRN1LAwdr2PsCVADpV1Kcc8CLmOz5cUTLLxEVlwQJxGgYK
	JGsFQvf6HQAB8GuVaD2qv92ArfPdL2R/Ae/8a1EnWtKnSRvQC+C1ZfzrT8Y/Nod4
	6DU9CQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk99hs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:41:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-329cb4c3f78so1666272a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 20:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757043707; x=1757648507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
        b=weqaXYe4NbO+SJWQ1omkJXGHv+PHRP+0ic7CE9KmPYTBlUMO5bYfkum77DAi0hNFan
         3gTuoYePCmqSfbclKbZXyFZblSPLgDNozkwJN42YcrsdeoBUyD9h6N8nvLUDoYzS9uXM
         uTGyPPgIy5h2iwHIvkUvuoWA4kSnhX38OTU36OpaEbQDkMEbR3QlaPZ5nlv31g5ACKtM
         ZYnBh2Vv/hpes0Ws2SjWPbt7BEVNG12hGwQ66byrFOUoTiSd83sqTn2nl/fTR33xOm/w
         6Pdvs2MfHLUf5Iz2BNdPIjOMwbsKIyBHuXscnURZ/WViOLAxXanogPPeTbTEPM8nZwiH
         lUHg==
X-Gm-Message-State: AOJu0YwSEPbRh2y3jVeR1/DHa8FMZ8BVdIDKlITPsruGTlWsjS4hfmSd
	qeP+RyoZCSkSNxl3HUluJQkqEfFvajfp6TxLW7i7q/iMC+N8f6TJWkLLg0KZqxNABLW3b68PZFX
	cx5JrIhWDsNLaFS8rFbQGYx99u3twMChg0xyCaGUGIFOjD/a1yW0n6BP/4VddoF4cHDgq
X-Gm-Gg: ASbGncvQnxh9bR7PuHv8q2SdgzcM9HJoEzHag8nr9k89kdEQ2zrSWZOdXgalVeOyNrf
	aqBfHK4I5FBRvArC+yNixT1bL88JfUz9gSG/RLd0oZkmkKc4rWL6jFgNko7TypwKMe9th57/QBk
	8Cw9cPxoKE6trLjtgOedSeCoNT9VWEoFICuFSaxGl32V+FgUMcXFh5JWhaXcb2ycO4fUCKmqxiK
	sChsbUMV43eO2P7ai75GxPRNwRr9zwnr+kErmpyz4M6g5O6PTBZRVfqT43h5Y6aozoBW4/ObBOa
	gkkjS6oBaoazwvavFJ6GmDrQiwKyw0cb3VXlWQgKK2bC/gi5GVAJ0awSnkPYtpfnogg=
X-Received: by 2002:a17:90b:3a4d:b0:32b:d79e:58ac with SMTP id 98e67ed59e1d1-32bd79e5d33mr12787a91.31.1757043707423;
        Thu, 04 Sep 2025 20:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ9PvfDXRf85pIKpaZ0+e/fu4IJhXoTc6zGnbjcuhclxnsGhnVwS+OEgvprD3RTJKovkaIJA==
X-Received: by 2002:a17:90b:3a4d:b0:32b:d79e:58ac with SMTP id 98e67ed59e1d1-32bd79e5d33mr12743a91.31.1757043706922;
        Thu, 04 Sep 2025 20:41:46 -0700 (PDT)
Received: from cse-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772818bd5e1sm5922315b3a.86.2025.09.04.20.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 20:41:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v11 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Date: Fri,  5 Sep 2025 11:41:38 +0800
Message-Id: <20250904-qcs8300_mdss-v11-6-b6b6a67a1719@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904-qcs8300_mdss-v11-0-b6b6a67a1719@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-b6b6a67a1719@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756974526; l=1242; i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id; bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=; b=y2MHkOnGCX4UsKhNfZcloL+SNbTVPfVHc05X62CuJDECzxLMqihVz5DujWeU192GbDQtUNiCY iWrYKbzafawBZxMW0395JwCyixV/fY4bmbxq9iyL4VKvKizfzB4Xkwb
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 76fI8Pjn4wbNGIIKSZl_cn66qvUbiIBd
X-Proofpoint-ORIG-GUID: 76fI8Pjn4wbNGIIKSZl_cn66qvUbiIBd
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68ba5bfc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXyDSB/U5ZJs14
 BzpSJCKJIuErZL4bqnHZmvBsWoOhQRPy9/s+wNEcVcRfZu4G1O/hqeLpv2XXKes4JWdULZS5+6u
 xqFgDRxV0yqJvWQtRluwPqrJraX320sn8MeyBE6VaNgJDH1Rmhgzsq4jJcMHXvLwh6Q+w2jmzHd
 eNrPBeUpcLtL9c1bSqkm7WvGNn3gq7/KnRnJFYK23RlTFeOwFaSEhyiNyK3mFu18uMwX8JFhMTJ
 JbO8HVo+YqcaKE/1uQxp/kXgyCEsC1ugIUaBQKVHHc9U2k1hvFc3NPazzFh3VqE/xijetsQaVrK
 240U47iVS/JUFZdqZoh6BjZaxwBVUULPRvELHfEwKyrB96g1BOre4b+FsF08uciDibz2d3O9A8Y
 zuCb9oyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

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


