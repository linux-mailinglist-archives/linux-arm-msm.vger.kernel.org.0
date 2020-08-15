Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C95F2453FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Aug 2020 00:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgHOWKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Aug 2020 18:10:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729620AbgHOWKh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Aug 2020 18:10:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E79CF230FF;
        Sat, 15 Aug 2020 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597482205;
        bh=2g8PILbXwNDZdi//uyLa2W5unzVyN0PqAZ/veoyBKNk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cjG3gQvnZJX6gtZ6bGDW40pVR5vo9J5QCtN6dJjOYTiesGgNDAeJCAMGCf9rlpBsr
         RpjBkUXb365vRh7bG2XOgS4F7yY0QGL/skDBbEe2feQiCJ92Tzh/r3gyKwXt4xw3Qv
         ROwKyPd6Tu1poNlJ0aSaaf91PbMvV467VchRQ14s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b7c07d7476697145bbd685d11a57b40d222f2c50.1597235356.git.mchehab+huawei@kernel.org>
References: <b7c07d7476697145bbd685d11a57b40d222f2c50.1597235356.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH] spmi: get rid of a warning when built with W=1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Sat, 15 Aug 2020 02:03:23 -0700
Message-ID: <159748220374.2278213.18377863722109238085@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-08-12 05:29:18)
> The SPMI core complaing with this warning when built with W=3D1:
>=20
>         drivers/spmi/spmi.c: In function =E2=80=98spmi_controller_remove=
=E2=80=99:
>         drivers/spmi/spmi.c:548:6: warning: variable =E2=80=98dummy=E2=80=
=99 set but not used [-Wunused-but-set-variable]
>           548 |  int dummy;
>               |      ^~~~~
>=20
> As the dummy var isn't needed, remove it.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
