Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76EC3193BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhBKT6z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 14:58:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:39588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231831AbhBKT6l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 14:58:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7466964E45;
        Thu, 11 Feb 2021 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073480;
        bh=/pbNpyXDb0jqpcEb3u6TTNE3eNDCccMUm7t1J9KoAow=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k5AbIwHDSXKv9Tqm0J+zMW9BDaWprHCzi1vSh5p4CRyP2nD9UbXk+al84PjdKeYBc
         sagwY8o8Te9IQuZtQ4FFz/9yZsr331iBsLeo6XszTfJ+PfZydZsyw0bJPl4FMjcgJF
         huc9v7xrhwmxXl0uKj4EXXGhd6yIjA8s+0b3nEY5y1o+guR0Kj3cnhlmwakYgnpSxG
         nuWnQIiX/5KOgXgoEiCN1k/NOWfQlLyE0Zp1iFaGyQ20J5jFoXWZHHmsUkLmZ4+g2x
         OULZyrh1dhZk9SKTuSUIz+zDw6C+ceuEdAhDRqqNKA9sXrYSxAw65Hshx/ODIFyFLu
         DFnIseLht0T3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-19-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-19-lee.jones@linaro.org>
Subject: Re: [PATCH 18/21] clk: qcom: clk-rpm: Remove a bunch of superfluous code
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:57:59 -0800
Message-ID: <161307347910.1254594.10795099538356191352@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:37)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/qcom/clk-rpm.c:453:29: warning: =E2=80=98clk_rpm_branch_ops=
=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

This has been rejected before but OK

Applied to clk-next
