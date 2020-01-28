Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D2314BFB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 19:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgA1S2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 13:28:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:56248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgA1S2B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 13:28:01 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62F4422522;
        Tue, 28 Jan 2020 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580236080;
        bh=yR9ZQkAqZBFptYZXFi0jyworPepwxJ8Tg2vkRpqRJmI=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=jrKZM23F7fyOA3kIgP5c8vHqHn3DTouwbRUeRfu8Ews9k5fDEZpcvFuRsF2VpCdhh
         Q4cfuygKGdQNCPH45mL3mTN3o+bRXzzVnp4WNuiJd3NT2X2vo2H2W10HchUd8tPevG
         /dmKAtJXh9SOE8eoA7B32O5UXLdsTG0zODv6mIHs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200124175934.3937473-1-bjorn.andersson@linaro.org>
References: <20200124175934.3937473-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: rpmh: Sort OF match table
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 28 Jan 2020 10:27:59 -0800
Message-Id: <20200128182800.62F4422522@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-01-24 09:59:34)
> sc7180 was added to the end of the match table, sort the table.
>=20
> Fixes: eee28109f871 ("clk: qcom: clk-rpmh: Add support for RPMHCC for SC7=
180")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

