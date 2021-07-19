Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DDD3CE64B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 18:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237046AbhGSQDr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 12:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351425AbhGSP7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 11:59:50 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3601EC0733AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 08:47:11 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id s2-20020a0568301e02b02904ce2c1a843eso8184044otr.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K9U1G+fYwgbItG9ePuqHimuSDkMCh9q2v+fd/TSnMYU=;
        b=yVbMUkqoG8aAUUMp+h8u8fkVLxlbQh2P7hhgc2rd70abF9xihK07p4zltiom2eF/PY
         SE40g70iY+RjZtnAPWUbLEjTiEO2PZkir7AgjvcupxFm4+hGAlaup822ZABbN/EKYuYQ
         /KJLXdcID/sFq/96pZn8YroCHUTSu5quUX88hlfUgZSt2H2Xhyrpnkh9rvjbh1uTOaAK
         hDsB33/waOvg0Gsaw8PHM4LMoGmZpnuayXwXJIvilErskWJOsSBBmTJp5T+8N2NhPuJD
         TMmzYnT4XpbbtUke1Jk3UMbvm5ug0LFchNTZl6hDVLj9Xz+kkuWXpAQDFI5+ZdxO9ipo
         Hwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K9U1G+fYwgbItG9ePuqHimuSDkMCh9q2v+fd/TSnMYU=;
        b=tMtsW1Sc5lvJmjHwDlLh01S4W5JgdieaY2TrnGLTvQjUzpecsdGD+PfWGRh27Rv8Zr
         wRlqc73IJAyKfeJ5cARZ4Kz2tFBVxup9VXvgSlb/VnJgVMn3pPphborExfLVbXOtDR9M
         06TUCpaRKLI/K4rRSZnIyXOJvmmQhp2ity5uBr7VsHIMrIeUKnYlOBSG93lIavF4ksOu
         L8yd6E68yev7LBC+iEwgaW2uEHrckyqvETSEApJyve4FAM2lb1pYzqYhZknDpEWgZS8y
         YQlqZu3D2xOtNiOqUPtreeN/2XMNuXD/5kxzuqUDJkB/7Fu2qRLDizeb++yr6EPqvOvK
         mcLg==
X-Gm-Message-State: AOAM533E/0WTme8DpvYZot3Za58QHgqGpHFsqsqZ1z/u9hsVrBEvkL98
        ciWpWlQWFJ4uD+DTQE0ZV0ggow==
X-Google-Smtp-Source: ABdhPJzb/CgKbdI3li12NH3nn29kjW7PGT1abVu7Y6tH+jXpOrVTdDpt9hB3r+u3fd4vyo1YiSPDmA==
X-Received: by 2002:a05:6830:1d88:: with SMTP id y8mr18300222oti.95.1626711133687;
        Mon, 19 Jul 2021 09:12:13 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a83sm3433975oii.13.2021.07.19.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 09:12:13 -0700 (PDT)
Date:   Mon, 19 Jul 2021 11:12:11 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V6 2/2] dt-bindings: pinctrl: qcom-pmic-gpio: Remove the
 interrupts property
Message-ID: <YPWkW5f2akHntBJS@yoga>
References: <1626692855-10194-1-git-send-email-skakit@codeaurora.org>
 <1626692855-10194-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626692855-10194-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 19 Jul 06:07 CDT 2021, satya priya wrote:

> Remove the interrupts property as we no longer specify it.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes in V5:
>  - This is newly added in V5.As per Bjorn's comments on [1]
>    removed the interrupts property as it is no longer used.
> 
>  [1] https://lore.kernel.org/patchwork/patch/1434144/
> 
> Changes in V6:
>  - No changes.
> 
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 28 ++++------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 7a0d2d8..9bd01db 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -56,18 +56,11 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    minItems: 1
> -    maxItems: 44
> -    description:
> -      Must contain an array of encoded interrupt specifiers for
> -      each available GPIO
> +  interrupt-controller: true
>  
>    '#interrupt-cells':
>      const: 2
>  
> -  interrupt-controller: true
> -
>    gpio-controller: true
>  
>    gpio-ranges:
> @@ -87,6 +80,7 @@ required:
>    - gpio-controller
>    - '#gpio-cells'
>    - gpio-ranges
> +  - interrupt-controller
>  
>  patternProperties:
>    '-state$':
> @@ -223,22 +217,8 @@ examples:
>      pm8921_gpio: gpio@150 {
>        compatible = "qcom,pm8921-gpio", "qcom,ssbi-gpio";
>        reg = <0x150 0x160>;
> -      interrupts = <192 1>, <193 1>, <194 1>,
> -                   <195 1>, <196 1>, <197 1>,
> -                   <198 1>, <199 1>, <200 1>,
> -                   <201 1>, <202 1>, <203 1>,
> -                   <204 1>, <205 1>, <206 1>,
> -                   <207 1>, <208 1>, <209 1>,
> -                   <210 1>, <211 1>, <212 1>,
> -                   <213 1>, <214 1>, <215 1>,
> -                   <216 1>, <217 1>, <218 1>,
> -                   <219 1>, <220 1>, <221 1>,
> -                   <222 1>, <223 1>, <224 1>,
> -                   <225 1>, <226 1>, <227 1>,
> -                   <228 1>, <229 1>, <230 1>,
> -                   <231 1>, <232 1>, <233 1>,
> -                   <234 1>, <235 1>;
> -
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
>        gpio-controller;
>        gpio-ranges = <&pm8921_gpio 0 0 44>;
>        #gpio-cells = <2>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
