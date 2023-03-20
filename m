Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C096C17E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbjCTPSA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjCTPRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:17:35 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFEA311E1;
        Mon, 20 Mar 2023 08:12:14 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KBuskY014186;
        Mon, 20 Mar 2023 15:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=5cEoU2NBxUwPL3Bn4aaLYv6n6m7115Pf66019maNGR4=;
 b=ZZ607j+9L/Iy4Or+czJNpO4H+qQqk3KHFvSN1Hq0k+1l6xFj7PMKm7gIAPcOMdf2/Gly
 nckEpxGuqj5AHLWfWUswMRlXTCZwCgP8JjybiNWFmgGUPcIROZOs0fkFuwM4z4fR1uda
 6CmJv7uZyFRqlBMnJerQy0eARaUNTH5WJa1oexgMj/hF9LAJ4H0G383BF1+TAccepNwX
 a2MjD63oXw97rrUBal49PguWKnoQTwdS136t8GpNPg3idydF5oeUli4ub8szHTHxHuHl
 wg0mIegaRf/fhXUU/E5sLWGgqvI5TriAN9ZcZRtyGqSgYBn+AKjoF3fsAFvkPXFWU9tQ lg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pepfbgjx0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:12:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32KFBcYH014180
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:11:38 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 08:11:37 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>
CC:     <dafna@fastmail.com>, <dri-devel@lists.freedesktop.org>,
        <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_ajitpals@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v4 0/8] QAIC accel driver
Date:   Mon, 20 Mar 2023 09:11:06 -0600
Message-ID: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QWuFRkAidqlVR9mdaysrrGCpPmwwqLVh
X-Proofpoint-ORIG-GUID: QWuFRkAidqlVR9mdaysrrGCpPmwwqLVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_10,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=863 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303200129
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series introduces a driver under the accel subsystem (QAIC -
Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
a PCIe adapter card that hosts a dedicated machine learning inference
accelerator.

The previous version (v3) can be found at:
https://lore.kernel.org/all/1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com/

v4:
-Whitespace fixes
-Add MODULE_PARM_DESC for the module parameters
-Refactor qaic_open error handling
-Shorten mhi boot error message
-Remove extranious reset check
-Remove _ prefix in qaic_control structs
-Refactor encode_dma()
-Refactor __qaic_execute_bo_ioctl
-Remove extraniuous open_count checks
-List drm-misc tree in MAINTAINERS

v3:
-Various style updates and word smithing
-Remove unused function declarations
-Drop iommu workaround for sg lists and outdated reserve_pages()
-Remove unnecessary includes
-Refactor qaic_pci_probe()
-Use FIELD_PREP for ENCODE_SEM
-Gate qaic subdirectory on the kconfig symbol
-Add dri-devel@lists.freedesktop.org to MAINTAINERS entry
-Rename copy_sgt()
-Correct guard macro for qaic.h and cplusplus macro
-Add comment in qaic_mhi_remove
-Fix qaic_open use after free
-Use devm allocs in qaic_mhi_register_controller()
-Remove partition device ioctl.

v2:
-Addressed comments from RFC
-Reduced the code to the core minimum by dropping telemetery, etc
-Conversion to accel subsystem
-Dropped versioning
-Add mhi_qaic_cntl component
-Restructure the documentation
-Pull in a few fixes from the downstream tree

Jeffrey Hugo (7):
  accel/qaic: Add documentation for AIC100 accelerator driver
  accel/qaic: Add uapi and core driver file
  accel/qaic: Add MHI controller
  accel/qaic: Add control path
  accel/qaic: Add datapath
  accel/qaic: Add qaic driver to the build system
  MAINTAINERS: Add entry for QAIC driver

Pranjal Ramajor Asha Kanojiya (1):
  accel/qaic: Add mhi_qaic_cntl

 Documentation/accel/index.rst       |    1 +
 Documentation/accel/qaic/aic100.rst |  501 +++++++++
 Documentation/accel/qaic/index.rst  |   13 +
 Documentation/accel/qaic/qaic.rst   |  169 ++++
 MAINTAINERS                         |   10 +
 drivers/accel/Kconfig               |    1 +
 drivers/accel/Makefile              |    1 +
 drivers/accel/qaic/Kconfig          |   23 +
 drivers/accel/qaic/Makefile         |   13 +
 drivers/accel/qaic/mhi_controller.c |  563 +++++++++++
 drivers/accel/qaic/mhi_controller.h |   16 +
 drivers/accel/qaic/mhi_qaic_ctrl.c  |  571 +++++++++++
 drivers/accel/qaic/mhi_qaic_ctrl.h  |   12 +
 drivers/accel/qaic/qaic.h           |  282 ++++++
 drivers/accel/qaic/qaic_control.c   | 1527 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_data.c      | 1902 +++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_drv.c       |  647 ++++++++++++
 include/uapi/drm/qaic_accel.h       |  397 ++++++++
 18 files changed, 6649 insertions(+)
 create mode 100644 Documentation/accel/qaic/aic100.rst
 create mode 100644 Documentation/accel/qaic/index.rst
 create mode 100644 Documentation/accel/qaic/qaic.rst
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
 create mode 100644 drivers/accel/qaic/qaic.h
 create mode 100644 drivers/accel/qaic/qaic_control.c
 create mode 100644 drivers/accel/qaic/qaic_data.c
 create mode 100644 drivers/accel/qaic/qaic_drv.c
 create mode 100644 include/uapi/drm/qaic_accel.h

-- 
2.7.4

