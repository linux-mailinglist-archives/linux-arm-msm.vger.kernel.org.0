Return-Path: <linux-arm-msm+bounces-12222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBF860326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 20:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B77C7B31584
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96912D1FD;
	Thu, 22 Feb 2024 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SBe17f+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A9C5491B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630848; cv=none; b=HXVlkoHwJ3xtXIWCKDsEidGjPuaM9iCoRZIYFrcaFLPMDC25K+MeSSiG8+ZxN4pbxdGwRmIrVq/zW3qSKopG+o0xq9N59BLXi4K/g/Ye0/krgIoHD05areuUBhOmx5D3KLQmg0VxWJzb/3DCE739LlXPO1p9tLfJ/LPhg+rMzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630848; c=relaxed/simple;
	bh=eqxGfdgpX8cqiXDLXYUvDS52eEOtCG9XsEX02HZhAiU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q1hZN02FChYSBR9eaD1LpVCQ9nP+Ok7DOxnO7Jwci/Y3GK7ArBll2uLSa1ZOoHCy9W9QNdZgCz/9P6APR7EaXEUHcNmB9IYr8txh3lXS3yqLvhvZUhLI5KOeuIWm9CXyWd6Y0G+Gi5X9hw8TKB7gju+2d8sK/M3S628NyFMM9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SBe17f+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41M6n8G6020267;
	Thu, 22 Feb 2024 19:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=vnYtwIw
	K/xafM1SrF8XGxwPzsQ4lrNMSqTXe0pY/xcM=; b=SBe17f+4pciaMz0yJ8AUe3M
	BOh4tZXbGOTC5oKqN00aXW+muKjequETfq0ifyFPJDp5WkgrXYeb77WNgPeRvuGc
	79furCacDPNRtwJQ3S55dDJAN67xMPC++tt6N6HzCh1NyjGlJJCFyGp2lKmt24jB
	HTVMMMN0AOYzrJTABGzawUFjQLhgw2m1Y4L+8SgWfO4SFcIe7ywqJZeguPpZ1qga
	XzyaZU4v5tkK2XT30C9b7aHzNuQMBHTB0IoBEqomuT9XTYTyjJc2VRr1InbGbzhy
	SOvKtGQBNRtgUHHrYs8WEmRZqhX0KxX4X/uWgJHW2+5KVeHL4sy0AP3OVqCB/oQ=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we1b0jd2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJebPX018257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:37 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:37 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 00/19] Add support for CDM over DP
Date: Thu, 22 Feb 2024 11:39:45 -0800
Message-ID: <20240222194025.25329-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pfaiFEJrI3e6gY1j5LZe-PQvHxZjrGOX
X-Proofpoint-GUID: pfaiFEJrI3e6gY1j5LZe-PQvHxZjrGOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

The Chroma Down Sampling (CDM) block is a hardware component in the DPU
pipeline that includes a CSC block capable of converting RGB input from
the DPU to YUV data.

This block can be used with either HDMI, DP, or writeback interfaces.
This series adds support for the CDM block to be used with DP in
YUV420 mode format.

This series allows selection of the YUV420 format for monitors which support
certain resolutions only in YUV420 thus unblocking the validation of many
other resolutions which were previously filtered out if the connector did
not support YUV420.

This was validated using a DP connected monitor requiring the use of
YUV420 format.

This series is dependent on [1], [2], and [3]:
[1] https://patchwork.freedesktop.org/series/118831/
[2] https://patchwork.freedesktop.org/series/129395/
[3] https://patchwork.freedesktop.org/series/129864/

Changes in v5:
	- Slightly modify use of drm_dp_vsc_sdp_pack()
	- Remove dp_catalog NULL checks
	- Modify dp_utils_pack_sdp_header() to cleanly pack the header
	  buffer
	- Remove the dp_utils_pack_vsc_sdp() function and only call
	  drm_dp_vsc_sdp_pack() in dp_panel_setup_vsc_sdp_yuv_420()
	- To clearly show the relationship between the header buffer and
	  vsc_sdp struct, move dp_utils_pack_sdp_header() inside of
	  dp_catalog_panel_send_vsc_sdp()

