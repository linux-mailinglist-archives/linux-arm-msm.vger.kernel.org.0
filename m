Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DAE3A089F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 02:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhFIAue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 20:50:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230307AbhFIAue (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 20:50:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5219B610A5;
        Wed,  9 Jun 2021 00:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199720;
        bh=ERmgSRRnXIy4DDzTntT9gQb6u+4CobinnQJJsp8UKmo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pSCU1e5mcZPT37ZztPSDxD3evbVaa+hB+qRtoryxPciX85AKuF8DdhyUldC2e7upZ
         Far0vVU3CC4VQ6h19Us7rLf/mgooACL+JYE6fLBA+2H0yjHD5v1fx0Kytw2lIVfoVq
         ThTVpNoBaXgLoVaW8HEVJugiMmyeSDIRLe+5m/kqEpBYa0QI97O842Jrqpd2bwx9AS
         OXUPmIHPlJqU5zjeTN5CHZAt+5VX5+bdxXGijBzjLygTXO4DYYRGOaOZJvZetqQsiw
         yE5+1cdF3VJW3vpl1tzfTkbGLq90qqc2lK6C2tdSTS9h/G/EP/SDfZMnopcGWW0usP
         05yUYJmcmlF/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210606192657.51037-1-konrad.dybcio@somainline.org>
References: <20210606192657.51037-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH] clk: qcom: smd-rpm: Fix wrongly assigned RPM_SMD_PNOC_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Tue, 08 Jun 2021 17:48:39 -0700
Message-ID: <162319971911.1835121.7659813452356836023@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-06-06 12:26:57)
> During my big cleanup I managed to assign an AO clock to its
> non-AO binding. Fix this.
>=20
> Reported-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next + added a Fixes tag.
