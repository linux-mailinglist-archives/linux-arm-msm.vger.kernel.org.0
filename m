Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478BB154D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 21:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgBFUpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 15:45:51 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46713 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgBFUps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 15:45:48 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so3324194pgb.13;
        Thu, 06 Feb 2020 12:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uZYjSiH3XWQR1AQ+aOWLLH8qNKRv66c457dG/e/iBCQ=;
        b=UF4+CyhutzVFPw0k6MR5n67PJV8ObSkvgKMLBZNgL4Hqag/Li6qmWuzRYCSe5Mokvo
         NWvSKbispsN6Z8Oiv52WGe2/Z/3R3Vj4m4H8UDqZfNaB+lMWbLyILmGF/ou+lYvhdcfG
         qTWvEN9rnGTEw/pp6p3vTTwWuGwxAAj1Lwqf5cXierJIgc+ikuRWCM4S4CnOsUtSBgl1
         3Zm2VMYMfStvdWcbICdAXZlNVPSijcJyLnY05XEgtDRJb+FM2EQQO9+tQkuCVUD0CgqY
         exu8nDdHQr3gKn5L/Auf3exwmuxDTKZFrc6pVgHja3fe0fRMBTc5y/cZuF2iAGXSGSiR
         tECg==
X-Gm-Message-State: APjAAAVhq7XccHBAa6tYO0e2Jg7kBs4rCleq5nPx440tYqxwnjZTHvSi
        5GsK9r2jHekkMWoVoxgupeW36Rhu8A==
X-Google-Smtp-Source: APXvYqyt3hO12aCjMUyuWWO34YNsjGU2LbcEANvSDEEpEsNJVU3KoZRM/djs0hF17wMFMbFXcsWVRw==
X-Received: by 2002:a63:9313:: with SMTP id b19mr5458024pge.273.1581021947057;
        Thu, 06 Feb 2020 12:45:47 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id hg11sm170432pjb.14.2020.02.06.12.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:45:46 -0800 (PST)
Received: (nullmailer pid 17814 invoked by uid 1000);
        Thu, 06 Feb 2020 17:34:10 -0000
Date:   Thu, 6 Feb 2020 17:34:10 +0000
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: qcom,qusb2: Add compatibles for
 QUSB2 V2 phy and SC7180
Message-ID: <20200206173409.GA8698@bogus>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580305919-30946-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 07:21:53PM +0530, Sandeep Maheswaram wrote:
> Add compatibles for generic QUSB2 V2 phy which can be used for
> sdm845 and sc7180.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 90b3cc6..43082c8 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -15,10 +15,17 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,msm8996-qusb2-phy
> -      - qcom,msm8998-qusb2-phy
> -      - qcom,sdm845-qusb2-phy
> +    oneOf:
> +      - items:

You can omit 'items' here.

> +        - enum:
> +          - qcom,msm8996-qusb2-phy
> +          - qcom,msm8998-qusb2-phy
> +          - qcom,qusb2-v2-phy

This should not be valid alone. An SoC specific compatible is required.

> +      - items:
> +        - enum:
> +          - qcom,sc7180-qusb2-phy
> +          - qcom,sdm845-qusb2-phy
> +        - const: qcom,qusb2-v2-phy

Is your intention that qcom,sdm845-qusb2-phy alone is no longer valid? 

Rob

>    reg:
>      maxItems: 1
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
