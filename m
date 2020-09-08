Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D3F260BC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 09:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgIHHTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 03:19:03 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38832 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbgIHHSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 03:18:54 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0887FHNh063121;
        Tue, 8 Sep 2020 07:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=HJabx6dyrtZApOlu8pzful/PRJRHZB+ekJGpE83eeic=;
 b=qVhAPuDpOElLBMlan9Brd/wyd1jxfyrMgUAq8HB4bCyxLohM9UhCk64rnGYSDoQKPcqO
 ZGKEtXWIehKPsIMJ0+nFX/pPtdaC4qCPzA9UZmMNFONEucMiwDM3Vd2KSeX8XaH91W0r
 TEYAQm4dgJgiVL/bhP73Dnm4OhHN1kKT8KKq4PZEwul4N5pqqBxnPjynwu1eqE18Vdfn
 pg8+myJiCt5cgcMlRjw6aXvFXrodD1cY01dYkEPCdAwQszXMx14D8lWa2CeTRlmhASX7
 UZSKMCh7yf5i//YFinwFlceOBiYPTryTFpdxlFy3UriM4wS9QilpeGiT63rECbJbCXPv 1A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 33c23qsk2h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 08 Sep 2020 07:18:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0887GGH4082781;
        Tue, 8 Sep 2020 07:18:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 33cmkvf7gf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Sep 2020 07:18:49 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0887Im0K001522;
        Tue, 8 Sep 2020 07:18:48 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Sep 2020 00:18:47 -0700
Date:   Tue, 8 Sep 2020 10:18:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rpmsg: smd: Fix a kobj leak in in qcom_smd_parse_edge()
Message-ID: <20200908071841.GA294938@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9737 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 mlxlogscore=740 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009080067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9737 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 priorityscore=1501
 mlxlogscore=747 mlxscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080067
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to call of_node_put(node) on the error paths for this function.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rpmsg/qcom_smd.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 4abbeea782fa..19903de6268d 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1338,7 +1338,7 @@ static int qcom_smd_parse_edge(struct device *dev,
 	ret = of_property_read_u32(node, key, &edge->edge_id);
 	if (ret) {
 		dev_err(dev, "edge missing %s property\n", key);
-		return -EINVAL;
+		goto put_node;
 	}
 
 	edge->remote_pid = QCOM_SMEM_HOST_ANY;
@@ -1349,32 +1349,37 @@ static int qcom_smd_parse_edge(struct device *dev,
 	edge->mbox_client.knows_txdone = true;
 	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
 	if (IS_ERR(edge->mbox_chan)) {
-		if (PTR_ERR(edge->mbox_chan) != -ENODEV)
-			return PTR_ERR(edge->mbox_chan);
+		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
+			ret = PTR_ERR(edge->mbox_chan);
+			goto put_node;
+		}
 
 		edge->mbox_chan = NULL;
 
 		syscon_np = of_parse_phandle(node, "qcom,ipc", 0);
 		if (!syscon_np) {
 			dev_err(dev, "no qcom,ipc node\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto put_node;
 		}
 
 		edge->ipc_regmap = syscon_node_to_regmap(syscon_np);
-		if (IS_ERR(edge->ipc_regmap))
-			return PTR_ERR(edge->ipc_regmap);
+		if (IS_ERR(edge->ipc_regmap)) {
+			ret = PTR_ERR(edge->ipc_regmap);
+			goto put_node;
+		}
 
 		key = "qcom,ipc";
 		ret = of_property_read_u32_index(node, key, 1, &edge->ipc_offset);
 		if (ret < 0) {
 			dev_err(dev, "no offset in %s\n", key);
-			return -EINVAL;
+			goto put_node;
 		}
 
 		ret = of_property_read_u32_index(node, key, 2, &edge->ipc_bit);
 		if (ret < 0) {
 			dev_err(dev, "no bit in %s\n", key);
-			return -EINVAL;
+			goto put_node;
 		}
 	}
 
@@ -1385,7 +1390,8 @@ static int qcom_smd_parse_edge(struct device *dev,
 	irq = irq_of_parse_and_map(node, 0);
 	if (irq < 0) {
 		dev_err(dev, "required smd interrupt missing\n");
-		return -EINVAL;
+		ret = irq;
+		goto put_node;
 	}
 
 	ret = devm_request_irq(dev, irq,
@@ -1393,12 +1399,18 @@ static int qcom_smd_parse_edge(struct device *dev,
 			       node->name, edge);
 	if (ret) {
 		dev_err(dev, "failed to request smd irq\n");
-		return ret;
+		goto put_node;
 	}
 
 	edge->irq = irq;
 
 	return 0;
+
+put_node:
+	of_node_put(node);
+	edge->of_node = NULL;
+
+	return ret;
 }
 
 /*
-- 
2.28.0

