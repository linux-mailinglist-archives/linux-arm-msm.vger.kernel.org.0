Return-Path: <linux-arm-msm+bounces-69163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DEB26052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D920B1639A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B853C2F60AE;
	Thu, 14 Aug 2025 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGz+aJr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAEA2F60A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162240; cv=none; b=b5K/X32DthbmFESGHKJW0cU1KHarZlxFNGYwdXmCgQPBRUNee9oHxGK9cxGXUXtlOnYEGWBxVgV+ZNoiWl8yA6Xguu0WHByn78peywpnQHctdjogPUiaMgyNIiX17mBen8NwZGWnRk3oibcz5VPWO+lOMIkeT0SmmIYN1oWBhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162240; c=relaxed/simple;
	bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rL/YvA+LRIelV/WzhfFYyNjupvZJ37aioM483qEzdchdpMXteqeQRQA9PjD18OaZydsj55cDUNq1ZBouQu/jVNw5nd0EjDOeozo3AgoaYrCbpGq4rr5EAMlSHW5uif9DZdXJJPlDutVYTnCl+JQEdq6a7rl4QFIwI6t2sjprfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGz+aJr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNS9wO031956
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rGGIgrmmsmbimgDt4vADL8
	x+TnC6/clX59aBfoICLGQ=; b=UGz+aJr3XrtRjYKMQREbXjEgg1DI0Nmc0P0vkT
	m9Yf3FFnzBeGb/g437vbmMTJMFs0d4g8NGCkiFxkX5roEnYLhY6VuGwTkjaX8Hph
	sjpiBSr0vwCQ9r5wQIEzM4dlCBktf21na9+Y9tIRm6l7ROZ+Dee8Ihu+CtHSzbST
	Tdcc5BegwboSt+CV5oK66CQLFD1meSSPpzI2rcwGWQXsd0q2x3DfgIOCZavFzdOD
	bSGkndYTdrAM4AhOWeK0jOLwLYReYUTW5wQ32MvOmX8PzzpEvVkJ+bWvwS5/StIQ
	CxgMv5IbzCVxB/YNBTefbr7OPpIZluQwpYufY+o9puMJw9RA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4k125-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:03:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f562165so22942846d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162236; x=1755767036;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGGIgrmmsmbimgDt4vADL8x+TnC6/clX59aBfoICLGQ=;
        b=BT9/u9oz3rj+J9X5DNwMf2twc25rvHgXFlxpSq+nUThtFoo56LJnTWaU/f/lWBiv2I
         Rf2TNsJJ+DbIeRW/VZ6gFwbirBS9iJa0gRq/UvHaiCBzUJX1hEEkhV6udwlQNyQwCbeW
         j/jXuvXhX5eCr1wqsILVt6u/J6ymQltCP5Ev3cPFKFdAR1W0uw/ncyNv6NrPiYQfbsE2
         04X64N0hqJYDa+Skd3hYhw3Ga0A5UKTVcLO7pjUkCew0fKaPslgIEFcaftbwUji00Bhu
         1Vi60WAf0NeyAjYmsBA8fL4SlMZ6zc6g3Jx11UlR+aVYjk+JL6gKZ+P+3a0txu0gtpvU
         G/iw==
X-Gm-Message-State: AOJu0YwnlETZI5+a/RtbM1BeaXcoXzNizR6oi6ziqqTEaq6Edzmz0LEC
	cKLhAzBPekR7HXcUN9/ULLtHaHtkIjlmSfnd4eCzvVBeCQ/YoFGeGvcDIEQFStDjB7Rk7D3ekZq
	3KQ7uthKydl3kbOue+8dNrgA2kVhkrN+xV5iprhk0MIKRuVERcJm2XSbtTUOPz+guSjug
