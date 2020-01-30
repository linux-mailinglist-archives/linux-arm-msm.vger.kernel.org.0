Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDE914E08F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 19:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgA3SJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 13:09:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:38756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728218AbgA3SJQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 13:09:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E025D20CC7;
        Thu, 30 Jan 2020 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580407756;
        bh=b+Yfsr+qnQpqIYAQkQeI7TidveJ/L9BP9YvFsxRIRcQ=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=W25G7wX/24cDyJrSjCvtu/r8bNDUnFXI9VHKVxQ/gwANDkWCbNWVov0p8QN0lw1f/
         MqSCIDF1o6vgH5pHASjjbJMfBipcAJslUoiLwCk70Dx9pp4hvwHh4bIvGKtsIo575X
         5M6MQyUfnPXGCubZFmu9DtTPWIZB6TL0zAQQMrQo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580357923-19783-3-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org> <1580357923-19783-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: Introduce QCOM Modem clock bindings
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 10:09:15 -0800
Message-Id: <20200130180915.E025D20CC7@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-01-29 20:18:42)
> Add device tree bindings for modem clock controller for
> Qualcomm Technology Inc's SC7180 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc7180.h |  5 +++++
>  include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++

Split this into two as well.

