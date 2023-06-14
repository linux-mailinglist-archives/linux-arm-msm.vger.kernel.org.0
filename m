Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685567302A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245719AbjFNPBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 11:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245690AbjFNPBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 11:01:43 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9E42955
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 08:01:23 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EENRkW004573;
        Wed, 14 Jun 2023 15:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=D7h4WTI7zh5LbrNJiimtAOgkdxsPJrtlmjnmWuc9zzc=;
 b=fQX+gVJe3KNmvBzumFqrB3EkyVO5UZ9WWCoNyFlvbV50vvGMxCYFEuJZV+w48mAuUK8v
 pHoR/yIduRETM3KiLkqCbYFgW3jKx6Aux+SBSwnk0U1gVGvnpRWp4VJKhn4luk5nwykX
 vXv0gmr7zi2M98xOJT7kGBGpzpVy+Rh+KCF9WD+/W/aeoGU/PBPEJanobdHjMmRmiVzA
 Rcu3i7wXFa8OHBRSXWDRjUOji17rljYJnGswAfFIgvENP7NmLXL56X9KSkUCc5ZaU+4X
 OXkJM0/BUQzKDYVWoOz1SEKHiHFyLisBFtxJnDoazmvCvw4HWUX4WbVdS2tMO/88FhIc 7g== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7auy0vd2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Jun 2023 15:01:19 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 35EF17qn018598;
        Wed, 14 Jun 2023 15:01:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3r7271jay2-1;
        Wed, 14 Jun 2023 15:01:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35EF178S018591;
        Wed, 14 Jun 2023 15:01:07 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-krichai-hyd.qualcomm.com [10.213.110.112])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 35EF175w018589;
        Wed, 14 Jun 2023 15:01:07 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 4058933)
        id 9E7E03E04; Wed, 14 Jun 2023 20:31:06 +0530 (+0530)
From:   Krishna chaitanya chundru <quic_krichai@quicinc.com>
To:     manivannan.sadhasivam@linaro.org
Cc:     quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH RFC v1 0/3] PCI: EPC: Add support to wake up host from D3 states
Date:   Wed, 14 Jun 2023 20:30:46 +0530
Message-Id: <1686754850-29817-1-git-send-email-quic_krichai@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1cAo1sQS7wI4a_JUjxpt2-oBvUyqtDk3
X-Proofpoint-GUID: 1cAo1sQS7wI4a_JUjxpt2-oBvUyqtDk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_10,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 mlxlogscore=431 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140131
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here we propose this patch series to add support in PCI endpoint
driver to wake up host from D3 states.

As endpoint cannot send any data/MSI when the device state is in
D3cold or D3hot. Endpoint needs to bring the device back to D0
to send any kind of data.

For this endpoint needs to send inband PME the device is in D3hot or
toggle wake when the device is D3 cold.

Comments and suggestions are welcome.

Krishna chaitanya chundru (3):
  PCI: endpoint: Add wakeup host API to EPC core
  pci: dwc: Add wakeup host op to pci_epc_ops
  PCI: qcom: ep: Add wake up host op to dw_pcie_ep_ops

 drivers/pci/controller/dwc/pcie-designware-ep.c | 11 ++++++++
 drivers/pci/controller/dwc/pcie-designware.h    |  2 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       | 34 +++++++++++++++++++++++++
 drivers/pci/endpoint/pci-epc-core.c             | 29 +++++++++++++++++++++
 include/linux/pci-epc.h                         |  3 +++
 5 files changed, 79 insertions(+)

-- 
2.7.4

