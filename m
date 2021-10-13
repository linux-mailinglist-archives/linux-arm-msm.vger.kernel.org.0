Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0009842CA39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbhJMTmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:42:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:34686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbhJMTmC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:42:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D28161168;
        Wed, 13 Oct 2021 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634153999;
        bh=yPkpCZnqRJTNR7/s2xJ6JVdE694pBHhXNokYDdypMaw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LQ+gT9Z2oOlFuii8Dn2SbV7d3mDsvxNOLk7F5PCPJDH5Hiuc5ev2wV0KMFvcfQd0Y
         MgbFM3b6k+p2RRjwvS7dHiC9wVutrHp7+w+PLP1yoLRNLWRcZkLULclaz0Jn46ARu/
         xLBXW3OtnIRZeBDqXS+OlcNlOWcNO9bnmyuOnu02qHwp9kvrYgJQxVU7XcRuhiIpOE
         HcEx+lUv1WUNJ6SYkPmo8mm2GCx9YbAVU+QTMVezy/kJhrzinb4ks6JjjwyQL+T6hv
         1HiuLxb1NstLpLlP5G9pMAXGV5BGxWeQA9tufk1cF0H6TMGMZkE5kSar0Du0S1qcG3
         SGS/SzD8ijHSA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210919023308.24498-3-shawn.guo@linaro.org>
References: <20210919023308.24498-1-shawn.guo@linaro.org> <20210919023308.24498-3-shawn.guo@linaro.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add Global Clock Controller driver for QCM2290
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 13 Oct 2021 12:39:57 -0700
Message-ID: <163415399794.936110.950145584363689128@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-18 19:33:08)
> Add Global Clock Controller (GCC) driver for QCM2290.  This is a porting
> of gcc-scuba driver from CAF msm-4.19, with GDSC support added on top.
>=20
> Because the alpha_pll on the platform has a different register
> layout (offsets), its own clk_alpha_pll_regs_offset[] is used in the
> driver.
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
