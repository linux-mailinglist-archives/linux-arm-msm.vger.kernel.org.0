Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9A51E339D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 01:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbgEZXVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 19:21:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389261AbgEZXVT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 19:21:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1AE8206D5;
        Tue, 26 May 2020 23:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590535278;
        bh=B/D8/uZtiKLu2TUhAcx6w8Zxt89261ATSEoYhw3GLs8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Po7IDX1lE+FxVS7Kh5l7yoQkShihjFBhk8l8iJnSVegD8GzK3MR5ZIfPdzzZoUlR9
         k5CGbT2g1ntSIH6rlawkZPqnMwmjZnU3bjQQRsbrE6QP4tVi6dKNf6X3gsvIqxAJyZ
         Abn/mfJ2Yx8ut8Rph6Ce+wvwcHsjsJvgQP6P2jHM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200524210615.17035-2-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca> <20200524210615.17035-2-jonathan@marek.ca>
Subject: Re: [PATCH 01/10] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 26 May 2020 16:21:18 -0700
Message-ID: <159053527806.88029.14584721858766224777@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-05-24 14:06:02)
> 0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Any fixes tag?
