Return-Path: <linux-arm-msm+bounces-75266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C35BA2BEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67FF77A6154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5591928C014;
	Fri, 26 Sep 2025 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkDAmd/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A62296BD8
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871633; cv=none; b=ORss22yMVba54ERnq46igT7o2qFf2Rzuyhk7RglThLjPtYDPqCuLASf7qa41p3+BpGXmk71aO4p5BEIEpNsSC585ok2mHyGdh6AWCMVXIbWJ0cYCuBD0fMSwGcys6giQzuY5tFy13XJpt0IhNwRXjj7nvMZjqtzsX2ThWpvZVmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871633; c=relaxed/simple;
	bh=oQp9DwFQdYQWDdvU1iDKEeRn3mcSQ7RLuxSrcgehlKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsaM7i/ncES3g0kMHUEp87H8O3Ana7hVToBtp8ktz5eKQs3yWQVrMVZD5PGAONMBLq6uy/V7tW/p2mYw4Bqz0CTxC4VwtUNLx02Vwa4rpDPsn31f845sVZz+J2EMNw+ds1X2qTt19tcm7XI+Bza2g1oSJmajSLNk9FZPoX93XaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkDAmd/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6wm8Y026539
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBHyWqd8iRjW0Q2gzYVRQmCW7nBgory1hKdsYJUUAsI=; b=lkDAmd/c+gItPHky
	MG1ymVUnjm+C75EZKgwjM5cRBYektJOe3+J6v1OM4GtT0pXLwPknTxX/z+kehlpS
	1qpPRhY35bCN7Nz4JtSGWSK1+xNdS3+PzAKJGeSm+kOtqaIiUhoRLOs1hykqfXua
	XEryZK/0xKFyjhI1iv70tJ8UTgTi+1HvmsZ3H5dLjQajMPTr9elVEou+W6PM0UEi
	CScAFHYyQoUcpYtxcq6rFJWBc9A/GT+nCfnwYBx3oLh1XfcSkyiJ+TLi+Xj+jzm8
	Aq2TL+pPUyTM5P3DHqhKOZavvkRIXAq6caHglKort7bfbvrrOt5ngkkIrv405vEi
	VCqykA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u1vs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:27:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-245fbdc2546so4391285ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871629; x=1759476429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBHyWqd8iRjW0Q2gzYVRQmCW7nBgory1hKdsYJUUAsI=;
        b=gDTTpeTD7CBA6tjK/FJcp2smDVFShw6v3F5hgCkpMQ0GkkWsbZtRnL76f/6W9GF8OA
         5Qt4iR6ZJabwgyzK6RhRieO3oCwAIz8mClY26rr09mJx7gDrArjL50xJqgxuJ+eOCycW
         /aySa/iV6/AFkpCm4KXyjZ4BpdtRALmNqmYxfNY6ygeLmCt15lDm7vnpgqEuTLirbGH8
         bz7kG27SOq3nfUzcOugevnrdIZAe4U5M6hsbcr1qXUgn4o7cari4pr8VCxcEzye1tvoW
         Qb19GKB2112CDNHw0UDATsHJgK+bKne49MJnvtZ0U7WFbPCDu+RBX+36XM/O8oQcIW8l
         4qhg==
X-Gm-Message-State: AOJu0Yx6hmJYq/FpUz965abxK52Ag8Dvn59MQyj6cy/SrnEJPs9CINBi
	i7Z+g+h4XZCksADEThJ6P5I8p9zojwKfCJu8rIf/rwUPpiLtFP+stETHWmnpzfLJxfX1XxSOZbp
	cZoJuL6/ttXOD9XR2D3W6m5XNkJgEFcNfng6e+bWhmvWC1+l/gyJfDtr42RvS0UHecBEz
X-Gm-Gg: ASbGncvRMb/JQZt9xLqyXcyC6jFGjh/uEdCzLKcHAz0j49quh3s3QoCMLhPMukefdGR
	HA0pvD2NgDOAMmlEtqmM9ljZYQkpjK55jIx9KlzzpWThYWDFCVYeucHqHGRdxsy8CeLoIlSb2mr
	g3sB3Gq1PxLXqoXwe4NDoNV6K8bJFXofmRleE09khl3qywOjM5PZJ2n8lfch3NxTgqNw2fEOCN9
	6e5qHLkB+XH2SRqMUx1lBY2efTwl7JeOir6iUYUtwFxsXWb6Pc23vJgJz6LWloh47yjMELZJzQR
	sxLEwEVCadA53Pquka59wX+zhxqZBTRStGFz7BugpffJ3auhNIg7LNCrXGwnsvl2sT6jOmMdHM5
	bGrUC00h1FiEJzOFZbR9ZSbKDhZLAlHAXraCFm6CmXQgEHB0mag6m8DKn
