Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5346E274895
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgIVSud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:50:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVSuc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:50:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E7C320756;
        Tue, 22 Sep 2020 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800632;
        bh=bPY3zc0FU1wahxCU1/lLmO5A6W78jIue018MHvuhXIc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VbbhtHf611pehFpsRI+DdGuTYWCXQLuChdAiNplX2b6KAp86mOpPyuZKRjIMznara
         W63ZCI+fQfTQdnpGlcqmWdMQ+nQdDEGAf7sX2jymYcyBB2tcCdfG2bXgMYE8CTqi58
         kDASuZ4cOiIxzvjeUvcuWgqfm9Vb4alRDwpQM1bM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911013722.1459387-1-yanaijie@huawei.com>
References: <20200911013722.1459387-1-yanaijie@huawei.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8939: remove defined but not used variables
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
To:     Jason Yan <yanaijie@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 22 Sep 2020 11:50:31 -0700
Message-ID: <160080063112.310579.13658440715454159064@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jason Yan (2020-09-10 18:37:22)
> This addresses the following gcc warning with "make W=3D1":
>=20
> drivers/clk/qcom/gcc-msm8939.c:610:32: warning:
> =E2=80=98gcc_xo_gpll6_gpll0a_map=E2=80=99 defined but not used
> [-Wunused-const-variable=3D]
>  static const struct parent_map gcc_xo_gpll6_gpll0a_map[] =3D {
>                                 ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/qcom/gcc-msm8939.c:598:32: warning: =E2=80=98gcc_xo_gpll6_gpl=
l0_map=E2=80=99
> defined but not used [-Wunused-const-variable=3D]
>  static const struct parent_map gcc_xo_gpll6_gpll0_map[] =3D {
>                                 ^~~~~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---

Applied to clk-next
