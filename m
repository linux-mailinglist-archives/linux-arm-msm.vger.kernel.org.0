Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A274313CC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbhBHSJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:09:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:49838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235295AbhBHSHg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:07:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B88B64E84;
        Mon,  8 Feb 2021 18:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807616;
        bh=jKHDl2bY3mutddaPa5BoyjDc0nJvw3gQoXQViYTHdHY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lJUrlLRvA1Kp2UV97EI8bqagphpC3iR5Z62kUfW7kpSKln+vwyjVTAQbWF6V5nLUL
         x188Z91n/lq7L+iTG4eLwSnX+luGTBI1uQgCQeGrdTdDku/X+wNVh1WD1hd8Yar+4z
         A2W7VejPvUayhGkaq3T36zkFnxN/4yjM7m+bA77Hd7OVrC85vjMj6uw3hTnNiwdLgF
         +m94UOk43POczLy4d8NxMBtrlFM+KyypNzHNhjNlUb4P52rmCduoMdi6UpkrZE3X8L
         G1Dv2JRWFQ8DN1fEN2wXJ6/qA4Jo6p+GCQ5D4hEAJZlm4yg+JU0gqVxh1WSO3lw0fe
         3TDEF2AzgrtGg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210127070811.152690-4-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org> <20210127070811.152690-4-vkoul@kernel.org>
Subject: Re: [PATCH v5 3/5] clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL
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
Date:   Mon, 08 Feb 2021 10:06:55 -0800
Message-ID: <161280761503.76967.2425976754360789629@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2021-01-26 23:08:09)
> From: Vivek Aknurwar <viveka@codeaurora.org>
>=20
> Lucid 5LPE is a slightly different Lucid PLL with different offsets and
> porgramming sequence so add support for these
>=20
> Signed-off-by: Vivek Aknurwar <viveka@codeaurora.org>
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> [vkoul: rebase and tidy up for upstream]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