X-Received: by 2002:a17:902:f551:b0:25c:b66e:9c2a with SMTP id d9443c01a7336-27ed4a36409mr41153665ad.6.1758871628844;
        Fri, 26 Sep 2025 00:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+O099xujjC/yO29xVuYREkkBiX2GXu9s5RriPjceCnhs9oR7nstztkgV9IiUszESNtEahwA==
X-Received: by 2002:a17:902:f551:b0:25c:b66e:9c2a with SMTP id d9443c01a7336-27ed4a36409mr41153415ad.6.1758871628393;
        Fri, 26 Sep 2025 00:27:08 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:27:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:44 +0800
Subject: [PATCH v7 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-8-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871564; l=2826;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=oQp9DwFQdYQWDdvU1iDKEeRn3mcSQ7RLuxSrcgehlKo=;
 b=5At+q9+DnToGjvm7JMgfhDG/u1O0nUC5yiheYa8olWBceN5UNjNGS0ctGUNJs5yiRruaCRpoW
 Ug2K5mb7goTClU9tN6MRx+HQIYAxz5hnlhHOMwLEuoKL+Cz9JMOcGUo
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: dxP_0tuoyBsaV83wg4UO2uIq4T1Gb4e9
X-Proofpoint-GUID: dxP_0tuoyBsaV83wg4UO2uIq4T1Gb4e9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7z2e1OjZzXkN
 vpASkTMMoXEsFNN0OMN+E7jrP7PZDo+d7CQIEM5OWvTBrf4U8K2eq+dEW9gbI5nw/nd/ld/L+6p
 fIbAAK/qEGCqf8LNamqUcS2tilRLPnugL9lsr7cEy59U5TSEeMEy6//VPH7XAIjVQIE3L9ryyjj
 YSVDsXxw6he8P7KS32TZah9qV0Kibb4CwvARJS9VacVj3caTPehaGkCA5ZyKs99Vkurg2SnLvt9
 sV7KP6xDVlLEYNxVrowCEakvjULxqPXvaq7U3ArWco33dnb3HYCWz5dzrvf5oQLM6cu50Cbgd/m
 H3QqoQjx6UkQv7W/Id2r5AyWPQyphkGnnjdAl8B0NLyHgeFayxoJP6mH5yBpMOP2dVIeqzltHMA
 0LRW7Se04YDiDA6mC8YYoEWUjyOKaA==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6404e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NTL_5ILWjaOn02JYBUkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Extend TCSR parsing to read optional dp_phy_mode_reg and add
qmp_usbc_set_phy_mode() to switch between USB and DP modes when
supported.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index a971bdc3e767727e69ea07b14d9a036347d365f4..fab6ccc4a5f12a4096e9a71f066f8ccec73adad2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -529,6 +529,12 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static void qmp_usbc_set_phy_mode(struct qmp_usbc *qmp, bool is_dp)
+{
+	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);
+}
+
 static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -669,6 +675,8 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 	if (ret)
 		goto out_unlock;
 
+	qmp_usbc_set_phy_mode(qmp, false);
+
 	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
 		qmp_usbc_com_exit(phy);
@@ -1113,6 +1121,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 		qmp_usbc_com_exit(qmp->usb_phy);
 
 		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_set_phy_mode(qmp, false);
 		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
@@ -1263,15 +1272,16 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 {
 	struct of_phandle_args tcsr_args;
 	struct device *dev = qmp->dev;
-	int ret;
+	int ret, args_count;
 
-	/*  for backwards compatibility ignore if there is no property */
-	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
-					       &tcsr_args);
+	args_count = of_property_count_u32_elems(dev->of_node, "qcom,tcsr-reg");
+	args_count = args_count - 1;
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg",
+					       args_count, 0, &tcsr_args);
 	if (ret == -ENOENT)
 		return 0;
 	else if (ret < 0)
@@ -1284,6 +1294,9 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	if (args_count > 1)
+		qmp->dp_phy_mode_reg = tcsr_args.args[1];
+
 	return 0;
 }
 
@@ -1319,7 +1332,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qmp_usbc_parse_vls_clamp(qmp);
+	ret = qmp_usbc_parse_tcsr(qmp);
 	if (ret)
 		return ret;
 

-- 
2.34.1


