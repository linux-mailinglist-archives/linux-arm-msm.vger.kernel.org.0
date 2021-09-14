Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6FA40BA9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbhINVny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:43:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:46502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235422AbhINVnt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02F9460698;
        Tue, 14 Sep 2021 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655752;
        bh=FsqhWfKCjNBE9BlgVJZMdaNFdazCOdaRH8bLFPdkMHA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=f17mIFxogaKyuS2hNH5vzqAa7rs15vCZmfEoLv15UdzhN30Oy9pDUO3m3TVJx2+m4
         F0XK1iKSLxzlvVoKZ5uMhkiAS+LJBaXuj0beZ+qf3RwjeNQc/OdEckgOKbjaCnno6/
         ZX6nUJ8u1zJvaU3H+mHxiZ4LXb1/i1/5QLO3lTioT/znH4pGiSFo1bDa+HPSlgmcyF
         b3hJSYKanrYQEV1CYSVHbOLwK8Afn457lsvwFZAmzoCuRCDsX/juvriv5nGny5/f84
         40XLC4sI9qDkr9ZYUGPY6Sn/3R9b6RSV2M6yjzSWWk9mFt76zG4qKTlWwyF5h+V9bM
         5ZpEBqotjGrJg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-9-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-9-marijn.suijten@somainline.org>
Subject: Re: [PATCH 8/8] clk: qcom: mmcc-msm8998: Remove unnecessary fallbacks to global clocks
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
Date:   Tue, 14 Sep 2021 14:42:30 -0700
Message-ID: <163165575048.763609.13205864935821416501@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:40)
> A previous patch removes the "xo" clock from the global namespace making
> it impossible to acquire by that ".name".  The device-tree for msm8998
> currently does not include an mmcc node but the dt-bindings for this
> compatible already require all these clocks, and the patch introducing
> this node [1] also includes them.
>=20
> [1]: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210901183=
123.1087392-1-angelogioacchino.delregno@somainline.org/
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
