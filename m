Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF0B45CC2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 19:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244630AbhKXSkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242716AbhKXSkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:40:13 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A939C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 10:37:03 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id g19so3469400pfb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 10:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pez5w3jV97XcX3c3fey0y+X2jYtUTi++2V8HLPAeStQ=;
        b=ZSKJezyCV1AVGPeZm+I5cj3e7kHTG9HyQs/VSAfKDm9TpsAq2ztpPYcixreZj6SMm5
         u1uYTA1Vn1gC1re/DrHrohEweUgbbJiuBACGsonp+WNWEj4XunokDGReZQ76ta5oFhET
         niCRZukV1aacEMNGrO+SkY8p+W65a3YCCS7Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pez5w3jV97XcX3c3fey0y+X2jYtUTi++2V8HLPAeStQ=;
        b=stCwD2dt9CbgDwebkA7jeV8sUSjuWRYjOuS6Lfj+0NTg6Iq7K6Bb8dd8A5bewZEiEU
         f/8rsjXPbAWU1xQ2HpqMuhx9eJDG0OBvrql6Z2bZ6PmWqCXrJOIEG3u8AxbItJJd0LII
         vrojmzREbdv1gxKxnkJNavWEfcez43xnNuvP8ZECMp3Rvn/Mq+PVDbbtKHkHhrXjpng1
         JO/LqSuB2VNlm6nIt3AdknOhTsrpqNIExW4EUmszGcNknHcPOLOMB4UxIDxs3l8Y3Q4R
         ROriMao+w3CZuRo/97gbBeq6wjqYXANAw7VKuKcwguQdlvA4n4PCiid7dYNSLAVWOdEt
         +Cmw==
X-Gm-Message-State: AOAM533e5IhZHGCXfWkGNU0IU5loaNJ3vam1hA0qTDt+K1oL0j6SuiwM
        aRFLvjuQjk+5NeTWQwiQ5ykWnA==
X-Google-Smtp-Source: ABdhPJzMe45WLcaDbwKn3N28h2l6ZhjUT6rpImb434IcKhq4zqrVMt9koscUttYWITmtTD9bXgdCXQ==
X-Received: by 2002:a05:6a00:124a:b0:4a0:b9d7:66bb with SMTP id u10-20020a056a00124a00b004a0b9d766bbmr8381181pfi.15.1637779022751;
        Wed, 24 Nov 2021 10:37:02 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d8d8:79a:9375:eb49])
        by smtp.gmail.com with UTF8SMTPSA id rm10sm397124pjb.29.2021.11.24.10.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 10:37:02 -0800 (PST)
Date:   Wed, 24 Nov 2021 10:37:01 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     davem@davemloft.net, kuba@kernel.org, pkurapat@codeaurora.org,
        avuyyuru@codeaurora.org, bjorn.andersson@linaro.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: ipa: directly disable ipa-setup-ready
 interrupt
Message-ID: <YZ6GTe3wUU7PbI/W@google.com>
References: <20211123001555.505546-1-elder@linaro.org>
 <20211123001555.505546-2-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211123001555.505546-2-elder@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 22, 2021 at 06:15:54PM -0600, Alex Elder wrote:
> We currently maintain a "disabled" Boolean flag to determine whether
> the "ipa-setup-ready" SMP2P IRQ handler does anything.  That flag
> must be accessed under protection of a mutex.
> 
> Instead, disable the SMP2P interrupt when requested, which prevents
> the interrupt handler from ever being called.  More importantly, it
> synchronizes a thread disabling the interrupt with the completion of
> the interrupt handler in case they run concurrently.
> 
> Use the IPA setup_complete flag rather than the disabled flag in the
> handler to determine whether to ignore any interrupts arriving after
> the first.
> 
> Rename the "disabled" flag to be "setup_disabled", to be specific
> about its purpose.
> 
> Fixes: 530f9216a953 ("soc: qcom: ipa: AP/modem communications")
> Signed-off-by: Alex Elder <elder@linaro.org>

I don't claim to know much about IPA, but this looks reasonable to me.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
