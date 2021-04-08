Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE6B3578D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhDHAQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:16:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E146061028;
        Thu,  8 Apr 2021 00:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840957;
        bh=J4+Jt+g3qLzid86sEuEEPs5ZvLU8pZRNEhrMQx12jzQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pwa5KquS6zzK3P9+r5W+U7G9BX9faZm1y75fuP1uJgazfW6kHoNvcG1qUJkQAw5sR
         CIvk1p8o4ZW8iKaw4wo8dBEONWYfukPzJGd8fdET7Bp+tZOspKhDbOjGecWb0Z/1qm
         BakTApQMrLLS1bo5OdTfO2YsQNui2qEeGVjZe93jrO5rHyDKSZO4CI63AWWDGVqwzv
         CVCmAWiMM+7yrXN1q7nzdlIzxhDSIUJH7lTiBP6kKH0I1egP+jka3NAbq/08H3PNW9
         exwp9h1ccEYwHwIGhXdgFKolnjvC1rBBNlZVpj4DFfkV2E5sRfA9WjHTszwqOjcwjx
         F/pS1dZg23MyA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-14-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-14-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 13/33] clk: qcom: videocc-sdm845: convert to parent data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:55 -0700
Message-ID: <161784095574.3790633.12673398515713425704@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:23)
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
