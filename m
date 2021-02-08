Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F78313B74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 18:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhBHRsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 12:48:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:43250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235053AbhBHRrt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 12:47:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2798164EA4;
        Mon,  8 Feb 2021 17:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806428;
        bh=8OWNI57mi68SyM/MyTZHViIxZAiyeIOPISvzIG6bCes=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V3IxjejXWf5M1birVBIzTGsPJvEW0Yj1RA8UF2OvUeM2UAhchlySdJx6T2myE1XE3
         J8rX5cbUOyEdKhuFrb5qscmwKfZvHdsHWFGV24ryrny7VdO6349IcgZlqzw060DaWr
         UlyNYeOrqZWHL72zQLIB6IdMmg3fXg5T9jZUTpCPO3P1qBnrGr46f9Cjmfo4FJfT2T
         OM+/qGFmv+tXp90rwPgiHO6TH0yQWCbWzISfTyyLChp2Y6veaowajV8ACeCCb5ad5x
         YW3JpeFfxJ9LNNv8mQPJCjsYpEQadfd097Q7t3kuCbtSMSZM4n0JbYb49AAFk/wz++
         /hiqc6gkAaEfw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210118041156.50016-6-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org> <20210118041156.50016-6-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 5/5] clk: qcom: Add SDX55 APCS clock controller support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jassisinghbrar@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 08 Feb 2021 09:47:06 -0800
Message-ID: <161280642697.76967.2863036519515305315@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2021-01-17 20:11:56)
> Add a driver for the SDX55 APCS clock controller. It is part of the APCS
> hardware block, which among other things implements also a combined mux
> and half integer divider functionality. The APCS clock controller has 3
> parent clocks:
>=20
> 1. Board XO
> 2. Fixed rate GPLL0
> 3. A7 PLL
>=20
> This is required for enabling CPU frequency scaling on SDX55-based
> platforms.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
