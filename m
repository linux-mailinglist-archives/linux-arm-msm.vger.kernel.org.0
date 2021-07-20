Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13333D03A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 23:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235411AbhGTU21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 16:28:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235182AbhGTUWT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A597B61106;
        Tue, 20 Jul 2021 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814976;
        bh=+qPsvwEoZp2BNJcREskcKt3Exf7ZZp/7DFw0WkpI6Ao=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZYd5UiCtVlm8fDAj0M746uWA2r7f783u63G6a6bR6yYN2ywZ87vqJnqYEZTTxWvt6
         /8H3F43inUulKIKrafMh3Hjo7a83MnAkpNP/QkKwEKlXBquSzNfZk8Tv9+m44fctZx
         VRqtqbPkkYLljdp3JVN7lSzB4p1n37jm+D6Zathh0FCD1TyL0W9WHs4JinRW6LtL20
         0E3j6o0p+qNqI+g2819ewNK7Y8eN+T6P87OfsN+3bWabMIJZXyk1dpnVOFFjeJFuM7
         g2SknWrOThX7aBtEtca0zaXoPp6K3k45Laf6Wy5q4l1bzpIrMFly/cH/2/ECuVDqFh
         6yzvo391K5KFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-6-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-6-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 5/7] clk: qcom: Add graphics clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:02:55 -0700
Message-ID: <162681497553.2679160.2770896296788296388@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:21)
> Add support for the graphics clock controller found on SC7280
> based devices. This would allow graphics drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
