Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A10BC85950
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730823AbfHHEap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:30:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:42672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbfHHEao (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:30:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEBD321743;
        Thu,  8 Aug 2019 04:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238644;
        bh=QyHfbYEnhKJ3NqYEHAW9BZnKWlTwMK7JB7cmCrL4ofI=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=QD+mR4yddqw7TASLyP9NF3ocHUQUE4/RUa49X0AwFtM5QPVN/mHMXT6ys5LZJz5Jp
         IJei0OZFrK2fXLfdoGZuqN2mjOo1FoZnu9srWYNctnvt2YZ/1QIblc+5vq5f2EjT+e
         LXtQWQcj3F5FH3sXZnjF7G06Nxypnl/l/7M7/gRo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722074348.29582-6-vkoul@kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org> <20190722074348.29582-6-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: gcc: Add global clock controller driver for SM8150
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:30:43 -0700
Message-Id: <20190808043043.EEBD321743@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 00:43:48)
> From: Deepak Katragadda <dkatraga@codeaurora.org>
>=20
> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
>=20
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up
>         port to new parent scheme
>         Add comments for critical clocks]]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next

