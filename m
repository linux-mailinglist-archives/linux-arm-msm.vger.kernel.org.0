Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A6940BA8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbhINVn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:43:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235254AbhINVnW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8BAA60698;
        Tue, 14 Sep 2021 21:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655724;
        bh=/9zvCYmhpKsjctl8Uei7H0W4BGaIwrqgfEUwdmMavg4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=esuDjulOQAI6+OJIRR70mHUlM3rsGQEg6/u2hRdjFtFSCNQycZ/FGI95rx03YXRv9
         tsD4wyeGjsHcUiFhBMpI18fElWt0QDvvaMdBB9DuZyL7qYGZNnNix9tHqvlubxHaAm
         V5/yDtsz6cFdfVSHUKHdEq1Ib7Vkezy936BiCkKbgPZ3sCUHl7erfnCMs7tyg/2zJD
         uggodyEOWsPUzfNCcigs3mX4E5scNOOMajcRlmsTcm4lExoEQT39f4i+d2FIcYpg8S
         RVRW93w7ICOSchjeG6Om1H6G+JJByZC6FfuT3fUs3sukmfC52Kk5PcsewTbeYjDvgk
         mO1AKbo/kDiww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-4-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-4-marijn.suijten@somainline.org>
Subject: Re: [PATCH 3/8] clk: qcom: gcc-msm8998: Remove transient global "xo" clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:42:03 -0700
Message-ID: <163165572360.763609.9790931243080849652@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:35)
> Now that all clock controllers and the DSI PLL clocks rely on "xo" being
> passed in DT as phandle instead of looking it up by the global "xo" name
> this transient clock can be removed, leaving only the fixed-factor
> "xo_board" clock in DT.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
