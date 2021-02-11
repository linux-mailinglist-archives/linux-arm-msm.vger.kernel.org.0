Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FF431944B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhBKUVT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:21:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:45816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231701AbhBKUUu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:20:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54DE764DEA;
        Thu, 11 Feb 2021 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074805;
        bh=a9aq9q/LRnRIaH3axLB6jG4cdPZnvdP5mq0QB63kdjk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Lm6SB4td6BYO6VPHcXyYUodx0bBPRrCehvH797qf08tDpWt1d39YqSFMrrrL36QGG
         9VjzCvvGorNOrI1iicStTRjXK1CRySypqkpjczyXPOz+JUzalGuZCWAdqcKPSjn/sa
         XiqXoCeOerzrjybmKx2S1469FMF0zbw3p+Y4bUmVw9baoqV6Onm3V+DMAMk/5wj2AD
         6MTIyv6F1EhUL7cEF2VgOt1gvi1bxqP3B6nxV2JDR/vRMZ2hdLPGMNz6bFwVckYQoC
         NQVXa0c7CmOy8HuV0GrzxIb8rMnWSroZJ9YKCmXGkaWRmf5Ph2J2Qc90exQu/oP5fa
         lbziCoMpHfZZA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-7-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-7-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 6/9] clk: qcom: mmcc-msm8996: Migrate gfx3d clock to clk_rcg2_gfx3d
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:20:04 -0800
Message-ID: <161307480409.1254594.7935917910063172109@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:14)
> In commit 734bdefdb043 ("clk: qcom: rcg2: Stop hardcoding gfx3d
> pingpong parent numbers") the gfx3d ping-pong ops (clk_gfx3d_ops)
> were generalized in order to be able to reuse the same ops for
> more than just one clock for one SoC: follow the change here in
> the MSM8996 MMCC.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
