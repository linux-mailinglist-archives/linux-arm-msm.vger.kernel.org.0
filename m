Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61471625E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 16:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbiKKPUG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 10:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234558AbiKKPTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 10:19:42 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC7676FBD
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 07:19:19 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id be13so8786869lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 07:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1mqXwvWmPhab1TlCcop37vPKl3pWguvjIJOUMn4sIY=;
        b=wJXspKof+l73FTF9dDPcKuE7E4CNKAsq3ftCJuptXOd8FCp98plyuvirtPcyP+90/D
         JMFS0KgrZRuIYgddBN6t5CqXKcIoMrZWbOz4M33m/JIJIViluBGPJtEKgnCZW9gYmZJE
         XL/0tSwfwYdTK1wOItD9aOfL7+Tzz9O8fUn20ODXBYPvfpEdkDn0dQhi4WDhADYXX19G
         38WFTTJ+OXs781TmnXurOELybHMIkuw17SXvPktVxUWB/xqSO6HsYx/mgC8+TEXJ5MpY
         gyvNoaFyQ9Ztf3/b7x2Ivu4XiGBcZtNIqGjdn71+/8q/hRWihQKMzi0/aMCSdQR5PrQI
         4WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1mqXwvWmPhab1TlCcop37vPKl3pWguvjIJOUMn4sIY=;
        b=WpYtn4ly62OO3D9tMs1pbnP00EH8Z0hZtVXHT4LnwnMjJsQLW/6QcMLLDhdFC9fPGo
         gJhRMGJ3WNGmJHlsiGsicmTYoqUfp6PWyDM3yp9Q3HIev1PY3hnBYMZtjepL5t3eOApD
         J5RUKht4jN/ifusppLhXVP/dpevNN862ak6ypal8ChU3QS++mZqY+efAGQeQZlu0zYK5
         DtMFecWWiOOdTbRFOU3WMpK4AYH6LipubYAZzuvxRgQNVNiCRg0xoZYMrSAiiVFeUX81
         tDAIZX/p6wQFIGw8HGTFkZUV15T1Cc4KzhZNthaWEsG34S9UIeBU2IlkSk+V3SBmh+6V
         xcqg==
X-Gm-Message-State: ANoB5pmW6vVjjnA7zq5+9N36ljcxhNK+c9r7qggzqO8tif0+nrDthsvr
        JipdFtT8VfynJbZhUJUOy2+A9A==
X-Google-Smtp-Source: AA0mqf4diOCvKO9Vx85zIQPEsX4cJK6B1dJWLmi42WV6aaRL31ikW938hGDp3uItvL9I/3P2VYb1Wg==
X-Received: by 2002:ac2:4355:0:b0:4af:ad36:7a91 with SMTP id o21-20020ac24355000000b004afad367a91mr908980lfl.596.1668179957906;
        Fri, 11 Nov 2022 07:19:17 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id p24-20020a2eb118000000b002772b70c1acsm452812ljl.21.2022.11.11.07.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 07:19:17 -0800 (PST)
Message-ID: <79d633d5-5100-f7d3-2d5f-064f896c5f2f@linaro.org>
Date:   Fri, 11 Nov 2022 16:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/14] phy: qcom-qmp-combo: restructure PHY creation
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-5-johan+linaro@kernel.org>
 <Y24Vyn8o1VkUecKY@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y24Vyn8o1VkUecKY@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 10:28, Johan Hovold wrote:
> On Fri, Nov 11, 2022 at 10:24:47AM +0100, Johan Hovold wrote:
>> In preparation for supporting devicetree bindings which do not use child
>> nodes, move the PHY creation to probe() proper and parse the serdes,
>> dp_com and dp_serdes resources in a dedicated legacy devicetree helper.
>>
>> Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Please drop this first stray SoB line when applying (or I'll remove it
> for v2).

You need to send a v2 anyway to have a clear check by Rob's bot, so drop
it then.

Best regards,
Krzysztof

