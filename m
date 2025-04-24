Return-Path: <linux-arm-msm+bounces-55312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356C9A9A814
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF897B0FDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33E8226D1D;
	Thu, 24 Apr 2025 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+fO7SZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE622424C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487050; cv=none; b=dV3jWii36F2p+TdvCl+2ubwOhfNNiGXs0cgTb4CrS9aXPc9xvww0M3HwXN8r31iszU5GJ35pChEkfoRQa/wlcX8QZ2dS8EbZH4BwH8YILoZekvjow6C0+rSME2NXPINFebQPs0dcpHgksq+ibhGgK6iNgHCjhb055/D8Sme5dbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487050; c=relaxed/simple;
	bh=FQ2i0vtcNutvW6mILhPnqYVxeeOvmk8EyijG6FMoWqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rM9bLHZ1eeho5agl9h3dfYVNppGQr2LhPed9+4rU/+dY8IdrkK6okBFQK00JwIhzlDkUouH9ZxINnbAn3go53coWHPruXiy46GeM6ZXC5Pq93wD8pBTcbCdkeH7q0E4FbW3F/3SEy1HYFsB0eJE5/GmznMDD2azjE4adrr30KYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+fO7SZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9sF031020
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QywQSn/YHjitxPlBIJbPhSL0qb3ubeGjN/MXA9O/FXo=; b=f+fO7SZZwcAoFk8Z
	46Ye7IAzGepfF1Ak08qs3OKavxtVBCWWRwN8qEoIzEzVOA6aHiit+tUq1ivF/DYu
	aSsvjnBtGBiWH/NN+OSScwKHElr8FKdE3g3c8N2HS4SQN3PhSmh9wmEjPcOBQU71
	bw0APT4Z3gFSdVj0cuN3vSZJn2JtJtAuhdW3x9Z7dLaDXIABvflwyNVv/pBowE2Q
	GzVY1mZBJeFkYAa9dfirKdHr5c7th7leRs+NhW0+mG5yZcCZqdeWRhQ8rKpHtGg/
	IJSmBxCP+2onbgeGVXFRRBpVijUa3lGZts+22beIdnIjQ2JqLG6VR8l/SMtBgVG9
	8bhK0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cyy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so254097485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487046; x=1746091846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QywQSn/YHjitxPlBIJbPhSL0qb3ubeGjN/MXA9O/FXo=;
        b=iO63e4d54YarFVJYRuqBbT8BIAePlEGJV5J1/UJLHniM3M/O9R5bu8vSXmgFT09V13
         8FlSkQYBUh5/zIiG0H/SPArJy3KyZD1aACcdcCyVdWoDKY2X2XCcjWxYrflH/+m9lseC
         +b5XImk3ypUiwwWKm3CwldqhYyy7Y4rG0hxArmT17nbdWubeVx/39M1GWXktC5rWuGH6
         74+fDm48p2jsVqDWjx45dtKzyStFxgk8bYRWErB537zH49hdLD+n+134VTzsTuglq7qm
         Cc6m35fjFKZTjux4t/dT9S505VDg72iV0PiIMlImvpkLmA9AKl5Iv+vha3YD58aP/8ZZ
         HamA==
X-Gm-Message-State: AOJu0YxqMThPMuwl33Z+ZirGsmmurgkrQ4vRRzpjoUrTYcuTc6BQBtaW
	u5Tr4wE1g4TjCe3q9uFb2QNDbowxlX0FymM/CD3xFGigG9Yqkz67+m2TVrG+GXoW89yk+2odZxo
	YvxAAap+Pr5+N7nfkexLGSgv2hmLFwqtyrZRvddxxQs7PRMILTDGAonhEXau7UyEk
