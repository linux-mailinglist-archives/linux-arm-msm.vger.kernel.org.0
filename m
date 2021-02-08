Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C214313B97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 18:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhBHRxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 12:53:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:44096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234884AbhBHRvu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 12:51:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19EA964E8B;
        Mon,  8 Feb 2021 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806669;
        bh=eEI3qDcj/vd5ZgkvCFJDBTEEpS0bQkdtom4/gw0uPv4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rOR814R6/MGGPiSoSIHsytgQ0TQA1T0CrwRKN2QChmhgeYV6sJdyk9qewP5y55weW
         siPjpUdYhPbGHKT1Svde9hL2X39CXQB0F0uCLwWzxiSeAB6S1IuzeKrpeXOjGSx3h6
         6RiG7H+faEOOVXLuJ6i+RhMd/38eUb9r1qDq+2Md0pEhhm7SM6goBHlc38TwgjiYkm
         B3U2ZVOXKugRzSfrjwJ8NBRn/28tAda4erkerM4SF0coOyo892XnVBH0t7/fJ6NrQ3
         As2ZCFr+Cfu+jNGnSn5YPjXI3bPhyKPW4YMYfBgPcCwkWiSCRE4Z3anuEMPSkhoNE+
         WWS/cVqD678zw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210119113851.18946-1-srinivas.kandagatla@linaro.org>
References: <20210119113851.18946-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] clk: qcom: gfm-mux: fix clk mask
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date:   Mon, 08 Feb 2021 09:51:07 -0800
Message-ID: <161280666778.76967.14187012451519132317@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2021-01-19 03:38:51)
> For some reason global GFM_MASK ended up with bit 1 instead of bit 0.
> Remove the global GFM_MASK and reuse mux_mask field.
>=20
> Fixes: a2d8f507803e ("clk: qcom: Add support to LPASS AUDIO_CC Glitch Fre=
e Mux clocks")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
