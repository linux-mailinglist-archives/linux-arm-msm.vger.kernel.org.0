Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3063A33A134
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 21:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234719AbhCMU64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 15:58:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:40944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234331AbhCMU63 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 15:58:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82CA964E99;
        Sat, 13 Mar 2021 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615669108;
        bh=eOxb6i2eiQLuIs3xBLFm2d74piMq/JM2zbepFvbw4VQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O6TSXBb3zvPCtGMNuCn35Uzdu+qI6x7PuSYZ+SaibI4OpHpCMfeja1GV2xnH3wKts
         XTW+kMtdIlDK9CBntM5PGeTKrAnnWZ6dZtp6IwJ3Ua3pv6gLkHHdVel7IZf1i/4RaZ
         8s+VC95dN+4GB2izpUEpJR24OJOYQK/U7ZgLZz5NrO8ujV7zhkttfNuVHgFlFTaIy1
         Ca8BA3QCORyi2tpvkPsVKU2yKt5eYB5+zeXpn7Qlbj+/Kr6NyQXbptuhlqGBTzJaCd
         CqpZrHymQjchZXfpvK/FUU61f4odJNPnhdDEX91EmE8k5uU6363Qn9FddQOYBuVIjF
         sk0Q6OJzpQZrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615400283-20100-1-git-send-email-tdas@codeaurora.org>
References: <1615400283-20100-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: rpmh: Update the XO clock source for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Sat, 13 Mar 2021 12:58:27 -0800
Message-ID: <161566910713.1478170.4881967524115069645@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-03-10 10:18:03)
> The bi_tcxo clock source for SC7280 requires a div 4 to derive 19.2MHz
> from the xo_board. Thus update the same.
>=20
> Fixes: fff2b9a65162 ("clk: qcom: rpmh: Add support for RPMH clocks on SC7=
280")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-fixes
