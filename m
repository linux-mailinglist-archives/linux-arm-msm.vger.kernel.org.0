Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042E0CABE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 19:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731821AbfJCQBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 12:01:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731812AbfJCQBb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 12:01:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A19B222D0;
        Thu,  3 Oct 2019 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570118490;
        bh=ttiPKL2jzgASsca2BGk27wEdRl5hmkMpvPvhdH5dU9o=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=PR8idfJjm1O7W4H7sSBvf60VNidTUzimxOuz/YuQxqeTR9ZLI8hhm1xAxkHqKYzBE
         0G1fEJ36nFEaqWXzC3bt6NufrBH2MfEFd7DxV3tE//Vt9O6a/R0BzQzj8bgifWaiby
         VFLCRE6KfsZchQdSn6X9Wz5mmkvAPOi7kjrRhCLE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org> <20190918095018.17979-4-tdas@codeaurora.org> <20190918213946.DC03521924@mail.kernel.org> <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org> <20190924231223.9012C207FD@mail.kernel.org> <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org> <20190925130346.42E0820640@mail.kernel.org> <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org> <20191001143825.CD3212054F@mail.kernel.org> <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 09:01:29 -0700
Message-Id: <20191003160130.5A19B222D0@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-03 03:31:15)
> Hi Stephen,
>=20
> On 10/1/2019 8:08 PM, Stephen Boyd wrote:
> >=20
> > Why do you want to keep them critical and registered? I'm suggesting
> > that any clk that is marked critical and doesn't have a parent should
> > instead become a register write in probe to turn the clk on.
> >=20
> Sure, let me do a one-time enable from probe for the clocks which=20
> doesn't have a parent.
> But I would now have to educate the clients of these clocks to remove=20
> using them.
>=20

If anyone is using these clks we can return NULL from the provider for
the specifier so that we indicate there isn't support for them in the
kernel. At least I hope that code path still works given all the recent
changes to clk_get().

