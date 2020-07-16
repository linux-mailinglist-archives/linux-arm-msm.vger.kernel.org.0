Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF794221922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 02:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgGPAzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 20:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgGPAzN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 20:55:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13DD120658;
        Thu, 16 Jul 2020 00:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594860913;
        bh=Uy/8ESF+QLnINaje1tAvlX+l9b8wvAMN50TwncsSIbI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZkOEyqooUuO7oga3APF1nhJgYu8RN7Zyn+hujImeGqtPW6UntYiI3OBE06FKH5+PG
         SQ/4krRlKEWkFsXJ6TlCq9jdO1X/BgGDurnqyv/kTqmgke3nC+ef9wYeksYSVuEpBK
         ZGZYXh2w1TYdNZ1gIFU2S9LmqCtXTice8qzjLkWY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
References: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH 0/4] Split ipq8074 reset bindings from clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org
Date:   Wed, 15 Jul 2020 17:55:12 -0700
Message-ID: <159486091238.1987609.14897518216700398772@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-07-14 08:05:18)
> The patch series https://lwn.net/Articles/825325/ wrongly added clock
> bindings into reset bindings. This is caught by=20
> kernel test robot <lkp@intel.com> after it got merged into the clk-next
> tree.
>=20
> To avoid these kind of future mistakes it is better we split up the reset
> bindings from clock bindings.
>=20
> Since the clock patches in https://lwn.net/Articles/825325/ are applied to
> clk-next it would be better if all the changes in this series to go throu=
gh
> clk-next.

I disagree. We've put them all in the same file because they're all used
provided by the same compatible string. Please keep doing that and just
fix the number scheme if that is the problem. Also, use lore.kernel.org
for your links next time (i.e. https://lore.kernel.org/r/<message-id>)
so that we don't need to rely on lwn.net links.
