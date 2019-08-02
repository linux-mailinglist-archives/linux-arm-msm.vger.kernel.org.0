Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D597FA1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfHBNbO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 09:31:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50602 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404401AbfHBNbK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 09:31:10 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 98B08AA14CE5C9058219;
        Fri,  2 Aug 2019 21:31:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:30:59 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <herbert@gondor.apana.org.au>, <lars.persson@axis.com>,
        <jesper.nilsson@axis.com>, <davem@davemloft.net>,
        <thomas.lendacky@amd.com>, <gary.hook@amd.com>, <krzk@kernel.org>,
        <kgene@kernel.org>, <antoine.tenart@bootlin.com>,
        <matthias.bgg@gmail.com>, <jamie@jamieiles.com>,
        <agross@kernel.org>, <heiko@sntech.de>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <clabbe.montjoie@gmail.com>, <mripard@kernel.org>, <wens@csie.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-arm-kernel@axis.com>, <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 00/12] crypto: use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 2 Aug 2019 21:27:57 +0800
Message-ID: <20190802132809.8116-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (12):
  crypto: artpec6 - use devm_platform_ioremap_resource() to simplify
    code
  crypto: ccp - use devm_platform_ioremap_resource() to simplify code
  crypto: exynos - use devm_platform_ioremap_resource() to simplify code
  crypto: img-hash - use devm_platform_ioremap_resource() to simplify
    code
  crypto: inside-secure - use devm_platform_ioremap_resource() to
    simplify code
  crypto: mediatek - use devm_platform_ioremap_resource() to simplify
    code
  crypto: picoxcell - use devm_platform_ioremap_resource() to simplify
    code
  crypto: sunxi-ss - use devm_platform_ioremap_resource() to simplify
    code
  crypto: rockchip - use devm_platform_ioremap_resource() to simplify
    code
  crypto: stm32 - use devm_platform_ioremap_resource() to simplify code
  crypto: qce - use devm_platform_ioremap_resource() to simplify code
  crypto: qcom-rng - use devm_platform_ioremap_resource() to simplify
    code

 drivers/crypto/axis/artpec6_crypto.c    | 4 +---
 drivers/crypto/ccp/sp-platform.c        | 4 +---
 drivers/crypto/exynos-rng.c             | 4 +---
 drivers/crypto/img-hash.c               | 4 +---
 drivers/crypto/inside-secure/safexcel.c | 4 +---
 drivers/crypto/mediatek/mtk-platform.c  | 3 +--
 drivers/crypto/picoxcell_crypto.c       | 5 ++---
 drivers/crypto/qce/core.c               | 4 +---
 drivers/crypto/qcom-rng.c               | 4 +---
 drivers/crypto/rockchip/rk3288_crypto.c | 4 +---
 drivers/crypto/stm32/stm32-crc32.c      | 4 +---
 drivers/crypto/stm32/stm32-cryp.c       | 4 +---
 drivers/crypto/sunxi-ss/sun4i-ss-core.c | 4 +---
 13 files changed, 14 insertions(+), 38 deletions(-)

-- 
2.7.4


