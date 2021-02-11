Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DD9319457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhBKUWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:22:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:46182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230178AbhBKUVz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:21:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD5F164E45;
        Thu, 11 Feb 2021 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074874;
        bh=nBDuoOPl2BC4dw0R833vH2MHPtz1uj5/Lyf5TVqt0GM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jGIHr56XIG81N26KDukbBe6iXk2eVL+3VnaGxN45snV7uB23Ovc4kHuq89YJgZYIG
         phcd8oD0ksPm0d6b2R5r0GmclsEkeSAezL3GSt0mSQ+jFDDOn3jv6K/46TwhJOuCAH
         BYLHN8sDlj+rlMMTcy6Xbhg/swuw045XHvFe5GJil3bJ2jYgXO3IC+9zthfSHVqtI2
         tmA68fzC+uAsQNILrjA/2j2sCh5BUJ6wOq1pwUJSRUhUYl+PQKpyWwCDd0LtHCmkwc
         RjpVVayaHuzWMN5YoOdRiOzi410G+d6BkzWI0rUgmF1cHGEYgxIBpYoolcDdBvlGze
         Ayj2xSC7O80MA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-10-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-10-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 9/9] dt-bindings: clock: Add QCOM SDM630 and SDM660 graphics clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, agross@kernel.org
Date:   Thu, 11 Feb 2021 12:21:13 -0800
Message-ID: <161307487351.1254594.16017373834655513508@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:17)
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SDM630 and SDM660 SoCs.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
