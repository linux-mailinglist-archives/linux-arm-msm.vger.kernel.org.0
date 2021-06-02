Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB18C398316
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhFBHh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:37:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:56792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230228AbhFBHh2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:37:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A691D611CA;
        Wed,  2 Jun 2021 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622619345;
        bh=5UQ+DJ0svo3r/2j/YUWoXQgPgdOs0HJ2jW2CyemzSCM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z3Ylax30VvcAJ985XYCeXKZxfMw4ct9SWPRLZQ7grl0cAowotIeU8byhUbx5yPrcp
         SVXfT0TNmdFLdK+0AD0botyXQ6y87PM1EXUaZTJHK+UX92HinWMbw6IdCmANtfTU0u
         1B9wJO9I6S9bdaEXbLy4haqKPPygSu4+K0n4iTRVPoA8BsXaOb+qzKyvlaWOkeJxce
         uHyxekHmS22GDvsSbSV4ezYbmfica1Iug8rz9+zhsOSpbxNsVhyiibFuSj5I7xE6qV
         s1WsB3LzRCz4a+d01iKp5BNRs/YMTZCJcVyf3zsmXXiURvtzvlT2xWZaOGXkMJ0ycI
         JNK3zYZR0aqiQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210511041719.591969-1-bjorn.andersson@linaro.org>
References: <20210511041719.591969-1-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-sm8250: Add sc8180x support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 02 Jun 2021 00:35:44 -0700
Message-ID: <162261934436.4130789.1406264518275901514@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-05-10 21:17:18)
> The display clock controller in SC8180x is reused from SM8150, so add
> the necessary compatible and wire up the driver to enable this.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
