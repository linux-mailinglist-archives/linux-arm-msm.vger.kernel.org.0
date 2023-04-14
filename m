Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28D36E2494
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 15:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjDNNsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 09:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjDNNsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 09:48:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352A6AD2D;
        Fri, 14 Apr 2023 06:48:37 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33EBjOTP006363;
        Fri, 14 Apr 2023 13:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=9zsifeMaKPglAfdOLrr+y9dMzGafc7cyY52ZZ0ooQGY=;
 b=MibDtDFZhLj+IoRSjoZOL9wgkIP3dPCQxSZ1fF2p7mi9XcwPmmgoHmhKmpXEpIUWKZGk
 jhUUpE1nHThhw4HgAHV0rF+veEoe3Z7/jv3C1tG/WxQmIgbMzDdn6uAXKOJH/3UKI3J7
 r5WJFfKrH7X9Pb1gSlL2WISqYTj+CYHsTAojyBulXsVya9RSA8jWeXfhFTna3Q2cT8Kv
 78lOJpI8D29tD4Wjy+9BIySspGJD3HVk2lYJhWB1IVrfEbkddgdZfJS1vd/Www5O7FbO
 veUXephWFYigMpFd4orjNqC3Wve7GYTP8ZPn+hKr6RgB5EP9WzmNbK52WM/eVq3O1PvN Og== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pxx8us7e5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Apr 2023 13:48:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EDmVE7010797
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Apr 2023 13:48:31 GMT
Received: from devipriy-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 14 Apr 2023 06:48:25 -0700
From:   Devi Priya <quic_devipriy@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_arajkuma@quicinc.com>,
        <quic_anusha@quicinc.com>, <quic_poovendh@quicinc.com>
Subject: [PATCH V1 0/4] Incremental patches on minimal boot support 
Date:   Fri, 14 Apr 2023 19:18:08 +0530
Message-ID: <20230414134812.16812-1-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bwVPJk_Hr-4a4qzHdU_kqXte1X98F5-i
X-Proofpoint-GUID: bwVPJk_Hr-4a4qzHdU_kqXte1X98F5-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_06,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140122
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patchset V9 of the series: Add minimal boot support for IPQ9574 has been
merged and is available in linux-next/master.
V12 being the latest revision posted in the series, the delta between
revisions V9 and V12 is posted as a separate series as suggested by 
Bjorn to avoid possible confusions.

This series adds the delta changes between revisions V9 and V12.

V9 can be found at:
https://lore.kernel.org/linux-arm-msm/20230316072940.29137-1-quic_devipriy@quicinc.com/

V12 can be found at:
https://lore.kernel.org/linux-arm-msm/20230410135948.11970-1-quic_devipriy@quicinc.com/

Changes in V1:
	- The Delta between V9 & V12 is added to the change log of
	  the respective patches for quick reference

Devi Priya (4):
  dt-bindings: clock: qcom,ipq9574-gcc: Drop the Bias PLL ubi clock
    source
  clk: qcom: gcc-ipq9574: Drop bias_pll_ubi_nc_clk & add const to
    clk_init_data
  arm64: dts: qcom: ipq9574: Drop Bias PLL clock & update intc node
  arm64: dts: qcom: ipq9574: rename al02-c7 dts to rdp433

 .../bindings/clock/qcom,ipq9574-gcc.yaml      |   3 +-
 arch/arm64/boot/dts/qcom/Makefile             |   2 +-
 ...ipq9574-al02-c7.dts => ipq9574-rdp433.dts} |   2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  13 +-
 drivers/clk/qcom/gcc-ipq9574.c                | 475 +++++++++---------
 5 files changed, 232 insertions(+), 263 deletions(-)
 rename arch/arm64/boot/dts/qcom/{ipq9574-al02-c7.dts => ipq9574-rdp433.dts} (97%)


base-commit: e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
-- 
2.17.1

