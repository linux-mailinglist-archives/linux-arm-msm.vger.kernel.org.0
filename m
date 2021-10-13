Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F32342C7DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 19:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhJMRps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 13:45:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhJMRpr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 13:45:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5958D6101D;
        Wed, 13 Oct 2021 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634147024;
        bh=GRr7bwym4r/yAYW4NMq5l1Og9mmLAjPOLkOOX9nOweI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GbAV9mVI1IKoCTcHmoPADuVo5SgIvcDHvAyaSVaKnZhI2u23eOGqx+idePZzWKLsG
         78wa+TYO8j8hYRasYLAZXGV4Ar7dPPwmNtPxSoRszMYywPV37A+DInyxHvS+KjFD5d
         iz2eCjyCs2vanWPEtBfNW0tgoJZp1jSpZIjtoFAuLqFhdtJ2MoDufD+xvrUB8OYOf5
         CV52bnveCQYdz/S6GuieCGIuUSsmHu2ggMyKhJCQ2AjC8lW1DOYYz8PN0dn1OjyF32
         sCiq7CVnohfFnqXTenwVXWhowCtFe1pY5JtujYWyWayg/geE3DYEqOEV2OEj3y3unH
         FWGACsfwWmfNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210919022308.24046-1-shawn.guo@linaro.org>
References: <20210919022308.24046-1-shawn.guo@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-sm6115: Fix offset for hlos1_vote_turing_mmu_tbu0_gdsc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 13 Oct 2021 10:43:43 -0700
Message-ID: <163414702303.936110.8653867934433784570@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-09-18 19:23:08)
> It looks that the offset 0x7d060 is a copy & paste from above
> hlos1_vote_turing_mmu_tbu1_gdsc.  Correct it to 0x7d07c as per
> downstream kernel.
>=20
> Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SM6115")
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-fixes
