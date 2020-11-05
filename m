Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D382A7577
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387772AbgKECaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:30:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:52132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387666AbgKECav (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:30:51 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C27720739;
        Thu,  5 Nov 2020 02:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543451;
        bh=BVfR4RYw2ieyUZ3BzaoHO9nYFHJxGRjL7Cac4SJHsus=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KFVcO95mBx5TBCmmLwR1vJOE2NPfJ14xy7Zx4pjA4kX66qYOfEqIXq3CnyvcAMCeg
         248uorFpzcyHi5jCM/dZOhtEEDSzfC60O2zi1RqiLM4mrfmz1eJLYQ/mr1ok8SAnWw
         aPdLpA8DB8BbsujEu2G8SWFVeBo9tkErSMapJF2A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602873815-1677-3-git-send-email-tdas@codeaurora.org>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org> <1602873815-1677-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/4] clk: qcom: clk-alpha-pll: Add support for controlling Agera PLLs
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
Date:   Wed, 04 Nov 2020 18:30:49 -0800
Message-ID: <160454344957.3965362.16679399657547083445@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-10-16 11:43:33)
> Add programming sequence support for managing the Agera PLLs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
