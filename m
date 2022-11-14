Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24FB6283F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 16:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236412AbiKNPcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 10:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237237AbiKNPby (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 10:31:54 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E784B2E68E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 07:31:50 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g7so19888411lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOWBKmXybEX1OHhK1KbtYTt3hmjgbm76+zxfNN+3ArM=;
        b=kwAl/fBziCR2zSE2ZWp6HT+geZ5LGV8FdVEUMhnkFGi/c4tKLFIfK0n0A8SqcouoIQ
         8lTcjcK+ZWWkdmgWKnH8HCHb5lvjkcM5JJN5Fq+F7x/vkFTjL43kvvpNOWGliKZGd8mr
         l2cy74ROMHl30KG7dkgQW2l8khdv7kDC/ixrxKtZLFpcIEP7ofdghDSNUtK8x7zmSMXv
         eK04mUnwvsn50DQBEV8lmDBohBJF7fJWn1OmlDVZuCe1dyo83p20ecKkB4WBWVd7GqLL
         75pGfqXuDWnTYrBYVlY6p9SFfoaOzJYgtJjofIFBs4TZXwzKejhC6Bzv71zrO6lf43uD
         2EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOWBKmXybEX1OHhK1KbtYTt3hmjgbm76+zxfNN+3ArM=;
        b=IlTBnFA6doxOtCyvo9jpRYJUfmNc1bWsKaB9dyy434FK8hkSQidJk1Aogw8SEloT+y
         KqLemTem4lVIR5Wkc8NZdjgiSY1YPxZe8hsbUO4bkA4C2pG7npqHmyrNH4GHDGVbaEkK
         +n7x+xZhpuyOLLPNSh1uz1oNLhNy94C/L/XjFiN/NFYW+Ksis9Tp1hsVSlVZPzzn3Cp0
         7gN58g5O1x7DXJbTU01W6cpkjb10qCQ3SpedhCus0Zvo+vTeF88vNDVbu7stM+SUZrox
         CDxh7TKOhfXDQlfu1uxrPnz2jhZ0/IAc5i9yH1LxT/R4vuNEkImTevyXzSevGv0IFqSA
         D9kw==
X-Gm-Message-State: ANoB5pk5Y9oFh+2KJym1kTK0ccTcNZns03m8AZcGOMAzOZPsLsp8OlKr
        Y80bHWg7jlC6x2LUjHurbydOkA==
X-Google-Smtp-Source: AA0mqf4CVE/dg5p7b2shK5W+v5UBoaFtWwkBelND98rOl5lom/mY2/0GUCzBZLUmRzjyCwFcBtV9Iw==
X-Received: by 2002:a05:6512:34c1:b0:4b1:5a96:983f with SMTP id w1-20020a05651234c100b004b15a96983fmr4862734lfr.535.1668439909326;
        Mon, 14 Nov 2022 07:31:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h8-20020ac24da8000000b004ad5f5c2b28sm1850242lfe.119.2022.11.14.07.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 07:31:49 -0800 (PST)
Message-ID: <fc6dcc79-0ccb-da40-85f9-826380991a96@linaro.org>
Date:   Mon, 14 Nov 2022 18:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 08/14] phy: qcom-qmp-combo: drop redundant clock
 allocation
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111092457.10546-1-johan+linaro@kernel.org>
 <20221111092457.10546-9-johan+linaro@kernel.org>
 <75e188ce-99ea-7511-a561-5b0fef9feeaf@linaro.org>
 <Y3I3vec+9Ob1dPhW@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y3I3vec+9Ob1dPhW@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/11/2022 15:42, Johan Hovold wrote:
> On Sat, Nov 12, 2022 at 02:17:44PM +0300, Dmitry Baryshkov wrote:
>> On 11/11/2022 12:24, Johan Hovold wrote:
>>> Since the QMP driver split, there is no reason to allocate the
>>> fixed-rate pipe clock structure separately from the driver data.
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> ---
>>>    drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 ++-----
>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Note: it would be nice to port these two patches to USB & PCIe QMP PHY
>> drivers.
> 
> Already done:
> 
> 	https://lore.kernel.org/lkml/20221111094239.11547-1-johan+linaro@kernel.org/

Thanks!

-- 
With best wishes
Dmitry

