Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD162281A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 19:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgJBRsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 13:48:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:51344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBRsf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 13:48:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88A5920758;
        Fri,  2 Oct 2020 17:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601660914;
        bh=CzKOeFawjuGPDhKj3RI2NcBnNWsVd2Mxj93dT6NuZMs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zlKsQAtjSxJA6MQEJD1FLtzWRuTd7DfBki21bDohcdcJDiaXtFZJvQJAmHrDxgx9v
         advxZIfQ6HOv6g+saqEGqh4Ec3ndWz8HOCCmF23wdEFDs8GHxrjdzFXsubQNYRxHuR
         gEFWsG4ps0oAnY6VmrQG/09+aII7HpmXkk+YEQwY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201002160324.GE5527@sirena.org.uk>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org> <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com> <20201001174326.GT6715@sirena.org.uk> <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com> <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org> <20201002160324.GE5527@sirena.org.uk>
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     David Collins <collinsd@codeaurora.org>,
        Mark Brown <broonie@kernel.org>
Date:   Fri, 02 Oct 2020 10:48:32 -0700
Message-ID: <160166091282.310579.8553391053258607173@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mark Brown (2020-10-02 09:03:24)
> On Thu, Oct 01, 2020 at 05:45:00PM -0700, David Collins wrote:
>=20
> > The SPMI regmap debugfs files are used extensively for testing and debug
> > purposes internally at Qualcomm and by our customers.  It would be help=
ful
> > if the more verbose naming scheme were accepted upstream to avoid
> > confusion and broken test scripts.
>=20
> ...and doing this in the dev_name() should help other diagnostic users
> (like dev_printk() for example).

Don't thinks like dev_printk() prefix the bus name? See
dev_driver_string()? So I agree that having the bus name is useful, but
confused why there are testing scripts and things on top of regmap
debugfs

Put another way, why not introduce something similar to i2c-dev where
userspace can read/write registers for devices on the SPMI bus?
Otherwise I presume the test scripts inside Qualcomm are just reading
registers out of regmap?
