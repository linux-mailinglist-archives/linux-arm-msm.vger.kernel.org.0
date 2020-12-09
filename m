Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA122D4592
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 16:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgLIPiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 10:38:46 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43905 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgLIPiq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 10:38:46 -0500
Received: by mail-oi1-f194.google.com with SMTP id q25so2105775oij.10;
        Wed, 09 Dec 2020 07:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wVhLWCywNbWI0H/GiKYo0zz2L9PGx0dVA5c51bASIyw=;
        b=syNCe86C3S9civGcUT1E1qyi1O/7Udt/+I+Fxw/aD6xsz9WiH11+hOsFdT4WNlklve
         zmFaH+JlBROpkmIiFFzd2Jq8Hm9+W9Rp9Ftl2VK6WzsyaRkWWipwAc4R2FBDS42sckyb
         SjyQLu4TYI1OsfA2I4eroiDUG9tsbjMd0nPZnA5FPuFhp8IjdAbr9DJUdfkEi7ii6XDi
         zzSxUQdh/QnMRP4bcMRRLuNaRGxh0rpm7ne0np8Wb1l7TuwC/f19nE+4JNRWXgpD0Dec
         WPi05a/qM8bnfu8oPEkxwv92JEpHTGiQFTSakIr9jxNILNgRP2APt96hHpfx3eCk/JCl
         r55A==
X-Gm-Message-State: AOAM531u3jjQ4KvZg6fU/9e0HchBOOogjph4p7VqbAwbU8Gg8nrtkP1w
        0ovE6A9QmDsT59p/AdsJ5w==
X-Google-Smtp-Source: ABdhPJyk4nlvC4/cpNox4CgcwSixjr8L/4JQEndQLX/f5MWrDHdpXmdfehztc8032azHMs/gTGdZMA==
X-Received: by 2002:aca:4006:: with SMTP id n6mr2120641oia.22.1607528285074;
        Wed, 09 Dec 2020 07:38:05 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f67sm441795otb.60.2020.12.09.07.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:38:03 -0800 (PST)
Received: (nullmailer pid 493431 invoked by uid 1000);
        Wed, 09 Dec 2020 15:38:02 -0000
Date:   Wed, 9 Dec 2020 09:38:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-bindings: qcom,pdc: Add compatible for SM8250
Message-ID: <20201209153802.GA493340@robh.at.kernel.org>
References: <20201201053537.2134991-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201053537.2134991-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 01 Dec 2020 11:05:37 +0530, Vinod Koul wrote:
> Add the compatible string for SM8250 SoC from Qualcomm. This compatible
> is used already in DTS files but not documented yet
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
