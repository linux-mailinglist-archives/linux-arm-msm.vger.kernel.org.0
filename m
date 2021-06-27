Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584353B55F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 01:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhF0X5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 19:57:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:32892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0X5e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 19:57:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56A89619C4;
        Sun, 27 Jun 2021 23:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838109;
        bh=TLcjBO4kzD+kBt2Dklkrp5JShqqg+GheSlWqp75DOeo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q1pb6JxciYSRtsBuVyxneHwAiunCKgEeif2wFt6q1WwFPo823utgKGxaDh4kxZKd6
         ZOIyGgBpFvcFFCsGUUqAv2oZMS9Juf0DXJK8J17lR+QYZAQaWQdvYuGEdrYJPxMUtc
         as4BitH94jmKomuiBQbs7z8rloK+uz58GtYjeCRI6bhM9IySWzehSIa1IWy+qdNsQc
         nJNWIAvDwmu+M3NPtz32pLxeFO1nmJYjE3EF/V89B5QojlWFVi3ZInjE2NM9zdF4+V
         Vx/ftqgE2OAR78er66s/oDXouAZPT6HPxU9ew55KAQI4PNvgOAt8xCS1qNzU/trIkY
         6oOWoUXGZdtJQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210605121040.282053-2-martin.botka@somainline.org>
References: <20210605121040.282053-1-martin.botka@somainline.org> <20210605121040.282053-2-martin.botka@somainline.org>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add SM6125 (TRINKET) GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>
Date:   Sun, 27 Jun 2021 16:55:08 -0700
Message-ID: <162483810820.3259633.140425242172054700@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-06-05 05:10:38)
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
>=20
> Add the clocks supported in global clock controller, which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Applied to clk-next but there are a handful of clks in here that should
be boring register writes instead of modeled as clks. Basically whenever
there is a CLK_IS_CRITICAL flag and no parent we know it could just be
enabled during probe and ignored thereafter.
