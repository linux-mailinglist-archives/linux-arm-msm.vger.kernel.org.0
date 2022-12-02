Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64CC46403A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 10:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbiLBJqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 04:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbiLBJqM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 04:46:12 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC8DB7DC3;
        Fri,  2 Dec 2022 01:45:51 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B28DpFr024973;
        Fri, 2 Dec 2022 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=qD2OTa58Jm8iziTlEZ1pWi0F/bcE3Hqs9sgHbLqTeNw=;
 b=ct+aIzEkYJqgjNbY3ADR1nIhSPaOEBoK08eZ3WJTRMldwZGk+u6+vtmfwsUw2oNfW9M4
 jNimlcTQPWjimDxSW6VWNRhE7kWaQ075Bzz30w/1Jd6DhkfAK3rmUtp+ngK3McuKF/tn
 Af+kEf0AJjVnDciCKU54KM4bK8jOYP8uYzAFwmcG+nnFb+IrJZMiU1CLQZXLy/fK2aAh
 995ogBYN44aTA/zgeHMLzu+TlrLaWy86bjLw0d9+xdaGfD2Q5eHs/0JHKwm/9IjLMylp
 JkCpSmYY7R6j3rYuAKICl1y9wtu3T4IdlmNkbX4qY3uSNjKeFL2jdeR2UIIgN/ASZQE7 hA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7c220r5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Dec 2022 09:45:47 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B29jlEe025468
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 2 Dec 2022 09:45:47 GMT
Received: from aiquny2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 2 Dec 2022 01:45:45 -0800
From:   Maria Yu <quic_aiquny@quicinc.com>
To:     <mathieu.poirier@linaro.org>
CC:     Maria Yu <quic_aiquny@quicinc.com>, <arnaud.pouliquen@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
Subject: [PATCH v5 0/2] remoteproc: core: do pm relax when in
Date:   Fri, 2 Dec 2022 17:45:30 +0800
Message-ID: <20221202094532.2925-1-quic_aiquny@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aDbh-TSsStDItcJ4sw5I4ky9XzlvT3AS
X-Proofpoint-GUID: aDbh-TSsStDItcJ4sw5I4ky9XzlvT3AS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=861 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020075
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the remote processor is offline, no need to recover anything, and
pm_relax is needed to be called.

Only the first detected crash needed to be handled, so change
to ordered workqueue to avoid unnecessary multi active work at
the same time. This will reduce the pm_relax unnecessary concurrency.

summary from some discussion points:

pm_stay_awake() is needed to stop and reverse the suspend process that
is currently underway.

RPROC_OFFLINE state indicate there is no recovery process
is in progress and no chance to do the pm_relax.
Because when recovering from crash, rproc->lock is held and
state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
and then unlock rproc->lock.
When the state is in RPROC_OFFLINE it means separate request
of rproc_stop was done and no need to hold the wakeup source
in crash handler to recover any more.


Changelog
===
V5
---
Use goto out instead of directly call pm_relax and return. Suggested by
Mathieu.
Add new change with allocate ordered workqueue for allow only 1 active
work.

V4
---
Add pm relax when in RPROC_OFFLINE.

previous discussion here:
[1] https://lore.kernel.org/lkml/1bcd3fe8-f68d-ea7f-c0f9-68771e3421d5@quicinc.com/

Maria Yu (2):
  remoteproc: core: do pm relax when in RPROC_OFFLINE
  remoteproc: core: change to ordered workqueue for crash handler

 drivers/remoteproc/remoteproc_core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.17.1

