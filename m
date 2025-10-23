Return-Path: <linux-arm-msm+bounces-78475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB1BBFFC6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C2484E66A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB182EB863;
	Thu, 23 Oct 2025 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxRo1rPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011F2EB5AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206831; cv=none; b=Kif9HVLwRqLW5bvw5DJTiRR7gC/MPS0D0JtfvQ1WPoff+s9t1UZo09RsZCrcxHrC3WdsSWB8VJ59s6XDVCEQzpfpVhUpichE7687GTtzM3AHSXALMXY/zTYqXF95xwzFXmNVIxN9Z5yf7G814QnfuEdNaZGhvjy7D6CygsaFQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206831; c=relaxed/simple;
	bh=oqS4fyJACRH5Z1Ylho3MCJFs1vxZiQBbSa+oy9Jot9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gwf8+ETMoko9f6y/096T1K4KxtwpS+kuJOqS8KfllRBkqdkmtyOGe7WFmB+7jKUHMwdKofVFfFe+vJcSwXTEIukYydujNWf+jC6B8j6R6ei8ME//p1sStE6oi5DLDDBgzBNmSTDJXzlzdJIDpZ3MO+v0KpYoXfD2CgH+vd548es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxRo1rPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7GdMT025827
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2y57vjBvQRy
	nPjVNCLejisP3hBnNMzMj2buG0eqAkR4=; b=nxRo1rPvJ/j8konaVXFRf+tTcrq
	VdjCm6G1AzIlFtiiys6Jp53vTjCw+J3GN2MvCHfDhZnC3YZYFpt7zeeq+SgkqcPr
	efb6PuqDG4dl+d5guJr91xtUBVUAgSPyr3LfN+hagfBVTSFueH+HFxZaifS7BUan
	iWsBehqNjmtRj/QA1rJ2GIDR8eUmPYqckpQFv9nVsmsS6alPj1BOcNpDWNaU3vcP
	MJSEcXTwacSjdSuA8I/lvEvkW1Pvw++HEvZRNNFL7U/P4V2f+uzfg+1bhSaHmcLz
	naHsFs+xgSxVNYUeptxZZ0xmzFqM3eXYGZ7mfjBtRKPaX3Rt40FOlAuB87w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfcfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55443b4110so407296a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206826; x=1761811626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y57vjBvQRynPjVNCLejisP3hBnNMzMj2buG0eqAkR4=;
        b=rPcF6MJf9sQG2kqXISlqauIFKevxZqy1l75p2jUX4YyF2zWc06TSibbja5SMzJt6xO
         6e6SPp7KcHetdKlOGXa6vj+Qla77Lrjo2rObYOPmnHveHHzp5g/3rBlg4Xjsemz4kq4K
         L1WLKqyodUqMwo1TEQZFqCClxGISTKGi3o2YKcpkjPZs/4Zye5eQjUUDmtrpzCAbzqz6
         XfWfa3em1kZMxgDFtC9DqfkhorFR1U+w1lxrLAWm26GTKb8b1K6W0L5t0X3UjWvKMvjA
         DEFaoIKHlrYBGzezydMaErMqCBpPG5sdZsE4qnoV7XxNu/bK7uCtgfilzYRdSXsXYjPs
         izBA==
X-Gm-Message-State: AOJu0Yxl2dHbu4spMjpc8U0NnphCrPwfVBN61odVd26MmmmYh97vTiz3
	uAeRCNmvLuKeEPmzFznKwtPdR2xV22LfCxgZxFPSmWfS0ELYdJanqiCbBH6ZxEpfury50Ht4cXS
	tcC+WrWdzCoNHsOGFCFDGQIgSn7gIyCUgDOEK/nxZ+Wr6h31a12lqCb4XyU33bHwMTxx5
