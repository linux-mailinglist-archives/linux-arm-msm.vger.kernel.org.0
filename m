Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B90587917
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 10:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbiHBIe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 04:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236069AbiHBIey (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 04:34:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF8C3ED78
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 01:34:53 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d14so9051053lfl.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yIcStRv9ulCANbO8uCjB32zEZVUYQGls0B2oaU68FpI=;
        b=LharOYx++PG4xJGBwWCor32BdSD67j3bVEZQEArCBXQoeJoV6YvwqmCioZh9pe65UT
         WUELomWtAgV5nsOfYFeAVChzVoS4pwNhlK+BHeq+1XlAESPIdkqL+7N1g/jpsTegC91Y
         Cwh6sgZgJmaKkcQ0peQJ8das8vL27ZFIl+/ulrv3bVtErSt65oe4wEJd8kA08CuVMryZ
         /y5kSKTVHae4BYfxUVjc7j8F+2eZmmROPRjJAMnkGABmClvfaoJQpeYrDUd31lw+MzQX
         3dzp136+DrRYTU79ThBYQ/ObFHYtH6sEwpmM2kpeXpWZx7JVeo53oEiRQ4DOUjAZYeqI
         Rdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yIcStRv9ulCANbO8uCjB32zEZVUYQGls0B2oaU68FpI=;
        b=cFWbP5BBiJ22odwdNRZL4SzE5PQwHv0yTcaR3Vk2VL64olpbiU9ezNyXZa2SdZluTP
         1GF05FSaiFjVR6pn7mx5fSsRG2oJxv1jfGIbi4PJ/pGUBMnZx6erTY9O9OUXWTXq1cY8
         5/CBawDpXUSm2sm+ULTXo/Z0FEP9hcXTTlIh5vkx8Ss+DTmyYHm+ynYkDiSpZgqOZDmp
         yejCwetv42VhHLfh/K6O4BajMzgJm1pjARDVgRyurcNvR4dV756ABTJADO+MJ9R9oeBq
         YH74SBGyDdMe+EQ0K+cP8LK4senGmimhENL3YQCGsFubTzP4S4DtKOVPBor4QOzmsFtd
         ExLg==
X-Gm-Message-State: AJIora+teNpOUU0YMyL++oAMlGZjLQcAXxol0oE+5ilcc4/b6oEZaZEO
        QR5lYHE3AusK7N07W9HfCUb0Qg==
X-Google-Smtp-Source: AGRyM1uM4iPgGWr4Sodi73rqrFxGOSqxoKWlfh6r9yGr3qAoEULG7J9r4F+g8OXcWMDf4fRVtWXi8w==
X-Received: by 2002:a05:6512:374a:b0:48a:8c6c:20d with SMTP id a10-20020a056512374a00b0048a8c6c020dmr7040027lfs.234.1659429291642;
        Tue, 02 Aug 2022 01:34:51 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id g23-20020a19ee17000000b00489e88d6a72sm1561169lfb.198.2022.08.02.01.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:34:50 -0700 (PDT)
Message-ID: <6b4474f6-2fa6-0a86-6bd7-45d540701417@linaro.org>
Date:   Tue, 2 Aug 2022 10:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] dt-bindings: phy: qcom,usb-hs-phy: add definition
 for MSM8960
Content-Language: en-US
To:     Shinjo Park <peremen@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <84923720-30a6-1a49-48f6-96e078a46743@linaro.org>
 <20220730081536.14511-1-peremen@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220730081536.14511-1-peremen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/07/2022 10:15, Shinjo Park wrote:
> Document the changes introduced by MSM8960 inclusion.
> 
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
