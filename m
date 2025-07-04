Return-Path: <linux-arm-msm+bounces-63733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A91AF987D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540AE16BE3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABF2309DCE;
	Fri,  4 Jul 2025 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/BwV/uF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA61E5213
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646933; cv=none; b=FIhv2jgj7Ngn+BOdxPDwu+pvloQ5z17XOARAUwuOUctMbpRRIVORJexSHrsyOrbL4IbfzfNzvXlXgPcmV19f3NuIFUE9YbdroXlRyBPN5eSBZhXrqgL0DraUfVAFHUyHDQ9aMCBFzjozw09D5O/EYhBCONuU7aHEiIypiHlTWbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646933; c=relaxed/simple;
	bh=Po3uAnbbJQfcOJ9AwjjvOgDGl5MOefKiXSjPVGg+duA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IQG5VKUa4qAD43DeVgcDIRDspmrNB2cBa4xwNS4BamKpLVnp0Sn9M2ynXYbUCNB1bwqDKf7RKDj+MUQewDUvKIpkTNkq5PDruXxUpRiv3JnXb3PnKLFZ6etoS/sstJiO5QcU4IAsDJ5ZSvJI1TLfS7WhqVAtHkrgF22tE+z2Dkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/BwV/uF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564GYa4A025201
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x+uc35o7ZAs4x+Vhq1bn38
	TM/2Sgai0URazaa2yZZXc=; b=D/BwV/uF50S5g+Rk1bn+6iA0qx/6gplbGT3crC
	QEYgxGelFN8srvoM+gkJFkE62cyv1pG1dttuxp1xuX24Of9wRTHBMOzW5gDTbFon
	gFYQs21sxKJrJaF8O8cAIhbbtYpuBsnyZuowuAPxC+JI7GgN5hFNQpIkOPZQvzBk
	V0fXyp40jDnr+VC8n0cNOUd5FwGycpU6NW6w0aawteZdBXQhm1mHCrcH2fg+TAH4
	DHfQDxeneZ+h3WINUw4My1L+5lptJR8n+hJZZjS41hcFDhc2c8HRKrOPDheV5ofL
	Iz9bB4Uj+N32Ow7etd8TyiX6CjXW0pM8QJAsoawsY8blSUwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd651hyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:35:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso162507985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646923; x=1752251723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+uc35o7ZAs4x+Vhq1bn38TM/2Sgai0URazaa2yZZXc=;
        b=g3uCag29rgk3ZZjnF0oXRWTsEj15fkG6/trBXZXDjEtRwSELBvP6BAnwDVNQeRxPXa
         JrechqPc+5yDCExfZxjqh22Sr/DHBq06SIcTc8ZyzUWiSlY0E0eQrhx+S3HnmYkv9bNP
         TolWyTpI4c7+qt0pq+lgR9bOIY1sddi06m5khHLJknTJc5gzY0URRYKxGRXx/0ATGY5R
         AMnKwRSyMXrkpZRHp0Eh5NrcLSQhGk/AavJkqzdWXWp5//Ts9Nr0FzX8LZsCeTMql9lS
         iUhSU4mzCMVyjiuKpm2R8Hj2L2/42jyYptLBAuN/89pjDv3Rt75q8VvaO+uWCUk5V4wy
         MvWA==
X-Gm-Message-State: AOJu0Yyk95J0qq3PP5Dg7Hkw04tp4GZgeKOW13EMiR3CMIxjbvJkcVzM
	hRgn4xNu6KpR19J5L+plPFCjqs2+teUUMJFOxGo/l2aiagFkQnjKD2tNqUu4HufYzhvav6jdBNy
	xJ3T8e5yvEHUXCNVmOTxtXLY/Omvw2EEyuIEca8ZFj6lFn2CeSTChl0uzSthW3Lf0kbBS
X-Gm-Gg: ASbGncsAxsvz0dZDcp1UQHpvMqQ7UAf55s5GOPsbxsnPuRV9yCXF0nvI9eSh7kdmRPE
	PIPzMl+qSIyr1L5rumCttqNF2Bt1HpKRZXS0j+fg+7nStF+48zAiYscewstKOk48OyEihK5WLuN
	purq+qsf3CqCEO3LelzQTdqLO8M5pjNK5gXDdHvjHQmm7opz8N5M03VdSMK/eDp2D5zYcjqAh/6
	TxqrPkA0T9U8mgFOG/obn7ZMSt+Ek1B2kbPNwgruhmLiSYxXbOKE4y6Ngu26lyOIF2GEeTx7v1I
	Z7cBg328GfgjeM4lteYqK6GndzRbmWab7UYgatWHNySEchkbtXvhWlsdHG4q/Mwtmp4fYYkq0U/
	kZ9/dh522bf7/Zqd5FLqD2v7OxSD20Kbz9HM=
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d5dcc7295dmr437630885a.12.1751646923033;
        Fri, 04 Jul 2025 09:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQf8t57Yy79UtDPPVGPKb+uYjUJ6VtqYRO6eocRU7Sq95hkq8WDUXdXfwQHNnP+4vGWZMFKQ==
