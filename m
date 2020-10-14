Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C111228D7FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbgJNBap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:30:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727526AbgJNBap (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:30:45 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 738F421D7B;
        Wed, 14 Oct 2020 01:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602639044;
        bh=6ldcTD2dVo9Oxtap7YTxK1vGCtbpMDNnAIqqPT/OHyY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vWgxRedPUj7pd5LhHOeTIO2fyGbXe4cMbCyFoxhYRzA3WQRW9aECspTAOWQTPpWZ0
         9aEye/iI7QIlt6YK40YCcGP9rUl18nHrR488/ce+YiAkz5RI6nQ59RzWxLvMqnT/uh
         NC9WrOkFQ35ZWcQ9T8upvIdNwbBsd7yeVjSNY+/Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200927190653.13876-2-jonathan@marek.ca>
References: <20200927190653.13876-1-jonathan@marek.ca> <20200927190653.13876-2-jonathan@marek.ca>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add QCOM SM8150 and SM8250 display clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:30:43 -0700
Message-ID: <160263904313.310579.14461318911339724174@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-27 12:06:50)
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM8150 and SM8250 SoCs.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
> ---

Applied to clk-next
