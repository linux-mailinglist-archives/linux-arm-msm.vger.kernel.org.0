Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E94396E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 22:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbfFGUii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 16:38:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729587AbfFGUii (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 16:38:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1361E208C3;
        Fri,  7 Jun 2019 20:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559939918;
        bh=Bv/Z57sNRBiCj/37OETmg8X34CsAqnKoIw0yu/2tidg=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=dvs7AxnoTTxM6KuVZNpZ6dVBRQFQLk4ZgRxUQ8yfTkBD1JIqhKvUe1AB0yXKJyeH7
         g3/eTCudXDV/1ezouiOt7x7TQFFiUsRNyJZ4WF8gPbUT0vIokFw8yDHkMefjPsoUq5
         ZBNPYrRkQ5eCw6nxpwQ6MYnZ9t3ZXXD5oIqAJB8o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org> <933023a0-10fd-fedf-6715-381dae174ad9@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 0/6] MSM8998 Multimedia Clock Controller
Cc:     david.brown@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 13:38:37 -0700
Message-Id: <20190607203838.1361E208C3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-05-21 07:52:28)
> On 5/21/2019 8:44 AM, Jeffrey Hugo wrote:
> > The multimedia clock controller (mmcc) is the main clock controller for
> > the multimedia subsystem and is required to enable things like display =
and
> > camera.
>=20
> Stephen, I think this series is good to go, and I have display/gpu stuff =

> I'm polishing that will depend on this.  Would you kindly pickup patches =

> 1, 3, 4, and 5 for 5.3?  I can work with Bjorn to pick up patches 2 and 6.
>=20

If I apply patch 3 won't it break boot until patch 2 is also in the
tree? That seems to imply that I'll break bisection, and we have
kernelci boot testing clk-next so this will probably set off alarms
somewhere.

I thought we had some code that got removed that was going to make the
transition "seamless" in the sense that it would search the tree for an
RPM clk controller and then not add the XO fixed factor clk somehow.
See commit 54823af9cd52 ("clk: qcom: Always add factor clock for xo
clocks") for the code that we removed. So ideally we do something like
this too, but now we search for a property on the calling node to see if
the XO clk is there?

