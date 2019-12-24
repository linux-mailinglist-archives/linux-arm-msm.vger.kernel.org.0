Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E9C129CB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfLXCZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:25:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:50422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbfLXCZo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:25:44 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E8E720715;
        Tue, 24 Dec 2019 02:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577154344;
        bh=fwgEOqEKqUN1gmORoJ+h6ZCvYr7GvefuodBgvF3ZFXE=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=09YDF169oSLrSvh2J998gduaYFV2GaOm6fxSH1qseeKcd6oLey9V3aRfE9IzTvRxN
         0ocqavfWFa0d7JAt/SzhaXVXks7c1OaAwgfGO6H4OoIoFt33PNXdcOoWhQ1YXaxLSM
         B3yAzugriU6o7YQbiweaOm/aR3HtUDv7pmyVA4DU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191217164913.4783-1-jeffrey.l.hugo@gmail.com>
References: <20191217164913.4783-1-jeffrey.l.hugo@gmail.com>
Cc:     andy.gross@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
Subject: Re: [PATCH] clk: qcom: Add missing msm8998 gcc_bimc_gfx_clk
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:25:43 -0800
Message-Id: <20191224022544.1E8E720715@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 08:49:13)
> gcc_bimc_gfx_clk is a required clock for booting the GPU and GPU SMMU.
>=20
> Fixes: 4807c71cc688 (arm64: dts: Add msm8998 SoC and MTP board support)
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

