Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203BE1E35AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgE0CaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:40624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgE0CaO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:30:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6324207CB;
        Wed, 27 May 2020 02:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546614;
        bh=a/3K3G+F2KEbekWTjK3Q4wJsBRNJHvwitw+VbA3Qjyw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i4F/6991OhNBRbSdPhbG/BMLIRj9vbZkPwnsrQLVvnjUnAMZYnvD+9cVHTJm5ZntH
         C97Q+6Zkz+pY2+/ui0FIHMaRr9sm/zXbbfbaCuTBJ+NC0OtUCFs9dg2EdS+f0hREPa
         nfAF7g9Q4fTxjZcBmfxCqTrp72TRtCcK8A4r87Xs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590314686-11749-5-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org> <1590314686-11749-5-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V5 4/8] clk: qcom: Add DT bindings for ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 26 May 2020 19:30:13 -0700
Message-ID: <159054661322.88029.16916819048155217664@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-24 03:04:42)
> add dt-binding for ipq6018 apss clock controller

Capitalize 'add' because it starts the sentence.

>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,apss-ipq.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,apss-ipq.h
>=20
> diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindi=
ngs/clock/qcom,apss-ipq.h
> new file mode 100644
> index 0000000..77b6e05
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,apss-ipq.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
> +#define _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
> +
> +#define APCS_ALIAS0_CLK_SRC                    0
> +#define APCS_ALIAS0_CORE_CLK                   1

Will this be extended in the future? I hope that this is the only two
clks we expect to see in this file.
