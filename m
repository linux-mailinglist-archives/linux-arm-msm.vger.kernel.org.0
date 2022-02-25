Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F92F4C49A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 16:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240034AbiBYPw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 10:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbiBYPw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 10:52:56 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EBA1DFDFA
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 07:52:23 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7589C3F1D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645804342;
        bh=yZ9EwwP+e1ZUj0BFBjKUsMj+i0Q0nH6bGL/C/aUYsK4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=vadVt/brUoVCjW7K/a44qASR/7JAZVqiOgaGEefFdRvxMQxQhprzWOe5EKYVlfl9U
         Lsf1dzCG4E4lW+PYanBQz+glsVz02wY901jd5cdBewOIkGLLsg9Fj81dyLowtXFmDI
         nWeXiEbZ7d4R9Gjl7eNzxrpPrpa0DR0j2Djvh7udRC5AYn6Atx5Qqfa9WlM1v6J18D
         fyfI1rl1Rr4PmHvQjk8sUuBadD9UAJKm5ZZfbDH8KhCILG0cBjdVZgQtgq4wzNgNPl
         el2l1Wtk3NsUi1zA1q2lqwwsPEurKLxwASaY5fkqlrTRbtZ0pF7uAwFkTHqGCdg/eW
         qb3ImNNRF1hMA==
Received: by mail-wm1-f69.google.com with SMTP id r8-20020a05600c35c800b0038118108e71so1485056wmq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 07:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yZ9EwwP+e1ZUj0BFBjKUsMj+i0Q0nH6bGL/C/aUYsK4=;
        b=HLPh8D7j9FahL6YMk3Dx5ZOGaX37VptkzvLRcoSS8XMIfxtL3pxor1+hv1CGD4GKEF
         m/j/OO5AjQvzrflQSjd1QhheSKS3TTcjuXrBn98LXcmyaduU8YKGXtZamfnFVz3jirUB
         y3NMWAf9fq75aVm9rcUUYvrTVSV/lJEmVmv6W29EOVj3mefrP/vU79gUmHxSrIzyM0z/
         3r5XxG52gcoiqIk0b3SZ4lvUdhLGVekhxyniO7y2d3umujgaxQrkI3CbiC5kKfHSb/CG
         Py7w+l03GBFQNYd6FzMb7gmCMa6fRms6XBxbqK2fPCt/KXBx0+lbuIOyXXLFmko8tzn4
         om/Q==
X-Gm-Message-State: AOAM532eOGpr06Bw0FvKeIizVmCoKbhKr/fTL1xpAm1tE/ppLfK9f2+Z
        1rF8weT3lFHJNuGxe9vy+ZnEixqkYWvjhSX/CsPgcQc643tUlx7bIBdCP3CXBYpCBgbp3oPjDTo
        6rX/yPlWcczbfDJwzfGBRY2aAS/LuwidBth/BxGqRP4I=
X-Received: by 2002:a1c:a584:0:b0:380:e357:700e with SMTP id o126-20020a1ca584000000b00380e357700emr3262552wme.79.1645804342111;
        Fri, 25 Feb 2022 07:52:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXyw01AusV2GhnVsCntKIZK4Hm/VHKopuVPbiNlfyN1OZnR5L6onnpqilHATEpOm0P2eTsDw==
X-Received: by 2002:a1c:a584:0:b0:380:e357:700e with SMTP id o126-20020a1ca584000000b00380e357700emr3262529wme.79.1645804341891;
        Fri, 25 Feb 2022 07:52:21 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c1c0700b0037c2c6d2a91sm2812638wms.2.2022.02.25.07.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 07:52:21 -0800 (PST)
Message-ID: <f4225139-502e-f65c-0ea5-58235fdea92d@canonical.com>
Date:   Fri, 25 Feb 2022 16:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document sa8540p, sc8180x and
 sc8280xp
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220225035415.2294821-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220225035415.2294821-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/02/2022 04:54, Bjorn Andersson wrote:
> Add compatibles for the sa8540p automotive, as well as sc8180x and
> sc8280xp compute platforms. Also add compatibles for the ADP devboard,
> the Lenovo Flex 5G, Microsoft Surface Pro X and the sc8280xp QRD.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - 'q' comes after 'm' in the alphabet
> 
>  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
