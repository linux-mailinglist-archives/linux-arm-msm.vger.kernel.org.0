Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28DA3578FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDHASX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:18:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:43048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhDHASW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:18:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20CA7601FC;
        Thu,  8 Apr 2021 00:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841092;
        bh=xRl0YeoJEvUtbntTd6rM+TxjfLXnsdhmrpCuksWhgY0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oJXbodCbvF5SZMxvU6SO0ZE7hLswUWpLTsY8/j7ZnesR725tq4uAZFjdoI4HmYcfh
         jGP7Ce8dKGgjQxHitCFm22y81KsmOsrmJM5jqtj5VdXmNJyJcBCjH1jlBZt1fjkrpR
         BuVCKrCD7KyuX0xZnQ6GDeJAQW7lU/eOd7YFI1rSNa/Fll+QJKJXy7YODq06s4LRDB
         QMK2qlYC/S1eGTzTsCVAl0pX7+L9tRUEFaXGdi2cCsThl2F593H21gJAt6qAuk5NLo
         zK3JyiKFBMGG8QnWxvdUmfopiHTkbHfFU30Et2r47Pj0UpkQNDpZ9VQjSJW2kRElYs
         keGUYT9pb1zdg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-34-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-34-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 33/33] clk: qcom: gcc-sm8350: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:18:11 -0700
Message-ID: <161784109101.3790633.16674764292961239372@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:43)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