X-Gm-Gg: ASbGnctqu1BjNG0mxsmWCTsnXAAdc0VDndImtVXI5GarQzQkXzxyay4IVhS26Ony8IH
	inE6219jpUaZKgTAaYWd13NJ3/r17w9U7f4q84KakSZjrfuflAQ2l8I871rZoxfzGs91mvuIdy2
	hKJ0M+jHAcswev1jG5Aoshq+mCnGeWQNvfnDRoYZyRYOiuwbvfVks1tkcvWkekZZAZQs0Yicamw
	37L1QniWWnjBoKUHAJ48h4uirlWaQxr1fd7VLr+zRAL7riQu6tVH1QClNH3bjb8kesPj8paH+zQ
	Hc62Ip4MiluhcU1YCOQBqmXEVryPvoVFl1mbTsNCAFQxcW34c7Za75GuznUILJgPgeFEO65L1X/
	c3dbqguin4pFr/Zz7zse2lvj5lnZPGi4EAtxazk06B3zPEi+o4g==
X-Received: by 2002:a05:6a21:4e84:b0:32d:95f2:1fe with SMTP id adf61e73a8af0-33aa5c9acf5mr8252734637.2.1761206826082;
        Thu, 23 Oct 2025 01:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyW0KDjaTvysKi/qBCGP7RNmk3vI0XxZA2EZYyVVBmBeKjBN2RJEydwMUCzKTaXxHY2rohTA==
X-Received: by 2002:a05:6a21:4e84:b0:32d:95f2:1fe with SMTP id adf61e73a8af0-33aa5c9acf5mr8252686637.2.1761206825377;
        Thu, 23 Oct 2025 01:07:05 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:07:04 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 06/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Date: Thu, 23 Oct 2025 16:06:03 +0800
Message-Id: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qt-aqmemGVBCQsWNEZb3ng_QkyYBmKHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX0yToctl5qrno
 UyxNFQ0cGcbXsNoaNww/AjzDiR49NM8ehMDfAhNkP6Ky6XUNxtzPOD+YFgFec926Xu2KnT0ToZi
 KLe4gt7LGEOmhkiPijSgD8T0ePo2usZA9K9gvRElWcrDjmipYgT3z8iuNNpTTfpzL5thl5l7L67
 CCHi48rCFyxUpQVZhlUP3IvDUBGI+X5bCeYkUJOM1Nv4rI0fRgQKnXwvfwJUMxVQQj9wi746Oip
 cJrVcTReXo25JGSAlYM1ye3putpTZwrCUbkN+2V52Cr/pL8SNCyY7/bMwuidWC6go3FCt/acntA
 YFW+xlmd56ACpEL3+TMu4sqCgZ0whY6r5FWDkcKH9QxUSC1L1/xoeOoTEg5Zo1DHqf4wedMl6LY
 65Kn5UQrW98ZEor/5jsrs8VTnkFdpg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9e22b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=J4NRdiTX1Ey9z2XoBqMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Qt-aqmemGVBCQsWNEZb3ng_QkyYBmKHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add support for Kaanapali platform SSPP sub-blocks, which
introduce structural changes including register additions,
removals, and relocations. Add the new common and rectangle
blocks, and update register definitions and handling to
ensure compatibility with DPU v13.0.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 474 +++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |   4 +
 3 files changed, 483 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..7217c952f01c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -17,6 +17,7 @@
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
 
+/* <= v12 DPU */
 /* SSPP registers */
 #define SSPP_SRC_SIZE                      0x00
 #define SSPP_SRC_XY                        0x08
@@ -74,12 +75,116 @@
 #define SSPP_EXCL_REC_XY                   0x1B8
 #define SSPP_CLK_CTRL                      0x330
 
