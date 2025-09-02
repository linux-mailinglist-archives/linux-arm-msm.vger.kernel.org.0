Return-Path: <linux-arm-msm+bounces-71555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E356B3FECA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58133A905F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8BB2FB979;
	Tue,  2 Sep 2025 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7gJ/s/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261E2F745C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813845; cv=none; b=nVWC/AqtDhLGvbLK4WjMe7/xf0/pbgqYNEpVXzVqGocgwA+vYTjXoWQGhTkuOSIOyPP8J+eqy+QB1XUpbDpf9QYNvPBUnfYwCXE9w4LZYmbqLbfruEy1/VHZhCF6/fTo+fmxIPpA9/gRKb1zMWsUMSsy8sQzDpobHReA8e5RJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813845; c=relaxed/simple;
	bh=oRUzrfj+bFbJZIfg9yUPlnyYWmPonREj6xzhaQwtGK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tRwWxbwh4ubZrK7JcHGK9EQnWUPLuI+0wFr4zeisJLk9TeZ5xi2hnz55IazWYTPM8+q8JFhzgx0EbWVBJ7HWsTBgF0YIxEC9xnfKp5iA1FRfU/Fc9Rh0BLhZxmHxrQe0yuwALTTO25n4qcBkA0ktfdL9HfCPYRkc4Pv2O+3+SD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7gJ/s/F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B7M4s029973
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 11:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eAziRhwZITCfoOpKyth9/b
	vxKnzQJ9GiVsebHG4acH0=; b=l7gJ/s/FrO9c7rOdBehQ3lDEsDcToCsA1jWapn
	88nbf7UWia8GInbSmzFkce7rS4ZVXTGcGSCMasazMiWbaozXIisgUo+XjclOUEVh
	tzpokthFISXxtv4ygsS3uJPIS3GqGZ9n64exYXw2ZEictZHS9kDpE+uYkydxuq9C
	RSW3d0OBvi4b4g4YfXulRRYDp9FhbWpipH6bZqkWkHzILKeo/EaZ+4VuYIfG8KAL
	X7kH96ZuxMBjPft0/LIwwvcLaU4DMZmFAyOrr2FWUDLHxFtwmdip00LU8/3tV17O
	GqWFEqkb1grGvGK35EBuWbZ/n9nZWcyX7q+gc17WQg9bA38g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy3fv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 11:50:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-327b5e7f2f6so7683017a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756813841; x=1757418641;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAziRhwZITCfoOpKyth9/bvxKnzQJ9GiVsebHG4acH0=;
        b=ameP2W4kLSj6/9TaOAPFXsBJSXrc6TyZpAxmuceDWHfpUc7oRvcTvwFMkRF9dqjvBi
         SVwW2yuZLx7ELGvoinA/V2v0/uvnRggBEvWTN8KxzzbmYmfv0wFTROMp+1PwBzMmk9Qg
         QyOk0OBXrp6ZeaT1kbDuktbiHdzf4SgBK3TgdTTU+0m5RXJFEHZXFkPgaVo5KfdSwiw9
         Iquz5q2rG+awbGfW6dULVO4E5A5xHM3PrCeXmM+xCIC7WohxZtYiH/NqQ+/SrvQBKIEt
         TY03M6+3Q+eNK4v36P3B6b0rMkxWC0ZMKOTTT6I6znkRhZGUaLyZUn2O64kMZlD0PbjY
         kIJA==
X-Forwarded-Encrypted: i=1; AJvYcCVXuwPuoOO5HL3S2hb64jfvejSu/3WygSiC4cQUzMEOPj8riasmmtwlvQ65BUTYTTQYWSPki0Qz5oXYIgUN@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5LScbp156qLf/u+8bTcgE5kWrsG00fl6X7syfDYqdzfsG6Yh
	sEJhzetILKbewuPpdpdDGmCRHQKEf/I38rOhZQNsQIBqxsT6gxzFnOcpKaJ5Jnr3xgW0JMcdKAb
	GUgY9zLG1nqERggi/1zrJTxInL/AcjX2YWkC1h0poOQ68PcflC/MUxQUIiNSBzMy6jekV
