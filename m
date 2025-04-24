Return-Path: <linux-arm-msm+bounces-55316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D550A9A81A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 533734463D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07DD22B5AB;
	Thu, 24 Apr 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nonq8wif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888E227BAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487053; cv=none; b=jIvf9Z7tUuBFAXmena2f10SmXy9cskcIjS1Vhdc/f++RUj36NxVaj7f8kJvcHyercAMeS7IPhZ2ltKT8V6FiWwLFl9b+Xlbv5ZBWmX0w7zYZZk1WVyywd6M06OV5mlrCgwXRIq9/HCWx0fBfHi5EYeP0k5ICWqbhufSpERuyDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487053; c=relaxed/simple;
	bh=Uacr3JGWYtukIhw8R5JPc/xlbl+xhhFg6HvK7EGKgqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+pRZpFBHf65gDRXJSwlrIrSZZTHxdpE5hXEDb0Uqnu2AZk9l/2772bYm3NO7OaTsGJYEUyfJHi0XMn4zbx3Jp3I+FNfnq/NVV0cwwqUHQEF6zgtI/7aZkrNuAEtHpRhe4vrJse+4v8mxaQj8PMWZ+9FndzDTzHGCvcmW68qEyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nonq8wif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FoUL007114
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJipZcZZWH1q+GPZjyCUn13cwL4q5wMDd8S9OaXiPQE=; b=Nonq8wifbCmkLCqr
	E4UJ4AsWLcoudxwqiP4aRkSOfnjqjTWLPYtKaCH20w45oAIuuUhqAcQxaH4+eVDc
	WmKFgQyBfbrjPM1TYd1pTXSHgEhcKOU/CWXyClM7SADQ05ud2/iYIXTUGdShModZ
	XVhl/2qAZCnV8caTPO7FP4i4du36UaCpHgHCtsMqzl3ed7smU6JPMGO3Sc4mx2un
	H6GXaG8hhv4sKTmz1om9MFbNyKnhs7XA6gvsW5CMfFRRws6RLz2XpKtrGqAX6HQu
	3mhUuy3lNGomgL32187YruD9bhAT84/3HyMDDXq4OGDoukXGP+WYfq8i2fLK0sXC
	EigGaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0503s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so168766685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487049; x=1746091849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJipZcZZWH1q+GPZjyCUn13cwL4q5wMDd8S9OaXiPQE=;
        b=CFBaGhJL4jdNZ35pMiYZEM6oSWG4nzcnISPnXDNs86ekLIj5HhS2GhdrnQPgKntyCE
         HApV4gpTGlEuidJAWBkDQWcA4WbBOglm9Tcxtwr9qOgJP7UvuE5Eq9uJXqA9fGFiuyJY
         Gy70cdLtar/u2/W9qfZ6y8wD9JZNqOozE+RgyuyC0OAkF9cVIXi6Jc3XOxGv3Zdg0kuo
         ndvluWCKra9II4LMd1J88gVnA9yVkSjX8F2dMg2oqg8pAkR3wzAxqSVxJ00aX8MZcz0T
         cyBX3F3DpLFtp88SNdug8zkROgaSjZLHH+81OJI+gIvlQ6mdjmyA4FTr871BjZI+zW6D
         QUtw==
X-Gm-Message-State: AOJu0YxgQsSJAYXBFbBH8Mb3Kg8d86Fg5h6sy3Dxx6ijyL4DmGckNNlj
	BkwWLpzJVYtQoWytsUliDP7nR75V5ygUtzfe6kh5F54mh7Pb639IRn5jcm7Gjennw78fUaQqDDu
	J5I737BRR4G/WGcUdnkIM4qe8PVpAg5kmOPGha4lAXFMwt3a0QOnebueYg19eUjRY
