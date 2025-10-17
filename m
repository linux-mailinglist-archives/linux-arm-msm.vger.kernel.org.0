Return-Path: <linux-arm-msm+bounces-77677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947FBE65B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50D3F4E3567
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F1C30C378;
	Fri, 17 Oct 2025 05:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlsFYDXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF531F4165
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677574; cv=none; b=LcgvOt9xDl9gEIHkiZ4/EuuocZEDG1zvnQ2z0i35T0JhQ4qh1XGKgWSbBmouxrc7Tw9cfhyfcHExJd4lyEsPQfdNfeU4eF/q/nS85rtt4wyWkFsyS2wjxHeGRZ4JRa1iRSY+Ueq8d2QWrt5dCuweANBmnXQadbzwPwqD1aKqXcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677574; c=relaxed/simple;
	bh=9a/4kkHMcXDzTdUVtOV6+gPflZeZm9CcjJjD0jh9t1A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=haHWjHpQIGunScoYKSP1xJGbQLZno2pULA7XHJtpJFmkeLA1leFzX/NgDJcyZTABGMnlVJ7j/rXxjnbIPKHtZFVbSh7Cd1k/Sr+9UjruM0f1dCvQmH886yjyxc9eoJKdsTl7Bcoj5YFtQuq9wPToWRs+SUdZKMVo54+0KqC51Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlsFYDXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLNoB022174
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lv1n4r7agZ/IsMA7Tl3tpW
	tn/T0oKJtryheIrqHwlsk=; b=PlsFYDXDpkhZy9vGxNbwjNOFoumA9YzF9ZdLmh
	10paSA6NIgSRNKABGXyR8r+KXjkvQwCPDvAjkR0I6xHIT13PhTL81hXN/KrbAgVk
	vcQgijyxaRsN5cSVTt8Eq//kTnytbdeaFmUlVAQhu/nPq5E3iGknU0BxIYGfj8OS
	UOrnhZLva4nR7FHm0atv0dCX+oWhmHf5RpDa2ISPFTeOVwtjROXR7Zyf3f5S/e1M
	7dxgVnoBQxHRZBteJTym5CwWuYms2Tf3Ng3CrEvsmHGiafKqw896FVnegJiqQOTq
	nXR3N5XopA3DSt2XqpLJC78Wg+y+AUptkrgpABIrLoYGgzPQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtfumr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:06:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7916b05b94bso61342596d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677570; x=1761282370;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lv1n4r7agZ/IsMA7Tl3tpWtn/T0oKJtryheIrqHwlsk=;
        b=Q1peoO6Xv2+Iy9TvKl9L2wcb7hcwh57mvYcIE4SSsVvEXBdPNtV4LKxUvfoD3f/hIN
         1hZopB+2pEKy8qzp46hOb7UZDJbcg25seHQ/gnpZG+D5tofAxfowIAG14FFZ3q1vTMgR
         /7HA/8M4Va7mHMFA+KzqztwX7jLi9xNIl/VbRQb2JHzH5g1HWll/nuaYp0keMgyeYuuj
         elZ7Bn8K21c7D7fs+naF4YiSq+0xQ7d+wdmnuJ/XQS/JiVZqK3oUtFzpH3auyFyJ8kV0
         PRm0dVxPzKWT3q3IrGyEYeETlvSI2umIJgPmaFor7rjzIdjckn1b31oZLPMIqHSKosNn
         XnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm7OflnLQ5tIaMPfvZ3UEQdu3UxRkvoVSsrdmN4NbVM03Jdc4mvKpYGIw1I3V6dnbkB4rnlBIsPb58F+IK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy60uI7/yzI+cEqahU8OPHyth2hl9igpuLNbw7ucKwefviqFoa6
	NMHYGVj/eCKfJ/BJpIFqFpGyDtrlY7fN93q861YynUglZ579zlDRON/GPmMGIJ1q9/fPwbZVS3/
	80yS+1vUpjSklWHyjwJehwoKUIuVEZcVD8q+juyVTzLT43sRUQn0YR/Rv4Ra3NlhPHD4teNmsnc
	gtQTU=
