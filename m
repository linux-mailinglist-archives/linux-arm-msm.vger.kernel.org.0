Return-Path: <linux-arm-msm+bounces-88430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E2D106C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D16D130210D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E0307ACC;
	Mon, 12 Jan 2026 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVfFGHWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLM4TNYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6642F5328
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187497; cv=none; b=dpQCEFccf91XIpvyU4fSHWCGSRctBUKhJi8bP8omwyWTbW/k9cPQvyqrtn184nisRyxeSWPMZ0iF/AsAQaIkj06pcaUADVw/G92Sj7J++l4yh+TtehQgCelWL1Q0Fld2ClK0CbM5qcgI+Oyd3o/oVqlvOCXUxF2BfZye4TXgbnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187497; c=relaxed/simple;
	bh=tNgz2lDbieKSqbwdX1I2JXup1Xb5aYMuuxztq5LLcQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vFMK4FvLT+FCo9pEUNVUXYwfSLom5hh7xrF105IBaLDjJhg2eAgiWEnd7XooCqTxu9W9PUI8kmFiXsb0YswFac7SSj4ZtKSDEAONajRb6JaZaDii/YJ2c+yO3ej9us8zAcAkA2Sa3sW0RqpuzmgxU+QZ/3u7AIwnWFTYbHD/QX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVfFGHWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLM4TNYV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C2NoVN113367
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SmAanZecvfrl/Lhr4noCk5
	ILjd4wByVA2hHixuPHBcc=; b=aVfFGHWAmTwCzV80EvKhnMH+NRVveMNdWWIVyV
	zc6EMF70vXpLqHWvPosjqH90c9ztSA3EqYiM8jRSlJs1vRv9oid2uf/Fi7SE1vZ+
	/PR607xfRJejRto50cNEZu6tFJ8hYSdWB2yuXvRfBNELhXUe8/WYtiLnr850kg5H
	zvNIdWD5u1aM4S2iqlPYxudRuZhwsQ+ByCw6/4Szfbx+rBfKtc/HRWu0o5vDHFEh
	nTFsEtMhzb3iJuXaZFe5fyxDl1I/GzzDLvZf19nfCCO7sdwk05LlG2x4judUyqsk
	p8UhiOX/oFKE85AfOsFDM9njZzyT4ubpCTZxLzXygVX5YrxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4ug3p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:11:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8804b991a54so242965536d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187493; x=1768792293; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmAanZecvfrl/Lhr4noCk5ILjd4wByVA2hHixuPHBcc=;
        b=cLM4TNYVLUOJaJe7ktHo/CcX1HY/7vzGKjk6svbxMV0soWtVPUkkoDpLjLduZcx7Np
         Jqy0jQplhKGaqckaM+SM/ZSAVoLwu6FzcFG4CoQff5vhR/gjI7IQkyzWAW+f7kfx0e5p
         hvnEjztzUQOZHLgkvQBdh8s36xTi9YVqjhVZv/VN8NEP+/Gi43SDhvFh6KZFBLCRopY6
         +brED4qLqllQmxPZlTMabOZ1yFAKlrHR8vkvXlo5WavrUNV6cfE82VRmFoY7GwWKubw0
         GuWAo+ZSYVzvNzndQAc+8pfZEFy3lMw+QPYKp0e+xX6AY6IHjc6iY2oppr7ls2WMTUZw
         7XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187493; x=1768792293;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmAanZecvfrl/Lhr4noCk5ILjd4wByVA2hHixuPHBcc=;
        b=BjNi6RZJZC3OX8v3/rVDCpxfjYaLMNFyBO3FzhwEsaT/BK8LziavZrqhIHf3leqtyZ
         K9sWIGNzpBX9ANyzaExHYl53V2x28ktBgZlrU2DSe9KhxKkE+SyyjtxYR+ZMZgHlX92Z
         qQExnsT56bZ4f6yk2XUEiX10xX4w9Z/sFPdehobrEyRCdQKfF/CzYO4qU/apTnuwyiVD
         H0Ki2fbrPlDHLw+ddnH93CQpmlrypB1iZKJFNTdhtpTEpQQH0TAnbNh/UDDJ88gvCn8p
         0jskNLkJAhKiIUrKoSihKr7xjJt55sB9rjPk0oPfTDJB7R2/zNCGVOinArj9YlFIn7wi
         qNHw==
X-Gm-Message-State: AOJu0YxlpizaqDDcoeeHOK2u7/f3JzVAOFMy4Kke+Du/oH8256l6FFUQ
	4la1kQH41opmICe84le2u14yIkhOTiE7SbJNYaENq0rt0JHh06A+cut+u2X5EuHR25lcuKlOJvt
	7uZo5FM+CtvRLXsCSWKiCCEFa4wG1sWExTYAGPMLkPvd7zCfJz+rhZeJMyLOAbEy9j8+R
