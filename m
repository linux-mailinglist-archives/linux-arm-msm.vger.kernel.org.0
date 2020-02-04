Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C83151647
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 08:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgBDHNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 02:13:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:54826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgBDHNt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 02:13:49 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A0662087E;
        Tue,  4 Feb 2020 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580800429;
        bh=4dteibOy4ES6giaiq+d9lMelNb1ecIhbNtrvVUt9phU=;
        h=In-Reply-To:References:To:Subject:From:Date:From;
        b=glybLJx9lH02+WiQlAdl448gEU8QXDYmvsCr/Bv6WqIJW9IJq70tAltfj1ejH4yQA
         T+GeYYb1SuA/ECzWFQ4bRCd2HIvoKybRb4Vk9eu2d9/qBCBj1LEokOU7ClcY0EarhM
         PCvcm1/nSCo3V+lO+ydJWEKX1bjm0xpdZqeked8Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-6-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-6-git-send-email-vnkgutta@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
Subject: Re: [PATCH v2 5/7] dt-bindings: clock: Add SM8250 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 23:13:48 -0800
Message-Id: <20200204071349.0A0662087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:25)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> Add device tree bindings for global clock controller on SM8250 SoCs.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml        |   1 +

Please rebase this atop Doug's clk series and specify the parents and
binding file for the binding. I'd prefer that we make a new file in the
bindings directory for this SoC.

>  include/dt-bindings/clock/qcom,gcc-sm8250.h        | 271 +++++++++++++++=
++++++
>  2 files changed, 272 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h
>=20