+/* >= v13 DPU */
+/* CMN Registers -> Source Surface Processing Pipe Common SSPP registers */
+/*      Name                                        Offset */
+#define SSPP_CMN_CLK_CTRL                0x0
+#define SSPP_CMN_CLK_STATUS              0x4
+#define SSPP_CMN_MULTI_REC_OP_MODE       0x10
+#define SSPP_CMN_ADDR_CONFIG             0x14
+#define SSPP_CMN_CAC_CTRL                0x20
+#define SSPP_CMN_SYS_CACHE_MODE          0x24
+#define SSPP_CMN_QOS_CTRL                0x28
+#define SSPP_CMN_DANGER_LUT              0x2C
+#define SSPP_CMN_SAFE_LUT                0x30
+
+#define SSPP_CMN_FILL_LEVEL_SCALE                0x3C
+#define SSPP_CMN_FILL_LEVELS                     0x40
+#define SSPP_CMN_STATUS                          0x44
+#define SSPP_CMN_FETCH_DMA_RD_OTS                0x48
+#define SSPP_CMN_FETCH_DTB_WR_PLANE0             0x4C
+#define SSPP_CMN_FETCH_DTB_WR_PLANE1             0x50
+#define SSPP_CMN_FETCH_DTB_WR_PLANE2             0x54
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE0            0x58
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE1            0x5C
+#define SSPP_CMN_DTB_UNPACK_RD_PLANE2            0x60
+#define SSPP_CMN_UNPACK_LINE_COUNT               0x64
+#define SSPP_CMN_TPG_CONTROL                     0x68
+#define SSPP_CMN_TPG_CONFIG                      0x6C
+#define SSPP_CMN_TPG_COMPONENT_LIMITS            0x70
+#define SSPP_CMN_TPG_RECTANGLE                   0x74
+#define SSPP_CMN_TPG_BLACK_WHITE_PATTERN_FRAMES  0x78
+#define SSPP_CMN_TPG_RGB_MAPPING                 0x7C
+#define SSPP_CMN_TPG_PATTERN_GEN_INIT_VAL        0x80
+
+/*RECRegisterset*/
+/*Name        Offset*/
+#define SSPP_REC_SRC_FORMAT                             0x0
+#define SSPP_REC_SRC_UNPACK_PATTERN                     0x4
+#define SSPP_REC_SRC_OP_MODE                            0x8
+#define SSPP_REC_SRC_CONSTANT_COLOR                     0xC
+#define SSPP_REC_SRC_IMG_SIZE                           0x10
+#define SSPP_REC_SRC_SIZE                               0x14
+#define SSPP_REC_SRC_XY                                 0x18
+#define SSPP_REC_OUT_SIZE                               0x1C
+#define SSPP_REC_OUT_XY                                 0x20
+#define SSPP_REC_SW_PIX_EXT_LR                          0x24
+#define SSPP_REC_SW_PIX_EXT_TB                          0x28
+#define SSPP_REC_SRC_SIZE_ODX                           0x30
+#define SSPP_REC_SRC_XY_ODX                             0x34
+#define SSPP_REC_OUT_SIZE_ODX                           0x38
+#define SSPP_REC_OUT_XY_ODX                             0x3C
+#define SSPP_REC_SW_PIX_EXT_LR_ODX                      0x40
+#define SSPP_REC_SW_PIX_EXT_TB_ODX                      0x44
+#define SSPP_REC_PRE_DOWN_SCALE                         0x48
+#define SSPP_REC_SRC0_ADDR                              0x4C
+#define SSPP_REC_SRC1_ADDR                              0x50
+#define SSPP_REC_SRC2_ADDR                              0x54
+#define SSPP_REC_SRC3_ADDR                              0x58
+#define SSPP_REC_SRC_YSTRIDE0                           0x5C
+#define SSPP_REC_SRC_YSTRIDE1                           0x60
+#define SSPP_REC_CURRENT_SRC0_ADDR                      0x64
+#define SSPP_REC_CURRENT_SRC1_ADDR                      0x68
+#define SSPP_REC_CURRENT_SRC2_ADDR                      0x6C
+#define SSPP_REC_CURRENT_SRC3_ADDR                      0x70
+#define SSPP_REC_SRC_ADDR_SW_STATUS                     0x74
+#define SSPP_REC_CDP_CNTL                               0x78
+#define SSPP_REC_TRAFFIC_SHAPER                         0x7C
+#define SSPP_REC_TRAFFIC_SHAPER_PREFILL                 0x80
+#define SSPP_REC_PD_MEM_ALLOC                           0x84
+#define SSPP_REC_QOS_CLAMP                              0x88
+#define SSPP_REC_UIDLE_CTRL_VALUE                       0x8C
+#define SSPP_REC_UBWC_STATIC_CTRL                       0x90
+#define SSPP_REC_UBWC_STATIC_CTRL_OVERRIDE              0x94
+#define SSPP_REC_UBWC_STATS_ROI                         0x98
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI0      0x9C
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI0               0xA0
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI1      0xA4
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI1               0xA8
+#define SSPP_REC_UBWC_STATS_WORST_TILE_ROW_BW_ROI2      0xAC
+#define SSPP_REC_UBWC_STATS_TOTAL_BW_ROI2               0xB0
+#define SSPP_REC_EXCL_REC_CTRL                          0xB4
+#define SSPP_REC_EXCL_REC_SIZE                          0xB8
+#define SSPP_REC_EXCL_REC_XY                            0xBC
+#define SSPP_REC_LINE_INSERTION_CTRL                    0xC0
+#define SSPP_REC_LINE_INSERTION_OUT_SIZE                0xC4
+#define SSPP_REC_FETCH_PIPE_ACTIVE                      0xC8
+#define SSPP_REC_META_ERROR_STATUS                      0xCC
+#define SSPP_REC_UBWC_ERROR_STATUS                      0xD0
+#define SSPP_REC_FLUSH_CTRL                             0xD4
+#define SSPP_REC_INTR_EN                                0xD8
+#define SSPP_REC_INTR_STATUS                            0xDC
+#define SSPP_REC_INTR_CLEAR                             0xE0
+#define SSPP_REC_HSYNC_STATUS                           0xE4
+#define SSPP_REC_FP16_CONFIG                            0x150
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_0              0x154
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_R_1              0x158
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_0              0x15C
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_G_1              0x160
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_0              0x164
+#define SSPP_REC_FP16_CSC_MATRIX_COEFF_B_1              0x168
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_R                   0x16C
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_G                   0x170
+#define SSPP_REC_FP16_CSC_PRE_CLAMP_B                   0x174
+#define SSPP_REC_FP16_CSC_POST_CLAMP                    0x178
+
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
 #define MDSS_MDP_OP_DEINTERLACE            BIT(22)
 #define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
 #define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
 #define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
 #define MDSS_MDP_OP_IGC_EN                 BIT(16)
