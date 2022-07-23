Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E053E57F0CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 19:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238214AbiGWRuU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 13:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237240AbiGWRuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 13:50:19 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028D4F5A9
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:50:18 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id e11so8737859ljl.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dXhrdiRI9A20uuxwcHnJ6f3EhQO6j60PAoiG1Gg6iYM=;
        b=g1Ev3rBtwAUypYUSkAxCireQPKQqCV7NOTSN8gloW7I3b/RI4Tn79K5Q51/QjCRGx8
         JRlpqX8EJJIG2ozT+RBtw2yjRKaowrtNS43to6bpU0/B+8FFIgk0G7I/ws+zD+2ghKbI
         jpHMRV6xmHkY9ELIw3pS5+jB77m8lmbfoV0QF/tkmbo5If3w5cX/L+BFR/ejoGmN3Zwr
         vwBLpmUMQLhTI4TgJRZWQWH2g3IIa4qsstpjSnoSaVKvEg3uSuRNl6MsBEOcwn9b45YG
         F88R+/MsGXSvmmXxBxtjtMtf9clXv4+TA2GCmyMYrjMbfZpTKLI3OYS67Txv6BZ8Dg9l
         BrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dXhrdiRI9A20uuxwcHnJ6f3EhQO6j60PAoiG1Gg6iYM=;
        b=CumAY7H/+M6ae1N4tHi6mMIUXTk57GFDqOJw0Xh4MK1Ph0MI9i+B/p+xqiZ1dBxXDF
         iPjTsQNErJWfuH1MW8Vos4fHIWbG3POklf6IbkrmhCSHrrulf+DQc+lUB5WSijpFL4jD
         fMaR1rRC4zyY8nAoJ8hLZ5ZZ+aJmYAPCWvviakn8X0nB/hIiZneEflw9cv+mdwXE6Erk
         0GZLnuo82vci8SugP+hgGiKGEZMDs3v/ODV+8y+sgFkS5vPhsAAE6KH3udRsN84kswaG
         8JVe1vDmIAAGVy2LnoiwBHwCaLU3xsqcQ0QO6+ApNINPIdEgCR/LarxrqsE/finNpaNe
         cUWA==
X-Gm-Message-State: AJIora9K0nLSywE2OVaaUH3cz/o0ht7/dhFjpTmKjXf3abqeF8DzcQwW
        g9C2Zof/ftbeETl+YOW/pgo7hA==
X-Google-Smtp-Source: AGRyM1ur6jK9FMp/FydnyQdfxh47/TWfiVvJtSR9MCuC3wLRzjTZKAQL2QL9LuZ6Kj895NNYNKviDw==
X-Received: by 2002:a2e:a990:0:b0:25d:5e37:1746 with SMTP id x16-20020a2ea990000000b0025d5e371746mr1862518ljq.34.1658598616139;
        Sat, 23 Jul 2022 10:50:16 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id b27-20020ac2563b000000b00478ea0e4f66sm1750258lff.169.2022.07.23.10.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:50:15 -0700 (PDT)
Message-ID: <7f041a88-08ef-1819-b5f2-08b6086aadde@linaro.org>
Date:   Sat, 23 Jul 2022 19:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: merge simple platform
 definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <20220723090942.1637676-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723090942.1637676-3-dmitry.baryshkov@linaro.org>
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

On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> Merge most existing Qualcomm platform definitions, which consist of
> empty schema plus single SoC string.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just oneOf:
 - items:
     - {}
     - {}
 - items:
     - {}
     - {}
     - {}
 - items:
     - {}
     - {}
     - {}
     - {}
 - items:
     - {}
     - {}
     - {}
     - {}
     - {}

and all boards and all SoCs are handled.

So unfortunately that's a no.


Best regards,
Krzysztof
