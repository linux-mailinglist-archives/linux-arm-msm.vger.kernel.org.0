Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFB24AA37D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353207AbiBDWrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:47:23 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:39593 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352937AbiBDWrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:47:23 -0500
Received: by mail-oi1-f179.google.com with SMTP id s24so2563048oic.6;
        Fri, 04 Feb 2022 14:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HZfguTfgWCuKRWP+WHKK6V4whe3Vz4TRGXSVnClY05U=;
        b=JrEX20OQFjFtuJ/01FxyII9O9Q1QDFb9M6zH/ztR592TrCWYbOsFMybWiMgdhHvHP/
         CXETQADg18wYwnGtvI8P3t69+sxuJN9tzX4RdXQlnQJpCeKRKAZVgUlI36qSenrKx/LM
         sBRmuj8unvXvAb+ICuvpKrIcJvzO/tT9kY39KjPMbGBnj/HexAlUNOjJeOhfrVfk49tD
         WnoOOsLJuqmQnKI5ETJ1/O0ivUhk5wbSjsIpmeur0K5VGDh4eQs5ZaOoiY01i1ZUHIGw
         yhcQvvrEzQyXuHrgxTXciPw8wAsoC6GPMXYvNH8Ehwwd0WDPW/jJD5Fho+Cfv4IGPKZA
         vc3Q==
X-Gm-Message-State: AOAM532kDUBD9HkcKT0nOtzS2y0H6MI6hWmGwqZ0urI31rF6YTul0nSG
        DvY0J+aBaoXVCf3X9PaqZHTtmghC/A==
X-Google-Smtp-Source: ABdhPJym47lqoiLpf4qFOuNW6OqTZBhPrY56JuMU7Dk3JPNFbrMFmZFNzpuXSV35NKFr9BGpwx6riA==
X-Received: by 2002:a05:6808:a96:: with SMTP id q22mr602980oij.276.1644014842789;
        Fri, 04 Feb 2022 14:47:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a42sm1035808oap.6.2022.02.04.14.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:47:22 -0800 (PST)
Received: (nullmailer pid 3325251 invoked by uid 1000);
        Fri, 04 Feb 2022 22:47:21 -0000
Date:   Fri, 4 Feb 2022 16:47:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Michael Srba <Michael.Srba@seznam.cz>,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: gcc-msm8998: Add definitions
 of SSC-related clocks
Message-ID: <Yf2s+RlIHZOnoyv8@robh.at.kernel.org>
References: <20220202113722.7550-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202113722.7550-1-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 02 Feb 2022 12:37:18 +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds definitions of four clocks which need to be manipulated
> in order to initialize the AHB bus which exposes the SCC block in the
> global address space.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  CHANGES:
>  - v2: none
>  - v3: none
>  - v4: none
>  - v5: none
> ---
>  include/dt-bindings/clock/qcom,gcc-msm8998.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
