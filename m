Return-Path: <linux-arm-msm+bounces-32981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919398E892
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 04:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0D0287BB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 02:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D77017C9B;
	Thu,  3 Oct 2024 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh9BdgBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73F1DFFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924323; cv=none; b=Tqn1XB4W/8BHAXiXwha211PtqiSZ/ikGl9Un5hN/CA2XPqa71TSHIa+SzeC5YyW7QjQEusgjBe98lviZTwMvrmdAG7BJgMRROge8j2qQZxv3/6O0Yu6k0+pXPuHeiTey7IkFwXPuBSWw6W32TrAlK83bR4C/VwloqAAEkz+XGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924323; c=relaxed/simple;
	bh=bNYddmgsyW8zpJaljT25nbUCMx0j2dCKdXD1Dvmcx/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R3DD8BuICVk3uTPmmBCrH1zEchvVBQ6OGqIdEMkWNHboh6rU82qLduLeqJsqHNX030sJfIKcOVFvmQ3PkdSU+RqRpQCylvhnhgA6MEu+xyiKWVxYgT6vj8ih9gIBEFr0/uOsuzMpq63wlPjCGMOs9Eo5QrYh4ImOwOMRrQNQF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh9BdgBq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4932nud8017446
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Oct 2024 02:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q87Q2dHuDJxAM/tFgGrfhU
	NvO2zsd1XaxZiQ5xUbYkI=; b=Xh9BdgBqed78RooLrts88+5MfXP1B2E+kA59iY
	fTdK4Ao/Fn6AsaJ5v1uP97tglHAJkFD1tvxi+EA3OV9chymXuzTI+vsEOqKaCDjK
	HDETzGokqN5rp8lyTUP8qFyfp6JV+sI0g1PxvrreKE63zJGd4osqtV8tAbkVa50Q
	OTJZui/ekBfeO3BJV5mAKuGOKder1ycZRATijHx9QqC3CigVgPtMylvx6ocXbuLw
	lb4cLYlq8WxTbh2f78ULFELF00J/8YAb8ywcUM/Qngvl2edn/FoGqRtyj8xvojuB
	ndsIyi1N8a5ALnbyQcrC+tJf6ojouxh1N7r1XV21LuvwT3/Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9cyn8m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 02:58:40 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-286ee7c6d28so400421fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2024 19:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727924319; x=1728529119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q87Q2dHuDJxAM/tFgGrfhUNvO2zsd1XaxZiQ5xUbYkI=;
        b=LVSBOZdJWZjtAkVHjxaX32wHGfP6RU/W0HsP+iDVEj4WnO0cPeyj37RsdV4NfrMqk8
         X8kkAoBXhF1Yr76OI37smwVKnh+ThD6tWlqs5g11ldxliLDCB4avYNO1vTEyyeFGZh7a
         z2f/Gp7PkDCwQeVv7+/HKIzFLcGxX3q0XZTuNfhSgELjFBbJq3IPQ3UEGQQvNshn4g0F
         08N8nDqeK8jhYOjXgNMvv5YHbic2CJwGbdMuWiRV5x8ooNI0IQMNQaVPRwBTEcZl8LUi
         yIkKHlXl8julvFSL8mWM/AXBfT+6jKhdM9daxWVDE992fnaNUNXxu0waEJzS3ZuzkTo8
         Ffmg==
X-Gm-Message-State: AOJu0Yy2jxKZQfzb+DhfH3i/5HzEhzCVGKpFsbvLJMEn8b8tknbbwar5
	UgZHiCmpnGoL4fH36jghfdAfETmoKYVoS9JJOX2uZ/EXFXBcGPH8R1S9Pw0Pq2kO+Fu8Pzz76bQ
	NE3I2xMRpkgV5g1f3C/nKG6+kqXRpB250tL9cJlyg+qIXtUGGD2aOJVqCCJbNhyf16xs8+cgw8Z
	OgPcSqIX8Tp+4y
