Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9F34735C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 21:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242245AbhLMUVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 15:21:47 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:43555 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbhLMUVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 15:21:47 -0500
Received: by mail-oi1-f170.google.com with SMTP id o4so24703419oia.10;
        Mon, 13 Dec 2021 12:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bnuzIOJ2kdxbRDKBRQuo3lx9OKEj/3aSoA9HnE3CprM=;
        b=hEDho4Nw/ABhKocvLFQJf9j48JLinwNUaRTkoTwGPhIvO0RZ5VLJBooPobeJfGiqp2
         WXTf9W8wn0wa4sUOAa9xe2+TWYgP1r/mrI0Gf/g0iRfJpm6V5ek0gYA9r9Z2XlFvjOmA
         WT7AvNOtgPMkiCdOpXGiv8cBEi2O0a9/pd/NF5VeVYk+xMvrILNTCB25dPml/GxfG63s
         m2Bdm9vOtdl4GYcEUP1m1ZB6EXILHkk+BpHC5xTQ0MyxJiWaYeP2HmYhxmbJZl40uRwG
         spGqF7km/T9Wv6bW1ctzoEUp7Ei90Pnou8Skz1seUFcOcEDygKfWOpXOTgwbr0cvIl1T
         8F0Q==
X-Gm-Message-State: AOAM532ZdbuExDjew6arDF/Ntz+lDwtS0Domm3OpCPM1DLoE3ivZRr8q
        EOMuLKuWiSTMhqa2ZFmiuA==
X-Google-Smtp-Source: ABdhPJwvOnLZzWJ0KZK5wqvP/kLsevP+mX+pIDEGAdPoaRc02evNqqmQjUTBWNM1Vv6GSmsZYRT4xw==
X-Received: by 2002:aca:ab86:: with SMTP id u128mr757856oie.41.1639426906747;
        Mon, 13 Dec 2021 12:21:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bk41sm2954433oib.31.2021.12.13.12.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:21:46 -0800 (PST)
Received: (nullmailer pid 1505869 invoked by uid 1000);
        Mon, 13 Dec 2021 20:21:45 -0000
Date:   Mon, 13 Dec 2021 14:21:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
Message-ID: <YberWWoxK3hR8hHu@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 02 Dec 2021 15:55:02 +0100, Stephan Gerhold wrote:
> The sm8250 audio driver uses the common Qualcomm device tree parser and
> therefore already supports the "aux-devs" property that allows adding
> additional auxiliary devices to the sound card (e.g. analog speaker
> amplifiers that can be connected using "audio-routing").
> 
> Document the property in the DT schema for sm8250 as well. The description
> is taken from simple-card.yaml which has a very similar property.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
