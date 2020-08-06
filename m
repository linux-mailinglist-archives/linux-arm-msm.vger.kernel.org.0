Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94FD23D490
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 02:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgHFAb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 20:31:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgHFAb5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 20:31:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 741DB2173E;
        Thu,  6 Aug 2020 00:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596673917;
        bh=COlM6ZwpJBn0yZ7U5zGmwKi2QBKcTNFY6uKqQQLWL9I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NyYpl8j7GnE0b6Kl9PfXT74TEaVjbKcJZhVIYLuCXYezr42vioZTRPEVqIghVq1F4
         zNIZU0xHD6nN48uda830HuH8BpUcKUyC/m9qlBIBKXRrYYuT+KwRh1A+dNmzWkX2Ye
         KUyGv5thzFRaFuJCm0Wn0WY0Ymm34tc/mAb9/oes=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org> <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org>
Subject: Re: [PATCH v4 01/12] ASoC: qcom: Add common array to initialize soc based core clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Date:   Wed, 05 Aug 2020 17:31:56 -0700
Message-ID: <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rohit kumar (2020-07-22 03:31:44)
> From: Ajit Pandey <ajitp@codeaurora.org>
>=20
> LPASS variants have their own soc specific clocks that needs to be
> enabled for MI2S audio support. Added a common variable in drvdata to
> initialize such clocks using bulk clk api. Such clock names is
> defined in variants specific data and needs to fetched during init.

Why not just get all the clks and not even care about the names of them?
Use devm_clk_bulk_get_all() for that, unless some clks need to change
rates?
