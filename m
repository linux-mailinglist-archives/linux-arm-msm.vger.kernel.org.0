Return-Path: <linux-arm-msm+bounces-74222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40231B8A620
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6006B3B7EA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 15:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E4B31A7FF;
	Fri, 19 Sep 2025 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZYye9+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF881E5718
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296846; cv=none; b=GUc6KmZ0IPTUv799IiQFCrtKxtA7fBGVoMLNrYTDb98RWjYRzvjD4/jy4tqfSwbGtc09Ss4RImh2P2CBotzJ4beUQybIoX26NFXOVDMxj2ZDlCT7DYmhJfvYzsjMQshTvAS7ohcK34MO4ussb3tXXWFitXTobGxnKSVp4jWpTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296846; c=relaxed/simple;
	bh=Z6FgwU81RDmLwktIOUwsJhCbJ0jXwiGcGxLTvLDX+HA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D6hNxO9fuJ1lQDtqRqvBysHuMHtB6Mju/dG7MGUvg8xL/l8eE2glZeEUhp9IkEhiAhcPyGocZL8xYZEg9k0bLCzMcZ+vk/pBBPEjCe/9EoU61cPG+/kIt9M5doyso4OpEdIf5Y842QUpuBTDbjXXoZUOFPjG6fJofDJAiwpDwZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZYye9+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JD8HNM031325
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f5IZjZihMBMzwST8n68PWi
	/t6dztWGpRaZ8IqEGg2Po=; b=CZYye9+Pb49wLLIf6SMEQIT9aZQOEOP/MD1OI8
	wLzN7wH2GcH/kATEA6yHhYAhr0wRaOfPAy0ezGg2SlGNX0YsaQoe6n0bGL2d17IZ
	0DUdWjRqHRTgIJGupqooPG1EXW8jkv176yW6xCkTCWm4Rj9AuzkUIA2KQC1HMjPI
	3ZGz+jj15lsc8PvdiPdiivWSekzFU/UPHMDNuCQyowyJAmQPkVNZanqRiD6KJ9uN
	x1jvBIqtVj5nV3xdxA5wstfXBUvri70O7ZmQCsb8JODzAxK/Ft2n5VBmnDqT548u
	/KLxc7Y9QaNheipCxwW0WD78/5mT+ai+jrGKaHiNRpdCHufA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x1syf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:47:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77df695490dso1313197b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 08:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758296842; x=1758901642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5IZjZihMBMzwST8n68PWi/t6dztWGpRaZ8IqEGg2Po=;
        b=tIdzQwQyQcVAX1EsT+GDU3vQFALRs4af5FsdmVP6OhcOTEcbgzfUT6+c2rYPl0eoNy
         ka6wQVfzl3LElpwTrCJpaFdMRfux8kN9Qwz86jkgvCLf/6K2yt79r72k1ReQBTVNv/ZH
         PyZUkXwbBn+tRt0ZXkbCOOYiefrZxFsV9p+ra5a8k9MEEJU2uh9LmNJoE6tpnPNwXg5d
         /lQ84QFFV8L4UvLxT0BPZXRY0fZ4xdN3kA9G3iFD9SYHUdtwlbx3RfmPAzy8CbY2YEES
         HJ4X5bLyqkauDG+4un2DYvujgjWuuUJunJj7XPLg2mPPXITKcn9yHTUz9Sl1khL9oMXB
         DMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHb9SEylDYaNAjbWTXzLAk1RzM1sFv0C6ktTo6iwOWNuR8Dosmzy7Oc1ZlAawEprv3rv2oIcpGjeoUHrA9@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXSXOdKhaYHsjawFB7JCiUL1SRfSZw3rTOWRCKnj8lKBGCQKz
	c642+fTSaqtl+oUZrW8dmWmQ7fIEB1jAJvkwDhesBnTOWloMADmsQetQiK75k5A0oiNb9Gwgm1P
	q8EHbNWR+jTt8qjwkGYaZs7qaZ+13zLM2CQdX7YH9SjHj2Mw+kLWZZG/q9zXvZLx6oacb
X-Gm-Gg: ASbGncsdIsERbBxtsqflcuVF7Py9EaPQYX+ENcHd/T3XznitvvD+ZL59hocGSpjcNg2
	w7XS7rbbQcYKQvJ0zQmf8/0cf2CaOSHvqCeyyBnCfTxyjKPf+xviBpJy6UemB7+E7Q3PN4f88CL
	lbuJn9Q+USlJPMc7ePvNk1O3ZtYRn+GSJb5enoQgrwWMuegEW0ePomPvfVNyhyPddgirDcyZS4O
	gEO7sf5wiUOusmasty2Jlk6lnr5RngBoiz0jGaFptsWLmsQXJ18zUs1MlkMx8jEMcr7TY0DHG/n
	u4ZqLkrp4zti1ASZa5s/hw1FZSn32wBql+1X5MdZTVb1WbTNHZXRZXLR5RJpuDRyL2ZS2+msFPg
	OrA==
