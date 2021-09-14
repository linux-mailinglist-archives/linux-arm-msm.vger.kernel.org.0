Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F3E40BA7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhINVlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:41:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232891AbhINVlF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:41:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5306360E8B;
        Tue, 14 Sep 2021 21:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655587;
        bh=4k2xdbWL9KuJon/RukKLH/6H0+1RJaLtsaM9gkmPKgA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gaiPBOgcKjt1A9eHGfZqKZgrnZSwVOSjLnOioQX/3YG/C8rkyGvg8Uj0jvRdbBjWa
         7hG6Lmq6s3/2bXWO84VlDfuJdL36oZ3Fc4Dzq4iRXMIAoA9TCQTliOXdRzJRhtk1ut
         ofvU8ZGQM9IHU6qPQU3AZKIE2TtColijX3ypCI1rMjHwowXvZ5I0iku7TamuWFHM2e
         lAsDP+1Nw45DZjyYlcGGqlu0hAHu3y6YcL/Qvx8aHIDnErzzRxekupB1gK/F+BIg83
         5bILoKsoHhxPOlTpMQbQe1mStTFoqdJD3uMoWgrlf9mpRRdi8Yx4fsi+stA8118WnO
         0I/gKaPe+xHLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210907084858.4101-1-caihuoqing@baidu.com>
References: <20210907084858.4101-1-caihuoqing@baidu.com>
Subject: Re: [PATCH] clk: qcom: kpss-xcc: Make use of the helper function devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     caihuoqing@baidu.com
Date:   Tue, 14 Sep 2021 14:39:46 -0700
Message-ID: <163165558602.763609.7167320648592906753@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Cai Huoqing (2021-09-07 01:48:57)
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---

Applied to clk-next
