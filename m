Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABEDEAD6BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 12:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390662AbfIIKYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 06:24:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:37078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390666AbfIIKXz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 06:23:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D60252089F;
        Mon,  9 Sep 2019 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568024635;
        bh=2jCJ6TCwq8ndkCRG9kmQ8X3v6V+F6KyzHbWORjfVyn4=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=abStC8WeL+iX4NzjRaV4qpsecDY44Bzj6YWEZDDSkFsVmTU9DKK6WkeRlEkta+KKn
         Oldpe1peXGTO0ZYUL8/DZ9wNowc1PhxWFd0WvZ7OOGn5bQLzkPQxWDderO/8MNfecm
         wYMNslD6X5EwPvRzlqg3WLQEv/H3++nTugmP22vI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:23:54 -0700
Message-Id: <20190909102354.D60252089F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:07)
> @@ -61,6 +63,16 @@ static int qcom_apcs_msm8916_clk_probe(struct platform=
_device *pdev)
>         if (!a53cc)
>                 return -ENOMEM;
> =20
> +       /* legacy bindings only defined the pll parent clock (index =3D 0=
) with no

Another nitpick: This is wrong multi-line comment style. SHould be a
bare /* on this line.

> +        * name; when both of the parents are specified in the bindings, =
the
> +        * pll is the second one (index =3D 1).
> +        */
