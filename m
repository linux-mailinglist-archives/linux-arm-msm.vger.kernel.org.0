Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FD65B313C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 10:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiIIH7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 03:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiIIH7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 03:59:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411EE125B06
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 00:57:53 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f14so382444lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 00:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wygukOl8i/HPyLsY11Rs2ZxExJGU0+uocDld7aZ7GbA=;
        b=QT6icU9vIyeCa567TOlGxMBCIpGy4/8/UOIixR5YBeaIjuwn4u/tDQddXTwRJ5RprJ
         DTuO4Ho50oYf38S39HuhXZaa9x0kLQ/7fsHJcYAMSUE8pfEC71Rp+N1tQZICXZIzb9bj
         hbdUW/SXy2qen/houJbZYhigBwfrZL0nD4Io0i34Vh9jF4nEJfd+Up5ZcRCebzPI2ztE
         KoIeceiAx3G7xIglOhmVOquB1SuJxwf+SiqCS3WSgpotCWIc4IbLIoXHsmG4qxqL/jpo
         Le8oMFd5poC6W23yaF3MWe91xDQInJz5e5x0wVmxZINGOhRSi+B+/Jj81PhFezuzEQxt
         CRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wygukOl8i/HPyLsY11Rs2ZxExJGU0+uocDld7aZ7GbA=;
        b=FDJlgXpyG1MU2H3eol/2pUzmFPnzfmJoeR6KqPxl+eyon3W1LEm6zjxutLdkVWGkG2
         pjYZgGQ30UmY0Pj0sA1pzpO6IuHWnK+MKfcrKvWkWl8f/njBgnJr3zd42KL9l1Dl4Pz+
         Tl5B6qpWULiz99kDL4XUBmGode2m484YWG2i6du9X5TQ3E2AQIaRwRWxbuzf4VKo+pUc
         194otnLC3C4Byi3Ba2+JwZTlBToUm6L1J3KQpwC2+y4H2hO2HKWYijLnr29BHYaQXxNG
         /0TSqN6SYKUkallHat3iePgglxT+bcA52t7rSYNh/WffS4w+PoK+LdjKXS5JYyk7D7Je
         vPug==
X-Gm-Message-State: ACgBeo0MUICut+2bheOB/GBx9wovoymCBd4nXc4xC3zwINhZqwJEEDXQ
        VUuhfYxZckTp0bFAJgUAOClUlA==
X-Google-Smtp-Source: AA6agR5xMNSOZ3u7aA5rNUci374+LvDxP0r+OCliuWHoHu8+tTWvd1Hp3J5LAylJ+GtbC4ZJypj0zg==
X-Received: by 2002:a19:5e50:0:b0:497:a331:91d9 with SMTP id z16-20020a195e50000000b00497a33191d9mr4031794lfi.162.1662710271816;
        Fri, 09 Sep 2022 00:57:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z8-20020a2e7e08000000b0025e4e7c016dsm184412ljc.16.2022.09.09.00.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:57:51 -0700 (PDT)
Message-ID: <643e8223-f88f-9258-dc36-1732dfa8bb19@linaro.org>
Date:   Fri, 9 Sep 2022 09:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220908184925.2714098-1-sireeshkodali1@gmail.com>
 <20220908184925.2714098-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908184925.2714098-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 20:49, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.

There is no conversion here... Just adding new bindings.

Best regards,
Krzysztof
