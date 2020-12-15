Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C8F2DB053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 16:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgLOPnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 10:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729735AbgLOPlp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 10:41:45 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22A0C06179C;
        Tue, 15 Dec 2020 07:41:04 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id i7so3790766pgc.8;
        Tue, 15 Dec 2020 07:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=80Mc7C15jdteQdkW+dQYgsQRU8zaIe7+K7tQO+Wn2Uo=;
        b=UMXPSATLUcMYDaFa/nzhImtygo1tzlJtFDlArVQi6dkDKv3Rk9u3IpRMtQYea0FvWo
         P3sLPlm79/m1f4ANvNak1mLcK9iHyRj1GXIp1yFimwccgXZbFAX9ZNfeSTj2uBzAGOwD
         c1zSENzlgQ3Hob8dt4Wqqsh9qdkyKfEq7Q9g79Z97MQET2qjfgmnkoSYO9ITia6k9xYY
         +nSbZ1VMP3hleX+wrap0Veuaz4j+q0wAxsUMtshyag3oi5ES9BWbbK3Lm2zNRyXr6SRs
         tHGrF+LjB46+jJaX8yVVaF96rmcE2J+IepPIJlwX0Gb/PC1F8QQ1XJ+aBGgyur4f0Z3O
         1eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=80Mc7C15jdteQdkW+dQYgsQRU8zaIe7+K7tQO+Wn2Uo=;
        b=oDPaxykHbtZLQbQXku589lcjfm9/YQ2GU9+tGyEmGeGPsbwBhwPGtiklsenHlRN7ON
         wS4kd3xj4kJYmCbGsiIgAnhL12xzIgUZIZswvYp0zr39nrX5nQmfwRHD/sJNg/7sfETJ
         64HOzpPOvusk104qmrxZEhPQ75liYTooREwgMV3erpwo8scioG1lgJ571C0I/56jKL5X
         3W5NcrVY4/6W3Ems2JtmvRbfFPecWlsN8InOYOGLvtFDo2ATpp1dMxTfMeSDkqwdsrVm
         b4pOL/DNUTphlu6GPvkI4OIgZa3BKnAnYpF9NBPonRAcxh3SSo/fzdxCmlqcRXRiap/R
         VnUw==
X-Gm-Message-State: AOAM532mFt6YTT6emfE6X/4vNXiFQfTRfk/s2E7AhrTqZZDOaM3VzRt7
        nFomjBkP1dht/wiSX/12iRs=
X-Google-Smtp-Source: ABdhPJxcseeiq3CDrKpwSFVjn61QO89iMzEYpkd1btbDilDv+PAHvzJRTefOOg9lEPZM1k8L1T1L0Q==
X-Received: by 2002:a62:7a91:0:b029:19e:55db:9ddc with SMTP id v139-20020a627a910000b029019e55db9ddcmr28779638pfc.68.1608046864434;
        Tue, 15 Dec 2020 07:41:04 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q12sm8295591pgj.24.2020.12.15.07.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 07:41:03 -0800 (PST)
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Bharat Gooty <bharat.gooty@broadcom.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Ray Jui <ray.jui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com>
 <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com>
 <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
 <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com>
Date:   Tue, 15 Dec 2020 07:41:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/15/2020 5:19 AM, Bharat Gooty wrote:
> Since the IOMMU is disabled and DMA engine is on 32-bit bus, We can not
> give the complete DDR for the USB DMA.
> So restricting the usable DAM size to 4GB.

Thanks, can you make this a proper patch submission along with a Fixes:
tag that is:

Fixes: 2013a4b684b6 ("arm64: dts: broadcom: clear the warnings caused by
empty dma-ranges")
-- 
Florian
