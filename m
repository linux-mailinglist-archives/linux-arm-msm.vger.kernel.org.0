Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE5F7A7946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 12:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbjITKcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 06:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbjITKbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 06:31:51 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D452A11A;
        Wed, 20 Sep 2023 03:31:43 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38K7RBgm001002;
        Wed, 20 Sep 2023 10:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ClMgr5Ngu1nay9NAg1HZkn3mdkAR5ocat4hA5b4q9xc=;
 b=LFPqLxuBNzVqnB5g2MEYlMhszZuR+FEStune7EMEWL38upEL4pL9B2nswGlKeTzWG8iN
 hjcjPLLtJTllZFIUpOPscN9ExaQRsZBMFBa39hOUgGloZtBKF0wKimzy8aY3tOxceP9D
 78Bo4EQuxIj0nO7neYTJY3+mZfTj0tcBNiuWhbiX15Ats4QHRvo3Mi2TbpHOHQjULwQN
 yKFLBv046N+NUoHegNLZWvTyjQwuophT0JIg+GeODXVuwl9/XetyQF3VLo82B3mgmGgR
 ES0pygt4d9bVUmStDP415ujKvQ30YZQeva1YMCuZIiyVoV86VjHtAx75wPfNQkQVpTgX zQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7vbkrbm6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Sep 2023 10:31:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KAVe0F013645
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Sep 2023 10:31:40 GMT
Received: from ekangupt-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 20 Sep 2023 03:31:37 -0700
From:   Ekansh Gupta <quic_ekangupt@quicinc.com>
To:     <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC:     Ekansh Gupta <quic_ekangupt@quicinc.com>,
        <ekangupt@qti.qualcomm.com>, <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <fastrpc.upstream@qti.qualcomm.com>
Subject: [PATCH v2 0/5] Add multimode invoke request IOCTl support
Date:   Wed, 20 Sep 2023 16:01:25 +0530
Message-ID: <1695205890-21018-1-git-send-email-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OoabiOG5RLlkkgfRDQdhgaV1lPKotquI
X-Proofpoint-ORIG-GUID: OoabiOG5RLlkkgfRDQdhgaV1lPKotquI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_05,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=510
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309200083
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to support multimode invocation ioctl request. This
ioctl call facilitates multiple types of requests from user including
CRC check, performance counters, shared context bank usage, etc.
This series also carries patch to save and restore interrupted
context.

Ekansh Gupta (5):
  misc: fastrpc: Add CRC support for remote buffers
  misc: fastrpc: Capture kernel and DSP performance counters
  misc: fastrpc: Add support to save and restore interrupted
  misc: fastrpc: Add support to save and restore interrupted
  misc: fastrpc: Add support to allocate shared context bank

 drivers/misc/fastrpc.c      | 355 +++++++++++++++++++++++++++++++++++++-------
 include/uapi/misc/fastrpc.h |  26 ++++
 2 files changed, 325 insertions(+), 56 deletions(-)

-- 
2.7.4

