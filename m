Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2362442E5BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 03:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhJOBLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 21:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229959AbhJOBLP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 21:11:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 714B261151;
        Fri, 15 Oct 2021 01:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634260149;
        bh=uaXn3JKlF05+Pmbri7MsfGeSTJ54qAS8sIzvWSpWuIg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qK/vGXxWIhKUf6XX7T/sdBDJi38bcz8JSWELHJf3twIa9JPdUWsSgJdWIZYvqiHuS
         KgZ2kZzJd8Av99/8l3rgaK/dJ3JqfBa261U7Hprd35zISYM/+pdebVFmYvcYdBfB/L
         2jaS4jYtEZKzvkviE2TVMK9H7Ip3DzQjTAcvv1mL015Bmkbv5S75ZNuQnMw/tpdhZx
         CzLGXp+jyGEd18KB+E+Q6ynjpB1YcpxjmQnyB84+fVF1+3wNOX+5FTglxEI7wwnKBM
         aCIvA3NkHbea2hDNy6l+B+/e2vEVKTgs80pGUJF8TqdpZes27VtjCHy7ZPmw4sUGh1
         +Ik3XVCDgCesw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e94d4b54-316e-220e-aaec-f60311c37745@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-2-git-send-email-quic_fenglinw@quicinc.com> <163406078422.936959.12726677103787301939@swboyd.mtv.corp.google.com> <6c91a6ad-0ff2-a431-138a-2ec83f2bfa74@quicinc.com> <163415372158.936959.16897606198271075227@swboyd.mtv.corp.google.com> <e94d4b54-316e-220e-aaec-f60311c37745@quicinc.com>
Subject: Re: [RESEND PATCH v1 1/9] spmi: pmic-arb: add a print in cleanup_irq
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 14 Oct 2021 18:09:07 -0700
Message-ID: <163426014715.936959.6136985763712059359@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-13 19:26:55)
>=20
> On 10/14/2021 3:35 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-10-12 21:15:42)
> >> On 10/13/2021 1:46 AM, Stephen Boyd wrote:
> >>> Quoting Fenglin Wu (2021-09-16 23:32:56)
> >>>> From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
> >>>>
> >>>> The cleanup_irq() was meant to clear and mask interrupts that were
> >>>> left enabled in the hardware but there was no interrupt handler
> >>>> registered for it. Add an error print when it gets invoked.
> >>> Why? Don't we get the genirq spurious irq message in this scenario?
> >> Thanks for reviewing the change.
> >>
> >> No, there is no existing message printed out in this special case ( IRQ
> >> fired for not registered interrupt).
> > Ah I see so the irq doesn't have a flow handler? Shouldn't you call
> > handle_bad_irq() in this case so we get a irq descriptor print?
> In such case, the irq number is not valid and there won't be a valid
> irq_desc, hence it's not possible to call handle_bad_irq() here.

I mean handle_bad_irq() on the irqdesc for the spmi pmic arb chained
irq. Because things are not good with the chained irq.
