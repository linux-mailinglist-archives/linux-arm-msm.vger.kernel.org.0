Return-Path: <linux-arm-msm+bounces-55748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E47A9D249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ABAC1C0153B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EA4218AA2;
	Fri, 25 Apr 2025 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZvvYB8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608221ADC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610556; cv=none; b=SS2gEauIxYo4JgFWMfvn08NdppSs3iFOOXTTsDOdKqyiQZNu7cqw4H+pe1qvOBSMnoaosuH+RYm02Mp2KBc9gUct28umhvMUrDtkheDrvX/6WCEe/GcXrK+6Fxve78W/TyuTFwApIwn62LeI4wxRwszBYeuu7s4OhQIRgQFjlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610556; c=relaxed/simple;
	bh=xiXYEHCnpydgNxOjmQEiL855gJzsxvVYn2BH/KS7CTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PPQ2J4CQR2+Y3gXOrG8x+gUKA1T5tyqKrWLYzxMpO0osj7THBcDiZqHcw2VLQh9lqbXFKFuTnek7XXGXfeb3MH6/LmzHH8Dp8xI4cdAN4oI9cYfK5759p2jsPYSMIt/aYZW/Knj3kmj251fqtmXtGO2JbOFnVpLPe6UN63aR1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZvvYB8i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJttp004033
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QVF8qBKl2B8UgSSWNGQxTY
	skqSEtcYIfpjzN6wFXrIk=; b=SZvvYB8iEz3In35Ka6cSz6aCwXIGmYgn/avNAw
	9nINTBGkTIT38+rOhBV5VJ+Eb0W+B3Zk9HtH7WSDyCckfs6BOWRhJSZzi2jxVAR3
	H44LaTmGwtq0Jf6IoV+LIK/rZKvbjQkOvdfJX+hp+BNyRSg0EE0qTBx/aZqz1+eA
	bFIQxn4glIU8y+r4ocjDtBzmGC4hkegsPbUvsKymXpx/u0hMKMV1oAHuHNVt+16U
	4FKqOWR6rLN72cSUTQvrKvUVAin5TROHsZK8hIAb9I1H5DakjrkYMnu4yb6kzKdK
	f+aB/vMJZ6/X/2OvPXElqA3B3JFOZ9QPPPUtcq/V7V8uX43g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a78y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae87b5182so46085311cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610552; x=1746215352;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVF8qBKl2B8UgSSWNGQxTYskqSEtcYIfpjzN6wFXrIk=;
        b=kMwIHr1M28TumxbE2Xa+pLBcsuR3QRVMboLjBfmYcb4d4c7+Zs7DyiCUeclbkJKzT6
         MjhZ7wAhn0zh1X3XF/Vqha00tUbVI+SmbEDfzBe/mhtpGlzPVT+yDQirJ0BpnbOSIGiL
         FVPs436NAyOGm/iUpJNlkT1uz41fP9JqO4lXJRp/TSvKDNq5gvUDdOYyKZVwnYZIPR+2
         yRj7tO/2XwzE4PE9juKYkSMFJpnASn+o5Y1abjCkLz9/9zjArs+Y53wVkNMCGsTnBp1P
         NyWzr6j3bGzthT16y8WQ5Lw9ZIEXHQA19Prhv99vHYsaTYOhVF6EFtPQmqmgPLd4ibdG
         vnXw==
X-Gm-Message-State: AOJu0YxBdmoWId1qZ3ZwKTIK7pA6o9Nk1JLmFt7YUc0TZHB0zWhjL6+y
	0F2pAB4QIh5zhHJXK8etcewJJN6F6RwBh+xx92YLRV9r1Vn4fuYPTRgxJSFftGv1MSwRkJp9Tkp
	ObNbXZlNMx/1FQ3+vprV2CdnVcnR+l42U9j8QLa166I5gJwnDUQlq8ktsWgIz/1yt
X-Gm-Gg: ASbGncsk2PYzY8fyIGJu/NLfAEkeo3+7IGu/3P79zGPTDcw2/jYeB55YknadrzF6Uog
	7WG7nJ244dKSPQ8vFNMDU9ixm4MPn5wQuci6/X0naB8lRnX1N9E+oyxGwYNDoSRH6SO4MhMlfNB
	1Sx7O0sCkzPesj5AdGV1UT287S3lbeTRLttYXtFhfPcuMWuYyRkbgBlYXNkdKqdr62UGVSe10pP
	DWvedUPX3HyRzHp761Ley1tAjcK2xlD8V/a/nFmeUsqHbU1McYnr/LoWasRxhoc+KXLau4DenUV
	k4XqHrVT6V45qD2sk1gidBsbXSd/Gcy62PnYguG5sWDeqGRCnJFzOpOkd5aE6WTa2YhDlB8r603
	Ws+XMAU+Et1c/K/pNPD32v7bl
