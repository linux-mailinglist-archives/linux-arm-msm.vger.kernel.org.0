Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72383340CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 19:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCRSWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 14:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbhCRSWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 14:22:11 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08919C06174A;
        Thu, 18 Mar 2021 11:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=S9hxfnnZSFMfcMrf6bjIrxOqUzvx5VJvhFrIa36oBsA=; b=fY16BKpFfFkJVHeFR1WsjzrKBO
        jxaJiM6Gvteh+TcN7aH2Y8/LX766eVyxGW2L0D6VoHJdeCyCFNQ9+PMV1zqT15JCuC4BnkmxhD3l5
        ZHGj9ngr34tEwDqlU8Mb875p1YK+yRRADP0xtG4404D2du/xqh0v+BYauKFvBp4Ptk7ruRI5xn00Z
        PJMJMR3cR/7MQuyD8gfxayhnBXWYm2xTnWmd5oQz8pb1rLF7BSSk8PWEDmdL/GiQXLzHvSorptkDh
        Sm1lNFrvinmuv9mNv9vcFlrtsSFrFX02Ay65Q+lNyjnffGnuaWjE7aAlXVpihXk56RZLUGaU5bXr6
        KDGlPfNA==;
Received: from [2601:1c0:6280:3f0::9757]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMxHT-003LNP-Ma; Thu, 18 Mar 2021 18:22:02 +0000
Subject: Re: [PATCH] drm/msm/dp: Fixed couple of typos
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        khsieh@codeaurora.org, tanmay@codeaurora.org,
        chandanu@codeaurora.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210318062650.19886-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d3facf30-2a60-46f2-caa0-af63d3a52dd1@infradead.org>
Date:   Thu, 18 Mar 2021 11:21:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318062650.19886-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/17/21 11:26 PM, Bhaskar Chowdhury wrote:
> s/modueles/modules/ ....two different places
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_power.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> index 7d0327bbc0d5..e3f959ffae12 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> @@ -88,7 +88,7 @@ int dp_power_client_init(struct dp_power *power);
>   * return: 0 for success, error for failure.
>   *
>   * This API will de-initialize the DisplayPort's clocks and regulator
> - * modueles.
> + * modules.
>   */
>  void dp_power_client_deinit(struct dp_power *power);
> 
> @@ -100,7 +100,7 @@ void dp_power_client_deinit(struct dp_power *power);
>   *
>   * This API will configure the DisplayPort's power module and provides
>   * methods to be called by the client to configure the power related
> - * modueles.
> + * modules.
>   */
>  struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);
> 
> --


-- 
~Randy

