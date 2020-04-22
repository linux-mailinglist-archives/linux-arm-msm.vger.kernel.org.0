Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BB01B3535
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 04:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgDVCvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 22:51:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbgDVCvS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 22:51:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CF7D206D5;
        Wed, 22 Apr 2020 02:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587523878;
        bh=I46/5F1aUhtPqz6RdGMRl7ho5eerZkpYwLtKJ6Bog4s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n8zLV8et2rtyCIgt8Kb8RALMswehb3MEUvs1roN3a+0v1+uL6/JuBG9snFRzdmd50
         lUxE1L73AcX7dBbg57T/lC5fdwvoehLifnatAmciOmrzqvhHu+MABoTVYjvfR21dZh
         p6BhyTQzp8DP3vsCtztdxlW9SoLtNDLk879kfIzA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200419121808.440780-3-bryan.odonoghue@linaro.org>
References: <20200419121808.440780-1-bryan.odonoghue@linaro.org> <20200419121808.440780-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-msm8939: Add gcc-msm8939 driver by copying gcc-msm8916
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 21 Apr 2020 19:51:17 -0700
Message-ID: <158752387776.132238.1325437671673808624@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-04-19 05:18:07)
> From: Shawn Guo <shawn.guo@linaro.org>
>=20
> It's a copy of following files with zero changes.
>=20
>  drivers/clk/qcom/gcc-msm8916.c
>  include/dt-bindings/clock/qcom,gcc-msm8916.h
>  include/dt-bindings/reset/qcom,gcc-msm8916.h
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Squash this patch into the one after and generate the patch wit
'git format-patch -C'. Does it find the copy? Probably would, and then
we could figure out what changed.
