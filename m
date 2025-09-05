Return-Path: <linux-arm-msm+bounces-72171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE83B44C37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 05:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401E158624F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA91C230BCB;
	Fri,  5 Sep 2025 03:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qs/3W087"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFA31F1538
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757042583; cv=none; b=DFNFWATgDkcNXAxSMnPc2locffg356UK6cZ2R33gsKy7O8CEH8Wzfh6ADj0CzGMQw17IN5GozFx/fW2FuC9JRhzVsz2xJnpXk6DRAqMCBmZs63nJjnbpvhjK8SXZcoxUyWmFWxzxQNofm7yKW4DOIgfqM5LCVdm8QZZkUUICUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757042583; c=relaxed/simple;
	bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hzsom5+6sKXc8llmWXM3W5T8S72njlIHEmcPtbiqqDrV5wXUMFLJKXEZxnK4SMg7AhkZAYO8D5mP7KYlcBKoWGjXTamLagv9ND91I0NrIoo8Aybs2/RknpANpR1yEyWU45QJiYR0cAuxRpH3A/9SmwOqlT4WoPfj5HIQQaiJ4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qs/3W087; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HhfaM013626
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 03:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=Qs/3W0873vuIK9d0
	LH0HYmRvSGG2ZAEFn8tQJt3jl0Hn0ZahdX/l9RUSs9fwrwcKbVTIFV1Xn+i//T8i
	jywulvtR1dr2Iz4XZjeMGfJ6ujsL1IQJsGqUGjWyDryqaFOqlwu6Ykaof6pJDeQZ
	A9EBOaPuO1yq0RxA4zAV5fv8QWoOW+VRVcydTjQaAZbrpP5tfU9H/H05m53Sjl2m
	nddQaLFx+n1wMnbgyt88sUuX95nE96VZRgM2He/Mg68qb9MjLOxGo3Yx5AycXKpX
	1oxAt4HhPziZ2m5fDm81fc1wY4rk3EdS3nr+7L6yUPak2Q/pk3U7sPPDoX2ksL4x
	2VeHgg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wydk68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:23:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24c8264a137so22347575ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 20:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757042579; x=1757647379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
        b=aqtttq/+Wsvic0MGoNXwSsZkA3iL7rDObvrDE55yWolY2LJQSD/nDq39oDVZZPLg9R
         3SlJ3Wdw8Dqo8llBr62bGLY5M30YpKzZ1zzZJHwMmSqfpm9XB01wi+fnTBz/kmKu1VgO
         RnREnYOVvBDrAlxxTsGBTUpvGisb4gU+aQBYtansNfagKDLXmMCnusKuf8Ka5XO2pn4Q
         mOQQs+JP52G0I1b0Wyq3L4g9DQhENMZCVMkPUaRqZNfhjeriEIdoCtGTfVxxiqAfLeKO
         cK2ls8HmFXOupKqM0oYVsdL5VbEg2xx4LyqJ/rxfLKbwJaPDZstPmzDC8tMIBwPlqDIu
         c2NQ==
X-Gm-Message-State: AOJu0YywXvzQy5Dg6hEC27rTDtbJH0ZbIW39rLHUcR2d9+nmkwjUhDVV
	AFQnV+2+A4ltLbZbs7T8VLSy+9NEytKDpVxDv4hlhWAcCAwGxkVqBcbtvqn85Ge4McnNkQoSEWy
	y1NMvVFD6Uw2xXh9ERqvbtJbqPI1yPTiHc/kkZGL9fVxcOV19CF+oHsvlIBHj8BGLjwok
X-Gm-Gg: ASbGncvfuEhta52vO9LArXXWSi22qH8fWMrRocylXlvH9KdrOjfT/ZhKJILIKDBNClC
	qmkb+WZok6L4zdli976S8i4LWLfLfSkKY3gmvf6BP494GdgMFTBWRclpJva/NOfnl/wWH8h/7fJ
	9dKVmPtCeg61wY9C0Bhb0XYAZRHL7Wy2jtOIUgnKIWsb1JMF52SvOObreNlD4ntK2jYkTVoxdmH
	9xxa6Ke0H/hNu5NzlmX6cvb8MKKDtTQrY21nLx4RSRKqmO/hMfY5mw+uZ4JqQb3bmh1Lw4OzQx+
	9rHI9Nu9fo7MBFfYMTXpSbJXIiQVABA92fuh7c50YZ6WpAhIkwKC8ocxVotj4VfCxA4=
X-Received: by 2002:a17:903:234a:b0:248:cd0b:3426 with SMTP id d9443c01a7336-24944a460c6mr319747225ad.20.1757042579394;
        Thu, 04 Sep 2025 20:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyydly+6Q3+za/vErI3NFaHpvIdVdkzEH2JljFFmfwcLO7aiqxAf3LzU16QOySCFRu0OmPvg==
X-Received: by 2002:a17:903:234a:b0:248:cd0b:3426 with SMTP id d9443c01a7336-24944a460c6mr319746945ad.20.1757042578960;
        Thu, 04 Sep 2025 20:22:58 -0700 (PDT)
Received: from cse-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c92eb0898sm56355105ad.77.2025.09.04.20.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 20:22:58 -0700 (PDT)
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
Subject: [PATCH v11 5/6] drm/msm: mdss: Add QCS8300 support
Date: Fri,  5 Sep 2025 11:22:48 +0800
Message-Id: <20250904-qcs8300_mdss-v11-5-b6b6a67a1719@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756974526; l=1044; i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id; bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=; b=Z884TyiVMh6z4n5Eo05hhTpvKy7488klciNK+fDHB2Ltr4fouFJ4gaQDdAtbKOSCIOIfHQHS8 Mg1w9ymL1zAAM2uX/f3ppo/qQHnXn2O+lwMidxWAVricDecApUAL0aJ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68ba5794 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9r0akjqaaSIoRZUuutsi0XCkS8vBhwMc
X-Proofpoint-ORIG-GUID: 9r0akjqaaSIoRZUuutsi0XCkS8vBhwMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXyfHXFKaiFEWv
 lDzOVMzF5EubR4DUvdAIob7il9tDgHlAzFyZrdM8qI/feDi2cjA0eg8rW6gSBC3L1sNc0dETEoP
 iE0eQu/6cVOkVuwmD15cpYNo9whoaoff51pR2RvUpLne3bI21ipGYW50jV35ZTfQfaWEKn+eWDE
 WkTN9hLOGiF4Uq3rpS0lWNUlKihLo//EPP+OO90C+7pDDb58aqjpiGlmfno7e+o4yJY7JHmIi8z
 Ow1WGGME3uZT9+Bg1yuiq2TTBFsybozDkbawUsyDfgLKeIqqYDCgMN7jpOEro4uw+n/lNSLKynD
 lL2/MwIkkxuSsthHm1i7MCw26O3mVI7xq8tSfg0+W2xH/JtUTDyr0Kr9b+W7tT/yRW6VpMHdC8l
 nGJm+tVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

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


