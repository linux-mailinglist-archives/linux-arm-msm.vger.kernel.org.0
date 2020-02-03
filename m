Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BAD151049
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 20:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgBCTa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 14:30:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:49644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgBCTa2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 14:30:28 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62BD22080D;
        Mon,  3 Feb 2020 19:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580758227;
        bh=WVrpNgtBccJgAHQHMCNpXyIN6qHMg2zVEYuX/XdefVk=;
        h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
        b=wisaRaXZFT+CEDtwX5h85ZtfRRuqJZhOBPZdgRda43E1RlwiiAqJLZkXaDX3KCpEX
         le14VV4STuAHkGKaVNNW0HNWkVQ3WIy7OhsR//Y3F8HIo/S7nhfHE2YA7SULiNVtI6
         5V/V1Z2HkgyvGwHVmrizKcJzVTRfBWuBJ0XaaGm8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 00/15] clk: qcom: Fix parenting for dispcc/gpucc/videocc
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 11:30:26 -0800
Message-Id: <20200203193027.62BD22080D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:33)
>=20
>  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 --------------
>  ...om,dispcc.yaml =3D> qcom,msm8998-gpucc.yaml} | 33 +++----
>  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
>  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 ++++++++++++++
>  .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 ++++++++++++
>  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
>  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 ++++++++++++++
>  ...,videocc.yaml =3D> qcom,sdm845-videocc.yaml} | 27 ++---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 47 +++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 28 +++++-

I don't want to take patches touching dts/qcom/. These aren't necessary
to merge right now, correct? Or at least, they can go via arm-soc tree?

