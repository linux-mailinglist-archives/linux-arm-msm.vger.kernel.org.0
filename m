Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C539D5E60B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiIVLPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbiIVLPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:15:20 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED8815739
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:14:58 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYCJ829DGz14Rq5;
        Thu, 22 Sep 2022 19:10:48 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 19:14:56 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <kishon@ti.com>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH 0/7] Use dev_err_probe() to simplify code
Date:   Thu, 22 Sep 2022 11:12:21 +0000
Message-ID: <20220922111228.36355-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series simplify the error handling in probe function by
switching from dev_err() to dev_err_probe().

Yuan Can (7):
  phy: qcom-qmp-combo: Use dev_err_probe() to simplify code
  phy: qcom-qmp-pcie-msm8996: Use dev_err_probe() to simplify code
  phy: qcom-qmp-pcie: Use dev_err_probe() to simplify code
  phy: qcom-qmp-ufs: Use dev_err_probe() to simplify code
  phy: qcom-qmp-usb: Use dev_err_probe() to simplify code
  phy: qcom-qusb2: Use dev_err_probe() to simplify code
  phy: qcom-snps: Use dev_err_probe() to simplify code

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 21 +++++----------
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  9 +++----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  9 +++----
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  9 +++----
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  9 +++----
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 27 +++++++------------
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 +++++--------
 7 files changed, 34 insertions(+), 68 deletions(-)

-- 
2.17.1

