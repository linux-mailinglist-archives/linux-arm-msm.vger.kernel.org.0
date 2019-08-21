Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E41498451
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 21:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbfHUT0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 15:26:05 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35299 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbfHUT0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 15:26:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id g17so3171665otl.2;
        Wed, 21 Aug 2019 12:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=31kAASnlmey7+VCJviKm6PqV+O7d5lyZM9klemAH6PU=;
        b=k+dycsrIIgTr4OMrQppvHOJ17hQ0d1gJsesQa/PUzRVhUe0znWT2C6MMJ5nDxITDV4
         jnf9JZvwTMPh+Sz/QvD3j+Wa2mUfKWZMbzpO8RPnjhzHjo6KiAnPMubaaiyj8r+WIHz3
         WmLTct+riup9vBATZrT0HtJGU9sn0GzqXpOJNSKSA4w6feadlu24Ziy0gRsNv5ThMne9
         +bH6+yDrg01gw9LPERm78Pm3BI/q6jwZRBCTS2bAPoiZVEjpcQX/JBh6R52/eEDZ0Ea6
         Ho+PVomzZEHsJJ9BgFm4XJFUzDzwR5xsu3UzYqCsbzJLfC4e/F3qQrYuOxoatNEEqw1l
         +5ug==
X-Gm-Message-State: APjAAAX5PbR86iTcSSO+vtYz6K8c5SkSvNxbybnfwPuFLU2GQcaBxjFm
        FUPAA1Xw8kjMEOvMIgFd+g==
X-Google-Smtp-Source: APXvYqzOtUjL/X6asaAboZrcr1v3bqEPjWihsqkP7DwCext8H0Eiet7bQrEZgyN6a2WJGFJwVFXJmQ==
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr14908615oto.84.1566415563945;
        Wed, 21 Aug 2019 12:26:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e22sm5992200oii.7.2019.08.21.12.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 12:26:03 -0700 (PDT)
Date:   Wed, 21 Aug 2019 14:26:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, jcrouse@codeaurora.org
Subject: Re: [PATCH v5 2/7] dt-bindings: display: msm: gmu: add optional
 ocmem property
Message-ID: <20190821192602.GA16243@bogus>
References: <20190806002229.8304-1-masneyb@onstation.org>
 <20190806002229.8304-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806002229.8304-3-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 05, 2019 at 08:22:24PM -0400, Brian Masney wrote:
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v4:
> - None
> 
> Changes since v3:
> - correct link to qcom,ocmem.yaml
> 
> Changes since v2:
> - Add a3xx example with OCMEM
> 
> Changes since v1:
> - None
> 
>  .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index 90af5b0a56a9..672d557caba4 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,6 +31,10 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>  
> +Optional properties:
> +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> +         SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.

Sigh, to repeat my comment on v1 and v3:

We already have a couple of similar properties. Lets standardize on
'sram' as that is what TI already uses.

Rob
