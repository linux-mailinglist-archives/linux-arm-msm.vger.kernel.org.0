Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9244D40BA87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhINVnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235130AbhINVnR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D55260F46;
        Tue, 14 Sep 2021 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655719;
        bh=meXteCITR8XYuUFsHymRKFm4shPpGfIoRYV8xFZlC4k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jWNvvS2I6cF+EzzxAn64GkqgixKL2X6Ea+3Co7WlJUng204tK6HhBgNp3RoxmwSCq
         Ijkrur/pgiFscSxPGMsnl7NBn2zfdFuCfjRO1TO0+I4PfOPdTXEVIcsCtZi+nijOBl
         gl+sBha9PZt4jXZSqsqZlyodnIDnWTGD0EWcFVGCoC8in1jk/NvhnuhSjEAFLc0L4x
         WyKKolv2CYbTjHzcyTozyiYNT2ab7pPLQxpIUnza9Vf7G3wwfedz5qwxCfu95Woznj
         s1Tn33EGF8GdJkxehSxdf2iubv4XZ/mX6SoAmKsGp/B8lL4LJNc+BzEn2WZjbvGZtj
         P+CmzWKZVmGRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-3-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-3-marijn.suijten@somainline.org>
Subject: Re: [PATCH 2/8] clk: qcom: gcc-msm8998: Use parent_data/hws for internal clock relations
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
Date:   Tue, 14 Sep 2021 14:41:57 -0700
Message-ID: <163165571792.763609.6180391994406597824@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:34)
> Use parent_data and parent_hws to specify internal relations using
> pointers instead of names, and use .fw_name to retrieve external clocks
> from clock-names in the DT rather than the global clock tree.
>=20
> Note that this change relies on the "xo" and "sleep_clk" clocks to be
> provided in DT, as per the relevant qcom,gcc-mnsm8998.yaml dt-bindings.
> These clocks have been added in a prior patch [1].
>=20
> [1]: https://lore.kernel.org/linux-arm-msm/20210911120101.248476-1-marijn=
.suijten@somainline.org/
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