+#define MDSS_MDP_OP_ROT_90                 BIT(15)
 #define MDSS_MDP_OP_FLIP_UD                BIT(14)
 #define MDSS_MDP_OP_FLIP_LR                BIT(13)
 #define MDSS_MDP_OP_BWC_EN                 BIT(0)
@@ -141,6 +246,12 @@
 /* traffic shaper clock in Hz */
 #define TS_CLK			19200000
 
+static inline u32 _sspp_calculate_rect_off(enum dpu_sspp_multirect_index rect_index,
+					   struct dpu_hw_sspp *ctx)
+{
+	return (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) ?
+			ctx->cap->sblk->sspp_rec0_blk.base : ctx->cap->sblk->sspp_rec1_blk.base;
+}
 
 static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
@@ -169,6 +280,34 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
 }
 
+static void dpu_hw_sspp_setup_multirect_v13(struct dpu_sw_pipe *pipe)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 offset = ctx->cap->sblk->cmn_blk.base;
+	u32 mode_mask;
+
+	if (!ctx)
+		return;
+
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
+		/**
+		 * if rect index is RECT_SOLO, we cannot expect a
+		 * virtual plane sharing the same SSPP id. So we go
+		 * and disable multirect
+		 */
+		mode_mask = 0;
+	} else {
+		mode_mask = DPU_REG_READ(&ctx->hw, offset + SSPP_CMN_MULTI_REC_OP_MODE);
+		mode_mask |= pipe->multirect_index;
+		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
+			mode_mask |= BIT(2);
+		else
+			mode_mask &= ~BIT(2);
+	}
+
+	DPU_REG_WRITE(&ctx->hw, offset + SSPP_CMN_MULTI_REC_OP_MODE, mode_mask);
+}
+
 static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
@@ -328,6 +467,119 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
 }
 
