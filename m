Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBA1274899
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVSvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:52574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVSvp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:51:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36C5F238D7;
        Tue, 22 Sep 2020 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800704;
        bh=0LMbuk6CTeq8oAjc5gUwElHC9G/u0ZceND1LbMPooW8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Yz1vM3+RpUUucrLlVs7Y0neNjzYqN7ve/G4RlFvzlNwxhL1WmBQBBCeT+gzQQHcx8
         T3Dg5sku9fEBEk4htqncGFuoYGGu9NKTqStj0xOoHaJWWsLFWEF3eBPa9NyWKQ6ZP/
         M6tl+xZFmGyQNEQEhtw/JksZ6vw0PWcTY/0iMDPI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200916231202.3637932-10-swboyd@chromium.org>
References: <20200916231202.3637932-1-swboyd@chromium.org> <20200916231202.3637932-10-swboyd@chromium.org>
Subject: Re: [PATCH v4 09/10] clk: qcom: dispcc: Update DP clk ops for phy design
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Tue, 22 Sep 2020 11:51:43 -0700
Message-ID: <160080070307.310579.1550032345045011322@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2020-09-16 16:12:01)
> The clk_rcg2_dp_determine_rate() function is used for the DP pixel clk.
> This function should return the rate that can be achieved by the pixel
> clk in 'struct clk_rate_request::rate' and match the logic similar to
> what is seen in clk_rcg2_dp_set_rate(). But that isn't the case. Instead
> the code merely bubbles the rate request up to the parent of the pixel
> clk and doesn't try to do a rational approximation of the rate that
> would be achieved by picking some m/n value for the RCG.
>=20
> Let's change this logic so that we can assume the parent clk frequency
> is fixed (it is because it's the VCO of the DP PLL that is configured
> based on the link rate) and so that we can calculate what the m/n value
> will be and adjust the req->rate appropriately.
>=20
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next
