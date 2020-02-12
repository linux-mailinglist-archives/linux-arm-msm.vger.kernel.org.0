Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC0FC15B482
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgBLXJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:09:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:50528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729119AbgBLXJ4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:09:56 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCE1F2168B;
        Wed, 12 Feb 2020 23:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581548995;
        bh=1iUCooTSVvuSZIPW3R3UIqC1urOlQcutMWC6laLHEHY=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=vmYeuGVhwp8SuZHsnbrsdOd353kfjeHcJ0LtW/I/plYN/B2M5QzcZ1OGdPWwTpdGf
         QPGpVOiRzvNLUVb87cyLcpkNPlGp595RhlYhtCIwO06wsPEZawP62eYVKI1tMWHgT1
         O/E4MYJh2bonuiPq2d2hbdcNEiINDEnYfrT8noyk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-4-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-4-git-send-email-vnkgutta@codeaurora.org>
Subject: Re: [PATCH v2 3/7] clk: qcom: clk-alpha-pll: Refactor and cleanup trion PLL
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
Date:   Wed, 12 Feb 2020 15:09:54 -0800
Message-ID: <158154899499.184098.8708399326565910374@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:23)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> The PLL run and standby modes are similar across the PLLs, thus rename
> and refactor the code accordingly.
>=20
> Remove duplicate function for calculating the round rate of PLL and also
> update the trion pll ops to use the common function.
>=20
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 71 +++++++++++++---------------------=
------
>  1 file changed, 22 insertions(+), 49 deletions(-)

Looks mostly ok but it's wrecked now by me. Can you resend, splitting
this patch into at least two things? One patch to replace defines with
standard names and another to do the rest that this patch does?
