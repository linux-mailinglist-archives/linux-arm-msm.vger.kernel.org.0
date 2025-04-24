Return-Path: <linux-arm-msm+bounces-55330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45EA9A838
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B811B825E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E5C22069A;
	Thu, 24 Apr 2025 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaVLz3H9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D596243371
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487083; cv=none; b=n88i6h+hB5IgY/GezBBxCS9En0nJysXze76CsZhAbKB2xjGX1e9a/mVE8JVJ7tSYg2bGZui+0kKXM6movOOTG5HQKfQ2rLJm9VAxRksllj+L6qcPeA9utgGBABISlMahJP0/QkHBI7RdO8DqUzQy7uOljWZIXxtmJBwu6poB0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487083; c=relaxed/simple;
	bh=EOew3V4JYVhVMdQInPFFVrZz3IRvBkcsmIxIux5GuyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV+MBL2DYPsExjgCodVNWsaMxVwAUr6SkTj5dDqGBSWhxxtr1DZ0zKq0l1lYofbhoRG7Yh0zgrfjOdW+glMsXmvrfTJVBRAArpt/OC257VTsEB5clisAS7DSDeVwOnwCxk+ePZKufhuT54oh/E5mJbvZupuEKYi3BTqbgXkvL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaVLz3H9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FPPV029147
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=; b=SaVLz3H9YNZvZQHP
	dxxMBesa2pjVqluPd4V2R8eEjYELRIYPftpyCOxCiBKa149pBlhdYemtu3AXr+7B
	C3YRJoMNaPYngcfXdxRwsxbfF5Az7io+LthliGnQdLfaGN6Nr/St2IYj4J+QA2yO
	wdEU3vBX5D8opv5Vsbir6clATT+3MdTj5I8WmRTxEayOSyhFhC38tmMf0bEjlrSY
	h4k6OtS+w26jNQWTa3HDilvu2iUSDtga7pupp4cn+eUQGGYr8KTjV3YfV5eGCZop
	nj3jrFgXqBM/J0HpfiNRWvGzMjyFbRuTU2mxDeDT+exVADx1vphMulwjXlZ/+xiB
	i7uapQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy503a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so105316285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487079; x=1746091879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=;
        b=qGarnQf1Vo8fHHvYcdWEJnvIgdQyE6kcHf42j3eXLXEGVb3aQIlmJFqDZ31U+BvnGi
         nH+Y7nosMJkwVoOQ+3cmmvA1F6QxrfLu6D3oxMWM/Ads5Vye6DoKAN78Z3cSmPNXD1wb
         vZSb3RQAp2YOy8Og2oiBm+WwM+mRe6pYOsoNM/uHNA0uqplcUeLyRq41OnNkQgCScpCP
         HjJdrtf4nGoY4r0T7gNpRhtznzBJuTcKLzfzP1ludnLRxdBKs9xd0JRN24XMgqwmNATA
         lZ+KvypJ1nMXLFPyPupS6Fp/P0ArE0DcoK8uZuWLkxLcG3zyeGCfcx45N5lMY6RAtLgi
         5H3w==
X-Gm-Message-State: AOJu0YwJxBTQCx3HbhCZXtRJF6Vuk071xEO3hOQY+BQ/Xx1GM2icLzDY
	IKfR5JjMaKhVAYvlVcFNjawQFX+Cr/8Bi6rp3h2v+5AysxbWqweK2ZUEKoVHdLfIJqw48zgRKF6
	ySOUeG5iVllkbr5m9eRwh4dvc8rDrkkFrwq+NoSXu85jr2zEdGKCe3BVnevg87fZ4
X-Gm-Gg: ASbGncu9/9FqBGey/rmtrucMzjZA0nxTUG1d53thnuji2qatTRLyTetc81a+kd2BUvC
	IPrCV4e3LS931iqsCWiX3FIgl2pSo94jdjF/tc/dfBaNcdYc/zYA+EbXm3WLhvrQ4WmP34aNi+4
	iIDCthqSJtsgmZdXPwG2RKLIorRcwyRWt32frUmfWcLGG+eGEIJ0F2f7vOWa7Hnnnm8UcKcRzbd
	d/Yz1jTDVQOSf4c4/+j2nsGZbbngLgWwKMUcNuEb+hwGO1AZgGUCiZAMqDbuzR4Ww2xTKS3Eg+O
	u4CsTw4r2DdjPmIMzYdHRdjsJeTuohlTk17+Qyz+x8FbifR7WDqa+IvtvmpEPDbsFgcVNZqMSJW
	ffT/Ich4UR2kLekoVgFeX1jIq
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id af79cd13be357-7c956e7db71mr265477385a.11.1745487079440;
        Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8sHYulZcantfqMVMskWIoIphoholS9WfHpqT1Qyz8n0LX/T8AiyVMCBqc1zdHp5HweR7KQ==
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id af79cd13be357-7c956e7db71mr265474285a.11.1745487079073;
        Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:33 +0300
Subject: [PATCH v3 29/33] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-29-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSw1nFfmM68OEYBTdCxJ48gqfCba+CQGJERe
 /OMrX4eE3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1QLQB/sFaBLqJ+zpLBU3UkfkDppxLIHVuMH7MRE1x9FVYciK570/QBvg+qkCHb5d8MQ5rBkvz9T
 NGEkbP/z75m75O30kd251apwYzRvSGC4lRmvstIkd7NXUueWRyoEtATP5cD4spbU2D8azGVV3sg
 YbRb1MwgW/n5tJ9gnbyl8BIYBFnzkQFnkTUmS7XnXUdWIkv7YD0tLbI8Nr2KzUl4jRLwl295K9Z
 FRd4UvPkKhmOozWy0m6ecvUa6RLApgHXBPmT+qLPcOx6/lHiNESr36Sd7tZM5/2jbB+e9EvQU3y
 S2Yvq8oTs4fl2WbD9d7gyPMXyr6Iv8sj01NBkAdHwIcPaKr4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXzEUYNaXrt+ly kHNASX57yRXXCxV2T9nv7JsNPr/QGbtNpTQfd56SYTRuPDrHANkRRg14L4uQaUVZ4IvtKJTsi+D sxgS2M5RCY3RGlqeoYWF38WPsvbxsGGUkr/ze1YchEmSNIyGxv3q1MCr5RnXJekWrtPYYk0hfnw
 NeKubRTmkbsjCgvG+gLMPMH8ilbG+eelYbs60ldWGeWAkEE524di3It0uc17AE7oyyPn0hzfcXm RS+jFoR3X591xvmJLl429qfgHDPhYB9/f2T1bAgvOZw/I5f/fzTCV3Jbp7y7tnm5KqbrXhnEdf2 iGHbUmNBjcg3bRVd0KgDaw3k+vkU6GKIN/HQytshe8PDdl5SlemWrs8BZjrXD4T8X8rgdXKgmQG
 WFwtWt1dzUJgO+S53y5Hrv63vFuQONjbupnpK24jXVIa5j2DxUxNfcK2eF4jhiRspaxb1HOf
X-Proofpoint-GUID: P8GXGgVZQaj0A8wt78A5tVxTtiG0cQJ-
X-Proofpoint-ORIG-GUID: P8GXGgVZQaj0A8wt78A5tVxTtiG0cQJ-
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04e8 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=917 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5