X-Received: by 2002:a05:620a:2915:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d5dcc7295dmr437627185a.12.1751646922586;
        Fri, 04 Jul 2025 09:35:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d33f3sm298321e87.68.2025.07.04.09.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:35:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/28] interconnect: qcom: icc-rpmh: use NULL-terminated
 arrays and drop static IDs
Date: Fri, 04 Jul 2025 19:35:12 +0300
Message-Id: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMACaGgC/02OQQ6CMBBFr0K6ttgWbYWV9zAsShm1Uah0CmIId
 7dATNxM8iZ/3vyJIHgLSIpkIh4Gi9a1EcQuIeau2xtQW0cmgokjkzyjHt7OP6g1hrI6q5RQUqv
 8ROLBy8PVjqvsUka+WwzOf1b3wJftTyP/NQOnjFaGZ0KK/FArfnaIadfrp3FNk8ZBynnTe+j6W
 DFsP0ilEegSsqFIWhjDvtEYwMf8/AXxTldm2gAAAA==
X-Change-ID: 20250613-rework-icc-0d3b7276a798
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5598;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Po3uAnbbJQfcOJ9AwjjvOgDGl5MOefKiXSjPVGg+duA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaALE8yCzNhw3/zTB2MAdpwiQlGQG4bu0xxob0
 cq9Z93tUlOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgCxAAKCRCLPIo+Aiko
 1czFB/96HwsiGptRvOgP15Z2sYwphRfPTxhO3NcZg1F4G9OXZA2oFymEffyjC7eKVYgKqDHfqKK
 +3HWbvmZw5PoNwgtY8htkRUQOzvc2+Lj6SgmYOxRCuEV8TxRSyZCEgEbHKcqtp8ylaVANKY72Pj
 /5fNheiejelgr6hnSgAGW+vQwx/F9AUBS485inlZoR2MeMfTgqMLBVtUDGKL8Hfo7SnRlzc+kg5
 5+I5T3+WazLUJ5YfnhiHb/YFjq89raluIU8Nvq37XRhzn8YbkIKJXrP2WeGxNjY7AsHKQoxQfvr
 AJEuzrnOHulF2HD5xwQdrSiUrHxgZU1yD7ZOyMR2fj8WkFfh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=686802d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XAMh8DXI7HpmVRFZxe8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX8tK2iNIZRuCW
 IUbZKGk5zGUkPiLT1olnWdYuZwxosE1Lqk+j/ULlZzOwMoFMSil8fvlk9Bpl2qbIRV2nwFkwWYR
 3LBGXt6U50WhurbNaaC0GkaX1q7mtyGWt80GNw5ceosoVG1OJM4SzpGkhC8Rm1ZYiNpSdquFD2T
 R2SxXn7oTFWki00v/dJu1wgVVuKyMYv2RNGerIwwBwONYEaKLcyNch0Gkbb2jGngB4zXTdZVAG2
 j6WOZlTryT7hANvOFzemcKW28GIuuViHiKOVs7rRJjWv+hmows7sX6cJZZzzMGsxCjX139yjhJS
 0ZHGPl9RDgmaEIYFbyNDPdiPIpbmuB1KXQrNSCdww8wFfzR6P6xKIi1oUUR0TYIHSrOu9bPMm3p
 OKFwfDa3IHmaO6A/xkQbNkY7gq5MFMALjitO/Syd9KV1WXoD+cb25MDm3DIjjKREU+1ErWXW
X-Proofpoint-GUID: Ih9h1iaxsyJNLKYtWTd_L-tSlc_RC6f3
X-Proofpoint-ORIG-GUID: Ih9h1iaxsyJNLKYtWTd_L-tSlc_RC6f3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=624
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040126

Qualcomm interconnect code has been using .num_foo fields together with
the arrays embedded in the structure, which results in hard-to-notice
mistakes if .num_foo gets omitted or incorrect.

Rework RPMh interconnect code to use NULL-terminated arrays for the
dynamic IDs case (as now all the arrays contain only pointers) and,
while we are at it, rework all the drivers to use dynamic IDs and drop
static IDs code.

This series touches only RPMh interconnect drivers. Corresponding series
for RPM drivers will follow up shortly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Rebased on linux-next, dropping applied dependency
- Link to v1: https://lore.kernel.org/r/20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com

