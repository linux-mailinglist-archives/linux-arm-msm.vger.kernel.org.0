Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6136121C111
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgGKANZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgGKANZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:13:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF4C6206D9;
        Sat, 11 Jul 2020 00:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594426404;
        bh=6m9kYT0JvZIYNR3lBPNF7NPOZAwsUD5530ft8YHMF6c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=wvd3lNQVeAlfVzRMFjyO5dIc73tuUfr32ECW+WWUMX3mesYiLgv0IAiRUcnkWygG3
         tqRpR2fqwwDLvRy3j8Bxa+2ae7uT750g4fbhkJ8BIG+zpVwj7ez//sH5I6iPfLbMky
         O5Z/VdfCbT0mW4SULaQj6eA3ubfc3dkZQeRpg6qw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1593766185-16346-4-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org> <1593766185-16346-4-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 10 Jul 2020 17:13:24 -0700
Message-ID: <159442640418.1987609.16468106693473840191@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-07-03 01:49:43)
> From: Ilia Lin <ilialin@codeaurora.org>
>=20
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
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
