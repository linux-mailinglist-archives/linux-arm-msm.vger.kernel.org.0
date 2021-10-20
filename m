Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1BD434728
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 10:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhJTIpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 04:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhJTIpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 04:45:36 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D354CC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 01:43:21 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z20so23574645edc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XzYd6rAdl8brTjw2FymUxSF2VtmMiUK06D2LEiXCAKU=;
        b=4/U+APoPsdkb+PUNwbQSXyVfBHNWvdSq7+b7ixVS2liRfK7uVp8RAfQg+ycfDwejbF
         gM0RCMuT9S0Dscc6ga6UTmr/SKbVn6yRV7BpGX959MyeD4B1SsVolw9JevXp8ozacMs7
         HagDEFltnQjewLyGW9XAaqVe8RVLFvkiZa5TFbbi6tppPgAzuF8mVDx2C1zyHYhAZl88
         Q5hltM8+x1musETOrwlm/ufYpKfXR/DzgTIsjsiigEakaFiRv5DxeanQVUzsOM7+shbH
         ihMjeOQ0Wvl9WWw/BdxY2NDE5Evw0F/0BuW14hQ9IGzNOrIbA4iNKWK26saYEr0jvkB0
         /j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XzYd6rAdl8brTjw2FymUxSF2VtmMiUK06D2LEiXCAKU=;
        b=zymyShS5xAWVYdBOqktL9iPKik/ZdxqOAVmR20EL4Ct9tNkTw8zBRNub1ljuCim4tX
         ax8AHiqSfZA5PJRq3u/JuyGKKxXhSpAAmsjH4RZDfCxbakWKK1LzA//NKLIQ04rik9tT
         R9yckDTBqGvTNIrThpTXr9V8sR+BQWgWg94NMnRNBfoH3K7ceiUvqpoelUlLrP9eqnbd
         n/AmghFB7gfAItzCO7aMER9SFiNBmgC7Au4Ivslu5pfn0QhurCna7Bbei9FEadmUQnNf
         s6mIONz9Z/8/cSDdjhn9O8/TWzSsq1JYrL1o9rDw+3YncntxOizAf1jnNJqY6+8fKB2M
         Iypw==
X-Gm-Message-State: AOAM531DuCvLhHmtCw+qcQfIL7UD82yCuAexOfmSgE53kydrkLLGZSG8
        JUmvEpLsSUiHJF5Xxia/WvDP5Wi4xR1J6ARzMiUruQ==
X-Google-Smtp-Source: ABdhPJy/TospKZ2YSzjA0jNaO8DscnS/NwxXWtCDRiUDQjWLf1iPNR6OfqzweS2V9DWO1OaiFuzjSGglkFEkdIhKfrc=
X-Received: by 2002:a17:906:354a:: with SMTP id s10mr46932850eja.475.1634719400428;
 Wed, 20 Oct 2021 01:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
 <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
 <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
 <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
 <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
 <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com>
 <CAMZdPi_J7ePh22v7J3WgqO9X3Y1KffTm__TfL9jGHj61H2x9QA@mail.gmail.com>
 <1f846b0be78560c1299fa26d351b66567be403e1.camel@bootlin.com> <CAAP7ucJBed_5rCdyjWC9x8EkXn5+E7p4P46=ukAaC1vTFLdDAQ@mail.gmail.com>
In-Reply-To: <CAAP7ucJBed_5rCdyjWC9x8EkXn5+E7p4P46=ukAaC1vTFLdDAQ@mail.gmail.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Wed, 20 Oct 2021 10:43:09 +0200
Message-ID: <CAAP7ucLCL37aYWMeqyj4eb-r6B-puZ+w9KeXMScpw3YhWgzXNA@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey,

> This is the event ring configuration in the MBPL driver from Sierra,
> with NUM_MHI_EVT_RING_ELEMENTS=2048:
>
> static struct mhi_event_properties event_config[] = {
> /*    num                        intmod  msi chan    pri brs type
> hw_ev   c_m off  */
>     { NUM_MHI_EVT_RING_ELEMENTS,  1,      1,  0,      1,  2,  1,
> 0,      0,  0},
>     { NUM_MHI_EVT_RING_ELEMENTS,  1,      2,  100,    1,  3,  0,
> 1,      0,  0},
>     { NUM_MHI_EVT_RING_ELEMENTS,  1,      3,  101,    1,  3,  0,
> 1,      0,  0},
> //    { 240,  1,      3,  101,    1,  2,  0,      1,      0,  0},
> //    { 240,  1,      4,  0,      1,  2,  1,      0,      0,  0},
> };
>

Looking in detail at the table above, I can see at least 2 differences
between the Sierra MBPL driver and the upstream one:
 * In the upstream driver, MHI_EVENT_CONFIG_CTRL() sets
irq_moderation_ms to 0, while in the Sierra MBPL driver the table
above (intmod column) we can see it's set to 1 in channel 0.
 * In the upstream driver, MHI_EVENT_CONFIG_HW_DATA() sets mode to
MHI_DB_BRST_DISABLE(2), while in the Sierra MBPL driver the table
above (brs column) we can see it's set to MHI_DB_BRST_ENABLE (3) in
channels 100 and 101.

But changing those in my setup to be in line with the MBPL driver
didn't make any difference :/

-- 
Aleksander
https://aleksander.es
