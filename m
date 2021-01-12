Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213872F3A8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 20:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437053AbhALTaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 14:30:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437052AbhALTaK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 14:30:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D29021534;
        Tue, 12 Jan 2021 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610479769;
        bh=jRiOwy5KBEFQHrrDFnRIO67/iWfar6NlzFq2cbm4JS8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d9zbziQbd42O0HV7U0lg3sfWQJc2Ei6LUlL+O5VVg9QLLT2GgVcWudvRdU1O8+orb
         25Ny7cmVuTqNVaVqQJN4uysv5AKmoroSqNkeo/BZ4guyeE3ry02dAvQOmeOyUSxcB6
         aSpE2HxXGmOdPiKiaDnuTcE5b5fNHYNfX9qbgtGl9B+GlAMgeMD4FgFBH+JRm5PhAs
         0dbAkpy+1uWiMeMIPfLnoEAR64MZ3dg/U+T6+o1ijcMUaa0NM3K2rhXiz4lPB7Bhyg
         Aoh2cuiDpUxAMnEiOhgW3lcVUu1kZUS4XmQp0gxu9wv5vYe8d6JrCUcNry3MOZubgF
         +Vuy3FH3TFuJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210109013314.3443134-1-dmitry.baryshkov@linaro.org>
References: <20210109013314.3443134-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: qcom: gcc-sm250: Use floor ops for sdcc clks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 12 Jan 2021 11:29:28 -0800
Message-ID: <161047976804.3661239.1288128567029047407@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-01-08 17:33:14)
> Followup to the commits 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use floor
> ops for sdcc clks") and 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor o=
ps
> for sdcc clks"). Use floor ops for sdcc clocks on sm8250.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver
> for SM8250")
> ---

Applied to clk-fixes
