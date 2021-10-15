Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C4F42E596
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhJOA61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:58:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:36566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234657AbhJOA60 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:58:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A36F5610D2;
        Fri, 15 Oct 2021 00:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259380;
        bh=zUv5H7CaKkCw/xGpNqQskH4531dQs1Ff7c2JVfgFOms=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mq7++Rk5DqFE51D4AGYgfwj8XM3YCPkhjOsJqKQDN+4QxFPbKq+5u/sFSXKWdMjF8
         n5Hj5bIpX8ncVTDghxaNjXgEg0iflkcYe6IbCHk/rVPBtYqbSFBoYzZjoomEGOVvC5
         HnIasCcTmh8CyyC5wcT2+pUsx3nYNDIQUxyI1OTCmsf+V/fEg/fCqXlJgDdRPQroYU
         HitL+WYjzR6B/rs5DZuJocCdWd4Z3KqaN/iNFGQgSFXPhnjOnIV2dcGaDb3pCfpfRQ
         M0/xFrIoOd9NtjNLqyxMj5prdFnTrYmtclblhwkbuRM6G5PbGZUQB8bwKMVef0atrq
         x1fyAnGuaE8/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829154757.784699-5-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 4/8] clk: qcom: videocc-sm8250: use runtime PM for the clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 14 Oct 2021 17:56:19 -0700
Message-ID: <163425937955.1688384.10113112058573103249@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-08-29 08:47:53)
> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Use runtime PM calls to make sure that required power domain is
> powered on while we access clock controller's registers.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
