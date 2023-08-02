Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B027776CA0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 11:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234208AbjHBJ6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 05:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234033AbjHBJ6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 05:58:14 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592F62101;
        Wed,  2 Aug 2023 02:58:10 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RG6nL5NY2zVjth;
        Wed,  2 Aug 2023 17:56:22 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 17:58:06 +0800
From:   Liao Chang <liaochang1@huawei.com>
To:     <andi.shyti@kernel.org>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <yangyicong@hisilicon.com>,
        <aisheng.dong@nxp.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <kblaiech@nvidia.com>,
        <asmaa@nvidia.com>, <loic.poulain@linaro.org>, <rfoss@kernel.org>,
        <ardb@kernel.org>, <gcherian@marvell.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 0/9] Use dev_err_probe in i2c probe function
Date:   Wed, 2 Aug 2023 17:57:28 +0800
Message-ID: <20230802095737.3957587-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the dev_err_probe function instead of dev_err in the probe function
so that the printed messge includes the return value and also handles
-EPROBE_DEFER nicely.

v2:
1. Convert all dev_err() in lpi2c_imx_probe(), synquacer_i2c_probe(),
   mlxbf_i2c_probe() to dev_err_probe().
2. Add Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
3. Add Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
4. Add Reviewed-by: Andi Shyti <andi.shyti@kernel.com>

Liao Chang (9):
  i2c: bcm2835: Use dev_err_probe in probe function
  i2c: mlxbf: Use dev_err_probe in probe function
  i2c: xlp9xx: Use dev_err_probe in probe function
  i2c: hisi: Use dev_err_probe in probe function
  i2c: qcom-cci: Use dev_err_probe in probe function
  i2c: pxa: Use dev_err_probe in probe function
  i2c: dln2: Use dev_err_probe in probe function
  i2c: imx-lpi2c: Use dev_err_probe in probe function
  i2c: synquacer: Use dev_err_probe in probe function

 drivers/i2c/busses/i2c-bcm2835.c   | 14 ++++-----
 drivers/i2c/busses/i2c-dln2.c      |  6 ++--
 drivers/i2c/busses/i2c-hisi.c      | 12 +++----
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++----
 drivers/i2c/busses/i2c-mlxbf.c     | 50 ++++++++++--------------------
 drivers/i2c/busses/i2c-pxa.c       |  7 ++---
 drivers/i2c/busses/i2c-qcom-cci.c  |  6 ++--
 drivers/i2c/busses/i2c-synquacer.c | 19 ++++--------
 drivers/i2c/busses/i2c-xlp9xx.c    |  6 ++--
 9 files changed, 46 insertions(+), 86 deletions(-)

-- 
2.25.1

