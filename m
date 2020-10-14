Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA9C28D7FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbgJNBaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:30:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:43124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727526AbgJNBaw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:30:52 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3185E21D7B;
        Wed, 14 Oct 2020 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602639052;
        bh=oOG+JR723p9ICnlNfy4OmnQH4GXF1lchlYRg7/w2eyI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=v3CmduKVHJNYnnzNWCqHa/L5oWZqg6Wty8O87oZw/gNwHu5HMhkyZIJwRETxXWMOq
         8/2Dc10ssDj5IqhgJaR8GMfCYKcNwhnrR93NojvXxAGI9QtMvGRQ7ckLBVzg55tLVb
         mOu63B3ny0VIX7LVfcNsgaZzYvDkz1fDuqv7c2to=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200927190653.13876-3-jonathan@marek.ca>
References: <20200927190653.13876-1-jonathan@marek.ca> <20200927190653.13876-3-jonathan@marek.ca>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add display clock controller driver for SM8150 and SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:30:51 -0700
Message-ID: <160263905104.310579.4493346832420624229@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-27 12:06:51)
> Add support for the display clock controller found on SM8150 and SM8250.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
> ---

Applied to clk-next
