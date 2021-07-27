Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B280D3D7DB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhG0SbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:31:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:34080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229593AbhG0SbD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:31:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD5DA60E08;
        Tue, 27 Jul 2021 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627410662;
        bh=APLtPhVPrplvweEN8D0BeBpWv3i66EvGiF2G81lV2CQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G0RGxi8RZ0px/ZbKNTMNd0MgOjJRJV5FgeyFTm1hkBtSOtS5WVTy55Y2A06fQho9l
         ohHXAK33Qd4JM0iqq2CeJZtx5RaP62Id5OzoiXRjvZnCYdpnYvcPTrsQu9PAiPwnPe
         w89PLvs3KpWO/hi2O7sskxoiOKx6JQD7TVcti1tHXADcphKsmU8UlHCz6yUi18rIeO
         IFVnqihdOooMyfbqkbOlUqsE2udGO93YA5yAyoeqviLjaz/A5CeYYg69S6lGOVSA3i
         C7PzHrUHpeYelLK7YzotpeZmmIhAe5Ray+QHBRb3wN2/LdyhJnMASwU3QF/5woJgfu
         oC3ao2XrcEutQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210721224610.3035258-1-bjorn.andersson@linaro.org>
References: <20210721224610.3035258-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-sm8250: Add additional parent clocks for DP
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 27 Jul 2021 11:31:01 -0700
Message-ID: <162741066149.2368309.9294368400080752080@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 15:46:10)
> The clock controller has two additional clock source pairs, in order to
> support more than a single DisplayPort PHY. List these, so it's possible
> to describe them all.
>=20
> Also drop the unnecessary freq_tbl for the link clock sources, to allow
> these parents to be used.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
