Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15C81E7061
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 01:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437598AbgE1XX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 19:23:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38133 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437490AbgE1XXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 19:23:55 -0400
Received: by mail-io1-f65.google.com with SMTP id d7so392787ioq.5;
        Thu, 28 May 2020 16:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wFh6apeOWroZzQSAAuWca6xmwOwUJ+/PkpcbSDxg6pY=;
        b=POf/hVaWAUntvrR/mkiEIymNP57hYG8PeQe7ISM00RbQ79BZ1jrYXlc1sanK9OgGNG
         k42wkAp4UB5OlaYLPFWFSewkB4WrJFJG8zP2bAi0iaTM0GuPRToNbXT1c/FI/HqbVjeF
         DKEozwCNsvmhwV7EQDwpMVgURIIoqYzTi9cfCBf4RfTULj3PXjMM6J8OVQNcwsoU8pwl
         +uU1Fq5sONu73IhZdXWa6aMePWsX8162wEAUqQZCJdkAwPpdt2vEnhBxyIR/12cEUTY+
         KaduMjC9SRI0mVSAP0k5SFDPcxXejvnZNgw328ybPyFkzk6Cc5M2YiPNOlnHGC7dnUqs
         2Xmw==
X-Gm-Message-State: AOAM532iD0J///vtjkKFUsLdGLeX4ZXuG9O3YnAgahUMnI7X5Xgz/rxO
        DpAzGd1WGXxirexEa7XApw==
X-Google-Smtp-Source: ABdhPJxIq0/eVNym+owuXNhN5FkDd4KgTqCFb7Oec35W60Xs0FHxkyI1zllKkoJnc6oZpRneU+Pj8g==
X-Received: by 2002:a05:6602:22d6:: with SMTP id e22mr4376742ioe.128.1590708234096;
        Thu, 28 May 2020 16:23:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id x8sm3876714ilo.81.2020.05.28.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 16:23:53 -0700 (PDT)
Received: (nullmailer pid 869665 invoked by uid 1000);
        Thu, 28 May 2020 23:23:52 -0000
Date:   Thu, 28 May 2020 17:23:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] dt-bindings: mmc: Supply max load for mmc supplies
Message-ID: <20200528232352.GA864371@bogus>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1590074615-10787-1-git-send-email-vbadigan@codeaurora.org>
 <1590074615-10787-2-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590074615-10787-2-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 21, 2020 at 08:53:33PM +0530, Veerabhadrarao Badiganti wrote:
> Supply the max load needed for driving the mmc supplies.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  .../devicetree/bindings/mmc/mmc-controller.yaml          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index acc9f10..9058b82 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -290,6 +290,22 @@ properties:
>      description:
>        Supply for the bus IO line power
>  
> +  vmmc-max-load-microamp:

Seems like this should be a common regulator property (it would have to 
be a suffix to match up with *-supply).

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

Properties with unit suffix already have a type.

> +      - minimum: 0
> +      - maximum: 1000000
> +    description:
> +      Maximum load for the card power.
> +
> +  vqmmc-max-load-microamp:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +      - maximum: 1000000
> +    description:
> +      Maximum load for the bus IO line power.
> +
>    mmc-pwrseq:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
> 
