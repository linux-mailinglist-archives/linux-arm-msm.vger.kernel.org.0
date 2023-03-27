Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475DC6CAAD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 18:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbjC0Qly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 12:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjC0Qlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 12:41:49 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CE7273A;
        Mon, 27 Mar 2023 09:41:48 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDM52c015305;
        Mon, 27 Mar 2023 16:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=HsA+LxQVnxzKseTa2KZjRCjKmeq9PeHoILc6rkYATsQ=;
 b=P7yqQUFzTx9wNiHGgXZy5jTN7rucXo2QdDwVuE47+7drtt2XXnMj/AJxvbj7fHhOHOAx
 5UT68HX1zyOi2VtXUOKIJ0eTpMKJh5TVE3UBoAMPNILOvP9hXHJKf5ZyX4K2KV8lt9Po
 7Gj9uZ0h/RuNJe/X7mu/Pvldb4fbn1xHW/vAcWegryA3fWO5kSRLXMMtGWcz6PUfKgrn
 iDXUWB2dzs44KNRSGZZ+JL6JrdiNqmOjbthxDiIAFp3kcrEWd6ysFm9GWcztlcN2dps8
 5nnekZAcP2vUsa5LNnQLK76CGe0pGGugh6cqY/P3fAUaXn8i60QqfW1IDcIS6GmDZ3PP 9w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkby48k0s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 16:41:45 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RGfia6022544
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 16:41:44 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 09:41:41 -0700
From:   Mukesh Ojha <quic_mojha@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH v4 2/5] pinctrl: qcom: Use qcom_scm_io_update_field()
Date:   Mon, 27 Mar 2023 22:11:18 +0530
Message-ID: <1679935281-18445-3-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679935281-18445-1-git-send-email-quic_mojha@quicinc.com>
References: <1679935281-18445-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c67uhQ2rKaZ0M1zzOviNmCLSK794sqLR
X-Proofpoint-GUID: c67uhQ2rKaZ0M1zzOviNmCLSK794sqLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=693 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270134
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use qcom_scm_io_update_field() exported function introduced
in last commit.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index daeb79a..6e1a5e4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1016,6 +1016,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned long flags;
 	bool was_enabled;
 	u32 val;
+	u32 mask;
 
 	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
 		set_bit(d->hwirq, pctrl->dual_edge_irqs);
@@ -1049,23 +1050,19 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	 * With intr_target_use_scm interrupts are routed to
 	 * application cpu using scm calls.
 	 */
+	mask = (7 << g->intr_target_bit);
 	if (pctrl->intr_target_use_scm) {
 		u32 addr = pctrl->phys_base[0] + g->intr_target_reg;
 		int ret;
 
-		qcom_scm_io_readl(addr, &val);
-
-		val &= ~(7 << g->intr_target_bit);
-		val |= g->intr_target_kpss_val << g->intr_target_bit;
-
-		ret = qcom_scm_io_writel(addr, val);
+		ret = qcom_scm_io_update_field(addr, mask, g->intr_target_kpss_val);
 		if (ret)
 			dev_err(pctrl->dev,
 				"Failed routing %lu interrupt to Apps proc",
 				d->hwirq);
 	} else {
 		val = msm_readl_intr_target(pctrl, g);
-		val &= ~(7 << g->intr_target_bit);
+		val &= ~mask;
 		val |= g->intr_target_kpss_val << g->intr_target_bit;
 		msm_writel_intr_target(val, pctrl, g);
 	}
-- 
2.7.4

