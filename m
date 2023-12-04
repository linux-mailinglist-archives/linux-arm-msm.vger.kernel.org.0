Return-Path: <linux-arm-msm+bounces-3172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3721802AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 05:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF6A8B2075F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 04:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1C34A38;
	Mon,  4 Dec 2023 04:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FpkpnZSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87F5D7;
	Sun,  3 Dec 2023 20:14:25 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B42kqko020227;
	Mon, 4 Dec 2023 04:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=w2Yu1aSNbKM1bL03R+vVvqY0inOjKskU3INa/KEM2Nc=;
 b=FpkpnZSiHCf7GfCUTSgpN3SGQ/bEaqtqBSnxYo4vwU3gwMSk5kbz/EELMPGlFbsoLN/x
 8LCdRBAAqhO/bHWBIT0tS1xq9xmwd4yoTk6kgkhOSpbknsC/a4LM7mQUx5oZI/ZOuogi
 AfuBW2/et1sRkofR1IHIqAI0Lz78jZzLN5387Zevgs+7QFtWb1e7LNi0aMKcbwXDpOsN
 wnsINpHION2o1yBEfMURL2zH447jgQuLxpVdPodchvoxUitTkQxJl9Wunv5vIQU/Bo5P
 2W9b+9WOk86ZL5HgKcqNk+R/QHOgradurLhrk8rwFl5W4IkE2VuSGsILEdNud4GCIo+z xw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqvyetuts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 04:14:07 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B44E6fu026363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 04:14:06 GMT
Received: from hu-obabatun-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 3 Dec 2023 20:14:03 -0800
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <robh+dt@kernel.org>,
        <frowand.list@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Subject: [RFC PATCH v2 6/6] of: reserved_mem: Make MAX_RESERVED_REGIONS a config option
Date: Sun, 3 Dec 2023 20:13:39 -0800
Message-ID: <20231204041339.9902-7-quic_obabatun@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231204041339.9902-1-quic_obabatun@quicinc.com>
References: <20231204041339.9902-1-quic_obabatun@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UFkQnKkOX_ktNu2ii40nuqy9eFgNGJYe
X-Proofpoint-GUID: UFkQnKkOX_ktNu2ii40nuqy9eFgNGJYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=907 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040029

Make the value of MAX_RESERVED_REGIONS a config option which can be
modified based on user requirements.
The reserved_mem_array is required during device bootup to store the
information of the dynamically-placed reserved memory regions.
After paging_init(), this information is transferred to another
array which is dynamically allocated and used to store all the reserved
memory regions.

There is currently no obvious way to free the memory for the static
array after its contents are copied over to the dynamically allocated
array, but since the size required for the reserved_mem_array can vary
from device to device depending on the number of dynamically-placed
reserved memory regions, make the size of the array configurable in an
attempt to save some memory.

Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
---
 drivers/of/Kconfig      | 13 +++++++++++++
 drivers/of/of_private.h |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index da9826accb1b..409ce2527461 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -102,4 +102,17 @@ config OF_OVERLAY
 config OF_NUMA
 	bool
 
+config OF_MAX_RESERVED_REGIONS
+	int "OF resvered_mem array size"
+	default "64"
+	range 1 64
+	help
+	   The reserved_mem_array is used to store information about the dynamically
+	   placed reserved memory regions before we are able to allocate the memory
+	   needed to store all the reserved memory regions defined in the DT.
+	   Because the amount of memory needed initially for this array could vary,
+	   make the size of the reserved_mem_array configurable in an attempt to
+	   save some memory when possible.
+	   if unsure, leave as default value.
+
 endif # OF
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index ef56b2ea185c..278038bce0c0 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -36,7 +36,7 @@ struct alias_prop {
 #endif
 
 #define OF_ROOT_NODE_SIZE_CELLS_DEFAULT 1
-#define MAX_RESERVED_REGIONS    64
+#define MAX_RESERVED_REGIONS    CONFIG_OF_MAX_RESERVED_REGIONS
 
 extern struct mutex of_mutex;
 extern raw_spinlock_t devtree_lock;
-- 
2.17.1


