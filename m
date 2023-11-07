Return-Path: <linux-arm-msm+bounces-82-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B547E3F36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F701C20BE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548AF22F00;
	Tue,  7 Nov 2023 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GgWp276A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E214F73;
	Tue,  7 Nov 2023 12:50:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BFB9EEF;
	Tue,  7 Nov 2023 04:50:46 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A7Chl6t006795;
	Tue, 7 Nov 2023 12:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=T91N9PvvDeFRsDC96eFiD/ezLDHKPCYShro1pRooun0=;
 b=GgWp276AiFzBgJDNLvMnBsvH9rCXHr+MBmBkQqR2hQdTfbMmZ0cgxiiNXi9pVSEvkB8m
 KqzjunUtIJyZfuSkI9oydPQlMW/tSegpgIf6u+G5wJxsTGvFF+uAlWeA8LRKpzt7X9wo
 Cfz7lHClbq2mWWcfQGHS3pTPBXHNVNsbB8aI8I5w+k+Lta/UUBFbF8RgmLMUBBAjTocJ
 Y+10trumd4uZVg4V/l6eLhH3ecPdc6/4zTAmLWSaa0Q2Q2ucbN0PRDOyD03MRwNrKMjv
 pabs+/hQS6/eNSnLhYW4QlZuQ2otpPq6qa7hbtzHYBpTopgc0EWObFqpXu6ByMQoZ2Nj aQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u73a72bjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 12:50:37 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3A7CoYaJ000737;
	Tue, 7 Nov 2023 12:50:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3u5f1m4014-1;
	Tue, 07 Nov 2023 12:50:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A7CoYt0000731;
	Tue, 7 Nov 2023 12:50:34 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-msarkar-hyd.qualcomm.com [10.213.111.194])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3A7CoXdQ000730;
	Tue, 07 Nov 2023 12:50:34 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3891782)
	id 502514C77; Tue,  7 Nov 2023 18:20:33 +0530 (+0530)
From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
To: agross@kernel.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, konrad.dybcio@linaro.org, mani@kernel.org,
        robh+dt@kernel.org
Cc: quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
        quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
        dmitry.baryshkov@linaro.org, robh@kernel.org, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
        quic_schintav@quicinc.com, quic_shijjose@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev
Subject: [PATCH v7 2/4] PCI: qcom-ep: Add support for SA8775P SOC
Date: Tue,  7 Nov 2023 18:20:26 +0530
Message-Id: <1699361428-12802-3-git-send-email-quic_msarkar@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699361428-12802-1-git-send-email-quic_msarkar@quicinc.com>
References: <1699361428-12802-1-git-send-email-quic_msarkar@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8r6VRtNGiWxfuLpnqyYHrjQXmXpmyrBv
X-Proofpoint-GUID: 8r6VRtNGiWxfuLpnqyYHrjQXmXpmyrBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_02,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070105
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add support for SA8775P SoC to the Qualcomm PCIe Endpoint Controller
driver. Adding new compatible string as it has different set of clocks
compared to other SoCs.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 9e58f05..3a53d97 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -875,6 +875,7 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_pcie_ep_match[] = {
+	{ .compatible = "qcom,sa8775p-pcie-ep", },
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },
 	{ }
-- 
2.7.4