X-Gm-Gg: AY/fxX6Z9kE5G9sjp8RZ3SQ3zJH1eIqI0xixkregpbExAcc9KjKLH0ZWWqS59D8C7IO
	t4MvM4SKiBjHwNomKWFeIDdn7ZmJ75sox+roCt7JnsBhAEgYy3iEsbfvfGeL5rp6InZCCWdWU7D
	X61DLv76ouZ2hSvYibsvpqEH5/QfssxS1AOgp0/vYVeM3dlpFLjpVdNCAMwS+7S8DIyS/sg0bP3
	iqiHhrr6jyAxd6pORtVXzaBh+cTi0SzVt97em7CC4nnoLLE5q6GpmQXEY1vP6WVzVJ4zL5naRyV
	YRtdlaFa0ILncGoFKJD+gnFoGNgSF0oL5z3laUo75nsY1is0tACghi8awvElV12coU21TieQ9hR
	3rGvg5WEt2Pmbq/yc52D/vJ5gx6nr+/j2LDRErFZBE9oTtKn/OoWtc6ogbfuGbtx+o23JkGWj6o
	Pv2jCGqrvIoDsHppD8fBDMhJ0=
X-Received: by 2002:a05:620a:4442:b0:8c3:1719:9b84 with SMTP id af79cd13be357-8c38942be70mr2180329785a.82.1768187493321;
        Sun, 11 Jan 2026 19:11:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHLaEWJ2Yf+pziih9iV72c9bcmxhj+E/000f08ui5BBzBDG6B9/krd+PeYLYwsZgAyqTIcgw==
X-Received: by 2002:a05:620a:4442:b0:8c3:1719:9b84 with SMTP id af79cd13be357-8c38942be70mr2180326685a.82.1768187492846;
        Sun, 11 Jan 2026 19:11:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:11:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Mon, 12 Jan 2026 05:11:28 +0200
Message-Id: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBmZGkC/22P3Q6CMAyFX4Xs2mk3QMEr38N4sZ8qSxzoNhFDe
 HeLxCu9aXLa06+nI4sYHEa2z0YWsHfRdS2JfJUx06j2gtxZ0kyCLKEAwb0auHcDBv50NjW8Nrk
 BaYrK6B2jrVvAM41n4vFEunExdeH1OdCLubuwSlH8sHrBgZtKK7C11lVZHboY1/eHuprO+zUVN
 iN7+cVsQUD+i5GEwXNpcyuL7Q7qP5hpiRrw/qCf05KXaRWRzyaXshaHtPEqJgxkn94Pdj1GKgE
 AAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tNgz2lDbieKSqbwdX1I2JXup1Xb5aYMuuxztq5LLcQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZjMly8OhnWdEJzfcyjRQ8MPvuTExdlpe8XM
 0+RGDQgFoyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1VepB/94Hf0Ch3SfS+7dI+V16ADq6yTITaFKtbgaC8QyDVbn3YbYhJnsu29lJBRNtrYa7qzlihC
 1Lqh/DeJDoWHxocEyaUXdNLUiGGhIzJw43eA6KFAAsX0LWOuUwGBLshhUfZhbs3VahEfj1Sn+Zh
 NZt8gAy7TzRnfzDsdLzWhIasIk2qHvPHpT2mTGZaf1ForLeATZIcJEn0o/PxfSYZEC/llD+I/AK
 WvBT5X9ufsr7HZCPH230u/yFdAQZg4fG+JDz+1uWZiuMyxmIUoLXJNf2chLvXjBHL2QiY9c5iyw
 AzMwnhYCRnL3RrGvcNvPVhmW1LlcTiTlgMEWSuWolRb3Fg4r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX+2e4jZ1+zptL
 7W0cc9ye8vbPu3eZTNtyM58NVo7xs0yZdZMHoEJlwRoqFesTJePwxeA702i5JlawU08gUGsFqQN
 gajOovUPu6dxGMLiuR0S/75He40BMoZsCIFws7wB4cmHYQPhloLi0k11RgLNh+hitX0cnlB/Kix
 mb7jeTurc6T51D8YqeLLB26GYW98zPl9Tm/p0VACRVw//V6zNjSe/5U8LxvQUXz2PMdWUc8k7Si
 0G6GdgUopwFWYgKK8hFJFjBSng39S5glrnwYVLZfMuoXMtuudJUeVeOKYoKpcaapw9bB46NPLPM
 Bb9izx8+parFnal42rrwCr5LMSZiLPdzmhWkY34LV/+DrcwnLM7Vu28E78qswBe/hZH6fDwch8d
 v7Wz7ivPjC6VWVMN15jcuZRszbnu4ikJoSc9LFEGAb/hBAZirxZFuJmLLSQ5f+T3hAk6ICB3HDq
 +WVXH0trlp7tiVPr3bw==
X-Proofpoint-ORIG-GUID: nASXndzRG272N_sTYkEKEHFszQQrMtsM
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=69646667 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d6ssToJDxaT8U7i-MUwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: nASXndzRG272N_sTYkEKEHFszQQrMtsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Changes in v3:
- Rebased on msm-next, fixing conflicts
- Updated commit messages to describe the actual issue.
- Link to v2: https://lore.kernel.org/r/20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com

Changes in v2:
- Dropped PP and DSC encoder width drop the catalog, they are now
  determined in the code by using the DPU programming
- Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
- Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com

---
Jessica Zhang (3):
      drm/msm/dpu: check mode against PINGPONG or DSC max width
      drm/msm/dpu: filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 44 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  9 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 33 files changed, 45 insertions(+), 47 deletions(-)
---
base-commit: 739de27232378a4a125583153cf9d5bb651b2bd8
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
With best wishes
Dmitry