X-Gm-Gg: ASbGncu4s2xDUSC3w/cNktGhUiP4PwfZ0Mjj12RVemDkxlvGlGy5mnEUVENY8oEX3Aq
	/QbxRkfpCwB/oOyNg8pAdNqXBknCFykP6bPQNOJUj4p3XLvmaOo4p0ihuC6NMQywZWK3CgJzIm7
	YLSiHfCr6Q4iwt9RU2npiaZftpyngpKI+GHEe31S5G8fyAWFCAkdfhHXR+VHrYvFzIVhvFwhqf2
	G+y1bmmkbEy15d48Bf7B2lUIWB9CxHZ5cBynKifWez+SqPHZeLCelGkxXwR9ufn6YB3iWcC2MaM
	wgk2BVgJMBvJOsQ4K6q8kxgPh57yVNNUq2K+Ff/l96jO7uRzHn1nd91TGKoNsSPFi6Tur11A2zO
	6iVlyQ9uM1pFyxH236xj8eY/T
X-Received: by 2002:a05:620a:1794:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c956e7d446mr326878585a.3.1745487049292;
        Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBQmRn7SKcjUSTbGIjxqsPY4wEMu/CWMSRP8MryisNW1tohurPxko9cDIUFwhuJlclwe9QsQ==
X-Received: by 2002:a05:620a:1794:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c956e7d446mr326875185a.3.1745487048943;
        Thu, 24 Apr 2025 02:30:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:18 +0300
Subject: [PATCH v3 14/33] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-14-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nt4QhnpHTNYrhzhqV0xbi5+n74LJmsNMY4VbVunyJu8=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSt5uuV1bwUk5DQ4vQkc/FrwRESt2DWna1p0
 zQoy8eeh6GJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErQAKCRCLPIo+Aiko
 1UZUB/dSUNDw61C3xWnyNFZGuOISsMOOeIDbwgFQ1wDsmxaKY820q07g40rgZ/jKh0prEf7XsmO
 C84OnR0tvenNeIvXZm8sZsdkRJNU020kjboki6Vqkmsax4Ep3wq7AO1EKashj7zmJlOD5iUXmGC
 /fM7entgLttcNsyxwhK515VCsxvazBjGD69tk/9xPDmrje/LPtvt7APsgR6AvjHuWBpTVV9A+wS
 kLTvq1xTz5KU/ZlLtsOgAB+A1tgJytgfIvqL929trBGoE+no6fM4G9YMEE3PIyLBT9xAbDw7PDg
 0gMgrV1By9pnPaoOvSuU61HaZ0ap1pb0iPeLu43FByx4Vto=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8DAqJMhu3/zz QEzdcmlN/6r2qPCYnFYbL5AmbMeN4Nr5l8eh25lqWpwGQo+dTTQTj7K9v59HvTRRxdPVftk/A9q JNx7RubJHWN7nF813TPkUyyw1zl0T1iVe0kcuUgG3vI0MsgF5eYRINgSVYecUAEaRnBoJgDOeBQ
 splw4TUijoajTO1v1bWz5mRBKz+0IzFRkC3OXF+bwEebjUOPxpMZvhVTScH+YlpjVrEwCfu22oN I+lreMnS8IbxHxX/mUSnlmNiPHvoj9RJfenrbC1YdADX4QcYSDBrFfMJ6TbQTv6zss7S3tF3TiF 2/45hLQRCxeNBJZwCqpqb3XzxkcBO/Xl53eeXwWeJgwddAWvrRpiEz8kxVGEN+R/OgGS/PZxnPk
 X1wnMlGJt+b3LcTQDtP5Sn1LnYi0ZofUmhL6A53QhO3JUQ0nsmX88JE2Pimn/WViqBZEucdK
X-Proofpoint-GUID: T1RszEuXY3L6-YdDCIRoz94l3QvBav8y
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04ca cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=z6iiZyybfqEMMI01lysA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T1RszEuXY3L6-YdDCIRoz94l3QvBav8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 20f4700ef9969003cfa4728049b9737cb9eb6229..8808be27593b303a2a199a740827c92ea5339b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 36100e21135fba09fcafdd5d36ac919cd17f63c0..858fd73e0ac3a92fe402001d4796eb86945f61b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,12 +145,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5


