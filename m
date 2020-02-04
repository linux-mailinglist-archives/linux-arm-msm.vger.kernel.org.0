Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74176151FED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbgBDRsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:48:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:45182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbgBDRsL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:48:11 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19A4E20674;
        Tue,  4 Feb 2020 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580838490;
        bh=dH+92hEZ1Qej/U06U3vmxCHfc/1tLOhBk1VR+cNDJCg=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=Oa2hWJiH42dP+ByE5+prltjX3KOgWBLrMBxGEFhF93YwXF0bom7BXi6iDqYDv/ErH
         yb6TWmhaqODwA7k0E1itOfOxcMn12UdQgzom8Uh3U2mloZ5mA1rVueCcNJ6ne2P6L/
         l7SmcsOjj019eCexVQ8THl2deONdk5IQub8dDxO8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203103049.v4.7.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.7.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
Subject: Re: [PATCH v4 07/15] dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 04 Feb 2020 09:48:09 -0800
Message-Id: <20200204174810.19A4E20674@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:40)
> The qcom,gpucc bindings had a few problems with them:
>=20
> 1. When things were converted to yaml the name of the "gpll0 main"
>    clock got changed from "gpll0" to "gpll0_main".  Change it back for
>    msm8998.
>=20
> 2. Apparently there is a push not to use purist aliases for clocks but
>    instead to just use the internal Qualcomm names.  For sdm845 and
>    sc7180 (where the drivers haven't already been changed) move in
>    this direction.
>=20
> Things were also getting complicated harder to deal with by jamming
> several SoCs into one file.  Splitting simplifies things.
>=20
> Fixes: 5c6f3a36b913 ("dt-bindings: clock: Add YAML schemas for the QCOM G=
PUCC clock bindings")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next

