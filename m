Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2662FD813
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 19:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733030AbhATSRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 13:17:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391876AbhATSN4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 13:13:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAEAE233FC;
        Wed, 20 Jan 2021 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611166395;
        bh=GkIGC0eYFqTOa1KlwKlvqCvxCPd0d/Y25LhcGHqFRYk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FK2+cIg3U0xtOVrEC+v2eqL9wZVARGbQVXLBmmxjDqRbVl5W11yUAJNRwyKNZEbY0
         jlYqS4NKaZNYeKIbQ6xjsTbGJHVDHkRK/1DKkJGWXNnmcDiNvK0R+2jmDCaqzjNogG
         uOeKItO+ZG+dMNwwdlNcAIhCS/OwlOah4lNB2oGH4Ath9LOuNN8lOA27nQ0dEUURSo
         PxxE4viUdYakpsuUQsCGqJHjR6fgnrK5/jZoR6CosnJ+878VOXPzjDFcFzTs/3OT/i
         ATn7gNHrjGaQ6y1x8rYk5N9yZg2fbm+wgq3vO2uFiGLsKwTq/aZieVyp3lCzS/7Nef
         Ed9P8juEmbt8g==
From:   Will Deacon <will@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Li <Frank.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 0/4] drivers/perf: Constify static struct attribute_group
Date:   Wed, 20 Jan 2021 18:13:01 +0000
Message-Id: <161116508323.2646977.9881871665706289493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
References: <20210117212847.21319-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 17 Jan 2021 22:28:43 +0100, Rikard Falkeborn wrote:
> Thie series makes a number of static struct attribute_group const. The
> only usage of the structs is to put their address in an array of pointers
> to const struct * attribute_group. With this series applied, all but two
> static struct attribute_group in drivers/perf are const (and the two
> remaining are modified at runtime and can't be const).
> 
> Patches are independent and split based on output from get_maintainers.pl.
> I can of course split differently if that's desired.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/4] perf: qcom: Constify static struct attribute_group
      https://git.kernel.org/will/c/30b34c4833ea
[2/4] perf/imx_ddr: Constify static struct attribute_group
      https://git.kernel.org/will/c/3cb7d2da183f
[3/4] perf: hisi: Constify static struct attribute_group
      https://git.kernel.org/will/c/c2c4d5c051b2
[4/4] perf: Constify static struct attribute_group
      https://git.kernel.org/will/c/f0c140481d1b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
