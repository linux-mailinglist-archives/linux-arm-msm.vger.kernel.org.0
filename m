Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7155668EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiGELKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiGELKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:10:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1392B15FC8
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:10:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y16so19910061lfb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h1uZCYMbVcgEzBoqjPQ3Nkg77lCa4IHbIPp6s5QUAxk=;
        b=Ehh/BzJe5exPVrWgyNZskrC1eqkCv+7MKwFdA6F57xtVvQhzKheZ2+EXnI+jfuBJLf
         G3fFfBdy2CP2fCNGDEPsJHYMbJTf/SGV/pRm5cXtFnTCT7eDNoS75QqgrWc0g46BDWyn
         k7evhXKds25YoXws1D06tIVAdEP7WTeSGdLr1RYAEU3Oiv1tQ44TNvbeW4lkgDL3kvtm
         Q9ZnfSxBriT8pamQ0z9HqJzkkeqvGTsOKLshlSHlNbWYlNYjfbbo6XQH8H9QaLr/tA7R
         4CIsV4QqFag4ZOrDh6PSII+OeVeUV553z7K9GEVjOwRM2Q8XboEzWGPU6Ch9MmRy8KH5
         rmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h1uZCYMbVcgEzBoqjPQ3Nkg77lCa4IHbIPp6s5QUAxk=;
        b=TSW9iAEEHN4U9O13U9OSVOMVfDKAyTgqe4sKr4UsVvplya/b+gZZ4l6JX7pHG17b+L
         Hc2GsvgkzBJXl6S2FVY2CH5zO3U3Q3mwe3xW6d64Bk6sbiVQc6KDJRFX+DqgJ1ab4wcG
         uGMoynh03bO1cJyYFkkB7c5VwJrpWtzHePoZ86t26VhJCJk3fGpz5rm8HqhVm7nlpZA2
         PZLzIqUoV2NNvFUcZiD3CHIq3L79no05fw3htADoRlQCc+bPEtFkTBTc/LkiXXl9DkIT
         OMPkaOaro4eDFm9VwG6mpznaXEHHnP4FpZzkiXFMa/wuwpVf6ZwVygp6TTTWkOKqJyxV
         IevQ==
X-Gm-Message-State: AJIora9ASDyArG4zoHVO73akf86izvO9BLF42dTazWJH7LzmGl4YXfDg
        9p/afFQ7othTUPJbvAtfPSdlkw==
X-Google-Smtp-Source: AGRyM1vw/iQwvB+STxZCqb5GdkD8jTbNQfRMcjsuwyFqc1HexlQHKnSb4VMNtAeZR48M1e+DDe8iEg==
X-Received: by 2002:a05:6512:1028:b0:47f:a07e:6e85 with SMTP id r8-20020a056512102800b0047fa07e6e85mr21982127lfr.294.1657019420284;
        Tue, 05 Jul 2022 04:10:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i16-20020a2ea370000000b0025d0fbe3e46sm2030251ljn.13.2022.07.05.04.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:10:19 -0700 (PDT)
Message-ID: <6fb59f00-6c01-f0c3-9e2a-b088b97ae3da@linaro.org>
Date:   Tue, 5 Jul 2022 14:10:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 39/43] phy: qcom-qmp-combo: drop unused lane reset
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-40-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220705094239.17174-40-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 12:42, Johan Hovold wrote:
> Drop the unused lane reset pointer which isn't used by any combo PHY.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 --
>   1 file changed, 2 deletions(-)


-- 
With best wishes
Dmitry