---
Dmitry Baryshkov (28):
      interconnect: qcom: sc8280xp: specify num_links for qnm_a1noc_cfg
      interconnect: qcom: sc8180x: specify num_nodes
      interconnect: qcom: rpmh: make nodes a NULL_terminated array
      interconnect: qcom: rpmh: make link_nodes a NULL_terminated array
      interconnect: qcom: sc7280: convert to dynamic IDs
      interconnect: qcom: sc8180x: convert to dynamic IDs
      interconnect: qcom: sc8280xp: convert to dynamic IDs
      interconnect: qcom: sdm845: convert to dynamic IDs
      interconnect: qcom: sm8250: convert to dynamic IDs
      interconnect: qcom: x1e80100: convert to dynamic IDs
      interconnect: qcom: qcs615: convert to dynamic IDs
      interconnect: qcom: qcs8300: convert to dynamic IDs
      interconnect: qcom: qdu1000: convert to dynamic IDs
      interconnect: qcom: sar2130p: convert to dynamic IDs
      interconnect: qcom: sc7180: convert to dynamic IDs
      interconnect: qcom: sdm670: convert to dynamic IDs
      interconnect: qcom: sdx55: convert to dynamic IDs
      interconnect: qcom: sdx65: convert to dynamic IDs
      interconnect: qcom: sdx75: convert to dynamic IDs
      interconnect: qcom: sm6350: convert to dynamic IDs
      interconnect: qcom: sm7150: convert to dynamic IDs
      interconnect: qcom: sm8150: convert to dynamic IDs
      interconnect: qcom: sm8350: convert to dynamic IDs
      interconnect: qcom: sm8450: convert to dynamic IDs
      interconnect: qcom: sm8550: convert to dynamic IDs
      interconnect: qcom: sm8650: convert to dynamic IDs
      interconnect: qcom: sm8750: convert to dynamic IDs
      interconnect: qcom: icc-rpmh: drop support for non-dynamic IDS

 drivers/interconnect/qcom/bcm-voter.c |    4 +-
 drivers/interconnect/qcom/icc-rpmh.c  |   20 +-
 drivers/interconnect/qcom/icc-rpmh.h  |   13 +-
 drivers/interconnect/qcom/qcs615.c    |  713 ++++++++-----------
 drivers/interconnect/qcom/qcs615.h    |  128 ----
 drivers/interconnect/qcom/qcs8300.c   |  911 +++++++++++-------------
 drivers/interconnect/qcom/qcs8300.h   |  177 -----
 drivers/interconnect/qcom/qdu1000.c   |  470 ++++++------
 drivers/interconnect/qcom/qdu1000.h   |   95 ---
 drivers/interconnect/qcom/sa8775p.c   |  493 ++++++-------
 drivers/interconnect/qcom/sar2130p.c  |  795 ++++++++-------------
 drivers/interconnect/qcom/sc7180.c    |  892 +++++++++++------------
 drivers/interconnect/qcom/sc7180.h    |  149 ----
 drivers/interconnect/qcom/sc7280.c    |  840 ++++++++++------------
 drivers/interconnect/qcom/sc7280.h    |  154 ----
 drivers/interconnect/qcom/sc8180x.c   | 1013 +++++++++++++-------------
 drivers/interconnect/qcom/sc8180x.h   |  179 -----
 drivers/interconnect/qcom/sc8280xp.c  | 1257 ++++++++++++++++-----------------
 drivers/interconnect/qcom/sc8280xp.h  |  209 ------
 drivers/interconnect/qcom/sdm670.c    |  712 +++++++++----------
 drivers/interconnect/qcom/sdm670.h    |  128 ----
 drivers/interconnect/qcom/sdm845.c    |  986 ++++++++++++--------------
 drivers/interconnect/qcom/sdm845.h    |  140 ----
 drivers/interconnect/qcom/sdx55.c     |  611 ++++++++--------
 drivers/interconnect/qcom/sdx55.h     |   70 --
 drivers/interconnect/qcom/sdx65.c     |  577 +++++++--------
 drivers/interconnect/qcom/sdx65.h     |   65 --
 drivers/interconnect/qcom/sdx75.c     |  498 ++++++-------
 drivers/interconnect/qcom/sdx75.h     |   97 ---
 drivers/interconnect/qcom/sm6350.c    |  838 +++++++++++-----------
 drivers/interconnect/qcom/sm6350.h    |  139 ----
 drivers/interconnect/qcom/sm7150.c    |  860 +++++++++++-----------
 drivers/interconnect/qcom/sm7150.h    |  140 ----
 drivers/interconnect/qcom/sm8150.c    |  930 ++++++++++++------------
 drivers/interconnect/qcom/sm8150.h    |  152 ----
 drivers/interconnect/qcom/sm8250.c    |  977 ++++++++++++-------------
 drivers/interconnect/qcom/sm8250.h    |  168 -----
 drivers/interconnect/qcom/sm8350.c    |  901 ++++++++++++-----------
 drivers/interconnect/qcom/sm8350.h    |  158 -----
 drivers/interconnect/qcom/sm8450.c    |  823 ++++++++++-----------
 drivers/interconnect/qcom/sm8450.h    |  169 -----
 drivers/interconnect/qcom/sm8550.c    |  683 ++++++++----------
 drivers/interconnect/qcom/sm8550.h    |  138 ----
 drivers/interconnect/qcom/sm8650.c    |  713 ++++++++-----------
 drivers/interconnect/qcom/sm8650.h    |  144 ----
 drivers/interconnect/qcom/sm8750.c    |  779 ++++++++------------
 drivers/interconnect/qcom/x1e80100.c  |  819 ++++++++++-----------
 drivers/interconnect/qcom/x1e80100.h  |  192 -----
 48 files changed, 8655 insertions(+), 13464 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250613-rework-icc-0d3b7276a798

Best regards,
-- 
With best wishes
Dmitry


