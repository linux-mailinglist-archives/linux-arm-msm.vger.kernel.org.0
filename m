Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75161513355
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 14:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343970AbiD1MJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 08:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346071AbiD1MIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 08:08:55 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199652E6A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 05:05:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dk23so9119186ejb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0UrAbzPdl4YU5SvEXBv9s3vE4LJRfTwE0ZFvZQdWkfM=;
        b=ny7d2pcANo4Dv8LnrEMQxK/kjFURhuwLPCL+N99iv2RxjHePtvo024stMr6jpCZ18j
         myYRGSgbXfFXFWVSPaJzSMxL3OqckS2TXGmbRtMftUMmxcRdKHBFUs9g/vpb25AN82CA
         9gFeT9o1jaFYeHpblKwnjkZbA7j1CS0gysnqg6jEkIbyIpCxp2kIcL0glTFxcN/1j25Y
         a3DmItNkRtxAUWNQ16rLbUPsjDMDXWxEoKakSWpGNo2ljpjhgsABqqm8R/vywVRipvRJ
         7oyJN+xxSA1QOOo6XJnMtS2GS/sDol1f4fMwtV5NkKj9Sd6eSRpwWe15x5TaOkxwRr2t
         wavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0UrAbzPdl4YU5SvEXBv9s3vE4LJRfTwE0ZFvZQdWkfM=;
        b=dU7zR4DJavhM8aLPj+ncj4Xhr2ajFm9nR32N1KdMFUx0xi6lELmYQFgJBhmFILuyvy
         x/Jxw4N9TbcY3saILZpB3hIi7DfnE+8+DMY+Gb8OjHgi66iMq++IF62/7w90AalGgXSP
         kDZKijgdG8Yh0V8lg1a5Q1Kf7Ss2JIAQwcKFITPsQUo4SbqASgZNz2HNyCjDHS+xEbom
         PnqpynYkn+KSJiNwSGpkj5IGhe3KeIybBLD3+Q/jJe27MkMq2tIpL5xjyZLWhxndxZiH
         34EbdRibkqZbPmM3znLaOr1K4A8BLPH34CnuIu+e2QWVU03Ga6CstaY5ES5S95St/3lR
         QTPA==
X-Gm-Message-State: AOAM533Pc5odjHAbicD9gSjF0sOuHy3KpSksd5693eLGCHMkwanu0Uhk
        tg7t1QyhUvTvVSuuMKGiBuR9uw==
X-Google-Smtp-Source: ABdhPJx3rioKLpmEdGpV4ydRPTKmoQ/vTCS63r0z9KpDxVgf7wRiC6tRCCHhUBgwwOuAsvArgTD/Tw==
X-Received: by 2002:a17:907:608f:b0:6f3:671d:d2f9 with SMTP id ht15-20020a170907608f00b006f3671dd2f9mr26834787ejc.675.1651147535576;
        Thu, 28 Apr 2022 05:05:35 -0700 (PDT)
Received: from [192.168.0.163] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906924200b006f3d1141693sm1941598ejx.44.2022.04.28.05.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:05:34 -0700 (PDT)
Message-ID: <08a95e20-4d1e-57f8-2ed5-d0223ae8487a@linaro.org>
Date:   Thu, 28 Apr 2022 14:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/5] dt-bindings: pci/qcom,pcie: support additional MSI
 interrupts
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20220427121653.3158569-1-dmitry.baryshkov@linaro.org>
 <20220427121653.3158569-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427121653.3158569-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2022 14:16, Dmitry Baryshkov wrote:
> On Qualcomm platforms each group of 32 MSI vectors is routed to the
> separate GIC interrupt. Document mapping of additional interrupts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
