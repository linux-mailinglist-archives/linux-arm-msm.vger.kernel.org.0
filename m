Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C922D125AC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbfLSF2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:28:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:45174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfLSF2g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:28:36 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A51BC222C2;
        Thu, 19 Dec 2019 05:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576733315;
        bh=MpoQxHyyLbRJPfu30dKVSWep8ADBkVL7n3FffMiyMs0=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=pGeeHcrdAq+hOu7Aov1mnNEXjXz1puMDe1+9GhAb0JTif8lsWs+JvJBeAa1WF3mpP
         Dsvq8cnsk5wckElJJUpDkLZ9D//Lm/l+17BXfMth7Fzu7omLXpirhTk0TOr6kfj0At
         YhYDzOazLGxWSvxfBsTdFzhQIILBOBllw6qz8m2c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191115123931.18919-1-masneyb@onstation.org>
References: <20191115123931.18919-1-masneyb@onstation.org>
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to rpm
From:   Stephen Boyd <sboyd@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:28:34 -0800
Message-Id: <20191219052835.A51BC222C2@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-11-15 04:39:31)
> gfx3d_clk_src for msm8974 was introduced into the MMCC by
> commit d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia
> clock controller (MMCC)") to ensure that all of the clocks for
> this platform are documented upstream. This clock actually belongs
> on the RPM. Since then, commit 685dc94b7d8f ("clk: qcom: smd-rpmcc:
> Add msm8974 clocks") was introduced, which contains the proper
> definition for gfx3d_clk_src. Let's drop the definition from the
> mmcc and register the clock with the rpm instead.
>=20
> This change was tested on a Nexus 5 (hammerhead) phone.
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---

Applied to clk-next

