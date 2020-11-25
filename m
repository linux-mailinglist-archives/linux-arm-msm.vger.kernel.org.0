Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9CC2C3685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 03:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgKYCFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 21:05:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbgKYCFe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 21:05:34 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F44D2067D;
        Wed, 25 Nov 2020 02:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606269934;
        bh=owcj3wdVYKanekaIV/LKexGPXqZ0ESXPdUIBS5CRQyE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mnac8xL5J5ZX/rXfPEScACBuEFVNh/NSJprkhk1ZKFER/NBLMIq1nwSxpTiKMsZCt
         aP1pJWdWUI11C74nsnNuFkdnSeOhBxNkPTAa1ti0jaGDiMcWZ+8Sg1O5AD5GU+jVCW
         DSidh27bRf5eXdiHwp2YelIMjwfRokSvhsQRMUAY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119155233.3974286-3-thara.gopinath@linaro.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org> <20201119155233.3974286-3-thara.gopinath@linaro.org>
Subject: Re: [Patch v2 2/6] clk: qcom: rpmh: Add CE clock on sdm845.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Thara Gopinath <thara.gopinath@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 24 Nov 2020 18:05:33 -0800
Message-ID: <160626993306.2717324.17114759592204357707@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Thara Gopinath (2020-11-19 07:52:29)
> Qualcomm CE clock resource that is managed by BCM is required
> by crypto driver to access the core clock.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---

Applied to clk-next
