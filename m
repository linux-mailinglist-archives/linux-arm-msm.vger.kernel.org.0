Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D1AFF71E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 02:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfKQB3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 20:29:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:45222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbfKQB3m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 20:29:42 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0419F2075E;
        Sun, 17 Nov 2019 01:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573954182;
        bh=VzNM7mKIbzruoB4g8aBQDy+zckMzp5W6fs0DAz7WWAk=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=ggHD7FX4Mo4k8sYridHaOsXYP+LxdXkfCAKu8nGIz/CTXPsx/ybkQQIqBftd2zqo9
         JOspo/oiuju7vknDgz7m7BlOH2HKzyTEXSVNo4i4E35iOS72ZT5cGWk7I4hoxFG612
         vuQDZfWb/xZZX0h1XLZHVeHiVGd9UokrC9GMA0TI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191114185152.101059-1-robdclark@gmail.com>
References: <20191114185152.101059-1-robdclark@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: ignore NULL clocks
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 16 Nov 2019 17:29:41 -0800
Message-Id: <20191117012942.0419F2075E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2019-11-14 10:51:50)
> From: Rob Clark <robdclark@chromium.org>
>=20
> This isn't an error.  Also the clk APIs handle the NULL case, so we can
> just delete the check.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

