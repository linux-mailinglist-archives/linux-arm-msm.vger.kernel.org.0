Return-Path: <linux-arm-msm+bounces-54713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F53A933DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95666467775
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE1526FDAA;
	Fri, 18 Apr 2025 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzZuxaap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D726FA6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962616; cv=none; b=qGJ3B9wHhAOk8Xg2OjRHMD/CmOKeZQEhQr6BhGeBNPtaTO00MzPcSOwXBjOF7vfSvaw/SAc4E8fRFMo+EpkiYei+1fvDmOB3hprECW49Scr3Mfvfi+78eVu548A9IB1GRw5hEphYOPoaKVoQSoIkCKUAwE4+nFnVgPNuw7lAPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962616; c=relaxed/simple;
	bh=UmyjtCBtvf6or154F5rGp7XvUVxTnoqgmeLIBcj20hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KekUmC/ZOuYAv05NCu8cNToNhs2dVSfZcgV5OXGX2LywQOfycLYKnsLC/GmNiw/iDkoGo/58rUnj4EuibIQAr64HcE+sUe45JUEtWhHVPfGI57+LI4pyvHL/oA7CaAfEEJbaAvjumhpdKUA0YJQV1+ZYeC7Y9BEjGPeQacciO8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzZuxaap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2HfGw013246
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=; b=VzZuxaapLeJoz3Og
	9KdLyHV/uWxalvCpQqOvwlN+WYGa+6049WoEievtDZ+jSacVClLOM0tZYO9zzo1L
	gUwdtKGunzgE4EDJOTk5ahXyj9Kg+iYIccBNqoFsFHVx6EPDs/O1g4t0NAUDp0Nt
	XwxoNHZe8LSxJ1Hf7W8JTBafnxMoWXKzdts5fXiaq4UfRpRizJB6ilGF9qscHdZ3
	JRdioIMVYJMPTVfl7SGxhwv+ezrnvYFTKRA2zC21YBAx/Ut/47G1KXbDQF+JA8rf
	NYSm/ukIWE567ygyc7gPg66lBaZ+tdb0IknpsbPLt1iA+mm1h64nljVbwjF+l2p5
	CvdHJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvepf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2af3128b0so26707926d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962613; x=1745567413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=;
        b=OYq8PSmEpDPnW7vYvr9mDLtDA+mnr618CS3Z0UjWbRqMUSlkDJbiTv117Y9ccQ/Uuj
         CZARSa6J+dDhPt7/X7LI58nLFrOkioNJfbu55+52jRNTJRBeiOisc4dqZRK719SLDJ8N
         dt8oC4qJnwZ3005cIeRscUNj+g3PlklmU+b71o5YN3qp13toPo3REaHR+h6Pj395N05d
         u28EvnyqObA0v8mLEDVMmqZbdgCfGr6n+L7QFSO9RdCjT5Mnx4I3CIXnDulwptPeUmjx
         tayaTrFp7QHxIfXnLKZi/Jx1f3AqxMnFMzRwqm6RMyqP+8w7EIRfyE08HXjvtQ8B3awR
         m0sw==
X-Gm-Message-State: AOJu0YyDIRB226wFl4hSXf52eg9k1AXa48kR9AE07921sVgCl/0Vav+7
	wMLEnylTcSsIdx8M96nmSMg2yCpa8QpkkyE6ZE5eqN8ikanzhnDdoeUYJs7daHMWJ1k/3XRVQq1
	rN5POA+FLzA8l5Hd0maoOT19c5Hqhv+cHJkZfyYa6gr0nYNxV1BzysSji2as8JMks
X-Gm-Gg: ASbGncsGgQi6sDEy1EKmlzLyrgi3km41NC+MKWwrV8jA0XmkyNymVQ++EAR5MIUpS8x
	ZyMyp+ZCR00CyGNUOHZfOwelci6zDcAcDGACuYNqmjaq3GVVjptjn76RKAYe/YoakGT5jxxLark
	W8gbj8lgjXfpFZjqqYZ/w6ln9N29pJsbISL4NC7uq3kI17YnG5KVWxE1UL1Hbhcf1/7oBxFQx2e
	iDcsV4PadAezgMiWwAKqqsHh/iJmyfnvdiqOMrK6YM8XnlzJSOqDaV+2UIcKwwcYplIySzO/uRr
	tRBlKNlN/pITlBY7rCXQC+W1gMudFiaHK2T4FdrdFSKre8iuv5+YPcXW1Sj6XByU0VBW8yFg4pY
	R1OXP+gfEXsgHXw02DPy0jpZL
X-Received: by 2002:a05:6214:d65:b0:6f2:b06f:fb0d with SMTP id 6a1803df08f44-6f2c450a7e2mr29665016d6.5.1744962613365;
        Fri, 18 Apr 2025 00:50:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEFBKxjNRvAZuYCsZzZoBOXQ5GZ7V5fEmfAkthh/uU8RIOKGlrBZIGmI/H7A/leQUzYmjvVg==
X-Received: by 2002:a05:6214:d65:b0:6f2:b06f:fb0d with SMTP id 6a1803df08f44-6f2c450a7e2mr29664716d6.5.1744962613053;
        Fri, 18 Apr 2025 00:50:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:50:01 +0300
Subject: [PATCH v5 06/10] drm/msm/mdss: add SAR2130P device configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-6-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpHqG0APamLD8Y8TOI43B0nFr0BQVi/h0uy
 g93F+tmYXKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1SNSB/9iRh03V1205EUwD++qfE6m1Mb38kuXYdQt+HHZJMWzHNaEcpeT4/k/11kXAjeFLU7FrQY
 9G5A/J4nhNmdaD2Xxp1pUtSb6B666EBA5OeqQ1UGCwrtJEKyqoa3b8cCLPHoi7RQnsbhVkbaFQD
 Nia8Vlrzz2oXwAFp34S2WR1jzRqRZ06W/NKceDg3zkX/x+Tvej1iOnwfjEwPtkMeqZIzau/pZUg
 fZscEVOtmz7SlrWKzLtP27s9i1tZG+1o5OyoZRnXKWNxnRgglPlOIN0zOma6RCH1djI07cpltmq
 wkzyOliMjAEziWGI3xR5SdbXiyz5idlUyqgWmyOlBji7ZOVs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Nmd3oazgpAspu0v3FiD3jF_vYBO0-3Xm
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68020436 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=PM8Rf7rFGDq3tjJTke0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Nmd3oazgpAspu0v3FiD3jF_vYBO0-3Xm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5


