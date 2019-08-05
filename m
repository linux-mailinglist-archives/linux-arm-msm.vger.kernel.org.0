Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 052998153C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 11:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfHEJSb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 05:18:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:33056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfHEJSa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 05:18:30 -0400
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0953E21852;
        Mon,  5 Aug 2019 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564996710;
        bh=3y/xyKQqQxOI/5O7S65myq1HgXxKlZai9ugc4r5PFAs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZVGEXyWfKHiNU9ykvQl6iP/vhiDaIIbECZVQoz2dbKXg0o9tNCy9OFZbp1ZbwMw5u
         vtFxzrASGVSEXmSa62HUtsG05ILylao9uKfI2n+4eJuhzYlYWjorLeb1C2fe8A23w6
         pGRPWmqT9BT+nmjsc6bnzwIbMDRuMZZZ05gPQ21o=
Received: by mail-lj1-f177.google.com with SMTP id m8so45075826lji.7;
        Mon, 05 Aug 2019 02:18:29 -0700 (PDT)
X-Gm-Message-State: APjAAAVK+cI9wv6keK6YQrY4Oc3DNdk7kVDdURDfIhS26VMtI5qL25Mh
        hylr8P2uIYTSiBr9ll0a1aozz1Z5/GWYgaebzUU=
X-Google-Smtp-Source: APXvYqzggkPHLZ3va+adONzA3B+P4PCDn3noO8lcrGqBRgo8WuH7Fq5Bq7XwbmzdzXRtDWDsIpDJCC30bufng4pCbXM=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr78893429lje.143.1564996708108;
 Mon, 05 Aug 2019 02:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190802132809.8116-1-yuehaibing@huawei.com> <20190802132809.8116-4-yuehaibing@huawei.com>
In-Reply-To: <20190802132809.8116-4-yuehaibing@huawei.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 5 Aug 2019 11:18:17 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfvMLehLn+iNOGDEFvsWc93eShUx0=8fn9JWiBOc7wpFw@mail.gmail.com>
Message-ID: <CAJKOXPfvMLehLn+iNOGDEFvsWc93eShUx0=8fn9JWiBOc7wpFw@mail.gmail.com>
Subject: Re: [PATCH -next 03/12] crypto: exynos - use devm_platform_ioremap_resource()
 to simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     herbert@gondor.apana.org.au, lars.persson@axis.com,
        jesper.nilsson@axis.com, davem@davemloft.net,
        thomas.lendacky@amd.com, gary.hook@amd.com, kgene@kernel.org,
        antoine.tenart@bootlin.com, matthias.bgg@gmail.com,
        jamie@jamieiles.com, agross@kernel.org, heiko@sntech.de,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        clabbe.montjoie@gmail.com, mripard@kernel.org, wens@csie.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@axis.com,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2 Aug 2019 at 15:31, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/exynos-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
