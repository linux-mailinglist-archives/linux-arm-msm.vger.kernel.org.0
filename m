Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9ED68C20A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 16:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjBFPoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 10:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjBFPnx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 10:43:53 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138D629E04;
        Mon,  6 Feb 2023 07:43:21 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316Cn3YZ031828;
        Mon, 6 Feb 2023 15:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=PdJ77QJJO0IrsL0a5Iz0HPLkqZ27h5nEhQ1M+6UVm+o=;
 b=oAh0nS0sl7JTxO35XfoaYMlNELGV5SjRCYrNzcMqcYbAaUFUMya/trnZ0RJ9voiAAEiF
 hcL1HYYMcAQmNTJ/pssIysGEMbrLtb6TA1i2WIcKtxV4O5BKU5FOkqW7qCi3Ad4bTErZ
 UkhuUVEgeJKbDrTPZM08Zoz5SOmhwvb8Fa6agemeUiyweOWMjJq+x348m0yfY8Ig0Caa
 om4+l3xSQ05Ao04fnNLlDPh2rilkoxY4c7GVHDz6VI4DI/bFbvwf12t3BylJO3UZCc7Y
 M4Czu+7TCD1cZ6qY5b42OUffg5aEJGC+YTVA2Yda0UOgQ1fcRwlfDnHuZ2uOkeI8uH7X Hg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhgng3v2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Feb 2023 15:42:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316FgOjP017319
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Feb 2023 15:42:24 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 07:42:23 -0800
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 8/8] MAINTAINERS: Add entry for QAIC driver
Date:   Mon, 6 Feb 2023 08:41:45 -0700
Message-ID: <1675698105-19025-9-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4lWEA5ZaM8yAbOdC3hJm5ww9aHzyGh7h
X-Proofpoint-ORIG-GUID: 4lWEA5ZaM8yAbOdC3hJm5ww9aHzyGh7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060135
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 263d37a..0a264f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17170,6 +17170,14 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
 F:	drivers/clk/qcom/
 F:	include/dt-bindings/clock/qcom,*
 
+QUALCOMM CLOUD AI (QAIC) DRIVER
+M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/accel/qaic/
+F:	drivers/accel/qaic/
+F:	include/uapi/drm/qaic_accel.h
+
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Niklas Cassel <nks@flawful.org>
 L:	linux-pm@vger.kernel.org
-- 
2.7.4

