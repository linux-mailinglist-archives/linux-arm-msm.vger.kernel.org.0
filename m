Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B328A60AE80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbiJXPF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiJXPFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:05:05 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE2E564F1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:41:59 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id r14so31394528edc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mKsfIWpa7V9k46Arai0KI6Ar9k3GJZZKenWY2uV0rU=;
        b=ywvMqT+z+qb9B9IOh9FO4Rw7gnnbwZSApPutG7lpctxAL21queUrkzYeLZMeloFSbl
         x9K6DXvCSWwG5lU0epxgjqFuxhgMeSengsuV6d2ZycOPLYNh0dncq5S+MZMG2Fql+Z4k
         qEcdJojzp98vOr12LtDmQ5+cffJNfr7Um1/EhAT4wttCCc0XT/Xhr5x38xAQUvI0DCxs
         hW6XWRLOOVNGql9EuG43BKD6ioeYzglQemNd1zoJb6YdYeWSDe9Jq+9FsBigPvh9hpuf
         MMjOCRzfG7gYxAxAj6hb49pVwp/pJTEVl8sCqKMYxVnf3zagnVChCsiZ4qxC5u//c1nl
         B3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mKsfIWpa7V9k46Arai0KI6Ar9k3GJZZKenWY2uV0rU=;
        b=yjpWchIK/J+sfnDAg+gYvKUM4NKevXbsLfxHNlOrDnDGv/kOVvynWbHYkNeTiUg0m5
         F6Jxc5VjyACnQqHSBdwIttUVRkoIZ1g9isegNJNXg4Kca3oMLeCuj03cI+R7GWAeHzUP
         LZ9J4bRCOp45kY/V9zZCb3fiW0832f+UYvrvoqDoEwIXS/Ibos+nR+2uK1HkVs1oIU9s
         v8WMFgjwlVg2cagdNBmKV6jMM2D02bGsXO1c2ZsEZyl9sk6AQ/4N0lROeB0nKKVuD/WC
         eMPOkHG+NqM1N05z0z/aR0AbWZq4+i5fXeQ+GQFUlvghAYKge/chHLAMz7Z21z8jWwcW
         xcbA==
X-Gm-Message-State: ACrzQf1QHtVgjLwf30ZF8v8XykM5C3XZT7WPVrr15QbY1p5w0XsAyqgw
        y+qcooeeY8T6aIOE22nIWxw85CvzuO7iBJR0
X-Google-Smtp-Source: AMsMyM7WUs6aeUNCICLhdJhwB77WGIRqZ7ubxT1Qp1R7WDdA/kFHuprTdIx1QPeWe6A8jDWVL7bYxg==
X-Received: by 2002:a2e:8697:0:b0:26f:b795:8b39 with SMTP id l23-20020a2e8697000000b0026fb7958b39mr12457697lji.218.1666618322142;
        Mon, 24 Oct 2022 06:32:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c24-20020ac244b8000000b004947f8b6266sm4411058lfm.203.2022.10.24.06.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:32:01 -0700 (PDT)
Message-ID: <d8ffbfeb-be30-e221-6185-974569f72515@linaro.org>
Date:   Mon, 24 Oct 2022 16:32:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 09/10] phy: qcom-qmp-ufs: restructure PHY creation
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024090041.19574-1-johan+linaro@kernel.org>
 <20221024090041.19574-10-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024090041.19574-10-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 12:00, Johan Hovold wrote:
> In preparation for supporting devicetree bindings which do not use a
> child node, move the PHY creation to probe() proper and parse the serdes
> resource in what is now the legacy devicetree helper.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 34 ++++++++++++-------------
>   1 file changed, 16 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

