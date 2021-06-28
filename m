Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEF63B573F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 04:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhF1CiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 22:38:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1CiE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 22:38:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7466E619C5;
        Mon, 28 Jun 2021 02:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624847739;
        bh=UniMIOqQ1HFRULx67HClXwQQ5wKQSd5oQUewfCIT420=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N8SmypPriJhVU2rU4P/SBEulL7bp/gzlVwQfoWekN6HcfE6/ZkeD/zhXcl0gwoZtJ
         hkcTUvKYgzmYoXhjUo0M8Ci+pLT9pd2x/awxoyT43jp1VsyTtZ/Lohv1+SVd2g+/8f
         KBKsHFFAk/imddFCA0u9xtEEiQ0w7U6hwn05Mq6VY7AsJ9S0z1VtVVsoSYhIoGJv3F
         jOzN6tRXADT7d67q/KoW3buD2OiBRWDDzyWdefI9HV9RnKVDIrT3ijqQL7656kVI+S
         pqXgLCgtS/XBZndkD/UeR3JPZQ6+QSFRGHsYgIxfF0an55pCRBebstP4UEzwxOiWQF
         GQl4xt1eOq1CA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609022852.4151-1-jonathan@marek.ca>
References: <20210609022852.4151-1-jonathan@marek.ca>
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: fix CAL_L write in alpha_pll_fabia_prepare
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Sun, 27 Jun 2021 19:35:38 -0700
Message-ID: <162484773814.3259633.13632041860257791506@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2021-06-08 19:28:52)
> Caught this when looking at alpha-pll code. Untested but it is clear that
> this was intended to write to PLL_CAL_L_VAL and not PLL_ALPHA_VAL.
>=20
> Fixes: 691865bad627 ("clk: qcom: clk-alpha-pll: Add support for Fabia PLL=
 calibration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next

Taniya, can you please review?
