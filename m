Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BA97CD6FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 10:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjJRIvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 04:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjJRIvq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 04:51:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F9B9D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 01:51:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507c91582fdso430711e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619101; x=1698223901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXI4HfIXwanv99cOv9efEkDM5+V1kS9Jv8riF+5hsvI=;
        b=lQ4rPVReMIqjyasQVHeAS0r1YNvIRsFK0WavR4MtJZFV7lcDzwg35etOgByaU4vtHa
         MJhVqxtYDvecztwT/TCVBNDPD7R11BZeQPVDiZH5z07CANUG+/ifXQZ018NzGOWgGV7a
         1YdD2Msly1HP+gtOw79+sr8+laXd9N3u+geWwmh5M3jVtIlV0aKTAkZMhIEcSMFKsBb8
         cVpn3jLSSILi7DaRRYIkhwCeTkUUnXeu6DLQpg6J0nBvtBeiAFsL6/0tzBIL+E6DVNY2
         TsX9BAg0opvA0EjFWV3Xj7vgrjXM2CuRJqUZ7CLmnYJve/ZSx8mzQPkIxrqisVyRcyZk
         j/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619101; x=1698223901;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXI4HfIXwanv99cOv9efEkDM5+V1kS9Jv8riF+5hsvI=;
        b=umz+SpQSZuzdfiMX7L09tsGCZQ9CC06Ppi1vB9wzLZXRGQXiltzfBGf2hvUSAjPtAx
         AA7+Y06qZfolRFCX/O6vXQHr4gwS8bSLOm2alDCKetb4uL9Wv+uBLYBqj/Duqo6r5M6q
         JiC8pnn38mcwCOe93hmbI1MJetceVsivOLZfzTZOfPO6jscxyVffIJ0hDS+JyCMi2274
         /fFMezPOcwdB39TRXXIDY39durBhUTAz6TB1bTlBiUNQ9eiNVXWm4KVDcgAqvWCnUEm6
         JxTEivwjT3bWZjequ8bUmSePfzuklrn40FV+QgnQUyRr55aRb2rHxVxUpGhDTkbJ5VrJ
         aDcA==
X-Gm-Message-State: AOJu0YyQwNqyrX3Q3seWYBOG+xhF5YTOohmhX/1FExpxPuFdHc125SgS
        /4MkLxX9+mPkzmhk/tWGEZXAtA==
X-Google-Smtp-Source: AGHT+IHKWyECjBrhZqfAsv9Y/nGjP/98hBlZ2VRgG7KqWNz4HLJDcK61sC8d/IqMDm6ZtNVxr43osw==
X-Received: by 2002:a19:f70f:0:b0:4f8:75cf:fdd7 with SMTP id z15-20020a19f70f000000b004f875cffdd7mr3351906lfe.22.1697619101558;
        Wed, 18 Oct 2023 01:51:41 -0700 (PDT)
Received: from [172.30.204.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x20-20020a056512079400b00507a3b8b007sm615700lfr.110.2023.10.18.01.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 01:51:41 -0700 (PDT)
Message-ID: <9dd20d48-b517-446a-b740-4f409c7bcea2@linaro.org>
Date:   Wed, 18 Oct 2023 10:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: lpass-lpi: split slew rate set to
 separate function
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231013145935.220945-1-krzysztof.kozlowski@linaro.org>
 <20231013145935.220945-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231013145935.220945-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/23 16:59, Krzysztof Kozlowski wrote:
> Setting slew rate for each pin will grow with upcoming Qualcomm SoCs,
> so split the code responsible for this into separate function for easier
> readability and maintenance.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. None
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
