Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7AB1E33F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 02:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgE0APR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 20:15:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725969AbgE0APQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 20:15:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04F01206C3;
        Wed, 27 May 2020 00:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590538516;
        bh=zGice6jKCkqlnjdMIbO4/jRRAGT8tgSKxow3DZdlnTg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W1TH0ZIeo+CiQHQuRF+Iq0wiautB8h4BRP1s5i2iiCcgEAZZAsNROeDs23rI99i7B
         qMcvWBQQ2uaAm6v6p8JP9JShujcV/VVLISuhGnFQwr8I/g5MlGXQrWNOOSHGptvU0l
         n1ji/RSjpUHFtp4Fnszfa7FPO48a2d+tUrSzCUec=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200521052728.2141377-1-vkoul@kernel.org>
References: <20200521052728.2141377-1-vkoul@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc: Fix parent for gpll0_out_even
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Tue, 26 May 2020 17:15:15 -0700
Message-ID: <159053851521.88029.14881547817872478672@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-05-20 22:27:28)
> Documentation says that gpll0 is parent of gpll0_out_even, somehow
> driver coded that as bi_tcxo, so fix it
>=20
> Fixes: 2a1d7eb854bb ("clk: qcom: gcc: Add global clock controller driver =
for SM8150")
> Reported-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-fixes
