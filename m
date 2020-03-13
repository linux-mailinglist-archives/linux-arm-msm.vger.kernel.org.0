Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 891E6184E44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 19:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgCMSBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 14:01:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbgCMSBD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 14:01:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F6FD20674;
        Fri, 13 Mar 2020 18:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584122462;
        bh=0Atpr6ZtF5yQD78BdGzERxlwoaiekMUryGsAon4sBCc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=He88vEq+9HRxEG4fEVgDj9kFX9XEaRGY5yIP3KzKueEJGC4wYnBfAMnAG19TNBDX5
         L2mRoHAyRvzp5Jq2dyN3l9hppcUVVTh1j2AvJhY9a6OKsLbLLghX9ocvMpcAc38c87
         CSO0YQKob5qwOqIIz+RU5E8fz3pNsSQbeOaMYIDU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200304170939.GR24720@google.com>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org> <1581423236-21341-2-git-send-email-tdas@codeaurora.org> <20200303201629.GP24720@google.com> <f0529793-c51d-4baf-5217-173c552f4cbe@codeaurora.org> <20200304170939.GR24720@google.com>
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
Date:   Fri, 13 Mar 2020 11:01:01 -0700
Message-ID: <158412246142.149997.5548337390525905687@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2020-03-04 09:09:39)
> Hi Taniya,
>=20
> On Wed, Mar 04, 2020 at 09:05:20AM +0530, Taniya Das wrote:
> >=20
> > Hi Matthias,
> >=20
> > The display device node is not present and we encounter this crash, wou=
ld it
> > be possible to add ALWAYS_ON for the MDSS GDSC and give it a try.
>=20
> It still crashes when ALWAYS_ON is set for the MDSS GDSC.

Any updates here? I'm about to send this patch off to Linus and I'm
wondering if there will be a resolution besides reverting it.
