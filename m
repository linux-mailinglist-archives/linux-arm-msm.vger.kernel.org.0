Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8652C6CB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 21:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732570AbgK0UjF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 15:39:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:43734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731306AbgK0Uhj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 15:37:39 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2E1221D91;
        Fri, 27 Nov 2020 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606509458;
        bh=YWsjHyrke271+U3EUzV3UKVyqGIdKW7svcx7JBOPE8A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mC6g11kuuGnEKqMW2xSTV1gGlikn0ELuBruMaEQszHL0T59b0QyOQFgr0sP6xChj4
         lktJmbYXY0I4qv2LVvAwmetU5xezaoCLQhMPOsjqPa7CRfrtgpMGB3MpLPGFaCeL0B
         pz3bZ6sftlIKgPcoSIUabeclru6tetqAPTRZlyXo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126232400.15011-1-colin.king@canonical.com>
References: <20201126232400.15011-1-colin.king@canonical.com>
Subject: Re: [PATCH] clk: qcom: Kconfig: Fix spelling mistake "dyanmic" -> "dynamic"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Colin King <colin.king@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Fri, 27 Nov 2020 12:37:37 -0800
Message-ID: <160650945731.2717324.4437128541458338825@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Colin King (2020-11-26 15:24:00)
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in the Kconfig help text. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
