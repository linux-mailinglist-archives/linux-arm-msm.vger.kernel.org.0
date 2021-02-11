Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A69B31943A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhBKUTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 15:19:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:45536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231360AbhBKUT2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 15:19:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC6E364DBA;
        Thu, 11 Feb 2021 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074727;
        bh=4IO5OTb4cA9BvsvjPNrepg+s2Y756Ag74+fYnQa0c7o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gB6953b5gfH5a8x+F/1EKOOoU9aYzZ9znW/tHGQ0f34qHTnc683dro2Hvz4Lwn7iu
         7Z3buFV77Ry+ubqZPAoBfXn/IlJlJKEFHaf68fZevRKwbilBnhuwQpXdrNj8qwuXxK
         IZ7RZiJwms5rOXLAIqtO1+FJ7jUo+ivKrh2i8KEE2XUL0+xS+lz+0+gdxQTfPGO+p9
         stgxDVz2GYYpi6tSRvXKl1ELvp5hGX16x3b+cgXT2dpXqJAb+QuIXRlrquCApoHWCr
         UILNVvOCzN3iEPqVsek6xFOHwgQPL4VcvTkT5EJyX4QbC40VDDIjNIe9c87guHjVxp
         ZX/SaaVaVHXDw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113183817.447866-3-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org> <20210113183817.447866-3-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 2/9] clk: qcom: gcc-sdm660: Mark GPU CFG AHB clock as critical
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
Date:   Thu, 11 Feb 2021 12:18:46 -0800
Message-ID: <161307472654.1254594.9551324009085927503@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:10)
> This clock is critical for any access to the GPU: gating it will
> crash the system when the GPU has been initialized (so, you cannot
> gate it unless you deinit the Adreno completely).
>=20
> So, to achieve a working state with GPU on, set the CLK_IS_CRITICAL
> flag to this clock.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
