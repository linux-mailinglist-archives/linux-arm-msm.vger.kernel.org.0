Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CAC40BA78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhINVkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:40:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232891AbhINVkx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:40:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71BA360EE9;
        Tue, 14 Sep 2021 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655575;
        bh=U7AHWLUBc2e/0RhiGmIslCORXsbNWKrjSGkQwA2f8Ko=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j5AUnUyWPUd1rmvIkoF6KbyBZsLLYk1oBSUVR/u/l8NFLrv/qN45pU4kx7pczmMtQ
         LgyDNcvlbwfGG58VKLExf8oYf/MtS6H9EjZA1J7Hjgr7DbiVJ3NQZdq6kuyIANEX/y
         FANrrmOxppXmmBpgUfdMyeV8wn0nulE9YvWv6ZERZ03rIxHfW7qFnjY/8CdZ3x43rw
         V4DcNMU8B4NZnRaju1cXrjp+IM0eWRVT6pF7jsSPNUcfzaSYJUpzdTmLALPZYNoCKl
         2YqTwFnWwoGzivJdsee/l9zZz2LHTTiTIlfbkxogl1vZFzeXEIG3GibeWzE+ehVAe5
         3pCODdNQ/dZoA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210907084851.4050-1-caihuoqing@baidu.com>
References: <20210907084851.4050-1-caihuoqing@baidu.com>
Subject: Re: [PATCH] clk: qcom: common: Make use of the helper function devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     caihuoqing@baidu.com
Date:   Tue, 14 Sep 2021 14:39:34 -0700
Message-ID: <163165557428.763609.6016761960137886434@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Cai Huoqing (2021-09-07 01:48:50)
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---

Applied to clk-next
