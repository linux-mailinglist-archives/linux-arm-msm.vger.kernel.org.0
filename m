Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE6F5F21DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 10:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJBIJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 04:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiJBIJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 04:09:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EDE3A147
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 01:09:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id c2so6300261lfb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 01:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=usmCz8R75I6UFbbT/JKDoivCYpE2FSq4VUIUdBfl5xQ=;
        b=avOGaFj6XfRu/QcOlak86iGhrYmed2UqlSf6eEg9wl+AzVAB0vTYS0mBQwwQ8JN++/
         2j/YKtIkR5Q1gE1FZpoD43Egn1BD0S0Ytmuw3+0AybH4W7YXdIq4FKlIGYhSSeVFqmAC
         qFBwsI74Nv6Uie52S+TReVU04tfkAE6tvWI0GSYJ/QcZBl+MsrDuWh14O54+Q3cjPxdz
         5YpvabibJyy60Vs1lTr3NUZhZl7PbB8MvFelyjrgzgrY7FlORPK/pqoNVOCV0DrB6DCl
         mjZ7LHGgDq2z9bEbt+nuVmhxBBAkE3Y/53aEOgfuFxN8aueExuZ5T7a50lMiOWtmglfT
         yTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=usmCz8R75I6UFbbT/JKDoivCYpE2FSq4VUIUdBfl5xQ=;
        b=HUGri4bZHqyqX8FV8dkYT6gL1ZXS2IB6vFn3HfjYBSwvtDQ3JKR0OJmskgduTj8Ugc
         /dKGansb42FeNDjQloGNM8yDwo7PH+MXegiIqeG1LnzKTNapP8f7pVfqrpAR5YGIPye6
         XVIgHhH9jKAk7zbqRVO7MtsVf9AE+OKJCk7Slh5ADd1CRpndjYfi3lcl+MnTPk+NGX+P
         lgpoSuHnVXbE8YuF+i+D4R5yvY45ak81qgBzDUST5Kba8ZjAoN0FgGuLVslAY3X4qSfl
         QsZfCfCMyUQqAIsIpRRjPx0B+Jfq96ORw83ME3LoqzEdTwy5QFGZAj/V/ZEbpPV8hU0q
         MekA==
X-Gm-Message-State: ACrzQf3JdMNQ3bz+kBqGeWl7zLHVp6Sbvbqhi5B2osRm1od92HydsnBa
        1EAjsP9ZbPsyBC+hq6MCzc/IsQ==
X-Google-Smtp-Source: AMsMyM6yvnLN+cj5MAw4wAQROtb0/eUwiCb3pX35e6ANqP6DA67V9FVn2vXoRlJBeG1BDtzWHVqdQQ==
X-Received: by 2002:a19:6909:0:b0:498:f6d4:c5b8 with SMTP id e9-20020a196909000000b00498f6d4c5b8mr6143022lfc.647.1664698152590;
        Sun, 02 Oct 2022 01:09:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p2-20020a05651212c200b00497a0ea92desm1001409lfg.135.2022.10.02.01.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 01:09:12 -0700 (PDT)
Message-ID: <c165479c-746a-cde6-788b-7a23a68e82ee@linaro.org>
Date:   Sun, 2 Oct 2022 10:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 4/4] dmaengine: qcom: deprecate redundant of_device_id
 entries
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20221001211934.62511-1-mailingradian@gmail.com>
 <20221001211934.62511-5-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001211934.62511-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 23:19, Richard Acayan wrote:
> The drivers are transitioning from matching against lists of specific
> compatible strings to matching against smaller lists of more generic
> compatible strings. Add a message that the compatible strings with an
> ee_offset of 0 are deprecated except for the SDM845 compatible string.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