X-Gm-Gg: ASbGnctZSgM3z1I2HRgqgdqX+CCCurn7P8jtrsoXRvbHew298a5ScwuWCYyAg/AAyFb
	EA5vIlQMuJdt+jT3yGqHBOoJuwbPbr3RcoCgPiP+gfem3yJ2UqdCnqCW9FPZK4j9y/wZG2j6hMW
	x3tJNS8oA9eiwP0u9wgcu4opX1Ebsfcu4Af3CQ7NnLAgRCpFS4M4k96s8uvfznvjKmnKpoq3uJs
	1Lj07GunbxOs+fKG3UlFli0BXmUXwsPOZp5fHBOiqTjZFM9E9Gvbd70CisXBNcS665O4kWPnZ0d
	jFTMyma/ad8FZF29FeDQIwmt/zA2XnX3gO8PbGxEjkfgBV1Qbi2/D7g1qvgTnfLPACsrmWwTm22
	pMwP5NAi/IrDOOY7im9G/5Dhb
X-Received: by 2002:a05:620a:4248:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7c956f60603mr265150085a.57.1745487046328;
        Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYXB3qqSao1dvcIQQrC/bcdm4MO4pX3tX178JHk99SvJsxRtFn1KxSr1x2fmrSYlsEquMDTA==
X-Received: by 2002:a05:620a:4248:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7c956f60603mr265146385a.57.1745487045996;
        Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:17 +0300
Subject: [PATCH v3 13/33] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-13-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMvwZw2IoUGRGV6OIhReHxHfhgm4YrJasKj5L020giI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSsrXBB/I40QUDXp7j0Pla/+E9TO3fFw7wQC
 IshmHo6E+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErAAKCRCLPIo+Aiko
 1eZEB/4sSFKY1+3onz1ptOWEABhrbuoYH6l8WyhMjFTRKQLJEzl5fOI19kQvvs6fi7qA7Kb/fnm
 qPZOLtqlGi4VWE75FAqi7F8ymnxcFWihZvu/rBDjgk/k0t4uIjFjUbmuZa7mkzdAtYHOU/oRQwn
 KBZcHjR3f70lmuLUvW06LbWzVYT+jKk6F/EAKofVdm7DneGFo6Af096FbWsxxCWND+988H+WFIA
 bjNndujTIRnb9qCXz3UlfZgvDsFQrTk39+a7S8+9FMB9kiUmsfsrR7ADczNTl9//KVpI6h4LiIA
 mcIO0FCMKHuUmAZaiVcYlkxIpEyQyL9RzvnTAuyKCcGAllX0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX6LcO+c4yhRqV 13NcGfCNi8LYrKrGTt6vPxl4xll5PdDk4mDkPB5S/RKvFfhD4vokJhJR8MtPc3B7MMePlE+gYu8 s9612NHmXB/zNonp9Rd9kKaG+L+e0fzfQY4/xfrK1L7uIW9SwayyjEa53k0y251+7g8FpP30qpf
 nfD1+yO9kacaw+2/gNs2DT3R1feRR/V1dm8ABwd8AlXsa4ODgzB0SD3o8djvfK1uTW/CiHFDAhZ kDbSafwvEL2RnTKFi6NmUTT8NoMkrHjw+cW+OpvM8zsBJzf/XsRJIgXwKd8uWE7gxNXk1woBtk/ +IkpQZfZER0SQmQvkcpj5jQexPDDDOtlIMAHj2tcMgFVgwCIWhfiC/A6MBXtD7RJE1qQAc9YSLX
 +ajmVGbV3BLOPkfNRC89h/g2VR1VSlPGMH5YiycMSo/eOMk5tgfLId0EnlGxCIG2eD3c8bIY
X-Proofpoint-GUID: j1w-lwj1oyDiCChKE3nvHye4HaOmD0ZI
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04c7 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j1w-lwj1oyDiCChKE3nvHye4HaOmD0ZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ca093419059600f0ad7e1e7a0a4e443b977860..20f4700ef9969003cfa4728049b9737cb9eb6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 27422a5a340b90ee02f36a87cf1bab9d97504c76..36100e21135fba09fcafdd5d36ac919cd17f63c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5


