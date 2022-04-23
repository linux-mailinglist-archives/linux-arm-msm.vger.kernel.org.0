Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0896750CCB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 19:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiDWRqw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 13:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236655AbiDWRqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 13:46:51 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FA61C82D2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:43:52 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y10so22018314ejw.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=umoai+3MMlu0qxk8dS3RGbYx/7xWlXxSF/p+Tkc36tQ=;
        b=mMSgnGQ5BB4kio4uLhvAxw1k97ezG3KWGiosSAZ63q8Zi9FCb9byuDbAzyl2uKPGuu
         ULAoNgvvo+8rHa73fwtyUq+VTsTS0OTfuI1gcw6XUS3Dx1MYoS7otRK3vx1hdxaqgGky
         8NxijyMicHQoPJVz6UuX+pPuDiQ8QBSMezw0f+ubwqb3QTAm8cbbW4P6OwilH6nalPeV
         61wrr/Tt31F7Jb18LGR7s0rI71vQPf11Fx3WLtWG1OdBgm3101s+RjTSwzqxZzhSX74k
         ixHyYKVeFgjyn5yWMuTYns6o9Wv6bd4/0685Ne6Tv83UQysOucdBVrgv0DMuEq9R/ROc
         EdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=umoai+3MMlu0qxk8dS3RGbYx/7xWlXxSF/p+Tkc36tQ=;
        b=0rmqNkCHIThxA62GfXMNpxk7DkGD5/4axs+iFylYwiYfRGt0x6KEH2mm9x/iCmoSOx
         StjD8LTZ++IGgUnWvZaYPpBEEIrIb70XRrVehmyaIB3UqvkiMAon2+HkMY4Ws8KzZVEO
         hTCMF1aSnGu0P6X/lNBjC1jLfuL/tyJ4l6deqLAJfz8DOiZ+3quMV0kPaqsz0up6o0aI
         ECqKxEAxU0HHVj1JJAGHHj1Ud/SlBXyC0ueJvRgBz/B/UWISQuFIGHf1uJhn0dWFLtou
         qbm+VI2nTU3s4A7NCgd1o5IWnrakX6UJKSNdxmjRF4nkM4akYR7gYlyKIbwnAFX8nUAG
         rBHg==
X-Gm-Message-State: AOAM5326djyFmDHE5aXmftCeq0vo4XGQnlvkmEJQSD+kSVSptUMaqEeU
        Ef2xxyThmL+lo41+Rith1zhwHA==
X-Google-Smtp-Source: ABdhPJxlplz5fUNZvXQGG5M+ip/LSCEQb+5/WjryYXVYSriTE+x6zdb6+Q8B9qsar+FYm0Om+pHPJw==
X-Received: by 2002:a17:906:d9cf:b0:6ee:32ef:8da with SMTP id qk15-20020a170906d9cf00b006ee32ef08damr9254201ejb.750.1650735831101;
        Sat, 23 Apr 2022 10:43:51 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z16-20020a05640235d000b004258d76a908sm2445202edc.54.2022.04.23.10.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:43:50 -0700 (PDT)
Message-ID: <cac6061b-95bb-5887-23b3-061831a5e071@linaro.org>
Date:   Sat, 23 Apr 2022 19:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/7] dt-bindings: pci/qcom,pcie: add schema for sc7280
 chipset
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220422211002.2012070-1-dmitry.baryshkov@linaro.org>
 <20220422211002.2012070-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422211002.2012070-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 23:09, Dmitry Baryshkov wrote:
> Add support for sc7280-specific clock and reset definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Would be good to add in another patch the constraints for reg/reg-names,
but it's not a big deal.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
