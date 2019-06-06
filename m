Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAB037B18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 19:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbfFFRcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 13:32:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbfFFRcc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 13:32:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C64192083D;
        Thu,  6 Jun 2019 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559842351;
        bh=6Bj6NJLiqPYiupjoKhEXTA+eM9B1Ma8fK74v78tg4IQ=;
        h=In-Reply-To:References:To:Subject:From:Cc:Date:From;
        b=Gc5mJ30rK4+KTjujOJr4Un4VN1suuSTTE/l+Gg5brBl7cMnaba3IbDkkiTAx6IN45
         VytCZ5mWi5eWL0nzGzWrOUQoVEJOp9LkltE1Mz3IzNXk40SHGJWeurDW15Gb16/m+t
         FEeeBUS4puzIk3Y8N8OvKtWsP67HYCQ9pU9SCxBU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR07MB4432BB9A401E0202C4D7D948FD070@VI1PR07MB4432.eurprd07.prod.outlook.com>
References: <VI1PR07MB4432BB9A401E0202C4D7D948FD070@VI1PR07MB4432.eurprd07.prod.outlook.com>
To:     Philippe Mazenauer <philippe.mazenauer@outlook.de>
Subject: Re: [PATCH] clk: qcom: clk-rpm: Removed unused macros/variable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Philippe Mazenauer <philippe.mazenauer@outlook.de>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 10:32:30 -0700
Message-Id: <20190606173231.C64192083D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philippe Mazenauer (2019-05-21 02:45:25)
> Removed macros DEFINE_CLK_RPM_PXO_BRANCH, DEFINE_CLK_RPM_CXO_BRANCH and
> variable 'clk_rpm_branch_ops'. The macros and variable are not used in the
> file.
>=20
> As the variable, which is used by the macros, is declared static, the
> macros can't be used outside the file, are unused.
>=20
> ../drivers/clk/qcom/clk-rpm.c:461:29: warning: =E2=80=98clk_rpm_branch_op=
s=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  static const struct clk_ops clk_rpm_branch_ops =3D {
>                              ^~~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Philippe Mazenauer <philippe.mazenauer@outlook.de>

Yeah it's dead code but the qcom folks wanted to manage the crystal with
this code so maybe we should just leave it around for them. Or they
could dig it out of the git history.

