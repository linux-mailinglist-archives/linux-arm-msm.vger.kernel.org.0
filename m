Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0225073A493
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 17:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbjFVPSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 11:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjFVPSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 11:18:06 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFD8E4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 08:18:05 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51bec5c09ecso738813a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687447083; x=1690039083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TP/3FQHMmn6RlV6mzj99uRIgWCscxlsWWyg8WN59HdI=;
        b=lJIK/yH3nbnXvWsDZuW+QWrf6YwAPDDc8/1G8lsfca1YAW88nTfJO8BXwgLKVc4saf
         dRUddeuJGjeXzDOEKUvXZUC/DZkf69bo8VrYUbMCY3XaTSO6CUYrvAI4MNL4UZkKzf7J
         iAUCXxZ6x5hw3A3hdhfxe7ARP3A6YOnLgmF2/jLT2D0T6VeTC/zQKjbBXX1xy+xX/Gmc
         Ay9g8RP4jpdK1vi4We93lj8Tuh2nph6vOOv1KuPXfScI3VlS1xYBQrEXEfsJWEzaKZvA
         56gnd/Q7FIEicLm7c84+9swor0NtEcWArj2+Q7L9DGh7NkXFXStHIPobtQYLa/IPTDbn
         E1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447083; x=1690039083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TP/3FQHMmn6RlV6mzj99uRIgWCscxlsWWyg8WN59HdI=;
        b=GvohEGVSBaCPg4xA0n6WZu2f/+eogyRD3o1e/I59AiKMPSydVoFNT7U2QFW+/6ve3t
         dULo9w9qaltbX3FcjAaHD8FL6XedyJJpBSywvZO2GWz+2/9Y90c5VGEBs+GshIPZzeGT
         cNyhdI6sM0G1MUmWL+h2Pn/otrcj+AWbPTRbWDrQj//4egLxIQFQ+/HyUrAp+qVgopV2
         M+Tw/1EdxJG8dD37ykGMLiqf0RiyaezSblka3QdIC1WDgjz9aaTS6Eajb9OLxvGW3npG
         TjTvDTOnBgFLF5RwPAAQgOucbTqNEAcj/WwTRNOc1PFC9ibuInIWLON60SIlNOZEuFl6
         3FyA==
X-Gm-Message-State: AC+VfDy6ynfn8uPxVFh3OBhMCok7xMy2nySj6Y5BpJJtCiicdhIvft9a
        kD67mpBqTjsT0aCLgRXpXkHtjQ==
X-Google-Smtp-Source: ACHHUZ7HTn1t0/6v5JA/MdJ0FjEHkC3btRqN4bImVtZYQPsAKKnKoK87PYfs9u5bd+kjU5xHuSTSpQ==
X-Received: by 2002:a17:906:6a07:b0:989:ca:a0a2 with SMTP id qw7-20020a1709066a0700b0098900caa0a2mr8810615ejc.69.1687447083554;
        Thu, 22 Jun 2023 08:18:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906230f00b0098807b33996sm4679533eja.107.2023.06.22.08.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 08:18:03 -0700 (PDT)
Message-ID: <ac12c499-a4d5-74c7-42ec-f9789253108e@linaro.org>
Date:   Thu, 22 Jun 2023 17:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add
 accelerometer/magnetometer
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, soc@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Joe Mason <buddyjojo06@outlook.com>,
        Siddharth Manthan <siddharth.manthan@gmail.com>
References: <20230622000007.48219-1-linmengbo0689@protonmail.com>
 <20230622000418.48350-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230622000418.48350-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2023 02:05, Lin, Meng-Bo wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> gprimeltecan and grandprimelte use a Bosch BMC150, and fortuna3g has
> ST LSM303C accelerometer/magnetometer combo.
> fortunaltezt and rossa have only ST LIS2HH12 accelerometer.
> 
> Add support for them.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> [Add LSM303C]
> Signed-off-by: Siddharth Manthan <siddharth.manthan@gmail.com>
> [Move sensors to fortuna.dtsi. Disable them by default]
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Enable on grandprimelte. Add LIS2HH12]
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
>  .../dts/qcom/msm8216-samsung-fortuna3g.dts    |  8 ++
>  .../qcom/msm8916-samsung-fortuna-common.dtsi  | 80 +++++++++++++++++++
>  .../dts/qcom/msm8916-samsung-fortunaltezt.dts |  8 ++
>  .../dts/qcom/msm8916-samsung-gprimeltecan.dts |  8 ++
>  .../qcom/msm8916-samsung-grandprimelte.dts    |  8 ++
>  .../qcom/msm8916-samsung-rossa-common.dtsi    |  8 ++

Your split of patches is difficult to follow and understand. You bring
now, within your first submission, few boards. Then adding one feature
to this board is not a separate commit. Commit, so a logical change, is
adding a board. Please organize your patchset so it will be easier to
review. Now with such changes touching multiple files, seems not
organized correctly. Your previous patch added multiple boards in one
commit - also not easy to review.

One commit for the binding, one commit for each board. Optionally common
file could be a separate commit.

Best regards,
Krzysztof

