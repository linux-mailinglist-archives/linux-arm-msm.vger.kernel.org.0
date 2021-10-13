Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A9D42CA28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhJMTh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:37:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:32780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229664AbhJMTh0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:37:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E148C61163;
        Wed, 13 Oct 2021 19:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634153723;
        bh=Rm/Ai1yoJTuw3zJfyUVZiE5qj6NlqFqXYNJzlZIrlQ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dbL7Yv3dVFVIowcjRrBx0NOFmIDh6rqdxAs6afi+91JDytj7YpCQmdi/UrtqMh5t6
         cQV8MCAl4EuMGKxwonGj2pwQXAYHtcDsRXOCNaoLSur2JEiENhIWbScIvgWgmAwkSM
         LO4SgHCGKHODghEWYFCInEKib8EaMJWRb4q7R32JjvYG7K9D9yvvZ8VTyJrHH4H4Fd
         4+Jj5eZPbx/K93KP4kOIDiJUgJUrcJEpU0pqa3iXBPVKw2N3li+a/l9DpjG9f6Q9AR
         qCfzDxn4JLVkW99aLf4yIQI7OU8z+7qhieuVTiwVhZHbADL8/052K2OnhueYrh13HR
         Wh5iZ31b6Kriw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6c91a6ad-0ff2-a431-138a-2ec83f2bfa74@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-2-git-send-email-quic_fenglinw@quicinc.com> <163406078422.936959.12726677103787301939@swboyd.mtv.corp.google.com> <6c91a6ad-0ff2-a431-138a-2ec83f2bfa74@quicinc.com>
Subject: Re: [RESEND PATCH v1 1/9] spmi: pmic-arb: add a print in cleanup_irq
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 13 Oct 2021 12:35:21 -0700
Message-ID: <163415372158.936959.16897606198271075227@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-12 21:15:42)
>=20
> On 10/13/2021 1:46 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-09-16 23:32:56)
> >> From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
> >>
> >> The cleanup_irq() was meant to clear and mask interrupts that were
> >> left enabled in the hardware but there was no interrupt handler
> >> registered for it. Add an error print when it gets invoked.
> > Why? Don't we get the genirq spurious irq message in this scenario?
>=20
> Thanks for reviewing the change.
>=20
> No, there is no existing message printed out in this special case ( IRQ=20
> fired for not registered interrupt).

Ah I see so the irq doesn't have a flow handler? Shouldn't you call
handle_bad_irq() in this case so we get a irq descriptor print?
