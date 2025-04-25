Return-Path: <linux-arm-msm+bounces-55594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A209A9C45C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED629A7FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C26023D290;
	Fri, 25 Apr 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9ujEnMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF2723BCE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574723; cv=none; b=RaWaFtORgqQk6iOex7sbZKsvk0vHAUV8XYVCSE0xoZvi8YKAOOqLW17a9IdTzoo/WNiIdi6Mwnxhnb6dVASoUdSmuvveR3kFmqwBVdWVpBUbhIDViaBCOu5rkOkM6pZZRBirizMszrG40rDQD2tmH9XYwnOY2ZDFWeFohzQyfD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574723; c=relaxed/simple;
	bh=zx7+dSoppSMyESrNu3BFwk2c2JYSvOsmkYctkDdBx7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUi6VXHxNShuSx7S8JU6Id0oNdqGX+kPd0LZySmS6t5f/arOffrA/t+EbcEuMgyiXMOzPykNT4molMPMlqGZa23zn+dwnG5Pbh5YNvfQgKLaUzfYS+I9VOAuEycoLubtt0Oe2/8Bgl8bJFtRwr/RbWuKjQ4adD9TmvWFexh33GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9ujEnMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7b4030835
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=; b=S9ujEnMQR65qi47W
	HroSG4bST6eVXaxvIeG5r8dhhrSiZnEwFALHjWXSesZ21v0H2tEfaMpf2hPn8JKe
	o566I70ANHDNfFeIMpN4Kw0vp5Sh60cAAXTjpieLbeb+/Wq6m/k1YPD5fOK72Nqz
	DCxq6jSVvVwJagGU/2kk7RctbFx/x+Xn056EvcTS0CfoOJmsdjggz0FB8mRaxNP0
	OCcieAbc2cMV6IkVMFmBea9qud6nLRuGu3BurbSX6tb5mBPUYAHAzR6gOMlNklxZ
	jue7t46m21kJV8ZoslxemP1g4N5RqWENOir1RGoxK+YmNp+LNriF8UZDgQJytQZR
	DObfHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gjp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:51:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c8f8ab79so301205185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574719; x=1746179519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=;
        b=NNnhzg2meDrtdRFktlrE5OdwQNRlpOB2E94/xbTlzWRV5Z6/An47yLCxVpnOdaelgc
         7/YQfZl6sHfnWhsqc3TKofNOxrBvseVEiZlmvI/IPEmRZlCI5HG18xQ9K7pHJzIE5ucL
         vEVOZF4TjbyKCX+2BjgwOCNXbH+7wuS1UinpG3r0TG6eyQBkL3397tAql4cPQqhnTXhR
         M4dFqdmAiT4bYRL4LL3hRb/s+B61DjtTQYYmWvem0DSPSy3R6y1MnBvBpWiKgttDu38B
         bajO4xL5+w/9U3B7J+tvodX6q8ta1Jc8NYYQ4EmnNcAe7QGyG8q9SwLn5vx0l4NA6jmF
         7ciw==
X-Gm-Message-State: AOJu0YxsJKNtwz8LWB26ZaWQ+U75AHHKsDB96eziTpRoDk4o19fmMSsy
	FqkEabwZEYhzTIUEG+cKILR26qgc9taMYPIhFUppuaUT+g+1HHoH3yBMg16/SznZOA1McaoqVQw
	JaTIqNtFbaZx0zQdOkUn62je2QNk8pNiNYPfe6ogx3PFuGRbALhluQPziuOti+qVL
X-Gm-Gg: ASbGnctZGG73BCfCHLwmYwX9hG1z4GjgAitZmks/zhiia0yVgf8Fg42l3uP7DLzXb2H
	DniHqxcPr/RNe/q/x5qTaUShdYu5FnybEpOM/tBfZmfaQBMWb5rxkI6KTBADxwQkOH4Y931TEdE
	Q37RmWsIUhUMLgVDvyTyzZ9+SawkPeOiZFubDZpqEYD6w0r908Owf5vLxS3lZ3Tjpwwx6VZ3s4a
	EZxbS5CliHLCIrGBu23qA4zLRjnxwHhHx+g+nvPcHyrbt0mA+TYakPE6HJ8/WolkiCxOCBjz3BW
	JFE1OTNQkCHjq8YK+cXwEaAv75JpW4nIYni5VXwXetWmkWqhL0eRsVh1UIBWUh+gdFTrvVNVCl1
	dknViwIl6g8YmTOhF15BQ5CDH
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id af79cd13be357-7c9607ac4e5mr267489885a.50.1745574719228;
        Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmYWemUx6sBPB/T3b50nXsfecUg6EReTeevtS+qwLs/fKOYNGbkFlAmCHLkfS2+zEw/XB0vQ==
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id af79cd13be357-7c9607ac4e5mr267487785a.50.1745574718908;
        Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:52 +0300
Subject: [PATCH v4 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-2-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jcu7uq6H+6YPyRALgxceXQ2tUNztuo1HlOXKZXH06DA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5U3r9aVtf/3nh7d3cM3tjHy0GNVxGrgrty
 ABAzdzfrgiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1RSiB/9bNTmnNuezj2sMP5aBdfaObPY0aMItydxeikXSRb/vuIv409ORenKD0alhIeO695iE8lZ
 aG5XdPUWHO9fgXhk3Iuoxbuxrke/rAONsRKGZc/9lP5Cc/gIG27iuLqTcCd6aGGdxiA6QegYMVK
 aVQhcrHrsfGfCIzaOueCHAES5+IThttFM6yWt9Prajk8UQJ7WDcF0UjWQsQe1fN/QquDJgTqAer
 frSmwKpldbpltLgT+QZysn3Nv8m7wXjSqg9pRpBzrmnHwz39Ep6rRk7FlUr5b0I6NxBvVcVfZvT
 OI79VECVQEcvGp2ACXiZFRqyn94aSdIDp0KjjUupWPN/3uXn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX3LJAJqFUoqtg h1cFx9/F366xzU0N0GN0HPu407coKlHMfoNwr0AyXxsi8ekz7vLee3qG+juLVRW0XY4Y/RPHYKc e26dIiR8frLbXEJ3qsqXIhlknG/Ov+Mem7/UueVLBbpeJ6Nxkyt/7L/V5dqBizthYGeXAlIuSnb
 TEXLHRdq0aCitg7R+6K7JAHcIyvTyH6Q1jBBigSDJ6Ueyy0Ok25ewVBA2dLcyCoFpvOKrNT2qOk 6AqZVppBbXtC86xYX7QldsF5YsqZX9L9mBEZpriz/Egi4DucYUK1RgQpbs41A446o5CWy5nhXYc SfUtP6zzrlazIq49E4zn8kKHAWl98ltRtzxjLDMoBMh0j5wuS+fKTn2Oyo21bDgnVcLYiRlQJeh
 z7INfN9okVga5yDY4D65uce74qmu/fTNhhy2IKDiKXA/UzgocpJC9cIlpe1yS4jZYvCq40/V
X-Proofpoint-GUID: 26J3ibgv1jOmNRKvYuWvRwqJZV-Y4x-o
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b5b3f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QS4NkVPmAqbJGmbYc4kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 26J3ibgv1jOmNRKvYuWvRwqJZV-Y4x-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5


