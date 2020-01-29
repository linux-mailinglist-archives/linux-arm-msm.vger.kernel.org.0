Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 530BE14D207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 21:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgA2UiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 15:38:21 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45859 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgA2UiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 15:38:21 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so230351pfg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 12:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I/3MIyesWwLMZvoquoi7/37fnkG30lH2RtrUZl2JY2g=;
        b=RCII856zNQ+5oofjSFPKITF/gPTInLOj3Bh8ZgmaHEk7wpcvKCtOUKUxi5Fazcpk2x
         jG+C3Ps8b6d29UipkLfgcYTpH6UEhv7b4AhlR7c9O3RWekLCn6gki/XcsACCuIrSgef4
         dwsyBtU4SN7Piz79NMuLyKVtBEcqEN039rBOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I/3MIyesWwLMZvoquoi7/37fnkG30lH2RtrUZl2JY2g=;
        b=eWrqi1EdbpRpIKIxmpwmuDridR8xwimUMWhMxLSlvgsRtrDIB7VUbO7iq50Pi6C/3D
         yboZIMGLvsol6L8qRiKoYdvP0qnUodFTflmmr0SqiB77n8meVSTX+OANoNL/MpznJFbf
         /Bqg9FIzIdOVoRGXLachfsbkeJUVdZqPep7gjYLDMTpVT2AmFN9iE/3EzNOFKd43Itj0
         gAZ45XJCME9xIG3TX/NMksxa8l0SNFGyeZa+3D9lCb2bH7bFAk6FHEC7mzX+VUng936t
         J2h8UdU2rsg8b5khypyYmG4kVezS/C0MUTxmxgbl5dScPguDYX3GXIIP6zHDS8I+pQ+i
         9lhA==
X-Gm-Message-State: APjAAAV0GC4ZAX1WO1j4HsL7XmZ3QJ7WSu2iF9wqVTItRYCLlAD1Q+Iz
        I1M/yRJrFk5mxqzMwnnfFWPD7g==
X-Google-Smtp-Source: APXvYqzTw+xm1aPbfFtOpUBNxbQQnU4Kqem8ct4fM6luLP9FdjijLkOJpwXwa0gAgqPC142Zo9Dy1g==
X-Received: by 2002:a63:1f21:: with SMTP id f33mr918798pgf.91.1580330300869;
        Wed, 29 Jan 2020 12:38:20 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b185sm3644304pfa.102.2020.01.29.12.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 12:38:20 -0800 (PST)
Date:   Wed, 29 Jan 2020 12:38:19 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/8] dt-bindings: phy: qcom-qusb2: Add support for
 overriding Phy tuning parameters
Message-ID: <20200129203819.GE71044@google.com>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-5-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580305919-30946-5-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 07:21:55PM +0530, Sandeep Maheswaram wrote:
> Add support for overriding QUSB2 V2 phy tuning parameters
> in device tree bindings.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 43082c8..dfef356 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -80,6 +80,28 @@ properties:
>          maximum: 63
>          default: 0
>  
> +  qcom,bias-ctrl-value:
> +    description:
> +        It is a 6 bit value that specifies bias-ctrl-value. It is a PHY
> +        tuning parameter that may vary for different boards of same SOC.
> +        This property is applicable to only QUSB2 v2 PHY.

As commented on 'dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings
to yaml' a possible improvement could be to restrict these properties to
the QUSB2 v2 PHY through the schema.

> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 63
> +        default: 0
> +
> +  qcom,charge-ctrl-value:
> +    description:
> +        It is a 2 bit value that specifies charge-ctrl-value. It is a PHY
> +        tuning parameter that may vary for different boards of same SOC.
> +        This property is applicable to only QUSB2 v2 PHY.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 3
> +        default: 0
> +
>    qcom,hstx-trim-value:
>      description:
>          It is a 4 bit value that specifies tuning for HSTX
> @@ -118,6 +140,17 @@ properties:
>          maximum: 1
>          default: 0
>  
> +  qcom,hsdisc-trim-value:
> +    description:
> +        It is a 2 bit value tuning parameter that control disconnect
> +        threshold and may vary for different boards of same SOC.
> +        This property is applicable to only QUSB2 v2 PHY.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 3
> +        default: 0
> +
>  required:
>    - compatible
>    - reg

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
