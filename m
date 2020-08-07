Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609F123F484
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 23:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgHGVoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 17:44:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgHGVoX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 17:44:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA76D2086A;
        Fri,  7 Aug 2020 21:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596836663;
        bh=RvRidD0gBRnyhL+PINbEd1JlEJ7BuJCSlC1D0xNCzUQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UaJb2DmSREBOT9PFmRI69xnpXJbZI83YIit1bT1pKZllKG7QVow6OkuWPDpJ7BDd+
         8S6wsRnda2be7ZKVN1L/9SFHalpsqf6JmbQkin0OUpyBeI3sfoDxMRs7axfq5ckrIp
         w0jS+qWJfWPLWN2jt/z20H+FTcr+8DLyuhBAqDkY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <159191561875.242598.18326727418245335996@swboyd.mtv.corp.google.com>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org> <1591885683-29514-2-git-send-email-sanm@codeaurora.org> <159191561875.242598.18326727418245335996@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc: Add genpd active wakeup flag for sc7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Fri, 07 Aug 2020 14:44:21 -0700
Message-ID: <159683666176.1360974.5500366475077976771@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2020-06-11 15:46:58)
> Quoting Sandeep Maheswaram (2020-06-11 07:28:02)
> > From: Taniya Das <tdas@codeaurora.org>
> >=20
> > The USB client requires the usb30_prim gdsc to be kept active for
> > certain use cases, thus add the GENPD_FLAG_ACTIVE_WAKEUP flag.
>=20
> Can you please describe more of what this is for? Once sentence doesn't
> tell me much at all. I guess that sometimes we want to wakeup from USB
> and so the usb gdsc should be marked as "maybe keep on for wakeups" with
> the GENPD_FLAG_ACTIVE_WAKEUP flag if the USB controller is wakeup
> enabled?
>=20
> >=20
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
>=20
> Add a Fixes: tag too? And I assume we need to do this for all USB gdscs
> on various SoCs and maybe other GDSCs like PCIe. Any plans to fix those
> GDSCs?
>=20

Any update here?
