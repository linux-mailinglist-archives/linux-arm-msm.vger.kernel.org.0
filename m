Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 011EA125B32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 07:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfLSGDK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 01:03:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:55194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSGDJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 01:03:09 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8E852146E;
        Thu, 19 Dec 2019 06:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735389;
        bh=AUUAsilxMGhSGWEEKPS/xoccPW8sNU2Te8RFtOx0/CI=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=RHekDF8NercHPRKiyoFq2n4NS8zv+mRd9JsxIsWsuDk+yX7EqydJgDn567vB7gyQy
         U4Q/jhyR9pbTvZvYgR6MQo+GhCy6SpdIGpuRE8FMP6mKBaOFKgTAHJOAsF8P0uX3Va
         1d+oIqqkkJPALjBhec7j6UpK4TohzohyoOaDPTpI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191217165409.4919-1-jeffrey.l.hugo@gmail.com>
References: <20191217165409.4919-1-jeffrey.l.hugo@gmail.com>
Cc:     andy.gross@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] clk: qcom: smd: Add missing bimc clock
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 22:03:08 -0800
Message-Id: <20191219060308.D8E852146E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 08:54:09)
> It turns out booting the modem is dependent on a bimc vote from Linux on
> msm8998.  To make the modem happy, add the bimc clock to rely on the
> default vote from rpmcc.  Once we have interconnect support, bimc should
> be controlled properly.
>=20
> Fixes: 6131dc81211c ("clk: qcom: smd: Add support for MSM8998 rpm clocks")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

