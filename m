Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874F96C00EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjCSLm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjCSLmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:42:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396221CBDE
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:42:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b20so3706657edd.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYpFGS1UeXIwWcTkvPWAxNglHd4HA0NJO1B7knmB2bQ=;
        b=Lekp+Z70cS84SGL4OYQIjjeuyDHlkHqrFTBDKtxkptWf7FBGOYrJ8e/8roNl/lUi1V
         MCtRXEp7pzvS4TxSwHBtqvVAP+zG7Q+uX3gRl4ggOMUTWUM6G0RJLfPw5jFVUQTQcIzE
         HSASGA3Ga44Y6+ZcqyHO2LzeXqFcRxJcO+VOepj4QLBbMx+GHp3JcFPcJp1MSPWBjGHN
         GwchWis3IFRhBcmWI7hxJKprBdwSADxO0Eb1tgR/wiBOTrv6UK6RbHxm4/WhFOy2f7tr
         L71YQvbj3hF9U1oq1bsP56lTl0C/HYAN3fkyM+2DoLehXgHHiizSJ4Y1JRg+pPN7MyvG
         nC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYpFGS1UeXIwWcTkvPWAxNglHd4HA0NJO1B7knmB2bQ=;
        b=iMqQsnggHjAp/rlqm9ptjnJbm05SyFDaHDiKULR163tL1L502Xl3GbfkA638VA606j
         rAx0wz2ZRf1mmo/bHoZCiNTTu01o+CYqfAegBISx76mQ4H6SIW0Gv6BGo/Fw13/VSy/v
         3bY6eYyrprg0NrmAufcEsn1mTA3nd3Dkr7fJVIqUinWfZ90SKT5IN5RJ8Sr3E7Qmv1nN
         whnYJIRNH++z/j2asE6lr06TTFdJNf/TO0pkfNkZ+jYVWeFfHvASBXmfgSQ+urcksh0/
         yMPP/VNvJEMOH3B6meWLQQ2euQFFYBJRfltBLpw6Gitr9Qa6vc8l9UU3T3RqDeqVUaWM
         PPAQ==
X-Gm-Message-State: AO0yUKXPnWpOxKbXRt4z5SgrkBYfeCLiw/rhjv/NsNyCzxeDIYjFiOMq
        H08slS24kf5rKt98ekNfIW1Y6w==
X-Google-Smtp-Source: AK7set/nAdKcN/EbrOMv038RS7r7034bKgLWG/MOu4gs5Art727TtvaVPK4HlH7RScG007/t1PboMQ==
X-Received: by 2002:a17:906:86c4:b0:926:c7ac:51fd with SMTP id j4-20020a17090686c400b00926c7ac51fdmr5279751ejy.44.1679226136759;
        Sun, 19 Mar 2023 04:42:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id b17-20020a17090630d100b009300424a2fdsm3182476ejb.144.2023.03.19.04.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:42:16 -0700 (PDT)
Message-ID: <74671c69-4019-fd43-171d-9a3365d9e528@linaro.org>
Date:   Sun, 19 Mar 2023 12:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/18] dt-bindings: regulator: qcom,usb-vbus-regulator:
 Mark regulator-*-microamp required
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-3-bryan.odonoghue@linaro.org>
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

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> The VBUS driver needs to know the regulator-min-microamp and
> regulator-max-microamp so they should both be marked as required.
> 
> regulator.yaml defines those two dependencies so include regulator.yaml.
> 
> We need to change from additionalProperties: false to
> unevaluatedProperties: false.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

