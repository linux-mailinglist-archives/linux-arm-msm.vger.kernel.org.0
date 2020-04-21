Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D23D1B30DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 22:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgDUUAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 16:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDUUAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 16:00:19 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E475C0610D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 13:00:18 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o10so4041021pgb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
        b=YWDFSsi9ryGa8bDJzYeDNw+vx+TvNzV2BxgbgfORIvrP64vyZ1imeGOhyAgmGNngvm
         eCYaSD73vnaoGoKUeQgCKH+Hr66n7gWLTjfCaUfz+rjOnTy5EdTl9YkbziW6tCDs5Jff
         8eLrKW28QiInsEbBv0ijdwTtski0qBKHoilQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
        b=nGRqy9ERBxS0GsFN4Eepwcy2w7T4hqAwX6bDA0DBoevDo0dI224Hfo3k1DKlkuYP0J
         5m3S4p27pZYA+b85LNh9iOfpEiN/SAVwn9hZSsGG18SrxiTcH6Mg9hNjflIGpGksZ03+
         9omSqVxn8MG+7yfvenjoa75Xa9vmU9nsWAEc7NbxSEMTranZg2hE+6JRSVQmQUz4GgBb
         +YbyTFrTVutHEKySGfl7zZXXr1y2GyrFT8GEe5Num3yOCIIl8t6F1B/x7GrvXBPGK7QU
         Wi5Jh0fNQ44PzR1/NlD35It9bV5Bx/f0rQJRnOTolcBxcuzrps0N93WnCNLJoiU1IhJF
         TLIQ==
X-Gm-Message-State: AGi0Pua+pkTmSX4Vctrz10151gYqoyvBkT82bs50ErIs7h22gMKq7g9M
        yRq0PrS1z3HEqPQsKhSdsaugxA==
X-Google-Smtp-Source: APiQypIRuEpl74OEh/r7qvhYCkgt2cE/s/0bvJj5YQ7FRv0j5NRQrJj0QGCAqQNBlGDnOqKGb1/peQ==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr23894600pgk.429.1587499217639;
        Tue, 21 Apr 2020 13:00:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 20sm2423112pfx.116.2020.04.21.13.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 13:00:16 -0700 (PDT)
Date:   Tue, 21 Apr 2020 13:00:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v11 1/2] drm/panel: add support for rm69299 visionox
 panel driver
Message-ID: <20200421200015.GH199755@google.com>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200421045508.21137-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200421045508.21137-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 21, 2020 at 10:25:07AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Please keep tags from previous versions (like my Reviewed-by from v7)
when making minimal changes.

Also there is no need to keep sending the bindings patch, it already
landed in drm-misc.

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..3ef4cc80044a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c

...

> +MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> -- 
> 2.25.1

The last two lines break the patch:

git am /tmp/v11-1-2-drm-panel-add-support-for-rm69299-visionox-panel-driver.patch
Applying: drm/panel: add support for rm69299 visionox panel driver
error: corrupt patch at line 379
Patch failed at 0001 drm/panel: add support for rm69299 visionox panel driver

Besides the broken format:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
