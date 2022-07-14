Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B86574B2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238526AbiGNKvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238506AbiGNKvS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:51:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E5D558CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:51:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c15so1747109ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EKF2hxWr78hWWpM47JWfd5sxYajsn2nvqoQgIyFQXzQ=;
        b=zcB/jKufoJCWNIAZnoyfbjAvgjU6EnPBSF3Hw5mBfFlIQQh4a0cae0GVdCwLrCSSLZ
         LiKIjkxsj7iZr/3rjXhLp8OMFv3msGNQ+8GvvRY+ZcIAOVEjNDHz4/tshhQLlZg4HvO2
         7GyyKqOYA4hKOAHNAALXSXC/MXfdr5/odn3tCx55b7z5TiOL3IUMLcgSIj+o1NVnTVLw
         PhrliJlxCOapPHRvcTWVDHSUV/XxGvp8VdCTojrovl51oqCTqHJ3mPjk2g3nYhCQU6Ww
         9u+xxpytoI+JzTkgwOBxMGffjy524Pc10nJVa0m1xU7h5bZdH8TSM/LHVl7rFoGBVQ+6
         VPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EKF2hxWr78hWWpM47JWfd5sxYajsn2nvqoQgIyFQXzQ=;
        b=v+1ZNPyoLD88OBlB5qb00nisAXBtkIewZXT2XKmU/nHLJOqqKsQwHMz+pkAFzBbfFe
         J6gBwHU9+oAYy8IiMuGEqsR7ahBbB78Pccv+LIx4oTrh9pylf3HI5GKq+SmXJov76td6
         8RCnJ1GhOve2EHBeH+UQ20M+wYE17YJh6pQWtE7VUwOUA+iY9dta+O0vL3ow/PHbN5ur
         M25LKpCfrFSVeiX5I313nYaJwptQHQfp8TY/Q9hIp2Mlz8E5wGKbZ+26OonrYnds0TdL
         JcuLwBksGqW2N3o5Ia0IAYtKr6oLqjElnDgpvgPuKxZJoKmp7/bIQ9S0V/D9UGgOxyHD
         pOFA==
X-Gm-Message-State: AJIora+fG5l+/qTQa/Z3g/Jhu3Xs2UEmkpwC9ySNIJzQoMk30bEHIece
        T7NdddAmoIbFj6c9hCEBn/pXig==
X-Google-Smtp-Source: AGRyM1u6H2CsK9ySyzdRHvOnSZX1xPGCVAf5kmf3IQrK0bbO1d5q55jyw/+Z5V5LZU/qTFTQxxuWjQ==
X-Received: by 2002:a2e:b0d3:0:b0:25d:6888:7c70 with SMTP id g19-20020a2eb0d3000000b0025d68887c70mr4200675ljl.244.1657795872668;
        Thu, 14 Jul 2022 03:51:12 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id v11-20020a05651203ab00b0047f9ef4cb92sm292145lfp.297.2022.07.14.03.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:51:11 -0700 (PDT)
Message-ID: <3936bd59-58e0-0493-a792-4aff4b73a809@linaro.org>
Date:   Thu, 14 Jul 2022 12:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] dt-bindings: usb: qcom,dwc3: add SC8280XP binding
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-2-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220713131340.29401-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/07/2022 15:13, Johan Hovold wrote:
> Add SC8280XP to the DT schema.
> 
> Note that the SC8280XP controllers use the common set of five clocks and
> an additional set of four interconnect clocks whose purpose is not
> entirely clear at this point.
> 
> The set of wakeup interrupts is also different for SC8280XP.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Second patch answers my questions, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
