Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C843FA874
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 06:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhH2EBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 00:01:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:33390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232052AbhH2EA7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 00:00:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D092F60F23;
        Sun, 29 Aug 2021 04:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209607;
        bh=plItikWQPHgMQDcdJ77oUa4IOsLVMRP+2c2ntNPDinM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=A9wsnkdhBxhXfUeMZ9AmY0qOS1MEXf270eA056UpGBJ3CpgMl3sFRg07pcPikv/PF
         5qawpUcEGgTOGv/SYvssnMIg/x/vJuuIstD9A6DHKJ5jrbBfqU3sA9Kjn6brnqSCoa
         9ojcm8ecfHMUWWWF5haYkUuPhCHEioTp+UMre/8d5CTGo25AMXsg/4EfO1nRfCeFdo
         J9on4dbhXCvkKe+Chp+JUUKlOZwbV92aJrbq8m54F10gFgIDY27++zWVbvk4bOAgOS
         o+WGD9+XlZDPLrX+uObD4oyxozP0053jXmiZ8VMuXVLuutU2tmkbkH+5AsC7gChv7J
         h6xjYB88WWXCg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210805161107.1194521-3-iskren.chernev@gmail.com>
References: <20210805161107.1194521-1-iskren.chernev@gmail.com> <20210805161107.1194521-3-iskren.chernev@gmail.com>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add Global Clock controller (GCC) driver for SM6115
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Sat, 28 Aug 2021 21:00:06 -0700
Message-ID: <163020960660.2676726.11122427161797719974@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Iskren Chernev (2021-08-05 09:11:07)
> Add support for the global clock controller found on SM6115
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
>=20
> Based on CAF implementation. GDSCs ported from downstream DT.
>=20
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---

Applied to clk-next
