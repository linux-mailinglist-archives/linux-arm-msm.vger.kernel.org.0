Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFC5185183
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 23:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgCMWGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 18:06:41 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39592 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgCMWGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 18:06:40 -0400
Received: by mail-oi1-f194.google.com with SMTP id d63so11113788oig.6;
        Fri, 13 Mar 2020 15:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ilzS0hJrGQZ6eyLJRBMPCbAkFbNW8hu+JqnsWG5936I=;
        b=FMB1uWI5bE3snfrdo8OWuN5f+AQegdsYzLmOpXmzCBaEs3zaLgP6YckrC7824RnDWm
         5PCAtaW9fUz/I14Ke83ThYWmiW+KSnxVhahqOOmoSfGlEOQbgfRnqCpfAtyL+iKAjz7d
         YXluz5F2azda8faLqdNDyHDDRxP4mNKKDhx5+TGvuZCpp9bsi6Le8GqEkfT7JitwWhgP
         5aQJHnrU7aVKWRz+TQcHN3nLIQRnka1Qs6kcd0bFQHVzDadim32980TMnqj3i4rxcp85
         e3vb2ZlLpJyf4KUIggSg3HB/QxSK3pFAkD++52/r9/zubB6i8Bs81IVDmZ57yafoSqh7
         ZYHQ==
X-Gm-Message-State: ANhLgQ2GR2ZDcfG1GqZ7MMBkuZ8Zfitc9eCGGIO2yzVmUW2/glrVPxrD
        qeHq45sbWVjyQ7kw5g1e4Q==
X-Google-Smtp-Source: ADFU+vuN0h/7UXuNud4g4VDHnWNmJuW+Wfhs0pZvp6rDUJ7bcR6HzbpLy9YcuoijqL6RjgUhj/8JYA==
X-Received: by 2002:aca:5ad5:: with SMTP id o204mr8463583oib.2.1584137199554;
        Fri, 13 Mar 2020 15:06:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w21sm3324370otm.10.2020.03.13.15.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 15:06:39 -0700 (PDT)
Received: (nullmailer pid 2933 invoked by uid 1000);
        Fri, 13 Mar 2020 22:06:38 -0000
Date:   Fri, 13 Mar 2020 17:06:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, c_skakit@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH V5 2/3] dt-bindings: geni-se: Add interconnect binding
 for GENI QUP
Message-ID: <20200313220638.GA30287@bogus>
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
 <1584095350-841-3-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584095350-841-3-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 13, 2020 at 03:59:09PM +0530, Akash Asthana wrote:
> Add documentation for the interconnect and interconnect-names properties
> for the GENI QUP.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V5:
>  - Add interconnect property for QUP wrapper (parent node).
>  - Add minItems = 2 for interconnect property in child nodes
> 
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml       | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> index 23282ab..533400b 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> @@ -46,6 +46,12 @@ properties:
>  
>    ranges: true
>  
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    const: qup-core
> +
>  required:
>    - compatible
>    - reg
> @@ -73,6 +79,16 @@ patternProperties:
>          description: Serial engine core clock needed by the device.
>          maxItems: 1
>  
> +      interconnects:
> +         minItems: 2
> +         maxItems: 3
> +
> +      interconnect-names:
> +         items:
> +           - const: qup-core
> +           - const: qup-config
> +           - const: qup-memory

Don't you need 'minItems: 2' here?

Rob
