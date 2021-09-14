Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8348040B9B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbhINVOf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:14:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231472AbhINVOf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7126761178;
        Tue, 14 Sep 2021 21:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631653997;
        bh=8YpUXXkntHsFUlG1VmXFXFQjihnNZ2eNBEyEKdGEgR8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oyQ49IgI//jXZhFBjNMYL96J++4By0RTfEHokMtk3gma11+SQd56FOUquV/o1b1Ia
         s0oLRGuXwPVK+odmDtmoAM6afbaFJ2CUbjhaER3OKS38jQ6mPmNlAy1wZk00CPQDdH
         Su1BBA+ca5ZFXsGunpNUe6tjm/TGwTL2MgtGdZnmTqSLpEiZ3lahZ227bJLG23VRp4
         zP6WR4za/cvQsZYSFKQpktguFuyCYi4QYAiQM3XoVzKtN4SpdoW41yMfpaPlSYYLNr
         Vznzl1YejK0TEw/ZcgXQTjpmcTbWdnLgXjbeeIMOWHULCKqbwBGPB9ktbymOF04Vw6
         qb64PUYuakX9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829204822.289829-4-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org> <20210829204822.289829-4-marijn.suijten@somainline.org>
Subject: Re: [PATCH 3/4] clk: qcom: mmcc-sdm660: Use ARRAY_SIZE for num_parents
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
Date:   Tue, 14 Sep 2021 14:13:16 -0700
Message-ID: <163165399631.763609.18187387046127614027@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-29 13:48:21)
> Where possible, use ARRAY_SIZE to determine the number of parents in
> clk_parent_data, instead of hardcoding it.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
