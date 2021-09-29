Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3061141C374
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 13:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244363AbhI2LcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 07:32:19 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:36754
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229567AbhI2LcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 07:32:17 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C916F40CE4;
        Wed, 29 Sep 2021 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632915036;
        bh=0575VV0gt8/0gLoL9LJNlvK+sCPlYUgHHJ1GFfB2lcA=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=MaVdgI8WyuMYZnCV4wdFIWTM6tbqcaI3W1d+Ki3AeTaZQK27vR/FZwUIQ+7/xxHSg
         kTMgD/oN5Uizyvr/EpOd8N1kHBGqXoXO5wkwC36RTOQoxu8Gz/G3tsb2hRMyeeW3fs
         vaZViRmlbU4UghsbofTXK1qMQGuadGumDlZXl9UkcYPj/TEpdds9va+XyOz56enZdz
         Cu9u1Qadla0AvX0NyMoN7kY0/fqTsYpij26GBVrFyqkWVkDN+MOlDSkstbMlfWCBFR
         FRZntP8+h11crjkTyhk0wTB0AJBkrJlKNdOHqDgtubR2Ag96OpDNc3vzo3mJDhAfc4
         9gGM1nbYH89Tg==
Message-ID: <14afe5d5-4c68-b1ca-da88-8951188ee9f9@canonical.com>
Date:   Wed, 29 Sep 2021 12:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: NAK: [PATCH] drm/msm/mdp4: Fix potential integer overflow on 32 bit
 multiply
Content-Language: en-US
From:   Colin Ian King <colin.king@canonical.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929110804.210725-1-colin.king@canonical.com>
In-Reply-To: <20210929110804.210725-1-colin.king@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2021 12:08, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where clock is 2147485 or greater the 32 bit multiplication
> by 1000 will cause an integer overflow. Fix this by making the constant
> 1000 a long to ensure a long multiply occurs to avoid the overflow
> before assigning the result to the long result in variable requested.
> Most probably a theoretical overflow issue, but worth fixing.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 3e87599b68e7 ("drm/msm/mdp4: add LVDS panel support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index 7288041dd86a..deada745d5b9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -64,7 +64,7 @@ static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
>   	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
>   	long actual, requested;
>   
> -	requested = 1000 * mode->clock;
> +	requested = 1000L * mode->clock;
>   	actual = mdp4_lcdc_round_pixclk(encoder, requested);
>   
>   	DBG("requested=%ld, actual=%ld", requested, actual);
> 

NACK: there are a few more occurrences of this in the msm driver, I'll 
fix them up for a V2.


