Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF61185050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 21:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCMUaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 16:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgCMUaD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 16:30:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 331B2205F4;
        Fri, 13 Mar 2020 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584131403;
        bh=NFuWO4GhKliupoqTZLI2LfLmpwyd7zhsfwNCfXgzDhA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Vzuv6bghVEzClsf8wZLOeWqA0jw7fvgxTz2kyGHuXdd3I1Y1hJgFMcEkqpWsxqpQ/
         1LnnO6PM6lBFYTwfzCNR9cgtgxKaC6soU3KK9cgFUegFKNvTJJlQXMnNuhc1u5ZHPr
         aRRG+aqq8VYrhxltAV+QnX6gdKJVkkO6XmolV1/U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200313185406.10029-1-ansuelsmth@gmail.com>
References: <20200313185406.10029-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ipq806x: gcc: Added the enable regs and mask for PRNG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Abhishek Sahu <absahu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Ansuel Smith <ansuelsmth@gmail.com>, agross@kernel.org
Date:   Fri, 13 Mar 2020 13:30:02 -0700
Message-ID: <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Ansuel Smith (2020-03-13 11:54:06)
> kernel got hanged while reading from /dev/hwrng at the
> time of PRNG clock enable
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Is Abhishek the author? Otherwise the tag chain here looks wrong.

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Is there some Fixes: tag we can get here too?

> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
