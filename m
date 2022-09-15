Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474E05B9DBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 16:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiIOOwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 10:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiIOOwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 10:52:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0606BD64
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 07:52:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a8so30710916lff.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MGF6Hdj1kAaXiRS0wW3SjCRTt2IYAVcbko6YhwAB5Qo=;
        b=yCYk4vNdr4C7RcK23GqAdk23sl1W1M6nzJ6UyseDQohU4rFxHRMWsaYzZUQ+rCGSMy
         c1a5rz6hVTbAkvWNoKrbMZEPmPDBXH11JUs8Ctc/iGOTIyjr7zmD7BXw3IJyeUNCsjOn
         OB+lMz9q0uXB1Y7ZzTzdG1qo+C3yyYSfFpbZTt4x28o3QDOrCn9mguaqnjqYfTVF6bK1
         s0EYz6bGlVBroTtBxMUIvfojXIXdsJvYjdWwPj+xzK3EYTkrRrhAs/c2C9T4m2uwhXu1
         /TZXbduLThrlxenxoeJP3jems/lOWXNvEAfwPQUYz/lgWmnkr2DrMigEoNaU3llrlIkC
         La1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MGF6Hdj1kAaXiRS0wW3SjCRTt2IYAVcbko6YhwAB5Qo=;
        b=dpz4na/YKKHNjYSske4Cc7sLSVtr+JFJKssUpmbJ5yq0Qhj29m9BYRehwclbNbxSYj
         lXEVeVTY8OzLx4+32SuxWiwmA7hIh5gPvPCFsKGEFsEazhS4J739cFGgNqXmWQHXp92+
         fLLblEe9SlCiPBwI1XOgsDj0vQ7LvOxCeJxxSTy/9FN3N04jDzVeKPF0IXuoPA1jDnwR
         S8KV2FEBVW0ofBU8Vmj8zxRUqqyLesvzJiomODxz6Q4jeitYCizmDk0IjLxRSTzXC72e
         tWQtDkaGx9Dud5IGcwqFqbE5nGKZZFAUc6iBtPgo47FXoPOdYXy7F4hKb1AM9OifiUV9
         KGtA==
X-Gm-Message-State: ACrzQf3NpF7mFofwcdDZE5AYPLuRs/3t9NHXf5/37XlAxHf58VXm6Qj4
        t8/EUyLDTG+PYEIxTBQkL6JDTA==
X-Google-Smtp-Source: AMsMyM4cRt2dHuWVj44Cc+swIEBBJ8MIf5gkhzKpuNJRcpuXbfDMvrLjiInXFw4elSjYO91zE/DVIQ==
X-Received: by 2002:a05:6512:b28:b0:49d:ca3d:5935 with SMTP id w40-20020a0565120b2800b0049dca3d5935mr98480lfu.608.1663253567721;
        Thu, 15 Sep 2022 07:52:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512214d00b0049311968ca4sm2999809lfr.261.2022.09.15.07.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:52:47 -0700 (PDT)
Message-ID: <a59b7a9e-95ec-9e44-01af-6a35f2e300f8@linaro.org>
Date:   Thu, 15 Sep 2022 17:52:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] mfd: qcom-spmi-pmic: Add more PMIC SUBTYPE IDs
Content-Language: en-GB
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <20220915113523.44074-2-luca.weiss@fairphone.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220915113523.44074-2-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2022 14:35, Luca Weiss wrote:
> Add more IDs that are found in the downstream msm-4.19 kernel under the
> path include/linux/qpnp/qpnp-revid.h.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes since v2:
> * Convert hex numbers lowercase
> * Remove SMB* IDs added in v1, given it's not sure they're actually spmi
>    pmics or just i2c pmics (keep SMB2351 because it supports spmi)
> 
>   include/soc/qcom/qcom-spmi-pmic.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

