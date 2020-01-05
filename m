Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456211306A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2020 08:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgAEHgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jan 2020 02:36:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:53280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAEHgw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jan 2020 02:36:52 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B040820866;
        Sun,  5 Jan 2020 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578209811;
        bh=JIHKMT7dMwQ23s51Qc4nXy158xD4GkUweaxCVrQQzAg=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=HwauWWuMUyjuUXLAGLrSNgywQ3fUpwskY3PMqDgKW12a0eEhX+PDi+e+2BupryIhB
         dxxv4eP3uS23xoj4pFF7+iYv16Mqk/wUYrO9CfADvIRNec2J5bi7G0WWsRG0zEd9AQ
         /B/kzjD0+gwKeHl/i8PKRo1w/olFTY8W7h7VGlGE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1574306335-29026-1-git-send-email-krzk@kernel.org>
References: <1574306335-29026-1-git-send-email-krzk@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] clk: Fix Kconfig indentation
To:     Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:36:50 -0800
Message-Id: <20200105073651.B040820866@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krzysztof Kozlowski (2019-11-20 19:18:55)
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>         $ sed -e 's/^        /\t/' -i */Kconfig
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> ---

Applied to clk-next

