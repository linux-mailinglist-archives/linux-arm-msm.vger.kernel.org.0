Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6EF616F37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiKBU4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiKBU43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:56:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5886262CE
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:56:28 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id z1so6764439qkl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXaTqQMSB6hK8loYpSwRgRTmm6tfLwGGmxbJhSSNS3s=;
        b=ytNqlRVySr85I+Qa8Irt/BNZJn01KmpooRo/NhrlHmSE/MhvYBO4rP7rpephRc1Jb+
         p6qO8uE6T36mpmpqeObh+iJHjiDk6ikhpnaWr1epir/jK2f07wCMdE9T5LtNbbFNzN0U
         FUQ3iU9PnugYigl7cT5FlpmjYHCTJv93vgQBTPdC5niTdo94POoWp7GEypDSNe3xBK1O
         AY0X5c8BqOirGBefRxcprArFwcsmw7yZ66Qg/no/KaEC1ptM5xcT8GgPEXAXU7ljsO0B
         5d59eSdaeh5b0ymolqTW2jxgUJlasM9W1ocwzBZXprq7AakMd9eRkKwGM5Zxpatud0rj
         EWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXaTqQMSB6hK8loYpSwRgRTmm6tfLwGGmxbJhSSNS3s=;
        b=DdoUhONKm21LPXUsHzqfQB69CUJjFdn4rbzxCJiufL2wz8CiLoWsG3m7KZHetFbGz+
         jml/bi+ObL8OVn3YAFctXgTE95mFwa/xOKuRkO03hfO6joDnjnO+Au4QMWa0O7cIxnxr
         PhlIEhB8BysM+PdvQ6r53DqI6bmtKCp4QHfb7bBOgOzZyoMJE0YnA+rUTSO1C6yA6Fus
         2/DWmJv0av7l9PrBfFmTPbdtZhePAoO24sHwhOYy/wYL29QBeMySgS90XfRBmCx5bXil
         NS1vzLGvbyNanxbCajxWzHDlfkLE5gyqw26exoilysUbziBhUAnL1EiZ+qvjr/3DNeG4
         2b7Q==
X-Gm-Message-State: ACrzQf1RT+akGB8+Q84cc5b8KSYDr8LrcAxuxMkPoLOltlz3Bkf/Ip7f
        F+PKfKglRGQ0lnCLVSjCntGnFw==
X-Google-Smtp-Source: AMsMyM4EeLR1tI8FzAkA5+DmybB7IVuiMLaqywlHHsJRS6oTbfaHD6FMDYMNB50p8rJ7c2S3wbHwVA==
X-Received: by 2002:a05:620a:d55:b0:6f9:fadd:4762 with SMTP id o21-20020a05620a0d5500b006f9fadd4762mr19429978qkl.335.1667422587543;
        Wed, 02 Nov 2022 13:56:27 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id l2-20020a37f902000000b006cea2984c9bsm9138468qkj.100.2022.11.02.13.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:56:27 -0700 (PDT)
Message-ID: <1a3a1080-9bae-3912-d815-47b221a99e82@linaro.org>
Date:   Wed, 2 Nov 2022 16:56:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH v2 03/11] dt-bindings: arm-smmu: fix
 clocks/clock-names schema
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
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

On 02/11/2022 14:44, Dmitry Baryshkov wrote:
> Rework clocks/clock-names properties schema to property describe
> possible usage cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

