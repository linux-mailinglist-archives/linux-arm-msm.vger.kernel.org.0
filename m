Return-Path: <linux-arm-msm+bounces-87302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA323CF0052
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 14:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3AEB30133BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 13:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F011430BBAB;
	Sat,  3 Jan 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvJXS0m2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4VJffch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57442212566
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767447911; cv=none; b=PcfkjjgxPbEYjo/KcZvBxxhJ0K81v/rmgvgv7gvXvF3PLO1kUupoX+7hScehWIC7obS8ZXKVAzx1Gj+KHWMmcp2HKdUAPhfgpCvQcdlp4LPn6DLOYbgzyEJkRoE+aPYI3/iYA5/gPZGrYqVOhhWPzQXdz9D7fK3OvnzPkyaaQFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767447911; c=relaxed/simple;
	bh=X9sF3LaDgRv/B45HUHc0a5tLkJCayBzMWIFKEyiafEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Suq3MmcTbLSdk7h4qFqATOZIi28m0abM2ZqR8fv/wd4coCr1iwgwG84tpTDug+TJ/tTdBfk84onZjG5CDEYoSeHrUkdMAIXLt5n/GN9VieU9QKBRqrEsotASGyPAZLNHUuzz7JyS/kRHM/W+rn8yEF9qRKQQ60WVW/SVV865A8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvJXS0m2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4VJffch; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6037H9Uf3612213
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PVewRUz4/OoxL8WpJ0DLj+
	kQy80dzRVNPuaXhm1lqHA=; b=DvJXS0m2XiaYTT8G+JbUE8FA5ZhWWYEz8W50YC
	tp4ka2YISzc++mU+Dz4ycbCkmNSokXDbmhAgo4/YvDvcEfDwL4N4qYW2p5dqRv1b
	WJrAfQqbItX8Hvv8DmJbUciYvwz/BsvSAf/7XD6FQF2FArsduy0TzgHGcftKdw4q
	h3De2O0oBQjEh9fMRwSbQnkyG8IorpSHh/tIxcvF/Dhyrc7JIoy3E7PYupKmwjfD
	/fK/ilgi9oNLyeTRh1pJB5nMjbK5wy8CEcm/Sy+YxolzKE4SMNbXJnmy890kMdye
	ZeDQSEYnN8yf3ldxxXmdGzzRTdqvHj/ohsZZEYnR666cwGwQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet460q8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 13:45:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a39993e5fso329986466d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767447908; x=1768052708; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVewRUz4/OoxL8WpJ0DLj+kQy80dzRVNPuaXhm1lqHA=;
        b=O4VJffchV3En8zkLhsWxWCr488gYqbGBQ1zkfd9rYq5E4/kkud2e4Jvy8ldAwFGSZL
         /lIhMjlWkj0ACmr/L86POIXQGKJ27+i/vGunJaExwulJQlJMXHpca1Pw0Q012UQe4vOQ
         bHFFb9zHFcQVNW6MLCV2AVx9/2pWtEUhAf7DoiuWybYub/yKD9PliVqgTsdmvLhogzO+
         UNvWkjekKVuXnJD/VU66J30YB0EuDpQZ9j2bGOxRfPPHAFrP/FaLn/QOvOODBPEvZ512
         Yr6ELNVCjDpOb37gY3qe8qvUbj5svCBnhXTTTEIUpRg6kBd1COG+hT3QRtRoxqFq0MnI
         lyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767447908; x=1768052708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVewRUz4/OoxL8WpJ0DLj+kQy80dzRVNPuaXhm1lqHA=;
        b=lkuTqpDu39Be269mXiyDvlQ9f8ze1CDMg3EMMvFhHdZN8KSSTO6LsgEMZsWFVNW3bY
         45E7qy4f4AO0cyY7EDdBj/h5oun8bKBlox6z5Z8boLop+P2YmP/rzylrxiA0qnuJXInW
         XsDieteLGdjD+gVA2uvaRx/mEYul/nt4jq97+umtTrbPqpzOJjDN94uNCnYY1lTuT6dV
         6i79YJmtHXuypxWP+buUiGofKmsJfyZZARSQ0imCg/enetp0/vpxyohBHfdNjoc2lQ9K
         AniO6Itr80Aow5ADbLfbLr5llpTTtoHtiLli4e/ydy3YGE6Nn5kKbc8rU0BrvRYTvaQt
         o7Fw==
X-Gm-Message-State: AOJu0Yw9tyWtwtAPqZjJs6gEbLyWe4Ay+VdNNDdLy0RpSu3BQ5cXRFtr
	b6rFgjYxBKoKxMRwctwT/Owna8ExmpAiyztQUfILatsOt/NaRPsuMD86OyuWBPL3NkY5iF29rVU
	dVo809m5KIwKSNhETz5F52CAuwTdDVmnyWFxxh8TH1hv+shcgwU4nxZ87KOpjJhxwHI8U
