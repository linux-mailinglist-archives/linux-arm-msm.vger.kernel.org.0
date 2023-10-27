Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948C97D9F63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjJ0SIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 14:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbjJ0SIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 14:08:31 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5633AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 11:08:29 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RGktYU024380;
        Fri, 27 Oct 2023 18:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=vQHgFLsDhvHc1yLB/Z58MInVBJaCFYk0E6obW490TQI=;
 b=C8oiAlG4+x2yHIvxorxlEsWwNt0F2cCUPiqR14BlKuq3LaCX9+G8VpM8Tlb7+UDHzTh+
 WkC7Lxxez/0A13lK+XyJBC+xc1VrJG5N36EcYeIFVg9Op765W008fetnU2DdjpE2xgcD
 Oa1LIc/8s1DpH0Vq9izG7pgX2k+gZujWG5uGSWc0jfMB8XLmRZE8cNvtbgDmpGRQ1qtJ
 tCxSlXXbDfH3wLQ69bZsxzPflh4QS6Tr7BAz/0B0M5EVTDJ4cQoON8l9K7HPwvsMJj6e
 RIj1E7dlBB+ZXif1hVsEns//X7DVVaxsR8FMVs4bAexY5LSGqVPNXUfrhr/hPDu6VNK1 rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyww72sny-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 18:08:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RI8PBl012355
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 18:08:25 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 11:08:24 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "kernel test robot" <lkp@intel.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Quiet array bounds check on DMA abort message
Date:   Fri, 27 Oct 2023 12:08:10 -0600
Message-ID: <20231027180810.4873-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xSXeBkP95iNwJpPMkS6LFK2ubNvNAAFG
X-Proofpoint-GUID: xSXeBkP95iNwJpPMkS6LFK2ubNvNAAFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_17,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270157
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Carl Vanderlip <quic_carlv@quicinc.com>

Current wrapper is right-sized to the message being transferred;
however, this is smaller than the structure defining message wrappers
since the trailing element is a union of message/transfer headers of
various sizes (8 and 32 bytes on 32-bit system where issue was
reported). Using the smaller header with a small message
(wire_trans_dma_xfer is 24 bytes including header) ends up being smaller
than a wrapper with the larger header. There are no accesses outside of
the defined size, however they are possible if the larger union member
is referenced.

Abort messages are outside of hot-path and changing the wrapper struct
would require a larger rewrite, so having the memory allocated to the
message be 8 bytes too big is acceptable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310182253.bcb9JcyJ-lkp@intel.com/
Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 388abd40024b..84915824be54 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1138,7 +1138,7 @@ static int abort_dma_cont(struct qaic_device *qdev, struct wrapper_list *wrapper
 		if (!list_is_first(&wrapper->list, &wrappers->list))
 			kref_put(&wrapper->ref_count, free_wrapper);
 
-	wrapper = add_wrapper(wrappers, offsetof(struct wrapper_msg, trans) + sizeof(*out_trans));
+	wrapper = add_wrapper(wrappers, sizeof(*wrapper));
 
 	if (!wrapper)
 		return -ENOMEM;
-- 
2.40.1

