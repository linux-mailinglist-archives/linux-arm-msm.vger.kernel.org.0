Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB47B3D03A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 23:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235104AbhGTU2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 16:28:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233642AbhGTUWH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43D196108B;
        Tue, 20 Jul 2021 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814965;
        bh=WyLspQ2KJuAx6HwfIg9h0ZW+O+516qDOaUuHKdQEKag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oL8z2Js6NHsnBPfEQzD+E1rX3b8WoQSh0pkIc3JZBqUvq6TG+0QLUi4Kxg70tWENO
         Oeq7HUpI4ebTes9v74aZeQcXKST4FhlIFX3wYe5RdQOGbTrU9OqmL6se4ofNmXyUko
         vRf1bYbdhZc1ugRvQSxZzaDqEGrRWy+DbxgOYX3ExU6MUHAia7hfYNNfpiYKX0pFth
         sAdEwiFKmxSiKxJZ11zM8sJjuAg5/KjGl6uZ/jxhTP3MJbWsM4i51YbRANjyckjTpi
         xueedGLjCWGPvlUiYTIcZjVIsWM5xp/CaUNtDv85tO5OQPNfnSd60KdKTsb24N9juG
         FPBEKB12QVgRw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-4-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/7] clk: qcom: Add display clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:02:44 -0700
Message-ID: <162681496420.2679160.15418956767648062693@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:19)
> Add support for the display clock controller found on SC7280
> based devices. This would allow display drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