X-Received: by 2002:a05:622a:1886:b0:477:1161:2361 with SMTP id d75a77b69052e-4801ca7cde2mr53690871cf.16.1745610552050;
        Fri, 25 Apr 2025 12:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGe12+bSLXzF7eqw872nV8cM5KVYfx4GqOPCVUm/H+/NHn2EpcmQOmblco4sM1BMKL0eK7+Q==
X-Received: by 2002:a05:622a:1886:b0:477:1161:2361 with SMTP id d75a77b69052e-4801ca7cde2mr53690541cf.16.1745610551638;
        Fri, 25 Apr 2025 12:49:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Fri, 25 Apr 2025 22:49:07 +0300
Message-Id: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPnC2gC/32OQQ6CMBBFr0Jm7WgLkhhW3sOwKDDFCUJxWhBDu
 LsV9y7f5M/7fwVPwuShSFYQmtmzGyKkhwTquxlaQm4iQ6rSXGXqgs04odDLSYczt9gb33msG7L
 Knm1WUQ3xdRSyvOzaW/ljoecU7eF3hMp4wtr1PYciGWgJp2gKJPCN39kHJ+991Kz3/P/+WaNCq
 6u80UobUtX1wYMRd3TSQrlt2we5zp1n6AAAAA==
X-Change-ID: 20250308-dpu-rework-vig-masks-cdef0f4f3bec
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xiXYEHCnpydgNxOjmQEiL855gJzsxvVYn2BH/KS7CTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c17deoKA0iAJh/+DZAGse+ko22l2hMwtKUq
 xGp25hijyKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNQAKCRCLPIo+Aiko
 1UybB/4pmAg7PHT7ety/HAwm+pTqqAj6iNMngLsn/aKcZ6g8ABF6CUMcSWWV3FqQIqKNhoK6w/a
 NUg+RnoDADw9qYjLZL9srANPWDU1PbB44qt7gWXaAT36ZQ2WZg02RreScinr8EzwscjEGg3pO42
 yWCg3MFuVF7dDxE2HfSpiBoUS1TXmw3S8x7+DQdyzTbGPUg5yPtpNvBXJT9UPOl08ClHReHtFcR
 S2LvFKKpxQqYMnrR/pbrgV3PTYGYaXBkd1/8DSd1hwWtoeEGeCHGLLgplLCkmbaNuDR7WTVY8Gj
 MUBD0WOWKWPdRGO503yxxM9P2bxiMH00obD0KuPwZmvluGuG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680be739 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uRdDJePGNZSGe7RuJwkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WU0ndcj8dKTdXyZtiMb-QrsZvzPcKMKI
X-Proofpoint-ORIG-GUID: WU0ndcj8dKTdXyZtiMb-QrsZvzPcKMKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX3+UoQAstMdId hoYxlHy1Ea15XHV9ZQxYoPhosgE9CMvm+6kcFN/s4bW+YTG1msaJN22j7UZkZ+Vjzw8qtIPhOdJ j/+eIIuJWac+682gcRuzzDnwac1ibxNglvsqImyqBu1u0YcqoAScfZsNBeNP7Plsd8SnHxeA6x/
 83UoGn9YX2OOowCN0nEXPnSRDoMvNeYRnCLS5PgjThye9KmjohtqgnChAbWGfEhdPD/2gVGqxnV JlS33vWNliLInvQcj1j8mTLF12VLbvovmjiuSostzXRjGzgeLfXguFRJjiyP3QY5fZoLk7sNpQ0 mS+9h8otGZK/ADzle5Qh7CNPWp6OWXc89bmpV1U7qUmFfNffNRbfRuS58y4JzaI60PZIou9vh/Q
 m5Qszm+n6+ZghgmoflbZCaWUwTOhHalzTqdP5kPZMsgF3lB1HiTEp2zqsWAnNhNmq0PrIYcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=885
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage).

Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
SSPP feature masks to make it more explicit that using non-SmartDMA
masks should not be an exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reset Abhinav's authorshiop onto patches 3,4 (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 16 ++++++++--------
 12 files changed, 63 insertions(+), 63 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250308-dpu-rework-vig-masks-cdef0f4f3bec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


