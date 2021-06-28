Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CCE3B563C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhF1ASp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:18:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231750AbhF1ASo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:18:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 412B661A2B;
        Mon, 28 Jun 2021 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624839379;
        bh=/0G2PuHl+IAQAIu1YGgX7SlAUJuV99Syf2dy8Lq2IpE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ou9ulDUt2MX25/21PRUP7qqp3gPLX1wtbmxKFmmoWUWzr6pMPqHjIvR/ONEEuduKE
         g4X0m8dwlWYp06v7BbI0PNdo7vi8WdOldhqL0G8Od7s20hdTsOTtz8ea6CrjQB1j+p
         pAVTPMP3UriRBFLs7cwHGfaNaOLRAvBAaMbZVo+fc0UtekNImHyRlMGRg303Zs8042
         NHTZ6SemB/xCZeMD650q86v5ZxGPQ/sAWSKIivMM0CN8Q4T9q5wKUrbqh7ToqW7Tzr
         gtnIJW7UY5OTTpYTFR2cJ30XL3VIWYi2WIW30TO2DmF6Ki09XoDGU17Zdh8nDxpwUy
         +2VOKRND90nvQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609022051.2171-2-jonathan@marek.ca>
References: <20210609022051.2171-1-jonathan@marek.ca> <20210609022051.2171-2-jonathan@marek.ca>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: add support for zonda pll
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:16:17 -0700
Message-ID: <162483937796.3259633.18251974331290202893@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2021-06-08 19:20:46)
> Ported over from the downstream driver. Will be used by SM8250 CAMCC.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
