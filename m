Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F31E6079
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 06:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfJ0FK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 01:10:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:42024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfJ0FK2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 01:10:28 -0400
Received: from localhost (mobile-166-176-122-39.mycingular.net [166.176.122.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 955982070B;
        Sun, 27 Oct 2019 05:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572153027;
        bh=ckapfA5pGiCRvio3aT2WserRrjd8jyiBBw5Y1kMknwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d8yDpQ5F962y61zyRyS5VOypEGEVvJ+LOBQBP+JZSmzAnDpEkN/ZSNpDcVE9Bb7me
         hL647jQpGvTBgbYPzCcZZ9a5Ow0QLpTbaw52EhcMgtD0llrqzX5yzSTeTJvr3Tl/pP
         n67KB+/nBOEjfcJBZzyBfhwv09NQ8hSXZ8UHA/Qk=
Date:   Sun, 27 Oct 2019 00:10:26 -0500
From:   Andy Gross <agross@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 09/15] arm64: dts: msm8996: thermal: Add interrupt
 support
Message-ID: <20191027051026.GE5514@hector.lan>
Mail-Followup-To: Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        devicetree@vger.kernel.org
References: <cover.1571652874.git.amit.kucheria@linaro.org>
 <b42e18096b81abaaabe1822e75f1882781467c71.1571652874.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42e18096b81abaaabe1822e75f1882781467c71.1571652874.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 04:05:28PM +0530, Amit Kucheria wrote:
> Register upper-lower interrupts for each of the two tsens controllers.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 87f4d9c1b0d4c..4ca2e7b44559c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi

Applied for 5.5.

Andy
