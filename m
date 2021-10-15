Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04D542E601
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 03:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhJOBUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 21:20:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:50342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232333AbhJOBTN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 21:19:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E6A161139;
        Fri, 15 Oct 2021 01:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634260627;
        bh=bAWHi6JZRMIq6ROtBTobOiX1JOs6XZZyOTQ1hGwZsI4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rMHf5+AmOcx89LPhXhJz3DYawKjebLQ+Co/j9AfJWfZb3ZgGebCo5cV0d1z6fh4YT
         9EK3R0MhZX8w1TablFvPoAQBjC5JojJQY/P+4vw4w+MGohgx8O8ZlaX+3nquMnq/VC
         f1wcI5A+ZKpvJoHTzWHe5phc9fdqQ6HxqxjHTbDq5zb06w3Eu+0SIrkvrdUKi4xbiM
         +chXEHc6MOwnz+r9tPbGcJ9HHZX+TNqQkmQBU06NHwYhQAgpEmdP+06ohau1na7cUJ
         4nIDuFWjh0SdvFy6cA6oDqHP8OhedanPb2U2KpdDnab+d/q8nAkr3y3ensQxr/GlEw
         zKyeMVwFBIZyw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23918853-ed37-f11f-9e1e-5f302910e320@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com> <163406051353.936959.12718174954614897750@swboyd.mtv.corp.google.com> <3bf1fbf3-e741-ef08-a4e4-b348b877d02a@quicinc.com> <163415390922.936959.12352892206436080955@swboyd.mtv.corp.google.com> <23918853-ed37-f11f-9e1e-5f302910e320@quicinc.com>
Subject: Re: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support optional
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 14 Oct 2021 18:17:05 -0700
Message-ID: <163426062521.936959.3490351816619205076@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-13 20:20:57)
>=20
> On 10/14/2021 3:38 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-10-13 01:36:54)
> >> On 10/13/2021 1:41 AM, Stephen Boyd wrote:
> >>> Quoting Fenglin Wu (2021-09-16 23:33:03)
> >>>> From: David Collins <collinsd@codeaurora.org>
> >>>>
> >>>> Make the support of PMIC peripheral interrupts optional for
> >>>> spmi-pmic-arb devices.  This is useful in situations where
> >>>> SPMI address mapping is required without the need for IRQ
> >>>> support.
> >>>>
> >>>> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >>>> ---
> >>>>    drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++----=
-------------
> >>> Is there a binding update? Can the binding be converted to YAML as we=
ll?
> >> This change doesn't add/update any dtsi properties but just checking i=
f an
> >> existing property is present to decide if IRQ support is required, so =
no
> >> binding change is needed.
> > The property is now optional in the binding. Please update the binding.
> Right, thanks for pointing it out. I forgot that part.
> I will update the binding. How about only update the interrupt properties=
 as
> optional in this series then I can come up with following patch to convert
> the binding to YAML format?

Sure. The benefit of converting it to YAML is that we can use the
checker to quickly validate the binding vs. having to read the whole
thing to understand that it's correct. Converting an existing binding to
YAML shouldn't be that hard.
