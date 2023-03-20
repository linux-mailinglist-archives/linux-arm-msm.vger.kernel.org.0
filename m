Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA92C6C17D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjCTPRk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjCTPRS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:17:18 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DCB19A6;
        Mon, 20 Mar 2023 08:12:04 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KBv5FR009548;
        Mon, 20 Mar 2023 15:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=2GERI22WoV5OHHDLOQn/IE8uUAgA25xOwV1eh31RJKU=;
 b=lWExIAQ+q4idphpyIKpGJ0lVF1ZLTNlf6uCTcEGCvxZGMdmI0wlr71sZiLFcdr3Nt4gl
 senEEXYk8NB5TzegHFyiD7eBG6zsHJJDaMG1wY/TW0W1oj13jA6utFGbTsQnZ3Rzi3h4
 fqSh2HaLRQf468h20Y4QFoBi1qDqUdWjXgr7qjB5LtFIGqnV3emFR0LgjKXAWkkJjpjG
 5XevImGIMyoCH/Cuw6Qm8j4Bss6uAXzAYDOWxdiz7IILet1yvFtc25zBbtPXVVKSnIgU
 CJq2Ag91empZBEnDbXclzpg0cg7Fyz2scfutne8Bm68j69+AaugtfSnc/VGelwcG8WGh 6w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3peg57sg1p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:11:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32KFBsm5003052
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Mar 2023 15:11:54 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 08:11:53 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>
CC:     <dafna@fastmail.com>, <dri-devel@lists.freedesktop.org>,
        <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_ajitpals@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v4 8/8] MAINTAINERS: Add entry for QAIC driver
Date:   Mon, 20 Mar 2023 09:11:14 -0600
Message-ID: <1679325074-5494-9-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZkLVrWmLkjY-qKUe5dWgJmgRRZ3f8VXQ
X-Proofpoint-GUID: ZkLVrWmLkjY-qKUe5dWgJmgRRZ3f8VXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_10,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200129
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
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0db911..12f3028 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17253,6 +17253,16 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
 F:	drivers/clk/qcom/
 F:	include/dt-bindings/clock/qcom,*
 
+QUALCOMM CLOUD AI (QAIC) DRIVER
+M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/accel/qaic/
+F:	drivers/accel/qaic/
+F:	include/uapi/drm/qaic_accel.h
+
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Bjorn Andersson <andersson@kernel.org>
 M:	Konrad Dybcio <konrad.dybcio@linaro.org>
-- 
2.7.4

