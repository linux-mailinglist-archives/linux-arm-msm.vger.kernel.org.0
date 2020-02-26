Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B63C816F455
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 01:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbgBZAcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 19:32:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728756AbgBZAcK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 19:32:10 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5521220732;
        Wed, 26 Feb 2020 00:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582677129;
        bh=7f2476RhuRsDJvRZ8jXw6wVKT4+JOhoVyU6JTHvyTFA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O96tQFM4G5bVJF1Tr+1g4/tap4SsS6/pxqs93aci2qiohA/3cTj4j+H+9fVCK1ox7
         2AmAUjC3M6VxiBEIXcbS+m6WJl/Ae3wabBAcxnto+FAVhXcluawkSAmpg7wLjotdTQ
         R8BiUqhzyuGXJBdlJbzb5CMfPIxredJ7Ld2mLYLM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582540703-6328-5-git-send-email-tdas@codeaurora.org>
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org> <1582540703-6328-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v5 4/5] dt-bindings: clock: Introduce QCOM Modem clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 25 Feb 2020 16:32:08 -0800
Message-ID: <158267712854.177367.18198679874308742176@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-24 02:38:22)
> Add device tree bindings for modem clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

I think this is typically squashed with the binding patch.
