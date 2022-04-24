Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC3350D23B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Apr 2022 16:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237339AbiDXO1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Apr 2022 10:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiDXO1I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Apr 2022 10:27:08 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8971A2459E
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 07:24:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i27so24974869ejd.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E3dBXxPqD0YxnjHmiA7xJuHkn7CA7DSP1Z0K8k9qbxM=;
        b=H2l+U+lCGSKN9q8kiWmzMpyleSYNRaZqepbD9uGPRJ1HE2+e8UmvgvbsG/z1fTxX/u
         rjtARyPRggqwIAby1eFY3ZZMl9su4Wc3wX2jmc/GZfUvq3DO39cnfGtSrF1M+kFcQRUC
         1hs4uZZHT3S3Dav6M6OCJaZ35Z2jgainkn9e80lYUPU4z90EqEmOoNaoMtFVsITw0YSd
         dIHZXQxALR9GSVoFouZkPEyVTEglyyHva0guszaJ2ZtNBmBntfC3AMvg/chYnKzau0Zs
         kAPze2G8bZp+yR4Axxw8syeprxMp2M0lslsXpir7GSdtZB624PrNm/oKWyMyDmJ2KuHF
         HkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E3dBXxPqD0YxnjHmiA7xJuHkn7CA7DSP1Z0K8k9qbxM=;
        b=D7vmL+aW1FgPc7U8SYYxWgbAO3bcyAdxw0f0W+OIki4r8r3ycpFO7KMxx4p9ToC1jz
         r1QtVu1x3aNi1YqE0QPKq8mrZqOX/GILosUmkiNKkPikQ9mAojimRhty8LC7l3LKqJgX
         FX8sYt3pjDLG2c+1ZUxZ9z8zfNIFFlSl3b+5iRj6FOulKBo/t/pqylAYmIRosYCv6VZe
         wkubT8dhzRIALBKvXKBh4mfZ/viIIxJXlfrtmajBjF3kUvl2TQmRUSbQDZLAgQvSw0FI
         LXp6tWCxCc6A+YyKj67a7e93pED1nFwLolQT5/6HDK0wxHP6xmx8xRi0tsggfPfkl3e7
         U8Xw==
X-Gm-Message-State: AOAM530tYHhF/MCrvZDDlnBbIPqT4SoaFiSt0IwXnLxKgCGoSWtDIVLt
        6OC6Er4seQMfip7BH3ID+iFVWw==
X-Google-Smtp-Source: ABdhPJxdTQds02i4/AyRpmhPcWN+4ZJugtwd5Cr5B1fnCwYGQWhxlILkfOWiNktf0oBjp3up4GFCKA==
X-Received: by 2002:a17:907:6d8b:b0:6f0:2533:72fb with SMTP id sb11-20020a1709076d8b00b006f0253372fbmr12146376ejc.93.1650810244149;
        Sun, 24 Apr 2022 07:24:04 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p24-20020a1709061b5800b006e88dfea127sm2632428ejg.3.2022.04.24.07.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 07:24:03 -0700 (PDT)
Message-ID: <111477bc-6de2-7bc2-ae1e-f84d7543fa76@linaro.org>
Date:   Sun, 24 Apr 2022 16:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/8] dt-bindings: pci/qcom-pcie: specify reg-names
 explicitly
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220424132034.2235768-1-dmitry.baryshkov@linaro.org>
 <20220424132034.2235768-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424132034.2235768-4-dmitry.baryshkov@linaro.org>
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

On 24/04/2022 15:20, Dmitry Baryshkov wrote:
> Instead of specifying the enum of possible reg-names, specify them
> explicitly. This allows us to specify which chipsets need the "atu"
> regions, which do not. Also it clearly describes which platforms
> enumerate PCIe cores using the dbi region and which use parf region for
> that.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
