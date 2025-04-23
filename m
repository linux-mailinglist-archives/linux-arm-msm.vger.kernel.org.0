Return-Path: <linux-arm-msm+bounces-55224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E935A99A8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2104921A08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05D82BEC47;
	Wed, 23 Apr 2025 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwK3/CXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70A2BEC2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442702; cv=none; b=DDJ/CBweX7X1lIMgvPLuiY44mkKhAMp9NOC+9PBlT3Rd41omywth9fTOjgHZS/uTKkZ75lmLuBpfPeVPuZHlN1QfvcWHh0RsvATYnOEZ+FR/xI2SqZIFbc+diI9tLl3f4rVpvwSQbA45R207DDDOsX5or/H8XpbAmreBESX8m9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442702; c=relaxed/simple;
	bh=DF3ABQYNMw+LppghnAVHZ9m6VDHDVhXtmsQVdMt6Ifo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRo3JKWil/sKTxwCUXiES+HaAmZC7FUpDrgG1lZrYpNJpbZUwYFOSw7ezktXjiS8BFcIME17ZO//fZCyrMJzDSxNjmIAXdIBhOoU65BwwqxGYhdOE4U3TqS3r3WlV6/d7lfMvm5XE9m6nwAXSWQaIKQcaAjD+w8NndbF424gpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwK3/CXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAnici022438
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ns3mhwCZxzgM+qUAwMHbv9USeCvaqLtUzXdAkcs9CY4=; b=PwK3/CXUcxS+hGPL
	Ir0nV6lnwvQnBz5S0IFsl6xpwWlJ+/Zr4ZbOB5xBmxqb5Dr2ZKS9CiKsEz5Fvwmr
	SCFwHAQuglE9+YAGv2wsa1nQWQR5JLCSGrtiVJAmpCjNwAcUUzW37OoygpRm08k0
	JldHaJAK1bS5iicHUf/2Yg/NgsuXyhEkVuVCkSzCjCHRBBIHc5tB/7P/Gt9g+5W1
	gNLLWxE7cI45W8AQmqJFR5O7ChRSXwZcNJS/3XCwceQuQhHcLeUClSrlxBGMeD+E
	1PQ0vgfCF2KhlxgiXoBpeXzyhUq6TCagEDXnJ3HK5jwA/oQsOyY9K7uSOuCmaCSm
	Y+G52A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2be7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c579d37eeeso45032185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442698; x=1746047498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns3mhwCZxzgM+qUAwMHbv9USeCvaqLtUzXdAkcs9CY4=;
        b=AzikUdtwKoUNIyhdU3c8l3uVC/YepQLXjWUBlA/TSyjTMLWKINjn0tXWkCx+wdep4e
         rl0rKtFULuk1Lz6YkxkmVjycmtM+8yEnBvdjyrhx+dYVUctLBUFlMR9RS011SoSaZjxy
         I8YJvnE/DbB9onq6HZX77PD19huDhKfzIcPr2beDX8ZU9sFCgvfU5XYrn50jnb56THb+
         uI9q8CTFkiRomRBVkETXZPr50mHF9QK0PeYX4CCWG5dnKk9nApqMXDrT3nq77kq2QeZK
         mG3dPkGS6UMq0rjzwRRfur5nIkeXMvS7XsbDDEkT1m4wCHm6Sisa8T+2B7HVzQVuVkiy
         bhfA==
X-Gm-Message-State: AOJu0YxYew1yYw+6euxGSnWn5TcGVkC6ecTcMpMfbdVdymdXzIxCmCWJ
	5D7xffCw5MAu7VfM6CDlzuU2QLUez6yOciKOBwAgbEAr/1Eg8zeipSU8x2owRzyMR1E3cEOc7nN
	NWsV9zdJVwjJRB3pk2sV9bvx91Uff4QDexSWpqJAhDXyc+qihSCNq2ubIaoxswiYI
X-Gm-Gg: ASbGncuy4ZeK4SAdWl//NOyrU1EmTIpJoJ3zjJpfpxI0TDqCEJRCJb/j+1x/BDF78tk
	s/hhvBZ9ZZmri62yNA83PJYriLJfCJpjCpdHaT6ZCZ8XVkpfFSCp4soZeBGI39Pq8T6wY4Erwj8
	p4jLvm15NU0X8j4h7hlxGQk18R1FiUzQmMM7JHCfQYaAbO+L8Uhh7Upfa6qkGsvE71xy2tkT6Wf
	01M4e2Dl4ttqrMMr1Rva/KlE0/z882qcPMHFyEC/7a1Qv/656gNlInx8Jf4ZrX/KAdd7dB7eTyE
	1uf04ug3Q6LIb9/6LZG0R5yjqxEH7g0cxGz+zXdbgpr+HejWtpAt0A7Nww+tMjqcVWE9NmHLApK
	3Iv0Z9/R6pQ5uCaHMmK3w0gw0
