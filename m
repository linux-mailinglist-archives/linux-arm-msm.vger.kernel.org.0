Return-Path: <linux-arm-msm+bounces-11424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294885898B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 00:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC92828748F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 23:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86258148310;
	Fri, 16 Feb 2024 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o//qEg6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57B146904
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 23:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708124571; cv=none; b=ArGodvQ7DFHlDEyVtHusgfckZjGY1yTRVFpgBjU3dHsnvQcVNgOhKeuQxT9niyLvn8IvQ42ZYhOCHKfPPke7HCFg6lEDggSTJQDvL5zn5EX0UnjzuJHelwrTI7y6lY/8OuuNayxaaHCL+y2ven3CpHJcjOeRY6riwGM8FxggqC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708124571; c=relaxed/simple;
	bh=43njVkgWXghUr+xpD3uMoyQ82kfy4NbTUIfndKFBQDQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VBtZymTVE9l2hPefZBPXIUKnRrdZNI2RX0D3W9gGx+ae+91MdU9rlCsVRyO/I/+uFE8ELITT25wSmfEYtEX6QWflfGZN1C7Me/xlFaIPCBwhk+Y6Pm5RYqNJs79lqQO87ca0uE/Ub6RJdWV6kmgE2QeKonG5Y8/BP6ZDF37jwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o//qEg6A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GMRpgN022962;
	Fri, 16 Feb 2024 23:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Oxy+kfc
	D8jt98HkcrdXiPMdpUZxd/7pqLvDANFVC9bY=; b=o//qEg6Av9V8eZda/5j5VJm
	uUEuZ0mrvX5CPXIueL5OV1p66kgToGPynpFiq8CRS/s/GodeqEjQQAU927uuxhTR
	4YF6yBrTVsxOJYCv5SgWomIkf9nCE6FZkdVyMS0QW+PFOpcc5GiH9GzGwjoVx/up
	ex1R5MsB2YwCiT23nUj2rwA3SDxr9/sdHcmKOcxPYbcjfFtEG3TT9iczKIEAszUV
	59rCNF2gBX6S+ywocG7UxMwf7H7GIpqSqnDU7rUDodor3hDLk0ECqMnDsXiscN8B
	w+rroR6v2kWvd/JG8JNEA1XrkbaR2tScGQnFF4TihQG0zI99GnLnGEEQha6fLRQ=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9xdxa65g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2drV012372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 23:02:39 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:38 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 00/19] Add support for CDM over DP
Date: Fri, 16 Feb 2024 15:01:48 -0800
Message-ID: <20240216230228.26713-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H00Pd8kSs89vVcKCI74O6g41RS9m5tAH
X-Proofpoint-GUID: H00Pd8kSs89vVcKCI74O6g41RS9m5tAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160182

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
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 129 +++++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  10 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |  82 ++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c               |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c             |  56 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   9 +
 drivers/gpu/drm/msm/dp/dp_utils.c             | 129 ++++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h             |  26 +++
 drivers/gpu/drm/msm/msm_drv.h                 |  22 ++-
 23 files changed, 711 insertions(+), 241 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

-- 
2.39.2