+static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
+		const struct msm_format *fmt, u32 flags)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_blk_reg_map *c;
+	u32 chroma_samp, unpack, src_format;
+	u32 opmode = 0;
+	u32 fast_clear = 0;
+	u32 offset;
+
+	if (!ctx || !fmt)
+		return;
+
+	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	c = &ctx->hw;
+
+	opmode = DPU_REG_READ(c, offset + SSPP_REC_SRC_OP_MODE);
+	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
+			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE
+			| MDSS_MDP_OP_ROT_90);
+
+	if (flags & DPU_SSPP_FLIP_LR)
+		opmode |= MDSS_MDP_OP_FLIP_LR;
+	if (flags & DPU_SSPP_FLIP_UD)
+		opmode |= MDSS_MDP_OP_FLIP_UD;
+	if (flags & DPU_SSPP_ROT_90)
+		opmode |= MDSS_MDP_OP_ROT_90;
+
+	chroma_samp = fmt->chroma_sample;
+	if (flags & DPU_SSPP_SOURCE_ROTATED_90) {
+		if (chroma_samp == CHROMA_H2V1)
+			chroma_samp = CHROMA_H1V2;
+		else if (chroma_samp == CHROMA_H1V2)
+			chroma_samp = CHROMA_H2V1;
+	}
+
+	src_format = (chroma_samp << 23) | (fmt->fetch_type << 19) |
+		(fmt->bpc_a << 6) | (fmt->bpc_r_cr << 4) |
+		(fmt->bpc_b_cb << 2) | (fmt->bpc_g_y << 0);
+
+	if (flags & DPU_SSPP_ROT_90)
+		src_format |= BIT(11); /* ROT90 */
+
+	if (fmt->alpha_enable && fmt->fetch_type == MDP_PLANE_INTERLEAVED)
+		src_format |= BIT(8); /* SRCC3_EN */
+
+	if (flags & DPU_SSPP_SOLID_FILL)
+		src_format |= BIT(22);
+
+	unpack = (fmt->element[3] << 24) | (fmt->element[2] << 16) |
+		(fmt->element[1] << 8) | (fmt->element[0] << 0);
+	src_format |= ((fmt->unpack_count - 1) << 12) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
+		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
+		((fmt->bpp - 1) << 9);
+
+	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		if (MSM_FORMAT_IS_UBWC(fmt))
+			opmode |= MDSS_MDP_OP_BWC_EN;
+		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
+		switch (ctx->ubwc->ubwc_enc_version) {
+		case UBWC_1_0:
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
+				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				      BIT(8) |
+				     (ctx->ubwc->highest_bank_bit << 4));
+			break;
+		case UBWC_2_0:
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
+				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
+				     (ctx->ubwc->highest_bank_bit << 4));
+			break;
+		case UBWC_3_0:
+			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
+				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
+				     (ctx->ubwc->highest_bank_bit << 4));
+			break;
+		case UBWC_4_0:
+			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
+				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
+			break;
+		}
+	}
+
+	opmode |= MDSS_MDP_OP_PE_OVERRIDE;
+
+	/* if this is YUV pixel format, enable CSC */
+	if (MSM_FORMAT_IS_YUV(fmt))
+		src_format |= BIT(15);
+
+	if (MSM_FORMAT_IS_DX(fmt))
+		src_format |= BIT(14);
+
+	/* update scaler opmode, if appropriate */
+	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
+		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
+				   MSM_FORMAT_IS_YUV(fmt));
+	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
+		_sspp_setup_csc10_opmode(ctx,
+					 VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
+					 MSM_FORMAT_IS_YUV(fmt));
+
+	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_FORMAT, src_format);
+	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_UNPACK_PATTERN, unpack);
+	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_OP_MODE, opmode);
+
+	/* clear previous UBWC error */
+	DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_ERROR_STATUS, BIT(31));
+}
+
 static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_pixel_ext *pe_ext)
 {
@@ -385,6 +637,53 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 			tot_req_pixels[3]);
 }
 
