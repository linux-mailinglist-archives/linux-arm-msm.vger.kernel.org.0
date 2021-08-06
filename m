Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D7B3E211E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243198AbhHFBnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:43:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:34160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhHFBnY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:43:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7D6C60FE7;
        Fri,  6 Aug 2021 01:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214189;
        bh=AjuaZkcbeAR7e48uZ70iOG0vcwfUcBkQpAwgLstpTbo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iDEYnl5DBjb9QXlfY2bZqmfPU7j6x5MYv9i9NMXrG79oT5ar1Lc3gtTVCtske8spb
         D5gso1ojexCPAejKnxrdWajBTL42YZQYewfxNj2VsLwwdQeaQ7X8lVcuuDD9262fwb
         c5yVL0dB3jQJRWy8vuzC064nm9DEnHc4L9iv5wy4owKZgJii5uXrCBMSwYp+Nvdbrn
         Jesg2UsPxy2odJNewiNva9q5ghS658y8IsV/wLX9fbQbZpraPAzsbYD/4y8BoLFGnv
         tK4MrvdgeYHl9myPHTaws0Nck1ttxZ/fnViwMdqo45cKOOZIFSOZJxz5dldTiLVSOH
         yfgfeyUqAXB9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c662hoLme5MIdelk5BVPsVgN77IqTLS0KwYwpauJiDs@cp3-web-047.plabs.ch>
References: <c662hoLme5MIdelk5BVPsVgN77IqTLS0KwYwpauJiDs@cp3-web-047.plabs.ch>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom-rpmcc: Add compatible for MSM8953 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>,
        bjorn.andersson@linaro.org
Date:   Thu, 05 Aug 2021 18:43:08 -0700
Message-ID: <162821418844.19113.13000250471134426704@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sireesh Kodali (2021-08-05 10:19:29)
> From: Vladimir Lypak <junak.pub@gmail.com>
>=20
> Add compatible for MSM8953 SoC.
>=20
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---

Applied to clk-next
