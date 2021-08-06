Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0823E213E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243297AbhHFBvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:51:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhHFBvG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:51:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E6E361184;
        Fri,  6 Aug 2021 01:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214651;
        bh=Y20m4fzhDqO1uu3REta8tfDLdL1byQtADOr200QbLO8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EX8ML/QvqmnKl/RTB52GJ5AB/+mckwevNgE1J5w8da6+ZqXEewWRGC+OUFgbLn1Sy
         Kcpsvu8o6h/6ZwaZNydc/XidvgUHMGA+AjDOZfFQMGCV2hoA0lC/4YhgJwmtcXZFLg
         ajllwxjiWenwAF5wz4tkZs8zMa6btnLNAMn4Kbd3RPfmhmObn7n8JRCnnj2q6AKn7d
         UI77Kw4AG25PXNrhYvVPcsgw+ECDAa5pbNr/QX8SrWOwF21YVgodpauiINTDyKVCyJ
         ahS/cbWmYH0PowOnx9H75TIoGVJW+0w4dWWBtCwJbR7ZIJD2VxZ0VPp9aTkrdYwNc1
         E5tvQDhOgCxDQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210721225329.3035779-1-bjorn.andersson@linaro.org>
References: <20210721225329.3035779-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH] clk: qcom: gpucc-sm8150: Add SC8180x support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 05 Aug 2021 18:50:50 -0700
Message-ID: <162821465017.19113.3601448394011862755@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 15:53:29)
> The GPU clock controller found in SC8180x is a variant of the same block
> found in SM8150, but with one additional clock frequency for the
> gmu_clk_src clock.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