X-Received: by 2002:a05:620a:31a0:b0:7c5:65ab:4ff2 with SMTP id af79cd13be357-7c956f24f59mr47791685a.46.1745442698448;
        Wed, 23 Apr 2025 14:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1F+zFCL1AZ7XUOvLFuGKWJdgTTFFnd/7wcObsFXqRs92D08l7Ahsa6rQb+1Ve+1f+7DMITA==
X-Received: by 2002:a05:620a:31a0:b0:7c5:65ab:4ff2 with SMTP id af79cd13be357-7c956f24f59mr47787585a.46.1745442697988;
        Wed, 23 Apr 2025 14:11:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:29 +0300
Subject: [PATCH v2 33/33] drm/msm/dpu: move features out of the
 DPU_HW_BLK_INFO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-33-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8tb1+qRLI7JpcBUvNssngnuycT2/Ign7Y6I5ypwrc4k=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuP4rUTHzovqnLryuz41W/Vt+IWLZKr0Ay3+cLBbTV
 ixq59XsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEBGo4GPrEVu+U+reho3Ve
 tZ/Rqyfu9omHFU1i1cxYtT7r3LgsHrgwws17lpzYJJul72u6ROQnrp139qXA7qPqp+IUlSq5pPi
 /Lit+EsL8X6H75mG/L99X1m+K1vq8zI1xzsHLrC4xz3gNV/k4uGR9DV22JN2l0Nf04638MxJRFT
 tMM7bl5511L3KKnPIqwP+o2sn3/7cWcfK9WO260uZ1/KY7h5mYA6q77fXutWT/5xSeyaL57HJS2
 ovNXLwSxiYzL7W415tmtsqrC557vWy9T3xVT0tGnXZtsjBDSWO+kLRgb3Zi8hS+BKbnTWGn1op6
 zbzkdPNWjkNPyq/IXPFViuuivHVkGOyWubE/qDJ6EgkA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UOKvfhmKRn4jtCcnHAgKa0vdKEk5GKpg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX8YVvoZHQJdlV gmGdmgEvHXKSG6nM29S3yMZY6sAuF4bA/L1hqe05FfaUplMmOrna7MUdftP5MDCe+ccoSTj+ffs wF2T/3nYLINNDowqJTWX8y9EcD07vFdzwn5xeiZ9j4Ypg4Kt6sM5LBB7/hqrrqSRvrO5nV1Cn1G
 PtkVPuWqgiJepXtNOHnBx1NoY+yCe+nigr+5Abt6CFoEFR48o1EOB4miVq4fb2vTpCIcerdkyFL RMlhi2ka0dFdaqkJD8c6GTC9NUYDyQe0btt2zmDS9oUSr+d4ADUCIF7vOaHMVNiEhrSgHB/+hjo Cpxunw/DA+M16OdK6OMOphl3PieJb8zBKIWKhIMgyJK1/pRbfRt/KMJSUNlbJOnGG707zsOeyJg
 liqqyGmR/k7enED/+mWJgabjiuy0S2u/nWE6JTWMHucuTcptxSGsE4nEPEyq699QRumpy5UY
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6809578b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cFriiCX7-o5b7acnli0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UOKvfhmKRn4jtCcnHAgKa0vdKEk5GKpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Only SSPP, WB and VBIF still have feature bits remaining, all other
hardware blocks don't have feature bits anymore. Remove the 'features'
from the DPU_HW_BLK_INFO so that it doesn't get included into hw info
structures by default and only include it when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h         | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c             |  4 ++--
 6 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index a065f102ce592311376f1186add7a47dca7fd84f..26883f6b66b3e506d14eeb1c0bd64f556d19fef8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sm6150_dpu_caps = {
 static const struct dpu_mdp_cfg sm6150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 8c909c41b48a18fdc54753c68bc2ad19001cd3b4..1884371736bfcf78a99661baedadc0450bb4376e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sm6125_dpu_caps = {
 static const struct dpu_mdp_cfg sm6125_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ffc54f77fe5c8883e926e0c63825c9424904cf2d..f5ce35cd966459f0edf2dbdd2dbc2693779fac73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -124,14 +124,12 @@ enum {
  * @id:                enum identifying this block
  * @base:              register base offset to mdss
  * @len:               length of hardware block
- * @features           bit mask identifying sub-blocks/features
  */
 #define DPU_HW_BLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
 	u32 id; \
 	u32 base; \
-	u32 len; \
-	unsigned long features
+	u32 len
 
 /**
  * struct dpu_scaler_blk: Scaler information
@@ -348,7 +346,6 @@ struct dpu_clk_ctrl_reg {
 /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
- * @features           bit mask identifying sub-blocks/features
  * @clk_ctrls          clock control register definition
  */
 struct dpu_mdp_cfg {
@@ -359,7 +356,6 @@ struct dpu_mdp_cfg {
 /* struct dpu_ctl_cfg : MDP CTL instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
- * @features           bit mask identifying sub-blocks/features
  * @intr_start:        interrupt index for CTL_START
  * @has_split_display:	CTL supports video mode split display
  */
@@ -381,6 +377,7 @@ struct dpu_ctl_cfg {
  */
 struct dpu_sspp_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_sspp_sub_blks *sblk;
 	u32 xin_id;
 	enum dpu_clk_ctrl_type clk_ctrl;
@@ -391,7 +388,6 @@ struct dpu_sspp_cfg {
  * struct dpu_lm_cfg - information of layer mixer blocks
  * @id:                index identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
  * @lm_pair:           ID of LM that can be controlled by same CTL
@@ -410,7 +406,6 @@ struct dpu_lm_cfg {
  * struct dpu_dspp_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  *                     supported by this block
  * @sblk               sub-blocks information
  */
@@ -423,7 +418,6 @@ struct dpu_dspp_cfg  {
  * struct dpu_pingpong_cfg - information of PING-PONG blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @intr_done:         index for PINGPONG done interrupt
  * @intr_rdptr:        index for PINGPONG readpointer done interrupt
  * @sblk               sub-blocks information
@@ -440,8 +434,6 @@ struct dpu_pingpong_cfg  {
  * struct dpu_merge_3d_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- *                     supported by this block
  * @sblk               sub-blocks information
  */
 struct dpu_merge_3d_cfg  {
@@ -454,7 +446,6 @@ struct dpu_merge_3d_cfg  {
  * @id                 enum identifying this block
  * @base               register offset of this block
  * @len:               length of hardware block
- * @features           bit mask identifying sub-blocks/features
  * @sblk:              sub-blocks information
  * @have_native_42x:	Supports NATIVE_422 and NATIVE_420 encoding
  */
@@ -468,7 +459,6 @@ struct dpu_dsc_cfg {
  * struct dpu_intf_cfg - information of timing engine blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @type:              Interface type(DSI, DP, HDMI)
  * @controller_id:     Controller Instance ID in case of multiple of intf type
  * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
@@ -499,6 +489,7 @@ struct dpu_intf_cfg  {
  */
 struct dpu_wb_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
@@ -567,6 +558,7 @@ struct dpu_vbif_qos_tbl {
  */
 struct dpu_vbif_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
 	u32 xin_halt_timeout;
@@ -584,7 +576,6 @@ struct dpu_vbif_cfg {
  * @name               string name for debug purposes
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  */
 struct dpu_cdm_cfg {
 	DPU_HW_BLK_INFO;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index 42b4a5dbc2442ae0f2adab80a5a3df96b35e62b0..df6e43672422f1d796e38c32256582900f58523e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -360,8 +360,7 @@ static void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
 	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
 }
 
-static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
-			       const unsigned long features)
+static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops)
 {
 	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
 	ops->dsc_config = dpu_hw_dsc_config_1_2;
@@ -391,7 +390,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
+	_setup_dcs_ops_1_2(&c->ops);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 0b3325f9c8705999e1003e5c88872562e880229b..83b1dbecddd2b30402f47155fa2f9a148ead02c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -33,8 +33,7 @@ static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 	}
 }
 
-static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
-				unsigned long features)
+static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c)
 {
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
@@ -62,7 +61,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_merge_3d_ops(c, c->caps->features);
+	_setup_merge_3d_ops(c);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 5c811f0142d5e2a012d7e9b3a918818f22ec11cf..96dc10589bee6cf144eabaecf9f8ec5777431ac3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -264,7 +264,7 @@ static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
 }
 
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
+			   const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
@@ -313,7 +313,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 	 * Assign ops
 	 */
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
+	_setup_mdp_ops(&mdp->ops, mdss_rev);
 
 	return mdp;
 }

-- 
2.39.5


