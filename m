Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA38B3982D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhFBHUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhFBHUp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:20:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D9E161363;
        Wed,  2 Jun 2021 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622618343;
        bh=hlOYJeG8/qCR5EEbjFKyEkRsLPrtR2uxS3iX3FXGd8M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RK3oS5F+9a++hlfCWn7SIMvVNgMC4xXZR88Zn+187UIWiTWjaTD/bRfU4Ib5EujYD
         nTD1TGyX3bU9ZE13Fu9MknOjSk688qPILP2LNDHlkwQJsALNPz7v0EEAxuWJpW/wMC
         07Gi6CEA2efJLeFVRAn7RvOUXkiQD2PjLS+qT71MedvmqThgpybZH2ZaVuMdXeJcux
         dt5lithe73Y8b+3ol05f7wOpH/dySdYgsRUl1v8pZlHPk1p0oAJWI3kG2lTkqiQJHK
         KRXb9VnKbXtn8TYnnYb8eKpaF3KuYWadEhWu+62HHnb42gMrJA4oLNw6yqrJWU0UNA
         1AoHSPrcGQthQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <162261815287.4130789.11379635452213443712@swboyd.mtv.corp.google.com>
References: <20210524225456.398817-1-konrad.dybcio@somainline.org> <20210524225456.398817-2-konrad.dybcio@somainline.org> <162261815287.4130789.11379635452213443712@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] clk: qcom: smd-rpm: De-duplicate identical entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 02 Jun 2021 00:19:01 -0700
Message-ID: <162261834188.4130789.12467952282449530814@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-06-02 00:15:52)
> Quoting Konrad Dybcio (2021-05-24 15:54:56)
> > It makes negative sense to keep repeating the same definitions
> > over and over and over and over again, just with changed names..
> >=20
> > De-duplicate to make for a drastically smaller file size.
> >=20
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > ---
>=20
> Applied to clk-next. Thanks! I wonder how much smaller it got...

Apparently 55% smaller. Nice!

	$ ./scripts/bloat-o-meter before.o after.o | grep Total
	Total: Before=3D70713, After=3D31353, chg -55.66%