Changes in v4:
	- Use dp_utils_pack_sdp_header() to pack the SDP header and
	  parity bytes into a buffer
	- Use this buffer when writing the VSC SDP data in
	  dp_catalog_panel_send_vsc_sdp() and write to all the
	  MMSS_DP_GENERIC0 registers
	- Clear up that DP_MAINLINK_CTRL_FLUSH_MODE register requires
	  the use of bits [24:23]
	- Modify certain macros to explicitly set their values in the
	  bits of DP_MAINLINK_CTRL_FLUSH_MODE_MASK
	- Remove hw_cdm check in dpu_encoder_needs_periph_flush() and
	  dpu_encoder_phys_vid_enable()

Changes in v3:
	- Change ordering of the header byte macros in dp_utils.h
	- Create a new struct, msm_dp_sdp_with_parity
 	- Utilize drm_dp_vsc_sdp_pack() from a new added dependency of
	  series [3] to pack the VSC SDP data into the new
	  msm_dp_sdp_with_parity struct instead of packing only for
	  YUV420
	- Modify dp_catalog_panel_send_vsc_sdp() so that it sends the VSC SDP data
	  using the new msm_dp_sdp_with_parity struct
	- Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE macro is setting
	  multiple bits and not just one
	- Move the connector's ycbcr_420_allowed parameter so it is no longer
	  dependent on if the dp_display is not eDP

Changes in v2:
	- Minor formatting changes throughout
	- Move 'fixes' patch to the top
	- Move VSC SDP support check API from dp_panel.c to drm_dp_helper.c
	- Create a separate patch for modifying the dimensions for CDM setup to be
	  non-WB specific
	- Remove a patch that modified the INTF_CONFIG2 register in favor of having
	  this series be dependent on [2]
	- Separate configuration ctrl programming from clock related programming into
	  two patches
	- Add a VSC SDP check in dp_bridge_mode_valid()
	- Move parity calculation functions to new files dp_utils.c and dp_utils.h
	- Remove dp_catalog_hw_revision() changes and utilize the original version of
	  the function when checking the DP hardware version
	- Create separate packing and programming functions for the VSC SDP
	- Make the packing header bytes function generic so it can be used with
	  dp_audio.c
	- Create two separate enable/disable VSC SDP functions instead of having one
	  with the ability to do both
	- Move timing engine programming to a separate patch from original encoder
	  programming patch
	- Move update_pending_flush_periph() code to be in the same patch as the
	  encoder programming
	- Create new API's to check if the dpu encoder needs a peripheral flush
	- Allow YUV420 modes for the DP connector when there's a CDM block available
	  instead of checking if VSC SDP is supported

Kuogee Hsieh (1):
  drm/msm/dpu: add support of new peripheral flush mechanism

Paloma Arellano (18):
  drm/msm/dpu: allow certain formats for CDM for DP
  drm/msm/dpu: add division of drm_display_mode's hskew parameter
  drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
  drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
  drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
  drm/msm/dp: rename wide_bus_en to wide_bus_supported
  drm/msm/dp: store mode YUV420 information to be used by rest of DP
  drm/msm/dp: check if VSC SDP is supported in DP programming
  drm/msm/dpu: move widebus logic to its own API
  drm/msm/dp: program config ctrl for YUV420 over DP
  drm/msm/dp: change clock related programming for YUV420 over DP
  drm/msm/dp: move parity calculation to dp_utils
  drm/msm/dp: add VSC SDP support for YUV420 over DP
  drm/msm/dp: enable SDP and SDE periph flush update
  drm/msm/dpu: modify encoder programming for CDM over DP
  drm/msm/dpu: modify timing engine programming for YUV420 over DP
  drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
  drm/msm/dp: allow YUV420 mode for DP connector when CDM available

 drivers/gpu/drm/msm/Makefile                  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 164 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  26 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  30 +++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 100 +----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  17 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  10 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             | 101 ++---------
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 115 +++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h           |   9 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  82 ++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c               |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c             |  53 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   9 +
 drivers/gpu/drm/msm/dp/dp_utils.c             |  98 +++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h             |  36 ++++
 drivers/gpu/drm/msm/msm_drv.h                 |  22 ++-
 23 files changed, 672 insertions(+), 241 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

-- 
2.39.2


