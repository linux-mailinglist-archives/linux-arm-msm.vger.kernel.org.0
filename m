Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5381151FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgBDRtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:49:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:45780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727423AbgBDRtA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:49:00 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45A5420674;
        Tue,  4 Feb 2020 17:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580838540;
        bh=6W3bDlS4IQR73nS252AyazeaNCd5bbSZZftHEMy97Ok=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=qEaB9kCMLB0/WbjHDkTSI9s4lV0fuUXW3qt0H5g6k1QZRokqYEqo9BFvRXFVSssbN
         ACN/J1cuORkNn0hAF3IfP74kwiFOTzvfD5ZDHNehJAo9CXLAbJYELtFfB5lXOt3FmM
         BXPgZAA+CCA2oH66gC3R+s/6oIZW/VbS7oju/+OE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203103049.v4.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
Subject: Re: [PATCH v4 11/15] dt-bindings: clock: Cleanup qcom,videocc bindings for sdm845/sc7180
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
Date:   Tue, 04 Feb 2020 09:48:59 -0800
Message-Id: <20200204174900.45A5420674@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-02-03 10:31:44)
> This makes the qcom,videocc bindings match the recent changes to the
> dispcc and gpucc.
>=20
> 1. Switched to using "bi_tcxo" instead of "xo".
>=20
> 2. Adds a description for the XO clock.  Not terribly important but
>    nice if it cleanly matches its cousins.
>=20
> 3. Updates the example to use the symbolic name for the RPMH clock and
>    also show that the real devices are currently using 2 address cells
>    / size cells and fixes the spacing on the closing brace.
>=20
> 4. Split into 2 files.  In this case they could probably share one
>    file, but let's be consistent.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v4:
> - Added Rob's review tag.

I don't see it. I guess I should add it?

