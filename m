Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B8E3B55F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 01:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhF0X4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 19:56:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0X4f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 19:56:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1590619C4;
        Sun, 27 Jun 2021 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838051;
        bh=IOn3iHgDjgZ/kdQLn+m9AeAqUY81RhpOmvka5mirtUg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tlPE26+BvitNu7ceXhUniJ+4YVwiyg1VyEaBlkr4+tK2zH0RQvAVnlIAa7WhQ3sZR
         Coq0xbd8zel4IAkuQRZ3YHWrfiSyszaocjOTkOb2BnQYgCIB0gssx6azz4Y0yAt2ww
         5mgngRVigEyS6ryTfYhMtHNYOngaEIiaaWQ9rPjJGGuWj3bn5pufPPzTtt3lCTj7Ud
         NSveH86muvrl8CK0Is60vZpjHw1SGtj2fXDdodL4U/buEaCeWjffZ8iYxX1+1SzAaJ
         lUQmaVgVCRq3r5/Vvbx542iXxQocvN9j5VjS/VBhPN8xVFhO0juyo7uv3yty86uWpv
         L7UdJfGPw1xTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210605121040.282053-1-martin.botka@somainline.org>
References: <20210605121040.282053-1-martin.botka@somainline.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document SM6125 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>
Date:   Sun, 27 Jun 2021 16:54:09 -0700
Message-ID: <162483804969.3259633.12130694864125127567@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-06-05 05:10:37)
> Document the newly added SM6125 GCC driver.
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Applied to clk-next
