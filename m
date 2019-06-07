Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398D3397C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 23:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbfFGVaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 17:30:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:57870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729726AbfFGVaw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 17:30:52 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ADE2208C3;
        Fri,  7 Jun 2019 21:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559943051;
        bh=+8vRQ4YjkZ+4hla3SNxNwixDS9pvt0gb8HQPiBw81iQ=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=TwexyLcl98YMzgTjjU7pisJh4W9X2FacDHP9gsR7Ez+CGGGOuKFKOP0TBveTn3ysZ
         qfd5B2zVUdST1tnfXKyMXKNQeYehEefWG07caWYXP27aVkgRuZGMVICxggPMMgYuww
         HJCnIXZIlFzsc/QFUmdb7XrBDQ3fTUBVTWFXTnPc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190508223922.5609-1-bjorn.andersson@linaro.org>
References: <20190508223922.5609-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4] clk: gcc-qcs404: Add PCIe resets
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 14:30:50 -0700
Message-Id: <20190607213051.8ADE2208C3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-05-08 15:39:22)
> Enabling PCIe requires several of the PCIe related resets from GCC, so
> add them all.
>=20
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

