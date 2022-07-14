Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DB35748DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237814AbiGNJ2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237907AbiGNJ2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:28:25 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DD52B62B
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:27:43 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u14so1484444ljh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5kERBfu2u0yQifkg6NJHXWKfySdIdi+/ghX35tJ7sns=;
        b=ZD/rQ7+fU7naryuvlDTHSHK2WIkXmueWVrFilteyC14gChElaaePf6ptschFP+oBNg
         FFbiOYXdlXVtR/YFcY4cpSZx84Lb0V+QzyvtQEI8NTHqz4VBYw2U53o17LfujM0xwRWc
         Da7c+3FbwC34Otb+ie6jqUJliW6r92HGVWVBi5fcJee1FU2CSKOHBV9jDxuut5FxcMDr
         rHV8jnNqLz1IdfAY08kjdKeDkwWinpidL6Be0W1Y2E3RKvto5B6AF1Hrja80SW33253i
         TYu2ITeJUSxLGijI5BF3Ug8R7JUkJNjmiK567hl0IWZ6YUfbqZdfmWIkU8gVmRC9c/Vq
         ulOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5kERBfu2u0yQifkg6NJHXWKfySdIdi+/ghX35tJ7sns=;
        b=Vxzbt3biB2e48R/ZGDkNEyxYo26N/9QyM3P2aAQoL2pFo0OUbuIQEPDM2v8EZnCd8c
         aSU519IxATvu6ZvkU0aD2o6mBccvlqdfwezBcWRYIQNwOZjQqxkBmB4c9VA8s89Kok72
         Wb0L4erCVNpsOR4bfZ77BG8nqeKxfks+DauHcWbG+15dQWhHG6Xfv2n/ARaN1iom2DLZ
         a49GYYdaehDtrhh4aG+PfcpzlwtKN78rlSemPyMOTZoKhLCVvRSzzfDbgNPMflDduLPO
         7H0d4Wb0d6GOTU/49RW4QyEcZRrgicyVfolNohbZw2+7hbSBr6yWdmyHKVWyKIs6XMmN
         G6NA==
X-Gm-Message-State: AJIora+/TgOuh1j7p5Hm2rvh0/5CKbSmTEbkw5WHgFxo01MONPSKZ2Ry
        glE7v2f0WtIi1i41amBQoMvB5w==
X-Google-Smtp-Source: AGRyM1sLRCOfta1n0D/DoStdCTk99jtmvBTjUIbBApC3ZbGXq7Fcamvwx+mghBTI2BNoJd8SWvVL2Q==
X-Received: by 2002:a2e:8850:0:b0:25d:6777:3156 with SMTP id z16-20020a2e8850000000b0025d67773156mr3878547ljj.106.1657790862361;
        Thu, 14 Jul 2022 02:27:42 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id q9-20020a056512210900b0048905c6103csm261418lfr.9.2022.07.14.02.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:27:41 -0700 (PDT)
Message-ID: <704147ea-3f8f-4a4c-7e21-bde919ffbd76@linaro.org>
Date:   Thu, 14 Jul 2022 11:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 24/30] dt-bindings: phy: qcom,qmp-usb3-dp: deprecate
 USB PIPE clock name
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-25-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-25-johan+linaro@kernel.org>
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

On 07/07/2022 15:47, Johan Hovold wrote:
> Deprecate the USB PHY node 'clock-names' property which specified that
> the PIPE clock name should have a bogus "lane" suffix.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml          | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
