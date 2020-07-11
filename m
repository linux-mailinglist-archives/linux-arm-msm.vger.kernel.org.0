Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A6821C525
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 18:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgGKQTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 12:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728441AbgGKQTt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 12:19:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C75772075F;
        Sat, 11 Jul 2020 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594484388;
        bh=3GnM585dkYqv+9gopRkdXKflaepJBavmU784KD08fjU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i3M4tMeRWXpSJGE7kLQVXGWIvxGAe3Oly+xInMrbInjhdQfPQwlI7mljaDX2gTg4F
         PhecnD8lCrCKjaoQKV017KZbQxsgiRe90UHm1cC+Jzh9m6IQJ6Nms5e+pYSCx9b946
         ji044mXxfiN9bpe0DqoYVjkhqtkW2JDI15CQ11oA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200623230018.303776-1-konradybcio@gmail.com>
References: <20200623230018.303776-1-konradybcio@gmail.com>
Subject: Re: [PATCH 1/1] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Sat, 11 Jul 2020 09:19:48 -0700
Message-ID: <159448438810.1987609.6567829298927086029@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-06-23 16:00:18)
> Add rpm smd clocks, PMIC and bus clocks which are required on MSM8992,
> MSM8994 (and APQ variants) for clients to vote on.
>=20
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---

Applied to clk-next but I had to fix the binding numbers again.
