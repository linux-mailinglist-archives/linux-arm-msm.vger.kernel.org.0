Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDF1280737
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 20:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgJASvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 14:51:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:39168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729047AbgJASvM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 14:51:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9583320882;
        Thu,  1 Oct 2020 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601578271;
        bh=v1fQHu7qwliGOnNWTNConojv/IvzPORHTszjE+Q+PFc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jzlBRf1DaUTx1mvCpoM2/Ko4zqz3+e6ns6IoPib/SPuU68Rz3JrV1KEJo9eKokXeS
         9DbbNPFJxJmBQZcV4qm+DpNAXWCaWmxltzY3i0PZttVidWlyoPQ2FLgu6fAdYycvvs
         ASxm6tQ20C/jLHYQewgXf1t2IRuxG+Ng04QKXH6w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201001174326.GT6715@sirena.org.uk>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org> <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com> <20201001174326.GT6715@sirena.org.uk>
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Mark Brown <broonie@kernel.org>
Date:   Thu, 01 Oct 2020 11:51:10 -0700
Message-ID: <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mark Brown (2020-10-01 10:43:26)
> On Wed, Sep 30, 2020 at 05:07:20PM -0700, Stephen Boyd wrote:
> > Quoting David Collins (2020-09-22 15:04:18)
>=20
> > > This helps to disambiguate SPMI device regmaps from I2C ones
> > > at /sys/kernel/debug/regmap since I2C devices use a very
> > > similar naming scheme: 0-0000.
>=20
> > Can regmap debugfs prepend the bus name on the node made in debugfs?
> > Does it do that already?
>=20
> It doesn't do that.  I have to say that given the use of dev_name() in
> logging it does feel like it'd be useful to have distinct names for
> grepping if we're running into collisions, IIRC the reason I went with
> dev_name() was that it's a commonly used human readable handle for
> diagnostic infrastrucuture so it makes it easier to follow things around.

To me the dev_name() usage seems fine. Maybe David has some real reason
to change this though?

In general I don't think userspace cares what the SPMI device name is,
i.e. the device name isn't used for dev nodes because SPMI doesn't
support ioctls or read/write APIs on the bus. That could be a nice
feature addition though, to support something like i2c-dev.

Changing it so that regmap debugfs is less likely to collide looks
weird. It doesn't actually collide anyway, so it seems like we're adding
spmi prefix to make it easier to find in debugfs?
