Return-Path: <linux-arm-msm+bounces-58014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB7AB7A3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D39A8C7DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8987322652E;
	Wed, 14 May 2025 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcQRFwfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD43621B9F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266766; cv=none; b=TC1NSp0QWdWB+Nfubmh7YZKr/GOMHdBQSuxk0vv5GgNf9Eh4rXoKfz1Qd+jZn1h5SBCa93vJWT/othr7hDMiLF25SdlJbE+7ilXuOAXeriF0Vi05ESZeMAw9l/OShRxShfDA4LLwvBIhxjdEJlkdrnvOBAwuwnlCnM9Ki30zjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266766; c=relaxed/simple;
	bh=sZUuOX2H5sa9Q5kPSygy9aJ3DncWNwsb4nZIr1PWjis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZB6JxJnFPpG/YMfIMhR4BDkgDLVIsnC7e8LKFwGJAeUqv70HC+EYuJ6c9MGcgmOuadgDYDF8d+kfd64wzp1hxFx2zIpVdllGVeUr8bIUCWWcuvOsJk8usDc8S19toa5PswCkVD4RMCkGW7G2KGojPwv7U8RtPMX5tKd3ji47QFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcQRFwfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKZbB7015330
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U9dXNTM0otXMtb+tXARZV5
	SVU4gth+EmAxcvRX+fMqk=; b=NcQRFwfZN9CA2RN5DDGL1fCCVQMgG2loJeAss2
	NDTyQsixhCw0dE4qn4at6blyETjMDPBsUyn94rhRlbwmZs0CYPqikgK/ygimGsXW
	xQUZEH+z8mU6YIOGp/BvAvY1jMtVfVZqUB67e6WOYxA3Ir506cmwoeu52YYx6H9c
	hqicBOG7OPYT+1m92BSc2DNHCa8zHFVTEAlVanZ2h5egaNpNxvcLq2OEBJ2yebHL
	SCz7mQAB53ipvO7OVs/tf5SQyfdZ19GEBw6Jl+FQvhsVHyeMY/rqRc+0fmT0vPOG
	pGoc/x9Rjh2NC1bwoK1/CdT2k4ikJeSaM43Grcb37NeM2TTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr499d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22fd34d248eso2788535ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266762; x=1747871562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9dXNTM0otXMtb+tXARZV5SVU4gth+EmAxcvRX+fMqk=;
        b=JgDy4bIt8WgSdXzRRp4dqifWHL86O/gttKEV1hev9HerFAX7FaRDzfn3xALr1pVmlQ
         MiQHkkWCju3ADx6Rwr7DA3V8SSoWPmR7WdU88lY+0GqQQ+XXXGxuqoz/sUDlCrHgmKDr
         d0GME/f8TlUHR4rgmsALiNE4/wIAng3NJj2jkFSuiPXVlOtR+achh1OaRu2ptvC1c9aA
         DpdZT29E2zqRTStWL00rXyq97Ji3suyR6HbVs4O3ObY/d9yUSfFDlapoeohJsiFqaKBL
         Ey0E8Ywp+odNs5iZUAsZ6aytWwHYsY/jlA3FaF1mTnCimq+CnrFAyLbg9WOnIQkq2z0C
         UntA==
X-Forwarded-Encrypted: i=1; AJvYcCVXq9fH6sTiBYO/NekRFNoPst+weyAZ23FPApGN4/MvflR9edN/347m2WabByJ5F7fBZuJ3U+BWoVxMvkKD@vger.kernel.org
X-Gm-Message-State: AOJu0YyDP/1FuPv1ycp0qFVUCva41juuf6L14AWn7dk/VB0kr7BOgcs0
	kxNHrKc2OAgObkdnYMna2cipmFngjKfoMmDAR8TlBszmNh+EfcfP9cxPlyagGoh9KWzQCXxMsMz
	+mR3SNmTW7bigHFRQcHbjXSshV6lN7InlMOqmVseuM43RewHNe0vSCNxljsqwdePu
