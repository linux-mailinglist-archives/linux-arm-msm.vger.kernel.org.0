Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5583F59084A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 23:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbiHKVrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 17:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbiHKVrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 17:47:10 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C945A9F195;
        Thu, 11 Aug 2022 14:47:09 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BLS6uQ018610;
        Thu, 11 Aug 2022 21:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=9SG6mHL+qXasSyzhyP5QHde46SeS4oqPOWl95Qbo4XQ=;
 b=UwgRTiD+AN97AbE8oJOqIVjOIYQ0f6WmAdhRjUZm1xaWYjyqo1fbhwRK/SWC7o1IJZho
 O61fwvnUtGs9j8RHogIF9Nr5hdw9f/Y2/DpVjWbk5mARrw/QTOVId+TSDQs646y8jkLN
 oKjopySZGv3AXtn7GtCqX27zdJkVvpH7IfiFyxp6knVWJ9wo+WUcadO7S3YzZ7TPAIF3
 kRQ81VGPOQq0bvJGyf4v3d7zllwaDXffBLjRl9TSjhydIU2LorHqBGfjTLVNsdXVFwEG
 mOUqz5wABDCVLK1X6VkHDLf4RPl3YZjSHmbBbVkYP8GD6X4l3s2HxRKtubxuAeglBFv4 MQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hw89x06rd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:47:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLg2g0018084
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:42:02 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:42:00 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 11/12] gunyah: rsc_mgr: Add auxiliary devices for console
Date:   Thu, 11 Aug 2022 14:41:06 -0700
Message-ID: <20220811214107.1074343-12-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811214107.1074343-1-quic_eberman@quicinc.com>
References: <20220811214107.1074343-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eVNwVEscxmphkOUGMwEPxREAQiw9Iq1U
X-Proofpoint-ORIG-GUID: eVNwVEscxmphkOUGMwEPxREAQiw9Iq1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=809 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110065
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gunyah resource manager exposes a concrete functionalities which
complicate a single resource manager driver. Use auxiliary bus
to help split high level functions for the resource manager and keep the
primary resource manager driver focused on the RPC with RM itself.
Delegate Resource Manager's console functionality to the auxiliary bus.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/virt/gunyah/rsc_mgr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/virt/gunyah/rsc_mgr.c b/drivers/virt/gunyah/rsc_mgr.c
index 635bd7a52653..7a899deaae8f 100644
--- a/drivers/virt/gunyah/rsc_mgr.c
+++ b/drivers/virt/gunyah/rsc_mgr.c
@@ -16,6 +16,7 @@
 #include <linux/notifier.h>
 #include <linux/workqueue.h>
 #include <linux/completion.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/gunyah_rsc_mgr.h>
 #include <linux/platform_device.h>
 
@@ -95,6 +96,8 @@ struct gh_rsc_mgr {
 	struct mutex send_lock;
 
 	struct work_struct recv_work;
+
+	struct auxiliary_device console_adev;
 };
 
 static struct gh_rsc_mgr *__rsc_mgr;
@@ -572,8 +575,21 @@ static int gh_rm_drv_probe(struct platform_device *pdev)
 
 	__rsc_mgr = rsc_mgr;
 
+	rsc_mgr->console_adev.dev.parent = &pdev->dev;
+	rsc_mgr->console_adev.name = "console";
+	ret = auxiliary_device_init(&rsc_mgr->console_adev);
+	if (ret)
+		goto err_msgq;
+	ret = auxiliary_device_add(&rsc_mgr->console_adev);
+	if (ret)
+		goto err_console_adev_uninit;
+
 	return 0;
 
+err_console_adev_uninit:
+	auxiliary_device_uninit(&rsc_mgr->console_adev);
+err_msgq:
+	gunyah_msgq_free(rsc_mgr->msgq_rx);
 err_msgq_tx:
 	gunyah_msgq_free(rsc_mgr->msgq_tx);
 	return ret;
@@ -583,6 +599,9 @@ static int gh_rm_drv_remove(struct platform_device *pdev)
 {
 	struct gh_rsc_mgr *rsc_mgr = platform_get_drvdata(pdev);
 
+	auxiliary_device_delete(&rsc_mgr->console_adev);
+	auxiliary_device_uninit(&rsc_mgr->console_adev);
+
 	__rsc_mgr = NULL;
 
 	gunyah_msgq_free(rsc_mgr->msgq_tx);
-- 
2.25.1

