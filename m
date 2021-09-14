Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E41940BA83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbhINVnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:43:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:45844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232891AbhINVnL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4F7260F46;
        Tue, 14 Sep 2021 21:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655713;
        bh=yz5Bfvyarz8ioV1nD8LWZxEwKdqGjFozaYoqtDxmce4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n8OwrgRGFqEh3jjsms76i6N1FzD9i3xgYm2ic95Rx4DW0JxzsGbySrBDn02Wcyiqw
         qsmvAcZqf5zMrkKQG0LrkA/8nEnaLQCV5w0gXo7GFKgfj/qAmUbm4OvnuZlQ43tFjC
         MlSO6Vp0I0b94rT0YpeNjOrCC0uFLEa+Rk7j6UF+YpB7hfH3Aoy+CLB4aK2xa/rvxC
         n1uwSt4qr5nigm94X3r3suQcwC7wizb7wNLlDMe8xaQOk3TPjVoC16zhGL26EhLiAB
         0XlV+23Cov+ish1ADEuj5KI2fpeHg9xlxke28vAMg2ph5bH6k+6v1D5Vudhzy7ai3D
         L/qbjr9pOcuHA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-2-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-2-marijn.suijten@somainline.org>
Subject: Re: [PATCH 1/8] clk: qcom: gcc-msm8998: Move parent names and mapping below GPLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:41:52 -0700
Message-ID: <163165571230.763609.16990888514996843036@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:33)
> Prepare for a future patch where we use .hw pointers to these GPLL
> clocks in the parent mapping instead of name references.  This requires
> the GPLL clocks to be decared before parent_data arrays.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
