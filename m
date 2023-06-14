Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4987301BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 16:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235239AbjFNOZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 10:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245707AbjFNOZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 10:25:03 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91980212D
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 07:24:49 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EDvEIL008230;
        Wed, 14 Jun 2023 14:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=xeJ42vzI6kcLTQ1YH7JKlCqrtOCvO+glj/2ez7F6UEQ=;
 b=JmAXPkwx+sBlqvjVQipWb5EjFORwywC//3pTG/TKxUs6aCu/ECUxSx4D4yrLN/WgoQwP
 +HTYbjNKHgzEGvQF9JZMw3xBD707IHCxlfYpPm8e8cA66bG3tnK3zDJd4iHIxCZwL43/
 GfqrtiYRtkSMM2rfBgge8Rp5HlX2LqVnGctG3cUtdYJkpZZ5tVNBzLjXCL4AY4oJobze
 u0+JkkssxWvkeOZcXb0nFyZw9v8QALYI2/vWmZo7g/N4ZvYlimirl2wQl6l7Eqk3z2Cj
 83PqWGdmHQZOZnWxse2lYBcoidft56A4fJf2SCvK5Zh5vSgHXrfB/zBXZsBDSwURqa+J Dg== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r6vx8270u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Jun 2023 14:24:48 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 35EEOSOe027279;
        Wed, 14 Jun 2023 14:24:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3r4j8m2a8m-1;
        Wed, 14 Jun 2023 14:24:28 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35EEOSta027265;
        Wed, 14 Jun 2023 14:24:28 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-krichai-hyd.qualcomm.com [10.213.110.112])
        by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 35EEOS7r027264;
        Wed, 14 Jun 2023 14:24:28 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 4058933)
        id D217F3DF9; Wed, 14 Jun 2023 19:54:27 +0530 (+0530)
From:   Krishna chaitanya chundru <quic_krichai@quicinc.com>
To:     manivannan.sadhasivam@linaro.org
Cc:     quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH v4 0/3] PCI: qcom: ep: Add basic interconnect support
Date:   Wed, 14 Jun 2023 19:54:23 +0530
Message-Id: <1686752666-13426-1-git-send-email-quic_krichai@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vvFruIEXePo3id49vRF4JnYK1aEikS6O
X-Proofpoint-GUID: vvFruIEXePo3id49vRF4JnYK1aEikS6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_10,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=621 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140125
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic support for managing "pcie-mem" interconnect path by setting
a low constraint before enabling clocks and updating it after the link
is up based on link speed and width the device got enumerated.

changes from v3:
	- ran make DT_CHECKER_FLAGS=-m dt_binding_check and fixed
	 errors.
	- Added macros in the qcom ep driver patch as suggested by Dmitry
changes from v2:
        - changed the logic for getting speed and width as suggested
         by bjorn.
        - fixed compilation errors.

Krishna chaitanya chundru (3):
  dt-bindings: PCI: qcom: ep: Add interconnects path
  arm: dts: qcom: sdx55: Add interconnect path
  PCI: qcom-ep: Add ICC bandwidth voting support

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 13 ++++
 arch/arm/boot/dts/qcom-sdx55.dtsi                  |  4 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          | 73 ++++++++++++++++++++++
 3 files changed, 90 insertions(+)

-- 
2.7.4

