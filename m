Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23549129CE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfLXCsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:48:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:56182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbfLXCsq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:48:46 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 445A92070E;
        Tue, 24 Dec 2019 02:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577155725;
        bh=GDZHiwpYpPN2Oz81f+vptATrIiOpyVjE00BybrrHoww=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=z9nfV09MMzOEluK/WrMZxT7JKKaRJPLFpw4iOxLjRXT7xq+aF9PpQZ3fOobbEMje8
         ohoUrlCHniVm1aVt7fZgw9Lq/y9xcmK7r6cZB5oRyh3ohpc7sNu43ssFhOyKra0PbW
         RPeO3zDe0ThxiXn0obt3CgoeCLnQAKVuEfHk+3NI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191207203603.2314424-2-bjorn.andersson@linaro.org>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org> <20191207203603.2314424-2-bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:48:44 -0800
Message-Id: <20191224024845.445A92070E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-12-07 12:36:02)
> The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
> SoC. Update the definition of these clocks to allow this to be wired up
> to the appropriate clock source.
>=20
> Retain "xo" as the global named parent to make the change a nop in the
> event that DT doesn't carry the necessary clocks definition.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  6 ++--
>  drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
>  2 files changed, 32 insertions(+), 9 deletions(-)

What is this patch based on? I think I'm missing some sort of 8996 yaml
gcc binding patch.

