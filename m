Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A221B1E70DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 01:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437818AbgE1XyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 19:54:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437677AbgE1XyC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 19:54:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE043206E2;
        Thu, 28 May 2020 23:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590710041;
        bh=gXZYavOYVxcImwq5BLCVSLLMCyz5KZa/MjCXgWwsFOg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HhmXX5C1cr60i/bHtezec2SbWBEAMbgIl0+g1A/6CxNW1brrD/Qn83sKWrbJkIy1j
         IHx3KVvhiNtqev7GHE6EsK9J8siUq8b7mM84GO485huQNfYLWK/dnysYCLVdgD8C3D
         4Nh5WOdEZ0vyAuzT+bTSJC0eRPRdE91jEnjz7cIY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200528142205.44003-1-jeffrey.l.hugo@gmail.com>
References: <20200528142205.44003-1-jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] clk: qcom: Add missing msm8998 ufs_unipro_core_clk_src
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Thu, 28 May 2020 16:54:01 -0700
Message-ID: <159071004112.69627.18281821446546395989@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2020-05-28 07:22:05)
> ufs_unipro_core_clk_src is required to allow UFS to clock scale for power
> savings.
>=20
> Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) d=
river")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next
