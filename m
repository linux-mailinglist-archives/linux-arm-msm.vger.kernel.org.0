Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51A1A187263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 19:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732313AbgCPSdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 14:33:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731967AbgCPSdS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 14:33:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E5FB20674;
        Mon, 16 Mar 2020 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584383598;
        bh=FNFTDbC711bD4zKJDCRdzhah0Z5BX1mcqlQex3BGMnQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MwC1Iwj9v+6hWSPEFBT0jJ1XSZSHjALVOrY91LV7+Cujyn0l6PoCwq/NWfQQ1NHHN
         I5Z/I+4pfDMaWfuMYHsrh+hWIiJxIL0vRtWOZQntJny3yBu2PzzuoHIwiHJ0dJhKmq
         eOK9mPpVFDB5urtCQs3fTpz3/8SBxR8o+t9taseQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c6b19bac-b018-28a0-421f-f40f85245bee@codeaurora.org>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org> <1581423236-21341-2-git-send-email-tdas@codeaurora.org> <20200303201629.GP24720@google.com> <f0529793-c51d-4baf-5217-173c552f4cbe@codeaurora.org> <20200304170939.GR24720@google.com> <158412246142.149997.5548337390525905687@swboyd.mtv.corp.google.com> <c6b19bac-b018-28a0-421f-f40f85245bee@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: dispcc: Remove support of disp_cc_mdss_rscc_ahb_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>, robh@kernel.org,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Doug Anderson <dianders@chromium.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 16 Mar 2020 11:33:17 -0700
Message-ID: <158438359728.88485.9249991203602274851@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-14 04:08:47)
> I would require you suggestion on the below.
>=20
> On 3/13/2020 11:31 PM, Stephen Boyd wrote:
> > Quoting Matthias Kaehlcke (2020-03-04 09:09:39)
> >> Hi Taniya,
> >>
> >> On Wed, Mar 04, 2020 at 09:05:20AM +0530, Taniya Das wrote:
> >>>
> >>> Hi Matthias,
> >>>
> >>> The display device node is not present and we encounter this crash, w=
ould it
> >>> be possible to add ALWAYS_ON for the MDSS GDSC and give it a try.
> >>
> >> It still crashes when ALWAYS_ON is set for the MDSS GDSC.
> >=20
> > Any updates here? I'm about to send this patch off to Linus and I'm
> > wondering if there will be a resolution besides reverting it.
> >=20
>=20
> Looks like the AHB clock needs to be left enabled till the last clocks=20
> get disabled. I need to add a new dependency o n this clock.
>=20
> Hi Stephen,
>=20
>=20
> Any way to keep this dependency using the framework  or I need to split=20
> the probes to register them independently?
>=20

Sorry, I don't understand the problem fully. This AHB clk is left on in
the bootloader? Why do we need to touch it if it's always left enabled?
Is it actually the case that the bootloader hasn't turned this clk on
and we're getting lucky having it marked here as CLK_IS_CRITICAL? Can we
force it on in driver probe and then ignore it after that?
