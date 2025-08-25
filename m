Return-Path: <linux-arm-msm+bounces-70543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E031B334BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9711917DB52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623A627FB3E;
	Mon, 25 Aug 2025 03:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVJCpEGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019BE27E07A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092975; cv=none; b=PyPIjbflFPiM+8Ln3mwmX+RSiwuVTP9j7ff/x0TY0T0L81phcC9KRdDLw7xMxvCTg1XA5FSbCKiHM4bDdMRQqP/zXrGo/qAYxR3qiIIMpUigbG49nbkjD7R1XAUejWQdc5CGnYuMR/el+Z0X+LIDfD5+KeHX0A6qRHtyQtch8dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092975; c=relaxed/simple;
	bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RG7tdWTLWRxMg+aRfqnP79832ZDMSkTaCSZVOiojNjoF1lMd1sh8tcXvgbc09/v2OLxXtHrKLMPMcBLngOdhNkOu13HM7XY+tJG9eO7gsdOSkJ03jru9pM0gggVGbvmbUxcjKj+yImO3k7jvcw+VIcDUvZ0OCX7MD4nk7HJuuAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVJCpEGy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMNCIb030210
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=KVJCpEGymbGybPM9
	Rkz9IMMik636mbIVWADF4ygtfKUH6nNdiZa4JvUqfBDOVkx9uqExDoyHAxFCRsHG
	ENuOH+2FYorhI9svghNSW/aV1MgRyhCdfKzsE4tXdNv535s31/u7/PcNy9RiTGl0
	bRI15QM/JGXBLP5KGv9cZcSbv+/uOdsfYIB6irFqeHYxtvey6ja8KNVau2cXY5tT
	3RuOMATqXWOAaZazPCsu0U+FDtKS+odvd0SJCyLtMc/sllQARZS/1KSaZtCWhLUX
	fcZLRO8QY66cGG5YrrGJ/V3QKRwjoVNPL7BsHVMYx2nmvRHVIB61Gp3tLJoTZisL
	SX3X1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de3hwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:36:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806b18aso51649355ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 20:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092970; x=1756697770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
        b=LzdAb0oWkCYdXugBgGSBm95cm7WKPlPY15hLAo3FILZe7LrTnjl4152qU+BMyeGbFx
         +o7Hboga6K6wHkaylpA3PsXq7jZEBEDpM5UeGOCRpPVWBjQgnak+eH8fKw5y8OZ7y/R2
         t4FqnE7Qg6CwCbn6jSQ6K1pWj7FfSu9XXjTlgAkCHQvgMRGwarOVc6TVO+akaAkAAyZB
         s58CgnnJ6qXCcdLhELajzYnJudzpKOfHzZZuzsaeHbQefF0RtBHLmPXMU++mP4h8zpCg
         2WeXAInX6C+euJ4cC0TTLGTBsHk0BwArrnnXXlYjXlOQ4Kbm2Lfotri06ruBB9I96XH2
         /z8Q==
X-Gm-Message-State: AOJu0Yxl58mxWDm7WkSBK9gG6LrmAngYccveL7ypH5IeN4Ip6/TwbGdb
	OxeNTa6MQq+RpQyp0f1aNTkjAMXIBPjqucpn6oYGbWbDJB+JCubR6dSKlFmQ8XlHkN286UtpPWC
	olj/TJb+6YGs8xNm/iQ5tjghuKdcRAoD3lWKtS71WoDGHtWdi9aNqOXyHn9uot22g43MZ
X-Gm-Gg: ASbGncs97xvZAG+zvvxNtmNGQXXwjXsVCcqvEjY65AdGs02GTWS5k0fYsZ2wooKmQab
	+tTxZNSW+fboW6HbkidypF+rVtxhvhGM324cvyVYnOqbeIsAtpx9JMqj4hYUmx6xBoPpks/OJMB
	sutK2///XlNeC6I9UWkahKyz3T8WwZcVvJ9/OmoYNLiLzTBR06+qji3pofQfFa8qSRuCfAJAjqB
	Z42A7ZIRKGm6lZy+sIVthVI7U1o74Q7R5+6YZ2PLHhYBRLmdciwUMWRItkzIsZiEPqrqAkKiMOW
	V2QQqVRyWfPvOrM2xy5yWThgklQfooHQfCVzLGpMCggmp43fyLhWtPuVEfspIFYO0HA8Ayg=
X-Received: by 2002:a17:902:ce90:b0:246:5214:e166 with SMTP id d9443c01a7336-2465214e452mr98782835ad.60.1756092970421;
        Sun, 24 Aug 2025 20:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzTqSR67U+tpNmDgf/how6hjhQZdfWFRotg9qOkMwQOBCL1NTrcmhM6hc2DsV3b0TbsOsshA==
X-Received: by 2002:a17:902:ce90:b0:246:5214:e166 with SMTP id d9443c01a7336-2465214e452mr98782415ad.60.1756092969812;
        Sun, 24 Aug 2025 20:36:09 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:36:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:24 +0800
Subject: [PATCH v9 5/6] drm/msm: mdss: Add QCS8300 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-5-ebda1de80ca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=1044;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
 b=FDyvGFXblAvBxHfRLhBNE2iuwsCHg20XL9cYb6uaNzOfq+jOhcjID6Tdrjb1NsPhIGdVdhyxf
 M4kmoCsJlbOCNbuFyrTSCeFqfFRefX4qhhz0HoHJUoA3h8CbL447X5M
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX1DfwquvouOqE
 QN54kfmPG8ZVN77mRtfinH4u8Kl4Etf4lwZkol8I+BN3ndOoi1SpHOe7YKd1fD2Py6jq3c22k0S
 njoctcSsDZ/uobeJn8UlfVkOUNUFAYz9GCHVQA6cDJBdVyb4dV88c5s6Dnyj5USjl0h3W2a0Twg
 yQq96A8GHHzO1vEPwv0DM5Khu9kyEJsw6j4zjEiYjUMCU1q0i11xylgDNjDSF/yOVk+ZT8oxd3l
 6CW42SCT4DfX62UMDJ9QT4i8IlW56ZGMUo3/NZ8DPNsOnzUV2mHVIQJHlZjGNkUixYHRDQkz0nh
 fL7aKaFMKVGxbwCzl9t5b58oc5X8CsgLagfp6GeG5bHsSoNNNI6MP2UKNpFsbLaIxcvRnZx42lB
 w0ApMaFP
X-Proofpoint-ORIG-GUID: rKLfMnWo-v7W08vQFp-iEvOpi9HOA9au
X-Proofpoint-GUID: rKLfMnWo-v7W08vQFp-iEvOpi9HOA9au
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68abda2b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1


