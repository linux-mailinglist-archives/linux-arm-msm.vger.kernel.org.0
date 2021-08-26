Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925DC3F8E42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243423AbhHZSzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:55:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243300AbhHZSzZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:55:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55BFC61037;
        Thu, 26 Aug 2021 18:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630004077;
        bh=fyW/PNm/+sS5fgyydXfDRZ5DdiYow6xNkyUdeEK16Ec=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mll/iuoMgXdxjvdqVXrB5nlsJ0Xr0gGjC18zFF/w33zJTbV1u+sYRMNC+FnaWItHn
         XkrQ1Xp8lIfs3sSKjlqpzkTncc3yVCrK2HakIc5BHAzlo5jpFntBoVROuznYvfoFOB
         ptA/2rFlxW71hlNyjp46Snvb/odmbFInA+7IGPIlLWaV8ydEivTcHiRHjJjJTaVEsF
         eISUVzisY4zEMKAuZ0RoLimyCceWVcoI5Xf5QYyy8YRQjCQGMI3rEJ5LdtOgQuXvPp
         acBFp5UcNCXXlol4GNFIZhndv3BTYWRTofF3RSv+0hQ3/ChO9luwk3L9lw8HJ0wSxO
         pTRdob6bpO1Jw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Q6uB3NRxqtD8Prsmliv8ZdsTXGeviv7lb2jQ743jr1E@cp4-web-036.plabs.ch>
References: <Q6uB3NRxqtD8Prsmliv8ZdsTXGeviv7lb2jQ743jr1E@cp4-web-036.plabs.ch>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: clock: add Qualcomm MSM8953 GCC driver bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>,
        bjorn.andersson@linaro.org
Date:   Thu, 26 Aug 2021 11:54:35 -0700
Message-ID: <163000407599.1317818.2728164587461845498@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sireesh Kodali (2021-08-05 02:06:42)
> From: Vladimir Lypak <junak.pub@gmail.com>
>=20
> Add bindings and compatible to document MSM8953 GCC (Global Clock
> Controller) driver.
>=20
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---

Applied to clk-next
