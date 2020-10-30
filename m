Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B172A068B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 14:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgJ3NgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 09:36:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41025 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3NgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 09:36:15 -0400
Received: by mail-ot1-f68.google.com with SMTP id n15so5530713otl.8;
        Fri, 30 Oct 2020 06:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p9w7P/A2OBELZ1Bq0/ol6GtvG2PGvbv8sCU2FOhAfqU=;
        b=NzLpWHsAvYNTolBxXQtrSWMwPVeQ/wP544OChmtkBqrHfdCFRlpFyWrElvirjPgc6u
         b5mFkF7991En9d2o+Fl19m5174MdvzhXQUdtQq4fx5Dn4YxXEcpvIvfTIzQCu1u3bgP8
         UZl/cpk4hrSKB1/aFrQBjRwa9O25fhafpYir2+T1mC/glc0NSPCulAFCSr97qr4vfRyO
         gGXI2fV09UizMpz2QsXsSthmEctJzI5cc7T1YvP1xtTLS/DEP5lcGTtDwKhckC+Ga9jt
         F/leoHKQRv4Me3mdUTGEwpJ+9ZKYqyyUN4uNcztv7JMBtn3BCdHowpZ3s5HwAnUi26By
         ByaA==
X-Gm-Message-State: AOAM533EPK+s/d0bdqEgbFC7gYmBcvgIrj3LrrQ8IcY6L+r/EW/fCjqG
        SaCr3Q5HuLQYPjLOdLSD/w==
X-Google-Smtp-Source: ABdhPJwER7Xre1KClzOfwGGQrYZjpicOP4ke9dof2LTfNyTgXSG6DH5FsbZx0HdBcXQq0GPTzyKNyw==
X-Received: by 2002:a9d:12ab:: with SMTP id g40mr1787031otg.369.1604064974636;
        Fri, 30 Oct 2020 06:36:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i14sm1351759ota.59.2020.10.30.06.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 06:36:13 -0700 (PDT)
Received: (nullmailer pid 3724590 invoked by uid 1000);
        Fri, 30 Oct 2020 13:36:12 -0000
Date:   Fri, 30 Oct 2020 08:36:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
Subject: Re: [PATCH v4 2/3] bindings: pm8941-misc: Add support for VBUS
 detection
Message-ID: <20201030133612.GB3721479@bogus>
References: <cover.1603869292.git.gurus@codeaurora.org>
 <6c6bd3601ec8f4c68f581452fca3ef96f2ae94f9.1603869292.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6bd3601ec8f4c68f581452fca3ef96f2ae94f9.1603869292.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 12:18:53AM -0700, Guru Das Srinagesh wrote:
> Add compatible string that adds support for reporting VBUS detection
> status that can be detected via a dedicated PMIC pin.
> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> index e8eea83..15e3749 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -15,18 +15,23 @@ description: |
>  
>  properties:
>    compatible:
> +    minItems: 1
>      items:
>        - const: qcom,pm8941-misc
> +      - const: qcom,pmd-vbus-det

Do you really need another compatible here? Just detect this by having a 
2nd interrupt.

>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    interrupt-names:
> +    minItems: 1
>      items:
>        - const: usb_id
> +      - const: usb_vbus
>  
>  required:
>    - compatible
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
