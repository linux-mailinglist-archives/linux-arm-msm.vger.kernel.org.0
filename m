Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3715E2D4F7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgLJAem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:34:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:55874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728448AbgLJAef (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:34:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560435;
        bh=F77ivtoe1JKtlcvXA6W2cjZqACGVyncVsGLs616kk5I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aw72G4SrVbhwZGzpBRI38vpJuo96bViSqE91v/mO3c1xEmDN3K7eEvEvwtwR6bfzR
         6+joBnTKQZ/h+xR1v7v3YSA8tmuU9XN8+8yCCysfCf5cGTo2a1JFGjjKmB9xWkeOBh
         kE2V/ZqRkMqIjiGtKiirB7lqxRH4x74nFBPdKy8Vd8B1X2JpzkYEyrkEwBWHCJyQvX
         JBW1rp6VOUxhYjdGLclkLXFyzkI+t8otqABRU8KlESNEyEjEmwrFLA0TAnAoOxibNO
         ddS7AzTO1c3R1ojGWBABC4Tg9P3SVBuh5nIk+NamKDRTJGtPoMBFTNgsI91B8nvPj4
         FZcgFWF7ulYKg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-2-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-2-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 1/6] dt-bindings: clock: Add SDX55 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:33:53 -0800
Message-ID: <160756043374.1580929.2256356743862452282@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:39)
> From: Vinod Koul <vkoul@kernel.org>
>=20
> Add device tree bindings for global clock controller on SDX55 SoCs.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
