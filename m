Return-Path: <linux-arm-msm+bounces-4455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B780F87F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 21:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B421C20DA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 20:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC38065A71;
	Tue, 12 Dec 2023 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F+UyFOc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3081AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 12:53:15 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCK7MRW028926;
	Tue, 12 Dec 2023 20:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=zyjbk7U
	eZPdJDYXxESa4NiQUT2dYT+fAUtLh1qiqxNE=; b=F+UyFOc/EkV0MwAh3N7dVZ1
	c0JNdkoJjG4nvD17DOzHM57/1YxmJhPX1wxwynrzC2me5xQbAZMkYxfWy/43lZKr
	c4EGFNaG/ziJUjYEgC1PUVm3eWQVR1xrXCp6eW8FTJUwckO/ez+ov3KqCpqgNw1+
	Cbg4MDe84oLZdkBdBRtpYyhRukHocpUJrbv1XmpFxJ4DVBFIb9FygeeK10HGBtlS
	FSI216M0RwjKal17QKJaumZKzU7jB0MFdI56TpaRdKf9o6ygmLn/h4ZJz8sMg6RA
	M3jWP9QntxkFMOwQp75Ol70SBvKppU60ZJ3b87KInkoCpzJFSNYlsjrRuFHtmGg=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxsms0va7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 20:53:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCKr5UO017762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 20:53:05 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 12:53:04 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <quic_jesszhan@quicinc.com>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 00/15] Add CDM support for MSM writeback
Date: Tue, 12 Dec 2023 12:52:38 -0800
Message-ID: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CeSOpBtCzMOzUoIRulpeiJvGv2kovOqj
X-Proofpoint-GUID: CeSOpBtCzMOzUoIRulpeiJvGv2kovOqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=725 mlxscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312120161

Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
which among other things has a CSC block that can convert RGB input
from the DPU to YUV data.

This block can be used with either HDMI, DP or writeback interface.

In this series, lets first add the support for CDM block to be used
with writeback and then follow-up with support for other interfaces such
as DP.

This was validated by adding support to pass custom output format to the
IGT's kms_writeback test-case, specifically only for the output dump
test-case [1].

The usage for this is:

./kms_writeback -d -f <name of the DRM YUV fmt from igt_fb>

So for NV12, this can be verified with the below command:

./kms_writeback -d -f NV12

[1] : https://patchwork.freedesktop.org/series/122125/

changes in v4:
	- change the debug message when drm_atomic_helper_check_wb_connector_state()
	  returns an error
	- used FIELD_PREP() for dpu_hw_cdm_setup_cdwn() operations
	- change to lowercase hex in dpu_hw_cdm_bind_pingpong_blk()
	- move disable assignment inside else in dpu_hw_cdm_bind_pingpong_blk()

changes in v3:
	- rebase on top of msm-next
	- drop the extra wrapper and export the CSC matrices directly
	- fixes in commit text as requested
	- fixes for kbot errors as reported
	- drop "enable" parameter from bind_pingpong_blk() as we can
	  just use PINGPONG_NONE for disable cases
	  - squash cdm changes in encoder cleanup to the change which allocates cdm
 
changes in v2:
	- rebased on top of current msm-next-lumag
	- fix commit text of some of the patches
	- move csc matrices to dpu_hw_util as they span across DPU
	- move cdm blk define to dpu_hw_catalog as its common across chipsets
	- remove bit magic in dpu_hw_cdm with relevant defines
	- use drmm_kzalloc instead of kzalloc/free
	- protect bind_pingpong_blk with core_rev check
	- drop setup_csc_data() and setup_cdwn() ops as they
	  are merged into enable()
	- protect bind_pingpong_blk with core_rev check
	- drop setup_csc_data() and setup_cdwn() ops as they
	  are merged into enable()
	- move needs_cdm to topology struct
	- call update_pending_flush_cdm even when bind_pingpong_blk
	  is not present
	- drop usage of setup_csc_data() and setup_cdwn() cdm ops
	  as they both have been merged into enable()
	- drop reduntant hw_cdm and hw_pp checks
	- drop fb related checks from dpu_encoder::atomic_mode_set()
	- introduce separate wb2_format arrays for rgb and yuv

Abhinav Kumar (15):
  drm/msm/dpu: add formats check for writeback encoder
  drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
    functionality
  drm/msm/dpu: fix writeback programming for YUV cases
  drm/msm/dpu: move csc matrices to dpu_hw_util
  drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
  drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
  drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
  drm/msm/dpu: add cdm blocks to RM
  drm/msm/dpu: add support to allocate CDM from RM
  drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
  drm/msm/dpu: add an API to setup the CDM block for writeback
  drm/msm/dpu: plug-in the cdm related bits to writeback setup
  drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
  drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
  drm/msm/dpu: add cdm blocks to dpu snapshot

 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   5 +-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   4 +-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   5 +-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  37 +++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   6 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 114 +++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  47 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c    | 245 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h    | 142 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  33 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  44 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  31 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  51 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +
 24 files changed, 771 insertions(+), 46 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

-- 
2.40.1


