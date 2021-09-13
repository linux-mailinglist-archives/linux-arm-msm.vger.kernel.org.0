Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B8D408780
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 10:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238081AbhIMIvJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 04:51:09 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52328
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238002AbhIMIvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 04:51:09 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D3AE640272
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631522986;
        bh=cvsTaNvz2UiyUHxrP1qTmkazHzyp2+ewfPl4qysKyqw=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=iX/ddOI0soVCVBJLKnppgpNxk3hwgSXOy1uv0upheDnJzNFHuaHhAGsbNY4MSWM2e
         ciO8V+YI4aaR+Qp713fZx24OqZc3SO9DwTUHc+AT6JEZdEsawjMTpS3lpfCOUe7sku
         HW0Yp/WAkW6dhf3IAwaaQgKvZwCJYt9Zne310MIfPq/a9n/j7blngyRl/Q0k5EIc+v
         A6IiqapNts/Q0aA0t9nMBhfRif62g2KtO/W3agtGHHZlCkdD8qmZp9B6BXs2Rx9WCZ
         1KCOpsYOZqtQMlsqFRriSrHweafledt0gE4kYLYMT5d0Cz0q5wLBhWUk+x4rQc6NO/
         7J8f8Ebp0NS+w==
Received: by mail-wm1-f71.google.com with SMTP id y143-20020a1c7d95000000b00307b9b32cc9so244046wmc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 01:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cvsTaNvz2UiyUHxrP1qTmkazHzyp2+ewfPl4qysKyqw=;
        b=foP/bPCZLA6yTGhdxkY+7jCRtsXkvQ/tXX8QmAdBOsDovzpD218uSDsK2lTq4LDsoe
         JaNlgI2dhsJ2jB9TogZg5ubPo0MyaP+4ADqwuIreDxcWT6BAa/VOXWp9IRaVmWQs+SdY
         p+ByZESAGEz9JRd0Gpo514jgOomCWPtn5ziuyGb6rG9SL7jmeOxuPe9EGPtLJ7XJ1Fis
         mPQ7TSLLQIBbOlWI4hri1vtW6pVMJwTqpc96DFxrXZOQDP1jcukNRyMNr5hlC6PqlvPK
         GuvHR2h2DrZ7BfCj46hPNnwXBrqKErzep+YDMw5gIrA2Ji/fsP6NZ1fVhUoc1dll/4BJ
         mkqQ==
X-Gm-Message-State: AOAM530G/cEO0ywu5AtQIjt/XY3IgphjPAhE1fCDn5iaLv3Ra58tZ5JX
        sYm2pjeizlwck68C0xlnwi8iiUtAj8+LZOY5FFYt1CIhvISisJFh8MpTbDf4emJOlzdyMYsNCI8
        TFpRHDUKtOI92o+lmpVY9QTWVUIv3pA1dW/NZPmf5y2M=
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr9834718wmc.6.1631522985979;
        Mon, 13 Sep 2021 01:49:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysUCxDbnakViIKz96HPA6XtGKkx8YI+rcAhRkRtTaIgEYJRWHQ/TSjMn35PEYSgfejgWgdmQ==
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr9834698wmc.6.1631522985838;
        Mon, 13 Sep 2021 01:49:45 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id j4sm6969822wrt.23.2021.09.13.01.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 01:49:45 -0700 (PDT)
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Hao Fang <fanghao11@huawei.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210911232707.259615-1-luca@z3ntu.xyz>
 <20210911232707.259615-7-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 6/8] dt-bindings: vendor-prefixes: add LG Electronics
Message-ID: <9942f964-442e-e782-3926-6d7d1123418a@canonical.com>
Date:   Mon, 13 Sep 2021 10:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210911232707.259615-7-luca@z3ntu.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2021 01:27, Luca Weiss wrote:
> LG Electronics is a part of the LG Corporation and produces, amongst
> other things, consumer electronics such as phones and smartwatches.

Hi,

Thanks for the patches.

I think "lge" it's the same prefix as "lg". There is no sense in having
multiple vendor prefixes just because company splits inside business
units or subsidiaries. The same as with other conglomerates, e.g.
Samsung - if we wanted to be specific, there will be 4-5 Samsung
vendors... Not mentioning that company organisation is not always
disclosed and can change.

We already have lg for several components, also made by LG Electronics.
What about these?

There is only one device with "lge", added back in 2016 without adding
vendor prefix. I would propose to fix that one, instead of keeping
duplicated "lg".

Best regards,
Krzysztof
