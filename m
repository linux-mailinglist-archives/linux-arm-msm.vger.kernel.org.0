Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F21642CA2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhJMTjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:39:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231445AbhJMTjp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:39:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3542661165;
        Wed, 13 Oct 2021 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634153862;
        bh=0Eoa20pU9LbCvuzy0K7AXul5Cj8bvVdYRnglU2Z6SPE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ag3yLurO7K/1W1klTU4dR/kwQjG3hWY8pxarCxSKVWnTRiUpyu6WiS2q5NUfYztSt
         Q4ZaURl/RE7EViSEAcTuyrFlAJm3aj/L+J3UXuTPzrq4W/uVnzxI+s0bk/++3Fik5e
         d8wPgsWml+1BLKk7B5ENoGz1nlqPFwVU5s+qm5Pavf9ILTGn8sGHB5KNGxdZTUyxZD
         4jnCYcfGgpCSxKHsgSD9bHUULgrnoSVxZD4CnVdVyTYyHT5FgLxpg93wefTCp4uGZ7
         RnwBPXsv0oNNbulk0rkZS/ucVvgsWoqZix7NibBxtLMrxTS8XCnNoQUmOJaNSgqPTB
         ngMzQHHpmMutg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9aa28adc-288c-7be9-c989-ffdc6f859fcb@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-8-git-send-email-quic_fenglinw@quicinc.com> <163406056577.936959.16157334001404276084@swboyd.mtv.corp.google.com> <9aa28adc-288c-7be9-c989-ffdc6f859fcb@quicinc.com>
Subject: Re: [RESEND PATCH v1 7/9] spmi: pmic-arb: support updating interrupt type flags
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        Yimin Peng <yiminp@codeaurora.org>, tglx@linutronix.de,
        maz@kernel.org
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 13 Oct 2021 12:37:40 -0700
Message-ID: <163415386095.936959.16722730558107515093@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-12 23:27:22)
> copy IRQCHIP driver maintainers as requested in another patch.
>=20
> On 10/13/2021 1:42 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-09-16 23:33:02)
> >> From: Yimin Peng <yiminp@codeaurora.org>
> >>
> >> Have the qpnpint_irq_set_type function clear unwanted high/low
> >> trigger bits when updating the interrupt flags.
> > Why?
> There was a requirement to update the PMIC module interrupt type=20
> dynamically
> (such as from low level trigger to high level trigger), hence it's requir=
ed
> to clear the unnecessary trigger type when setting it.

Can you clearly describe the problem in the commit text? Is this a bug
fix?

> >> Signed-off-by: Yimin Peng <yiminp@codeaurora.org>
> >> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> >> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >> ---
> > Does this need a Fixes tag?
> Maybe no need to a Fixes tag because this is part of the initial code when
> interrupt handling is added?

Was it always broken? Or trigger types haven't been changing at runtime
because most users are requesting irqs and forgetting about it? Are you
using gpio-keys or something like that now? Adding a Fixes tag doesn't
hurt.
