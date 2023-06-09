Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605F6728F5F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 07:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbjFIFm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 01:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjFIFmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 01:42:55 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B48326B9;
        Thu,  8 Jun 2023 22:42:54 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3595JeFh031135;
        Fri, 9 Jun 2023 05:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=NDYKu8yT158iL79Y8HDWuq5iNH+Ix3w/XHZcgbrFGyE=;
 b=aOHudrwQyLFA3PdIInjZxqw1aSAIUJqtNtvPyy2JpbcbVFZmvCg5HOCUqWMyetJHgr8j
 N0EXRdS+KPdXlzFwM4NC9UOuobhye3Sdd0GyOYvRXuQAED+fAZ1THTztI4mWlvRbv/Tk
 149Mi5cIw2EQe/GTHOhLaWBiYSqW4L1KX4jJ742HuJwldYUigxrL0nGfx2xqlIeJx/Ak
 dlHLhofck3UeArDWm1VuyS9QF3MIVct9fvcv3V9lW6dNylWXWNTPrChrRAdVbrdTFYad
 Wf4mPPiRfPDDfA6ic2FxfL2X5m1OWrERJli9AkwZI1Y6Epo0j81NY3UcZHRrOr1iuWlc cA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3vu4g4vm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Jun 2023 05:42:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3595g5FN026342
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 9 Jun 2023 05:42:05 GMT
Received: from hu-ppareek-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 22:41:59 -0700
From:   Parikshit Pareek <quic_ppareek@quicinc.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel" <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Parikshit Pareek <quic_ppareek@quicinc.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sa8775p: Add interconnect to SMMU
Date:   Fri, 9 Jun 2023 11:11:39 +0530
Message-ID: <20230609054141.18938-1-quic_ppareek@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F5fItiGO6RUrAIB7Be9QZsD5FPE8uGne
X-Proofpoint-ORIG-GUID: F5fItiGO6RUrAIB7Be9QZsD5FPE8uGne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_03,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090049
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some qcom SoCs have SMMUs, which need the interconnect bandwidth to be
This series introduce the due support for associated interconnect, and
setting of the due interconnect-bandwidth. Setting due interconnect
bandwidth is needed to avoid the issues like [1], caused by not having
due clock votes(indirectly dependent upon interconnect bandwidth).

Parikshit Pareek (3):
  dt-bindings: arm-smmu: Add interconnect for qcom SMMUs
  arm64: dts: qcom: sa8775p: Add interconnect to PCIe SMMU
  iommu/arm-smmu-qcom: Add support for the interconnect

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 22 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  4 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 16 ++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.17.1