X-Received: by 2002:a05:6a00:2196:b0:76e:885a:c338 with SMTP id d2e1a72fcca58-77e4ecc2cdbmr4401571b3a.30.1758296842141;
        Fri, 19 Sep 2025 08:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+yk51eby4vIViBz1hHHz/Jp2vtK0V7tofw4pUoeiMpPq8lWAssXvf2irjZp4uaYpxiu/Mcg==
X-Received: by 2002:a05:6a00:2196:b0:76e:885a:c338 with SMTP id d2e1a72fcca58-77e4ecc2cdbmr4401542b3a.30.1758296841539;
        Fri, 19 Sep 2025 08:47:21 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm5706653b3a.36.2025.09.19.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:47:20 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for QC08C format in iris driver
Date: Fri, 19 Sep 2025 21:17:15 +0530
Message-Id: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAN7zWgC/x3MSQqAMBAF0atIr20w4nwVcRHjjzZIlAQHEO9uc
 PkWVQ8FeEGgLnnI45Qgm4tQaUJm0W4GyxRNeZaXWasaPmXCxuIl8DFehuH0uIKbGtpUtlBWFxT
 j3cPK/Y/74X0/yIW/jmgAAAA=
X-Change-ID: 20250918-video-iris-ubwc-enable-87eac6f41fa4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758296838; l=2036;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Z6FgwU81RDmLwktIOUwsJhCbJ0jXwiGcGxLTvLDX+HA=;
 b=g7ozL1iwLNp7t/Ze9vXUFdfksEfaCuT8urcXbUxwIAnFimMFl3f6j/5Py7IQgKajRVKsCefzh
 5MPCRF1eFTfB+OwebiAy1kq9f4V4WI4GqlHu3tRftWzA0enc/z01xVe
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfXzRyXD+ixJFre
 ig34g8yImO3VrfqN/RSn9U72uaFd5+CFRsWmhG6rQGNQORY1KkqXh1thvfReWbmPs49jvaRQzf/
 0P0uIlNTViU2hMDzsIjeh6ynmBT0mi2VQI/+vXp0ZYbU1WZ2PsXIa9HlTXFVcUT/JR9GsbAIp3t
 6m8KZK4ZPcEJdfhzmeNYVChbwbJGp7OBgQDxyhgXwk8A/mn1pxFCegPEgdrJuYJguLvxzYmcLDI
 IRBn6FfXSzCjsadc2DHRyscaOHCoThqQj6NGnRKMgEj/ktO0ifrm2f3ybiPSYLzhG7OIKQGsLmB
 l7ed/24brGTH960tTuJ4PmYYdVr6/3/HIfeLd4p98k/OJtEq2wKS3kivA1anOEtIe1KuQDkCXoc
 tfGwGnQd
X-Proofpoint-GUID: XNZYmoisZLON4igcGsMYUJFTSYg40YBt
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd7b0b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8fPvZrEDet3th6y22BEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XNZYmoisZLON4igcGsMYUJFTSYg40YBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048

Add support for the QC08C color format in both the encoder and decoder 
paths of the iris driver. The changes include:

- Adding QC08C format handling in the driver for both encoding and 
decoding.
- Updating format enumeration to properly return supported formats.
- Ensuring the correct HFI format is set for firmware communication.
-Making all related changes required for seamless integration of QC08C 
support.

The changes have been validated using v4l2-ctl, compliance, and GStreamer (GST) tests.
Both GST and v4l2-ctl tests were performed using the NV12 format, as 
these clients do not support the QCOM-specific QC08C format, and all 
tests passed successfully.

During v4l2-ctl testing, a regression was observed when using the NV12 
color format after adding QC08C support. A fix for this regression has 
also been posted [1].

[1]: https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u 

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (2):
      media: iris: Add support for QC08C format for decoder
      media: iris: Add support for QC08C format for encoder

 drivers/media/platform/qcom/iris/iris_buffer.c     | 17 ++++--
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++--
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c       | 59 +++++++++++++++++----
 9 files changed, 152 insertions(+), 33 deletions(-)
---
base-commit: 40b7a19f321e65789612ebaca966472055dab48c
change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