+static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
+		struct dpu_hw_pixel_ext *pe_ext)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u8 color;
+	u32 lr_pe[4], tb_pe[4], tot_req_pixels[4];
+	const u32 bytemask = 0xff;
+	const u32 shortmask = 0xffff;
+	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
+
+	if (!ctx || !pe_ext)
+		return;
+
+	c = &ctx->hw;
+	/* program SW pixel extension override for all pipes*/
+	for (color = 0; color < DPU_MAX_PLANES; color++) {
+		/* color 2 has the same set of registers as color 1 */
+		if (color == 2)
+			continue;
+
+		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
+			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
+			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
+			       (pe_ext->left_rpt[color] & bytemask);
+
+		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
+			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
+			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
+			       (pe_ext->top_rpt[color] & bytemask);
+
+		tot_req_pixels[color] = (((pe_ext->roi_h[color] +
+			pe_ext->num_ext_pxls_top[color] +
+			pe_ext->num_ext_pxls_btm[color]) & shortmask) << 16) |
+			((pe_ext->roi_w[color] +
+			pe_ext->num_ext_pxls_left[color] +
+			pe_ext->num_ext_pxls_right[color]) & shortmask);
+	}
+
+	/* color 0 */
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
+
+	/* color 1 and color 2 */
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
+	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
+}
+
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct msm_format *format)
@@ -443,6 +742,36 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(c, out_xy_off, dst_xy);
 }
 
+static void dpu_hw_sspp_setup_rects_v13(struct dpu_sw_pipe *pipe,
+					struct dpu_sw_pipe_cfg *cfg)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_blk_reg_map *c;
+	u32 src_size, src_xy, dst_size, dst_xy;
+	u32 offset;
+
+	if (!ctx || !cfg)
+		return;
+
+	c = &ctx->hw;
+
+	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	/* src and dest rect programming */
+	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
+	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
+		   drm_rect_width(&cfg->src_rect);
+	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
+	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
+		drm_rect_width(&cfg->dst_rect);
+
+	/* rectangle register programming */
+	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_SIZE, src_size);
+	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_XY, src_xy);
+	DPU_REG_WRITE(c, offset + SSPP_REC_OUT_SIZE, dst_size);
+	DPU_REG_WRITE(c, offset + SSPP_REC_OUT_XY, dst_xy);
+}
+
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		struct dpu_hw_fmt_layout *layout)
 {
@@ -497,6 +826,29 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
 }
 
+static void dpu_hw_sspp_setup_sourceaddress_v13(struct dpu_sw_pipe *pipe,
+						struct dpu_hw_fmt_layout *layout)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	int i;
+	u32 addr, ystride0, ystride1;
+
+	if (!ctx)
+		return;
+
+	addr = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
+		DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC0_ADDR + i * 0x4,
+			      layout->plane_addr[i]);
+
+	ystride0 = (layout->plane_pitch[0]) | (layout->plane_pitch[2] << 16);
+	ystride1 = (layout->plane_pitch[1]) | (layout->plane_pitch[3] << 16);
+
+	DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC_YSTRIDE0, ystride0);
+	DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC_YSTRIDE1, ystride1);
+}
+
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
@@ -536,6 +888,24 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 				color);
 }
 
+static void dpu_hw_sspp_setup_solidfill_v13(struct dpu_sw_pipe *pipe, u32 color)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_fmt_layout cfg;
+	u32 offset;
+
+	if (!ctx)
+		return;
+
+	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
+
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
+	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_CONSTANT_COLOR, color);
+}
+
 static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 				      struct dpu_hw_qos_cfg *cfg)
 {
@@ -547,6 +917,17 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 			      cfg);
 }
 
+static void dpu_hw_sspp_setup_qos_lut_v13(struct dpu_hw_sspp *ctx,
+					  struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, 0,
+				  ctx->mdss_ver->core_major_ver >= 4,
+				  cfg);
+}
+
 static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 				       bool danger_safe_en)
 {
@@ -557,6 +938,16 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
+static void dpu_hw_sspp_setup_qos_ctrl_v13(struct dpu_hw_sspp *ctx,
+					   bool danger_safe_en)
+{
+	if (!ctx)
+		return;
+
+	DPU_REG_WRITE(&ctx->hw, SSPP_CMN_QOS_CTRL,
+		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
 				  const struct msm_format *fmt,
 				  bool enable)
@@ -576,6 +967,20 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
 	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
 }
 
+static void dpu_hw_sspp_setup_cdp_v13(struct dpu_sw_pipe *pipe,
+				      const struct msm_format *fmt,
+				      bool enable)
+{
+	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 offset = 0;
+
+	if (!ctx)
+		return;
+
+	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
+	dpu_setup_cdp(&ctx->hw, offset + SSPP_REC_CDP_CNTL, fmt, enable);
+}
+
 static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enable)
 {
 	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
@@ -586,36 +991,69 @@ static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enabl
 	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
 }
 
