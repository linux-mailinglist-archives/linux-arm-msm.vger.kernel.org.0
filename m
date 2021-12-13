Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632634737CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 23:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243785AbhLMWpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 17:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243783AbhLMWpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 17:45:16 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96ADC061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:45:16 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id o4so25111231oia.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 14:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZAGpupmE58tiiF1IrnuYNItgVr/me2iTuZtboJFJyj8=;
        b=ozfZXbnFnFpMaeH1yXfAvcBVuAkg94fLSzFhtWeD/Y7zPBhjx1irHgrtMkv61pS6ej
         lyGHHzB8MMAq4iZyvnMUBPyA0ZoRI/UJmwwIc3wirCywPC5QTkF7QafmspTXPDo5jGHL
         mIqAj9llTuzi2n3tPBkza+3uaegZDhqkUGBtx6VADne0o8FEOp42DKZEuy1uuQcvZdZ2
         gUrKZYtLrgDgx1ajzC5+2I5Gu8KdYr924DcyOBsQynG8mEoyePkzqIGlemuRDYt4RIRJ
         ghHvh5b8inCTmGXMQouGJTTLojltm7HZNENY7RkAioSz1ppXk8wyHZpgRQT4fnmS5P/t
         qarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZAGpupmE58tiiF1IrnuYNItgVr/me2iTuZtboJFJyj8=;
        b=MDkc29z5Rjjv6nOYUYExqGvagx52eURONQCUWonDgKch3MdUI0vDe3BVOwutASQd0x
         X/sYfeWNMN53Dupro/c8PCG53UNY3q5HNhx+4uD6rTp50ZSCUAmnC/BZutAA9Wnm2972
         gbYZBnTdnYLThyDPe2/5AkdruaFCel2moYsspza/lV7WuVOKqzZCvFidBN0McjJwrsaw
         o8v3EAhfz+smK9Z4SX9TPsIK5DZ0vPBokxMuKsWwvYw41bblLlAkWZUeqK5qvipfdNns
         vFZ786QcN2NOP/gkTq42OdASHshheSjibaI2IYuhSCfwrp9zeQ8io8S9nLhGtM0bip7y
         JBEA==
X-Gm-Message-State: AOAM533e55AxsbN8tXZm4aZx3tM+2ZmouLPSEUBbZWYYdcX0T+Yk4JFb
        Bl3cLTo+QHK+94N9Z/Vgwss4EQ==
X-Google-Smtp-Source: ABdhPJwpK+XmytwVOGn9TpyTH03MBGU917LNMYGWdZGosJtWbvnRo2z05N8w+/p9Vis1JRwyfQJjkQ==
X-Received: by 2002:a05:6808:114:: with SMTP id b20mr1212242oie.95.1639435516005;
        Mon, 13 Dec 2021 14:45:16 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t13sm2936066oiw.30.2021.12.13.14.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 14:45:15 -0800 (PST)
Date:   Mon, 13 Dec 2021 16:45:10 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 bindings for SM8450
Message-ID: <YbfM9uqXGDcQZ7xS@builder.lan>
References: <20211213131450.535775-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213131450.535775-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Dec 07:14 CST 2021, Vinod Koul wrote:

> Document the compatible string for USB phy found in Qualcomm SM8450 SoC
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index 20203a8a9e41..0dfe6914ec87 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -20,6 +20,7 @@ properties:
>        - qcom,sm8150-usb-hs-phy
>        - qcom,sm8250-usb-hs-phy
>        - qcom,sm8350-usb-hs-phy
> +      - qcom,sm8450-usb-hs-phy
>        - qcom,usb-snps-femto-v2-phy
>  
>    reg:
> -- 
> 2.31.1
> 
