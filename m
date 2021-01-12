Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90CBD2F3A43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 20:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393174AbhALT0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 14:26:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:47798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393169AbhALT0Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 14:26:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC9C220720;
        Tue, 12 Jan 2021 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610479536;
        bh=y8uaxQHnYfsM3nBRr3dot9+f4CYuLx5jujwQw4U0xW8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TI4XoOcdWtycRsjfs0jho4C+n4T4yAxhAIch9gvwqBNVlpYg53Ld+/V2/kCovEaGw
         vFobpWyg4r8sUAtkqjnkfRjfUhgPs3K09xTW74WgK7Rp1YNc5FSBn5o+lbKcxp2xct
         hfqSPcVTdabduFNXSPWkhuyHY5lke19X6TntZ2WrUnnZjJo5y0ar+OyYXGHvweUE9u
         ldcGbRfA7JbuaBxSmHzVx6k0J1yeW3o5CFqADIUdsTdVp5va6viO0wGGZx83/pWtCJ
         XEdo/mgjlBr7/bJNiEO2EPdkV2N9DcaWxJlvP5vpdAWyFuTveiVngjshL0UoKy2C77
         3pFTYifq/c1rA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1608573816-1465-1-git-send-email-tdas@codeaurora.org>
References: <1608573816-1465-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: gcc-sc7180: Mark the camera abh clock always ON
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 12 Jan 2021 11:25:34 -0800
Message-ID: <161047953458.3661239.9839634954560476328@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-12-21 10:03:36)
> The camera clock controller requires the AHB clock, the driver when
> moved to use the pm_runtime_get() API, the camera ahb clock failed turn
> on before access, thus mark it as always ON.
>=20
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead=
 of clk ones")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-fixes