+static bool dpu_hw_sspp_setup_clk_force_ctrl_v13(struct dpu_hw_sspp *ctx, bool enable)
+{
+	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
+		.reg_off = SSPP_CMN_CLK_CTRL,
+		.bit_off = 0
+	};
+
+	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
+}
+
 static void _setup_layer_ops(struct dpu_hw_sspp *c,
 		unsigned long features, const struct dpu_mdss_version *mdss_rev)
 {
-	c->ops.setup_format = dpu_hw_sspp_setup_format;
-	c->ops.setup_rects = dpu_hw_sspp_setup_rects;
-	c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
-	c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
-	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
-
-	if (test_bit(DPU_SSPP_QOS, &features)) {
-		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
-		c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
+	if (mdss_rev->core_major_ver >= 13) {
+		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
+		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
+		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
+		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
+		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
+
+		if (test_bit(DPU_SSPP_QOS, &features)) {
+			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;
+			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl_v13;
+		}
+
+		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
+		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
+			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect_v13;
+
+		if (test_bit(DPU_SSPP_CDP, &features))
+			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp_v13;
+
+		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl_v13;
+	} else {
+		c->ops.setup_format = dpu_hw_sspp_setup_format;
+		c->ops.setup_rects = dpu_hw_sspp_setup_rects;
+		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
+		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
+		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
+
+		if (test_bit(DPU_SSPP_QOS, &features)) {
+			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
+			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
+		}
+
+		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
+		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
+			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
+
+		if (test_bit(DPU_SSPP_CDP, &features))
+			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
+
+		if (mdss_rev->core_major_ver >= 9)
+			c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
 	}
 
 	if (test_bit(DPU_SSPP_CSC, &features) ||
 		test_bit(DPU_SSPP_CSC_10BIT, &features))
 		c->ops.setup_csc = dpu_hw_sspp_setup_csc;
 
-	if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
-		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
-		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
-
 	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
 
-	if (test_bit(DPU_SSPP_CDP, &features))
-		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
-
-	if (mdss_rev->core_major_ver >= 9)
-		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 486be346d40d..1acf456c425b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -81,6 +81,13 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
 #define QOS_CREQ_LUT_0                    0x14
 #define QOS_CREQ_LUT_1                    0x18
 
+/* CMN_QOS_LUT */
+#define SSPP_CMN_DANGER_LUT                    0x2C
+#define SSPP_CMN_SAFE_LUT                      0x30
+#define SSPP_CMN_CREQ_LUT_0                    0x34
+#define SSPP_CMN_CREQ_LUT_1                    0x38
+#define SSPP_CMN_QOS_CTRL	                    0x28
+
 /* QOS_QOS_CTRL */
 #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
 #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
@@ -475,6 +482,22 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
+void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
+			       bool qos_8lvl,
+			       const struct dpu_hw_qos_cfg *cfg)
+{
+	DPU_REG_WRITE(c, offset + SSPP_CMN_DANGER_LUT, cfg->danger_lut);
+	DPU_REG_WRITE(c, offset + SSPP_CMN_SAFE_LUT, cfg->safe_lut);
+
+	if (qos_8lvl) {
+		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
+		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
+	}
+
+	DPU_REG_WRITE(c, offset + SSPP_CMN_QOS_CTRL,
+		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
+}
+
 /*
  * note: Aside from encoders, input_sel should be set to 0x0 by default
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 67b08e99335d..9d442d6fc11c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -360,6 +360,10 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 			   bool qos_8lvl,
 			   const struct dpu_hw_qos_cfg *cfg);
 
+void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
+			       bool qos_8lvl,
+			       const struct dpu_hw_qos_cfg *cfg);
+
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset, u8 input_sel);
 
-- 
2.34.1


