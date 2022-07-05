Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A833566F85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 15:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbiGENl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 09:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbiGENl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 09:41:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C15A6568
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 06:03:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y16so20390212lfb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MjtJPlNdc7TFA/r6mXBwArnb7Txc7TLKowHN/+orGjY=;
        b=dOjkcWffxBbBIz/nZ1Fh6b0abrBBU9NeDQx6iystM1gNSpgdxaSNRvIBFJ92HxwM5U
         82VzI+6qNrNavaFu0I8viqObVZgyTpdNIY/IViO4zXCtVU86t8ydpZdzeY4Pmss93qGx
         LS79qy7BXk2unUVMfb2RbOQ/GYcRPmVRtRcjDnPiyl2obj7iCtsIQt/bBziGAny6mj6y
         pR+Pb4wrX0xEr5OVx9NbdmKpNeb1a/tbNqVPOpKN9WTd+P1MJX7UjK41yc9C6dq11/F7
         VeeHrHX/CidLy5pRfbyYHqpzmiJhNdykuj9+CgJSWbPwgCt1GZeXdGOSO0Hk+zfiCAhc
         IAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MjtJPlNdc7TFA/r6mXBwArnb7Txc7TLKowHN/+orGjY=;
        b=tfQQy781PTPYHUAoC0bVcppGzPHNU4KiD33l2+lCWzj2UR0pVhXjopqSf4X80QQx+E
         G+1TLi2kHm8TUxK8FCRAj2VUGxUHEuTLEJjaF245wjWjUBEoELSp7wY9jB2uXpCC2Sxi
         0ORgPfYPqATlCCb1x+9+5ZimsZUFHRjthDfx9KpeBymiAiUEXvkC+iNhHGa1DRTh0Gxp
         FDIGyakc61XKZXXvky5LYvzgibD662FLaTO1nZyjuoROvpGrAjh+B77mizW9JvTIkk7+
         WHDlElarPVs1EGl2wddNo9zTaQr7whTcK5buUCj5TrBXobkL8qdq06N3MQ9wwCGI1Chs
         gczA==
X-Gm-Message-State: AJIora+CRj2GZZgyRR2K3L2qFedxiKAwdAGc4p7C/FZhEcOSymv9MuvV
        /J6a+81LXHVuLhsK6a2T9RO/Rg==
X-Google-Smtp-Source: AGRyM1uK2vq7v+4meJ3BTuR/pwrb4BcnUJqgT1PVFNuI7tGm+EZHzqdt/0XGhG7MMQxNb5RbENFI7Q==
X-Received: by 2002:a05:6512:3f0a:b0:480:2556:b7a3 with SMTP id y10-20020a0565123f0a00b004802556b7a3mr21762676lfa.306.1657026218285;
        Tue, 05 Jul 2022 06:03:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p14-20020ac24ece000000b0047f8de9e6b0sm5685979lfr.104.2022.07.05.06.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:03:37 -0700 (PDT)
Message-ID: <f3e9d74d-36c9-8406-a264-ccc2e17dc913@linaro.org>
Date:   Tue, 5 Jul 2022 16:03:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] arm64: dts: qcom: msm8998: drop USB PHY clock index
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705114032.22787-1-johan+linaro@kernel.org>
 <20220705114032.22787-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220705114032.22787-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05/07/2022 14:40, Johan Hovold wrote:
> The QMP USB PHY provides a single clock so drop the redundant clock
> index.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> -- 
With best wishes
Dmitry
