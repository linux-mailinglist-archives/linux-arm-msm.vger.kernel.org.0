Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959244735CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 21:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242837AbhLMUYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 15:24:35 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:39486 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbhLMUYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 15:24:35 -0500
Received: by mail-oo1-f43.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso4459404ooa.6;
        Mon, 13 Dec 2021 12:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LhGvUNDb2qUBD9rBv6rZtX1oyE5kPlCD9Eq4rAZyadI=;
        b=PGRMNXZGQxCRX/r1nRV4gmrDujT8tE8hN7ri3h7l8mhxdD7OzAcHSc0DkPoS7lYdnu
         WQ9OpbXQAc2i6c5Bs83lS0ie9qDPyxU6ZQJpKfropPi/djiI7V96KTPoYIejKqD6i7O4
         VFIGv+WfEOZwAjJIghSq6udSy/IR9VVkASQ7hk1zAZ0oSBIKu3jElJdsbS6OS1l7BHAa
         +cUkKsFakyK2jznYXMLTwP0yQbnsIo/sJQYs5yuDghrKa9ElHgz9uSS/uU/3Z9HCy5H1
         LTE8e77K9Vdeg6l7Zw6eRS/CpizWKoWAZQ7GoKaULy0/HKE/hmABIiQGYxm7f7GV4nsm
         AE2g==
X-Gm-Message-State: AOAM530ucCb9YpvBEQty5j9KwVXcSjoYg2bfgvmlqw2BBdzKnY2U4DnR
        AZMYmcXgD5i/kmcRhdOJWQ==
X-Google-Smtp-Source: ABdhPJy5CBy2AtPDJx7SyqPMKhOoo3LAEkkSR//lTbXBm8PXvKicjkSpnjUo6sr0bSpN5yZ4moOrFQ==
X-Received: by 2002:a4a:b24b:: with SMTP id i11mr492460ooo.17.1639427074724;
        Mon, 13 Dec 2021 12:24:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t3sm2398483otk.44.2021.12.13.12.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 12:24:34 -0800 (PST)
Received: (nullmailer pid 1510166 invoked by uid 1000);
        Mon, 13 Dec 2021 20:24:33 -0000
Date:   Mon, 13 Dec 2021 14:24:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/5] ASoC: dt-bindings: qcom: Document
 qcom,msm8916-qdsp6-sndcard compatible
Message-ID: <YbesAWThTrpKxzZa@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-5-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-5-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 02 Dec 2021 15:55:04 +0100, Stephan Gerhold wrote:
> There are two possible audio setups on MSM8916/APQ8016: Normally the audio
> is routed through the audio/modem DSP (covered by the qdsp6 driver). During
> upstreaming for the DragonBoard 410c it was decided to bypass it and
> instead talk directly to the audio controller using the "lpass" driver.
> 
> Bypassing the DSP gives more control about the audio configuration but limits
> the functionality: For example, routing audio through the audio/modem DSP is
> strictly required for voice call audio. Also, without the special changes in
> the DB410c firmware other MSM8916 devices can only use the bypass as long as
> the modem DSP is not started. Otherwise, the firmware will assume control of
> the LPASS hardware block and audio is no longer functional.
> 
> Add support for using the DSP audio setup instead using a new
> "qcom,msm8916-qdsp6-sndcard" compatible. It is basically a mixture of
> the apq8016-sbc-sndcard and the newer sm8250-sndcard, which uses
> indirect QDSP6 DAI links instead of the direct LPASS DAI links.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
