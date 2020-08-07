Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5CE23F3AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 22:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgHGURM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 16:17:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgHGURL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 16:17:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A66C12075A;
        Fri,  7 Aug 2020 20:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596831430;
        bh=FTGX8V3BOAmBXKLEXLdqfDBeFt3UQfICsLUdU64xJiE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TKFpExx251qL5pZuFJCespYGYMaO91U5zGyMF51r/UcvnqdQ2cu4NxBi6+9zjiCGf
         lmcvOhlGpRNU36TuvI3XAqLhDBjrcVHwrZS9+IsIfeeMR3reH68iZAasoSq+1g2tBH
         VusTYqJ1btk2P+wMSfIVfmFwXYmkU1ME6O/jKw20=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <989f1d99-3cd0-e725-3f6d-43facf1ec04d@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org> <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org> <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com> <989f1d99-3cd0-e725-3f6d-43facf1ec04d@codeaurora.org>
Subject: Re: [PATCH v4 01/12] ASoC: qcom: Add common array to initialize soc based core clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ajit Pandey <ajitp@codeaurora.org>
To:     Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Date:   Fri, 07 Aug 2020 13:17:09 -0700
Message-ID: <159683142954.1360974.1307064087263696126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rohit Kumar (2020-08-05 20:59:48)
> Thanks Stephen for reviewing.
>=20
> On 8/6/2020 6:01 AM, Stephen Boyd wrote:
> > Quoting Rohit kumar (2020-07-22 03:31:44)
> >> From: Ajit Pandey <ajitp@codeaurora.org>
> >>
> >> LPASS variants have their own soc specific clocks that needs to be
> >> enabled for MI2S audio support. Added a common variable in drvdata to
> >> initialize such clocks using bulk clk api. Such clock names is
> >> defined in variants specific data and needs to fetched during init.
> > Why not just get all the clks and not even care about the names of them?
> > Use devm_clk_bulk_get_all() for that, unless some clks need to change
> > rates?
>=20
> There is ahbix clk which needs clk rate to be set. Please check below=20
> patch in
>=20
> the series for reference
>=20
> [PATCH v5 02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform=20
> specific function
>=20

Alright. I wonder if we could make the API better or the binding better
and always have the rate settable clk first and then
devm_clk_bulk_get_all() could be used along with clk_set_rate() on some=20
array element 0 or something. Anyway, don't mind me, I'm just thinking
how to make this simpler.
