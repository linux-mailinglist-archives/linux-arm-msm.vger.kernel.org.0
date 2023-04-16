Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0576E39B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 17:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjDPPQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 11:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDPPQ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 11:16:29 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B818B4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 08:16:28 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94a34d3812cso533264766b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681658187; x=1684250187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHXx1WxVbkypOiNBGNUZmThAOdeRNxJAjmAdlMDMp8E=;
        b=y3/++AURgUCPvA5rkoehnh8Y+4wNGB83hhpFG8flpxl2KUPEWtMnhenneaUa0gLNZK
         YJSyvifL0yLzKUG1RdIszZ/XNU/H/mNSSu25oEuUAwzMguv7AAO1j45F3CvRkZsaAZ/y
         2aFGxubgLSTPBU6i8f70TSAxorpHv5TL16vZaPOqy2EqmmSlQQPW242EKiBLXtotR35l
         6hLPd1zbJ3AcnWRrPn0QnIi0LQB05GrSzdkPyU2ehdnPSqL3nJixE6SBG7ReIWTLszjO
         2E8YyeuUgY+cl80fzgp/HXab+y6V9O81eZahQg1y20d6OP7sSUGLAlVkjljRH12bD7Hw
         5TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681658187; x=1684250187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHXx1WxVbkypOiNBGNUZmThAOdeRNxJAjmAdlMDMp8E=;
        b=LE3rZUMIXgDcrwGDFOEqua4BEMnSyhdlzVT1sa1NeDc6X3J9AYns77twKemVxs7TRL
         LzCHBX5cYztVUo+n+mu1vcr4wKFVX5CnZow6rgpuxfCdNg2lwkvLe7bFWLp9fABIuPQb
         2tWYJSraImW44aVYHZI5Yt2CcMqLpI+sCQdFPQZJNxzrjpzbTNEVVVAf5wuNZVTPO6/o
         kkK6mjWPGypRAuLknP47OCptg4Vr6JrX0gv/sbh3+TIA1i/dzr5XmONMECbkL9FI1iTm
         k9+PQ+6IirJEg76lM+HaXc2xYTkVi8yc/VmeFJZlSxE++u9+//+U1ZF821/kWayX5KTn
         VLjw==
X-Gm-Message-State: AAQBX9ddu2h8/D0zUM0sSC6114kmzh9yyZUebssvNHS2zashWWLSu0XV
        /f+cWsYVqdNZjsBC0lHs/qhJZw==
X-Google-Smtp-Source: AKy350Yjj2QapbeVSqOfkPRK8k2YUlYOt44qontiXS8cBRH2ab0Dyuh0mT0B3la3VfYJ99s1bNZsTg==
X-Received: by 2002:a05:6402:5177:b0:506:9805:7b56 with SMTP id d23-20020a056402517700b0050698057b56mr3259819ede.32.1681658186812;
        Sun, 16 Apr 2023 08:16:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba4d:301c:484d:5c9? ([2a02:810d:15c0:828:ba4d:301c:484d:5c9])
        by smtp.gmail.com with ESMTPSA id i17-20020aa7c9d1000000b005065141d1f4sm4556224edt.20.2023.04.16.08.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 08:16:26 -0700 (PDT)
Message-ID: <4c4e4a51-8afd-c6e2-91c6-090cc0382d9e@linaro.org>
Date:   Sun, 16 Apr 2023 17:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] arm64: defconfig: enable building the
 nvmem-reboot-mode module
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230413131705.3073911-1-brgl@bgdev.pl>
 <20230413131705.3073911-3-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413131705.3073911-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 15:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This module is used by the Qualcomm sa8775p platform for passing the
> reboot reason to the bootloader. Enable building it in the arm64
> defconfig as a module.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

