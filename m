Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8596140B9AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhINVOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:14:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230332AbhINVOW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:14:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C15C61178;
        Tue, 14 Sep 2021 21:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631653984;
        bh=yeOEWmEJKDVlSk1tfSZTWxc+t+9x4gtfs7gGV3Q2AZI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KJj4J5GXMyNwUnaFSdLnngnv0y8/PMSl32x9fLl/MjmLp/2k4Vrkeu8hqwov/ib1q
         2dEgIDQElK6OqupTV1Pg63uBz7uGbePiwqaf803ko82aYsUGU0xGIgRN1Pi7tucAY3
         /Rb7xjaMfwZfgwovj31lIMcx/wQ1226s3oIiHW4enPMbghYPI8N6gIzapZ4vCr/6Qv
         8mtJbg4hV4LIlLa5l2XdQXXAELhA89E8bpkWm5TSE39KqRvivZmSNzTGLENt9+wC/D
         LbSIigNveOIAEnBw6JuWvpbWfGG95FlZqefGmI53Wcam2khUJdPI7re2rNZDv24Y0J
         VY5exOOd2FnVw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829204822.289829-2-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org> <20210829204822.289829-2-marijn.suijten@somainline.org>
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sdm660: Use ARRAY_SIZE for num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:13:02 -0700
Message-ID: <163165398294.763609.3984936459082087203@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-29 13:48:19)
> Where possible, use ARRAY_SIZE to determine the number of parents in
> clk_parent_data instead of hardcoding a number that relies on an array
> defined hundreds of lines above.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
