Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5923113908
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 01:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbfLEA4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 19:56:49 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:41904 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfLEA4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 19:56:49 -0500
Received: by mail-pj1-f66.google.com with SMTP id ca19so534227pjb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2019 16:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mkK1VbYU8pd8d1R2HwKoX7wARdH4Fdf+a3nqX6mf/A8=;
        b=dbEieWkwvw6WZSpP1x7bC4rsOw5teKRhgEYI1EgQL8Mw6TV1DHWZ3AHvhig8Gj59sY
         LYWUeilhVAielBO2XpkLLJrj/SG4ZABZgXwVppbT3ok1163wByjsemU6rq5Wqu02BFj8
         mQWIyIKJUuY1CwGc+0KWD6po2054VL91TfDls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mkK1VbYU8pd8d1R2HwKoX7wARdH4Fdf+a3nqX6mf/A8=;
        b=ogMPhl5MDcqHPuecfez8WBqEr6ePGxIW1UCUhEHP8nPHReZ4YXbVywAi6+/e8GswMD
         oev7zfXX+qSlGSJSDN5YN3wplVSHOXPu/ov1lBSlAVysL5O/Ct0jwvenA2js8pNtrmG0
         V6jR0xXr8qE9xpgYTp0qR3WIXmKS/ONWD+3nPqUKXlBFEKKaaK7rVLb+VCkWNTfbJwx4
         CtXotRXR4jnvlveXqSrgGNudHtN+1qECqeuDyLSp+pH2wMBfFjSDbAZYf32vFKao1MuI
         mrSxfWiMz9k0msBes9joepFWv0WYAO3PvQF46Ug4+vKSjhKmBiQHdHAXpRvi6+/Leksi
         gzLg==
X-Gm-Message-State: APjAAAXxXNHqHHkzc/j+4uwpAOids2ZT/XDZyoJZNaZ0BiAjEu3KgeCD
        7gCSl59fCrYrZeX8x9O3LMP/qA==
X-Google-Smtp-Source: APXvYqxJ0zxJwZ22BShddeCBPYuInYIfGJ/UwK80td0CdFHYrbpSKP7c3zsMboM8VVVoF2a9Ix3HZw==
X-Received: by 2002:a17:90a:b009:: with SMTP id x9mr6338021pjq.124.1575507408713;
        Wed, 04 Dec 2019 16:56:48 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u1sm9151663pfn.133.2019.12.04.16.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 16:56:48 -0800 (PST)
Date:   Wed, 4 Dec 2019 16:56:46 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi
Message-ID: <20191205005646.GL228856@google.com>
References: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 04, 2019 at 09:20:18AM +0000, Rakesh Pillai wrote:

> arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi

This is not really done for sc7180, but only for the sc7180-idp,
which should be reflected in the subject (i.e. s/sc7180/sc7180-idp/)

> The MSA memory is at a fixed offset, which will be
> a part of reserved memory. Add this flag to indicate
> that wifi in sc7180 will use a fixed memory for MSA.

ditto, say it's the IDP

> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This patchet is dependent on the below changes
> arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node (https://lore.kernel.org/patchwork/patch/1162434/)
> dt: bindings: add dt entry flag to skip SCM call for msa region (https://patchwork.ozlabs.org/patch/1192725/)
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 8a6a760..b2ca143f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -250,6 +250,7 @@
>  
>  &wifi {
>  	status = "okay";
> +	qcom,msa_fixed_perm;
>  };
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> -- 
> 2.7.4
> 
