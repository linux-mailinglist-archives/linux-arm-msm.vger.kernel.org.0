Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1726521C10F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgGKANL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:13:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgGKANI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:13:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62209206D9;
        Sat, 11 Jul 2020 00:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594426387;
        bh=IchMVcoW1LKizSzKULV00A2SgEM1RwVjvtN45t0C6zo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OH9B8x+k81Anj6D+4C3CmoLO2EnpUhH8BiQbyPKakDyPWAxb+MQShjJCfP8zUfUcs
         +Zh/rLpZtwadQPoEVudlyqbQpOyxZgkm9PQn87ARwUBgn6+0g+dTJyf09SRyvTxl0Y
         i5QDygMeN/yXXUD5f0KPYsgAvrVPdQzjdSxHSuVA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1593766185-16346-3-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org> <1593766185-16346-3-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v5 2/5] clk: qcom: Add CPU clock driver for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ilia Lin <ilialin@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 10 Jul 2020 17:13:06 -0700
Message-ID: <159442638672.1987609.12899930298816936770@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-07-03 01:49:42)
> Each of the CPU clusters (Power and Perf) on msm8996 are
> clocked via 2 PLLs, a primary and alternate. There are also
> 2 Mux'es, a primary and secondary all connected together
> as shown below
>=20
>                              +-------+
>               XO             |       |
>           +------------------>0      |
>                              |       |
>                    PLL/2     | SMUX  +----+
>                      +------->1      |    |
>                      |       |       |    |
>                      |       +-------+    |    +-------+
>                      |                    +---->0      |
>                      |                         |       |
> +---------------+    |             +----------->1      | CPU clk
> |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> |               +------+-----------+    +------>2 PMUX |
> +---------------+      |                |      |       |
>                        |   +------+     |   +-->3      |
>                        +--^+  ACD +-----+   |  +-------+
> +---------------+          +------+         |
> |Alt PLL        |                           |
> |               +---------------------------+
> +---------------+         PLL_EARLY
>=20
> The primary PLL is what drives the CPU clk, except for times
> when we are reprogramming the PLL itself (for rate changes) when
> we temporarily switch to an alternate PLL. A subsequent patch adds
> support to switch between primary and alternate PLL during rate
> changes.
>=20
> The primary PLL operates on a single VCO range, between 600MHz
> and 3GHz. However the CPUs do support OPPs with frequencies
> between 300MHz and 600MHz. In order to support running the CPUs
> at those frequencies we end up having to lock the PLL at twice
> the rate and drive the CPU clk via the PLL/2 output and SMUX.
>=20
> So for frequencies above 600MHz we follow the following path
>  Primary PLL --> PLL_EARLY --> PMUX(1) --> CPU clk
> and for frequencies between 300MHz and 600MHz we follow
>  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk
>=20
> ACD stands for Adaptive Clock Distribution and is used to
> detect voltage droops.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Rajendra Nayak: Initial RFC - https://lkml.org/lkml/2016/9/29/84
>=20
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Ilia Lin:  - reworked clock registering
>            - Added clock-tree diagram
>            - non-builtin support
>            - clock notifier on rate change
>            - https://lkml.org/lkml/2018/5/24/123
>=20
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Loic Poulain: - fixed driver remove / clk deregistering
>               - Removed useless memory barriers
>               - devm usage when possible
>               - Fixed Kconfig depends
> ---

Applied to clk-next
