Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FE534DD34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 02:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhC3Aq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 20:46:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229762AbhC3Aqe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 20:46:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F61F61987;
        Tue, 30 Mar 2021 00:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617065193;
        bh=FlzjDQTzeSqpQF17Su/mWXUHWaR1+TgEbGUw4A4RPSk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JRHOg3HgOGka3vR0C5Wr4RK5C7P5uCGuwi283HZ/0/L4haG52BBO1lbU7dOR33HoW
         F54XmKPR8cM0RESdr+UXLLkmKT4xaRlxN9+KAwDaFPLDf0IlTw8nXhmS+doqPHZJLJ
         ZtYbgYsu/faE8KA7e8zQNAmwCKyIl32QE8+xFlp2sUm59MxGDhrAfzo9Nl91FjMxnR
         v7ZC+VDBU85cT7J5cXsyM087YFvXgrjCOMNZb39wS/n0xe4RACGj0i7VnrSKwQComy
         tlk4+a7V+fBREpeUCdjXV6ub/OI25mWwD86bM4zZdZZXjnTk4rLxA2ENlqLH0paWRR
         wP+3u+tfwsW0w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org> <20210327110305.3289784-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 03/25] clk: divider: add devm_clk_hw_register_divider
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 17:46:32 -0700
Message-ID: <161706519228.3012082.3104809310968030487@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-27 04:02:43)
> Add devm_clk_hw_register_divider() - devres version of
> clk_hw_register_divider().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
