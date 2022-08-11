Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68198590847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 23:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234651AbiHKVrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 17:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235396AbiHKVrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 17:47:09 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38B19F181;
        Thu, 11 Aug 2022 14:47:08 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BL07GH025299;
        Thu, 11 Aug 2022 21:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Ca2C2tx5BzQbZuV4HRZgNfAx1TlE2A/94biwGzQALew=;
 b=P1W5C9CzWVyqo2W+erOXYZLIKvxriyJCfsinmtuj0xqX/bBap8OANFtkmxuIl/IugCmv
 E/6Zr1w4IbcN4b30UjysVfhHVwY+h7JYI/lCBNtfbmPU3GBJzFTN4FnNvmxMGS6A/nlZ
 Nwn+2pIwMsqkUnu2nu1tALYBFFWIsC647CSz/jVE2K+4NY50sPW/1uJ2eIKLH491iU4W
 XtcPu3hbyy/Uh9fpK54A8CtqNqv0RIc5UYtF9PLVPMV76RaYzk5KgOaKvYJ8FJsbp6P1
 munWhh+Hdzu5oyJNgUtT6NYElbypBA7bD6asZST2MfXICPXi0ldacMUOAuEvVkm4Jfqr pQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hv95ywwdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:47:01 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLg0GW018016
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:42:00 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:41:59 -0700
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
Subject: [PATCH v3 08/12] gunyah: sysfs: Add node to describe supported features
Date:   Thu, 11 Aug 2022 14:41:03 -0700
Message-ID: <20220811214107.1074343-9-quic_eberman@quicinc.com>
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
X-Proofpoint-ORIG-GUID: A0WIgKTzhM8ZsUpTGpNNvemYtk6oQ-QD
X-Proofpoint-GUID: A0WIgKTzhM8ZsUpTGpNNvemYtk6oQ-QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=962 priorityscore=1501 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110065
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a sysfs node to list the features that the Gunyah hypervisor and
Linux supports. For now, Linux support cspace (capability IDs) and
message queues, so only report those..

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 Documentation/ABI/testing/sysfs-hypervisor-gunyah | 15 +++++++++++++++
 drivers/virt/gunyah/sysfs.c                       | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-hypervisor-gunyah b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
index 219465783a9e..7c14027b3daa 100644
--- a/Documentation/ABI/testing/sysfs-hypervisor-gunyah
+++ b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
@@ -6,6 +6,21 @@ Description:	If running under Gunyah:
 		Type of hypervisor:
 		"gunyah": Gunyah hypervisor
 
+What:		/sys/hypervisor/gunyah/features
+Date:		August 2022
+KernelVersion:	6.0
+Contact:	linux-arm-msm@vger.kernel.org
+Description:	If running under Gunyah:
+		Space separated list of features supported by Linux and Gunyah:
+		"cspace": Gunyah devices
+		"doorbell": Sending/receiving virtual interrupts via Gunyah doorbells
+		"message-queue": Sending/receiving messages via Gunyah message queues
+		"vic": Interrupt lending
+		"vpm": Virtual platform management
+		"vcpu": Virtual CPU management
+		"memextent": Memory lending/management
+		"trace": Gunyah hypervisor tracing
+
 What:		/sys/hypervisor/gunyah/api
 Date:		August 2022
 KernelVersion:	6.0
diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
index 9de700fdbfcb..8c6ea141ec66 100644
--- a/drivers/virt/gunyah/sysfs.c
+++ b/drivers/virt/gunyah/sysfs.c
@@ -31,9 +31,24 @@ static ssize_t variant_show(struct kobject *kobj, struct kobj_attribute *attr, c
 }
 static struct kobj_attribute variant_attr = __ATTR_RO(variant);
 
+static ssize_t features_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
+{
+	int len = 0;
+
+	if (GH_IDENTIFY_PARTITION_CSPACE(gunyah_api.flags))
+		len += sysfs_emit_at(buffer, len, "cspace ");
+	if (GH_IDENTIFY_MSGQUEUE(gunyah_api.flags))
+		len += sysfs_emit_at(buffer, len, "message-queue ");
+
+	len += sysfs_emit_at(buffer, len, "\n");
+	return len;
+}
+static struct kobj_attribute features_attr = __ATTR_RO(features);
+
 static struct attribute *gunyah_attrs[] = {
 	&api_attr.attr,
 	&variant_attr.attr,
+	&features_attr.attr,
 	NULL
 };
 
-- 
2.25.1

