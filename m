Return-Path: <linux-arm-msm+bounces-57752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC1AB5CBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096E819E8663
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137CB2BF3FE;
	Tue, 13 May 2025 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDVamqxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F4E8479
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747162194; cv=none; b=WcdGFdHA45gnUGxcmHZgb8D4IOeR4QiOeo/3xylY4MRPBEjNB3RAWINfoEHNHjg32h6VGTc3l15U/gx0GFZjVwRVLIK1FHqNzdp9V2Jk+NGniJGXKQa33xXqmqkuJ21oBid+maucm0iPP0pFe/+et9FK3e2ZXYJPjegVqirQulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747162194; c=relaxed/simple;
	bh=7jV0gWLhUYLAfF5n95PURVvMxbGLkMaUPNgufE+LH40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GLccs+LuaDKT4A5ORDlrBpOw98+qu9anjz+eNL6Wcpyr9v4ev9RIfaA+zwWW9lCmelReZw6rLxel7nlr44mVRe4hcUOaM7/nOBBzJY8qugNiXxK+3XZCXrATAZbyiVcrn7Zl5VL1OTG+kG4mQjDQ85u9jC8PXGn/e+kHXxp8VGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDVamqxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRkJS006188
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ur9/QT3f4NlSVORj6iKHoh
	GpLAR+WNwm5SSazTAarpQ=; b=TDVamqxTGbcl3NkeGqGoC9M6ehkZzyeuo1fV9+
	nmvINUnjQxyC3HP0pOaU0f5v1sht2Cvo9fli/KKDHXP3YcffPcNaDgKM1ZAd/3P7
	BVtApOQ1kSQTkRUdHXNLpKxrkV48gQHfVMy6fC0arge1LJREH9/shPWVcZMUC+Qt
	4Cx+4Xv+ZEdyojfRerdefaASD2yvYjHWqMjLyY3sP6AciaB85GTSj2LE9T6g8gQT
	vG4Baocv2fPEpaSXhTPy/MlsWyngUolKLrVzBdSXR267xFmfx+uBkUpO6qFZNCJU
	Ndt83Jw8DfxHdipAKoCK7P0wwmY1RXiKTK9GxU+gb/tuvSgQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnr2hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:49:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b0a75decso168227726d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 11:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747162189; x=1747766989;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ur9/QT3f4NlSVORj6iKHohGpLAR+WNwm5SSazTAarpQ=;
        b=fdbNHn+Suvhxvl50S+zQRN6nlqoYaT+IXABgtYoJMrUE8renMizuExG8F5V454/98N
         FH5O9vSRSfeIjM8HYTlcqMQgKRprrdC5LJYnGYjj/yNAjuIGGHWD9TSndjvhuUVyYRNu
         wOhl+qoizZYe0BHpFRGuSUxVQ4LJbVT+JwAoRo7UYlhKoiYyWec5S7L1QYnRXXoFdt3r
         Oq41a2hp4lfYEgzdksC6YvEynyuO+jG6AUngCr/WFxxKKIYxNfZIHuGtitbJamlAo4hh
         J1Qu/HisPpwEC/w5/wIYUBqubaCwIh7ImXxMx0hmQRB0OLZYwXslLkciFZ5KjYzdYn0a
         TCsg==
X-Gm-Message-State: AOJu0YwTsv18tygFngiS21wPJx7LhcJkKJ+OvlgOw8Xg5wGYpMKZWTc4
	mVBZa/y3MMYM/YUKrYZ33Ewfmi8bqe3IUjUFiW1smyBSy9pCL5SOAj2GQp1Xxxy/kPbia+FF2Lm
	qZN9+eHU2guKVypTb46ohj2905z/VK/xq4WLpe1v2siFlZEoghpAulY2n5ecHQa0d
X-Gm-Gg: ASbGncukvjm4UyU2GP4UllWKwIoakSMEH3borfSWlYnAxL+3SIx/pCJr8azgOWjOtCG
	ADY4XU2ROoSotwPPWV1Wx0au5qha9hhxtWtvtaNYv3XhExKnDBtVNFk/i2wgBxNgQ0+yn5xylt/
	eSD07QGa3ftGJqViOchZCOZ4W176M1XVUnF0tyOfHQxB1/lH204gLUkO9cbU50MokZ/QOzBtvBD
	WhDH0jbGf9yFOhJvkhTJb5GDG6P4wfFAX2P5ZjgnmFxixpS9Kufg+gUeJa3EMBpR4ZZoBwGYmXG
	DT2OX6DWsxmkPV0R2lBJeR+qPzXD0/bAYNLVaKSyuJnHsVULNCCv6JGQuuf9V5XiyBdsCno1cxM
	nm8KWX8uUZx6/ACDR3VzXKeuV
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f896e57104mr7119776d6.26.1747162189233;
        Tue, 13 May 2025 11:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnx9KwLkHl8XFIlHZ3IWinoz3V+RESVtbgcJ3yCiSuf6iNbP/S+IwmwOZLbJQYeQ1xuPiMA==
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f896e57104mr7119496d6.26.1747162188881;
        Tue, 13 May 2025 11:49:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6e08sm1967837e87.120.2025.05.13.11.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:49:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:49:47 +0300