X-Gm-Gg: ASbGncuW+moUmz96YiWqLQFEdO73vabGD29TLAAqbk0OK+NIkc/MH9n5TEeAkqMnluz
	XRUW01emtepAP1Q7zkQqL34tuSezTpYO7q2e5cJcfaDgAs/dZK33zcqb06OZCiYzAtbzvGfsKX+
	xf6s7PTSn4Py3ROqYx6ac2kj3pp3gW7vk1gtoGDp5OWCf387A/bdHf9oTeWDZUh8gKVAbh0eGfH
	J8tznwVTpvLlyhMfi4WkeYPev2Q1zMsBhg7YiK3zWp73XtFr0WXxtW8hZ25ztm82xtiCQbOngj3
	kyDRL2oTl/+VEEKlrFh3Hx2j28ihSokY3gAZlIy1H74pMh2Ow91gWV6GXuH53QOMcqchNHyl
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr80995025ad.22.1747266761804;
        Wed, 14 May 2025 16:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Q11Bf0x1w3OdQv8Gq4HJtYawO2uCX+U0G/Tc6UvUo7gpok19dbvktUtFd8Z0CtlQnSADsA==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr80994675ad.22.1747266761421;
        Wed, 14 May 2025 16:52:41 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Wed, 14 May 2025 16:52:28 -0700
Message-Id: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwsJWgC/xWMSQqAMAwAvyI5G6hVcfmKeKgxag4upKKC9O/W4
 zDMvOBZhT20yQvKl3jZtwhZmgAtbpsZZYwM1tjSFCbD1T24ysOKt4zngg3lZCwVNQ0VxOpQnqL
 +j10fwgf06RvzYQAAAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZUuOX2H5sa9Q5kPSygy9aJ3DncWNwsb4nZIr1PWjis=;
 b=2fS6E10p0+LUPEXfVUGN1EiKyx+7j+1YYXZmTcrfjwLs3yXOx0XYFA0FP7+b444XrmN0u80zg
 dX1gqwXcCIyAy5RdHn+91gwbPRhUbL6nNW3xP1GaSQ/v7obPx3VJ5Cw
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: QmX6PKtzq0ZFyGXozzeI6EzsraI-tsaa
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68252ccb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qDZEy-X_bfy3rWNFqZ0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QmX6PKtzq0ZFyGXozzeI6EzsraI-tsaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfXzIFxwCiY84bD
 wb5nx8l7AIxuQ/f1vr8l0a5TNlM11EnXugiM+cxyowFzJiYhK1pACzFxG93s4/Mp/Dhlhr7l5gt
 lMhjJPLMYmAApnYDPKqJ4I3KzdTdwYBEi9O2W0xZU3Wr+UeJcV3CkO0JrdNJGQOS93oalGot5vW
 x1woNY0i+hJj9Rrq/UNgkBfuQqNKS4R98v+PnFHCtbs5qVBYqHkPjzFpmj7PalozwZhU3v6j9IX
 nvrKTHad71oVwHY1DfBwgjojx2ov0IYFzm0vFyP6HkABdGbrbViDIVn8dG2jn+mAYyTuEfXBGx0
 fAC65L5rwZ+KbM9950Z7ZLMaxtZ4bjrWSrYbxCMCSby7futq31bucgzdUjV56BFtEHiNY99VAhe
 u8UZ54elhMZgkFFZggbVF0cuj4ewt3yMOr/6I7L4TkyBDB8qoTntDwmwoucuzkwIT/79j8qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=871
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Jessica Zhang (5):
      drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
      drm/msm/dpu: Add max pingpong and dsc width to HW catalog
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 12 +++++-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  5 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  7 +++-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 10 ++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 10 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 46 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 31 files changed, 173 insertions(+), 49 deletions(-)
---
base-commit: 888f15dae780db7cea6ab1a3355151e4292038bf
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


