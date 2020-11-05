Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86A62A7575
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732642AbgKECap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:30:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:52004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbgKECap (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:30:45 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C58CA20739;
        Thu,  5 Nov 2020 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543444;
        bh=KSOf3i+uY0g4gijKmOoKwH/3mMh5Z4dnDVdi0t0vKIY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UEpP8NVjx8cwtXIDHY90TrRSQ1klzjkHYDtQN1N/Nnp0CXacsUKdTPYlxRO09bU99
         irOZ2wMDiclKbCtCwHmilahkUKRdbjV4odQ1oW3TsDltmhf790eG6qBpAKNwOZoNBi
         IV3nZv9sELr9eaOaTWogsGVxxjrSDW/+kuzKkm6c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602873815-1677-2-git-send-email-tdas@codeaurora.org>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org> <1602873815-1677-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: Add support for helper functions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 04 Nov 2020 18:30:43 -0800
Message-ID: <160454344332.3965362.7942837051954309816@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-10-16 11:43:32)
> Introduce clk_alpha_pll_write_config and alpha_pll_check_rate_margin
> helper functions to be across PLL configure functions and PLL set rate
> functions.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
