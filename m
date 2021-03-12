Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E54B339476
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhCLROX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbhCLROM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:14:12 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB55C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:14:11 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id t83so17571383oih.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lfE3Tva2EoQ6qXyouptwS/JNUmC9k+8pBSYHmEHX/4E=;
        b=SPbSVI8otiDLbohvEOc1Iwd7Z9bWZ5EfV8yNdqeLw2Ko9dc68L0O7/XOy+ZQGjcrgm
         KeZr8V/zRo5/PaBF1w3DLqLBF6Khj0OZjGMRkL3LjKCkZDsgfoYtEIrRSQie8rce2b1S
         /ewv7h6qUod6oaWEyw84bmpZoqglt5VWdUeCOVskk23CQm60h8g14coAtTZlaBQ0uIIH
         kWxfACfdVnOg9XaBu4DT7RYLLTaEYPGvTH84Fn67phe8gwbOqNcXTdyUGX5JUpIy0iqZ
         Cn2bqLK4gr4V0ZL42Qf7Sk1UxhnYhePNb5Q+kF1uTumsVzdOW4p680xz6A4afiHY9lZt
         3tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lfE3Tva2EoQ6qXyouptwS/JNUmC9k+8pBSYHmEHX/4E=;
        b=TgewwfBuDf8QV0Fbs4ZYJjEx7/73AdwNR7uYitNURFpTaKR6aRjkHW+WEsA659tMQu
         UZgLrxODaBmDAOcHccURElUHT1smcj9ifgPxPhjBEvqe9niCvC3xrsw9eb303BHNCmaQ
         UxP+PgC0ukox2Uhmxd2/7M7lUAu0vO2xc5sXHsYgn89mMBJAupFO/77NMU1y6ShQ8P1T
         oWQJbdBCqibLIso3+O44822jIi0jV/yI8OTtl36XxKGDd2K4sjdeo/nAuTKbMUN67OiV
         Z7zqoLozKAzUFWoJpKYcqP6pcaIbbcYsnoPeSRztQY50JpIv09ZeoK0c6SL9vawbir3a
         2LJA==
X-Gm-Message-State: AOAM533vyJJ2X+l+vOnzSRM/3H0MKDjYBD8kkQmM0pezO8fQXhJYtJct
        lG9wPkf6Vd4w/38OB96dxydaTrgUfRxNBA==
X-Google-Smtp-Source: ABdhPJwFn76xWftUWS0EeIEao0boAwPNQUmViHSD4s5LTOSf9w1iWNRs/r2NycrT49OQh3Ep0ojsdg==
X-Received: by 2002:aca:3307:: with SMTP id z7mr10154124oiz.34.1615569251272;
        Fri, 12 Mar 2021 09:14:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n1sm1459174oig.47.2021.03.12.09.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:14:10 -0800 (PST)
Date:   Fri, 12 Mar 2021 11:14:09 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, evgreen@chromium.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: Introduce SoC sleep stats bindings
Message-ID: <YEuhYd0M0L16kCbX@builder.lan>
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org>
 <1612448508-9179-2-git-send-email-mkshah@codeaurora.org>
 <161283021256.76967.600110253862291436@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161283021256.76967.600110253862291436@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Feb 18:23 CST 2021, Stephen Boyd wrote:

> Quoting Maulik Shah (2021-02-04 06:21:45)
> > +
> > +description:
> > +  Always On Processor/Resource Power Manager maintains statistics of the SoC
> > +  sleep modes involving powering down of the rails and oscillator clock.
> > +
> > +  Statistics includes SoC sleep mode type, number of times low power mode were
> > +  entered, time of last entry, time of last exit and accumulated sleep duration.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,rpmh-sleep-stats
> > +      - qcom,rpm-sleep-stats
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  # Example of rpmh sleep stats
> > +  - |
> > +    rpmh-sleep-stats@c3f0000 {
> > +      compatible = "qcom,rpmh-sleep-stats";
> > +      reg = <0 0x0c3f0000 0 0x400>;
> > +    };
> 
> Maybe it should just be another reg property of the rpmh or rpm node?
> Then the rpmh driver can create the stats "device" at driver probe time,
> or just roll it into the same thing. It looks pretty weird to have a
> device in DT for this given that it's not really hardware, more like a
> place that the processor writes some stuff about what's going on in the
> SoC related to power management. 
> 

Given that there is some hardware (although just a chunk of sram) and
that the same driver is used for RPM, which we don't represent on the
mmio bus I think the proposed design makes sense.

Regards,
Bjorn

> > +  # Example of rpm sleep stats
> > +  - |
> > +    rpm-sleep-stats@4690000 {
> > +      compatible = "qcom,rpm-sleep-stats";
> > +      reg = <0 0x04690000 0 0x400>;
> > +    };
> > +...
