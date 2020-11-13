Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D4B2B25C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 21:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgKMUrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 15:47:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgKMUrb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 15:47:31 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A035322201;
        Fri, 13 Nov 2020 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605300450;
        bh=KyYKKuCDi914eekx5v4ivIQhbpWk66jwAE1LvyvG5BM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NAsu94trQsKQix21RmHn7GCF4JBy2J3pF7c00KYYPB5ciopT+bMQKDV7BdXoldyRM
         vDVDhZR84a23Ebfw788rYF2xkkwiRnyFcxsY7yLDGmgznC/UfrrP//YXQ9Iog7zES/
         WwT9jThJAraREI+zsHb6LSpcKWuufuaFeDXnvtWw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aacfd03835b7d1b3b6c21665b44000fe7242e535.1601360391.git.mchehab+huawei@kernel.org>
References: <cover.1601360391.git.mchehab+huawei@kernel.org> <aacfd03835b7d1b3b6c21665b44000fe7242e535.1601360391.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 1/2] spmi: get rid of a warning when built with W=1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 13 Nov 2020 12:47:29 -0800
Message-ID: <160530044928.3428466.4619952889415621763@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-09-28 23:22:12)
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
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Applied. Thanks!