X-Gm-Gg: AY/fxX73iQASm4tkq6jqMthI7ophEhb/UK3kFQX4UeVLtw8K3oIwc8t5P80gfBo/ncB
	RM9iAiXFHeLjrI7vQ5O1vwf3imibPxzR8G/hYbClwMN+PbWefj3fodaZ98XVaKtFZ/c1xhvr3UQ
	vc571BapjnoCfdecHJv/DO17eagEtEFcY0EpyDHTkxGLOXvK6xgWtbNBpqu2f3fH5MDmoVQsohs
	mz//GpIxKCMCvVGc94qfzMxAjWMGF9kYzZIPglo7fqj3s6I0bB0MMMNVimtNZpF1iWRN5iJMXEh
	oAmyLLzQWXetL/YL7Vgj7zaqqggXk7Aodv59hVNHlNQzFySEzbgxna2H9enZVJ2HSC/tYV4bYUM
	s+DgKufzJgZqaixkUXOb0Ybb+wd+ooMZGaSFImWpwVmrpUV+sjHOe0MPXmyjIFNkT0ig9jL/VaG
	bx/jB3zTaD/5JL9OGl+6+R9bg=
X-Received: by 2002:a05:6214:2626:b0:88f:ce04:3261 with SMTP id 6a1803df08f44-88fce043356mr609201586d6.6.1767447908246;
        Sat, 03 Jan 2026 05:45:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9C7I4ZqjoudC7nVN7fRk1ATaRrFw7J3YjztPqT00J1e59eX1vgYQAtskZhvEvIhLBC2QEeQ==
X-Received: by 2002:a05:6214:2626:b0:88f:ce04:3261 with SMTP id 6a1803df08f44-88fce043356mr609201266d6.6.1767447907807;
        Sat, 03 Jan 2026 05:45:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 05:45:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Sat, 03 Jan 2026 15:45:03 +0200
Message-Id: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8dWWkC/2WOwQ6CMBBEf4X0bLGtEMGT/2E4tGWVTSyVbkEM4
 d8tcvSyyezOzpuFEQQEYpdsYQEmJPR9EuqQMdvp/gEc26SZEqoUhZDc6Zk7nCHwN7ax47U9WaF
 sUVlzZunrFeCezlvirUm6Q4o+fH6ASW7bPauUxV/WJLngtjJatLUxVVldPVE+jPppvXN5GqxZd
 0aAYUxl4w5iRhPwzYQx62GOR6cpQkj29Qta/ST/4wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X9sF3LaDgRv/B45HUHc0a5tLkJCayBzMWIFKEyiafEk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpWR1iWMRaaNZrUCikmwh0dRlBiXd025GIw5C2b
 vPaIKlvIUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVkdYgAKCRCLPIo+Aiko
 1cTGB/9EXQoT5YcrFrQ95HwRtx7BQsX5KnVwrXP9AjuFOHuIH4GLxQsBD/BDsGGoHUyeN+t+0Nc
 QDJNRc3acCtHQ1zPrQJG6EQpWQU8ZkNkQv5TtC3j/iknAwrVRkJuOjZVhweOGUurs3j/RhY/AQX
 yzyfF20t3ayzRAfJ8dbki01SPHtpavgsJcfByDMCgvYJWpArxWH3BSLo+gDfUjgFZYcaoiLevbh
 2TZmKejTuOcGnacMRm5Hx0qusnykcqnHBvQoNZwcPw3Sm03Daq5/UjPd/ESUz9R2lOiGfV5GmDl
 gxiy4CGeec66Xqu4guxbN8rYu6p9H9uWFlFmKQeDIehL5fcS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfXyaZXqSDC/nrT
 milOULQO+Iz+k57JnBMmFk+9aCM2G5xidfFvPLPTBWEGOV5HdvviycoRsT5Axu5hjYDyTNsEFRY
 xf2hGZM6rI+7G7uH6Uxj+UgWaHz8QucFivlkB+G0sNX3zqisINHaZUzJ0syl+upCcZUKl1FdMee
 IWYURiSkgaaS3IfYatotSH/6XdDU3PtpiUI3Wh5kbE0V+vDctG2Bged/SgTRA1hEKgNkSQCKXVR
 sqleCOU1dw4QQgd3HbBBuzctKjga9WKawISxateWrPeWVdDqjWUq8m27vrG2wUovQqaw+h00LrF
 GJgGyRMrh9xJKyuFWI64RDX5cOJlmPbqF8a91FQlPWnaMevvrtXobnBXavPV9TlG69pm2CURxua
 cB81ApVj2lFmOkiPXXjvm0XfgcmBSRNFdlkE5IFz6J6HTsD1eInvtaoUEsPohxxE1n+L6k3P4LJ
 wnYc8dhyXMSNRjEXE/Q==
X-Authority-Analysis: v=2.4 cv=UuVu9uwB c=1 sm=1 tr=0 ts=69591d65 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d6ssToJDxaT8U7i-MUwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Aw7qYeMEwc5OtTCTxRbshC_6zbFpo8ON
X-Proofpoint-ORIG-GUID: Aw7qYeMEwc5OtTCTxRbshC_6zbFpo8ON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Changes in v2:
- Dropped PP and DSC encoder width drop the catalog, they are now
  determined in the code by using the DPU programming
- Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
- Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com

---
Jessica Zhang (3):
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

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
base-commit: 19eee9de953679506fd24a2db2613e165c6fe801
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
With best wishes
Dmitry


