Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88AA17EBCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 23:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgCIWNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 18:13:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbgCIWNO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 18:13:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DCDF24654;
        Mon,  9 Mar 2020 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583791994;
        bh=7Gq2PXCZY0GqdmcCbDg4OhTKZeKcu2LpwF2TRVWOzXs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QV6Dg6MEO39ivpjJ4KA6P8SA6CkGEqc6Acfb4crcaDa9keWV0GajT9rf1XhMivsok
         4GrZH/LTR7b6oOYceXSC5ONx8A8S+jTJUbazvgtIhe1sxdwnTHp83Vq7akXGkbuoaC
         6afBAeum49E7rr6mY7SuR3/kNllntWq/kMszLYsA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031112951.35850-3-kholk11@gmail.com>
References: <20191031112951.35850-1-kholk11@gmail.com> <20191031112951.35850-3-kholk11@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: rpmcc: Document msm8976 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
To:     kholk11@gmail.com, linux-arm-msm@vger.kernel.org
Date:   Mon, 09 Mar 2020 15:13:13 -0700
Message-ID: <158379199350.66766.15631578266876135281@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting kholk11@gmail.com (2019-10-31 04:29:51)
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>=20
> Support for MSM8976 was added to the clk-smd-rpm driver: let's
> document here the newly added compatible string.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---

Applied to clk-next
