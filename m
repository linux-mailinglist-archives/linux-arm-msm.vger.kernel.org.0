Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B507128D7C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgJNBEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:04:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgJNBEm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:04:42 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81B14208B3;
        Wed, 14 Oct 2020 01:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602637481;
        bh=aRDby6Tf6kApngD6WPLRPBLIWKE1Nq1LU0dmXuOlRQ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BH59Cqu66D0PzaM+IS0XDCugZ2tLznqGPlx1Bt4D+8klumtcftrrKUaqhiK2CC7+D
         OBUJG7DOAVItF3Hnh09u1tVMUzFr/77zUYRTbEK75tAWajPsSwvU51HTPI4WcgrdTB
         TCjlfEyJfV4wy3F7qRy03Ow153oiBTLcPSFOSgrY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201005145855.149206-1-konradybcio@gmail.com>
References: <20201005145855.149206-1-konradybcio@gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-msm8994: Add missing clocks, resets and GDSCs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     konradybcio@gmail.com
Date:   Tue, 13 Oct 2020 18:04:40 -0700
Message-ID: <160263748035.310579.4403245633255183131@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-10-05 07:58:55)
> This change adds GDSCs, resets and most of the missing
> clocks to the msm8994 GCC driver. The remaining ones
> are of local_vote_clk and gate_clk type, which are not
> yet supported upstream. Also reorder them to match the
> original downstream driver.
>=20
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---

Applied to clk-next