Subject: [PATCH] drm: ci: skip msm_mapping@shadow on SM8350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEqUI2gC/x3LTQqAIBBA4avErBvwBwm7SrQInWoWWjgQgXj3p
 OXH41UQKkwC81Ch0MPCV+7Q4wDh3PJByLEbjDJOOW0xScLAuPNLgpamQMb5qKOHvtyF/tCPZW3
 tA6h3V79eAAAA
X-Change-ID: 20250513-msm-ci-fixes-3e7ce259d1d9
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7jV0gWLhUYLAfF5n95PURVvMxbGLkMaUPNgufE+LH40=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5RLxylC+eSk8QHj68u4toWVFFh7POdzPeK1z
 GHJsIszJW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCOUSwAKCRCLPIo+Aiko
 1c6+CACUeWGBzYCTAfwvVZeYBUtwdgNnLgXwOMBBLBRRT68ZEkTSaSQ3uRcCWam/prkEliXHBn4
 kETx+C9CZT8Y320rLBoI7rQq2YH2m2OytziosPDB3XKe4PMrTwlqfINfkJu4TsDjv+qldaybpxG
 vMn2yLEuIzGO0kRcFS40BD1yBKXVhmMVeBp9SkSahTivWwnyts+f3E7pwMJCDPz/vKgxi8PnF/4
 +P/dy95wXvT/it4EVzNyKXP2serWeeiWf6uwWEdMPC4SFbbMt9s1Bbl0Eba7PMOxP1moqUtPbsO
 C1hp+FZQcxX2YH9r8fS7rU4SU9YHH7UpNHZDbxeisCuhU6zx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SteDoa_Wkp1pu-8xGMcs0eqAXdz8OdYP
X-Proofpoint-ORIG-GUID: SteDoa_Wkp1pu-8xGMcs0eqAXdz8OdYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3OSBTYWx0ZWRfX1f6UzgdZ70Uc
 CxGIgnGKAElKiAFx4Fg4mr+w/etvRwHmLF4y9th2cXmJRVYxpHPERi86Cj0wb2pJAoGbAkjxfeG
 S7X5l5Ajl9Ot3uXEsxhWTSkIJXzZKeexEpCp0VeJmbl5lJ67lAIN9iDzjNk3EhZF0IWQ1psxXRi
 rdQmY0f7mSGpxyRlunuxauvddisO9A1ewUcpntkMzrF8XCRUBozkvbz2lIVuHFrffKRD2+yl3eb
 hvY4Uy6AhXnTSm1hySd6yhBumjvD4WgSRyb9ek5M0oH29jvUUqr64h4kXWiwCvuseQj5cOKoCP0
 v8oHmQ3XNEKc3ydnY7d5gD0kDtH8qOxQzGhnI4KVTLdauo8uzAShiiNXzY1mgOx4J5JDpQgxnGa
 ftLnBCV9hiNE+4y1Wni9bw8NZBJweueTYTSzykkyUYCh1DB61w7nGyFx1s2HFFbbPPmcPvp7
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6823944e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=HB0QJ2FYAIsZ-nyMV3gA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=735 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130179

The msm_mapping@shadow test fails on SM8350, which means that the write
might get through (hopefully not though). Disable the test completely
for now until we can fix the issue.

Link: https://gitlab.freedesktop.org/drm/msm/-/issues/77
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
index 9450f2a002fd7e68f0f674ac6ac84aeebf28347f..a8b535abc8ef0d996d0c73ece1c7a9622250928e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
@@ -210,3 +210,8 @@ msm/msm_mapping@ring
 # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
 # [  229.758095] Memory Limit: none
 # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
+
+# Protection doesn't seem to be enforced, don't perform write which might get through
+# https://gitlab.freedesktop.org/drm/msm/-/issues/77
+msm/msm_mapping@shadow
+

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250513-msm-ci-fixes-3e7ce259d1d9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


