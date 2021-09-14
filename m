Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D8C40BA96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbhINVnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:43:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235419AbhINVnj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E1F5610A6;
        Tue, 14 Sep 2021 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655741;
        bh=8y2BG2aIr7zFI+M/lnZnbf0dz7WDNG2pW2oXryB0KZM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W0YjAabow9DOcHlmodMTYan5OPfCtpbHsoPc1UFLsfNtULeXvBS0X7k2YBbXawzGm
         RQwQrGAW9Fnp2Z7DvrQ7640SE3sFGCsfHJAWIgBHrVrZR5H5w9UWofa9JVNEXXzrM3
         a/j1b95WSRAsfmiy+PpfHWL8iDtbh7TzHg5nn4l50FiVxJ82BOzccf7VNJirrHgZfV
         RcEvNgDmacB4Gb7ixiAMZMEwJkrP+s3WU+P8lWCkNVg9yHMhvW48VVvleQq0k05+fw
         0FuxzS3yEwyaQPxvzJruKJZmHXc82Ritk/pCIdDpuJkLaedspWBd8Pyc9w7ylpUG+x
         Dseq4pvhkLBmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-7-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-7-marijn.suijten@somainline.org>
Subject: Re: [PATCH 6/8] dt-bindings: clocks: qcom,gcc-msm8998: Reflect actually referenced clks
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
Date:   Tue, 14 Sep 2021 14:42:19 -0700
Message-ID: <163165573965.763609.15380482747512129592@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:38)
> Some of these clocks are not referenced by the driver at all whereas
> aud_ref_clk and core_bi_pll_test_se are but were missing from the
> bindings.  These clocks are optional (and not currently provided
> anywhere) while "xo" and "sleep_clk" are mandatory.
>=20
> Note that none of these clocks were used beforehand as the driver
> referenced them by their global name.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