X-Gm-Gg: ASbGncskFhxQqq0OQk447G6ueyQERBE0hCp5bCv7dAFcD+TbBjjXul6XC1QDKZ9N8z9
	nujWJDVpz5v4YxWs8NVvVYbwtst1ge2uyCWP7ZdFuZ9506/BRRJmEBdvpfzCOsL9ffkyLl8g7Jz
	E8NIY5fcoi0pyk/mH3G0xzl5CBLUVYsch5E9NDe+2jEe+JNw8Ajwm6QwQfI2hfVwCAR2f9nJ/g/
	X9wyI39zx/ssQEkDFgmG52CsmJ0cso+lIERAPeG+qh8VbaByZnIeODJcnMcWy8t7lcN2Ydmd8J9
	OnPUrtgDcAZQl9rMMzt3WUqMbTWkMax6ARNj3aIxIeV2h8gvYfXWEQ6N9m7occku
X-Received: by 2002:a17:90b:4b90:b0:328:116f:b124 with SMTP id 98e67ed59e1d1-3281543c7admr18577434a91.12.1756813841043;
        Tue, 02 Sep 2025 04:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ZMH+Vzg0wlRp9EAopZVWtcIW8yWlVtbtcynxk3++LYhebYu1Ii2WgJTBzPGGOljv90GvhQ==
X-Received: by 2002:a17:90b:4b90:b0:328:116f:b124 with SMTP id 98e67ed59e1d1-3281543c7admr18577399a91.12.1756813840345;
        Tue, 02 Sep 2025 04:50:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:50:40 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm: Assorted fixes and changes
Date: Tue, 02 Sep 2025 17:19:59 +0530
Message-Id: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfZtmgC/yXMQQ6CMBCF4as0s3ZMW21VrmJYlDJoF1CYqcSEc
 HcbWX4vef8GQpxIoFEbMK1JUp4qzElBfIfpRZj6arDaOv3QBoNI5kI9Cs0FDTrn/GCcvfjuDvU
 1Mw3p+y8+28NMy6eGyzFCF4Qw5nFMpVGrP5sbcrxCu+8/0LJHyo4AAAA=
X-Change-ID: 20250901-assorted-sept-1-5556f15236b8
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=749;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oRUzrfj+bFbJZIfg9yUPlnyYWmPonREj6xzhaQwtGK4=;
 b=pRDSyxIvQu+ZNc+l0Lj15nZLcXhUN3GxU8l2stlbBCWCl5j/py1iUWsNgeO9XH3jOXpi7EK9S
 8LyuQX/ThMbAwqDH5rW97j7IgK9O7FPneBCVzTIkV6Ia4Ulhw9t8LRG
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b6da12 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dW-ANKit55rmDTnjG6YA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9kLeHn5tvadVFePHQ9kZUZllRRlYA9B2
X-Proofpoint-ORIG-GUID: 9kLeHn5tvadVFePHQ9kZUZllRRlYA9B2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX6eREA7yt4w0e
 dHZDFaQifS1VuZG1h86JOGmueMtr+mkAqaVzCKBkQryDUHzCxBZ6MtgIKWMIkpLhN++nsM6230c
 kQiNOr96OD0FpBA/dlYaVvOSSRIM+E8RtFgJc0hsUhtmsAKdax5fTILxfzrWl/iZ94aaLUHnSX1
 c3XsEDh4xJQTAutQAnuaNxm4qQcIbfvh7BqyJ1sTJnSAjkR/bPMLZ6Um7mgeRHZ7xda0RDVFzEI
 TPD6D8CGOl340jeRqN18FB9U1FiOgM9WZWu8yovcd89U1dUvGPWExAr5aLt4y4OgBO0UrU6RfCI
 lSbv7a26PP4fHOLCjDF2AOUvwz81KfZ2giPtAWrHcEprC4Y83qjs+h4Rv2hnjYqIFumOr73aNW3
 WLyR8mCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

A few changes and fixes that were lying in my stack.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (4):
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/a6xx: Fix GMU firmware parser
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
change-id: 20250901-assorted-sept-1-5556f15236b8

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


