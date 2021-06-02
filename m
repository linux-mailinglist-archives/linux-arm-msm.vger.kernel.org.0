Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA2C3982CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbhFBHRg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:17:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:51714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230228AbhFBHRg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:17:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CC4761375;
        Wed,  2 Jun 2021 07:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622618154;
        bh=S0Nm4a1toKFE9M971dSryX52UVzMtVUl1nXpR9J72Kw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gaZ8c1viFYKnqLDKSwGZuQa2FMs8Lal6uPCJlsKIfnSOTnQQQ3SToLWOHqbBOL3a0
         QOwAp1LrTGAGOPa8WA2DKXn7DOf83hrCK49p8swWZBz25QUjrtl9K2hzkzPwuOf51m
         G48g8Ia5YUaP14DEWwRgk4hrtzditJ02hv3NI2TnfiXVzHhzwmhg53suUEDBaXGZbZ
         jC5CArIUNDIqxOPC6eZ7xuUwsHZ7ngkR+gBfIKOi+XWUOOv/4PHwI0uuSrwL6IZ4WC
         cxyasaLaK8Q5usRN289+lLCAvuvdlrrDJi4XTwfp89qDwovN8W1KK3Sjw+Umo5eXZk
         ELDWBm6A9uLIA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210524225456.398817-2-konrad.dybcio@somainline.org>
References: <20210524225456.398817-1-konrad.dybcio@somainline.org> <20210524225456.398817-2-konrad.dybcio@somainline.org>
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
Date:   Wed, 02 Jun 2021 00:15:52 -0700
Message-ID: <162261815287.4130789.11379635452213443712@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-05-24 15:54:56)
> It makes negative sense to keep repeating the same definitions
> over and over and over and over again, just with changed names..
>=20
> De-duplicate to make for a drastically smaller file size.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next. Thanks! I wonder how much smaller it got...
