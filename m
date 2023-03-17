Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27796BE8F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 13:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjCQMNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 08:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjCQMM7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 08:12:59 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919BC642B
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 05:12:53 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id k17so2176932iob.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679055172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5Vp2FQz3U7WFWsDAYjqG8dCQgOoYs/lPkS0Jc/IT4w=;
        b=Y5ML+SVSSgcvQd7eELE3PQH/ldXK7qV3KPnhogyfvcaP33wuONQz//Pn+43/l8s5zc
         UKNa/DTLf13Ilc8Zc+rslQovTwVLiaLceUp5GevdD1mYJKynLTXxX6EVURJe1g0mjL3p
         QDW8npCPPeUzzUM6nzF7mBju8Uy9lonkSVphC5kUoU4VwUJalCq1ABsknab0Tn3BNuiT
         gcOT+z+FqEkwllVngjNefBZmmMqNr6r4Qn+oB5OdviV0jg8PNpPkXkl6qSg7hDpQgH9x
         abHYFzinPrX59dn3km7o3lUeicG9qZ1wgYJehSVv2Fw1X7kv/2GTrmnbZz3NnE9C7SPY
         UC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679055172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Vp2FQz3U7WFWsDAYjqG8dCQgOoYs/lPkS0Jc/IT4w=;
        b=qEieGz2ianUX5DNkLc7TPmdIuTNUQiMYNtRIWzLjlRyrHLztLrSLauwn5XmcDRtaIL
         DygNqMIqWsqXiUchkpkOfhPkU7Jb64fhw4uwKoJ4K6B9KxJfrHV8ljN1jsahpL/KxP5o
         +gFZog90Q45JPYy9IAELAcvIMBPDkWEX9xHI4gJGJfhsATuCmDoInOWLkMLh9UVB9FpJ
         LwSsl4Xc2WgVyQPjTMKD7aI3b/YVhKSO7CYD64wKmFkGV9auC6F8762z/BZe7cKXsKvC
         UnFi+5T+OGDYuLUH4yd6HaPu8Y6s2WMgNDrA+CCZJ9exxuGUuKiIDfr+fTC/LzPZ40yn
         /o5A==
X-Gm-Message-State: AO0yUKViXhIvZPWUsTk9EoAgYo0nJCnOdMETyCk+yIqTMwP63DAKec53
        xp9uyR55BGlojr/1o2aabe71pw==
X-Google-Smtp-Source: AK7set/teWbNAyM8vn7O11kjIlscOMkZFWggClL+Q8IlWUkkzmd+PZU/1yj9Hy6iAhKO8EYtkeDTCw==
X-Received: by 2002:a6b:d102:0:b0:74c:91c3:3837 with SMTP id l2-20020a6bd102000000b0074c91c33837mr1362477iob.18.1679055172627;
        Fri, 17 Mar 2023 05:12:52 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id j195-20020a0263cc000000b00406328003a5sm640137jac.86.2023.03.17.05.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:12:52 -0700 (PDT)
Message-ID: <b657a2a7-ddf4-d42f-02a9-16f297e9ef07@linaro.org>
Date:   Fri, 17 Mar 2023 07:12:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] dt-bindings: net: qcom,ipa: add SDX65 compatible
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, davem@davemloft.net,
        edumazet@google.com, pabeni@redhat.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Simon Horman <simon.horman@corigine.com>
References: <20230315194305.1647311-1-elder@linaro.org>
 <20230316171010.7c51c93c@kernel.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20230316171010.7c51c93c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/16/23 7:10 PM, Jakub Kicinski wrote:
> On Wed, 15 Mar 2023 14:43:05 -0500 Alex Elder wrote:
>> Add support for SDX65, which uses IPA v5.0.
>>
>> Reviewed-by: Simon Horman <simon.horman@corigine.com>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>> v2: Add review tag; base on linux-next/master; drop "net-next" in subject
>>
>> It is my intention to have this patch be taken via the Qualcomm
>> repository (not net-next).
> 
> That's a bit unusual, no strong feelings but why is that?
> Bindings usually go with the code, ipa is a networking thing, right?

I'm sorry, yes, there is no reason the bindings update
should be taken through the Qualcomm tree.

This is a trivial patch.  This version (2) is based on
linux-next/master but it can be cleanly cherry-picked
onto net-next/master.

Please accept this patch via net-next, and if you want
me to send an updated version, please say so.

I'm very sorry for the confusion here.  For some reason
this has been a rough week with little patches for me.

					-Alex
