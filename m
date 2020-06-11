Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19E81F650C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgFKJ4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:56:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:52416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726864AbgFKJ4e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:56:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02608207C3;
        Thu, 11 Jun 2020 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591869394;
        bh=OuqfhL2PTtXpH/ofIcvTInY0cd1kGN0sDs4hy5Wu5CI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jnYZtZl9pEBQKfzqHaUYKxTJ2Qv+d9orumujxLXAF7ebwn2igRO3zA3nv5Zyb/nBp
         qQ1tOIPE7XH/8wrZFEBYcm8YM6KaA/TUzhtMjP4KRh9qvjg30W/lCUBs2XCAl9LM1M
         Uityhnh6CtUUUUuUc9I74cD2BECHsTYU0Zlb1zJ4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
References: <20200609120455.20458-1-harigovi@codeaurora.org>
Subject: Re: [v3] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org, sam@ravnborg.org
To:     Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Thu, 11 Jun 2020 02:56:33 -0700
Message-ID: <159186939329.242598.2996575539576077899@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Harigovindan P (2020-06-09 05:04:55)
> ti-sn65dsi86 bridge is enumerated as a runtime device. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend will not be called
> and it kept the bridge regulators and gpios ON which resulted
> in platform not entering into XO shutdown.
>=20
> Add changes to force suspend on the runtime device during pm sleep.
>=20
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
