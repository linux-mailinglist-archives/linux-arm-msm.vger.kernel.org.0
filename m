Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBFB16AD08C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 22:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCFVe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 16:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjCFVez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 16:34:55 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7AB2A14A;
        Mon,  6 Mar 2023 13:34:54 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3262nEGY009401;
        Mon, 6 Mar 2023 21:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=BD0RMlnGqLvlu9Titm2iURcx30IW8xEZd8PfrwRT7gA=;
 b=kcls+NSjWbTgd3gg1y2JERvyRAidf3pQR5vZ18eMJMRoELvyL7cqZUWraPriTCkXtLpz
 MmN9zmBhAzzNhe+vj6i2TcK9gG7up9VzC1mV0lUol9EOQuIacvjzFON9Ssuai5QzGZuf
 A/wh+ojkPnBxlWnr5HuHgH3ISSNSwXoyvjtxw/dqrKCUGuMxOZNng1FmvPxDQ/dXEwRj
 JWjdet4GzonilV+oNgMiXq8nBPVk1Fo+x3YUgrOeEE7E5St0UdCjgjuePa1ZdY4O+MSx
 rOfLmJPMToBJXaGJmMaaNn3kjy7xySoVYteSKe/Y69jRmGcgF8NGDuMRZcgty3y3Cqqe +g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p41jax2em-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Mar 2023 21:34:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326LYkoU020811
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Mar 2023 21:34:46 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 6 Mar 2023 13:34:45 -0800
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_ajitpals@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Date:   Mon, 6 Mar 2023 14:34:03 -0700
Message-ID: <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ivy2PRzcbNobV4vUSADGkke-AgDQ4Xvh
X-Proofpoint-GUID: Ivy2PRzcbNobV4vUSADGkke-AgDQ4Xvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060186
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0db911..feb2974 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17253,6 +17253,15 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
 F:	drivers/clk/qcom/
 F:	include/dt-bindings/clock/qcom,*
 
+QUALCOMM CLOUD AI (QAIC) DRIVER
+M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/accel/qaic/
+F:	drivers/accel/qaic/
+F:	include/uapi/drm/qaic_accel.h
+
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Bjorn Andersson <andersson@kernel.org>
 M:	Konrad Dybcio <konrad.dybcio@linaro.org>
-- 
2.7.4

