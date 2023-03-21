Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E764D6C2AC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 07:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjCUGtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 02:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjCUGte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 02:49:34 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1E39B9E
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 23:49:04 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o12so55702187edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 23:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=k5Jmd4pcm1709BE1YBCyyYCZAolOql+x+h8LPOpl/a4pL70NBjHsS9zWG32XRKIg5S
         TNyEaglhRxhezCezs9aa9P2vZKRBuL57uhjzokgL1l5s1nIUEL9kiLWPl+AexzDeX2Pf
         neRunurxqqcpx9DaOTgkNkzfS/mfZv132VRsBOCwTqfoGHMpjEUq/FzCuuRfkMRqhtn6
         3SWMTvPar5KjcGkJwDUE07RGiTDt3Fwhx953X8ZhrHsVBQZLL+Up+vnPoSMbBbL4Cwyi
         f19LyUi0xzsi8DjN5qKzkbE7Ob/tQhvKIvtWQKi5MQwWTch+DCz1KC1TBGm3w7V2/ZyD
         rAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=OG66POo3mznnx9v8oOoKeMBAHiD9v3aQPt/7qb7bIV+ff4IndSLL3aAYnet0faZlA6
         1OZAvzaZ8rGIvdhbRTDOffeq1t8i63wSHraj9qKLjT+iRagtTegb8qETZRfuIjUVPhv5
         hrmmWQwxgWdn/RLg3onMXAoSSPQgpo4B5UD5EKefe0rXI6umQ+nv6Kq0yMdrkYwEWBtB
         hQ0+JoUmKxf+eUpEvhC4kxhsZV2aglJhxxtnp0jE10BqYMy1daMCiACFA5HxgkwCENlx
         df1hVPI34zrhXRAAp70H8m28NdUwA3w7I0yzTPDXtvlIEAOjkgsOEV8m1ag7zpK8f0oG
         7SMQ==
X-Gm-Message-State: AO0yUKVW2R/MP9DTGWfFwiFj9PH4DLtqz23R0nggtISEE8NEbXA13Kg2
        V0fWrAUmWiFbV1Rhu6l4F4WSTA==
X-Google-Smtp-Source: AK7set9PZs+7KawDTkvqPiEQrhW6ENUp8FTOEk7sjywM8QulV+EuE8QztpFZtHEXS8azKQSvYkZBHw==
X-Received: by 2002:a17:906:87d3:b0:8af:2107:6ce5 with SMTP id zb19-20020a17090687d300b008af21076ce5mr1748750ejb.35.1679381342659;
        Mon, 20 Mar 2023 23:49:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id ce20-20020a170906b25400b00929fc8d264dsm5396450ejb.17.2023.03.20.23.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:49:02 -0700 (PDT)
Message-ID: <6ce5ed8f-e2ae-f681-937b-1fdc9c6b0f3b@linaro.org>
Date:   Tue, 21 Mar 2023 07:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: PCI: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Tom Joseph <tjoseph@cadence.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srikanth Thokala <srikanth.thokala@intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230320233911.2920364-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233911.2920364-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

