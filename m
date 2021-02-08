Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFAE313CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbhBHSJK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:09:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233656AbhBHSH3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:07:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F94264DE1;
        Mon,  8 Feb 2021 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807609;
        bh=R1komXlcPF7ha7tKgLmntFye98ITuiAlI+zDnvHXX6A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N3olxjDQrXXtu7RrfNVUdLaKTyJqLPbBQAsncp4dV8yFadfjc4ikAzfThPUbn/odg
         +FjVTptlWjYiGo0xNcc/lz/gRjL74O+ivKcxT8Lz66mhCK+MjX2etYP12ju5hcUshM
         IwC6kfEw3+UJvb8SR0q2PCGQmGFvf34Q6vN3+Am8uas87iv1FdiwDYczqNOF9bkPrQ
         FZ7ixn5PKq1BCjbUo0VCdz1bpbqWf3mHz9LLbFvTZoT+ib1nvnzoBegE7m1jBa33ND
         /A5GeW7wS5M2Av4DjshNWcmcp25U7m14lcg/WhwBfzXl6t9l9mesYIuLSNZQ8JgKg8
         /w2Gr1nXT4cYQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210127070811.152690-3-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org> <20210127070811.152690-3-vkoul@kernel.org>
Subject: Re: [PATCH v5 2/5] clk: qcom: clk-alpha-pll: modularize alpha_pll_trion_set_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Date:   Mon, 08 Feb 2021 10:06:47 -0800
Message-ID: <161280760796.76967.10407966724625892917@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2021-01-26 23:08:08)
> Trion 5LPE set rate uses code similar to alpha_pll_trion_set_rate() but
> with different registers. Modularize these by moving out latch and latch
> ack bits so that we can reuse the function.
>=20
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somai=
nline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
