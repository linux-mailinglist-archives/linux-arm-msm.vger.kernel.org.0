Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF05117EBEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 23:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgCIWVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 18:21:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgCIWVU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 18:21:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4B8E24654;
        Mon,  9 Mar 2020 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583792479;
        bh=eQAbDt0tiqfOkJwm9FprozG0zwkYFRbFRzXIAKrmXOs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CXnhLbOWX9BCunAnfZ3MHDxyyKAapVztspXGjxXkHgfxRyD/cfBp6b10lpua8aP1T
         WdO04U0uokeqzEKl7ZdcmXNCUP4gIPPLapatKpKvgTT0BKZAQsfx8jImyJ5n7qjvWW
         ENnuz2DuSB3AkJrYhQGWJfUcHrhn0J0gbvBlF5Ks=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200224045003.3783838-6-vkoul@kernel.org>
References: <20200224045003.3783838-1-vkoul@kernel.org> <20200224045003.3783838-6-vkoul@kernel.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: gcc: Add global clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, vnkgutta@codeaurora.org,
        Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Mon, 09 Mar 2020 15:21:18 -0700
Message-ID: <158379247896.66766.8303109383349493440@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-02-23 20:50:03)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> Add the clocks supported in global clock controller, which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
