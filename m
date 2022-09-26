Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968C85EA697
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 14:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbiIZMzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 08:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235208AbiIZMzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 08:55:09 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E819410F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:29:36 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q17so7035788lji.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ApSuVze+jAnc2QxIUhDygKbIUFSeGH2UJjjkmYd3zSI=;
        b=dWMpG+eJFevYe1DDKjWzVmAZLfPpdsvzDQGoYHi2f4gX8eNpN0VgZI9l3PxzitBVch
         XQecnvgXLotQYjztAeqom51a1FkC+rLhyYdEy+jB0FB20ny4Pjhjg1qJQZDcsdWqC6b8
         hXALY7EfGGjPV9TSuSYK6ohTC1LxTT8Epa1AUqnIzqIFFY4+wyIqu2zrCPG9rDyNhYJc
         jlU7B/AwTFwTj958YxkPr+4RDb2T4ZxMvksz24+UEajn+rSxJS1A6MJr8PE0Fxtwjsms
         T91UZj+H4mos60Kpqp+wZMPyBiMz+I9U4Fs18TVeN/bu/nn4S5RruyLtbSkSAZIEEfjb
         6Wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ApSuVze+jAnc2QxIUhDygKbIUFSeGH2UJjjkmYd3zSI=;
        b=mDVjWB+13fsHBiqJHugE+ADuyc/tX0z6z/pL0oq5rp2Oi0ZR/jEffcm5hG7lZ6NC32
         fATU/NB+jNS5GWzF1NMr5Y57hmaMu7QCqMLveN9tRC8rmt+aMidcj9WgGjAQhxbTudlS
         jdiHN5Sa0R688OsYK9amBPtZpclJsLRUkGZY5hiW8WPmv6lQNl38ehMbdMO/ciq7qCXy
         9DF4Mjtq/QM0tbsVFcdrrHtGyJQ1MURpEpHYSzmuHaMPporHAea+exjJ7Onk/bc++Gzo
         JlZt/TtLpUlps+r0Uemd4q6XQrf6kIgOe0v6Sdxh9C5cD5ZqFj9lknJlGtRWRZaAxGFU
         ACAQ==
X-Gm-Message-State: ACrzQf06kIH4cWvXP+QWsftd8VwaQn+c9Ks3dVI15oM46z/RuLsvGP5f
        4Ft5f1ITF7lSzaF54T/uCKpgxA==
X-Google-Smtp-Source: AMsMyM6FDEihqoEtiiXC2bhgnGHeDNsinnMNdg1jBBIlpO6Vz26TgaV3keOLrvWNax1QEke/zOd+mA==
X-Received: by 2002:a2e:8496:0:b0:26b:f230:a55d with SMTP id b22-20020a2e8496000000b0026bf230a55dmr7118641ljh.466.1664191699956;
        Mon, 26 Sep 2022 04:28:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z17-20020a2e4c11000000b0026c2fec2f8esm2337806lja.84.2022.09.26.04.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 04:28:19 -0700 (PDT)
Message-ID: <b20a9c47-d10f-c71b-2491-8b5f322bc346@linaro.org>
Date:   Mon, 26 Sep 2022 13:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] dt-bindings: dma: Make minor fixes to qcom,bam-dma
 binding doc
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, vkoul@kernel.org, agross@kernel.org,
        dmaengine@vger.kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org
References: <20220926112200.1948080-1-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926112200.1948080-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 13:22, Bhupesh Sharma wrote:
> As a user recently noted, the qcom,bam-dma binding document
> describes the msm8974 BAM DMA node in the 'example section'
> incorrectly. Fix the same by making it consistent with the node
> present inside 'qcom-msm8974' dts file, namely the 'reg' and
> 'interrupt' values which are incorrect in the 'example section'.
> 
> While at it also make two additioanal minor cleanups:
>  - mention Bjorn's new email ID in the document, and
>  - add SDM845 in the comment line for the SoCs on which
>    qcom,bam-v1.7.0 version is supported.
> 
> Fixes: 4f46cc1b88b3 ("dt-bindings: dma: Convert Qualcomm BAM DMA binding to json format")

I don't think examples are worth backporting. Other than that:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

