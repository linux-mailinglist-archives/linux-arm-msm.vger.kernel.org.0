Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51601AA5C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 16:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388943AbfIEO10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 10:27:26 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:33200 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726067AbfIEO10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 10:27:26 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x85EQvpe009110;
        Thu, 5 Sep 2019 16:27:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uoKwd2sKUokpzjvmIx+s4ndk3AuSqJH8fupkyFjbnKM=;
 b=V55pi+yFFLXvjUuC3KlOinawRLoOUuAvvh4mgsISkUH25s2Oc8bGwW8hfRH+DQvtNGRQ
 1eE+4AKpTjriXTyldLhijgZSfeo9O7yrUEG4aE4Pr/AAvvQuq0D+3tZNvFLLB4qdv/tT
 fUGCia+nlDM+V/A/ZLnyfwuby+A/WYGeFBPMmr/jhD+Q+F4rNNj6RVueKnmF2c8GnRNO
 /N9w/N3iks3MIO5lmntfZkLH4KowK/pmMEU+z38oA7GZUkW/MkBwLGPM1DNvdQSXZJqT
 oLkqIL2PexAH57unA0jxgZbAPqJIRrNy7h9ICqY+vzKxoOCZiVe5pAOaLvdq5IGmjgBk Pw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx08-00178001.pphosted.com with ESMTP id 2uqfsj8h7k-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 05 Sep 2019 16:27:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 245C94B;
        Thu,  5 Sep 2019 14:27:17 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DE242D6C48;
        Thu,  5 Sep 2019 16:27:16 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019
 16:27:16 +0200
Received: from localhost (10.48.0.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 16:27:13 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <arnaud.pouliquen@st.com>, Suman Anna <s-anna@ti.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 0/3] Add API to get rpmsg message max length
Date:   Thu, 5 Sep 2019 16:27:07 +0200
Message-ID: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_04:2019-09-04,2019-09-05 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As introduction on the get_mtu api can impacts some rpmsg drivers,
i propose to discuss it separately.
The "rpmsg: core: add API to get message length" patch is extracted from
https://lkml.org/lkml/2019/9/4/556
In addition 2 patches implement the API for impacted rpmsg drivers.
The rpmsg tty client driver will be resent in a second step.

In this patchset the get_mpu is considered mandatory. The main reason is
that the rpmsg clients do not have access to the mtu information that is
platform dependent.

Notice that the GLINK and and SMD drivers have to be validated on target,
I don't have device to validate by myself...
Only a compilation check has been executed.

Arnaud Pouliquen (3):
  rpmsg: core: add API to get message length
  rpmsg: glink: implement get_mtu ops
  rpmsg: smd: implement get_mtu ops

 drivers/rpmsg/qcom_glink_native.c | 24 ++++++++++++++++++++++++
 drivers/rpmsg/qcom_smd.c          |  8 ++++++++
 drivers/rpmsg/rpmsg_core.c        | 21 +++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  2 ++
 drivers/rpmsg/virtio_rpmsg_bus.c  | 10 ++++++++++
 include/linux/rpmsg.h             | 10 ++++++++++
 6 files changed, 75 insertions(+)

-- 
2.7.4

