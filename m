Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1FA2C367E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 03:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgKYCFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 21:05:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbgKYCFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 21:05:19 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BEEB2067D;
        Wed, 25 Nov 2020 02:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606269918;
        bh=IaD8vgqknun5yb3c1lZWlj0pp//BzSr5goMQPI2QZWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nDomvcmjyuhdSs8tCfQfgOMWcsKdct0vEx0HSf4SI2CT9UpK9fE8wCwW4IzANNOxm
         gdVOTQ+mXPIYrFQ+Sz1qKa1YHXzk34xnQw46QnVG78gglVwJ9hkqPL2N8Yt5V/iXwq
         vPYDG7ePSAeSuP/UYteDVA+6ayPXd224T2evd/Ts=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119155233.3974286-2-thara.gopinath@linaro.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org> <20201119155233.3974286-2-thara.gopinath@linaro.org>
Subject: Re: [Patch v2 1/6] dt-bindings: clock: Add entry for crypto engine RPMH clock resource
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Thara Gopinath <thara.gopinath@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 24 Nov 2020 18:05:16 -0800
Message-ID: <160626991679.2717324.8702902903746052278@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Thara Gopinath (2020-11-19 07:52:28)
> Add clock id forc CE clock resource which is required to bring up the
> crypto engine on sdm845.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---

Applied to clk-next
