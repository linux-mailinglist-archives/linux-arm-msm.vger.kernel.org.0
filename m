Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81CBE13067C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2020 08:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgAEHQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jan 2020 02:16:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAEHQU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jan 2020 02:16:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04B872085B;
        Sun,  5 Jan 2020 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578208580;
        bh=IcMgc84dm+TL+mNfCGFUnF3P4H21ROobsV1M/6/Pz7o=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=vtvtCaZLe4xxLIgfnm6V0RYnP2CEqMWzXKLX7HOzwpppkmGp8EybwFwe+PofUMDK0
         eQhDTWIsRwkjhHbnI5StAJmyt5x/aHolozktulYQBqb8NIq1NbJXIrG2gTpbwgLsD3
         3PFercCtS17QAAooqD2py7HOzrkvnqg/xdl/yZjk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200103111429.1347-1-nks@flawful.org>
References: <20200103111429.1347-1-nks@flawful.org>
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
To:     Niklas Cassel <nks@flawful.org>, bjorn.andersson@linaro.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:16:19 -0800
Message-Id: <20200105071620.04B872085B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2020-01-03 03:14:29)
> From: Niklas Cassel <niklas.cassel@linaro.org>
>=20
> Allow accessing the parent clock names required for the driver operation
> by using the device tree 'clock-names' property, while falling back to
> the previous method of using names in the global name space.
>=20
> This permits extending the driver to other platforms without having to
> modify its source code.
>=20
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---

Applied to clk-next