X-Gm-Gg: ASbGncsmK3ACN4JxJznK/myO3XCgmFDT6Uy7FCrJg5UA+MzTZf2wKjBni6D72JG2I05
	MPiBIODy3NTrnUtINo5+7CtcaCCVWXD36gk/T/NawyS75Gf2Q5Rv1fpN1snHpDlnY2G6ULN85tX
	8XmPD7G3rFnEIpwQKiu1BuAbLq2OJC9cgNSdoyylRJMGDn6dlvsQq417U9S6uRKSs045vBpvyXM
	OS5Cbh/9r8v8wKcWQWt/tqkfDiUdn/yKFggV7DIQ0XKTzmzzrugflLLm4ht+IuwT0DlIhh1ZQJ+
	Iggssf/1EqIZeTy/cVBHNSW/fh/LMHyfyVTkvKKBzEgYeK3zITRN3dFPv74Z/+iF2EwlQh2yMlF
	opRoIud3LecZBEUiykRaPLatFPnK0HwrckN5GDUlEj+P8/3MA20LG
X-Received: by 2002:a05:6214:dc6:b0:709:edde:4c0d with SMTP id 6a1803df08f44-70ae6d3710emr29798306d6.8.1755162236369;
        Thu, 14 Aug 2025 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ1HL/zHxuCTsnkJlePNuWvPNebHmrVkEdAt8etPB1DsMCZbdV+ybwNuWXk1pRpyEqmj4zHw==
X-Received: by 2002:a05:6214:dc6:b0:709:edde:4c0d with SMTP id 6a1803df08f44-70ae6d3710emr29797866d6.8.1755162235837;
        Thu, 14 Aug 2025 02:03:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8cec11asm1720061fa.23.2025.08.14.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Thu, 14 Aug 2025 12:03:51 +0300
Message-Id: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHemnWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3ZSCUt2i1PL8omzdxJyCjERdAzODtDSzpDRTQwtTJaC2gqLUtMw
 KsJHRsbW1AOj5nThiAAAA
X-Change-ID: 20250814-dpu-rework-alpha-060ff6bf5185
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YsXZpPAaNSeCnyMCCLmHOfqq67CcDMLsx+wfM4OBZcw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonaZ5pHml9oNbOWl15GmrKptxv7thvICknjHEj
 I5Q/zBSdnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2meQAKCRCLPIo+Aiko
 1eYkCACOy0N/ydD63zVefNmO4rL9mm/EAsrC9DOD7tCihUGn5WrYCi1O3wFsMtzA3mlk5ckgJxL
 +vgK8mUH3LyTGJA+O91ZyyBplFNGQwKGSi/KnVC9LLK1fszi11Tw+h36B5nNJQj4FVp7/4AJRdG
 obZxBc0OTGxv+q9fe9tOjdZApd6BKuU9e1YidBSPv9bEhlQurDuqBiBi+aBWS+nAQ6stTkgxcJO
 KVGS6Ry1RlKgEK6+s40NaMtdTbeda1aNmj6yi0x4deum2geO51PLWV04afRFcfAjPK/ZSEI9TDR
 M4EKf/FzT7DcfvcraY8sbz2+eD6kPPGiOZ9Di/3ICMhcHt9r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Fu6utnquEodcKRsuzRoibO0CeGAWYWbA
X-Proofpoint-ORIG-GUID: Fu6utnquEodcKRsuzRoibO0CeGAWYWbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXxJQgdrRF2y7J
 8GrlgCuBcwyp+nn6Z6qskkiybgTRHLJj1zoUTOTG5MSK+CkMfyJxaO+/olrkrRXBGb2TU783s91
 +z9DwLJ6967Q/zWD4GrV/AMqWi83f0LLU5+kxCCUacy44vwNtU0kUJnfjMmp0WEXyaxre9NIyfS
 1rJv0MSzkewTuHGD/lnXit9+KAA+45DODgR5Bj5S/94n8DhxkF+6ZJjRGOQd05FWlSXNvEllZbK
 SrCY5DORZK9rxosHc3a4MbnQDk+Y3NCqNsK+hVawPy5qmXWvCc2iBvK3sLcIWVmIv1UVQhVuI4f
 AJRLcLVtnUUUUEaILoWGZlDqv136tCKP+K1bpzF/mLU5wgOXDcKDHZ8PaVFnrEr4YrGFybxdH7j
 64ek14PS
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689da67d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=XoDkaeHCiDYGaMSRgogA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 10 ++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry


