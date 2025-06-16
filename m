Return-Path: <linux-arm-msm+bounces-61361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC5ADA527
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 02:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29612188F0F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 00:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7750263C9B;
	Mon, 16 Jun 2025 00:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MET1zB/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52C221269
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033786; cv=none; b=HnYylURmomgr9eu5tSeCy9bLCVFzByDWR3ncppg7NsX4gfTEgn6316j9843AdypjyhKy4JW3gfdo2dEsakxI7YVVE3bDqOI3h7YZUltSyFtQLAZGMmTxLdv47oAdTZc5sWfwn28KfdeSzguSC/tPa5T+XM22abQuxXwoKVx/gqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033786; c=relaxed/simple;
	bh=l/GDK516Pef5aGRtzNj+CYesmUAUaQnjiWHcuthC7RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2MFVgXv7gVK4z1VKnVQoAXUWcBNHOBF1PUFOykGFPQwQfbYfFOkLCnwhfWndgA4ho6E8j1GgQnIiyAXp4lcQKzQZHE1FVmyfV9HlTIZQJH6cNAN5cA7LRYfhcuhEUjj520DAWt2aTb+ajRqF6DuYyNoEFeWnND4ZKgNvXS9NRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MET1zB/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FN0tG4029163
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTQj7fWnB0raNXRuawE9Zd7z7oSFeYkC+sopPF2xYl0=; b=MET1zB/VwJxKCLCF
	Atc8FXL+S5g8NvBY8cAxNa5BQyQ4HFbMsMsdIcQhICAXFJbvwjyzliqGUu4+3swN
	g54tvCXIdFxUo8ij6sRhV0dFtiWBXM/znQXvC+jWaaUoJQhKonLngIxHXr+l3i5v
	bTBBK+j8zsaW6h3ekQBfLixMt//+sMw/Bqx9DQw0Bdx/rboiX06ergQ5Kd4LsUYa
	Wer9jnvMMxZYK9vF3WvIUQlFI6W5Ua0eQTs/tf0v+MCS4mPL8piX2okVcDGYWnQA
	3b9tNc8uBPOt5QlO7Y8mDFAxpKXj0ZPm2Ky3UVmUitgXfNjoOe429L4x++nLJFGv
	wqrQag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mahn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:29:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb520a74c8so13741506d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 17:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033779; x=1750638579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTQj7fWnB0raNXRuawE9Zd7z7oSFeYkC+sopPF2xYl0=;
        b=F/P3VcpAMfL3e0nTfXU90TYJKHGn5CT0wx1aaC390ozHCXePtVJmZ1kPlG81WU0Aj6
         0pZeZ7yPBLMWvtM6x5TkLI9RHY8ubUbPVy9exLfRg7UTYOi9K7LHI8QisZIm7VfOisRu
         aesBNyphSVDoR+OgaFKA+JpOhqYVesJsKMoHsQU02m1LY6ccbJgLVd+E9V1cZ9Z5alwr
         t9M20oMt+5vuhCov0YgUeczMKIM4DXU0A5+gH4IMRi50g9YbovNqvU2s1Je0GgSzKEWc
         SHMgJz+DRxnj6C3vJ6W7S3wbhwz8KzPu8GtGSzZC+7bVdAyxrZRmJgIF5Uzc7pPjHHZL
         5q6w==
X-Gm-Message-State: AOJu0Yx2fNy5/Dbcgnc9EbFZc1QpTno/XTrQQ+4KxU2jEI0lSGNQLM8H
	F1n11YT+NRBnymDlaJibLMxv/BhtrFKqZbDJf1eIX+2kH047vEmXo/HLKf53LZFUzzCQPUvCbVs
	0HItdtkgxlLJOkpe5GnEMIuAovpWZfkmGBpe0abgLJKcLfKuRJLBH0uOlBX9t35zTxd/J
X-Gm-Gg: ASbGnctykJ0n7Z+Siz+fj5uKGty4MZnL08FcQhatHZU8GvrY8QWBs4tBOVQpIJfWkUH
	lPUo048JJicM232aoTUsFgOm+Js7pzCDdP8Oo3GFzAvmKYq1omWeqFRY3eRMfaqjy8LhvbZGh3L
	lTz0P32BsFj2gbUaokk25CcfFK+IZKI3lrTBwhh5gotMzxdX0fzX3wCaIDM8NXkbjtqZlc0+UKt
	vsf71u56YrAASP+RkL4DrSLE0Pm8nYdm6HDxNJkvJQFXQiiI8uT97fAYilmP2F91iopsvD2RFzK
	tIGsVp08TSMSWZBiR6yfkbg42wf36VVs+uR9attuFgz8wofvuaLv1wvDnw1YcdJAWl7yd3CNN5z
	o2mBAjGsrYpMIJYZaBydiNxbhbLFfmtqKhyI=
X-Received: by 2002:a05:6214:4007:b0:6fb:3579:8f07 with SMTP id 6a1803df08f44-6fb47797d39mr132806336d6.31.1750033778953;
        Sun, 15 Jun 2025 17:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBqQPy7wDp9MZTConVEeH0j9yomXIgn+ZRK0vTJkx+4xisT7RUqA/gJJgdsUCA9jKLz0B0PA==
X-Received: by 2002:a05:6214:4007:b0:6fb:3579:8f07 with SMTP id 6a1803df08f44-6fb47797d39mr132806076d6.31.1750033778345;
        Sun, 15 Jun 2025 17:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac136104sm1334990e87.77.2025.06.15.17.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:29:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 03:28:32 +0300
Subject: [PATCH 20/28] interconnect: qcom: sm6350: convert to dynamic IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rework-icc-v1-20-bc1326294d71@oss.qualcomm.com>
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=48234;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l/GDK516Pef5aGRtzNj+CYesmUAUaQnjiWHcuthC7RI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z/qsodRTfvKasTl94x+3y0bfp9d0X50G9Z04JOPUx/f
 Y/3jeSdTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMhLeEg6Hni3eQlU7Rtf74
 A1LzJuwwnZjld88stMD+2emgS+FVf3yznGMz2JRFLS+nNK/VZjssejJS8OnpTJcZP2yC597mqr+
 mK1HA2OHxw982gEW6gr0nakYH48cWyRt+U9IrrlhZR7O0ztk8b+PVXJEvP5ZoqD6REN3WzDnt81
 +LKf4OR+cbiqxPZtnw0oXffYvNpYl6Gltl9zCUbzsqJ87La/VH0YFH0mjFr3T1F9+cC+X7naz8J
 l/YJbNsUsH3D3O45iyYGKx3c882uTeHI54+WZrZXv38qjBX8qfkzTfP9ucLB1eUCMsxvrv3Z8Gp
 p24L7aVUJsW699kkmr18x1v71LNDXv8fs+j2qUmyde4FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMSBTYWx0ZWRfX8032zM9ecN6o
 iEVnC0swxnj7vthCpj4blNK5IfmFPeQGwnoxd6TIvUyL61Ow1M4CPOr7dAHuKsTB6WtJp0yZeyY
 9TfZ9c8CQuKl+UZeQmQzpE05N2EolOHqXq135xabFisKG0u6pRKPRsoSiM5exXFsYmr0IVtEszt
 fKkC2dBYKlF7l0A3R3UWDdkqXtFixp2UM3HLrdrpF5QRpBVqRLFAhrJUC//nF5Xq+VJWGQ1Tw9T
 P5njQKnryWTOrTwHWHmZ6Ag5obH1iId5uiiAHGjmxUWW+a0MLlCwp3XpAoCBqiylqkXqBQbDZRj
 CffosTs91R0NsUv3qNrdVbqMovdbzmTR4TCg+5OCSDLlkBtfHY0f+T7Kd4ssOwbnvt8TqZczGFo
 r15bO2SOZbzymhnJIK4enWa2kPjv3ied7mHrjWd+EeIVfcbqCIP0AXX3w5OIMXMm66sLIuVp
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=684f6574 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=oxiPl_rVDUTAQTeVsscA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 4oPpcG6B1WLkl3i-YKj0glNiix-0Oe01
X-Proofpoint-ORIG-GUID: 4oPpcG6B1WLkl3i-YKj0glNiix-0Oe01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160001

Stop using fixed and IDs and covert the platform to use dynamic IDs for
the interconnect. This gives more flexibility and also allows us to drop
the .num_links member, saving from possible errors related to it being
not set or set incorrectly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sm6350.c | 770 ++++++++++++++++++-------------------
 drivers/interconnect/qcom/sm6350.h | 139 -------
 2 files changed, 382 insertions(+), 527 deletions(-)

diff --git a/drivers/interconnect/qcom/sm6350.c b/drivers/interconnect/qcom/sm6350.c
index 016f75ef970648b00a87483a6dee04dd8208726f..92a33c307c960157bf537bc5fe28b0348fbb9918 100644
--- a/drivers/interconnect/qcom/sm6350.c
+++ b/drivers/interconnect/qcom/sm6350.c
@@ -13,1153 +13,1137 @@
 
 #include "bcm-voter.h"
 #include "icc-rpmh.h"
-#include "sm6350.h"
+
+static struct qcom_icc_node qhm_a1noc_cfg;
+static struct qcom_icc_node qhm_qup_0;
+static struct qcom_icc_node xm_emmc;
+static struct qcom_icc_node xm_ufs_mem;
+static struct qcom_icc_node qhm_a2noc_cfg;
+static struct qcom_icc_node qhm_qdss_bam;
+static struct qcom_icc_node qhm_qup_1;
+static struct qcom_icc_node qxm_crypto;
+static struct qcom_icc_node qxm_ipa;
+static struct qcom_icc_node xm_qdss_etr;
+static struct qcom_icc_node xm_sdc2;
+static struct qcom_icc_node xm_usb3_0;
+static struct qcom_icc_node qxm_camnoc_hf0_uncomp;
+static struct qcom_icc_node qxm_camnoc_icp_uncomp;
+static struct qcom_icc_node qxm_camnoc_sf_uncomp;
+static struct qcom_icc_node qup0_core_master;
+static struct qcom_icc_node qup1_core_master;
+static struct qcom_icc_node qnm_npu;
+static struct qcom_icc_node qxm_npu_dsp;
+static struct qcom_icc_node qnm_snoc;
+static struct qcom_icc_node xm_qdss_dap;
+static struct qcom_icc_node qhm_cnoc_dc_noc;
+static struct qcom_icc_node acm_apps;
+static struct qcom_icc_node acm_sys_tcu;
+static struct qcom_icc_node qhm_gemnoc_cfg;
+static struct qcom_icc_node qnm_cmpnoc;
+static struct qcom_icc_node qnm_mnoc_hf;
+static struct qcom_icc_node qnm_mnoc_sf;
+static struct qcom_icc_node qnm_snoc_gc;
+static struct qcom_icc_node qnm_snoc_sf;
+static struct qcom_icc_node qxm_gpu;
+static struct qcom_icc_node llcc_mc;
+static struct qcom_icc_node qhm_mnoc_cfg;
+static struct qcom_icc_node qnm_video0;
+static struct qcom_icc_node qnm_video_cvp;
+static struct qcom_icc_node qxm_camnoc_hf;
+static struct qcom_icc_node qxm_camnoc_icp;
+static struct qcom_icc_node qxm_camnoc_sf;
+static struct qcom_icc_node qxm_mdp0;
+static struct qcom_icc_node amm_npu_sys;
+static struct qcom_icc_node qhm_npu_cfg;
+static struct qcom_icc_node qhm_snoc_cfg;
+static struct qcom_icc_node qnm_aggre1_noc;
+static struct qcom_icc_node qnm_aggre2_noc;
+static struct qcom_icc_node qnm_gemnoc;
+static struct qcom_icc_node qxm_pimem;
+static struct qcom_icc_node xm_gic;
+static struct qcom_icc_node qns_a1noc_snoc;
+static struct qcom_icc_node srvc_aggre1_noc;
+static struct qcom_icc_node qns_a2noc_snoc;
+static struct qcom_icc_node srvc_aggre2_noc;
+static struct qcom_icc_node qns_camnoc_uncomp;
+static struct qcom_icc_node qup0_core_slave;
+static struct qcom_icc_node qup1_core_slave;
+static struct qcom_icc_node qns_cdsp_gemnoc;
+static struct qcom_icc_node qhs_a1_noc_cfg;
+static struct qcom_icc_node qhs_a2_noc_cfg;
+static struct qcom_icc_node qhs_ahb2phy0;
+static struct qcom_icc_node qhs_ahb2phy2;
+static struct qcom_icc_node qhs_aoss;
+static struct qcom_icc_node qhs_boot_rom;
+static struct qcom_icc_node qhs_camera_cfg;
+static struct qcom_icc_node qhs_camera_nrt_thrott_cfg;
+static struct qcom_icc_node qhs_camera_rt_throttle_cfg;
+static struct qcom_icc_node qhs_clk_ctl;
+static struct qcom_icc_node qhs_cpr_cx;
+static struct qcom_icc_node qhs_cpr_mx;
+static struct qcom_icc_node qhs_crypto0_cfg;
+static struct qcom_icc_node qhs_dcc_cfg;
+static struct qcom_icc_node qhs_ddrss_cfg;
+static struct qcom_icc_node qhs_display_cfg;
+static struct qcom_icc_node qhs_display_throttle_cfg;
+static struct qcom_icc_node qhs_emmc_cfg;
+static struct qcom_icc_node qhs_glm;
+static struct qcom_icc_node qhs_gpuss_cfg;
+static struct qcom_icc_node qhs_imem_cfg;
+static struct qcom_icc_node qhs_ipa;
+static struct qcom_icc_node qhs_mnoc_cfg;
+static struct qcom_icc_node qhs_mss_cfg;
+static struct qcom_icc_node qhs_npu_cfg;
+static struct qcom_icc_node qhs_pdm;
+static struct qcom_icc_node qhs_pimem_cfg;
+static struct qcom_icc_node qhs_prng;
+static struct qcom_icc_node qhs_qdss_cfg;
+static struct qcom_icc_node qhs_qm_cfg;
+static struct qcom_icc_node qhs_qm_mpu_cfg;
+static struct qcom_icc_node qhs_qup0;
+static struct qcom_icc_node qhs_qup1;
+static struct qcom_icc_node qhs_sdc2;
+static struct qcom_icc_node qhs_security;
+static struct qcom_icc_node qhs_snoc_cfg;
+static struct qcom_icc_node qhs_tcsr;
+static struct qcom_icc_node qhs_ufs_mem_cfg;
+static struct qcom_icc_node qhs_usb3_0;
+static struct qcom_icc_node qhs_venus_cfg;
+static struct qcom_icc_node qhs_venus_throttle_cfg;
+static struct qcom_icc_node qhs_vsense_ctrl_cfg;
+static struct qcom_icc_node srvc_cnoc;
+static struct qcom_icc_node qhs_gemnoc;
+static struct qcom_icc_node qhs_llcc;
+static struct qcom_icc_node qhs_mcdma_ms_mpu_cfg;
+static struct qcom_icc_node qhs_mdsp_ms_mpu_cfg;
+static struct qcom_icc_node qns_gem_noc_snoc;
+static struct qcom_icc_node qns_llcc;
+static struct qcom_icc_node srvc_gemnoc;
+static struct qcom_icc_node ebi;
+static struct qcom_icc_node qns_mem_noc_hf;
+static struct qcom_icc_node qns_mem_noc_sf;
+static struct qcom_icc_node srvc_mnoc;
+static struct qcom_icc_node qhs_cal_dp0;
+static struct qcom_icc_node qhs_cp;
+static struct qcom_icc_node qhs_dma_bwmon;
+static struct qcom_icc_node qhs_dpm;
+static struct qcom_icc_node qhs_isense;
+static struct qcom_icc_node qhs_llm;
+static struct qcom_icc_node qhs_tcm;
+static struct qcom_icc_node qns_npu_sys;
+static struct qcom_icc_node srvc_noc;
+static struct qcom_icc_node qhs_apss;
+static struct qcom_icc_node qns_cnoc;
+static struct qcom_icc_node qns_gemnoc_gc;
+static struct qcom_icc_node qns_gemnoc_sf;
+static struct qcom_icc_node qxs_imem;
+static struct qcom_icc_node qxs_pimem;
+static struct qcom_icc_node srvc_snoc;
+static struct qcom_icc_node xs_qdss_stm;
+static struct qcom_icc_node xs_sys_tcu_cfg;
 
 static struct qcom_icc_node qhm_a1noc_cfg = {
 	.name = "qhm_a1noc_cfg",
-	.id = SM6350_MASTER_A1NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_SERVICE_A1NOC },
+	.link_nodes = { &srvc_aggre1_noc, NULL },
 };
 
 static struct qcom_icc_node qhm_qup_0 = {
 	.name = "qhm_qup_0",
-	.id = SM6350_MASTER_QUP_0,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_A1NOC_SNOC_SLV },
+	.link_nodes = { &qns_a1noc_snoc, NULL },
 };
 
 static struct qcom_icc_node xm_emmc = {
 	.name = "xm_emmc",
-	.id = SM6350_MASTER_EMMC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A1NOC_SNOC_SLV },
+	.link_nodes = { &qns_a1noc_snoc, NULL },
 };
 
 static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
-	.id = SM6350_MASTER_UFS_MEM,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A1NOC_SNOC_SLV },
+	.link_nodes = { &qns_a1noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qhm_a2noc_cfg = {
 	.name = "qhm_a2noc_cfg",
-	.id = SM6350_MASTER_A2NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_SERVICE_A2NOC },
+	.link_nodes = { &srvc_aggre2_noc, NULL },
 };
 
 static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
-	.id = SM6350_MASTER_QDSS_BAM,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qhm_qup_1 = {
 	.name = "qhm_qup_1",
-	.id = SM6350_MASTER_QUP_1,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
-	.id = SM6350_MASTER_CRYPTO_CORE_0,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qxm_ipa = {
 	.name = "qxm_ipa",
-	.id = SM6350_MASTER_IPA,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node xm_qdss_etr = {
 	.name = "xm_qdss_etr",
-	.id = SM6350_MASTER_QDSS_ETR,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
-	.id = SM6350_MASTER_SDCC_2,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
-	.id = SM6350_MASTER_USB3,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_SLV },
+	.link_nodes = { &qns_a2noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qxm_camnoc_hf0_uncomp = {
 	.name = "qxm_camnoc_hf0_uncomp",
-	.id = SM6350_MASTER_CAMNOC_HF0_UNCOMP,
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_CAMNOC_UNCOMP },
+	.link_nodes = { &qns_camnoc_uncomp, NULL },
 };
 
 static struct qcom_icc_node qxm_camnoc_icp_uncomp = {
 	.name = "qxm_camnoc_icp_uncomp",
-	.id = SM6350_MASTER_CAMNOC_ICP_UNCOMP,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_CAMNOC_UNCOMP },
+	.link_nodes = { &qns_camnoc_uncomp, NULL },
 };
 
 static struct qcom_icc_node qxm_camnoc_sf_uncomp = {
 	.name = "qxm_camnoc_sf_uncomp",
-	.id = SM6350_MASTER_CAMNOC_SF_UNCOMP,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_CAMNOC_UNCOMP },
+	.link_nodes = { &qns_camnoc_uncomp, NULL },
 };
 
 static struct qcom_icc_node qup0_core_master = {
 	.name = "qup0_core_master",
-	.id = SM6350_MASTER_QUP_CORE_0,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_QUP_CORE_0 },
+	.link_nodes = { &qup0_core_slave, NULL },
 };
 
 static struct qcom_icc_node qup1_core_master = {
 	.name = "qup1_core_master",
-	.id = SM6350_MASTER_QUP_CORE_1,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_QUP_CORE_1 },
+	.link_nodes = { &qup1_core_slave, NULL },
 };
 
 static struct qcom_icc_node qnm_npu = {
 	.name = "qnm_npu",
-	.id = SM6350_MASTER_NPU,
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_CDSP_GEM_NOC },
+	.link_nodes = { &qns_cdsp_gemnoc, NULL },
 };
 
 static struct qcom_icc_node qxm_npu_dsp = {
 	.name = "qxm_npu_dsp",
-	.id = SM6350_MASTER_NPU_PROC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_CDSP_GEM_NOC },
+	.link_nodes = { &qns_cdsp_gemnoc, NULL },
 };
 
 static struct qcom_icc_node qnm_snoc = {
 	.name = "qnm_snoc",
-	.id = SM6350_SNOC_CNOC_MAS,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 42,
-	.links = { SM6350_SLAVE_CAMERA_CFG,
-		   SM6350_SLAVE_SDCC_2,
-		   SM6350_SLAVE_CNOC_MNOC_CFG,
-		   SM6350_SLAVE_UFS_MEM_CFG,
-		   SM6350_SLAVE_QM_CFG,
-		   SM6350_SLAVE_SNOC_CFG,
-		   SM6350_SLAVE_QM_MPU_CFG,
-		   SM6350_SLAVE_GLM,
-		   SM6350_SLAVE_PDM,
-		   SM6350_SLAVE_CAMERA_NRT_THROTTLE_CFG,
-		   SM6350_SLAVE_A2NOC_CFG,
-		   SM6350_SLAVE_QDSS_CFG,
-		   SM6350_SLAVE_VSENSE_CTRL_CFG,
-		   SM6350_SLAVE_CAMERA_RT_THROTTLE_CFG,
-		   SM6350_SLAVE_DISPLAY_CFG,
-		   SM6350_SLAVE_TCSR,
-		   SM6350_SLAVE_DCC_CFG,
-		   SM6350_SLAVE_CNOC_DDRSS,
-		   SM6350_SLAVE_DISPLAY_THROTTLE_CFG,
-		   SM6350_SLAVE_NPU_CFG,
-		   SM6350_SLAVE_AHB2PHY,
-		   SM6350_SLAVE_GRAPHICS_3D_CFG,
-		   SM6350_SLAVE_BOOT_ROM,
-		   SM6350_SLAVE_VENUS_CFG,
-		   SM6350_SLAVE_IPA_CFG,
-		   SM6350_SLAVE_SECURITY,
-		   SM6350_SLAVE_IMEM_CFG,
-		   SM6350_SLAVE_CNOC_MSS,
-		   SM6350_SLAVE_SERVICE_CNOC,
-		   SM6350_SLAVE_USB3,
-		   SM6350_SLAVE_VENUS_THROTTLE_CFG,
-		   SM6350_SLAVE_RBCPR_CX_CFG,
-		   SM6350_SLAVE_A1NOC_CFG,
-		   SM6350_SLAVE_AOSS,
-		   SM6350_SLAVE_PRNG,
-		   SM6350_SLAVE_EMMC_CFG,
-		   SM6350_SLAVE_CRYPTO_0_CFG,
-		   SM6350_SLAVE_PIMEM_CFG,
-		   SM6350_SLAVE_RBCPR_MX_CFG,
-		   SM6350_SLAVE_QUP_0,
-		   SM6350_SLAVE_QUP_1,
-		   SM6350_SLAVE_CLK_CTL
-	},
+	.link_nodes = { &qhs_camera_cfg,
+			&qhs_sdc2,
+			&qhs_mnoc_cfg,
+			&qhs_ufs_mem_cfg,
+			&qhs_qm_cfg,
+			&qhs_snoc_cfg,
+			&qhs_qm_mpu_cfg,
+			&qhs_glm,
+			&qhs_pdm,
+			&qhs_camera_nrt_thrott_cfg,
+			&qhs_a2_noc_cfg,
+			&qhs_qdss_cfg,
+			&qhs_vsense_ctrl_cfg,
+			&qhs_camera_rt_throttle_cfg,
+			&qhs_display_cfg,
+			&qhs_tcsr,
+			&qhs_dcc_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_display_throttle_cfg,
+			&qhs_npu_cfg,
+			&qhs_ahb2phy0,
+			&qhs_gpuss_cfg,
+			&qhs_boot_rom,
+			&qhs_venus_cfg,
+			&qhs_ipa,
+			&qhs_security,
+			&qhs_imem_cfg,
+			&qhs_mss_cfg,
+			&srvc_cnoc,
+			&qhs_usb3_0,
+			&qhs_venus_throttle_cfg,
+			&qhs_cpr_cx,
+			&qhs_a1_noc_cfg,
+			&qhs_aoss,
+			&qhs_prng,
+			&qhs_emmc_cfg,
+			&qhs_crypto0_cfg,
+			&qhs_pimem_cfg,
+			&qhs_cpr_mx,
+			&qhs_qup0,
+			&qhs_qup1,
+			&qhs_clk_ctl, NULL },
 };
 
 static struct qcom_icc_node xm_qdss_dap = {
 	.name = "xm_qdss_dap",
-	.id = SM6350_MASTER_QDSS_DAP,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 42,
-	.links = { SM6350_SLAVE_CAMERA_CFG,
-		   SM6350_SLAVE_SDCC_2,
-		   SM6350_SLAVE_CNOC_MNOC_CFG,
-		   SM6350_SLAVE_UFS_MEM_CFG,
-		   SM6350_SLAVE_QM_CFG,
-		   SM6350_SLAVE_SNOC_CFG,
-		   SM6350_SLAVE_QM_MPU_CFG,
-		   SM6350_SLAVE_GLM,
-		   SM6350_SLAVE_PDM,
-		   SM6350_SLAVE_CAMERA_NRT_THROTTLE_CFG,
-		   SM6350_SLAVE_A2NOC_CFG,
-		   SM6350_SLAVE_QDSS_CFG,
-		   SM6350_SLAVE_VSENSE_CTRL_CFG,
-		   SM6350_SLAVE_CAMERA_RT_THROTTLE_CFG,
-		   SM6350_SLAVE_DISPLAY_CFG,
-		   SM6350_SLAVE_TCSR,
-		   SM6350_SLAVE_DCC_CFG,
-		   SM6350_SLAVE_CNOC_DDRSS,
-		   SM6350_SLAVE_DISPLAY_THROTTLE_CFG,
-		   SM6350_SLAVE_NPU_CFG,
-		   SM6350_SLAVE_AHB2PHY,
-		   SM6350_SLAVE_GRAPHICS_3D_CFG,
-		   SM6350_SLAVE_BOOT_ROM,
-		   SM6350_SLAVE_VENUS_CFG,
-		   SM6350_SLAVE_IPA_CFG,
-		   SM6350_SLAVE_SECURITY,
-		   SM6350_SLAVE_IMEM_CFG,
-		   SM6350_SLAVE_CNOC_MSS,
-		   SM6350_SLAVE_SERVICE_CNOC,
-		   SM6350_SLAVE_USB3,
-		   SM6350_SLAVE_VENUS_THROTTLE_CFG,
-		   SM6350_SLAVE_RBCPR_CX_CFG,
-		   SM6350_SLAVE_A1NOC_CFG,
-		   SM6350_SLAVE_AOSS,
-		   SM6350_SLAVE_PRNG,
-		   SM6350_SLAVE_EMMC_CFG,
-		   SM6350_SLAVE_CRYPTO_0_CFG,
-		   SM6350_SLAVE_PIMEM_CFG,
-		   SM6350_SLAVE_RBCPR_MX_CFG,
-		   SM6350_SLAVE_QUP_0,
-		   SM6350_SLAVE_QUP_1,
-		   SM6350_SLAVE_CLK_CTL
-	},
+	.link_nodes = { &qhs_camera_cfg,
+			&qhs_sdc2,
+			&qhs_mnoc_cfg,
+			&qhs_ufs_mem_cfg,
+			&qhs_qm_cfg,
+			&qhs_snoc_cfg,
+			&qhs_qm_mpu_cfg,
+			&qhs_glm,
+			&qhs_pdm,
+			&qhs_camera_nrt_thrott_cfg,
+			&qhs_a2_noc_cfg,
+			&qhs_qdss_cfg,
+			&qhs_vsense_ctrl_cfg,
+			&qhs_camera_rt_throttle_cfg,
+			&qhs_display_cfg,
+			&qhs_tcsr,
+			&qhs_dcc_cfg,
+			&qhs_ddrss_cfg,
+			&qhs_display_throttle_cfg,
+			&qhs_npu_cfg,
+			&qhs_ahb2phy0,
+			&qhs_gpuss_cfg,
+			&qhs_boot_rom,
+			&qhs_venus_cfg,
+			&qhs_ipa,
+			&qhs_security,
+			&qhs_imem_cfg,
+			&qhs_mss_cfg,
+			&srvc_cnoc,
+			&qhs_usb3_0,
+			&qhs_venus_throttle_cfg,
+			&qhs_cpr_cx,
+			&qhs_a1_noc_cfg,
+			&qhs_aoss,
+			&qhs_prng,
+			&qhs_emmc_cfg,
+			&qhs_crypto0_cfg,
+			&qhs_pimem_cfg,
+			&qhs_cpr_mx,
+			&qhs_qup0,
+			&qhs_qup1,
+			&qhs_clk_ctl, NULL },
 };
 
 static struct qcom_icc_node qhm_cnoc_dc_noc = {
 	.name = "qhm_cnoc_dc_noc",
-	.id = SM6350_MASTER_CNOC_DC_NOC,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC_CFG,
-		   SM6350_SLAVE_GEM_NOC_CFG
-	},
+	.link_nodes = { &qhs_llcc,
+			&qhs_gemnoc, NULL },
 };
 
 static struct qcom_icc_node acm_apps = {
 	.name = "acm_apps",
-	.id = SM6350_MASTER_AMPSS_M0,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC,
-		   SM6350_SLAVE_GEM_NOC_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_gem_noc_snoc, NULL },
 };
 
 static struct qcom_icc_node acm_sys_tcu = {
 	.name = "acm_sys_tcu",
-	.id = SM6350_MASTER_SYS_TCU,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC,
-		   SM6350_SLAVE_GEM_NOC_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_gem_noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qhm_gemnoc_cfg = {
 	.name = "qhm_gemnoc_cfg",
-	.id = SM6350_MASTER_GEM_NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 3,
-	.links = { SM6350_SLAVE_MCDMA_MS_MPU_CFG,
-		   SM6350_SLAVE_SERVICE_GEM_NOC,
-		   SM6350_SLAVE_MSS_PROC_MS_MPU_CFG
-	},
+	.link_nodes = { &qhs_mcdma_ms_mpu_cfg,
+			&srvc_gemnoc,
+			&qhs_mdsp_ms_mpu_cfg, NULL },
 };
 
 static struct qcom_icc_node qnm_cmpnoc = {
 	.name = "qnm_cmpnoc",
-	.id = SM6350_MASTER_COMPUTE_NOC,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC,
-		   SM6350_SLAVE_GEM_NOC_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_gem_noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
-	.id = SM6350_MASTER_MNOC_HF_MEM_NOC,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC,
-		   SM6350_SLAVE_GEM_NOC_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_gem_noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
-	.id = SM6350_MASTER_MNOC_SF_MEM_NOC,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC,
-		   SM6350_SLAVE_GEM_NOC_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_gem_noc_snoc, NULL },
 };
 
 static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
