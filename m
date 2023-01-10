Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD64665022
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 00:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjAJX64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 18:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbjAJX6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 18:58:55 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1FEDE2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 15:58:53 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so11365018wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 15:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKXPGoAIuzXo646DraHzR8EvZYxmmNg33tXtmMV4roY=;
        b=XrbdSBFcavLgRfuhWevFUq0/gpN9e1x45pdELe+4WH+os00ZTrF3yOFWtgWagIkPvW
         9Sg5Qq6ikQ8K/N3jvbBrQUt/FWytNHSkswBMWSPJcvyexISdZapinVZxlVmpGMQoFuiJ
         kkcn7gDn8UZ3RhKG3+WUxodJBveGp5v7yQovKRszznMhVaCpDfyn6j+aPxRvTFhlT+CH
         qwD+B4SCAwWbKktGfAeKBMsS3gPvYL96hh+jNrHtNR0LPk5L+PQHce+Zxb4nwEvXSNxO
         te0LF0KSptfBuf+wUUxIHCnwlOyE+TZIUguxeB6k5ZHfkIG6JmdeQFVCSnWVXFBFS+pL
         dDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKXPGoAIuzXo646DraHzR8EvZYxmmNg33tXtmMV4roY=;
        b=dnWHWopZZMAwtmoe4Shv+whbhQ125KMHJIIWfkwm68oOCx3FTEGB8ny00OLuQGjW4z
         CIdR9uKeyJTg+jxXYcQHAUmh6VpwJTsd4bCMzvcVHy93udo/OviIXhWgP9gxFdbc12qQ
         XvOL8K3fkmbofBESIkjH9Ty6ooUyHHqwZk7njEfJWpW8dvDIWIPyy9bUVb/t5wzbCgc0
         qkOg2H1+7qGxCLcIGp4bVel29L6uGc9Qf15WuzxMWXDpYhSTZa1S87Wr/xGbssJZ9k1O
         idQbjMEXzrz0mcmZIb36SFDQhIU8maMVH/DIN1Ft9bXqycVTMN4xU7V3xTQzANRt/56R
         6ufg==
X-Gm-Message-State: AFqh2kq979pSFkL7JgpE2EG3SrDjtW29DZrGWkQlUsagFYswENCEbuli
        24mHOQBj9BpNS1RERJydXnQa3w==
X-Google-Smtp-Source: AMrXdXvRrBMNJUmwB1EuC9zwh3AKFe0kafxlPk19cU9lvU9Q62WOXly811pndz/AJDpSmxhFJJFwxQ==
X-Received: by 2002:a05:600c:3b90:b0:3d1:f0f1:ceb4 with SMTP id n16-20020a05600c3b9000b003d1f0f1ceb4mr50554961wms.19.1673395132430;
        Tue, 10 Jan 2023 15:58:52 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b003d35acb0fd7sm22560051wmo.34.2023.01.10.15.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 15:58:52 -0800 (PST)
Message-ID: <7e13e50a-57e1-3899-78fb-efb882faef5b@linaro.org>
Date:   Tue, 10 Jan 2023 23:58:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 04/10] interconnect: qcom: rpm: Add support for
 specifying channel num
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230110132202.956619-1-konrad.dybcio@linaro.org>
 <20230110132202.956619-5-konrad.dybcio@linaro.org>
 <4a30931b-ef94-df2f-2e89-1028bf9510ce@linaro.org>
 <bdff84b5-0531-909e-43ed-5cc1eda64f17@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bdff84b5-0531-909e-43ed-5cc1eda64f17@linaro.org>
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

On 10/01/2023 23:55, Konrad Dybcio wrote:
> I use this field in the upcoming MSM8998 and SM6375 drivers,
> which both require some part of this series to be merged.

That's fine so.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
