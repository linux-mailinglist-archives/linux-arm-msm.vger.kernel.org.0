Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD8C2A75AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388359AbgKEClb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:41:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:55278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733060AbgKEClb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:41:31 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B48B206B5;
        Thu,  5 Nov 2020 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604544090;
        bh=qA49UIP8O7VyxGZr2r9Bjj7V+4xWjBPy6+WdiiH9c1U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eF4QO9vOxH0UHDxW3x0GkFEuavYBmca3SHqj6HgIR29S20vs2vsonVUCfo768leer
         ml9vezsqhQgpM9K8QeCBEHebO9JZujwZ27RD4l/aaXtT0xdiRqoqQpqbdMfKhvqN4p
         TJYpo3n1sfqpQRW2i2ifJV5zXgfeA96zp4uXBUUo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026120221.18984-5-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org> <20201026120221.18984-5-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v3 4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 04 Nov 2020 18:41:29 -0800
Message-ID: <160454408908.3965362.12298695848830812530@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-10-26 05:02:21)
> LPASS Always ON Clock controller has one GFM mux to control VA
> and TX clocks to codec macro on LPASS.
> This patch adds support to this mux.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
