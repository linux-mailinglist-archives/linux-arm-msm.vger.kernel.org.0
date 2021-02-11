Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8023193B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 21:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhBKT5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 14:57:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:39076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhBKT5V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 14:57:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1043064E45;
        Thu, 11 Feb 2021 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073401;
        bh=tsD9HzsZ2Nz1Vob5rdDg0uedShsbstrOd9mWMBItvGg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B950Rw9ZaSv9DKQN802Rgmzp/SvjEkMyYIVMNUTMWMPl+Os9+1u1h0zWmiQrwEEOq
         bBFuLjfOl1URfkdK73xRI2k4lzIbseYTW+qSSRRjDanLrJLlnwtteYev0XmaI9OFzv
         QP3HTqhbqRUMUeBDzgEQuX9H8tu/E0CkDpBeHLtv8Y0RTruCcsHHmOsZCPEXIOCdyZ
         j3niJuoFg4lFX24/NT8p646/Jbt3+pa33eCt8aPNEkxqIB9AEPWlcxQudSe096EbZA
         eVeuoxeH29Ce8+6ySXGXq1IzQPIxZrtpowyk2zazCPHdGsH6nzXU11xQXs0Mxp2UZG
         23avxHyXqnCyg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-14-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-14-lee.jones@linaro.org>
Subject: Re: [PATCH 13/21] clk: qcom: gcc-ipq4019: Remove unused variable 'ret'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:56:39 -0800
Message-ID: <161307339983.1254594.13271615528365790674@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:32)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/qcom/gcc-ipq4019.c: In function =E2=80=98clk_cpu_div_set_rat=
e=E2=80=99:
>  drivers/clk/qcom/gcc-ipq4019.c:1279:6: warning: variable =E2=80=98ret=E2=
=80=99 set but not used [-Wunused-but-set-variable]
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
