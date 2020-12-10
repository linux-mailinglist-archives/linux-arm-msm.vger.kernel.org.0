Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214312D6917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393846AbgLJUsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:48:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:52004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393767AbgLJUso (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:48:44 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607633283;
        bh=sBS4z7z+ZK+SS0HqqBu8JlPeZYZtXLCEp8GHGXUx37c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jqQlcInKIYnXK96TioPAZYEBGEW24v8H91xA4Sp29XT2e4ouS5nKy7GJZ9X41gsBl
         W6X2S4kdegMcELbaX1BhZnrH+ux4v1itUIH9mSR5BkBrWaWF1U494WKbo+wF+J1Oh7
         OxHcOr/m2OuQadrTF07bvfbITgbfLzMmcMmnuAzdfLiqud4RFLW1x3VQSfV2MP+pt7
         E6x5lhdPMVomx/Hi4UU6XZ00HayqAfIT+dq54TWNlPAp7qHSgal+xCiN/zvyhzN4wb
         kcAglFakR6iRys8xHaHSF/1ki8mISbNJn2xqLPSFhz36SZy5suvpH92eqq26gxjT0k
         QsojOtubTG0Bg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201208064702.3654324-3-vkoul@kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-3-vkoul@kernel.org>
Subject: Re: [PATCH v2 2/5] clk: qcom: rpmh: add support for SM8350 rpmh clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 12:48:02 -0800
Message-ID: <160763328200.1580929.9235573228755393271@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-07 22:46:59)
> This adds the RPMH clocks present in SM8350 SoC
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next with lots of noise!
