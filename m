Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CA33578DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDHAQf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229747AbhDHAQe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6102961178;
        Thu,  8 Apr 2021 00:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840984;
        bh=s2bZShW45vp6KjIde1UXvlcJ91pbHgp0NuVbXCQGp8Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uyxst1hdSrh1qt4ZsAAGfmrxKWe3W3yqhskanx5EYwGyZu+NYs7+OZaLVgUxA8dCc
         KyE5TmNEppg0a2u9o27DwLZJW3fXKqMLEBXtpR61iAWy1eVpSdTp+wiyIfLuFpADxK
         Y9sg8AVKQHS0tHm16xx0MLMdpj2r2HT5A+CMMl3o5j6LICrG5DMHdibNqmv/mSw8s/
         jSssvl2aM5imeLZKJIWyQTxfn4zJxPJJuBe9usws2Wpfngj8JPziGReJhWendn5iED
         8Im3mDDn83OJwFZOTrSLqn4BHt2/koxqAm6QjZeiSSuKC957rbmf1b0j07Wguqdmup
         KpMAnoSJN7H7Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-18-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-18-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 17/33] clk: qcom: dispcc-sc7180: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:23 -0700
Message-ID: <161784098318.3790633.4781415847549769486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:27)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
