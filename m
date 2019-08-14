Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E958DAB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730208AbfHNRTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:19:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729579AbfHNRTs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:19:48 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9E8D20665;
        Wed, 14 Aug 2019 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565803187;
        bh=nAkuDP2FQ89IlX5/rCnqh9hhxWvJhrfgiaK5H9MwhLs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hPQgcdLJ/117BHOcYmgSrhkgHU9qP9D4YV/eUBcWWx2IhPQZoqbKaFvVIdHnZXPBX
         VZ63c3vKXfWdTS1BojNIiOPkGWDBdEXxu4tkGMAOlX/3THqvvn1MD3TATmV/O6u8GK
         pcn5uDs4ZHqJtDYgt6JORouZYBALVlBBXCSy28wM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814122958.4981-2-vkoul@kernel.org>
References: <20190814122958.4981-1-vkoul@kernel.org> <20190814122958.4981-2-vkoul@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add support for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:19:46 -0700
Message-Id: <20190814171946.E9E8D20665@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:29:58)
> Add support for rpmh clocks found in SM8150
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Patch looks OK, but can you convert this driver to use the new parent
style and then update the binding to handle it? We can fix the other
platforms and dts files that use this driver in parallel, but sm8150
will be forward looking.

