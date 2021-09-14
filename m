Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16DA40BA91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhINVnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:43:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:46246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235358AbhINVnd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1517610A6;
        Tue, 14 Sep 2021 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655736;
        bh=+tL2aGlR1kpLb/4xwiOzDoK7SfE+KAlAy6Mfpvi6+W0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a10BKNLtuie2mtZK+aiwfP6HLwurwvkvaoNzyIvigEZ+DhG4WUtAbQEHjqZf/jRqT
         8fgF+FVahpt+C3+2izO5+DSsWh0yVoQirJumL9/xbQ6Kk2B8tn9ND1No0/frd68q/C
         7f/jMjEzbsX6Yw1o4WQkyBmEozDFZJxwMh6KfGQcBo3/B5jOlypBvZNImXu/HV/KfF
         UF9SbNi3CIHDasZTEZtFTsaFXseOV8ZIqNIpeWCwnK5PHcer6pKt/hKIbO9UkYog48
         TP6cJ4lUUnV1+ciaKSemdRABof5ILMg5deFG+/ZXr5CNLpbnHVIeIG7jnc0aegpvNI
         MmSAujaE4Rkcw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-6-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-6-marijn.suijten@somainline.org>
Subject: Re: [PATCH 5/8] clk: qcom: mmcc-msm8998: Use ARRAY_SIZE for num_parents
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
Date:   Tue, 14 Sep 2021 14:42:14 -0700
Message-ID: <163165573480.763609.8696056697316620357@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:37)
> Where possible, use ARRAY_SIZE to determine the number of parents in
> clk_parent_data, instead of hardcoding it.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
