Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D7A3578EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbhDHARj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:17:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 493A861028;
        Thu,  8 Apr 2021 00:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841049;
        bh=AtBUS552Qg0bJ1Uy/ZQxBn7Z0V2ymxVZxNgLmGC12wc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VVm8nyARMPKE6w3NQWDqpLwfDGXTw0fBeqp4ECpjMx2w/fWLW2RdzjAwPrGNBJFE6
         wvItTRNPLmeM6K0oSdnpmD0tDGO5wLulvUKKpB144E2ZMhOg3BFZd6uf7HEru2Lg9k
         z8QqjF0HLATrGgTVjtz07liy7t7Og9vcWs1S2bwf1GbVZbaZ57nK0N+jq65mvImLZP
         uiZ77nIUAb6dwTwvsbfO3zFQHI6jEDd8O78rKGp0o6o25dzOG5K2fLS69q0+gN0UEF
         qC2v6HqhB3o1lUI8tvDXBme9fs9cdb3Sh9QHXebW4JsUc0MWMry99oJiXtWTOtcfRr
         qPSjcKFCfoy9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-28-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-28-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 27/33] clk: qcom: videocc-sm8150: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:28 -0700
Message-ID: <161784104802.3790633.7766190921570227576@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:37)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
