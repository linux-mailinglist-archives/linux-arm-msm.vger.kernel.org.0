Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4335F39B0CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 05:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhFDDVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 23:21:46 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:46052 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhFDDVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 23:21:46 -0400
Received: by mail-oi1-f169.google.com with SMTP id w127so8415098oig.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 20:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTLBAwmqsG3vEJ4E4BdrtXVL2NeOeIgl+wmT0+LyvMk=;
        b=AQvU2E2DBR78Ykvj2qLHtpb2LgMH7EVti1dRcbTmuhm5gNebiFl5ExGpyRLziKTFZp
         E95YFVmuiqVwABsG3QViv2WD3FMnjyYBrtHRxXBggGg/+egbDA32c0TVIUdm8KCXJVhi
         x+3T7L/CHVFKHY5dAaLkcx+s+jaxxfvZwWqWfzMapHj6SGcUC6qMRh1IupTyAdWXgdc/
         oFdikrJpH6WKufIMZMVbt49C2FJopa7z6LcOyqGEEQpUaqFqGT7rG93RUz6DWT/4VaKP
         DcL5BwQEWI62dNFNrCC/grf3xmcAEXaBySnaTHppUz4gK9Ed4gJ4MMEIxDAozUOt/cQT
         jADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTLBAwmqsG3vEJ4E4BdrtXVL2NeOeIgl+wmT0+LyvMk=;
        b=sHxAbMe5es/ANYMwYu+QJXznEvmHVtbfVvJT0F51xKA59lCrFOxU7/DPeOYMsyUlFs
         outN9GtCir/dMWGR9IPd7kQ88LVuE/Z8VxBrMXxyB3gs9vhyMqRoQz1InJ9S6MsJukiR
         jBpey8UUGHjtiSAJ3iAyAPXmwREIFGzFPE1d6LLtfrjNgCn7tXX/QTBh7YhRXKZReK7q
         3PjoIyuXD/YkJ28tMwX8/Ow+xSGwCmRu+h0y9V2PVKUGFXgRy7v5cKxjNoI1sETZoN6c
         8zuyOMqj3ZZ3Hf0ntkxM0G5OFoOYfxIf+QbMcmq/YmbrGGH1fdfEgoV5m5a8M+JTz3Al
         7tAw==
X-Gm-Message-State: AOAM532uirEKCbonz2It0LJ0+m+wpGvHLhqzjOnGr01bdD+z7Q/WmqtQ
        TqxucI21m3I/In+WIm6dqgSZezxv1Q7yrp6djdQiVA==
X-Google-Smtp-Source: ABdhPJzcMqINfAPFcCbEC12gkbN5NqzJM1RhTsVmVuiZUMohZbipEZxJMYUD0qnQChKUKe6fRlpUPJq80TheN/gzEcs=
X-Received: by 2002:a05:6808:f0b:: with SMTP id m11mr9178581oiw.12.1622776740786;
 Thu, 03 Jun 2021 20:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org> <162261866806.4130789.17734233133141728573@swboyd.mtv.corp.google.com>
In-Reply-To: <162261866806.4130789.17734233133141728573@swboyd.mtv.corp.google.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 4 Jun 2021 08:48:49 +0530
Message-ID: <CAH=2Ntz7=e8w1fvXtpe-aXUFAreOiyb=xxKvU_1pmzBHyVXitA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Enable Qualcomm Crypto Engine on sm8250
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Wed, 2 Jun 2021 at 12:54, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Bhupesh Sharma (2021-05-19 07:36:43)
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
>
> Can you stop Cc-ing the clk list? It puts it into my review queue when
> as far as I can tell there isn't anything really clk related to review
> here. Or do you need an ack on something?

Sure, I will drop the clk-list from Cc-list of future patchset versions.
Since I had a couple of clk driver changes in v1 which were dropped
starting from v2, I thought it would be good to Cc clk-list for v2
(and so on..)

Thanks,
Bhupesh
