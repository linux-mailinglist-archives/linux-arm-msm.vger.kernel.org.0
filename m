Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D777E7FE4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 18:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389972AbfHBQKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 12:10:30 -0400
Received: from gloria.sntech.de ([185.11.138.130]:34058 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389951AbfHBQKa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 12:10:30 -0400
Received: from p508fd160.dip0.t-ipconnect.de ([80.143.209.96] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hta7x-00041C-8t; Fri, 02 Aug 2019 18:09:57 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     herbert@gondor.apana.org.au, lars.persson@axis.com,
        jesper.nilsson@axis.com, davem@davemloft.net,
        thomas.lendacky@amd.com, gary.hook@amd.com, krzk@kernel.org,
        kgene@kernel.org, antoine.tenart@bootlin.com,
        matthias.bgg@gmail.com, jamie@jamieiles.com, agross@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        clabbe.montjoie@gmail.com, mripard@kernel.org, wens@csie.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@axis.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH -next 09/12] crypto: rockchip - use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 02 Aug 2019 18:09:56 +0200
Message-ID: <2422935.Q2t5okTyEj@phil>
In-Reply-To: <20190802132809.8116-10-yuehaibing@huawei.com>
References: <20190802132809.8116-1-yuehaibing@huawei.com> <20190802132809.8116-10-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am Freitag, 2. August 2019, 15:28:06 CEST schrieb YueHaibing:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

looks like nice and simple improvement
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks
Heiko


