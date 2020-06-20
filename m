Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5E3201F3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 02:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730928AbgFTAcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 20:32:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730901AbgFTAcA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 20:32:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9680B22AAC;
        Sat, 20 Jun 2020 00:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592613119;
        bh=7ZyYVxFMAw5CAv0Rz0Wi2Mv+LuXUkbhNIkykP/c2PRo=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=tiSLrDOomWEWFuOiC7W09V53I204u7psP0FyPjBQDIfrwk79B77nEeWrYVQqmkSQy
         m14QNwcwiA/yVfz7U6bNz7ls/lS4eVPjUvT4tBSBQTBEWHt0c0WkjJMA16wvStG5U5
         Kv5mW8K8MYu4y5icq/EF2lWBLKjIIBnM1odH3tWY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <852c7804-b1b3-2d78-00f6-b67b9fd4e720@codeaurora.org>
References: <1591440907-20021-1-git-send-email-sivaprak@codeaurora.org> <852c7804-b1b3-2d78-00f6-b67b9fd4e720@codeaurora.org>
Subject: Re: [PATCH V7 0/4] Add APSS clock controller support for IPQ6018
From:   Stephen Boyd <sboyd@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Fri, 19 Jun 2020 17:31:58 -0700
Message-ID: <159261311891.62212.13701901545033603842@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-18 00:00:58)
> Ping!
>=20
> Hi Stephen,
>=20
> Is it possible for you to review this series? We have regulators and few =

> other patches

regulators depend on CPU clk patches?

>=20
> depend on this patch, it would be great if you could provide your inputs =

> on this.
>
