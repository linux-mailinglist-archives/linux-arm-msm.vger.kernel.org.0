Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64B01B3B20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 11:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgDVJXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 05:23:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:34792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgDVJXg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 05:23:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38B5020656;
        Wed, 22 Apr 2020 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587547416;
        bh=KIXbtLYXdqvFRpDylTVVouE4ecbmQXC4DLEhxDnLiqQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yRAendzY6ymm0fek+hxJrl3UcbcYiwJc1PuXqmJ2aHooL0fEGEait1WW5A3cWEWDc
         3ammBbeCxOIOzfGvy+QIl5xHKoKq/8VJtBUvjKhswRhO3cuTnTFqzFRW2pqP6wEkng
         N4gh2kXS7PF2PCr4tsLpI1VoRpWZ8h7HTBEHXuKU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200411010143.GF20625@builder.lan>
References: <1586566362-21450-1-git-send-email-wcheng@codeaurora.org> <1586566362-21450-2-git-send-email-wcheng@codeaurora.org> <20200411010143.GF20625@builder.lan>
Subject: Re: [PATCH v4 1/2] clk: qcom: gcc: Add USB3 PIPE clock and GDSC for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vinod.koul@linaro.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Date:   Wed, 22 Apr 2020 02:23:35 -0700
Message-ID: <158754741540.132238.1839211437225696725@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-04-10 18:01:43)
> On Fri 10 Apr 17:52 PDT 2020, Wesley Cheng wrote:
>=20
> > This adds the USB3 PIPE clock and GDSC structures, so
> > that the USB driver can vote for these resources to be
> > enabled/disabled when required.  Both are needed for SS
> > and HS USB paths to operate properly.  The GDSC will
> > allow the USB system to be brought out of reset, while
> > the PIPE clock is needed for data transactions between
> > the PHY and controller.
> >=20
> > Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>=20
>=20
> Stephen, let me know when you take this patch and I'll take the dts one.
>=20

Looks like I already applied it and it's merged in Linus' tree.
