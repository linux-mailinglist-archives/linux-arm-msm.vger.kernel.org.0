Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8986572985F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 13:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjFILrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 07:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjFILrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 07:47:42 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4C830F4
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 04:47:40 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359Av9Sx024877;
        Fri, 9 Jun 2023 11:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=2+ZrgRy9qQi2x78y9FkGhdUPshggCcu0iE2v7FHHAeo=;
 b=L8J+2InZtp/WmW+QmB8XcjfaJaXhnLZcUTTJKf2pf+fszg5xxHIv4xUpt85Is32XFh7F
 d1qfR71cbeNnubdJfMvliiwcx87Zf1rpuv4/1Htvv32VmF/R4NXE0zB1nKi1Xyb5OdvF
 zLbw5Jqft37cu6JGaRXr+85zlV2BTmcbbzAByO5G3K28zWg9Ww2rn7wbUHhAFLfq969/
 IRJ23Fg+aQMBsMRaNHfW4K3XPaqFoqI8/T+REDZcjleb7xya/qcvt6R9KUxU4kitom0Z
 Dl7Ryxqy2YxO1NXHJ0rA790DbHxPJObB4hgO7HMYDIWY+KF9cemsYNaMdSdbIZK38xE0 Pg== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3w7drqdk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Jun 2023 11:47:39 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 359BlZEr004103;
        Fri, 9 Jun 2023 11:47:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3qyxkmeq2u-1;
        Fri, 09 Jun 2023 11:47:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 359BlZ9V004097;
        Fri, 9 Jun 2023 11:47:35 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-krichai-hyd.qualcomm.com [10.213.110.112])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 359BlYhK004095;
        Fri, 09 Jun 2023 11:47:35 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 4058933)
        id 3C0563313; Fri,  9 Jun 2023 17:17:34 +0530 (+0530)
From:   Krishna chaitanya chundru <quic_krichai@quicinc.com>
To:     manivannan.sadhasivam@linaro.org
Cc:     quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        linux-arm-msm@vger.kernel.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH v3 0/3] PCI: qcom: ep: Add basic interconnect support
Date:   Fri,  9 Jun 2023 17:17:25 +0530
Message-Id: <1686311249-6857-1-git-send-email-quic_krichai@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: shO_Sxd1xW-tt_Jh2IZv9Hk7lDIvnqd7
X-Proofpoint-ORIG-GUID: shO_Sxd1xW-tt_Jh2IZv9Hk7lDIvnqd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=738
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090099
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic support for managing "pcie-mem" interconnect path by setting
a low constraint before enabling clocks and updating it after the link
is up based on link speed and width the device got enumerated.

changes from v2:
	- changed the logic for getting speed and width as suggested
	 by bjorn.
	- fixed compilation errors.

Krishna chaitanya chundru (3):
  dt-bindings: PCI: qcom: ep: Add interconnects path
  arm: dts: qcom: sdx55: Add interconnect path
  PCI: qcom-ep: Add ICC bandwidth voting support

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 11 ++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  4 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          | 68 ++++++++++++++++++++++
 3 files changed, 83 insertions(+)

-- 
2.7.4