X-Gm-Gg: ASbGncuw+op4z652IKEt8CXTKIBGEUOzqSFTsfBgmBDCuRUASeNXLvNc9vhsd9FZNqc
	lDo5fhUqI6LJdi97Gwauw/mBve0a9Sszdeu3GlFBvHqJqrjnXVzZ8fWvJZGmbCmwxcRAUZGvAsC
	9sov834CvMa/7igU41kvGdL3T+nm8sOgFIkTipNGx/k48TmG1rZNMf0qByl4xkuplMnLM1R1nn2
	Yt95FGVf0oKOOsuY7qwHIjVQ8Rv/rh0/uZmzqg/DxAZMMdr6HfhV5mj7NgWHPQjv0mRtAYdzaHi
	SFe4bvCai+9Aw7iB+Qwk1lY/m0sqGJL1f6exLSrjaaaDnFfAe3gWGzhuBrs2rr4JSXV5g51mwy0
	LRmHLe+IrBkgpuJnFzSJYTE7Ux+DF/JHIuy0GrDpqKv3oyGEL6pRcpWFCXzkqM3w3Pw==
X-Received: by 2002:a05:6214:d4e:b0:80f:517d:2647 with SMTP id 6a1803df08f44-87c2058e520mr29916056d6.22.1760677569596;
        Thu, 16 Oct 2025 22:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVYw/Pl2PWSDOWshIw6UGLpfvG20KYW6sJytzqvKPEHhK+XpxIoHGhrkbNj0IkO4NqzhZrew==
X-Received: by 2002:a05:6214:d4e:b0:80f:517d:2647 with SMTP id 6a1803df08f44-87c2058e520mr29915696d6.22.1760677569001;
        Thu, 16 Oct 2025 22:06:09 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm57641916d6.33.2025.10.16.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:06:08 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/3] media: qcom: camss: Add LeMans and Monaco camss TPG
 support
Date: Fri, 17 Oct 2025 13:06:00 +0800
Message-Id: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjO8WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nz3eTE3OLi+JKCdF1jI4NUI8M0A9OUZHMloPqCotS0zAqwWdGxtbU
 AQ7XEi1sAAAA=
X-Change-ID: 20251017-camss_tpg-320e21f05dc7
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760677563; l=2992;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=9a/4kkHMcXDzTdUVtOV6+gPflZeZm9CcjJjD0jh9t1A=;
 b=+9t88JMrvkzztfqdsMS/kPGO+wZl/BsdyMF/jP6cP8my0tvgQN+iDHXuVEzSb4Cc06b+C6jpM
 7jwEOonwO1RBVtJB7A1NU0/FQ0rxzEjTQleCegRDGLY8O2aS5bDeqyK
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: zH-6n-LCtQaSh2R_iWDxg3ATgyWlpsHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX9OgANP5IejLz
 u8CASIySJd6bR7r+pPG1ACmBljhfe+v0xbu2l8duJBatMW0MzKRXP8sSdkU8G0bkNk+Z62mv/oe
 YooaF37YjdttLUhwMF+gQalA+heNuqFT7VmuU3n24V4cSmneue7SA8XjQDDs1/2W0BUqUeVZ/ty
 jyERsEMT/oG12Cn3s8Sna0T4Bc+rpo+s7vA4t8c1Ojq8bpTxZ5C1xDj0OZ94MHptC7SXI15vncS
 312AVtVqj9z82jSkZULLuaMMgdyYq4SxQ8BUU4p6Q8FQfMZqg/TvBZhkE2UlF3k59qjFkMupEZB
 /VsvNVRfz973C66DPiAY5FF2lGmomL7VQssslJEmm3DTaEcUe2ddvFavPKQwLVsZjEbOlwKIPzu
 7Qx0tt91t8e+ov8dOqgeDpmgA8S7pA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f1cec3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZI1NeSbMC4-MBL2ZwWIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zH-6n-LCtQaSh2R_iWDxg3ATgyWlpsHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

This series adds driver changes to bring up the TPG interfaces 
in LeMans and Monaco.

We have tested this on LeMans EVK board and qcs8300-ride board with 
'Test Pattern Generator'. Unlike CSID TPG, this TPG can be seen as 
a combination of CSIPHY and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for LeMans and Monaco

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 220 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 696 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 125 ++++
 drivers/media/platform/qcom/camss/camss.c          | 119 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 10 files changed, 1216 insertions(+), 14 deletions(-)
---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251017-camss_tpg-320e21f05dc7

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


