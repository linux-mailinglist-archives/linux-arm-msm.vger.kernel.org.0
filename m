Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D857E125B27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 07:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfLSGAV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 01:00:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:53448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfLSGAV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 01:00:21 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 573342146E;
        Thu, 19 Dec 2019 06:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735220;
        bh=gG6+7aQFJJUmUk++k9UBv4J8xKQ0NLl8KBfsU7u+tfI=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=IZyEOmkwJCA3pXpAQppS4B8k/NZZu5VsoJKb+VmI3+KcUm/nkxhbvtAivTvu1LxxF
         E9t9VaPK8kUdYOZW5z4Hr/sHmpuGaPBneFWF9L/oaQWwH4gDdfxsWIQXBwOGGeLBsT
         4pf0vuylAPU/oEgg/8sQ7FLF4twocT0l8vmlDcoA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191217171205.5492-1-jeffrey.l.hugo@gmail.com>
References: <20191217171205.5492-1-jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] clk: qcom: Make gcc_gpu_cfg_ahb_clk critical
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:00:19 -0800
Message-Id: <20191219060020.573342146E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 09:12:05)
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm899=
8.c
> index df1d7056436c..26cc1458ce4a 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2044,6 +2044,7 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk =3D {
>                 .hw.init =3D &(struct clk_init_data){
>                         .name =3D "gcc_gpu_cfg_ahb_clk",
>                         .ops =3D &clk_branch2_ops,
> +                       .flags =3D CLK_IS_CRITICAL, /* to access gpucc */

Can we not do the thing that Bjorn did to turn on ahb clks with runtime
PM for clk controllers that need them? See 892df0191b29 ("clk: qcom: Add
QCS404 TuringCC").

