Return-Path: <linux-arm-msm+bounces-73111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B8B53048
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C68FB6226C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E628631D379;
	Thu, 11 Sep 2025 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtvCC23R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122131E102
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589890; cv=none; b=Gzl2UDBdkxQxIFFx//DVtzZcWzQUBz6TEB1bzPIIrLkwyDvvf5RzKXktVOBbd7T5l/+JvZJyjrVtl43zJH7RenIMaQq7/9gvEQ1477V4W62x5WPdh7Lre49CmGnWODyHD2f04tyrRbjIAUlFWQK7SEQhawapR6v6w2+Savv9gOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589890; c=relaxed/simple;
	bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtW67E9Sz9UpeL331uH9w5dfhQFPZrUpApf3ou5+oc9/NmFVBs4bjtiYlJLUJpecufa2gJAPZnPxLS9mzfjcRltaBrBSyQNt7NPbCYtGJwuPgj8Dn3K6YkWGVbqq6q4Gr8KyE+XzAwU2/txGq8Abc0eb12ZLpgnh8j9gPqDcGks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtvCC23R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAjIiG003429
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=; b=XtvCC23RsHklyInm
	c7KoMjxSHqMi8zxFc0624vmpxQrBILAimTeu1L3EMV8XcWYrGsc3sNOtO/pCUxnN
	9O+qTZ0stmuCoVdwWBvl8BA+hD2oDJEz3DrtZYOMq4wjLWCE8tKOEW3IiWWBPoru
	qeWvG4t81da0Wbfju6H3YPuKCe/pTeHx0X5yMLxGe1jSf/+uFRuGJxIynoY6LF2O
	zJhoiAQiwhYR3eeD5bJg/4ehuqh1uaVEpZrFg4kvvaaZpnT5UiOSHJgPAEEZENI9
	vv4mEynB3CXsgs4YIei2CJuPap5wIL/Yl+8e9Kmc10MePBahURBkKziFxoPlf1Rz
	Wg61vA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8qf0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2507ae2fb0fso5591775ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589887; x=1758194687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
        b=teCFNv5uUMKHsNiSeDpVY7dfm06vv/UCNqWvFA0S8EKUDipAen3vlDibYvqZdFQe+6
         W+pfGKYAbkA8D9n1R/uEBOd5YCk7T4WGSq9qKSY9nRnJO7uBPKjPkCXK6hK4R4nVF7qi
         ABOJIDVQYU1vpcmKPiAP1GpYhtP96WedEuASzSGaXchItTYT7FGqfljTwdbvjB8xsXVW
         lIOrY5R+4nWRiG/sAAuzSHsagqIh48ZdZhqotxQG3ztNeXRrMJnQWn5L7ydUMNS+dTOy
         FQmXSeXlAjWr6JDpgcFtp6szIRgIlna84Ds1Uk+R9b6+bueLTOQht8BWHJSoyulrnd4S
         q5Dg==
X-Gm-Message-State: AOJu0YwZaEn4ebzvENH1feW/3FNiMeA5utftE1+q3A46pntA/YAnSZPZ
	ZXFbdIsWM/ivlhUmnRtZ/GFCbiqh88X5n65syh3oYVMyiBJDSNDatesbhwVUVuQdLmIfK1fpx60
	1jNC0iobgmBB0ENjfGpod0lJpxiVPADqkyqW1N2SUFvTHrRqpC7ttEPLMHOGSvVMFERaT
X-Gm-Gg: ASbGncs9WX49D7ONTp12VEh4Mo5SuvYpGhxEUCeN45/4r4YdndHJqBzMsC4Tf5VAYdy
	uzn7GPjAwadqn5cPTUuNlGrBl5QpgpSpprH3lKN5x1dwhmXkPlssxvZG7jOw8Uuc8rzkF7dWjlH
	VzYs2KgYW5JUn9KEfGsuNNzNqRwizKVTIvlxV96cQZRg6fXJaYp8wuJ27XbO+GJrdrGNSmArFrM
	9OKRR9l/lbpFvp2pkgVib8qel18RWO/xzb/7hOXINJHkL3ZqMIHTsOI+1LoUSe+25YVJ3pvM4+O
	7O99Ig7xrcDhoBuPqv1EO859GMNr+WFJC/nlfXy9x3lpRV4LUb2Mr2OKy7Hj7EG7n5nxMO6hQhP
	2gxZREAt37NKsQxYzt4E6j9U5a8qH9SkZ
X-Received: by 2002:a17:903:2346:b0:24c:c190:2077 with SMTP id d9443c01a7336-25173119212mr269058975ad.38.1757589886651;
        Thu, 11 Sep 2025 04:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6QZfPeqjAdNDP/IOs1Iw7mvPTxlF9kQau40+ELjQ7Q8xG9vYN+Qx9eo0Ez25ipgoMd6bCXg==
X-Received: by 2002:a17:903:2346:b0:24c:c190:2077 with SMTP id d9443c01a7336-25173119212mr269058525ad.38.1757589886162;
        Thu, 11 Sep 2025 04:24:46 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:24:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:05 +0800
Subject: [PATCH v12 5/5] drm/msm: mdss: Add QCS8300 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-5-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
 b=WpU6ED7a5F0yYamqUPXQmbEUElYlXxgI9Gy6Pj2DC+Dd2tBeAmG2l+2DtlQb/pKR2RcSjT3jd
 gjHYH2wDACyCQAfBTfxBjEIffU98xb0MjBM/hBwyufT2axZmE9F1DQq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX6n6A0ifiyy6z
 mmY/RDLmfUnI2DDnzX4TQurmI9WZ0a8rb4clGVwvytaVzP72q9D+WgCg+BNCyufL4PxxEqRUisN
 L6NPEXWBGdjLmFc6AfU+21PflsSjHNIVI4vMTHE3HTQrc0zy7ZkT+ZO3HpBSxRFyD1OuYk0R2aF
 UPn/TompmRKyOcIH7dfKF3MEltuYrKVBlgQPDDJRcKQZCv0UoOK0WgFETIrSwKX5JhG4GYpQ81j
 rtJmaMIEo9zxOp+GEr/41qtAxmD4DwsikNNXCD3YilGqf0vW8N7gdL2W1nIOFuRy4n8zp/nXNK7
 jTFZcmIVRFGCtibC/nyCWSQFN6sqEH0Fs4EXq9VGL+pJI6HwhVTFHcWIl0HYc43J1cCTwv5OQN9
 GfJQtaTa
X-Proofpoint-ORIG-GUID: AgaMXaw6zqgq6EqGqVzuB5Baw3ATxCnZ
X-Proofpoint-GUID: AgaMXaw6zqgq6EqGqVzuB5Baw3ATxCnZ
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2b180 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w6jnlB3v2fMHmChJ9ZgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..db2f0064eb72 100644
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
2.43.0


