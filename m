Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C9D2273F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 02:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgGUAk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 20:40:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbgGUAk0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 20:40:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31205208E4;
        Tue, 21 Jul 2020 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595292026;
        bh=caIJ9UHWFO3j4suipi8fghZYM8epWg2H0L7RuEqQcIU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cmDGIiUhgBThryyYmX8DqmDPWalMnfafEwBfZvYql3z0T7HrXhrQBeMUZab3HQ3Hv
         jzj52a8kzLYivQ4xENV5nZX509Ah28UnHoQkDXs8O18a/YlJvbRl8Hhy1j3Hmt+hCC
         xVWMcBo1646GQs2+q1rTpdLiBbFwVEcBBZ/rIpKE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200714142155.35085-1-weiyongjun1@huawei.com>
References: <20200714142155.35085-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: msm8996: Make symbol 'cpu_msm8996_clks' static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hulk Robot <hulkci@huawei.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Wei Yongjun <weiyongjun1@huawei.com>
Date:   Mon, 20 Jul 2020 17:40:25 -0700
Message-ID: <159529202554.3847286.12960066226968973482@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Wei Yongjun (2020-07-14 07:21:55)
> The sparse tool complains as follows:
>=20
> drivers/clk/qcom/clk-cpu-8996.c:341:19: warning:
>  symbol 'cpu_msm8996_clks' was not declared. Should it be static?
>=20
> This variable is not used outside of clk-cpu-8996.c, so this commit
> marks it static.
>=20
> Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next
