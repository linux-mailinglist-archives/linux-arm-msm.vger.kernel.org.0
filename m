Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E663FA882
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 06:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbhH2ECs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 00:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:34712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhH2ECr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 00:02:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4662F60E73;
        Sun, 29 Aug 2021 04:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209716;
        bh=kOl/6rpculGxx44OGeBVdeV+awjE7NYbqmg3Z+wLyg8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i/MxbnLmf1jEhBEt7kBufsAyZmIE8HNonQejEo7u657a5w/2+en222rGW/TqRnNcP
         DSZUpdTAR7ZcSNOQxLO8t7xSt8TkKqqW49/V+4G1tY/wqAIUIzV6rJAAq6FtPKA8PB
         h6l3uYEKnijitmki7IpS1V+mRv52+8j+Lc8nak+n2BnOji/7Jv89deHTswzDIN418D
         cidswDdS9Ii9LUH2E9EZ9/eeephjXLP243/7OLZx4WumAjhbyzTIRELotAstNSM+h3
         DO0PqsBzvqJIpYdIvosHkdbTQdHHbOiwypl2SRH6tthZuj+MoSXstLBa4RMGuN5M1S
         pI3b+ZWzVBFNg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210820203243.230157-2-konrad.dybcio@somainline.org>
References: <20210820203243.230157-1-konrad.dybcio@somainline.org> <20210820203243.230157-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add RPMHCC bindings for SM6350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sat, 28 Aug 2021 21:01:55 -0700
Message-ID: <163020971516.2676726.3084174036322331293@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-20 13:32:42)
> Add bindings and update documentation for clock rpmh driver on SM6350.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
