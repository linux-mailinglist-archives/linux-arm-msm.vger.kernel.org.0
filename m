Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008BA2D68BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 21:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393043AbgLJUbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 15:31:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:45640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729218AbgLJUbu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 15:31:50 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607632270;
        bh=neyYw2v0Dwl8zpDQNxu6wIKY1IUGGkwSGxgZEak9TsI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=niqTu22wHpwm0CiSHWAkAGxsVwNAONwVpARR+Ar5sfBYT6arz5tQrj3SJdZhIvH0w
         9eco4ZDLrycsR1AQQVXazbhhzi/ktQzBq45c+6foTTUjsOFFwVBTqsI3A78FlAbF23
         melREm4GA2m6MQb21XfKi7BAJdCGWxnQMDtIeugwJE2MTj0cVJRqQudo8y6ohb/bZG
         Ix9nPd2xc2RL8qZ+sJozK7q5/wMlUDwWV1AXv355/zn6mp0uc/7Myzfpz6kMlsBobM
         TK7qtPkt1qgQeGwg1C/yhIA0wnyoV6iVVfUn34JkzWvaAIt6pNcQSPYNWYkwo1pLtT
         yM8dUcSq/qVQQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210061159.GM8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org> <20201208064702.3654324-4-vkoul@kernel.org> <20201210040116.GA1639067@robh.at.kernel.org> <20201210061159.GM8403@vkoul-mobl>
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add SM8350 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
Date:   Thu, 10 Dec 2020 12:31:08 -0800
Message-ID: <160763226856.1580929.7399412663078488395@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2020-12-09 22:11:59)
> On 09-12-20, 22:01, Rob Herring wrote:
> > On Tue, Dec 08, 2020 at 12:17:00PM +0530, Vinod Koul wrote:
>=20
> > > +required:
> > > +  - compatible
> > > +  - clocks
> > > +  - clock-names
> > > +  - reg
> > > +  - '#clock-cells'
> > > +  - '#reset-cells'
> >=20
> > You may or may not have power domains?
>=20
> I have not added them in the driver yet, so I dont think it made sense
> to add them when they are not present. For basic stuff it is not
> required but eventually yes, so I plan to update binding and driver at
> that time
>=20

They should still be required in the binding though if the hardware has
power domains. It's not like the hardware doesn't have power domains
already or can gain that ability after the fact. The driver should deal
with it when it is ready.
