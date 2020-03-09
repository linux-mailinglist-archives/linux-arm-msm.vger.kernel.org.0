Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 277D617EAE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 22:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgCIVKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 17:10:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgCIVKz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 17:10:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D84DF2146E;
        Mon,  9 Mar 2020 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583788255;
        bh=yU68s5HuqYhNTYUkzjC1U86mJUMTG72xWa99BdXa1bY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZiHtmQcjssp3eqcwno/Z5O1qOGfIC18fPg9z1OUcICEZI42NWDZ6K1K5BWNv+P1uM
         USxqOOwfqAdf8EDqwM8vqAoxXEWc6UQFXWyXUQsDR8/im7LeR09i+cT5LHc9fwoy4S
         EkSQNZCoVaFh0602XoLwEmox69k44dEIyZshMPNk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200215021232.1149-1-mdtipton@codeaurora.org>
References: <20200215021232.1149-1-mdtipton@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Wait for completion when enabling clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>
To:     Mike Tipton <mdtipton@codeaurora.org>, tdas@codeaurora.org
Date:   Mon, 09 Mar 2020 14:10:54 -0700
Message-ID: <158378825407.66766.14135857856613969751@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mike Tipton (2020-02-14 18:12:32)
> The current implementation always uses rpmh_write_async, which doesn't
> wait for completion. That's fine for disable requests since there's no
> immediate need for the clocks and they can be disabled in the
> background. However, for enable requests we need to ensure the clocks
> are actually enabled before returning to the client. Otherwise, clients
> can end up accessing their HW before the necessary clocks are enabled,
> which can lead to bus errors.
>=20
> Use the synchronous version of this API (rpmh_write) for enable requests
> in the active set to ensure completion.
>=20
> Completion isn't required for sleep/wake sets, since they don't take
> effect until after we enter sleep. All rpmh requests are automatically
> flushed prior to entering sleep.
>=20
> Fixes: 9c7e47025a6b ("clk: qcom: clk-rpmh: Add QCOM RPMh clock driver")
> Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> ---

Applied to clk-next but I squashed in some changes to make it easier for
me to read.
