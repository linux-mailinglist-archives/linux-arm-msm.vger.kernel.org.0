Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31075F3D06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 09:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiJDHFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 03:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiJDHFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 03:05:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8FC13F24
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 00:05:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id k19so729538lji.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 00:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jzMalaKHtcyjpdkJ9aqJfOJDj5m18SqEdVKlufQo18w=;
        b=JJKfdYfxegSnk6O7MG4eYy5u/GR/WGyCZ2qqTIxz4RwfkNj938Jlec71aSK+5kEkVz
         U4ndYfH6xLct09CrNFXcB0ldLU2+xGgSuBpSgI7I49XiXVsQ5hTsZDjiVkHQveSwnQqi
         XzjEeFRzcusi83nHO3Lj8AIzEJMache0FSLRknq3+Zy/eGujTQrjKZQhnYRdBb2b7iTL
         rA7NbL9Aa0GhCKsPSDqpi8DPqDf4oF1SODRGPQher05RS+udoRlpTTBHRWGQzf9b+lA0
         5GmcKhlPN7heozLRlNZZyr0+Ls6axhm3og1cNPRYLePRbEx7x99vn0Cp9PNSG+vnKdGM
         4Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jzMalaKHtcyjpdkJ9aqJfOJDj5m18SqEdVKlufQo18w=;
        b=PE5gYDAXXxbQEdcUqN72hatjOgcj9gdPxOfoU27C1JQxtk9TtyIEAfiiYJLVMFBUPe
         iXoqFz8tRItwEjTq4bhIEtGMbNXq7DrLazbPOJk4+dmWPwffPvDjbd/BcU1wT+t5ZWqw
         L4sPlZLM0b2g7tGdBqdVZmEiWnZrcIl034QPcAjINN1YFvaLbtqDV8/El4z9Stq4KtI2
         KqhwuwGq1NDjaZs5yPq3vupV3oF3+/0sVZomvWvKUcLoUwzBBFgnxLae/86U2qwzpF1+
         theWvCuvjQz1JPXIspAE06WogEfmZelGEjQEG8c9wADZ3rRk1Bt2u99wLgbIEDmc0c5H
         D75g==
X-Gm-Message-State: ACrzQf2ijx9vvsmvnNeuoh3vBptumlrwR+4iD10R0jc6HRODyPg06oCL
        S0k8c4LxW+DB9B8XdZCbgjds0g==
X-Google-Smtp-Source: AMsMyM7nwhROyPipuTPgoJikv8ubv2vKDxfJ3XRBgzzopGfQqZ6jJFYV7q3gM0rEBXXy4l5rM+6zfQ==
X-Received: by 2002:a2e:be90:0:b0:26c:4622:36db with SMTP id a16-20020a2ebe90000000b0026c462236dbmr7408515ljr.448.1664867119685;
        Tue, 04 Oct 2022 00:05:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bi12-20020a0565120e8c00b00492e3c8a986sm1782821lfb.264.2022.10.04.00.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 00:05:19 -0700 (PDT)
Message-ID: <9d6651cb-85cb-1616-9f7f-d626ce8fd616@linaro.org>
Date:   Tue, 4 Oct 2022 09:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: add xiaomi,sagit board based on
 msm8998 chip
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221003185500.928608-1-dsankouski@gmail.com>
 <20221003185500.928608-3-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003185500.928608-3-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2022 20:55, Dzmitry Sankouski wrote:
> add xiaomi,sagit board (Xiaomi Mi 6) binding

Start with capital letter and finish with full-stop.

> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes for v3:
> - remove unused 'sagit' compatible line

With commit fixes:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

