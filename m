Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52AC3DE8A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 10:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbhHCIpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 04:45:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234505AbhHCIpJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 04:45:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09D7760F8F;
        Tue,  3 Aug 2021 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627980299;
        bh=+1nVyVAj/NNgkLbpzO8reIcPIyQyBfRlkRgtI6IAXIg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=da+wPGzp2qu/HjZIMJcsL1fpvRay3yPs5kqJNEsiI8itBVaFKI4bwTM/HWqXAjIPZ
         2cYoS800nB82V/MjZfpyg+eEU64jen9/PKji97pOM61SxB1N3oJ+uYVF7hfvDPBBw7
         Cjnr/mA9vEtLIrHZS8l9EJuevXCyJb8LDpWfILoXB6dXMzQQOFS5C4d9ssO6jJevLl
         feZLq2NTPpg3sW9++PrL2zwXdbznd3DhRmMMLr4rqi503suq75kOBhHd2owPci99fu
         BL1ToKZ1WD058Zg5EMluOHfTGzKwtDwlVbcBDX/NFaVMarPO+AuIT2cz+hKhHleU7n
         MFyzosYo/WRKQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <53360f31-2b3e-f2ed-d894-538d2215d6c5@codeaurora.org>
References: <20210728180209.14764-1-collinsd@codeaurora.org> <162771961962.714452.2347964437306072737@swboyd.mtv.corp.google.com> <53360f31-2b3e-f2ed-d894-538d2215d6c5@codeaurora.org>
Subject: Re: [RESEND PATCH] spmi: spmi-pmic-arb: fix irq_set_type race condition
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
To:     David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Date:   Tue, 03 Aug 2021 01:44:57 -0700
Message-ID: <162798029780.3896750.11640439486576896470@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting David Collins (2021-08-02 18:37:46)
> On 7/31/21 1:20 AM, Stephen Boyd wrote:
> >=20
> > Could we have a qpnpint_spmi_set_bit/clear_bit() API that takes the bit
> > we want to touch as an argument and then does it all under the originial
> > pmic_arb->lock? Then we don't need a different lock, we can avoid that
> > drop the lock under the else if condition above, and the area for the
> > lock will be contained within the set/clear function instead of here.
>=20
> pmic_arb->lock is currently used tightly around the code in the SPMI bus =

> callback functions which write to SPMI PMIC arbiter registers to trigger =

> an SPMI transaction, poll in a loop to wait for completion, and read any =

> command results.  Each of these uses correspond to a command defined in=20
> the MIPI SPMI spec.  There is no read-modify-write command in the spec.
>=20
> Thus, implementing qpnpint_spmi_set_bit/clear_bit() functions would=20
> require an approach like one of these:
>=20
> 1. Removing the locking from pmic_arb_read_cmd() and pmic_arb_write_cmd()=
,=20
> defining new wrapper functions around them to just contain the locking,=20
> and adding a read-modify-write wrapper function that locks and calls both=
=20
> pmic_arb_read_cmd() and pmic_arb_write_cmd().
>=20
> 2. Or, create a new function that duplicates the contents of both=20
> pmic_arb_read_cmd() and pmic_arb_write_cmd(), allowing it to issue two=20
> SPMI bus commands with pmic_arb->lock held.
>=20
> Option #1 seems like it would result in less clear and messy code than is=
=20
> currently present.  It would also have a minor performance impact during =

> simultaneous SPMI requests due to non-contentious checks, address look-up=
s=20
> and command formatting unnecessarily waiting for lock acquisition.

Sorry I don't get it. Does pmic_arb_read_cmd() no longer do any locking
after this change? I was thinking there would be=20

	pmic_arb_read_cmd_unlocked()

	pmic_arb_read_cmd()
	 take lock
	 pmic_arb_read_cmd_unlocked()
	 release lock

        pmic_arb_write_cmd_unlocked()

	pmic_arb_write_cmd()
	 take lock
	 pmic_arb_write_cmd_unlocked()
	 release lock

	pmic_arb_read_modify_write()
	 take lock
	 pmic_arb_read_cmd_unlocked()
	 do bit twiddle
	 pmic_arb_write_cmd_unlocked()
	 release lock

but if the formatting is intensive then it could also be extracted to
another function

	pmic_arb_fmt_read_cmd()

	pmic_arb_read_cmd_unlocked()

	pmic_arb_read_cmd()
	 pmic_arb_fmt_read_cmd()
	 take lock
	 pmic_arb_read_cmd_unlocked()
	 release lock

	pmic_arb_fmt_write_cmd()

        pmic_arb_write_cmd_unlocked()

	pmic_arb_write_cmd()
	 pmic_arb_fmt_write_cmd()
	 take lock
	 pmic_arb_write_cmd_unlocked()
	 release lock

	pmic_arb_read_modify_write()
	 r =3D pmic_arb_fmt_read_cmd()
	 w =3D pmic_arb_fmt_write_cmd()
	 take lock
	 pmic_arb_read_cmd_unlocked(r)
	 r &=3D w
	 pmic_arb_write_cmd_unlocked(w)
	 release lock

>=20
> Option #2 would likely be less messy than option #1; however, it results =

> in duplication of low-level code which is undesirable.
>=20
> I prefer the approach used in this patch as it doesn't disrupt the=20
> architecture of the SPMI bus and PMIC IRQ functions.  However, I'm willin=
g=20
> to switch to your suggestion if you think it is a better design and=20
> cleaner/clearer solution.  Please let me know your thoughts.  Would you=20
> want option #1, #2, or something else?
>=20

It would probably become a huge patch which isn't great, but it would
focus the critical section to the thing that actually matters. This is
irq code so maybe we should write it in a way that keeps the spinlock as
tight as possible. It looks like the current spinlock is placed tightly
for this purpose, but then we use function pointers to format the
message and wait, which isn't good for straight line code.