-	.id = SM6350_MASTER_SNOC_GC_MEM_NOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_LLCC },
+	.link_nodes = { &qns_llcc, NULL },
 };
 
 static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
-	.id = SM6350_MASTER_SNOC_SF_MEM_NOC,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_LLCC },
+	.link_nodes = { &qns_llcc, NULL },
 };
 
 static struct qcom_icc_node qxm_gpu = {
 	.name = "qxm_gpu",
-	.id = SM6350_MASTER_GRAPHICS_3D,
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_LLCC,
-		   SM6350_SLAVE_GEM_NOC_SNOC
-	},
+	.link_nodes = { &qns_llcc,
+			&qns_gem_noc_snoc, NULL },
 };
 
 static struct qcom_icc_node llcc_mc = {
 	.name = "llcc_mc",
-	.id = SM6350_MASTER_LLCC,
 	.channels = 2,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_EBI_CH0 },
+	.link_nodes = { &ebi, NULL },
 };
 
 static struct qcom_icc_node qhm_mnoc_cfg = {
 	.name = "qhm_mnoc_cfg",
-	.id = SM6350_MASTER_CNOC_MNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_SERVICE_MNOC },
+	.link_nodes = { &srvc_mnoc, NULL },
 };
 
 static struct qcom_icc_node qnm_video0 = {
 	.name = "qnm_video0",
-	.id = SM6350_MASTER_VIDEO_P0,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_MNOC_SF_MEM_NOC },
+	.link_nodes = { &qns_mem_noc_sf, NULL },
 };
 
 static struct qcom_icc_node qnm_video_cvp = {
 	.name = "qnm_video_cvp",
-	.id = SM6350_MASTER_VIDEO_PROC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_MNOC_SF_MEM_NOC },
+	.link_nodes = { &qns_mem_noc_sf, NULL },
 };
 
 static struct qcom_icc_node qxm_camnoc_hf = {
 	.name = "qxm_camnoc_hf",
-	.id = SM6350_MASTER_CAMNOC_HF,
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_MNOC_HF_MEM_NOC },
+	.link_nodes = { &qns_mem_noc_hf, NULL },
 };
 
 static struct qcom_icc_node qxm_camnoc_icp = {
 	.name = "qxm_camnoc_icp",
-	.id = SM6350_MASTER_CAMNOC_ICP,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_MNOC_SF_MEM_NOC },
+	.link_nodes = { &qns_mem_noc_sf, NULL },
 };
 
 static struct qcom_icc_node qxm_camnoc_sf = {
 	.name = "qxm_camnoc_sf",
-	.id = SM6350_MASTER_CAMNOC_SF,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_MNOC_SF_MEM_NOC },
+	.link_nodes = { &qns_mem_noc_sf, NULL },
 };
 
 static struct qcom_icc_node qxm_mdp0 = {
 	.name = "qxm_mdp0",
-	.id = SM6350_MASTER_MDP_PORT0,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_MNOC_HF_MEM_NOC },
+	.link_nodes = { &qns_mem_noc_hf, NULL },
 };
 
 static struct qcom_icc_node amm_npu_sys = {
 	.name = "amm_npu_sys",
-	.id = SM6350_MASTER_NPU_SYS,
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_NPU_COMPUTE_NOC },
+	.link_nodes = { &qns_npu_sys, NULL },
 };
 
 static struct qcom_icc_node qhm_npu_cfg = {
 	.name = "qhm_npu_cfg",
-	.id = SM6350_MASTER_NPU_NOC_CFG,
-	.channels = 1,
-	.buswidth = 4,
-	.num_links = 8,
-	.links = { SM6350_SLAVE_SERVICE_NPU_NOC,
-		   SM6350_SLAVE_ISENSE_CFG,
-		   SM6350_SLAVE_NPU_LLM_CFG,
-		   SM6350_SLAVE_NPU_INT_DMA_BWMON_CFG,
-		   SM6350_SLAVE_NPU_CP,
-		   SM6350_SLAVE_NPU_TCM,
-		   SM6350_SLAVE_NPU_CAL_DP0,
-		   SM6350_SLAVE_NPU_DPM
-	},
+	.channels = 1,
+	.buswidth = 4,
+	.link_nodes = { &srvc_noc,
+			&qhs_isense,
+			&qhs_llm,
+			&qhs_dma_bwmon,
+			&qhs_cp,
+			&qhs_tcm,
+			&qhs_cal_dp0,
+			&qhs_dpm, NULL },
 };
 
 static struct qcom_icc_node qhm_snoc_cfg = {
 	.name = "qhm_snoc_cfg",
-	.id = SM6350_MASTER_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_SERVICE_SNOC },
+	.link_nodes = { &srvc_snoc, NULL },
 };
 
 static struct qcom_icc_node qnm_aggre1_noc = {
 	.name = "qnm_aggre1_noc",
-	.id = SM6350_A1NOC_SNOC_MAS,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 6,
-	.links = { SM6350_SLAVE_SNOC_GEM_NOC_SF,
-		   SM6350_SLAVE_PIMEM,
-		   SM6350_SLAVE_OCIMEM,
-		   SM6350_SLAVE_APPSS,
-		   SM6350_SNOC_CNOC_SLV,
-		   SM6350_SLAVE_QDSS_STM
-	},
+	.link_nodes = { &qns_gemnoc_sf,
+			&qxs_pimem,
+			&qxs_imem,
+			&qhs_apss,
+			&qns_cnoc,
+			&xs_qdss_stm, NULL },
 };
 
 static struct qcom_icc_node qnm_aggre2_noc = {
 	.name = "qnm_aggre2_noc",
-	.id = SM6350_A2NOC_SNOC_MAS,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 7,
-	.links = { SM6350_SLAVE_SNOC_GEM_NOC_SF,
-		   SM6350_SLAVE_PIMEM,
-		   SM6350_SLAVE_OCIMEM,
-		   SM6350_SLAVE_APPSS,
-		   SM6350_SNOC_CNOC_SLV,
-		   SM6350_SLAVE_TCU,
-		   SM6350_SLAVE_QDSS_STM
-	},
+	.link_nodes = { &qns_gemnoc_sf,
+			&qxs_pimem,
+			&qxs_imem,
+			&qhs_apss,
+			&qns_cnoc,
+			&xs_sys_tcu_cfg,
+			&xs_qdss_stm, NULL },
 };
 
 static struct qcom_icc_node qnm_gemnoc = {
 	.name = "qnm_gemnoc",
-	.id = SM6350_MASTER_GEM_NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 6,
-	.links = { SM6350_SLAVE_PIMEM,
-		   SM6350_SLAVE_OCIMEM,
-		   SM6350_SLAVE_APPSS,
-		   SM6350_SNOC_CNOC_SLV,
-		   SM6350_SLAVE_TCU,
-		   SM6350_SLAVE_QDSS_STM
-	},
+	.link_nodes = { &qxs_pimem,
+			&qxs_imem,
+			&qhs_apss,
+			&qns_cnoc,
+			&xs_sys_tcu_cfg,
+			&xs_qdss_stm, NULL },
 };
 
 static struct qcom_icc_node qxm_pimem = {
 	.name = "qxm_pimem",
-	.id = SM6350_MASTER_PIMEM,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 2,
-	.links = { SM6350_SLAVE_SNOC_GEM_NOC_GC,
-		   SM6350_SLAVE_OCIMEM
-	},
+	.link_nodes = { &qns_gemnoc_gc,
+			&qxs_imem, NULL },
 };
 
 static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