X-Received: by 2002:a05:6870:a551:b0:277:d790:6e99 with SMTP id 586e51a60fabf-287a404ebcemr915315fac.18.1727924319179;
        Wed, 02 Oct 2024 19:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg0JvlIROszA+vBjdJya8knWyGhXAkKydvC9LIezO0qqNQPEf4Qksob0bkVhdDzfAP+Z9+3g==
X-Received: by 2002:a05:6870:a551:b0:277:d790:6e99 with SMTP id 586e51a60fabf-287a404ebcemr915298fac.18.1727924318822;
        Wed, 02 Oct 2024 19:58:38 -0700 (PDT)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-287ab9b5ba5sm188924fac.21.2024.10.02.19.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:58:37 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH RFT 0/2] drm/msm/adreno: Setup SMMU aparture
Date: Wed, 02 Oct 2024 20:01:31 -0700
Message-Id: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsJ/mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwMj3cSUotS8fN3i3NxS3cSCxKKS0qJU3bRU8xTTRMPkJAtjEyWg1oK
 i1LTMCrCx0UpBbiFKsbW1ACRXU2ZrAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=bNYddmgsyW8zpJaljT25nbUCMx0j2dCKdXD1Dvmcx/Y=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBm/gkch2/1mQLQC6vdzGTNgJUZUGqjflYJhWQTm
 hKmRcBFeIyJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZv4JHBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWDMg//QeesKF52cIqBJpczFAINE9i+3Uutx4KLVAMSvm4
 fKb6Yk+MKfdjkxacJjdJvVw2ABwCXsVCZsdi/8e0kk8HuSKKzQytBdZYLXfGMyot0dKLA/uMjds
 apF2Io6qWCaVZrcy/OhMmpjSenKgw5wgtNaiiYJPJ1Nwq+0AFBka7mEHW4nrAv+X4p/1eWpGT/8
 RUu2rrdAwcKQYP8mzky5BCPr7L0nL1W8JjxbfF16dTWSfhzDNNE/+zvnZfDa2aIGmKNqvOPWV7c
 zza70jdEfgL9NBwIS/RezeNiWWtkxf+g9tcKHmQK/maoeGvN8wRshfhccvJOeqHGDQ2u8p8tTez
 z7Dnw3+rr8K0zI7dFlTmJNJqjmC9TD52VHoq3LNByuZzjOpziJ7Av2Rhx8sgwA4kZD5zXtqGtci
 IlZgdT8oz3vIvcsuAw+6trOZfoSsp7zEURhQmXn3hHmphcK6yth4PHSJFT8ohMyuyWGbYP7cEcG
 l624x48xjLA1qZ7HYfa80/kQnGPs2MDnAoVHN6hrE0v10MLk739fUiinOeQNy/cI2tSCmzjnu5f
 WPIxeqJPl6t3O/wIq6jfFMjW0WNQmEOiN8QAikMMQI8QP7RLIybFItf4DshLDCZS3K8rizTjh8C
 crfPs5/ZSyWA48j5qlO8q4HHEAjP6mzDAjclZA8xXeQM=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: ENlKykv_LffI1zBPHj8Xj6-LvLtbtiou
X-Proofpoint-ORIG-GUID: ENlKykv_LffI1zBPHj8Xj6-LvLtbtiou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=853 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410030019

Support for per-page tables requires the SMMU aparture to be setup, on
some targets this is done statically in firmware, on others it's
expected to be requested in runtime by the driver, through a SCM call.

Marking the series as RFT, as this has been tested on a few different
modern platforms, but only with Qualcomm presence in EL2.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
      drm/msm/adreno: Setup SMMU aparture for per-process page table

 drivers/firmware/qcom/qcom_scm.c        | 19 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h        |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 4 files changed, 31 insertions(+)
---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20241002-adreno-smmu-aparture-fe7d5a1cb834

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


