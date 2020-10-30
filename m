Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3502A06C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgJ3Nvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:51:47 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34011 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3Nvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:51:47 -0400
Received: by mail-oi1-f194.google.com with SMTP id l62so1047666oig.1;
        Fri, 30 Oct 2020 06:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fOp8wF+mYRdkZQyKm6YlHyZ6sSxqVonJHgcczPIIlJY=;
        b=tmh9NoUYwZ/+E9WyGwoxj6eCxKghW0RvCAJitCHmI9rERF0+LtLAD7OMr4ckh5L0Sm
         vzdJpUo8+naHMp4Mwzzyumg0NpUCbv9BgS81wCzBEyYVaAD066NDYAoXLwNz2xUBZSen
         D6ZHKaofSlfrn3wDnI6vh5QJEEFYZqCpnibnKvHjhg2axB3AIipnF8hApz1lqqpQ5muY
         8cghWtPMgqJ114Z/gxuiZ5koSHXgnQ6zYNEFKmKj9v6AdjFuolnokIyU9KzLDMe2fY7a
         vLj3rqK3As6UbcMZVHUR85TZaFKv7XzGh3Z8QqbxKVYB/nxew3tay//pPrEgKPX6wbMC
         XYNQ==
X-Gm-Message-State: AOAM530DKEBQz4/tgqZy+bgxWxknPNrlnC/ViWmhHjviAvESyrtl6OZL
        914eUL4ul1Cw4DpRUsRang==
X-Google-Smtp-Source: ABdhPJxdgaqg6BQaRr0G41HPbiJrDzh3f7LxIXbiRhBt4PMiv0ZL3FCxwGlG1tJFIhobX0i4vIiZ6A==
X-Received: by 2002:aca:ad48:: with SMTP id w69mr1793858oie.38.1604065904866;
        Fri, 30 Oct 2020 06:51:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 104sm1390512otu.81.2020.10.30.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 06:51:44 -0700 (PDT)
Received: (nullmailer pid 3745737 invoked by uid 1000);
        Fri, 30 Oct 2020 13:51:43 -0000
Date:   Fri, 30 Oct 2020 08:51:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, sboyd@kernel.org
Subject: Re: [RESEND PATCH v3 2/4] dt-bindings: clock: Add support for LPASS
 Always ON Controller
Message-ID: <20201030135143.GA3745549@bogus>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
 <20201026120221.18984-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026120221.18984-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Oct 2020 12:02:19 +0000, Srinivas Kandagatla wrote:
> Always ON Clock controller is a block inside LPASS which controls
> 1 Glitch free muxes to LPASS codec Macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     | 58 +++++++++++++++++++
>  .../clock/qcom,sm8250-lpass-aoncc.h           | 11 ++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
