Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58C1313CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhBHSJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:09:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:50030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235311AbhBHSHm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:07:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C45964E7D;
        Mon,  8 Feb 2021 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807622;
        bh=jp5QIr5tVDXE3kDYV3EQunKatyI6fOmtRJ9zEG5vSfs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F1lCCpuOMerQisu3IHZkS9nDYkDmlQtYAw4tQch4SN+fw5WDozBOrnvoUGz+agjhU
         FMpMn5zP4RQ9m6zg4Kuvmsr3FC6rIfQFO2gFkLnRitwyu45kF7Fc2DtWbWCxdwmVHS
         J2RKdaKnGsI5Wgquk76V8ZjeY0yL4FFApR7/gchV3I9yVfv3HFfNTP9RDS05f08AlK
         EM8gAbLDPFr7+ByEonc+ulAQVvEm2XgGG57NCWLl12KBtZ9tWCITKJA0/YdYO00I1y
         0l5L6+0LSJ/kWcYVyYVk+8MreKWQG5lHQ0pNUjKPC3Adk/0tsqlIveYlWqQMU+tQ4Z
         JHAOzO37Rfoiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210127070811.152690-5-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org> <20210127070811.152690-5-vkoul@kernel.org>
Subject: Re: [PATCH v5 4/5] dt-bindings: clock: Add SM8350 GCC clock bindings
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
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Date:   Mon, 08 Feb 2021 10:07:01 -0800
Message-ID: <161280762110.76967.14814571475602006402@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2021-01-26 23:08:10)
> Add device tree bindings for global clock controller on SM8350 SoCs.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
