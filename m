Return-Path: <linux-arm-msm+bounces-12223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D889386030A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 155E31C212C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685055491B;
	Thu, 22 Feb 2024 19:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b+U0IHia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A06AF8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630849; cv=none; b=Adhu3zsU8QUNsWS/1qTi42x/OzvV29loA9KODpzprM7Qizab+cCtW9xAM0//J4gjMyczUtx2QQLTUmAWszNR7rsGxuib5wqyaxXiLVbsrDKs0yUBlRpm77BPWPcinVtfll/4C7o2vY9hcDq0bAvPx/h+Xzn76acQeuNzgmd3z/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630849; c=relaxed/simple;
	bh=xOmyZjmzIEQjDjnVoR+CvSQY67kVbsUAdykTb3qNxjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OtsAb649ny0hExr0nz1XHeAwQJCHAz8rxZXkSgj8BeJ1/oAL6EWmwtQCVb6QVsO8ead6pPhd0pDqZ9b/4XJMHi2eqv1voMcGn+WHTewt/fpc/oz4+T9gqFFbkseU1tibhTl+DAXNGJheQP8UJ/4cDOdyAY0vZkd9dh9i46sZuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b+U0IHia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41M7xMr8031079;
	Thu, 22 Feb 2024 19:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=t/Z+FLw/1yInBUBdBXYr3rD8txMOLSGk93/0ASkKRSU=; b=b+
	U0IHiaCdU3f7X8wcjTG1+z11f8DH+vaidYCsf8TI403rBVjasJKMv/ZKB7gWlQ0Z
	PzpNCly3QAbiAa8hy5ZaTP104w56QHDrJxocVdRYMG1/6rVU3xSnEMW0sQ7nFJW9
	WCZ4iMSDL4RHGRbWRfliWdlCefQBb2e8we9F9etJiMogFCd5A7ZS6gthpKPCDlwY
	iaLDisTLaCqpgcSrxdZ0beJc6HWDvbiaYwblfTe5Dj0aXrRkM40oreLWYf/iUU75
	FawytGQhSKtl2bafmk25QYJ7R1Ce4Mhz2c5GnXQyBdTkpwyz57Mu9YebUxFsocbd
	EL9o52y93XmLsysUTLww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we2bxa7kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJefVH018280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:41 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:41 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 03/19] drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
Date: Thu, 22 Feb 2024 11:39:48 -0800
Message-ID: <20240222194025.25329-4-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: do7UYVAKvxYkSj6nhrOHQIQsKiW5z7Mu
X-Proofpoint-GUID: do7UYVAKvxYkSj6nhrOHQIQsKiW5z7Mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

Modify the output width and height parameters of hw_cdm to utilize the
physical encoder's data instead of obtaining the information from the
framebuffer. CDM is to be set up to utilize the actual output data since
at CDM setup, there is no difference between the two sources.

Changes in v2:
	- Move the modification of the dimensions for CDM setup to this
	  new patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4cd2d9e3131a4..ec9e053d3947d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -306,8 +306,8 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 
 	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
 
-	cdm_cfg->output_width = wb_job->fb->width;
-	cdm_cfg->output_height = wb_job->fb->height;
+	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
+	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
 	cdm_cfg->output_fmt = dpu_fmt;
 	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
 	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
-- 
2.39.2