-	.id = SM6350_MASTER_GIC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_SLAVE_SNOC_GEM_NOC_GC },
+	.link_nodes = { &qns_gemnoc_gc, NULL },
 };
 
 static struct qcom_icc_node qns_a1noc_snoc = {
 	.name = "qns_a1noc_snoc",
-	.id = SM6350_A1NOC_SNOC_SLV,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 1,
-	.links = { SM6350_A1NOC_SNOC_MAS },
+	.link_nodes = { &qnm_aggre1_noc, NULL },
 };
 
 static struct qcom_icc_node srvc_aggre1_noc = {
 	.name = "srvc_aggre1_noc",
-	.id = SM6350_SLAVE_SERVICE_A1NOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_a2noc_snoc = {
 	.name = "qns_a2noc_snoc",
-	.id = SM6350_A2NOC_SNOC_SLV,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 1,
-	.links = { SM6350_A2NOC_SNOC_MAS },
+	.link_nodes = { &qnm_aggre2_noc, NULL },
 };
 
 static struct qcom_icc_node srvc_aggre2_noc = {
 	.name = "srvc_aggre2_noc",
-	.id = SM6350_SLAVE_SERVICE_A2NOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_camnoc_uncomp = {
 	.name = "qns_camnoc_uncomp",
-	.id = SM6350_SLAVE_CAMNOC_UNCOMP,
 	.channels = 1,
 	.buswidth = 32,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qup0_core_slave = {
 	.name = "qup0_core_slave",
-	.id = SM6350_SLAVE_QUP_CORE_0,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qup1_core_slave = {
 	.name = "qup1_core_slave",
-	.id = SM6350_SLAVE_QUP_CORE_1,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_cdsp_gemnoc = {
 	.name = "qns_cdsp_gemnoc",
-	.id = SM6350_SLAVE_CDSP_GEM_NOC,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_MASTER_COMPUTE_NOC },
+	.link_nodes = { &qnm_cmpnoc, NULL },
 };
 
 static struct qcom_icc_node qhs_a1_noc_cfg = {
 	.name = "qhs_a1_noc_cfg",
-	.id = SM6350_SLAVE_A1NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_A1NOC_CFG },
+	.link_nodes = { &qhm_a1noc_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_a2_noc_cfg = {
 	.name = "qhs_a2_noc_cfg",
-	.id = SM6350_SLAVE_A2NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_A2NOC_CFG },
+	.link_nodes = { &qhm_a2noc_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_ahb2phy0 = {
 	.name = "qhs_ahb2phy0",
-	.id = SM6350_SLAVE_AHB2PHY,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ahb2phy2 = {
 	.name = "qhs_ahb2phy2",
-	.id = SM6350_SLAVE_AHB2PHY_2,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_aoss = {
 	.name = "qhs_aoss",
-	.id = SM6350_SLAVE_AOSS,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_boot_rom = {
 	.name = "qhs_boot_rom",
-	.id = SM6350_SLAVE_BOOT_ROM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_camera_cfg = {
 	.name = "qhs_camera_cfg",
-	.id = SM6350_SLAVE_CAMERA_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_camera_nrt_thrott_cfg = {
 	.name = "qhs_camera_nrt_thrott_cfg",
-	.id = SM6350_SLAVE_CAMERA_NRT_THROTTLE_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_camera_rt_throttle_cfg = {
 	.name = "qhs_camera_rt_throttle_cfg",
-	.id = SM6350_SLAVE_CAMERA_RT_THROTTLE_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_clk_ctl = {
 	.name = "qhs_clk_ctl",
-	.id = SM6350_SLAVE_CLK_CTL,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_cpr_cx = {
 	.name = "qhs_cpr_cx",
-	.id = SM6350_SLAVE_RBCPR_CX_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_cpr_mx = {
 	.name = "qhs_cpr_mx",
-	.id = SM6350_SLAVE_RBCPR_MX_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_crypto0_cfg = {
 	.name = "qhs_crypto0_cfg",
-	.id = SM6350_SLAVE_CRYPTO_0_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_dcc_cfg = {
 	.name = "qhs_dcc_cfg",
-	.id = SM6350_SLAVE_DCC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ddrss_cfg = {
 	.name = "qhs_ddrss_cfg",
-	.id = SM6350_SLAVE_CNOC_DDRSS,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_CNOC_DC_NOC },
+	.link_nodes = { &qhm_cnoc_dc_noc, NULL },
 };
 
 static struct qcom_icc_node qhs_display_cfg = {
 	.name = "qhs_display_cfg",
-	.id = SM6350_SLAVE_DISPLAY_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_display_throttle_cfg = {
 	.name = "qhs_display_throttle_cfg",
-	.id = SM6350_SLAVE_DISPLAY_THROTTLE_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_emmc_cfg = {
 	.name = "qhs_emmc_cfg",
-	.id = SM6350_SLAVE_EMMC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_glm = {
 	.name = "qhs_glm",
-	.id = SM6350_SLAVE_GLM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_gpuss_cfg = {
 	.name = "qhs_gpuss_cfg",
-	.id = SM6350_SLAVE_GRAPHICS_3D_CFG,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_imem_cfg = {
 	.name = "qhs_imem_cfg",
-	.id = SM6350_SLAVE_IMEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ipa = {
 	.name = "qhs_ipa",
-	.id = SM6350_SLAVE_IPA_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_mnoc_cfg = {
 	.name = "qhs_mnoc_cfg",
-	.id = SM6350_SLAVE_CNOC_MNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_CNOC_MNOC_CFG },
+	.link_nodes = { &qhm_mnoc_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_mss_cfg = {
 	.name = "qhs_mss_cfg",
-	.id = SM6350_SLAVE_CNOC_MSS,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_npu_cfg = {
 	.name = "qhs_npu_cfg",
-	.id = SM6350_SLAVE_NPU_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_NPU_NOC_CFG },
+	.link_nodes = { &qhm_npu_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_pdm = {
 	.name = "qhs_pdm",
-	.id = SM6350_SLAVE_PDM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_pimem_cfg = {
 	.name = "qhs_pimem_cfg",
-	.id = SM6350_SLAVE_PIMEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_prng = {
 	.name = "qhs_prng",
-	.id = SM6350_SLAVE_PRNG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qdss_cfg = {
 	.name = "qhs_qdss_cfg",
-	.id = SM6350_SLAVE_QDSS_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qm_cfg = {
 	.name = "qhs_qm_cfg",
-	.id = SM6350_SLAVE_QM_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qm_mpu_cfg = {
 	.name = "qhs_qm_mpu_cfg",
-	.id = SM6350_SLAVE_QM_MPU_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qup0 = {
 	.name = "qhs_qup0",
-	.id = SM6350_SLAVE_QUP_0,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_qup1 = {
 	.name = "qhs_qup1",
-	.id = SM6350_SLAVE_QUP_1,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_sdc2 = {
 	.name = "qhs_sdc2",
-	.id = SM6350_SLAVE_SDCC_2,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_security = {
 	.name = "qhs_security",
-	.id = SM6350_SLAVE_SECURITY,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_snoc_cfg = {
 	.name = "qhs_snoc_cfg",
-	.id = SM6350_SLAVE_SNOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_SNOC_CFG },
+	.link_nodes = { &qhm_snoc_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_tcsr = {
 	.name = "qhs_tcsr",
-	.id = SM6350_SLAVE_TCSR,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_ufs_mem_cfg = {
 	.name = "qhs_ufs_mem_cfg",
-	.id = SM6350_SLAVE_UFS_MEM_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_usb3_0 = {
 	.name = "qhs_usb3_0",
-	.id = SM6350_SLAVE_USB3,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_venus_cfg = {
 	.name = "qhs_venus_cfg",
-	.id = SM6350_SLAVE_VENUS_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_venus_throttle_cfg = {
 	.name = "qhs_venus_throttle_cfg",
-	.id = SM6350_SLAVE_VENUS_THROTTLE_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_vsense_ctrl_cfg = {
 	.name = "qhs_vsense_ctrl_cfg",
-	.id = SM6350_SLAVE_VSENSE_CTRL_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node srvc_cnoc = {
 	.name = "srvc_cnoc",
-	.id = SM6350_SLAVE_SERVICE_CNOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_gemnoc = {
 	.name = "qhs_gemnoc",
-	.id = SM6350_SLAVE_GEM_NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 1,
-	.links = { SM6350_MASTER_GEM_NOC_CFG },
+	.link_nodes = { &qhm_gemnoc_cfg, NULL },
 };
 
 static struct qcom_icc_node qhs_llcc = {
 	.name = "qhs_llcc",
-	.id = SM6350_SLAVE_LLCC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_mcdma_ms_mpu_cfg = {
 	.name = "qhs_mcdma_ms_mpu_cfg",
-	.id = SM6350_SLAVE_MCDMA_MS_MPU_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_mdsp_ms_mpu_cfg = {
 	.name = "qhs_mdsp_ms_mpu_cfg",
-	.id = SM6350_SLAVE_MSS_PROC_MS_MPU_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_gem_noc_snoc = {
 	.name = "qns_gem_noc_snoc",
-	.id = SM6350_SLAVE_GEM_NOC_SNOC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_MASTER_GEM_NOC_SNOC },
+	.link_nodes = { &qnm_gemnoc, NULL },
 };
 
 static struct qcom_icc_node qns_llcc = {
 	.name = "qns_llcc",
-	.id = SM6350_SLAVE_LLCC,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 1,
-	.links = { SM6350_MASTER_LLCC },
+	.link_nodes = { &llcc_mc, NULL },
 };
 
 static struct qcom_icc_node srvc_gemnoc = {
 	.name = "srvc_gemnoc",
-	.id = SM6350_SLAVE_SERVICE_GEM_NOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node ebi = {
 	.name = "ebi",
-	.id = SM6350_SLAVE_EBI_CH0,
 	.channels = 2,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_mem_noc_hf = {
 	.name = "qns_mem_noc_hf",
-	.id = SM6350_SLAVE_MNOC_HF_MEM_NOC,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_MASTER_MNOC_HF_MEM_NOC },
+	.link_nodes = { &qnm_mnoc_hf, NULL },
 };
 
 static struct qcom_icc_node qns_mem_noc_sf = {
 	.name = "qns_mem_noc_sf",
-	.id = SM6350_SLAVE_MNOC_SF_MEM_NOC,
 	.channels = 1,
 	.buswidth = 32,
-	.num_links = 1,
-	.links = { SM6350_MASTER_MNOC_SF_MEM_NOC },
+	.link_nodes = { &qnm_mnoc_sf, NULL },
 };
 
 static struct qcom_icc_node srvc_mnoc = {
 	.name = "srvc_mnoc",
-	.id = SM6350_SLAVE_SERVICE_MNOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_cal_dp0 = {
 	.name = "qhs_cal_dp0",
-	.id = SM6350_SLAVE_NPU_CAL_DP0,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_cp = {
 	.name = "qhs_cp",
-	.id = SM6350_SLAVE_NPU_CP,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_dma_bwmon = {
 	.name = "qhs_dma_bwmon",
-	.id = SM6350_SLAVE_NPU_INT_DMA_BWMON_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_dpm = {
 	.name = "qhs_dpm",
-	.id = SM6350_SLAVE_NPU_DPM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_isense = {
 	.name = "qhs_isense",
-	.id = SM6350_SLAVE_ISENSE_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_llm = {
 	.name = "qhs_llm",
-	.id = SM6350_SLAVE_NPU_LLM_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_tcm = {
 	.name = "qhs_tcm",
-	.id = SM6350_SLAVE_NPU_TCM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_npu_sys = {
 	.name = "qns_npu_sys",
-	.id = SM6350_SLAVE_NPU_COMPUTE_NOC,
 	.channels = 2,
 	.buswidth = 32,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node srvc_noc = {
 	.name = "srvc_noc",
-	.id = SM6350_SLAVE_SERVICE_NPU_NOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qhs_apss = {
 	.name = "qhs_apss",
-	.id = SM6350_SLAVE_APPSS,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qns_cnoc = {
 	.name = "qns_cnoc",
-	.id = SM6350_SNOC_CNOC_SLV,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_SNOC_CNOC_MAS },
+	.link_nodes = { &qnm_snoc, NULL },
 };
 
 static struct qcom_icc_node qns_gemnoc_gc = {
 	.name = "qns_gemnoc_gc",
-	.id = SM6350_SLAVE_SNOC_GEM_NOC_GC,
 	.channels = 1,
 	.buswidth = 8,
-	.num_links = 1,
-	.links = { SM6350_MASTER_SNOC_GC_MEM_NOC },
+	.link_nodes = { &qnm_snoc_gc, NULL },
 };
 
 static struct qcom_icc_node qns_gemnoc_sf = {
 	.name = "qns_gemnoc_sf",
-	.id = SM6350_SLAVE_SNOC_GEM_NOC_SF,
 	.channels = 1,
 	.buswidth = 16,
-	.num_links = 1,
-	.links = { SM6350_MASTER_SNOC_SF_MEM_NOC },
+	.link_nodes = { &qnm_snoc_sf, NULL },
 };
 
 static struct qcom_icc_node qxs_imem = {
 	.name = "qxs_imem",
-	.id = SM6350_SLAVE_OCIMEM,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node qxs_pimem = {
 	.name = "qxs_pimem",
-	.id = SM6350_SLAVE_PIMEM,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node srvc_snoc = {
 	.name = "srvc_snoc",
-	.id = SM6350_SLAVE_SERVICE_SNOC,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node xs_qdss_stm = {
 	.name = "xs_qdss_stm",
-	.id = SM6350_SLAVE_QDSS_STM,
 	.channels = 1,
 	.buswidth = 4,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_node xs_sys_tcu_cfg = {
 	.name = "xs_sys_tcu_cfg",
-	.id = SM6350_SLAVE_TCU,
 	.channels = 1,
 	.buswidth = 8,
+	.link_nodes = { NULL },
 };
 
 static struct qcom_icc_bcm bcm_acv = {
@@ -1376,6 +1360,7 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_aggre1_noc = {
+	.alloc_dyn_id = true,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
@@ -1401,6 +1386,7 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_aggre2_noc = {
+	.alloc_dyn_id = true,
 	.nodes = aggre2_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
 	.bcms = aggre2_noc_bcms,
@@ -1428,6 +1414,7 @@ static struct qcom_icc_node * const clk_virt_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_clk_virt = {
+	.alloc_dyn_id = true,
 	.nodes = clk_virt_nodes,
 	.num_nodes = ARRAY_SIZE(clk_virt_nodes),
 	.bcms = clk_virt_bcms,
@@ -1447,6 +1434,7 @@ static struct qcom_icc_node * const compute_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_compute_noc = {
+	.alloc_dyn_id = true,
 	.nodes = compute_noc_nodes,
 	.num_nodes = ARRAY_SIZE(compute_noc_nodes),
 	.bcms = compute_noc_bcms,
@@ -1507,6 +1495,7 @@ static struct qcom_icc_node * const config_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_config_noc = {
+	.alloc_dyn_id = true,
 	.nodes = config_noc_nodes,
 	.num_nodes = ARRAY_SIZE(config_noc_nodes),
 	.bcms = config_noc_bcms,
@@ -1523,6 +1512,7 @@ static struct qcom_icc_node * const dc_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_dc_noc = {
+	.alloc_dyn_id = true,
 	.nodes = dc_noc_nodes,
 	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
 	.bcms = dc_noc_bcms,
@@ -1554,6 +1544,7 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_gem_noc = {
+	.alloc_dyn_id = true,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -1581,6 +1572,7 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_mmss_noc = {
+	.alloc_dyn_id = true,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -1605,6 +1597,7 @@ static struct qcom_icc_node * const npu_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_npu_noc = {
+	.alloc_dyn_id = true,
 	.nodes = npu_noc_nodes,
 	.num_nodes = ARRAY_SIZE(npu_noc_nodes),
 	.bcms = npu_noc_bcms,
@@ -1641,6 +1634,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 };
 
 static const struct qcom_icc_desc sm6350_system_noc = {
+	.alloc_dyn_id = true,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
diff --git a/drivers/interconnect/qcom/sm6350.h b/drivers/interconnect/qcom/sm6350.h
deleted file mode 100644
index 43cf2930c88a5ae1bc36600ab2b3661a4d11ca71..0000000000000000000000000000000000000000
--- a/drivers/interconnect/qcom/sm6350.h
+++ /dev/null
@@ -1,139 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Qualcomm #define SM6350 interconnect IDs
- *
- * Copyright (C) 2022 Luca Weiss <luca.weiss@fairphone.com>
- */
-
-#ifndef __DRIVERS_INTERCONNECT_QCOM_SM6350_H
-#define __DRIVERS_INTERCONNECT_QCOM_SM6350_H
-
-#define SM6350_A1NOC_SNOC_MAS			0
-#define SM6350_A1NOC_SNOC_SLV			1
-#define SM6350_A2NOC_SNOC_MAS			2
-#define SM6350_A2NOC_SNOC_SLV			3
-#define SM6350_MASTER_A1NOC_CFG			4
-#define SM6350_MASTER_A2NOC_CFG			5
-#define SM6350_MASTER_AMPSS_M0			6
-#define SM6350_MASTER_CAMNOC_HF			7
-#define SM6350_MASTER_CAMNOC_HF0_UNCOMP		8
-#define SM6350_MASTER_CAMNOC_ICP		9
-#define SM6350_MASTER_CAMNOC_ICP_UNCOMP		10
-#define SM6350_MASTER_CAMNOC_SF			11
-#define SM6350_MASTER_CAMNOC_SF_UNCOMP		12
-#define SM6350_MASTER_CNOC_DC_NOC		13
-#define SM6350_MASTER_CNOC_MNOC_CFG		14
-#define SM6350_MASTER_COMPUTE_NOC		15
-#define SM6350_MASTER_CRYPTO_CORE_0		16
-#define SM6350_MASTER_EMMC			17
-#define SM6350_MASTER_GEM_NOC_CFG		18
-#define SM6350_MASTER_GEM_NOC_SNOC		19
-#define SM6350_MASTER_GIC			20
-#define SM6350_MASTER_GRAPHICS_3D		21
-#define SM6350_MASTER_IPA			22
-#define SM6350_MASTER_LLCC			23
-#define SM6350_MASTER_MDP_PORT0			24
-#define SM6350_MASTER_MNOC_HF_MEM_NOC		25
-#define SM6350_MASTER_MNOC_SF_MEM_NOC		26
-#define SM6350_MASTER_NPU			27
-#define SM6350_MASTER_NPU_NOC_CFG		28
-#define SM6350_MASTER_NPU_PROC			29
-#define SM6350_MASTER_NPU_SYS			30
-#define SM6350_MASTER_PIMEM			31
-#define SM6350_MASTER_QDSS_BAM			32
-#define SM6350_MASTER_QDSS_DAP			33
-#define SM6350_MASTER_QDSS_ETR			34
-#define SM6350_MASTER_QUP_0			35
-#define SM6350_MASTER_QUP_1			36
-#define SM6350_MASTER_QUP_CORE_0		37
-#define SM6350_MASTER_QUP_CORE_1		38
-#define SM6350_MASTER_SDCC_2			39
-#define SM6350_MASTER_SNOC_CFG			40
-#define SM6350_MASTER_SNOC_GC_MEM_NOC		41
-#define SM6350_MASTER_SNOC_SF_MEM_NOC		42
-#define SM6350_MASTER_SYS_TCU			43
-#define SM6350_MASTER_UFS_MEM			44
-#define SM6350_MASTER_USB3			45
-#define SM6350_MASTER_VIDEO_P0			46
-#define SM6350_MASTER_VIDEO_PROC		47
-#define SM6350_SLAVE_A1NOC_CFG			48
-#define SM6350_SLAVE_A2NOC_CFG			49
-#define SM6350_SLAVE_AHB2PHY			50
-#define SM6350_SLAVE_AHB2PHY_2			51
-#define SM6350_SLAVE_AOSS			52
-#define SM6350_SLAVE_APPSS			53
-#define SM6350_SLAVE_BOOT_ROM			54
-#define SM6350_SLAVE_CAMERA_CFG			55
-#define SM6350_SLAVE_CAMERA_NRT_THROTTLE_CFG	56
-#define SM6350_SLAVE_CAMERA_RT_THROTTLE_CFG	57
-#define SM6350_SLAVE_CAMNOC_UNCOMP		58
-#define SM6350_SLAVE_CDSP_GEM_NOC		59
-#define SM6350_SLAVE_CLK_CTL			60
-#define SM6350_SLAVE_CNOC_DDRSS			61
-#define SM6350_SLAVE_CNOC_MNOC_CFG		62
-#define SM6350_SLAVE_CNOC_MSS			63
-#define SM6350_SLAVE_CRYPTO_0_CFG		64
-#define SM6350_SLAVE_DCC_CFG			65
-#define SM6350_SLAVE_DISPLAY_CFG		66
-#define SM6350_SLAVE_DISPLAY_THROTTLE_CFG	67
-#define SM6350_SLAVE_EBI_CH0			68
-#define SM6350_SLAVE_EMMC_CFG			69
-#define SM6350_SLAVE_GEM_NOC_CFG		70
-#define SM6350_SLAVE_GEM_NOC_SNOC		71
-#define SM6350_SLAVE_GLM			72
-#define SM6350_SLAVE_GRAPHICS_3D_CFG		73
-#define SM6350_SLAVE_IMEM_CFG			74
-#define SM6350_SLAVE_IPA_CFG			75
-#define SM6350_SLAVE_ISENSE_CFG			76
-#define SM6350_SLAVE_LLCC			77
-#define SM6350_SLAVE_LLCC_CFG			78
-#define SM6350_SLAVE_MCDMA_MS_MPU_CFG		79
-#define SM6350_SLAVE_MNOC_HF_MEM_NOC		80
-#define SM6350_SLAVE_MNOC_SF_MEM_NOC		81
-#define SM6350_SLAVE_MSS_PROC_MS_MPU_CFG	82
-#define SM6350_SLAVE_NPU_CAL_DP0		83
-#define SM6350_SLAVE_NPU_CFG			84
-#define SM6350_SLAVE_NPU_COMPUTE_NOC		85
-#define SM6350_SLAVE_NPU_CP			86
-#define SM6350_SLAVE_NPU_DPM			87
-#define SM6350_SLAVE_NPU_INT_DMA_BWMON_CFG	88
-#define SM6350_SLAVE_NPU_LLM_CFG		89
-#define SM6350_SLAVE_NPU_TCM			90
-#define SM6350_SLAVE_OCIMEM			91
-#define SM6350_SLAVE_PDM			92
-#define SM6350_SLAVE_PIMEM			93
-#define SM6350_SLAVE_PIMEM_CFG			94
-#define SM6350_SLAVE_PRNG			95
-#define SM6350_SLAVE_QDSS_CFG			96
-#define SM6350_SLAVE_QDSS_STM			97
-#define SM6350_SLAVE_QM_CFG			98
-#define SM6350_SLAVE_QM_MPU_CFG			99
-#define SM6350_SLAVE_QUP_0			100
-#define SM6350_SLAVE_QUP_1			101
-#define SM6350_SLAVE_QUP_CORE_0			102
-#define SM6350_SLAVE_QUP_CORE_1			103
-#define SM6350_SLAVE_RBCPR_CX_CFG		104
-#define SM6350_SLAVE_RBCPR_MX_CFG		105
-#define SM6350_SLAVE_SDCC_2			106
-#define SM6350_SLAVE_SECURITY			107
-#define SM6350_SLAVE_SERVICE_A1NOC		108
-#define SM6350_SLAVE_SERVICE_A2NOC		109
-#define SM6350_SLAVE_SERVICE_CNOC		110
-#define SM6350_SLAVE_SERVICE_GEM_NOC		111
-#define SM6350_SLAVE_SERVICE_MNOC		112
-#define SM6350_SLAVE_SERVICE_NPU_NOC		113
-#define SM6350_SLAVE_SERVICE_SNOC		114
-#define SM6350_SLAVE_SNOC_CFG			115
-#define SM6350_SLAVE_SNOC_GEM_NOC_GC		116
-#define SM6350_SLAVE_SNOC_GEM_NOC_SF		117
-#define SM6350_SLAVE_TCSR			118
-#define SM6350_SLAVE_TCU			119
-#define SM6350_SLAVE_UFS_MEM_CFG		120
-#define SM6350_SLAVE_USB3			121
-#define SM6350_SLAVE_VENUS_CFG			122
-#define SM6350_SLAVE_VENUS_THROTTLE_CFG		123
-#define SM6350_SLAVE_VSENSE_CTRL_CFG		124
-#define SM6350_SNOC_CNOC_MAS			125
-#define SM6350_SNOC_CNOC_SLV			126
-
-#endif

-- 
2.39.5


