Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C293938D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 19:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbfFGRny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 13:43:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728684AbfFGRny (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 13:43:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31EDA208C3;
        Fri,  7 Jun 2019 17:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559929433;
        bh=gXf4g7NtG4W1D13TFXtjWxdNR+9w+PrxucbuPxyrkv0=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=mURIPArJDMacO6hbAVcSQ9mKR1J1RgcZijTvGQT4aBispznA1+9DnWRL1BqsVMs3L
         tIm7vTdactHn1yPF/DTnSApajeXtsJKvmIW6ZRw8d39geCQxXeo0RHmHhLOwrONtuH
         nf2g/9TQ7iVz6GhbSt+cBDRI6WMrrTi+9f0wtKIg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190607101234.30449-2-vkoul@kernel.org>
References: <20190607101234.30449-1-vkoul@kernel.org> <20190607101234.30449-2-vkoul@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver for SM8150
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 10:43:52 -0700
Message-Id: <20190607174353.31EDA208C3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-07 03:12:34)
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> new file mode 100644
> index 000000000000..1cbc884444c9
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> +static const struct parent_map gcc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const char * const gcc_parent_names_0[] =3D {

We have a new way of specifying clk parents now. Can you use that
instead of using strings everywhere?

> +       "bi_tcxo",
> +       "gpll0",
> +       "gpll0_out_even",
> +       "core_bi_pll_test_se",
