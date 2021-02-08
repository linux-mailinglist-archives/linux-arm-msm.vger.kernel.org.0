Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C8E313CC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbhBHSJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:09:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:50104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235317AbhBHSHt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:07:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B95964E8F;
        Mon,  8 Feb 2021 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807628;
        bh=3DhjuEOEQgd8AK4Vx0amC4m+Fg94MFbUdnNXs4AGCOU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fX2FRsJMCbve+TbNKJ1mCrCV0lMR81Cksaw8BP6xhtPOdT8o5OTetcqJaHjdP83ai
         D1pR1cDFr8DHe4Gnel9gjfWk30GQlilJr4EMIrYIcugc1mxY26EORuHdVnG0h16gFH
         2eaI1QL0luDd/j30c/rxM2fTBZz7WANT0W2POsnq2UwknwnjToK6J87f6qwYjBkLJi
         aOtH9JfGv1SNFPxqf2rfuA/hE87SUdEwRnmr//jEL8LmFblOvb7xgcd+YMStB/EnJL
         kg8BSzjkGcHu8QXW5BK8kdB5nsXJbAx85b1/UZ4r3CAoAgZzGx2mZX3iTWjCRJ0qCU
         qJECzZ6EmiqKg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210127070811.152690-6-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org> <20210127070811.152690-6-vkoul@kernel.org>
Subject: Re: [PATCH v5 5/5] clk: qcom: gcc: Add clock driver for SM8350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Mon, 08 Feb 2021 10:07:07 -0800
Message-ID: <161280762712.76967.16866879421030882888@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2021-01-26 23:08:11)
> From: Vivek Aknurwar <viveka@codeaurora.org>
>=20
> This adds Global Clock controller (GCC) driver for SM8350 SoC
>=20
> Signed-off-by: Vivek Aknurwar <viveka@codeaurora.org>
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> [vkoul: rebase and tidy up for upstream]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
