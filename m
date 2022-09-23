Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B235E7A80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 14:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiIWMWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 08:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbiIWMVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 08:21:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2993DF063
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 05:15:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i26so19463468lfp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=00x2rzyfDjFqp6AOEYckdOqeAntiwXSRCVcBfwZB0qo=;
        b=lTtfB4tKxwdkAf34JSOO4o4ygB+Gd7/UQzag04ZAkF2AuaBKO7iWSIZvfNieCe2g8N
         qnKo+8ixXO9lHmeDuE2nlBcGT2D0FOvR4C6xQee3cVkQdw9cbt8gGusWxyM3P2GNVLg5
         MB3W5ce7av1jbHzN28qCCcdDmJ3O6MeNfSODva7MoefvjmOFZnT0cCu0eJj8aoNS2Lfj
         ZuZ9y9pPCO6HGwiPPNRSjDoOVjaxYJ9mmVHe6BmanArB/N2aDX6aU/3cZ9wN5Atjiif3
         UZk0qcV8VTRgHZoXjoutmYu3ZujNLXKvEQlZNmE2oqHLmGS++0mx4oIl/vBZGB0w79i6
         rAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=00x2rzyfDjFqp6AOEYckdOqeAntiwXSRCVcBfwZB0qo=;
        b=StofK6FA4tu8nvCELOvwbNUY7Q2qMzWBaKvOzSHzh+MxZF3/JHIQUPqdluU1fExWBC
         Z1lrrO6tTs+Am5I85x23TSAD3Pnak9q08krHFZTTDMhL+bHlVyFddJZ9g76wpjUfIXgn
         jbgVBC+rRTRdtFxoTH7YxKAtyHhgCKa2opvnxLRrtol5VJK9dt4eE53LIbQfgaRTQ7BT
         3f9nS5pHQcGa6y5QHDvTgsScRIozD2sNX75idmPMk8hpis1r7O4l5+Ry4QT7E6TknPMx
         UDWRn8QHitJi5TrRgve29/EOcZoRtVfbsvyOE90SvHVC3+sCpJ8YMMS6y6T0TjfOP3Xz
         Jg0w==
X-Gm-Message-State: ACrzQf3bucsp+gqI9qVMdB55cI34H/lXJjxR8PoW7y9gWJHiXYmnMw12
        Yyl5G7JSE0yGI6LsJD0CSryhQw==
X-Google-Smtp-Source: AMsMyM54CVaQVVsmlkpqenwfSmQ2advtXSWWAiuof7Vz8xa858plnq0otjny/HAlxCq4kkYhYcLfVw==
X-Received: by 2002:a05:6512:e9a:b0:498:ff3b:4639 with SMTP id bi26-20020a0565120e9a00b00498ff3b4639mr2997635lfb.388.1663935330263;
        Fri, 23 Sep 2022 05:15:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v29-20020a056512049d00b004a05c425cb7sm31606lfq.184.2022.09.23.05.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 05:15:29 -0700 (PDT)
Message-ID: <3cadff28-197a-5e6c-cbb8-eb9e816e5166@linaro.org>
Date:   Fri, 23 Sep 2022 14:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Separete LTE/WIFI SKU for
 sc7280-evoker
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220923094242.4361-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220923174224.v3.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923174224.v3.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
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

On 23/09/2022 11:42, Sheng-Liang Pan wrote:
> evoker will have WIFI/LTE SKU, separete it for each different setting.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
> 
> Changes in v3:
> - none

Don't sent the same version. Either fix what I asked for or keep
discussing the topic.

Ignoring comments will not get the patch merged.

Best regards,
Krzysztof

